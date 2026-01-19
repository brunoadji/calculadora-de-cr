class Faculdade
  attr_accessor :disciplinas, :cursos

  def initialize
    @disciplinas = []
    @cursos = []
  end

  def imprime_cr()
    for curso in @cursos
        carga_horaria_curso, total_nota_curso = curso.calcula_hora_e_notas
        crCurso = carga_horaria_curso == 0 ? 0 : total_nota_curso / carga_horaria_curso
        puts "- Curso: #{curso.codigo_curso} - CR: #{crCurso.round(2)}"
        for aluno in curso.alunos
            carga_horaria, totalNota = aluno.calcula_hora_e_notas
            crAluno = carga_horaria == 0 ? 0 : totalNota / carga_horaria
            puts "-- Aluno: #{aluno.matricula} - CR: #{crAluno.round(2)}"
        end
        puts ""
    end
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