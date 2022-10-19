Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04387604C2C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:51:37 +0200 (CEST)
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBLz-0007kf-Vz
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olBAU-00031o-7Z
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:39:42 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olBAO-0005hp-J3
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:39:41 -0400
Received: by mail-il1-x12b.google.com with SMTP id l3so8961361ilg.13
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8ceOtLzqYF78z320FBxaKdaF2ZM/YJfI4Ci5HQuS60=;
 b=WLqabIczUa0fsPLaf0JpZPjRq9ODvj9Ez5wY6ERXkAvFpGm1hrSa4e1X4tYoDBOdsb
 brgFHx7iu+EYRcZt+cl0lcpRx6s8MAJ1Qg48H3SV2w7BJ4j9fZLGqHssQeAQEf0UPOmS
 Goq0q9YJZrm+RtVTuPtMll9fGKTWJRAzMHi5I+wdfpwGdiI9MxNiq755jOpM3meLFB5h
 GZ4h4tby2bY52hEZxzC2PNZvjcTGOpNGr1xU18MvK9iRRryDzYkj1cWh9Vjqi8D/TpHJ
 HPFGwhdVbiNp2D6XdC5nJwy1UEMBUq401KFISiEkYPzsCfNYg/4WZieW2r0x6pR5qfCh
 WY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8ceOtLzqYF78z320FBxaKdaF2ZM/YJfI4Ci5HQuS60=;
 b=NvCHMguvuPISlgGCFCyTacpFuA9cuDMnldQpjZE5sPJbUCp7o+VspJa1sHVV6owk0V
 vSS/VRvB87rn9EFRePfaiRnzcg70uaftIZyhytbOOUa0Q0f3pkGjLn4Kmz8yDEhTLHiV
 Z8cSGUVaaNCp08tj5XG3d4gd9ajXQyfzOvEXC5CDwMTNeetMClayVQEfpXgyxc55YZTg
 PI0DQ1hzI7BELYawLKXBH7FSWhgktuTkTnqlJP3JAEeIV9r6fs9eMMMzTjzRlZ9g/diA
 78IZMqKgPUr5BpCM/KVY3Lqa77tSPJg+21k+HrIxITKPDYWDEdchTlby622hNnD9SF27
 TIMw==
X-Gm-Message-State: ACrzQf2HACKjsyxm6tmqjJV1xbCZ/4ANA51LzsGCudfLf7mPyXzBHzoQ
 /5p16MVcZboQHf3A8Wbz3m8nfy4t3ZkcO5SDaKAydQ==
X-Google-Smtp-Source: AMsMyM4KAvATddaBrgGbVnhsjO0nhEfVdRBp6cV/Xd7UujLTqdKYRKsnq5G3bG1GCqrG83lk2OK7Y2umpW+ok6w/IkI=
X-Received: by 2002:a92:2601:0:b0:2fc:48be:e77a with SMTP id
 n1-20020a922601000000b002fc48bee77amr6021025ile.202.1666193975477; Wed, 19
 Oct 2022 08:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-10-ani@anisinha.ca>
 <87tu3zakuc.fsf@linaro.org>
In-Reply-To: <87tu3zakuc.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 19 Oct 2022 21:09:24 +0530
Message-ID: <CAARzgwzEO0=ChisUHY0zj9Zvbzy1jB64jR7fftg2kBwWap0omg@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] acpi/tests/avocado/bits: add a README file to
 describe the test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Oct 19, 2022 at 9:04 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > Add a README file that describes the purpose of the various test files =
and gives
> > guidance to developers on where and how to make changes.
> >
> > Cc: Daniel P. Berrange" <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/avocado/acpi-bits/README | 133 +++++++++++++++++++++++++++++++++
> >  1 file changed, 133 insertions(+)
> >  create mode 100644 tests/avocado/acpi-bits/README
> >
> > diff --git a/tests/avocado/acpi-bits/README b/tests/avocado/acpi-bits/R=
EADME
> > new file mode 100644
> > index 0000000000..4945dfc1f2
> > --- /dev/null
> > +++ b/tests/avocado/acpi-bits/README
> > @@ -0,0 +1,133 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +ACPI/SMBIOS AVOCADO TESTS USING BIOSBITS
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +
> > +Biosbits is a software written by Josh Triplett that can be downloaded
> > +from https://biosbits.org/. The github codebase can be found here:
> > +https://github.com/biosbits/bits/tree/master. It is a software that ex=
ecutes
> > +the bios components such as acpi and smbios tables directly through ac=
pica
> > +bios interpreter (a freely available C based library written by Intel,
> > +downloadable from https://acpica.org/ and is included with biosbits) w=
ithout an
> > +operating system getting involved in between.
> > +There are several advantages to directly testing the bios in a real ph=
ysical
> > +machine or VM as opposed to indirectly discovering bios issues through=
 the
> > +operating system. For one thing, the OSes tend to hide bios problems f=
rom the
> > +end user. The other is that we have more control of what we wanted to =
test
> > +and how by directly using acpica interpreter on top of the bios on a r=
unning
> > +system. More details on the inspiration for developing biosbits and it=
s real
> > +life uses can be found in (a) and (b).
> > +This directory contains tests written in python using avocado framewor=
k that
> > +exercizes the QEMU bios components using biosbits and reports test fai=
lures.
> > +For QEMU, we maintain a fork of bios bits in gitlab along with all the
> > +dependent submodules:
> > +https://gitlab.com/qemu-project/biosbits-bits
> > +This fork contains numerous fixes, a newer acpica and changes specific=
 to
> > +running this avocado QEMU tests using bits. The author of this documen=
t
> > +is the sole maintainer of the QEMU fork of bios bits repo.
> > +
> > +Under the directory tests/avocado/, acpi-bits.py is a QEMU avocado tes=
t that
> > +drives all this.
> > +
> > +A brief description of the various test files follows.
> > +
> > +Under tests/avocado/ as the root we have:
> > +
> > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits
> > +=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-config
> > +=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 bits-cfg.txt
> > +=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-tests
> > +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> > +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smilatency.py2
> > +=E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> > +=E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
> > +=E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README
> > +=E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py
> > +
> > +tests/avocado:
> > + - acpi-bits.py: This is the main python avocado test script that gene=
rates a
> > +   biosbits iso. It then spawns a QEMU VM with it, collects the log an=
d reports
> > +   test failures. This is the script one would be interested in if the=
y wanted
> > +   to add or change some component of the log parsing, add a new comma=
nd line
> > +   to alter how QEMU is spawned etc. Test writers typically would not =
need to
> > +   modify this script unless they wanted to enhance or change the log =
parsing
> > +   for their tests. Following environment variables are used in this t=
est:
> > +     - V=3D1 : This enables verbose mode for the test. It dumps the en=
tire log
> > +       from bios bits and also more details in case failure happens. I=
t is
> > +       useful for debugging the test failures or tests themselves.
> > +
> > +   In order to run this test, please perform the following steps from =
the QEMU
> > +   build directory:
> > +
> > +   $ make check-venv (needed only the first time to create the venv)
> > +   $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > +
> > +   The above will run all acpi avocado tests including this one.
> > +   In order to run the individual tests, perform the following:
> > +
> > +   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
> > +
> > +   The above will produce output in tap format. You can omit "--tap -"=
 in the
> > +   end and it will produce output like the following:
> > +
> > +   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
> > +     Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_=
acpi_smbios_bits
> > +     JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
> > +     JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17=
.58-eab2257/job.log
> > +     (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bi=
ts: PASS (33.09 s)
> > +     RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERR=
UPT 0 | CANCEL 0
> > +     JOB TIME   : 39.22 s
> > +
> > +   You can inspect the log file for more information about the run or =
in order
> > +   to diagnoze issues. If you pass V=3D1 in the environment, more diag=
nostic logs
> > +   would be found in the test log.
> > +
> > +tests/avocado/acpi-bits:
> > + - README: This text file.
> > +
> > +tests/avocado/acpi-bits/bits-config:
> > +   This location contains biosbits config files that determine how the=
 software
> > +   runs the tests.
> > + - bits-config.txt: this is the biosbits config file that determines w=
hat tests
> > +   or actions are performed by bits. The description of the config opt=
ions are
> > +   provided in the file itself.
> > +
> > +tests/avocado/acpi-bits/bits-tests:
> > +   This directory contains biosbits python based tests that are run fr=
om within
> > +   the biosbits environment in the spawned VM. New additions of test c=
ases can
> > +   be made in the appropriate test file. For example, new acpi tests c=
an go
> > +   into testacpi.py2 and one would call testsuite.add_test() to regist=
er the new
> > +   test so that it gets executed as a part of the ACPI tests.
> > +   It might be occasionally necessary to disable some subtests or add =
a new
> > +   test that belongs to a test suite not already present in this direc=
tory. To
> > +   do this, please clone the bits source from
> > +   https://gitlab.com/qemu-project/biosbits-bits/-/tree/qemu-bits.
> > +   Note that this is the "qemu-bits" branch and not the "bits" branch =
of the
> > +   repository. "qemu-bits" is the branch where we have made all the QE=
MU
> > +   specific enhancements and we must use the source from this branch o=
nly.
> > +   Copy the test suite/script that needs modification (addition of new=
 tests
> > +   or disabling them) from python directory into this directory. For
> > +   example, in order to change cpuid related tests, copy the following
> > +   file into this directory and rename it with .py2 extension:
> > +   https://gitlab.com/qemu-project/biosbits-bits/-/blob/qemu-bits/pyth=
on/testcpuid.py
> > +   Then make your additions and changes here. Hence, the steps are:
> > +
> > +   step (a): copy unmodified test script to this directory from bits s=
ource.
> > +   step (b): perform modifications to the test.
> > +   Commit (a) and (b) should go under separate commits so that the ori=
ginal
> > +   test script and the changes we have made are separated and clear.
> > +
> > +   The test framework will then use your modified test script to run t=
he test.
> > +   No further changes would be needed. Please check the logs to make s=
ure that
> > +   appropriate changes have taken effect.
> > +
> > +   The tests have an extension .py2 in order to indicate that
> > +   (a) they are python2.7 based scripts and not python 3 scripts.
> > +   (b) they are run from within the bios bits VM and is not subjected =
to QEMU
> > +       build/test python script maintainance and dependency resolution=
s.
> > +   (c) They need not be loaded by avocado framework when running tests=
.
> > +
> > +Author: Ani Sinha <ani@anisinha.ca>
> > +
> > +References:
> > +(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/8=
67/original/bits.pdf
> > +(b) https://www.youtube.com/watch?v=3D36QIepyUuhg
>
> This might me better as an RST under docs/devel so it can be included in
> the growing developer guide.

Ok if there are no objects from others, will move it there. Sounds
like a better idea.

