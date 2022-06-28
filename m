Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C09555BF39
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:48:12 +0200 (CEST)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65xD-0006S8-1k
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o64qH-0004M8-Rz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:36:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o64qE-00055Q-Ql
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:36:57 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cf14so16078636edb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3F2q77ggtsaPKboie8t8w3JWLNjLE5pMVzJV6qNiC2o=;
 b=okfT1W3VpcY5j+SWSclod1BaZNOrjFTdxO25P4tQx2NMQlwY3lbckcIO4RpZACdy5e
 6iYX9WHXwhXN6ojEdl2SXfXk34nB9mXeM9tWvu6N4ITc0L4SywwnvoLZsPgnvYoClIOF
 Bi6f/wYsTqbdEuNspXbi84936GXjKz3YzBxzeSopFk/4vO0NsBhzb9CI4e3ypUYpZE1B
 ekR2Ldh5e/5K2/I2h/F+ZX8Le0g6F2im4431UNA2rX8noDYZJQVrGAVgfJN80JmlxSnC
 jrlB+yCd7c2wZBPpD/GT31r7syxL3+aofKH4B7EGK7w8MVuomDhX0Msir8t4je/i0UhG
 9dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3F2q77ggtsaPKboie8t8w3JWLNjLE5pMVzJV6qNiC2o=;
 b=mKPECMPlXhvJWdfAYbifY9uInRpqM28kpoha3FmJO0JPd8xPOVEtxdyGKXyFnKcwiZ
 hxuwmWG7QzVnF8s7K4KkYD5/W7M39xlB/ienUOwirFyBxO+umVAeloCUX1VHrp/SPv/j
 wHqx4l4Er1PVJlDPTHNQAMEp8FteyJCpL4qyU9BBkxVgBvnFBbCtwdHv5Gztdvz4ZIb9
 ao1juzzNHYdC2mtFvO6kyT9q2uMQnGad/WI23JNALejj0qo7CD/qTsRUJ55z1EqkF/oS
 /eiGIS6TIDCHvzB4xTuLG2LB8FMYVVY6ocmFuZV5xm7czJWIPNEnyJsCX6nbJ6QamgzE
 kiGQ==
X-Gm-Message-State: AJIora8CCbtD/BnhQF03fGBAIKDXQl7nRMmVzQMtw6FTVXKFDtfmOBG1
 8lQA/rK2Gk9t/bkYjmg9jYgtAcyfe9035x/pHvYtsw==
X-Google-Smtp-Source: AGRyM1vn1NhTnb1mE8QOPeS4WXy1NHyZkdVElQjcpp05ogtWkRd6xBVzoBy2XY2Ostzt02/5k2CntgT+j3Yas4c7xKs=
X-Received: by 2002:a05:6402:26d5:b0:435:aba2:9495 with SMTP id
 x21-20020a05640226d500b00435aba29495mr21320256edd.133.1656398203235; Mon, 27
 Jun 2022 23:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628021757-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 12:06:31 +0530
Message-ID: <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
Subject: Re: [PATCH 11/12] acpi/tests/bits: add README file for bits qtests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 11:50 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 28, 2022 at 11:46:13AM +0530, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 11:36 AM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> > >
> > > On Tue, Jun 28, 2022 at 10:27:38AM +0530, Ani Sinha wrote:
> > > > On Tue, Jun 28, 2022 at 3:56 AM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
> > > > >
> > > > > On Mon, Jun 27, 2022 at 12:58:55PM +0530, Ani Sinha wrote:
> > > > > > The README file is added describing the directory structure and=
 the purpose
> > > > > > of every file it contains. It also describes how to add new tes=
ts, make changes
> > > > > > to existing tests or bits config files or regenerate the bits s=
oftware.
> > > > > >
> > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > ---
> > > > > >  tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++++++++=
++++++++
> > > > > >  1 file changed, 168 insertions(+)
> > > > > >  create mode 100644 tests/qtest/acpi-bits/README
> > > > > >
> > > > > > diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/acpi-bi=
ts/README
> > > > > > new file mode 100644
> > > > > > index 0000000000..97b15f1665
> > > > > > --- /dev/null
> > > > > > +++ b/tests/qtest/acpi-bits/README
> > > > > > @@ -0,0 +1,168 @@
> > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > > > +ACPI/SMBIOS QTESTS USING BIOSBITS
> > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > > > +
> > > > > > +Biosbits is a software written by Josh Triplett that can be do=
wnloaded by
> > > > > > +visiting https://biosbits.org/. The github codebase can be fou=
nd here:
> > > > > > +https://github.com/biosbits/bits/tree/master. It is a software=
 that exercizes
> > > > > > +the bios components such as acpi and smbios tables directly th=
rough acpica
> > > > > > +bios interpreter (a freely available C based library written b=
y Intel,
> > > > > > +downloadable from https://acpica.org/ and is included with bio=
sbits) without an
> > > > > > +operating system getting involved in between.
> > > > > > +There are several advantages to directly testing the bios in a=
 real physical
> > > > > > +machine or VM as opposed to indirectly discovering bios issues=
 through the
> > > > > > +operating system. For one thing, the OSes tend to hide bios pr=
oblems from the
> > > > > > +end user. The other is that we have more control of what we wa=
nted to test
> > > > > > +and how by directly using acpica interpreter on top of the bio=
s on a running
> > > > > > +system. More details on the inspiration for developing biosbit=
s and its real
> > > > > > +life uses can be found in (a) and (b).
> > > > > > +This directory contains QEMU qtests written in python that exe=
rcizes the QEMU
> > > > > > +bios components using biosbits and reports test failures.
> > > > > > +
> > > > > > +These tests use python virtual environment. In debian/ubuntu s=
ystem, the tests
> > > > > > +would require python3.8-venv and python3-pip packages to be in=
stalled.
> > > > >
> > > > > Why do we mess with venv and pip? Certainly possible but
> > > > > what's wrong with using distro provided packages?
> > > >
> > > > There are two things:
> > > > (a) We are already using pip and venv for our avocado based
> > > > integration tests. Look for TESTS_VENV_DIR in Makefile.include unde=
r
> > > > tests.
> > > > (b) the venv is primarily needed because I wanted to take advantage=
 of
> > > > our rich python library that handles QEMU based machines. There are
> > > > python qtest libraries as well. These are well tested and used with
> > > > integration tests and I wanted to keep the test part of the code
> > > > simple by simply reusing them. however, in order to use them, we ne=
ed
> > > > a venv environment within which these qemu python libraries are
> > > > installed. Integration tests does the same thing.
> > > >
> > > > A note about my language of choice - python. I gave a lot of though=
ts
> > > > on this. We do not do a lot of stuff here. All we do is:
> > > > (a) generate bits iso.
> > > > (b) spawn a QEMU vm with the iso which then runs a bunch of tests w=
ithin the vm.
> > > > (c) collect and analyze logs.
> > > >
> > > > We are not inspecting guest memory or manipulating devices or pci
> > > > buses. We do not need the power of C here. We need something that i=
s
> > > > simple to write, easy to maintain and understand and can deal with
> > > > things like manipulating text files and configs easily. Python seem=
s a
> > > > better fit for the role.
> > >
> > > No problem with that. So that's venv. But do we need pip and pulling
> > > packages from the net during testing?
> >
> > We do that too. See requirements.txt in tests/
> > Following two are downloaded:
> > avocado-framework=3D=3D88.1
> > pycdlib=3D=3D1.11.0
> >
> > Also see this line in Makefie.include:
> >
> > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>
> Right but that's avocado since it pulls lots of stuff from
> the net anyway.
> Are the libraries in question not packaged on major distros?

Currently I only need this:
https://github.com/python-tap/tappy
which is the basic TAP processing library for python.

It seems its only installed through pip:
https://tappy.readthedocs.io/en/latest/

I do not think this is packaged by default. It's such a basic library
for parsing test output that maybe we can keep this somewhere within
the python src tree? Not sure ...

>
> > >
> > > > >
> > > > > > +
> > > > > > +A brief description of the contents of this directory follows:
> > > > > > +
> > > > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test.py
> > > > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test-venv.sh
> > > > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-config
> > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-cfg.txt
> > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-tests
> > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smbios.py
> > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smilatency.py
> > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 testacpi.py
> > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 testcpuid.py
> > > > > > +=E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > > > +=E2=94=9C=E2=94=80=E2=94=80 prebuilt
> > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095-grub.tar.gz
> > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095.zip
> > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > > > +=E2=94=9C=E2=94=80=E2=94=80 README
> > > > > > +=E2=94=94=E2=94=80=E2=94=80 requirements.txt
> > > > > > +
> > > > > > +acpi-bits:
> > > > > > + - acpi-bits-test-venv.sh: This is a shell script that sets up=
 the virtual
> > > > > > +   environment necessary for the actual python test script to =
run. Amongst
> > > > > > +   other things, it makes sure that QEMU python library is ava=
ilable within
> > > > > > +   that venv so that QEMU machines can be forked. QEMU python =
library can be
> > > > > > +   found within python/ directory in QEMU source.
> > > > > > +   After setting up the virtual environment, it runs the pytho=
n test script
> > > > > > +   from within that environment.
> > > > > > +   If you want to enable verbose mode only for bits test and r=
un make check,
> > > > > > +   one trick is to add V=3D1 before the call to execute the py=
thon script in
> > > > > > +   this file.
> > > > > > + - acpi-bits-test.py: This is the main python test script that=
 generates a
> > > > > > +   biosbits iso. It then spawns a QEMU VM with it, collects th=
e logs and reports
> > > > > > +   test failures. This is the script one would be interested i=
n if they wanted
> > > > > > +   to add or change some component of the log parsing, add a n=
ew commandline to
> > > > > > +   how QEMU is spawned etc. Test writers typically would not n=
eed to modify
> > > > > > +   this script unless they wanted to enhance or change the log=
 parsing for
> > > > > > +   their tests.
> > > > > > + - requirements.txt: This text file contains the dependent pyt=
hon libraries
> > > > > > +   needed for the tests to run. If a new dependent library is =
needed, it would
> > > > > > +   be added here as a new entry and then acpi-bits-test-venv.s=
h would install
> > > > > > +   it when setting up the python virtual environment using pip=
.
> > > > > > + - README: This text file.
> > > > > > +
> > > > > > +acpi-bits/bits-config:
> > > > > > +   This location contains biosbits config files that determine=
 how the software
> > > > > > +   runs the tests.
> > > > > > + - bits-config.txt: this is the biosbits config file that dete=
rmines what tests
> > > > > > +   or actions are performed by bits. The description of the co=
nfig options are
> > > > > > +   provided in the file itself.
> > > > > > +
> > > > > > +acpi-bits/prebuilt:
> > > > > > +   This location contains prebuilt biosbits binaries that are =
used to generate
> > > > > > +   the bits iso file for testing.
> > > > > > + - bits-2095.zip: The contents from this zip archive are the m=
ain contents of
> > > > > > +    the iso file that are used for testing. This binary zip ar=
chive also
> > > > > > +    contains the full source of the bits software including th=
e full text of
> > > > > > +    the license agreement listed here:
> > > > > > +    https://github.com/biosbits/bits/blob/master/COPYING
> > > > > > +    The source tarball can be found in this location in the zi=
p file:
> > > > > > +    boot/src/bits-2095.tar.gz
> > > > > > +    The additional changes beyond those that are present in th=
e official
> > > > > > +    biosbits github repository can be found here:
> > > > > > +    https://github.com/ani-sinha/bits/tree/bits-qemu-logging
> > > > > > +
> > > > > > +    Basically these changes can be categorized into the follow=
ing:
> > > > > > +    (a) changes to make sure biosbits builds with the latest g=
cc compiler
> > > > > > +    (gcc 9.4).
> > > > > > +    (b) upgrade of acpica to the latest version (march 2022).
> > > > > > +    (c) send bits logs to the debug IO port at addresss 0x403 =
so that isa
> > > > > > +    debugcon can be used to collect the logs.
> > > > > > +    (d) send a gub halt command to shutdown the VM once all th=
e tests have been
> > > > > > +    executed.
> > > > > > +
> > > > > > +    This zip file is automatically generated by the bits build=
 system. It can
> > > > > > +    be found in the bits build directory and it is suffixed by=
 the bits build
> > > > > > +    number.
> > > > > > +    Normally, there is no need to make any alteration to this =
zip archive
> > > > > > +    unless one wanted to change the bits software itself (for =
example to add
> > > > > > +    a new config option or change actions of existing options =
or change the
> > > > > > +    debug IO port etc). When such changes are made and a new b=
iosbits software
> > > > > > +    is needed to be generated, please refresh this zip archive=
 as well as the
> > > > > > +    grub tarball at the same time. Tests will break if changes=
 are made to bits
> > > > > > +    that are incompatible with existing behavior. So care must=
 be taken to make
> > > > > > +    sure that the change is compatible with existing bits soft=
ware as much as
> > > > > > +    possible. When a new config option is introduced for examp=
le, bits must
> > > > > > +    be upadated here first before introducing the new config o=
ption through
> > > > > > +    a later commit.
> > > > >
> > > > > I don't think playing with source tarballs is a reasonable work e=
nvironment.
> > > >
> > > > I agree. However, we do not do much with the source tarball. It is
> > > > there as part of bits to satisfy the license requirement. If we nee=
d
> > > > to manipulate any test script that is in the source file, we would
> > > > copy it over and keep it in the bits-test directory and change it
> > > > there.
> > > >
> > > > > Let's use submodules just like e.g. firmware does?
> > > >
> > > > Yes I also proposed this to Igor on IRC. We can/maybe need to figur=
e
> > > > out a place to store the bits source if we think my github is not t=
he
> > > > best place. However, we need the source only if/when we need to
> > > > rebuild bits. I suspect it won't be too often if at all.
> > >
> > > Why not on git.qemu.org ?
> >
> > Sounds good to me. Do I get push access? :-)
> >
> > >
> > > > >
> > > > >
> > > > >
> > > > > > + - prebuilt/bits-2095-grub.tar.gz: This tarbball contains bits=
 generated grub
> > > > > > +    scripts and modules to the prebuilt directory. These prebu=
ilt grub
> > > > > > +    artifacts are required in order to generate a bootable bit=
s iso file that
> > > > > > +    can run tests.
> > > > > > +    In order to generate this tar archive, please put the foll=
owing two
> > > > > > +    directories that can be found in the bits build directory =
in a single
> > > > > > +    tar archive file named as bits-<n>-grub.tar.gz where n is =
the version of
> > > > > > +    bits that generated the archive:
> > > > > > +
> > > > > > +    grub-inst-x86_64-efi
> > > > > > +    grub-inst
> > > > > > +
> > > > > > +    This version should be the same as the version number of b=
its that generated
> > > > > > +    bits-<n>.zip file. In other words, the two files must be i=
n sync and should
> > > > > > +    come from the same build of biosbits of the same version. =
Things may still
> > > > > > +    work if they come from different versions but mixing versi=
on numbers are
> > > > > > +    not recommended.
> > > > > > +    There is normally no need to regenerate this archive unles=
s some fixes or
> > > > > > +    changes have gone into the grub that are part of biosbits.
> > > > > > +
> > > > > > +acpi-bits/bits-tests:
> > > > > > +   This directory contains biosbits python based tests that ar=
e run from within
> > > > > > +   the biosbits environment in the spawned VM. New additions o=
f test cases can
> > > > > > +   be made in the appropriate test file. For example, new acpi=
 tests can go
> > > > > > +   into testacpi.py and one would call testsuite.add_test() to=
 register the new
> > > > > > +   test so that it gets executed as a part of the ACPI tests.
> > > > > > +   It might be occassionally necessary to disable some subtest=
s or add a new
> > > > > > +   test that belongs to a test suite not already present in th=
is directory. To
> > > > > > +   do this, please extract the bits source from the zip file m=
entioned above.
> > > > > > +   Copy the test suite/script that needs modification (additio=
n of new tests
> > > > > > +   or disabling them) from boot/python location of the extract=
ed directory
> > > > > > +   into this directory.
> > > > > > +
> > > > > > +   step (a): copy unmodified test script to this directory.
> > > > > > +   step (b): update meson.build and add this file to the list.
> > > > > > +   Commit (a) and (b) together in the same commit.
> > > > > > +
> > > > > > +   step (c): perform modifications to the test.
> > > > > > +   Commit (c) in a separate commit.
> > > > > > +
> > > > > > +   The test framework will then use your modified test script =
to run the test.
> > > > > > +   No further changes would be needed. Please check the logs t=
o make sure that
> > > > > > +   appropriate changes have taken effect.
> > > > > > +
> > > > > > +meson.build files makes sure that the bits qtests are appropri=
ately integrated
> > > > > > +into the QEMU qtest framework and are run with "make check-qte=
st".
> > > > > > +Currently, the bits test is configured to run only for x86_64 =
architectures. Bits
> > > > > > +has been built only for this architecture.
> > > > > > +
> > > > > > +
> > > > > > +Author: Ani Sinha <ani@anisinha.ca>
> > > > > > +
> > > > > > +References:
> > > > > > +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/present=
ations/867/original/bits.pdf
> > > > > > +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg
> > > > > > --
> > > > > > 2.25.1
> > > > >
> > >
>

