# Cro-webapp

This is a blank webapp template for Raku Cro. Use it to create what you need and want.

Created with Comma: [https://commaide.com/download](https://commaide.com/download)

See also: [https://github.com/croservices/cro-webapp](https://github.com/croservices/cro-webapp)

These instructions are from: [https://cro.services/docs/intro/getstarted](https://cro.services/docs/intro/getstarted)

# Cro 

[Cro](https://cro.services/) is a set of libraries for building reactive distributed systems, lovingly crafted to take advantage of all Raku has to offer. The high level APIs make the easy things easy, and the asynchronous pipeline concept at Cro's heart makes the hard things possible.

Ready to get started? Just `zef install --/test cro` and check out the documentation. 

# Getting started with Cro

Here's a list of things to do to get Cro running on your machine.

### Install Raku

Cro services are written in Raku; if you have not yet installed a Raku compiler, see these instructions.

### Install Cro

Install Cro from the command line using zef:

```
zef install --/test cro
```

This includes the cro development tool, as well as the Cro core, HTTP, and web sockets libraries.

### Write a Cro service

Copy the following code to a file called hello.p6:

```
use Cro::HTTP::Router;
use Cro::HTTP::Server;

my $application = route {
    get -> {
        content 'text/html', 'Hello Cro!';
    }
}

my Cro::Service $service = Cro::HTTP::Server.new:
    :host<localhost>, :port<10000>, :$application;

$service.start;

react whenever signal(SIGINT) {
    $service.stop;
    exit;
}
```


### Run the Cro service

To start the service, just run the script from the command line:

```
raku hello.p6
```

### Check that the service runs ok

There should now be a page saying 'Hello Cro!' at http://localhost:10000

Congratulations, you have successfully installed Cro!

### Extra credit: use the cro development tool

The cro stub command generates stub services for you, to get started more quickly and with better defaults. Here we use it to create a simple HTTP service, with ID hello and in the hello directory:

```
cro stub http hello hello
```

The cro run command will start your service (and automatically restart the service if you change a file):

```
cro run
```

You can change the service by editing files in the hello/ subdirectory. The HTTP routes, for example, are in hello/lib/Routes.pm6.


