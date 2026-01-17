class Faculdade
  attr_accessor :disciplinas, :cursos

  def initialize
    @disciplinas = []
    @cursos = []
  end

  def cria_curso(novoCurso)
    for curso in @cursos
        if curso.codigo_curso == novoCurso.codigo_curso
            return curso
        end
    end
    @cursos << novoCurso
    return novoCurso
  end

  def cria_disciplina(novaDisciplina)
    for disciplina in @disciplinas
        if disciplina.codigo_disciplina == novaDisciplina.codigo_disciplina
            return disciplina
        end
    end
    @disciplinas << novaDisciplina
    return novaDisciplina
  end
end