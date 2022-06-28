Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557A555BF55
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:05:32 +0200 (CEST)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66Dw-000732-Ia
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65Ho-0006ij-7g
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:05:24 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65Hl-0000Wa-1n
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:05:23 -0400
Received: by mail-ed1-x52a.google.com with SMTP id cf14so16163425edb.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k3IO1suix6E9B/Ol8piLEcSQDKr5DhA/VoXM/Se3upk=;
 b=mgQ3KbtPHKdPZ0h9GL/knZQ8Sy0lIDbKMmRbo4aqIUaoOqnEUyGOGTC6CmEK7U6iJJ
 6mWxmoPHLtD5HrE2Z8oYWr8WHIqR5AZMlFDuMnDhH96wOr2WHjWYdHlw07Jr+Yt7wb60
 /2UQLI+2qa3E/xjV5sfLocXzySD5lcSPt6bsc/n9TWf+U7unma6Yxu8DsKO1N+NGFHAL
 ThLiGToZmfpSUywPwhx4ejORPiLjQvN54xNFlPhMzlY3iyEelFp8vzTZjOhkTyDzfZ76
 XQXdVM+OyqdzFtrz9g7IfjliuDZqDAHAuNUbQOBFLdb2kMulJMH70HkfjbvJshaNk9qi
 FiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k3IO1suix6E9B/Ol8piLEcSQDKr5DhA/VoXM/Se3upk=;
 b=iGl1eL3D2j7UCPpUvVfVuZfDuB4ffCmW4i6/aP+Vpwk7ypZB9xvhbBPhZ0aVZUHweW
 hINMzsSJQMVGHbnmOKW0DHX5NW97aE92qs8HV8IwGB5X713+XOHNQMTQXKL4MgoC41nT
 sOu4TEZVCjSIa9fQk2YxOXnRfTBg6Lb5gRGIi359kqfcBxYm3+ViEZHifCH4C5tW0i6Z
 bB6udGkYr/nFMxN89gayohjKgOAHKssc0k+vLi6xUdI2YvXYBoicVW8qT/DKpmh+cMpk
 3Pi+Qzp26OxwextKSNtco46y8ZTjdqCKEzXwX32qC63z7RyM52C4WY6gVYnP6K8gRPDR
 kXsw==
X-Gm-Message-State: AJIora+eVi+W/JY2FefNGStBW6vMadl3R/40zijWN5eWbnw9/spQDDus
 YxnOosfoJNnLDpQcQ/KAXKONuBb2F0p3t7+5pYQTIq3l8ud2gKGv
X-Google-Smtp-Source: AGRyM1stxU64wupWMbY1RqkQRP7iojYy47B8ADQK2wxM0drJ6TeF3eoEq1Bm6wxmbHLa6T+NdjDNw2FMcFnQhCLZ934=
X-Received: by 2002:a05:6402:524d:b0:437:8d2e:c675 with SMTP id
 t13-20020a056402524d00b004378d2ec675mr13175613edd.65.1656399919173; Tue, 28
 Jun 2022 00:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220627072856.1529357-1-ani@anisinha.ca>
 <20220627072856.1529357-12-ani@anisinha.ca>
 <20220627182027-mutt-send-email-mst@kernel.org>
 <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
In-Reply-To: <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 12:35:08 +0530
Message-ID: <CAARzgwzsRZzDBUiY=-fQd4O7nD29WEvTLaeo+KQw7_k7rFeyZw@mail.gmail.com>
Subject: Re: [PATCH 11/12] acpi/tests/bits: add README file for bits qtests
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52a.google.com
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

+danPb who pointed me to the TAP stuff. Maybe he has some good ideas on thi=
s.

On Tue, Jun 28, 2022 at 12:27 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Jun 28, 2022 at 12:20 PM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> >
> > On Tue, Jun 28, 2022 at 12:06:31PM +0530, Ani Sinha wrote:
> > > On Tue, Jun 28, 2022 at 11:50 AM Michael S. Tsirkin <mst@redhat.com> =
wrote:
> > > >
> > > > On Tue, Jun 28, 2022 at 11:46:13AM +0530, Ani Sinha wrote:
> > > > > On Tue, Jun 28, 2022 at 11:36 AM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > > > > >
> > > > > > On Tue, Jun 28, 2022 at 10:27:38AM +0530, Ani Sinha wrote:
> > > > > > > On Tue, Jun 28, 2022 at 3:56 AM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Jun 27, 2022 at 12:58:55PM +0530, Ani Sinha wrote:
> > > > > > > > > The README file is added describing the directory structu=
re and the purpose
> > > > > > > > > of every file it contains. It also describes how to add n=
ew tests, make changes
> > > > > > > > > to existing tests or bits config files or regenerate the =
bits software.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > > > > ---
> > > > > > > > >  tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++=
++++++++++++++
> > > > > > > > >  1 file changed, 168 insertions(+)
> > > > > > > > >  create mode 100644 tests/qtest/acpi-bits/README
> > > > > > > > >
> > > > > > > > > diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/a=
cpi-bits/README
> > > > > > > > > new file mode 100644
> > > > > > > > > index 0000000000..97b15f1665
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/tests/qtest/acpi-bits/README
> > > > > > > > > @@ -0,0 +1,168 @@
> > > > > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > +ACPI/SMBIOS QTESTS USING BIOSBITS
> > > > > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > +
> > > > > > > > > +Biosbits is a software written by Josh Triplett that can=
 be downloaded by
> > > > > > > > > +visiting https://biosbits.org/. The github codebase can =
be found here:
> > > > > > > > > +https://github.com/biosbits/bits/tree/master. It is a so=
ftware that exercizes
> > > > > > > > > +the bios components such as acpi and smbios tables direc=
tly through acpica
> > > > > > > > > +bios interpreter (a freely available C based library wri=
tten by Intel,
> > > > > > > > > +downloadable from https://acpica.org/ and is included wi=
th biosbits) without an
> > > > > > > > > +operating system getting involved in between.
> > > > > > > > > +There are several advantages to directly testing the bio=
s in a real physical
> > > > > > > > > +machine or VM as opposed to indirectly discovering bios =
issues through the
> > > > > > > > > +operating system. For one thing, the OSes tend to hide b=
ios problems from the
> > > > > > > > > +end user. The other is that we have more control of what=
 we wanted to test
> > > > > > > > > +and how by directly using acpica interpreter on top of t=
he bios on a running
> > > > > > > > > +system. More details on the inspiration for developing b=
iosbits and its real
> > > > > > > > > +life uses can be found in (a) and (b).
> > > > > > > > > +This directory contains QEMU qtests written in python th=
at exercizes the QEMU
> > > > > > > > > +bios components using biosbits and reports test failures=
.
> > > > > > > > > +
> > > > > > > > > +These tests use python virtual environment. In debian/ub=
untu system, the tests
> > > > > > > > > +would require python3.8-venv and python3-pip packages to=
 be installed.
> > > > > > > >
> > > > > > > > Why do we mess with venv and pip? Certainly possible but
> > > > > > > > what's wrong with using distro provided packages?
> > > > > > >
> > > > > > > There are two things:
> > > > > > > (a) We are already using pip and venv for our avocado based
> > > > > > > integration tests. Look for TESTS_VENV_DIR in Makefile.includ=
e under
> > > > > > > tests.
> > > > > > > (b) the venv is primarily needed because I wanted to take adv=
antage of
> > > > > > > our rich python library that handles QEMU based machines. The=
re are
> > > > > > > python qtest libraries as well. These are well tested and use=
d with
> > > > > > > integration tests and I wanted to keep the test part of the c=
ode
> > > > > > > simple by simply reusing them. however, in order to use them,=
 we need
> > > > > > > a venv environment within which these qemu python libraries a=
re
> > > > > > > installed. Integration tests does the same thing.
> > > > > > >
> > > > > > > A note about my language of choice - python. I gave a lot of =
thoughts
> > > > > > > on this. We do not do a lot of stuff here. All we do is:
> > > > > > > (a) generate bits iso.
> > > > > > > (b) spawn a QEMU vm with the iso which then runs a bunch of t=
ests within the vm.
> > > > > > > (c) collect and analyze logs.
> > > > > > >
> > > > > > > We are not inspecting guest memory or manipulating devices or=
 pci
> > > > > > > buses. We do not need the power of C here. We need something =
that is
> > > > > > > simple to write, easy to maintain and understand and can deal=
 with
> > > > > > > things like manipulating text files and configs easily. Pytho=
n seems a
> > > > > > > better fit for the role.
> > > > > >
> > > > > > No problem with that. So that's venv. But do we need pip and pu=
lling
> > > > > > packages from the net during testing?
> > > > >
> > > > > We do that too. See requirements.txt in tests/
> > > > > Following two are downloaded:
> > > > > avocado-framework=3D=3D88.1
> > > > > pycdlib=3D=3D1.11.0
> > > > >
> > > > > Also see this line in Makefie.include:
> > > > >
> > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > > >
> > > > Right but that's avocado since it pulls lots of stuff from
> > > > the net anyway.
> > > > Are the libraries in question not packaged on major distros?
> > >
> > > Currently I only need this:
> > > https://github.com/python-tap/tappy
> > > which is the basic TAP processing library for python.
> > >
> > > It seems its only installed through pip:
> > > https://tappy.readthedocs.io/en/latest/
> > >
> > > I do not think this is packaged by default. It's such a basic library
> > > for parsing test output that maybe we can keep this somewhere within
> > > the python src tree? Not sure ...
> >
> > It's pretty small for sure. Another submodule?
>
> Unlike BITS, this one is likely going to be maintained for a while and
> will receive new releases through
> https://pypi.org/project/tap.py/
> so forking is OK but someone has to keep this updated.
>
> I am open to anything. Whatever feels right is fine to me.
>
> >
> > > >
> > > > > >
> > > > > > > >
> > > > > > > > > +
> > > > > > > > > +A brief description of the contents of this directory fo=
llows:
> > > > > > > > > +
> > > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test.py
> > > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test-venv.sh
> > > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-config
> > > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-cfg.txt
> > > > > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-tests
> > > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smbios.py
> > > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smilatency.py
> > > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 testacpi.py
> > > > > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 testcpuid.py
> > > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 prebuilt
> > > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095-grub.t=
ar.gz
> > > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095.zip
> > > > > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 README
> > > > > > > > > +=E2=94=94=E2=94=80=E2=94=80 requirements.txt
> > > > > > > > > +
> > > > > > > > > +acpi-bits:
> > > > > > > > > + - acpi-bits-test-venv.sh: This is a shell script that s=
ets up the virtual
> > > > > > > > > +   environment necessary for the actual python test scri=
pt to run. Amongst
> > > > > > > > > +   other things, it makes sure that QEMU python library =
is available within
> > > > > > > > > +   that venv so that QEMU machines can be forked. QEMU p=
ython library can be
> > > > > > > > > +   found within python/ directory in QEMU source.
> > > > > > > > > +   After setting up the virtual environment, it runs the=
 python test script
> > > > > > > > > +   from within that environment.
> > > > > > > > > +   If you want to enable verbose mode only for bits test=
 and run make check,
> > > > > > > > > +   one trick is to add V=3D1 before the call to execute =
the python script in
> > > > > > > > > +   this file.
> > > > > > > > > + - acpi-bits-test.py: This is the main python test scrip=
t that generates a
> > > > > > > > > +   biosbits iso. It then spawns a QEMU VM with it, colle=
cts the logs and reports
> > > > > > > > > +   test failures. This is the script one would be intere=
sted in if they wanted
> > > > > > > > > +   to add or change some component of the log parsing, a=
dd a new commandline to
> > > > > > > > > +   how QEMU is spawned etc. Test writers typically would=
 not need to modify
> > > > > > > > > +   this script unless they wanted to enhance or change t=
he log parsing for
> > > > > > > > > +   their tests.
> > > > > > > > > + - requirements.txt: This text file contains the depende=
nt python libraries
> > > > > > > > > +   needed for the tests to run. If a new dependent libra=
ry is needed, it would
> > > > > > > > > +   be added here as a new entry and then acpi-bits-test-=
venv.sh would install
> > > > > > > > > +   it when setting up the python virtual environment usi=
ng pip.
> > > > > > > > > + - README: This text file.
> > > > > > > > > +
> > > > > > > > > +acpi-bits/bits-config:
> > > > > > > > > +   This location contains biosbits config files that det=
ermine how the software
> > > > > > > > > +   runs the tests.
> > > > > > > > > + - bits-config.txt: this is the biosbits config file tha=
t determines what tests
> > > > > > > > > +   or actions are performed by bits. The description of =
the config options are
> > > > > > > > > +   provided in the file itself.
> > > > > > > > > +
> > > > > > > > > +acpi-bits/prebuilt:
> > > > > > > > > +   This location contains prebuilt biosbits binaries tha=
t are used to generate
> > > > > > > > > +   the bits iso file for testing.
> > > > > > > > > + - bits-2095.zip: The contents from this zip archive are=
 the main contents of
> > > > > > > > > +    the iso file that are used for testing. This binary =
zip archive also
> > > > > > > > > +    contains the full source of the bits software includ=
ing the full text of
> > > > > > > > > +    the license agreement listed here:
> > > > > > > > > +    https://github.com/biosbits/bits/blob/master/COPYING
> > > > > > > > > +    The source tarball can be found in this location in =
the zip file:
> > > > > > > > > +    boot/src/bits-2095.tar.gz
> > > > > > > > > +    The additional changes beyond those that are present=
 in the official
> > > > > > > > > +    biosbits github repository can be found here:
> > > > > > > > > +    https://github.com/ani-sinha/bits/tree/bits-qemu-log=
ging
> > > > > > > > > +
> > > > > > > > > +    Basically these changes can be categorized into the =
following:
> > > > > > > > > +    (a) changes to make sure biosbits builds with the la=
test gcc compiler
> > > > > > > > > +    (gcc 9.4).
> > > > > > > > > +    (b) upgrade of acpica to the latest version (march 2=
022).
> > > > > > > > > +    (c) send bits logs to the debug IO port at addresss =
0x403 so that isa
> > > > > > > > > +    debugcon can be used to collect the logs.
> > > > > > > > > +    (d) send a gub halt command to shutdown the VM once =
all the tests have been
> > > > > > > > > +    executed.
> > > > > > > > > +
> > > > > > > > > +    This zip file is automatically generated by the bits=
 build system. It can
> > > > > > > > > +    be found in the bits build directory and it is suffi=
xed by the bits build
> > > > > > > > > +    number.
> > > > > > > > > +    Normally, there is no need to make any alteration to=
 this zip archive
> > > > > > > > > +    unless one wanted to change the bits software itself=
 (for example to add
> > > > > > > > > +    a new config option or change actions of existing op=
tions or change the
> > > > > > > > > +    debug IO port etc). When such changes are made and a=
 new biosbits software
> > > > > > > > > +    is needed to be generated, please refresh this zip a=
rchive as well as the
> > > > > > > > > +    grub tarball at the same time. Tests will break if c=
hanges are made to bits
> > > > > > > > > +    that are incompatible with existing behavior. So car=
e must be taken to make
> > > > > > > > > +    sure that the change is compatible with existing bit=
s software as much as
> > > > > > > > > +    possible. When a new config option is introduced for=
 example, bits must
> > > > > > > > > +    be upadated here first before introducing the new co=
nfig option through
> > > > > > > > > +    a later commit.
> > > > > > > >
> > > > > > > > I don't think playing with source tarballs is a reasonable =
work environment.
> > > > > > >
> > > > > > > I agree. However, we do not do much with the source tarball. =
It is
> > > > > > > there as part of bits to satisfy the license requirement. If =
we need
> > > > > > > to manipulate any test script that is in the source file, we =
would
> > > > > > > copy it over and keep it in the bits-test directory and chang=
e it
> > > > > > > there.
> > > > > > >
> > > > > > > > Let's use submodules just like e.g. firmware does?
> > > > > > >
> > > > > > > Yes I also proposed this to Igor on IRC. We can/maybe need to=
 figure
> > > > > > > out a place to store the bits source if we think my github is=
 not the
> > > > > > > best place. However, we need the source only if/when we need =
to
> > > > > > > rebuild bits. I suspect it won't be too often if at all.
> > > > > >
> > > > > > Why not on git.qemu.org ?
> > > > >
> > > > > Sounds good to me. Do I get push access? :-)
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > + - prebuilt/bits-2095-grub.tar.gz: This tarbball contain=
s bits generated grub
> > > > > > > > > +    scripts and modules to the prebuilt directory. These=
 prebuilt grub
> > > > > > > > > +    artifacts are required in order to generate a bootab=
le bits iso file that
> > > > > > > > > +    can run tests.
> > > > > > > > > +    In order to generate this tar archive, please put th=
e following two
> > > > > > > > > +    directories that can be found in the bits build dire=
ctory in a single
> > > > > > > > > +    tar archive file named as bits-<n>-grub.tar.gz where=
 n is the version of
> > > > > > > > > +    bits that generated the archive:
> > > > > > > > > +
> > > > > > > > > +    grub-inst-x86_64-efi
> > > > > > > > > +    grub-inst
> > > > > > > > > +
> > > > > > > > > +    This version should be the same as the version numbe=
r of bits that generated
> > > > > > > > > +    bits-<n>.zip file. In other words, the two files mus=
t be in sync and should
> > > > > > > > > +    come from the same build of biosbits of the same ver=
sion. Things may still
> > > > > > > > > +    work if they come from different versions but mixing=
 version numbers are
> > > > > > > > > +    not recommended.
> > > > > > > > > +    There is normally no need to regenerate this archive=
 unless some fixes or
> > > > > > > > > +    changes have gone into the grub that are part of bio=
sbits.
> > > > > > > > > +
> > > > > > > > > +acpi-bits/bits-tests:
> > > > > > > > > +   This directory contains biosbits python based tests t=
hat are run from within
> > > > > > > > > +   the biosbits environment in the spawned VM. New addit=
ions of test cases can
> > > > > > > > > +   be made in the appropriate test file. For example, ne=
w acpi tests can go
> > > > > > > > > +   into testacpi.py and one would call testsuite.add_tes=
t() to register the new
> > > > > > > > > +   test so that it gets executed as a part of the ACPI t=
ests.
> > > > > > > > > +   It might be occassionally necessary to disable some s=
ubtests or add a new
> > > > > > > > > +   test that belongs to a test suite not already present=
 in this directory. To
> > > > > > > > > +   do this, please extract the bits source from the zip =
file mentioned above.
> > > > > > > > > +   Copy the test suite/script that needs modification (a=
ddition of new tests
> > > > > > > > > +   or disabling them) from boot/python location of the e=
xtracted directory
> > > > > > > > > +   into this directory.
> > > > > > > > > +
> > > > > > > > > +   step (a): copy unmodified test script to this directo=
ry.
> > > > > > > > > +   step (b): update meson.build and add this file to the=
 list.
> > > > > > > > > +   Commit (a) and (b) together in the same commit.
> > > > > > > > > +
> > > > > > > > > +   step (c): perform modifications to the test.
> > > > > > > > > +   Commit (c) in a separate commit.
> > > > > > > > > +
> > > > > > > > > +   The test framework will then use your modified test s=
cript to run the test.
> > > > > > > > > +   No further changes would be needed. Please check the =
logs to make sure that
> > > > > > > > > +   appropriate changes have taken effect.
> > > > > > > > > +
> > > > > > > > > +meson.build files makes sure that the bits qtests are ap=
propriately integrated
> > > > > > > > > +into the QEMU qtest framework and are run with "make che=
ck-qtest".
> > > > > > > > > +Currently, the bits test is configured to run only for x=
86_64 architectures. Bits
> > > > > > > > > +has been built only for this architecture.
> > > > > > > > > +
> > > > > > > > > +
> > > > > > > > > +Author: Ani Sinha <ani@anisinha.ca>
> > > > > > > > > +
> > > > > > > > > +References:
> > > > > > > > > +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/p=
resentations/867/original/bits.pdf
> > > > > > > > > +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg
> > > > > > > > > --
> > > > > > > > > 2.25.1
> > > > > > > >
> > > > > >
> > > >
> >

