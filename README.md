# aws-beanstalk-docker-python-flask
Sample Application for AWS Elastic Beanstalk using Docker and Python Flask 

# Typical Deployment



# Local Dev

```bash
 $ virtualenv my-py
 N.B. .ebignore with my-py
 $ source my-py/bin/activate
 $ pip install flask==1.0.2
 $ pip freeze > requirements.txt
 N.B. remove version from requirements
 $ eb init
 $ eb create my-env
 $
 $ eb init -p python-3.6 my-app --region us-east-2
 $ eb init
 $ eb terminate
```

# EB CLI

1. Install the 'eb' tool.
2. Git clone this repository.
3. Run 'eb init' in the repository, and answer the questions, providing your API Key, etc.
4. Run 'eb start' in the repository, and wait for it to complete.
5. Run 'git aws.push' in the repository.
6. Run 'eb status' in the repository, and wait for it to return 'Green' status.
7. Browse to the URL reported by 'eb status', and be amazed at your autoscaling, crazy, cloud-based application!

# References

- https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/single-container-docker.html
- https://github.com/arnoldokoth/eb_demo
- https://github.com/kmturley/python-docker-amazon/tree/master
