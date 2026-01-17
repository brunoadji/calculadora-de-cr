require_relative 'Faculdade'
require_relative 'LeitorDeArquivo'

leitor = LeitorDeArquivo.new

print "Insira o nome do arquivo: "

arquivo = gets.chomp
puts arquivo
faculdade = leitor.le_arquivo(arquivo)

for curso in faculdade.cursos
    carga_horaria_curso, total_nota_curso = curso.calcula_hora_e_notas
    crCurso = carga_horaria_curso == 0 ? 0 : total_nota_curso / carga_horaria_curso
    puts "Curso: #{curso.codigo_curso} - CR: #{crCurso.round(2)}"
    for aluno in curso.alunos
        carga_horaria, totalNota = aluno.calcula_hora_e_notas
        crAluno = carga_horaria == 0 ? 0 : totalNota / carga_horaria
        puts "  Aluno: #{aluno.matricula} - CR: #{crAluno.round(2)}"
    end
end