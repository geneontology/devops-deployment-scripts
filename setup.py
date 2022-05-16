from setuptools import setup, find_packages

setup(
    name='go-deploy',
    version='0.1.0',
    include_package_data=True,
    url='https://github.com/geneontology/devops-deployment-scripts.git',
    author='Abdelilah Essiari',
    author_email='aessiari@lbl.gov',
    description='Provision using terraform and ansible',
    packages=find_packages(),    
    install_requires=[
       'pyyaml', 
    ],
    entry_points={
       'console_scripts': [
              'go-deploy = go.deployl:main',
       ]
    },
)
