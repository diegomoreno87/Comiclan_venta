using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiRestWeb.Models
{
    public class Cliente
    {
        public int idcliente{ get; set; }
        public string  nombre { get; set; }
        public string apellidos { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string numdocumento { get; set; }
    }
}