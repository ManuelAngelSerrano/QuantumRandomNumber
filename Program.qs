namespace Qrng {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    
    operation Lanzar_moneda() : Result {
        using (q = Qubit())  {  // Allocate a qubit.
            H(q);               // Put the qubit to superposition. It now has a 50% chance of being 0 or 1.
            return MResetZ(q);  // Measure the qubit value.
        }
    }
    
    @EntryPoint()
    operation Comprobar_Aleatoriedad() : Int {
        let max = 1000;
        mutable n0 = 0;
        mutable n1 = 0; 
        for (i in 1..max) {
            if (Lanzar_moneda() == Zero) {
                set n0 +=  1;
            } else {
                set n1 += 1;
            }
        }
        Message($"Tras ejecutar {max} experimentos, se obtienen {n0} ceros y {n1} unos");
        return 0;
    }
}
