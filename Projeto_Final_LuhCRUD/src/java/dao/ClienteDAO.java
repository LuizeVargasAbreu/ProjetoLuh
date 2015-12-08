package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Cliente;

public class ClienteDAO {
    EntityManager em;
    
    public ClienteDAO() throws Exception {
        EntityManagerFactory emf;
        emf = Conexao.getConexao();
        em = emf.createEntityManager();
        
    }
    
    public void incluir(Cliente obj) throws Exception {
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
    
    public List<Cliente> listar() throws Exception {
        return em.createNamedQuery("Cliente.findAll").getResultList();
       
    }
    
   public List<Cliente> listar(String nome) throws Exception {
         TypedQuery<Cliente> query = 
                 em.createNamedQuery("Cliente.findByName", Cliente.class);
         
         query.setParameter("nome", '%' + nome + '%');
         return query.getResultList();
    }
    
    public void alterar(Cliente obj) throws Exception {
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
    
    public void excluir(Cliente obj) throws Exception {
        
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
    
      public Cliente buscarPorChavePrimaria(Long chave)
    {
        return em.find(Cliente.class, chave);
    }
    
    public void fechaEmf() {
        
        Conexao.closeConexao();
        
    }
    
}
