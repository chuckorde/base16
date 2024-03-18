from langchain_community.llms import Ollama
from crewai import Agent, Task, Crew, Process
from langchain_community.tools import DuckDuckGoSearchRun

search_tool = DuckDuckGoSearchRun()
ollama_openhermes = Ollama(model='openhermes')

# Define your agents with roles and goals
researcher = Agent(
  role='Senior Research Analyst',
  goal='Uncover cutting-edge developments in AI and data science',
  backstory="""You work at a leading tech think tank.
  Your expertise lies in identifying emerging trends.
  """,
  verbose=True,
  allow_delegation=False,
  tools=[search_tool],
  llm=ollama_openhermes
)

# Create tasks for your agents
task1 = Task(
  description="""Conduct a comprehensive analysis of AI in 2024.
  Identify key trends, technologies, and potential industry impacts.""",
  expected_output="Full analysis report in bullet points",
  agent=researcher
)


# Instantiate your crew with a sequential process
crew = Crew(
  agents=[researcher],
  tasks=[task1],
  verbose=2, # You can set it to 1 or 2 to different logging levels
)

# Get your crew to work!
result = crew.kickoff()

print(result)
