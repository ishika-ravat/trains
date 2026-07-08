library(tidyverse)
library(primer.data)

# Create the plot
plot <- ggplot(trains, aes(x = treatment, y = att_end, color = treatment)) +
  geom_jitter(width = 0.2, height = 0.2, alpha = 0.6, size = 2) +
  stat_summary(
    fun = "mean",
    geom = "point",
    color = "black",
    fill = "red",
    size = 4,
    shape = 23, # diamond with border
    stroke = 1.5
  ) +
  scale_color_manual(values = c("Control" = "#2c3e50", "Treated" = "#e74c3c")) +
  labs(
    title = "Ending Attitude Toward Immigration by Treatment Group",
    subtitle = "Individual attitude scores (att_end) with group means",
    x = "Treatment Group",
    y = "Ending Attitude Score (higher = more conservative)",
    caption = "Source: trains dataset from primer.data. Red diamonds represent group means."
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16, margin = margin(b = 10)),
    plot.subtitle = element_text(face = "italic", size = 12, color = "gray30", margin = margin(b = 20)),
    plot.caption = element_text(size = 9, color = "gray50", margin = margin(t = 15)),
    legend.position = "none",
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10)),
    panel.grid.minor = element_blank()
  )

# Save the plot as an image
ggsave("trains_plot.png", plot, width = 8, height = 6, dpi = 300)
cat("Plot successfully generated and saved to trains_plot.png\n")
