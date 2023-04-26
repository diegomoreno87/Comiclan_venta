Imports System.ComponentModel

Public Class frmcliente

    Private dt As New DataTable


    Private Sub frmcliente_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        mostrar()
    End Sub

    Public Sub limpiar()
        btnguardar.Visible = True
        btneditar.Visible = False
        txtidcliente.Text = ""
        txtnombre.Text = ""
        txtxapellidos.Text = ""
        txtdireccion.Text = ""
        txttelefono.Text = ""
        txtnumdocumento.Text = ""




    End Sub

    Private Sub mostrar()
        Try
            Dim func As New fcliente
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
    End Sub



    Private Sub txtnumdocumento_Validating(sender As Object, e As CancelEventArgs) Handles txtnumdocumento.Validating
        If DirectCast(sender, TextBox).Text.Length > 0 Then
            Me.erroricono.SetError(sender, "")
        Else
            Me.erroricono.SetError(sender, "Ingresar numero del documento del cliente")
        End If
    End Sub

    Private Sub txtnombre_Validated(sender As Object, e As EventArgs) Handles txtnombre.Validated
        If DirectCast(sender, TextBox).Text.Length > 0 Then
            Me.erroricono.SetError(sender, "")
        Else
            Me.erroricono.SetError(sender, "Ingresar nombre cliente")
        End If
    End Sub



    Private Sub txtxapellidos_Validating(sender As Object, e As CancelEventArgs) Handles txtxapellidos.Validating
        If DirectCast(sender, TextBox).Text.Length > 0 Then
            Me.erroricono.SetError(sender, "")
        Else
            Me.erroricono.SetError(sender, "Ingresar apellidos cliente")
        End If
    End Sub


    Private Sub txtdireccion_Validating(sender As Object, e As CancelEventArgs) Handles txtdireccion.Validating
        If DirectCast(sender, TextBox).Text.Length > 0 Then
            Me.erroricono.SetError(sender, "")
        Else
            Me.erroricono.SetError(sender, "Ingresar direccion cliente")
        End If
    End Sub



    Private Sub txttelefono_Validating(sender As Object, e As CancelEventArgs) Handles txttelefono.Validating
        If DirectCast(sender, TextBox).Text.Length > 0 Then
            Me.erroricono.SetError(sender, "")
        Else
            Me.erroricono.SetError(sender, "Ingresar telefono cliente")
        End If
    End Sub

    Private Sub btnnuevo_Click(sender As Object, e As EventArgs) Handles btnnuevo.Click
        limpiar()
        mostrar()

    End Sub

    Private Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click
        If Me.ValidateChildren = True And txtnombre.Text <> "" And txtxapellidos.Text <> "" And txtdireccion.Text <> "" And txttelefono.Text <> "" And txtnumdocumento.Text <> "" Then
            Try
                Dim dts As New vcliente
                Dim func As New fcliente

                dts.gnombre = txtnombre.Text
                dts.gapellidos = txtxapellidos.Text
                dts.gdireccion = txtdireccion.Text
                dts.gtelefono = txttelefono.Text
                dts.gnumdocumento = txtnumdocumento.Text

                If func.insertar(dts) Then
                    MessageBox.Show("Cliente insertado", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    mostrar()
                    limpiar()
                Else
                    MessageBox.Show("Cliente no insertado validar data", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Error)
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
        txtidcliente.Text = datalistado.SelectedCells.Item(1).Value
        txtnombre.Text = datalistado.SelectedCells.Item(2).Value
        txtxapellidos.Text = datalistado.SelectedCells.Item(3).Value
        txtdireccion.Text = datalistado.SelectedCells.Item(4).Value
        txttelefono.Text = datalistado.SelectedCells.Item(5).Value
        txtnumdocumento.Text = datalistado.SelectedCells.Item(6).Value
        btneditar.Visible = True
        btnguardar.Visible = False

    End Sub

    Private Sub btneditar_Click(sender As Object, e As EventArgs) Handles btneditar.Click


        If Me.ValidateChildren = True And txtnombre.Text <> "" And txtxapellidos.Text <> "" And txtdireccion.Text <> "" And txttelefono.Text <> "" And txtnumdocumento.Text <> "" Then
            Try
                Dim dts As New vcliente
                Dim func As New fcliente

                dts.gidcliente = txtidcliente.Text
                dts.gnombre = txtnombre.Text
                dts.gapellidos = txtxapellidos.Text
                dts.gdireccion = txtdireccion.Text
                dts.gtelefono = txttelefono.Text
                dts.gnumdocumento = txtnumdocumento.Text

                If func.editar(dts) Then
                    MessageBox.Show("Cliente modificado", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    mostrar()
                    limpiar()
                Else
                    MessageBox.Show("Cliente no modificado validar data", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Error)
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

    Private Sub btneliminar_Click(sender As Object, e As EventArgs) Handles btneliminar.Click
        Dim result As DialogResult
        result = MessageBox.Show("Desea eliminar estos registros", "Eliminar", MessageBoxButtons.OKCancel, MessageBoxIcon.Question)

        If result = DialogResult.OK Then
            Try
                For Each row As DataGridViewRow In datalistado.Rows
                    Dim marcado As Boolean = Convert.ToBoolean(row.Cells("Eliminar").Value)
                    If marcado Then

                        Dim onekey As Integer = Convert.ToInt32(row.Cells("idcliente").Value)
                        Dim vdb As New vcliente
                        Dim func As New fcliente
                        vdb.gidcliente = onekey

                        If func.eliminar(vdb) Then
                        Else
                            result = MessageBox.Show("Cliente no eliminado", "Eliminar", MessageBoxButtons.OK, MessageBoxIcon.Error)

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

    Private Sub datalistado_CellDoubleClick(sender As Object, e As DataGridViewCellEventArgs) Handles datalistado.CellDoubleClick
        If txtflag.Text = "1" Then
            frmventa.txtidcliente.Text = datalistado.SelectedCells.Item(1).Value
            frmventa.txtnombre_cliente.Text = datalistado.SelectedCells.Item(2).Value
            Me.Close()
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        buscar()
    End Sub

    Private Sub btncancelar_Click(sender As Object, e As EventArgs) Handles btncancelar.Click
        Me.Close()

    End Sub
End Class