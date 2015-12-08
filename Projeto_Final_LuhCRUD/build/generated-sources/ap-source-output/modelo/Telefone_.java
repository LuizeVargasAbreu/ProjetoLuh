package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Cliente;
import modelo.Operadora;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2015-12-08T17:22:08")
@StaticMetamodel(Telefone.class)
public class Telefone_ { 

    public static volatile SingularAttribute<Telefone, String> tipo;
    public static volatile SingularAttribute<Telefone, String> numero;
    public static volatile SingularAttribute<Telefone, Cliente> cCodigo;
    public static volatile SingularAttribute<Telefone, Operadora> oCodigo;
    public static volatile SingularAttribute<Telefone, Long> tCodigo;

}