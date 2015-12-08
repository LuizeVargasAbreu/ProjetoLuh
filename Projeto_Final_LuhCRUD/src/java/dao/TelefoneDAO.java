package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Telefone;

public class TelefoneDAO {
    EntityManager em;
    
    public TelefoneDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
    }
    
    public void incluir(Telefone obj) throws Exception {
        try {
            em.getTransaction().begin();
            em.persist(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
            
        }
        
    }

    public List<Telefone> listar() throws Exception {
        return em.createNamedQuery("Telefone.findAll").getResultList();
    }
    
     public List<Telefone> listar(String nome) throws Exception {
         TypedQuery<Telefone> query = 
                 em.createNamedQuery("Telefone.findByName", Telefone.class);
         
         query.setParameter("nome", '%' + nome + '%');
         return query.getResultList();
    }
    
    public void alterar(Telefone obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.merge(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }
    
    public void excluir(Telefone obj) throws Exception {
        
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }
    
      public Telefone buscarPorChavePrimaria(Long chave)
    {
        return em.find(Telefone.class, chave);
    }

    public void fechaEmf() {
        Conexao.closeConexao();
    }
    

}
