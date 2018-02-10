unit package Build::Dependency;

our proto require(|c) {*} ;

multi sub require('executable', $exec-name, :$suggest) {
    if ! $exec-name.IO.f {
        die "Could not find $exec-name. Did you `$suggest`?";
    }
}
