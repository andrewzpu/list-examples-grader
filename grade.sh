CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'
SUBMISSION='student-submission/ListExamples.java'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

if [[ -f $SUBMISSION ]]
then
    echo "File Found!"
else
    echo "File not Found!"
    exit 1
fi

cp $SUBMISSION .


javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo "Compiled!"
else
    echo "File could not be compiled!"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output/testResults.txt

result=`sed -n 2p output/*.txt`
tests=0
failures=0
echo $result
for ((i=0; i<${#result}; i++)); do
    char=${result:$i:1}
    if [[ $char == '.' ]]
    then
        tests=$((tests+1))
    else
        failures=$((failures+1))
    fi
done
success=$(($tests-$failures))
a=$(awk '{print $1/$2*100}' <<<"${success} ${tests}")
echo $success"/"$tests
echo $a"%"


# oktext=`grep "OK" output/*.txt`

# if [ -z "${oktext}" ]
# then
#     result=`grep "Tests run: " output/*.txt`
#     length=${#result}
#     prefix=${result%%","*}
#     length2=${#prefix}
#     total=${result:11:length2-11}
#     failures=${result:length2+13:length-25}
#     a=$(($failures/$total))
#     success=$(($total-$failures))
#     a=$(awk '{print $1/$2*100}' <<<"${success} ${total}")
#     echo "Your submission passed "$success"/"$total" tests"
#     echo "You passed "$a"% of the tests"
# else
#     prefix=${oktext%%"t"*}
#     length=${#prefix}
#     total=${oktext:4:length-5}
#     echo "Your submission passed "$total"/"$total" tests"
#     echo "You passed 100% of the tests"
# fi




