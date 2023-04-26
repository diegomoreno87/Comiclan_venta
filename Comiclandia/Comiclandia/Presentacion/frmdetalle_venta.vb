Public Class frmdetalle_venta


    Private dt As New DataTable
    Private Sub frmdetalle_venta_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        mostrar()
    End Sub


    Public Sub limpiar()
        btnguardar.Visible = True
        txtidproducto.Text = ""
        txtnombre_producto.Text = ""
        txtprecio_unitario.Text = ""
        txtcantidad.Text = 0
        txtstock.Text = 1


    End Sub

    Private Sub mostrar()
        Try
            Dim func As New fdetalle_venta
            dt = func.consultar
            datalistado.Columns.Item("Eliminar").Visible = False

            If dt.Rows.Count <> 0 Then
                datalistado.DataSource = dt

                datalistado.ColumnHeadersVisible = True
                noexiste.Visible = False
            Else
                datalistado.DataSource = Nothing

                datalistado.ColumnHeadersVisible = False
                noexiste.Visible = True

            End If

        Catch ex As Exception
            MsgBox(ex.Message)

        End Try

        btnnuevo.Visible = True


        buscar()


    End Sub

    Private Sub buscar()
        Try
            Dim ds As New DataSet
            ds.Tables.Add(dt.Copy)
            Dim dv As New DataView(ds.Tables(0))

            dv.RowFilter = "idventa='" & txtidventa.Text & "'"
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
        datalistado.Columns(3).Visible = False
    End Sub




    Private Sub btnnuevo_Click(sender As Object, e As EventArgs) Handles btnnuevo.Click
        limpiar()
        mostrar()

    End Sub

    Private Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click
        If Me.ValidateChildren = True And txtidproducto.Text <> "" And txtcantidad.Text <> "" And txtprecio_unitario.Text <> "" Then
            Try
                Dim dts As New vdetalle_venta
                Dim func As New fdetalle_venta

                dts.gidventa = txtidventa.Text
                dts.gidproducto = txtidproducto.Text
                dts.gcantidad = txtcantidad.Text
                dts.gprecio_unitario = txtprecio_unitario.Text


                If func.insertar(dts) Then
                    If func.disminuir_stock(dts) Then

                    End If
                    MessageBox.Show("Producto ingresado correctamente", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    mostrar()
                        limpiar()

                Else
                    MessageBox.Show("Producto no agregado", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Error)
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



    Private Sub txtbuscar_TextChanged(sender As Object, e As EventArgs)
        buscar()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim result As DialogResult
        result = MessageBox.Show("Desea eliminar estos articulos", "Eliminar", MessageBoxButtons.OKCancel, MessageBoxIcon.Question)

        If result = DialogResult.OK Then
            Try
                For Each row As DataGridViewRow In datalistado.Rows
                    Dim marcado As Boolean = Convert.ToBoolean(row.Cells("Eliminar").Value)
                    If marcado Then

                        Dim onekey As Integer = Convert.ToInt32(row.Cells("iddetalle_venta").Value)
                        Dim vdb As New vdetalle_venta
                        Dim func As New fdetalle_venta
                        vdb.giddetalle_venta = onekey

                        vdb.gidproducto = datalistado.SelectedCells.Item(3).Value
                        vdb.gidventa = datalistado.SelectedCells.Item(2).Value
                        vdb.gcantidad = datalistado.SelectedCells.Item(5).Value


                        If func.eliminar(vdb) Then
                            If func.aumentar_stock(vdb) Then

                            End If
                        Else
                            result = MessageBox.Show("Articulo  eliminado", "Eliminar", MessageBoxButtons.OK, MessageBoxIcon.Error)

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

    Private Sub btnbuscar_producto_Click(sender As Object, e As EventArgs) Handles btnbuscar_producto.Click
        frmproducto.txtflag.Text = "1"
        frmproducto.ShowDialog()
    End Sub

    Private Sub txtcantidad_ValueChanged(sender As Object, e As EventArgs) Handles txtcantidad.ValueChanged
        Dim cant As Double
        cant = txtcantidad.Value

        If txtcantidad.Value > txtstock.Value Then
            MessageBox.Show("la cantidad supera el stock", "Error venta producto", MessageBoxButtons.OK)
            btnguardar.Visible = 0
            txtcantidad.Value = txtstock.Value

        Else
            btnguardar.Visible = 1
        End If

        If txtcantidad.Value = 0 Then
            btnguardar.Visible = 0
        Else
            btnguardar.Visible = 1
        End If
    End Sub

    Private Sub btncancelar_Click(sender As Object, e As EventArgs) Handles btncancelar.Click
        Me.Close()

    End Sub
End Class