use Cro::HTTP::Test;
use Test;
use webapp::Routes;

test-service routes, {
    test get('/'),
            status => 200,
            body-text => '<h1> webapp </h1>';
}

done-testing;
