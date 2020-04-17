import json
import requests

SOLVER_URL = "http://solver.planning.domains/solve"

def read_file(from_path):
    return "".join(open(from_path).readlines())

if __name__ == "__main__":
    import sys
    
    domain_file_path = sys.argv[1]
    problem_file_path = sys.argv[2]

    payload = {}
    payload["domain"] = read_file(domain_file_path)
    payload["problem"] = read_file(problem_file_path)

    r = requests.post(SOLVER_URL, data=json.dumps(payload), headers={"Content-Type":"application/json"})

    print(json.dumps(r.json(), indent=4, sort_keys=True))
