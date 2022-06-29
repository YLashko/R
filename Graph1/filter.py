datasets = "datasets/"

def filter_states():
    with open(datasets + "airports.csv", "r") as f:
        lines = [line.split(",") for line in f]
        output = []
    for line in lines:
        try:
            if line[3] == "USA":
                output.append(f'{line[0]},{line[2]}')
        except:
            pass
    with open(datasets + "us-airports.csv", "w") as f:
        f.write("\n".join(output))
    
def filter_states_by_name(state_names):
    with open(datasets + "us-airports.csv", "r") as f:
        with open(datasets + f"us-airports-filtered.csv", "w") as fo:
            fo.write("\n".join([line.split(",")[0] for line in f if line.split(",")[1].replace("\n", "") in state_names]))

def filter_flights_by_states():
    with open(datasets + f"us-airports-filtered.csv", "r") as f:
        with open(datasets + "data_no_header.csv", "r") as fd:
            with open(datasets + f"data-filtered.csv", "w") as fo:
                airports = [line.replace("\n", "") for line in f]
                for line in fd:
                    if line.split(",")[0] in airports and line.split(",")[1] in airports:
                        fo.write(line)

states = ["PENNSYLVANIA", "VIRGINIA", "NEWYORK", "NEWJERSEY", "DELAWARE", "OHIO"]
filter_states_by_name(states)
filter_flights_by_states()