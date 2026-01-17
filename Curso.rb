class Curso
  attr_accessor :codigo_curso, :alunos

  def initialize(codigo_curso)
    @codigo_curso = codigo_curso
    @alunos = []
  end

  def calcula_hora_e_notas
    totalNota = 0
    totalCargaHoraria = 0
    for aluno in alunos
      cargaHorariaAluno, notaAluno = aluno.calcula_hora_e_notas
      totalCargaHoraria += cargaHorariaAluno
      totalNota += notaAluno
    end
    return totalCargaHoraria, totalNota
  end

  def matricula_aluno(novoAluno)
    for aluno in alunos
        if aluno.matricula == novoAluno.matricula
            return aluno
        end
    end
    @alunos << novoAluno
    return novoAluno
  end
end
