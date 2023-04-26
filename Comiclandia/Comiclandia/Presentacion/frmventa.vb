

Public Class frmventa


    Private dt As New DataTable
    Private Sub frmventa_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        mostrar()
    End Sub

    Public Sub limpiar()
        btnguardar.Visible = True
        btneditar.Visible = False
        txtidventa.Text = ""
        txtnombre_cliente.Text = ""
        txtnum_documento.Text = ""
        txtidventa.Text = ""
        txtidcliente.Text = ""




    End Sub

    Private Sub mostrar()
        Try
            Dim func As New fventa
            dt = func.consultar
            datalistado.Columns.Item("Eliminar").Visible = False

            If dt.Rows.Count <> 0 Then
                datalistado.DataSource = dt
                txtbuscar.Enabled = True
                datalistado.ColumnHeadersVisible = True
                noexiste.Visible = False
            Else
                datalistado.DataSource = Nothing
                txtbuscar.Enabled = False
                datalistado.ColumnHeadersVisible = False
                noexiste.Visible = True

            End If

        Catch ex As Exception
            MsgBox(ex.Message)

        End Try

        btnnuevo.Visible = True
        btneditar.Visible = False

        buscar()


    End Sub

    Private Sub buscar()
        Try
            Dim ds As New DataSet
            ds.Tables.Add(dt.Copy)
            Dim dv As New DataView(ds.Tables(0))

            dv.RowFilter = cbocampo.Text & " Like '" & txtbuscar.Text & "%'"

            If dv.Count <> 0 Then
                noexiste.Visible = False
                datalistado.DataSource = dv
                ocultar_columnas()
            Else
                noexiste.Visible = True
                datalistado.DataSource = Nothing


            End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub ocultar_columnas()
        datalistado.Columns(1).Visible = False
        datalistado.Columns(2).Visible = False
    End Sub







    Private Sub btnnuevo_Click(sender As Object, e As EventArgs) Handles btnnuevo.Click
        limpiar()
        mostrar()

    End Sub

    Private Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click
        If Me.ValidateChildren = True And txtidcliente.Text <> "" And txtnombre_cliente.Text <> "" And txtnum_documento.Text <> "" Then
            Try
                Dim dts As New vventa
                Dim func As New fventa

                dts.gidcliente = txtidcliente.Text
                dts.gfecha_venta = txtfecha.Text
                dts.gtipo_documento = cbtipo_documento.Text
                dts.gnum_documento = txtnum_documento.Text


                If func.insertar(dts) Then
                    MessageBox.Show("Venta insertada, ahora añadir productos", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    mostrar()
                    limpiar()
                    cargar_detalle()
                Else
                    MessageBox.Show("Venta no insertado validar data", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    mostrar()
                    limpiar()

                End If

            Catch ex As Exception
                MsgBox(ex.Message)

            End Try
        Else

            MessageBox.Show("Campos vacios", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)

        End If



    End Sub



    Private Sub datalistado_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles datalistado.CellClick
        txtidventa.Text = datalistado.SelectedCells.Item(1).Value
        txtidcliente.Text = datalistado.SelectedCells.Item(2).Value
        txtnombre_cliente.Text = datalistado.SelectedCells.Item(3).Value
        txtfecha.Text = datalistado.SelectedCells.Item(5).Value
        cbtipo_documento.Text = datalistado.SelectedCells.Item(6).Value
        txtnum_documento.Text = datalistado.SelectedCells.Item(6).Value
        btneditar.Visible = True
        btnguardar.Visible = False

    End Sub

    Private Sub btneditar_Click(sender As Object, e As EventArgs) Handles btneditar.Click


        If Me.ValidateChildren = True And txtidcliente.Text <> "" And txtnum_documento.Text <> "" And txtnum_documento.Text <> "" And txtidventa.Text <> "" And txtidcliente.Text <> "" Then
            Try
                Dim dts As New vventa
                Dim func As New fventa

                dts.gidventa = txtidventa.Text
                dts.gidcliente = txtidcliente.Text
                dts.gfecha_venta = txtfecha.Text
                dts.gtipo_documento = cbtipo_documento.Text
                dts.gnum_documento = txtnum_documento.Text

                If func.editar(dts) Then
                    MessageBox.Show("Venta modificada", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    mostrar()
                    limpiar()
                Else
                    MessageBox.Show("Venta no modificada validar data", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    mostrar()
                    limpiar()

                End If

            Catch ex As Exception
                MsgBox(ex.Message)

            End Try
        Else

            MessageBox.Show("Campos vacios", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)

        End If

    End Sub

    Private Sub cbeliminar_CheckedChanged(sender As Object, e As EventArgs) Handles cbeliminar.CheckedChanged
        If cbeliminar.CheckState = CheckState.Checked Then
            datalistado.Columns.Item("Eliminar").Visible = True

        Else
            datalistado.Columns.Item("Eliminar").Visible = False
        End If
    End Sub

    Private Sub datalistado_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles datalistado.CellContentClick
        If e.ColumnIndex = Me.datalistado.Columns.Item("Eliminar").Index Then
            Dim chkcell As DataGridViewCheckBoxCell = Me.datalistado.Rows(e.RowIndex).Cells("Eliminar")
            chkcell.Value = Not chkcell.Value
        End If
    End Sub



    Private Sub txtbuscar_TextChanged(sender As Object, e As EventArgs) Handles txtbuscar.TextChanged
        buscar()
    End Sub


    Private Sub cargar_detalle()
        frmdetalle_venta.txtidventa.Text = datalistado.SelectedCells.Item(1).Value
        frmdetalle_venta.txtidcliente.Text = datalistado.SelectedCells.Item(2).Value
        frmdetalle_venta.txtnombre_cliente.Text = datalistado.SelectedCells.Item(3).Value
        frmdetalle_venta.txtfecha.Text = datalistado.SelectedCells.Item(5).Value
        frmdetalle_venta.cbtipo_documento.Text = datalistado.SelectedCells.Item(6).Value
        frmdetalle_venta.txtnum_documento.Text = datalistado.SelectedCells.Item(7).Value

        frmdetalle_venta.ShowDialog()
    End Sub

    Private Sub datalistado_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles datalistado.CellDoubleClick

    End Sub

    Private Sub btnbuscar_cliente_Click(sender As Object, e As EventArgs) Handles btnbuscar_cliente.Click
        frmcliente.txtflag.Text = "1"
        frmcliente.ShowDialog()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        buscar()
    End Sub

    Private Sub btneliminar_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btneliminar_Click_1(sender As Object, e As EventArgs) Handles btneliminar.Click
        Dim result As DialogResult
        result = MessageBox.Show("Desea eliminar estos registros", "Eliminar", MessageBoxButtons.OKCancel, MessageBoxIcon.Question)

        If result = DialogResult.OK Then
            Try
                For Each row As DataGridViewRow In datalistado.Rows
                    Dim marcado As Boolean = Convert.ToBoolean(row.Cells("Eliminar").Value)
                    If marcado Then

                        Dim onekey As Integer = Convert.ToInt32(row.Cells("idventa").Value)
                        Dim vdb As New vventa

                        Dim func As New fventa

                        vdb.gidventa = onekey

                        If func.eliminar(vdb) Then
                        Else
                            result = MessageBox.Show("Venta no eliminada", "Eliminar", MessageBoxButtons.OK, MessageBoxIcon.Error)

                        End If
                    End If
                Next
                Call mostrar()

            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        Else
            result = MessageBox.Show("Cancelado", "Eliminar", MessageBoxButtons.OKCancel, MessageBoxIcon.Information)
            Call mostrar()

        End If
        Call limpiar()
    End Sub

    Private Sub btncancelar_Click(sender As Object, e As EventArgs) Handles btncancelar.Click
        Me.Close()

    End Sub
End Class