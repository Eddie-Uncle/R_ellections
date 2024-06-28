# Load necessary libraries
library(ggplot2)

# Set a seed for reproducibility
set.seed(123)

# Generate sample data for states
states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", 
            "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", 
            "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
            "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
            "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", 
            "New Hampshire", "New Jersey", "New Mexico", "New York", 
            "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", 
            "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", 
            "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", 
            "West Virginia", "Wisconsin", "Wyoming")

# Generate random vote counts for Trump and Biden
trump_votes <- rnorm(length(states), mean=500000, sd=200000)
biden_votes <- rnorm(length(states), mean=500000, sd=200000)

# Create a data frame
election_data <- data.frame(State=states, Trump=trump_votes, Biden=biden_votes)

# Summarize total votes for each candidate
total_trump_votes <- sum(election_data$Trump)
total_biden_votes <- sum(election_data$Biden)

# Print the total votes
cat("Total votes for Trump: ", total_trump_votes, "\n")
cat("Total votes for Biden: ", total_biden_votes, "\n")

# Plot the vote counts by state
ggplot(election_data, aes(x=State)) +
  geom_bar(aes(y=Trump), stat="identity", fill="red", alpha=0.6) +
  geom_bar(aes(y=Biden), stat="identity", fill="blue", alpha=0.6) +
  labs(title="Predicted Votes by State", x="State", y="Votes") +
  theme(axis.text.x=element_text(angle=90, hjust=1))

# Determine winner based on total votes
if (total_trump_votes > total_biden_votes) {
  cat("Predicted winner: Trump\n")
} else {
  cat("Predicted winner: Biden\n")
}

