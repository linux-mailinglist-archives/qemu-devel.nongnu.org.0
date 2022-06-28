Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83955BF25
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:31:50 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65hM-0000nX-O0
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o64WZ-0004eh-Ml
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:16:35 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o64WQ-0002SI-JR
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:16:35 -0400
Received: by mail-ej1-x636.google.com with SMTP id ge10so23544051ejb.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 23:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m/3cIjXMH89xRZF3pUipNBFA/XssuzQlb1XJc6ZeBns=;
 b=UaH3JmXJlFfzPO+mWftJG7NcSE0HPaT5s4tPviexm2HgwmxJNJkTLsfUrdkLjkg0wR
 bfxyomaYTerfLEUQHk8u0dsWGA0ymqWHKzvyghC3OSyqfTfFxcd89yKn0fJuUTfUHkJE
 O+iLLGwQMDHGnfB/cq5pyIDfoB8V2zQLNWYz7ndJfv8Cc14fdkjWaIS399MfcTczJCQZ
 8yUmJvQZ7vSiSOPMqJFRoKLlwiV3x50aFAD6bWjBltOzyJmhvMZrEaQx+Lw4t7hZmrEN
 vUbf/vL/k3QEcdjaQpHZJnmacQuFghcrZGA3ZxLdKymqVhysiWaYNNoB5hmclw+KhneF
 jxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m/3cIjXMH89xRZF3pUipNBFA/XssuzQlb1XJc6ZeBns=;
 b=u1QElRHEOgeecF8MgTErPS8muFL8ziRvOePXL0tgyMz86uyk16t2BRV4CKG6xdofeC
 Z0B4tGUBKhSbJaOzgh71VGP4647u3mKw76H1q9YtHM5PNU3Ao6eU7z0dTqu93cpLsv26
 NrxJf7VhBEQSuVAc/Sdm/V+T/cu3rHpAeFJm3b5j0MHFpYamtyHk2gOVM3f5pBIYd9cM
 RcHDYBQo6dVYnuuXhGshkr7oq5IRuvvMciaAWwwwDzBG0XsUNgfaWuHY6hR4BRMyqFXM
 lNkSmRMd13uegAz0h8tPaFvKVk5PwF2rgSCZiJgzRYz3gZVYqbOPdiw46Ff/mjQAYWqh
 EZgw==
X-Gm-Message-State: AJIora8l3N7KjETuz72EeyPGeolFlBULtM9mYR2zFt5b6YpV8D4uzqq0
 /H4lB4kiXuX7hVm2+FIFHeCEwa6ELm48T0TCX/0dmw==
X-Google-Smtp-Source: AGRyM1t1E2VpprxE7DpzEsemlHWtX+KJabbTUnh77IKcUA7xQCZXezeM762/p193dHwILZPUpF1ZzdK8G5YtXnVuuow=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr16468661ejc.64.1656396984734; Mon, 27
 Jun 2022 23:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628020017-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 11:46:13 +0530
Message-ID: <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
Subject: Re: [PATCH 11/12] acpi/tests/bits: add README file for bits qtests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
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

On Tue, Jun 28, 2022 at 11:36 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 28, 2022 at 10:27:38AM +0530, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 3:56 AM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > >
> > > On Mon, Jun 27, 2022 at 12:58:55PM +0530, Ani Sinha wrote:
> > > > The README file is added describing the directory structure and the=
 purpose
> > > > of every file it contains. It also describes how to add new tests, =
make changes
> > > > to existing tests or bits config files or regenerate the bits softw=
are.
> > > >
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 168 insertions(+)
> > > >  create mode 100644 tests/qtest/acpi-bits/README
> > > >
> > > > diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/acpi-bits/R=
EADME
> > > > new file mode 100644
> > > > index 0000000000..97b15f1665
> > > > --- /dev/null
> > > > +++ b/tests/qtest/acpi-bits/README
> > > > @@ -0,0 +1,168 @@
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > > +ACPI/SMBIOS QTESTS USING BIOSBITS
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > > +
> > > > +Biosbits is a software written by Josh Triplett that can be downlo=
aded by
> > > > +visiting https://biosbits.org/. The github codebase can be found h=
ere:
> > > > +https://github.com/biosbits/bits/tree/master. It is a software tha=
t exercizes
> > > > +the bios components such as acpi and smbios tables directly throug=
h acpica
> > > > +bios interpreter (a freely available C based library written by In=
tel,
> > > > +downloadable from https://acpica.org/ and is included with biosbit=
s) without an
> > > > +operating system getting involved in between.
> > > > +There are several advantages to directly testing the bios in a rea=
l physical
> > > > +machine or VM as opposed to indirectly discovering bios issues thr=
ough the
> > > > +operating system. For one thing, the OSes tend to hide bios proble=
ms from the
> > > > +end user. The other is that we have more control of what we wanted=
 to test
> > > > +and how by directly using acpica interpreter on top of the bios on=
 a running
> > > > +system. More details on the inspiration for developing biosbits an=
d its real
> > > > +life uses can be found in (a) and (b).
> > > > +This directory contains QEMU qtests written in python that exerciz=
es the QEMU
> > > > +bios components using biosbits and reports test failures.
> > > > +
> > > > +These tests use python virtual environment. In debian/ubuntu syste=
m, the tests
> > > > +would require python3.8-venv and python3-pip packages to be instal=
led.
> > >
> > > Why do we mess with venv and pip? Certainly possible but
> > > what's wrong with using distro provided packages?
> >
> > There are two things:
> > (a) We are already using pip and venv for our avocado based
> > integration tests. Look for TESTS_VENV_DIR in Makefile.include under
> > tests.
> > (b) the venv is primarily needed because I wanted to take advantage of
> > our rich python library that handles QEMU based machines. There are
> > python qtest libraries as well. These are well tested and used with
> > integration tests and I wanted to keep the test part of the code
> > simple by simply reusing them. however, in order to use them, we need
> > a venv environment within which these qemu python libraries are
> > installed. Integration tests does the same thing.
> >
> > A note about my language of choice - python. I gave a lot of thoughts
> > on this. We do not do a lot of stuff here. All we do is:
> > (a) generate bits iso.
> > (b) spawn a QEMU vm with the iso which then runs a bunch of tests withi=
n the vm.
> > (c) collect and analyze logs.
> >
> > We are not inspecting guest memory or manipulating devices or pci
> > buses. We do not need the power of C here. We need something that is
> > simple to write, easy to maintain and understand and can deal with
> > things like manipulating text files and configs easily. Python seems a
> > better fit for the role.
>
> No problem with that. So that's venv. But do we need pip and pulling
> packages from the net during testing?

We do that too. See requirements.txt in tests/
Following two are downloaded:
avocado-framework=3D=3D88.1
pycdlib=3D=3D1.11.0

Also see this line in Makefie.include:

$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))

>
> > >
> > > > +
> > > > +A brief description of the contents of this directory follows:
> > > > +
> > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test.py
> > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test-venv.sh
> > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-config
> > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-cfg.txt
> > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-tests
> > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smbios.py
> > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smilatency.py
> > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 testacpi.py
> > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 testcpuid.py
> > > > +=E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > +=E2=94=9C=E2=94=80=E2=94=80 prebuilt
> > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095-grub.tar.gz
> > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095.zip
> > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > +=E2=94=9C=E2=94=80=E2=94=80 README
> > > > +=E2=94=94=E2=94=80=E2=94=80 requirements.txt
> > > > +
> > > > +acpi-bits:
> > > > + - acpi-bits-test-venv.sh: This is a shell script that sets up the=
 virtual
> > > > +   environment necessary for the actual python test script to run.=
 Amongst
> > > > +   other things, it makes sure that QEMU python library is availab=
le within
> > > > +   that venv so that QEMU machines can be forked. QEMU python libr=
ary can be
> > > > +   found within python/ directory in QEMU source.
> > > > +   After setting up the virtual environment, it runs the python te=
st script
> > > > +   from within that environment.
> > > > +   If you want to enable verbose mode only for bits test and run m=
ake check,
> > > > +   one trick is to add V=3D1 before the call to execute the python=
 script in
> > > > +   this file.
> > > > + - acpi-bits-test.py: This is the main python test script that gen=
erates a
> > > > +   biosbits iso. It then spawns a QEMU VM with it, collects the lo=
gs and reports
> > > > +   test failures. This is the script one would be interested in if=
 they wanted
> > > > +   to add or change some component of the log parsing, add a new c=
ommandline to
> > > > +   how QEMU is spawned etc. Test writers typically would not need =
to modify
> > > > +   this script unless they wanted to enhance or change the log par=
sing for
> > > > +   their tests.
> > > > + - requirements.txt: This text file contains the dependent python =
libraries
> > > > +   needed for the tests to run. If a new dependent library is need=
ed, it would
> > > > +   be added here as a new entry and then acpi-bits-test-venv.sh wo=
uld install
> > > > +   it when setting up the python virtual environment using pip.
> > > > + - README: This text file.
> > > > +
> > > > +acpi-bits/bits-config:
> > > > +   This location contains biosbits config files that determine how=
 the software
> > > > +   runs the tests.
> > > > + - bits-config.txt: this is the biosbits config file that determin=
es what tests
> > > > +   or actions are performed by bits. The description of the config=
 options are
> > > > +   provided in the file itself.
> > > > +
> > > > +acpi-bits/prebuilt:
> > > > +   This location contains prebuilt biosbits binaries that are used=
 to generate
> > > > +   the bits iso file for testing.
> > > > + - bits-2095.zip: The contents from this zip archive are the main =
contents of
> > > > +    the iso file that are used for testing. This binary zip archiv=
e also
> > > > +    contains the full source of the bits software including the fu=
ll text of
> > > > +    the license agreement listed here:
> > > > +    https://github.com/biosbits/bits/blob/master/COPYING
> > > > +    The source tarball can be found in this location in the zip fi=
le:
> > > > +    boot/src/bits-2095.tar.gz
> > > > +    The additional changes beyond those that are present in the of=
ficial
> > > > +    biosbits github repository can be found here:
> > > > +    https://github.com/ani-sinha/bits/tree/bits-qemu-logging
> > > > +
> > > > +    Basically these changes can be categorized into the following:
> > > > +    (a) changes to make sure biosbits builds with the latest gcc c=
ompiler
> > > > +    (gcc 9.4).
> > > > +    (b) upgrade of acpica to the latest version (march 2022).
> > > > +    (c) send bits logs to the debug IO port at addresss 0x403 so t=
hat isa
> > > > +    debugcon can be used to collect the logs.
> > > > +    (d) send a gub halt command to shutdown the VM once all the te=
sts have been
> > > > +    executed.
> > > > +
> > > > +    This zip file is automatically generated by the bits build sys=
tem. It can
> > > > +    be found in the bits build directory and it is suffixed by the=
 bits build
> > > > +    number.
> > > > +    Normally, there is no need to make any alteration to this zip =
archive
> > > > +    unless one wanted to change the bits software itself (for exam=
ple to add
> > > > +    a new config option or change actions of existing options or c=
hange the
> > > > +    debug IO port etc). When such changes are made and a new biosb=
its software
> > > > +    is needed to be generated, please refresh this zip archive as =
well as the
> > > > +    grub tarball at the same time. Tests will break if changes are=
 made to bits
> > > > +    that are incompatible with existing behavior. So care must be =
taken to make
> > > > +    sure that the change is compatible with existing bits software=
 as much as
> > > > +    possible. When a new config option is introduced for example, =
bits must
> > > > +    be upadated here first before introducing the new config optio=
n through
> > > > +    a later commit.
> > >
> > > I don't think playing with source tarballs is a reasonable work envir=
onment.
> >
> > I agree. However, we do not do much with the source tarball. It is
> > there as part of bits to satisfy the license requirement. If we need
> > to manipulate any test script that is in the source file, we would
> > copy it over and keep it in the bits-test directory and change it
> > there.
> >
> > > Let's use submodules just like e.g. firmware does?
> >
> > Yes I also proposed this to Igor on IRC. We can/maybe need to figure
> > out a place to store the bits source if we think my github is not the
> > best place. However, we need the source only if/when we need to
> > rebuild bits. I suspect it won't be too often if at all.
>
> Why not on git.qemu.org ?

Sounds good to me. Do I get push access? :-)

>
> > >
> > >
> > >
> > > > + - prebuilt/bits-2095-grub.tar.gz: This tarbball contains bits gen=
erated grub
> > > > +    scripts and modules to the prebuilt directory. These prebuilt =
grub
> > > > +    artifacts are required in order to generate a bootable bits is=
o file that
> > > > +    can run tests.
> > > > +    In order to generate this tar archive, please put the followin=
g two
> > > > +    directories that can be found in the bits build directory in a=
 single
> > > > +    tar archive file named as bits-<n>-grub.tar.gz where n is the =
version of
> > > > +    bits that generated the archive:
> > > > +
> > > > +    grub-inst-x86_64-efi
> > > > +    grub-inst
> > > > +
> > > > +    This version should be the same as the version number of bits =
that generated
> > > > +    bits-<n>.zip file. In other words, the two files must be in sy=
nc and should
> > > > +    come from the same build of biosbits of the same version. Thin=
gs may still
> > > > +    work if they come from different versions but mixing version n=
umbers are
> > > > +    not recommended.
> > > > +    There is normally no need to regenerate this archive unless so=
me fixes or
> > > > +    changes have gone into the grub that are part of biosbits.
> > > > +
> > > > +acpi-bits/bits-tests:
> > > > +   This directory contains biosbits python based tests that are ru=
n from within
> > > > +   the biosbits environment in the spawned VM. New additions of te=
st cases can
> > > > +   be made in the appropriate test file. For example, new acpi tes=
ts can go
> > > > +   into testacpi.py and one would call testsuite.add_test() to reg=
ister the new
> > > > +   test so that it gets executed as a part of the ACPI tests.
> > > > +   It might be occassionally necessary to disable some subtests or=
 add a new
> > > > +   test that belongs to a test suite not already present in this d=
irectory. To
> > > > +   do this, please extract the bits source from the zip file menti=
oned above.
> > > > +   Copy the test suite/script that needs modification (addition of=
 new tests
> > > > +   or disabling them) from boot/python location of the extracted d=
irectory
> > > > +   into this directory.
> > > > +
> > > > +   step (a): copy unmodified test script to this directory.
> > > > +   step (b): update meson.build and add this file to the list.
> > > > +   Commit (a) and (b) together in the same commit.
> > > > +
> > > > +   step (c): perform modifications to the test.
> > > > +   Commit (c) in a separate commit.
> > > > +
> > > > +   The test framework will then use your modified test script to r=
un the test.
> > > > +   No further changes would be needed. Please check the logs to ma=
ke sure that
> > > > +   appropriate changes have taken effect.
> > > > +
> > > > +meson.build files makes sure that the bits qtests are appropriatel=
y integrated
> > > > +into the QEMU qtest framework and are run with "make check-qtest".
> > > > +Currently, the bits test is configured to run only for x86_64 arch=
itectures. Bits
> > > > +has been built only for this architecture.
> > > > +
> > > > +
> > > > +Author: Ani Sinha <ani@anisinha.ca>
> > > > +
> > > > +References:
> > > > +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentatio=
ns/867/original/bits.pdf
> > > > +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg
> > > > --
> > > > 2.25.1
> > >
>

