import tablero.*
object visual{

method dibujar() {
const a = tablero.casilleros().map({c => c.pieza()}).map({p=>p.print()})
const string =   "7 " + a.subList(56,63).join("") + "\n"  
             + "6 " + a.subList(48,55).join("") + "\n" 
             + "5 " + a.subList(40,47).join("") + "\n" 
             + "4 " + a.subList(32,39).join("") + "\n"
             + "3 " + a.subList(24,31).join("") + "\n" 
             + "2 " + a.subList(16,23).join("") + "\n"
             + "1 " + a.subList(8,15).join("")  + "\n"
             + "0 " + a.subList(0,7).join("")   + "\n"
             + "  0 1 2 3 4 5 6 7 "             + "\n"
console.println(string)
}
}