Public Class frmcategoria

    Private dt As New DataTable
    Private Sub frmcategoria_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        mostrar()

    End Sub


    Public Sub limpiar()
        btnguardar.Visible = True
        btneditar.Visible = False
        txtidcategoria.Text = ""
        txtcategoria.Text = ""

    End Sub

    Private Sub mostrar()
        Try
            Dim func As New fcategoria
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



    Private Sub txtnombre_Validated(sender As Object, e As EventArgs) Handles txtcategoria.Validated
        If DirectCast(sender, TextBox).Text.Length > 0 Then
            Me.erroricono.SetError(sender, "")
        Else
            Me.erroricono.SetError(sender, "Ingresar nombre categoria")
        End If
    End Sub






    Private Sub btnnuevo_Click(sender As Object, e As EventArgs) Handles btnnuevo.Click
        limpiar()
        mostrar()

    End Sub

    Private Sub btnguardar_Click(sender As Object, e As EventArgs) Handles btnguardar.Click
        If Me.ValidateChildren = True And txtcategoria.Text <> "" Then
            Try
                Dim dts As New vcategoria
                Dim func As New fcategoria

                dts.gnombre_categoria = txtcategoria.Text


                If func.insertar(dts) Then
                    MessageBox.Show("Categoria insertada", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    mostrar()
                    limpiar()
                Else
                    MessageBox.Show("Categoria no insertada validar data", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Error)
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
        txtidcategoria.Text = datalistado.SelectedCells.Item(1).Value
        txtcategoria.Text = datalistado.SelectedCells.Item(2).Value
        btneditar.Visible = True
        btnguardar.Visible = False

    End Sub

    Private Sub btneditar_Click(sender As Object, e As EventArgs) Handles btneditar.Click


        If Me.ValidateChildren = True And txtcategoria.Text <> "" And txtidcategoria.Text <> "" Then
            Try
                Dim dts As New vcategoria

                Dim func As New fcategoria

                dts.gidcategoria = txtidcategoria.Text
                dts.gnombre_categoria = txtcategoria.Text
              
                If func.editar(dts) Then
                    MessageBox.Show("Categoria modificado", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    mostrar()
                    limpiar()
                Else
                    MessageBox.Show("Categoria no modificado validar data", "Registro ", MessageBoxButtons.OK, MessageBoxIcon.Error)
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

                        Dim onekey As Integer = Convert.ToInt32(row.Cells("idcategoria").Value)
                        Dim vdb As New vcategoria
                        Dim func As New fcategoria
                        vdb.gidcategoria = onekey

                        If func.eliminar(vdb) Then
                        Else
                            result = MessageBox.Show("CAategoria no eliminada", "Eliminar", MessageBoxButtons.OK, MessageBoxIcon.Error)

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
            frmproducto.txtidcategoria.Text = datalistado.SelectedCells.Item(1).Value
            frmproducto.txtnom_categoria.Text = datalistado.SelectedCells.Item(2).Value
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