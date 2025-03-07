import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.TextFieldValue
import androidx.compose.ui.unit.dp
import kotlin.random.Random

@Composable
fun MathGameApp() {
    var num1 by remember { mutableStateOf(Random.nextInt(1, 11)) }
    var num2 by remember { mutableStateOf(Random.nextInt(1, 11)) }
    var answer by remember { mutableStateOf(TextFieldValue()) }
    var score by remember { mutableStateOf(0) }
    var turns by remember { mutableStateOf(3) }
    var gameOver by remember { mutableStateOf(false) }

    Column(modifier = Modifier.padding(16.dp)) {
        if (gameOver) {
            Text("Game Over! Score: $score", style = MaterialTheme.typography.headlineMedium)
            Button(onClick = {
                score = 0
                turns = 3
                gameOver = false
                num1 = Random.nextInt(1, 11)
                num2 = Random.nextInt(1, 11)
                answer = TextFieldValue()
            }) {
                Text("Restart")
            }
        } else {
            Text("$num1 + $num2 = ?", style = MaterialTheme.typography.headlineMedium)
            OutlinedTextField(
                value = answer,
                onValueChange = { answer = it },
                label = { Text("Your Answer") }
            )
            Button(onClick = {
                if (answer.text.toIntOrNull() == num1 + num2) {
                    score++
                }
                turns--
                if (turns == 0) {
                    gameOver = true
                } else {
                    num1 = Random.nextInt(1, 11)
                    num2 = Random.nextInt(1, 11)
                    answer = TextFieldValue()
                }
            }) {
                Text("Submit")
            }
            Text("Turns left: $turns", style = MaterialTheme.typography.bodyLarge)
            Text("Score: $score", style = MaterialTheme.typography.bodyLarge)
        }
    }
}
