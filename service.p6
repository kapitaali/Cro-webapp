use Cro::HTTP::Log::File;
use Cro::HTTP::Server;
use webapp::Routes;

my Cro::Service $http = Cro::HTTP::Server.new(
    http => <1.1>,
    host => %*ENV<WEBAPP_HOST> ||
        die("Missing WEBAPP_HOST in environment"),
    port => %*ENV<WEBAPP_PORT> ||
        die("Missing WEBAPP_PORT in environment"),
    application => routes(),
    after => [
        Cro::HTTP::Log::File.new(logs => $*OUT, errors => $*ERR)
    ]
);
$http.start;
say "Listening at http://%*ENV<WEBAPP_HOST>:%*ENV<WEBAPP_PORT>";
react {
    whenever signal(SIGINT) {
        say "Shutting down...";
        $http.stop;
        done;
    }
}
