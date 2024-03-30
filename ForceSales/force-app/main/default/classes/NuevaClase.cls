public with sharing class NuevaClase {
        public static void saludar() {
            System.debug('Ejemplo 1 de debug');
            List<Account> accountList = [SELECT Id, Name FROM Account];
        }
}
