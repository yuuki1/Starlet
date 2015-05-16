use Plack::Builder;

my $app = sub {
    my $env = shift;
    return [200,  [ 'Content-Type' => 'text/html' ], ["Hello World"]];
};

builder {
    enable 'AxsLog',
        ltsv => 1,
        response_time => 1,
        logger => sub {
            print($@);
        };
    $app;
};
