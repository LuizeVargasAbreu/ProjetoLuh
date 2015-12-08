/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "operadora")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Operadora.findAll", query = "SELECT o FROM Operadora o"),
    @NamedQuery(name = "Operadora.findByOCodigo", query = "SELECT o FROM Operadora o WHERE o.oCodigo = :oCodigo"),
    @NamedQuery(name = "Operadora.findByNome", query = "SELECT o FROM Operadora o WHERE o.nome = :nome")})
    @NamedQuery(name = "Operadora.findByName", query = "SELECT o FROM Operadora o where o.nome like :nome")

public class Operadora implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "o_codigo")
    private Long oCodigo;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "oCodigo")
    private List<Telefone> telefoneList;

    public Operadora() {
    }

    public Operadora(Long oCodigo) {
        this.oCodigo = oCodigo;
    }

    public Operadora(Long oCodigo, String nome) {
        this.oCodigo = oCodigo;
        this.nome = nome;
    }

    public Long getOCodigo() {
        return oCodigo;
    }

    public void setOCodigo(Long oCodigo) {
        this.oCodigo = oCodigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @XmlTransient
    public List<Telefone> getTelefoneList() {
        return telefoneList;
    }

    public void setTelefoneList(List<Telefone> telefoneList) {
        this.telefoneList = telefoneList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (oCodigo != null ? oCodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Operadora)) {
            return false;
        }
        Operadora other = (Operadora) object;
        if ((this.oCodigo == null && other.oCodigo != null) || (this.oCodigo != null && !this.oCodigo.equals(other.oCodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + "\nCódigo: " + oCodigo ;
    }
    
}
