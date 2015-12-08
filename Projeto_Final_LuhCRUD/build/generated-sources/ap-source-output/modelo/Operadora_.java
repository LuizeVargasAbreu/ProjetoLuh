package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Telefone;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2015-12-08T17:22:08")
@StaticMetamodel(Operadora.class)
public class Operadora_ { 

    public static volatile ListAttribute<Operadora, Telefone> telefoneList;
    public static volatile SingularAttribute<Operadora, String> nome;
    public static volatile SingularAttribute<Operadora, Long> oCodigo;

}