unit package Build::Dependency;

our proto require(|c) {*} ;

multi sub require('executable', $exec-name, :$suggest) {
    if ! $exec-name.IO.f {
        die "Could not find $exec-name. Did you `$suggest`?";
    }
}

multi sub require('directory', $dir-name, :$create) {

    my $io = $dir-name.IO;

    return if $dir-name.IO ~~ :d;

    if $dir-name.IO ~~ :e {
        die "$dir-name already exists, but isn't a directory.";
    }

    note "Creating $dir-name";
    mkdir $dir-name;
}
