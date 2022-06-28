Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C755BF46
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:57:24 +0200 (CEST)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6667-0003Xj-HU
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65Aq-0006ol-V9
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:58:13 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o65An-0007p4-8B
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 02:58:12 -0400
Received: by mail-ej1-x62b.google.com with SMTP id fi2so23691545ejb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 23:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ARMipQbJAc49kSdLVPlwv+9XLhHDTyvwItHQ+CJF0co=;
 b=CJ31uAol379ZjJ9H9zvLb0IBm6QHtLWVOTnmIe8K90DxoMyoIZprjZlxFLJZArh8S4
 9NlPkUfLfXn0U1vUrg/a8dHvObvjqD4CaSWUH70+UlYELc6iar4VbAVDe/nxf9G/Lhb/
 D6sy0PQ4D7RevVS/ZcqlcGL6/d/4V6Ct5Kz+qBsebmlj1HMRqueldEPVwgJZwNRZN1fE
 ZVSfXcwBGiozOpEu9JR7H/BuNgPSci7jDroBFeYBUNSSYEgVm+W7mNYZjummlrbDcUmX
 E2sA6Y1hUNRcUXTfkg1S00JJTOA1xN1+mxFuVnvd/9OimjxDJfjfD8wlHL8sat/eZ480
 bNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ARMipQbJAc49kSdLVPlwv+9XLhHDTyvwItHQ+CJF0co=;
 b=4+Mm0ojKHC5P+gu8+EdM/n7i7+F3z5QUk2c+Kshtw6zuN/nnkFWDBj9ViXqZMSP1CL
 IE7uSdDWq58204d/QAfFHL3F0XaCawwJxAnZD14ghks2ajnZY1djkcyd39kTdlYUirsC
 3nRStkBfjUwwfqiNbsM5wMXRkK32OQOArEM06cvXQl8BlWas7i0AK30Kr9CSF+HaM0Z/
 4gGaprJzbCeOxTEkKGvlcgtFE2z4brpRkAWPBYwp5dkfDmAvTx303Khb9DKtR2JPsjHD
 eOkE92jYSkq/8M6HRUY7C+npvOKvOFtTKeky02JXUVJr5UG6GvwkAPBrw4Mv8VO82fWD
 p0QQ==
X-Gm-Message-State: AJIora9d6cVULyFqz7ZWtEG7tswgZff6bso3239AzybMT5gie7JP8loV
 G3lDXUxQpMFtuSrrNsBq0Q9LYemTdKWVxspdAhQk4g==
X-Google-Smtp-Source: AGRyM1tHgBAsSqK1Yf4kyPtSqGL4vEy71nLBzZRQ/zgA07u5j/tvERkRAHXmjhpnTu9gZshM4fRMADVLYdnSGMCMayU=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr16595992ejc.64.1656399486277; Mon, 27
 Jun 2022 23:58:06 -0700 (PDT)
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
In-Reply-To: <20220628024810-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 12:27:55 +0530
Message-ID: <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
Subject: Re: [PATCH 11/12] acpi/tests/bits: add README file for bits qtests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62b.google.com
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

On Tue, Jun 28, 2022 at 12:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 28, 2022 at 12:06:31PM +0530, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 11:50 AM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> > >
> > > On Tue, Jun 28, 2022 at 11:46:13AM +0530, Ani Sinha wrote:
> > > > On Tue, Jun 28, 2022 at 11:36 AM Michael S. Tsirkin <mst@redhat.com=
> wrote:
> > > > >
> > > > > On Tue, Jun 28, 2022 at 10:27:38AM +0530, Ani Sinha wrote:
> > > > > > On Tue, Jun 28, 2022 at 3:56 AM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > > > > > >
> > > > > > > On Mon, Jun 27, 2022 at 12:58:55PM +0530, Ani Sinha wrote:
> > > > > > > > The README file is added describing the directory structure=
 and the purpose
> > > > > > > > of every file it contains. It also describes how to add new=
 tests, make changes
> > > > > > > > to existing tests or bits config files or regenerate the bi=
ts software.
> > > > > > > >
> > > > > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > > > > ---
> > > > > > > >  tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++++=
++++++++++++
> > > > > > > >  1 file changed, 168 insertions(+)
> > > > > > > >  create mode 100644 tests/qtest/acpi-bits/README
> > > > > > > >
> > > > > > > > diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/acp=
i-bits/README
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000..97b15f1665
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/tests/qtest/acpi-bits/README
> > > > > > > > @@ -0,0 +1,168 @@
> > > > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > +ACPI/SMBIOS QTESTS USING BIOSBITS
> > > > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > +
> > > > > > > > +Biosbits is a software written by Josh Triplett that can b=
e downloaded by
> > > > > > > > +visiting https://biosbits.org/. The github codebase can be=
 found here:
> > > > > > > > +https://github.com/biosbits/bits/tree/master. It is a soft=
ware that exercizes
> > > > > > > > +the bios components such as acpi and smbios tables directl=
y through acpica
> > > > > > > > +bios interpreter (a freely available C based library writt=
en by Intel,
> > > > > > > > +downloadable from https://acpica.org/ and is included with=
 biosbits) without an
> > > > > > > > +operating system getting involved in between.
> > > > > > > > +There are several advantages to directly testing the bios =
in a real physical
> > > > > > > > +machine or VM as opposed to indirectly discovering bios is=
sues through the
> > > > > > > > +operating system. For one thing, the OSes tend to hide bio=
s problems from the
> > > > > > > > +end user. The other is that we have more control of what w=
e wanted to test
> > > > > > > > +and how by directly using acpica interpreter on top of the=
 bios on a running
> > > > > > > > +system. More details on the inspiration for developing bio=
sbits and its real
> > > > > > > > +life uses can be found in (a) and (b).
> > > > > > > > +This directory contains QEMU qtests written in python that=
 exercizes the QEMU
> > > > > > > > +bios components using biosbits and reports test failures.
> > > > > > > > +
> > > > > > > > +These tests use python virtual environment. In debian/ubun=
tu system, the tests
> > > > > > > > +would require python3.8-venv and python3-pip packages to b=
e installed.
> > > > > > >
> > > > > > > Why do we mess with venv and pip? Certainly possible but
> > > > > > > what's wrong with using distro provided packages?
> > > > > >
> > > > > > There are two things:
> > > > > > (a) We are already using pip and venv for our avocado based
> > > > > > integration tests. Look for TESTS_VENV_DIR in Makefile.include =
under
> > > > > > tests.
> > > > > > (b) the venv is primarily needed because I wanted to take advan=
tage of
> > > > > > our rich python library that handles QEMU based machines. There=
 are
> > > > > > python qtest libraries as well. These are well tested and used =
with
> > > > > > integration tests and I wanted to keep the test part of the cod=
e
> > > > > > simple by simply reusing them. however, in order to use them, w=
e need
> > > > > > a venv environment within which these qemu python libraries are
> > > > > > installed. Integration tests does the same thing.
> > > > > >
> > > > > > A note about my language of choice - python. I gave a lot of th=
oughts
> > > > > > on this. We do not do a lot of stuff here. All we do is:
> > > > > > (a) generate bits iso.
> > > > > > (b) spawn a QEMU vm with the iso which then runs a bunch of tes=
ts within the vm.
> > > > > > (c) collect and analyze logs.
> > > > > >
> > > > > > We are not inspecting guest memory or manipulating devices or p=
ci
> > > > > > buses. We do not need the power of C here. We need something th=
at is
> > > > > > simple to write, easy to maintain and understand and can deal w=
ith
> > > > > > things like manipulating text files and configs easily. Python =
seems a
> > > > > > better fit for the role.
> > > > >
> > > > > No problem with that. So that's venv. But do we need pip and pull=
ing
> > > > > packages from the net during testing?
> > > >
> > > > We do that too. See requirements.txt in tests/
> > > > Following two are downloaded:
> > > > avocado-framework=3D=3D88.1
> > > > pycdlib=3D=3D1.11.0
> > > >
> > > > Also see this line in Makefie.include:
> > > >
> > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > >
> > > Right but that's avocado since it pulls lots of stuff from
> > > the net anyway.
> > > Are the libraries in question not packaged on major distros?
> >
> > Currently I only need this:
> > https://github.com/python-tap/tappy
> > which is the basic TAP processing library for python.
> >
> > It seems its only installed through pip:
> > https://tappy.readthedocs.io/en/latest/
> >
> > I do not think this is packaged by default. It's such a basic library
> > for parsing test output that maybe we can keep this somewhere within
> > the python src tree? Not sure ...
>
> It's pretty small for sure. Another submodule?

Unlike BITS, this one is likely going to be maintained for a while and
will receive new releases through
https://pypi.org/project/tap.py/
so forking is OK but someone has to keep this updated.

I am open to anything. Whatever feels right is fine to me.

>
> > >
> > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +A brief description of the contents of this directory foll=
ows:
> > > > > > > > +
> > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test.py
> > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits-test-venv.sh
> > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-config
> > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-cfg.txt
> > > > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 bits-tests
> > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smbios.py
> > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 smilatency.py
> > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 testacpi.py
> > > > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 testcpuid.py
> > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 meson.build
> > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 prebuilt
> > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095-grub.tar=
.gz
> > > > > > > > +=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bits-2095.zip
> > > > > > > > +=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 meson.build
> > > > > > > > +=E2=94=9C=E2=94=80=E2=94=80 README
> > > > > > > > +=E2=94=94=E2=94=80=E2=94=80 requirements.txt
> > > > > > > > +
> > > > > > > > +acpi-bits:
> > > > > > > > + - acpi-bits-test-venv.sh: This is a shell script that set=
s up the virtual
> > > > > > > > +   environment necessary for the actual python test script=
 to run. Amongst
> > > > > > > > +   other things, it makes sure that QEMU python library is=
 available within
> > > > > > > > +   that venv so that QEMU machines can be forked. QEMU pyt=
hon library can be
> > > > > > > > +   found within python/ directory in QEMU source.
> > > > > > > > +   After setting up the virtual environment, it runs the p=
ython test script
> > > > > > > > +   from within that environment.
> > > > > > > > +   If you want to enable verbose mode only for bits test a=
nd run make check,
> > > > > > > > +   one trick is to add V=3D1 before the call to execute th=
e python script in
> > > > > > > > +   this file.
> > > > > > > > + - acpi-bits-test.py: This is the main python test script =
that generates a
> > > > > > > > +   biosbits iso. It then spawns a QEMU VM with it, collect=
s the logs and reports
> > > > > > > > +   test failures. This is the script one would be interest=
ed in if they wanted
> > > > > > > > +   to add or change some component of the log parsing, add=
 a new commandline to
> > > > > > > > +   how QEMU is spawned etc. Test writers typically would n=
ot need to modify
> > > > > > > > +   this script unless they wanted to enhance or change the=
 log parsing for
> > > > > > > > +   their tests.
> > > > > > > > + - requirements.txt: This text file contains the dependent=
 python libraries
> > > > > > > > +   needed for the tests to run. If a new dependent library=
 is needed, it would
> > > > > > > > +   be added here as a new entry and then acpi-bits-test-ve=
nv.sh would install
> > > > > > > > +   it when setting up the python virtual environment using=
 pip.
> > > > > > > > + - README: This text file.
> > > > > > > > +
> > > > > > > > +acpi-bits/bits-config:
> > > > > > > > +   This location contains biosbits config files that deter=
mine how the software
> > > > > > > > +   runs the tests.
> > > > > > > > + - bits-config.txt: this is the biosbits config file that =
determines what tests
> > > > > > > > +   or actions are performed by bits. The description of th=
e config options are
> > > > > > > > +   provided in the file itself.
> > > > > > > > +
> > > > > > > > +acpi-bits/prebuilt:
> > > > > > > > +   This location contains prebuilt biosbits binaries that =
are used to generate
> > > > > > > > +   the bits iso file for testing.
> > > > > > > > + - bits-2095.zip: The contents from this zip archive are t=
he main contents of
> > > > > > > > +    the iso file that are used for testing. This binary zi=
p archive also
> > > > > > > > +    contains the full source of the bits software includin=
g the full text of
> > > > > > > > +    the license agreement listed here:
> > > > > > > > +    https://github.com/biosbits/bits/blob/master/COPYING
> > > > > > > > +    The source tarball can be found in this location in th=
e zip file:
> > > > > > > > +    boot/src/bits-2095.tar.gz
> > > > > > > > +    The additional changes beyond those that are present i=
n the official
> > > > > > > > +    biosbits github repository can be found here:
> > > > > > > > +    https://github.com/ani-sinha/bits/tree/bits-qemu-loggi=
ng
> > > > > > > > +
> > > > > > > > +    Basically these changes can be categorized into the fo=
llowing:
> > > > > > > > +    (a) changes to make sure biosbits builds with the late=
st gcc compiler
> > > > > > > > +    (gcc 9.4).
> > > > > > > > +    (b) upgrade of acpica to the latest version (march 202=
2).
> > > > > > > > +    (c) send bits logs to the debug IO port at addresss 0x=
403 so that isa
> > > > > > > > +    debugcon can be used to collect the logs.
> > > > > > > > +    (d) send a gub halt command to shutdown the VM once al=
l the tests have been
> > > > > > > > +    executed.
> > > > > > > > +
> > > > > > > > +    This zip file is automatically generated by the bits b=
uild system. It can
> > > > > > > > +    be found in the bits build directory and it is suffixe=
d by the bits build
> > > > > > > > +    number.
> > > > > > > > +    Normally, there is no need to make any alteration to t=
his zip archive
> > > > > > > > +    unless one wanted to change the bits software itself (=
for example to add
> > > > > > > > +    a new config option or change actions of existing opti=
ons or change the
> > > > > > > > +    debug IO port etc). When such changes are made and a n=
ew biosbits software
> > > > > > > > +    is needed to be generated, please refresh this zip arc=
hive as well as the
> > > > > > > > +    grub tarball at the same time. Tests will break if cha=
nges are made to bits
> > > > > > > > +    that are incompatible with existing behavior. So care =
must be taken to make
> > > > > > > > +    sure that the change is compatible with existing bits =
software as much as
> > > > > > > > +    possible. When a new config option is introduced for e=
xample, bits must
> > > > > > > > +    be upadated here first before introducing the new conf=
ig option through
> > > > > > > > +    a later commit.
> > > > > > >
> > > > > > > I don't think playing with source tarballs is a reasonable wo=
rk environment.
> > > > > >
> > > > > > I agree. However, we do not do much with the source tarball. It=
 is
> > > > > > there as part of bits to satisfy the license requirement. If we=
 need
> > > > > > to manipulate any test script that is in the source file, we wo=
uld
> > > > > > copy it over and keep it in the bits-test directory and change =
it
> > > > > > there.
> > > > > >
> > > > > > > Let's use submodules just like e.g. firmware does?
> > > > > >
> > > > > > Yes I also proposed this to Igor on IRC. We can/maybe need to f=
igure
> > > > > > out a place to store the bits source if we think my github is n=
ot the
> > > > > > best place. However, we need the source only if/when we need to
> > > > > > rebuild bits. I suspect it won't be too often if at all.
> > > > >
> > > > > Why not on git.qemu.org ?
> > > >
> > > > Sounds good to me. Do I get push access? :-)
> > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > + - prebuilt/bits-2095-grub.tar.gz: This tarbball contains =
bits generated grub
> > > > > > > > +    scripts and modules to the prebuilt directory. These p=
rebuilt grub
> > > > > > > > +    artifacts are required in order to generate a bootable=
 bits iso file that
> > > > > > > > +    can run tests.
> > > > > > > > +    In order to generate this tar archive, please put the =
following two
> > > > > > > > +    directories that can be found in the bits build direct=
ory in a single
> > > > > > > > +    tar archive file named as bits-<n>-grub.tar.gz where n=
 is the version of
> > > > > > > > +    bits that generated the archive:
> > > > > > > > +
> > > > > > > > +    grub-inst-x86_64-efi
> > > > > > > > +    grub-inst
> > > > > > > > +
> > > > > > > > +    This version should be the same as the version number =
of bits that generated
> > > > > > > > +    bits-<n>.zip file. In other words, the two files must =
be in sync and should
> > > > > > > > +    come from the same build of biosbits of the same versi=
on. Things may still
> > > > > > > > +    work if they come from different versions but mixing v=
ersion numbers are
> > > > > > > > +    not recommended.
> > > > > > > > +    There is normally no need to regenerate this archive u=
nless some fixes or
> > > > > > > > +    changes have gone into the grub that are part of biosb=
its.
> > > > > > > > +
> > > > > > > > +acpi-bits/bits-tests:
> > > > > > > > +   This directory contains biosbits python based tests tha=
t are run from within
> > > > > > > > +   the biosbits environment in the spawned VM. New additio=
ns of test cases can
> > > > > > > > +   be made in the appropriate test file. For example, new =
acpi tests can go
> > > > > > > > +   into testacpi.py and one would call testsuite.add_test(=
) to register the new
> > > > > > > > +   test so that it gets executed as a part of the ACPI tes=
ts.
> > > > > > > > +   It might be occassionally necessary to disable some sub=
tests or add a new
> > > > > > > > +   test that belongs to a test suite not already present i=
n this directory. To
> > > > > > > > +   do this, please extract the bits source from the zip fi=
le mentioned above.
> > > > > > > > +   Copy the test suite/script that needs modification (add=
ition of new tests
> > > > > > > > +   or disabling them) from boot/python location of the ext=
racted directory
> > > > > > > > +   into this directory.
> > > > > > > > +
> > > > > > > > +   step (a): copy unmodified test script to this directory=
.
> > > > > > > > +   step (b): update meson.build and add this file to the l=
ist.
> > > > > > > > +   Commit (a) and (b) together in the same commit.
> > > > > > > > +
> > > > > > > > +   step (c): perform modifications to the test.
> > > > > > > > +   Commit (c) in a separate commit.
> > > > > > > > +
> > > > > > > > +   The test framework will then use your modified test scr=
ipt to run the test.
> > > > > > > > +   No further changes would be needed. Please check the lo=
gs to make sure that
> > > > > > > > +   appropriate changes have taken effect.
> > > > > > > > +
> > > > > > > > +meson.build files makes sure that the bits qtests are appr=
opriately integrated
> > > > > > > > +into the QEMU qtest framework and are run with "make check=
-qtest".
> > > > > > > > +Currently, the bits test is configured to run only for x86=
_64 architectures. Bits
> > > > > > > > +has been built only for this architecture.
> > > > > > > > +
> > > > > > > > +
> > > > > > > > +Author: Ani Sinha <ani@anisinha.ca>
> > > > > > > > +
> > > > > > > > +References:
> > > > > > > > +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/pre=
sentations/867/original/bits.pdf
> > > > > > > > +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg
> > > > > > > > --
> > > > > > > > 2.25.1
> > > > > > >
> > > > >
> > >
>

