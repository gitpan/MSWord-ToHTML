
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Take old or new Word files and spit out superclean HTML",
  "AUTHOR" => "Amiri Barksdale <amiribarksdale\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MSWord-ToHTML",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MSWord::ToHTML",
  "PREREQ_PM" => {
    "Archive::Zip" => 0,
    "Archive::Zip::MemberRead" => 0,
    "CSS" => 0,
    "Carp" => 0,
    "Cwd" => 0,
    "Digest::SHA1" => 0,
    "Encode" => 0,
    "Encode::Guess" => 0,
    "File::Spec" => 0,
    "HTML::Entities" => 0,
    "HTML::HTML5::Writer" => 0,
    "HTML::TreeBuilder" => 0,
    "IO::All" => 0,
    "List::MoreUtils" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "MooseX::Method::Signatures" => 0,
    "MooseX::Types" => 0,
    "MooseX::Types::IO::All" => 0,
    "MooseX::Types::Moose" => 0,
    "MooseX::Types::Path::Class" => 0,
    "Path::Class::File" => 0,
    "Text::Extract::Word" => 0,
    "Try::Tiny" => 0,
    "XML::LibXML" => 0,
    "XML::LibXSLT" => 0,
    "autodie" => 0,
    "feature" => 0,
    "namespace::autoclean" => 0,
    "strictures" => 1
  },
  "TEST_REQUIRES" => {
    "Env::Path" => 0,
    "Module::Find" => 0,
    "Test::Moose" => 0,
    "Test::Most" => 0,
    "lib" => 0
  },
  "VERSION" => "0.009",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



