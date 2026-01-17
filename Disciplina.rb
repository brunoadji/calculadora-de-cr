class Disciplina
  attr_accessor :codigo_disciplina, :carga_horaria

  def initialize(codigo_disciplina, carga_horaria)
    @codigo_disciplina = codigo_disciplina
    @carga_horaria = carga_horaria
  end
end
