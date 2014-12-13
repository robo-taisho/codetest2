def solution(array_A , int_N)
  max_A = array_A.max
  c_Left = 0    #問題文中のPに相当
  c_Right = 0  #問題文中のQに相当
  max_Left = max_A
  max_Right = max_A
  i = 0

  #array_Aの中で最初に最大値を持つ箇所を特定する。
  for i in (0 .. int_N - 1 )
    if array_A[i] == max_A
      c_Left = i
      c_Right = i
      start_place = i
      break
    end
  end
  
  #最大値を持つ箇所から出発し、最大値よりも関数の値を大きくする右側の点Qを、
  #最大値の右側へ探しに行く
  for m in (start_place .. int_N - 1)
    testing_Right = array_A[m] + ( m - start_place )
    if testing_Right > max_Right
      #よりよい点を見つけたらmax_Rightを乗り換える
      max_Right = testing_Right
      c_Right = m
    end
  end
  
  #同様に、左側に向かって、最初の最大値よりも関数の値を大きくするような点Pを
  #探しにいく
  start_place.downto(0) { |n|
    testing_Left = array_A[n] + (start_place - n)
    if testing_Left > max_Left
      max_Left = testing_Left
      c_Left = n
    end
  }
   
  ans_Sol = array_A[c_Left] + array_A[c_Right] + ( c_Right - c_Left )
  return ans_Sol
end

=begin
以下テスト用array_intA = [198, 91, 6, 197, 9, 2, 3, 5, 6, 7, 9, 200, 3, 5, 6, 7, 9, 2, 198, 5, 6, 7, 99, 1,]
int_aN = array_intA.length

array_intAA = Array(3..1000).map{|i| i*1}
int_aaN = array_intAA.length

ans = solution(array_intAA, int_aaN)
puts "answer is #{ans}"
puts int_aaN

=end
