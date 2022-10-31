Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD07061301B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 07:04:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNsB-0000PZ-Fk; Mon, 31 Oct 2022 02:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opNs7-0000Ng-Pr
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:02:07 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1opNs5-00021z-91
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:02:07 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id n18so7791200qvt.11
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 23:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TNBpjJ6svM1bO7ovkivFXkhXo6hUP96vV521Ubudus=;
 b=pfZ3jJARoOQJl70VB00AsiJGMOHx85Tel+tVVc4r+ePmYnfvw0EdVbAvH/VzEf1Le6
 JH2eLtpGpC0QK1JIR+GLH72B1ghxihuJurBYqQobmy1LNhA5QDiXO07kehNqEyroBxcd
 z/++XSoSkOPa2Vp0Odyi/Hi8c2vSdskpxmxNBO4f4Er6ig41I9Ob/q1MjYF1d96mUOUn
 lAeVDkjay31Un1S6f4BCHdnT3S3+7QjL3PkrkRZ0WYB/VW6ianHtoOBe9gYuHuulBYrg
 39KrVWiYaVLjyEUjd6c/KU9mWJSiBp66Tdg/RaDiaAmpQpG6bT+N5Y49nedVNqmDjJUc
 2SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1TNBpjJ6svM1bO7ovkivFXkhXo6hUP96vV521Ubudus=;
 b=WakbopRkMoNDBpAQJv/uLjQLUBc5UaS/dDChccXtjMIk2lzsRrkL3pwJ2YViG1XBW2
 M26lmfh0SKi1l3Vv/y/s3PoyrYm91Tlyh0UYiDw1BF99X1zaKZ5PnIbOSqhavYtcrdTv
 3lggd554kWUDzKfmwXuFv7Xwp1t60ZQNz1+PoRTqn4BVE41eFHpaFq3nDl6Y5LpdozDv
 BbzkRPO7gq13rRBuinMq3QwRZeH1OhtZgTr+jOYWA0YHDEPQadwfi+BlvDPusNTgNlk2
 6oh/DLI2hJirPl3YfTBdLZcF2rhIcuico8GTRlFNTRN7PeBsFIEe6Z4jf7zIQpLlkgB9
 JzIg==
X-Gm-Message-State: ACrzQf0gtHuOhEamxCy4cJ3nJhzeK86XDCOYpn6EWvcOHp7/zOR3a6VP
 GvWeD4KcbdqxbHHUllWq5dtLA+7U23m52B5i+mcJUA==
X-Google-Smtp-Source: AMsMyM6f3+wnpOeApuLzIRbKZz0MkkpRas3tb0MgqhM564aJ2Mpnp/kzHhfqTFe5UO4H1ORtihAi+PAOo0G3yj4/Peg=
X-Received: by 2002:a0c:9a02:0:b0:4b8:256d:c821 with SMTP id
 p2-20020a0c9a02000000b004b8256dc821mr9758023qvd.71.1667196123703; Sun, 30 Oct
 2022 23:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221021095108.104843-1-ani@anisinha.ca>
 <20221021095108.104843-7-ani@anisinha.ca>
In-Reply-To: <20221021095108.104843-7-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 31 Oct 2022 11:31:52 +0530
Message-ID: <CAARzgwyQFAFV+rWVKtUTYZHCqCqbLD29tfAppnt_dPcKm=066g@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] acpi/tests/avocado/bits/doc: add a doc file to
 describe the acpi bits test
To: Ani Sinha <ani@anisinha.ca>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 3:32 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> A doc file is added under docs/devel that describes the purpose of the va=
rious
> test files and gives guidance to developers on where and how to make chan=
ges.
>
> Cc: Daniel P. Berrange" <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Michael, you forgot to apply this patch to your tree. You have applied
the rest.

> ---
>  docs/devel/acpi-bits.rst   | 145 +++++++++++++++++++++++++++++++++++++
>  docs/devel/index-build.rst |   1 +
>  2 files changed, 146 insertions(+)
>  create mode 100644 docs/devel/acpi-bits.rst
>
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> new file mode 100644
> index 0000000000..c9564d871a
> --- /dev/null
> +++ b/docs/devel/acpi-bits.rst
> @@ -0,0 +1,145 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +ACPI/SMBIOS avocado tests using biosbits
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Biosbits is a software written by Josh Triplett that can be downloaded
> +from https://biosbits.org/. The github codebase can be found
> +`here <https://github.com/biosbits/bits/tree/master>`__. It is a softwar=
e that executes
> +the bios components such as acpi and smbios tables directly through acpi=
ca
> +bios interpreter (a freely available C based library written by Intel,
> +downloadable from https://acpica.org/ and is included with biosbits) wit=
hout an
> +operating system getting involved in between.
> +There are several advantages to directly testing the bios in a real phys=
ical
> +machine or VM as opposed to indirectly discovering bios issues through t=
he
> +operating system. For one thing, the OSes tend to hide bios problems fro=
m the
> +end user. The other is that we have more control of what we wanted to te=
st
> +and how by directly using acpica interpreter on top of the bios on a run=
ning
> +system. More details on the inspiration for developing biosbits and its =
real
> +life uses can be found in [#a]_ and [#b]_.
> +This directory contains tests written in python using avocado framework =
that
> +exercises the QEMU bios components using biosbits and reports test failu=
res.
> +For QEMU, we maintain a fork of bios bits in gitlab along with all the
> +dependent submodules:
> +https://gitlab.com/qemu-project/biosbits-bits
> +This fork contains numerous fixes, a newer acpica and changes specific t=
o
> +running this avocado QEMU tests using bits. The author of this document
> +is the sole maintainer of the QEMU fork of bios bits repo.
> +
> +Under the directory ``tests/avocado/``, ``acpi-bits.py`` is a QEMU avoca=
do
> +test that drives all this.
> +
> +A brief description of the various test files follows.
> +
> +Under ``tests/avocado/`` as the root we have:
> +
> +::
> +
> +   =E2=94=9C=E2=94=80=E2=94=80 acpi-bits
> +   =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-config
> +   =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 bits-cfg.txt
> +   =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 bits-tests
> +   =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 smbios.py2
> +   =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 testacpi.py2
> +   =E2=94=82 =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 testcpuid.py2
> +   =E2=94=82 =E2=94=94=E2=94=80=E2=94=80 README
> +   =E2=94=9C=E2=94=80=E2=94=80 acpi-bits.py
> +
> +* ``tests/avocado``:
> +
> +   ``acpi-bits.py``:
> +   This is the main python avocado test script that generates a
> +   biosbits iso. It then spawns a QEMU VM with it, collects the log and =
reports
> +   test failures. This is the script one would be interested in if they =
wanted
> +   to add or change some component of the log parsing, add a new command=
 line
> +   to alter how QEMU is spawned etc. Test writers typically would not ne=
ed to
> +   modify this script unless they wanted to enhance or change the log pa=
rsing
> +   for their tests. In order to enable debugging, you can set **V=3D1**
> +   environment variable. This enables verbose mode for the test and also=
 dumps
> +   the entire log from bios bits and more information in case failure ha=
ppens.
> +
> +   In order to run this test, please perform the following steps from th=
e QEMU
> +   build directory:
> +   ::
> +
> +     $ make check-venv (needed only the first time to create the venv)
> +     $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> +
> +   The above will run all acpi avocado tests including this one.
> +   In order to run the individual tests, perform the following:
> +   ::
> +
> +     $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
> +
> +   The above will produce output in tap format. You can omit "--tap -" i=
n the
> +   end and it will produce output like the following:
> +   ::
> +
> +      $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
> +      Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_a=
cpi_smbios_bits
> +      JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
> +      JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17.=
58-eab2257/job.log
> +      (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bit=
s: PASS (33.09 s)
> +      RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRU=
PT 0 | CANCEL 0
> +      JOB TIME   : 39.22 s
> +
> +   You can inspect the log file for more information about the run or in=
 order
> +   to diagnoze issues. If you pass V=3D1 in the environment, more diagno=
stic logs
> +   would be found in the test log.
> +
> +* ``tests/avocado/acpi-bits/bits-config``:
> +
> +   This location contains biosbits configuration files that determine ho=
w the
> +   software runs the tests.
> +
> +   ``bits-config.txt``:
> +   This is the biosbits config file that determines what tests
> +   or actions are performed by bits. The description of the config optio=
ns are
> +   provided in the file itself.
> +
> +* ``tests/avocado/acpi-bits/bits-tests``:
> +
> +   This directory contains biosbits python based tests that are run from=
 within
> +   the biosbits environment in the spawned VM. New additions of test cas=
es can
> +   be made in the appropriate test file. For example, new acpi tests can=
 go
> +   into testacpi.py2 and one would call testsuite.add_test() to register=
 the new
> +   test so that it gets executed as a part of the ACPI tests.
> +   It might be occasionally necessary to disable some subtests or add a =
new
> +   test that belongs to a test suite not already present in this directo=
ry. To
> +   do this, please clone the bits source from
> +   https://gitlab.com/qemu-project/biosbits-bits/-/tree/qemu-bits.
> +   Note that this is the "qemu-bits" branch and not the "bits" branch of=
 the
> +   repository. "qemu-bits" is the branch where we have made all the QEMU
> +   specific enhancements and we must use the source from this branch onl=
y.
> +   Copy the test suite/script that needs modification (addition of new t=
ests
> +   or disabling them) from python directory into this directory. For
> +   example, in order to change cpuid related tests, copy the following
> +   file into this directory and rename it with .py2 extension:
> +   https://gitlab.com/qemu-project/biosbits-bits/-/blob/qemu-bits/python=
/testcpuid.py
> +   Then make your additions and changes here. Therefore, the steps are:
> +
> +       (a) Copy unmodified test script to this directory from bits sourc=
e.
> +       (b) Add a SPDX license header.
> +       (c) Perform modifications to the test.
> +
> +   Commits (a), (b) and (c) should go under separate commits so that the=
 original
> +   test script and the changes we have made are separated and clear.
> +
> +   The test framework will then use your modified test script to run the=
 test.
> +   No further changes would be needed. Please check the logs to make sur=
e that
> +   appropriate changes have taken effect.
> +
> +   The tests have an extension .py2 in order to indicate that:
> +
> +   (a) They are python2.7 based scripts and not python 3 scripts.
> +   (b) They are run from within the bios bits VM and is not subjected to=
 QEMU
> +       build/test python script maintainance and dependency resolutions.
> +   (c) They need not be loaded by avocado framework when running tests.
> +
> +
> +Author: Ani Sinha <ani@anisinha.ca>
> +
> +References:
> +-----------
> +.. [#a] https://blog.linuxplumbersconf.org/2011/ocw/system/presentations=
/867/original/bits.pdf
> +.. [#b] https://www.youtube.com/watch?v=3D36QIepyUuhg
> +
> diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
> index 1002a533a6..57e8d39d98 100644
> --- a/docs/devel/index-build.rst
> +++ b/docs/devel/index-build.rst
> @@ -11,6 +11,7 @@ the basics if you are adding new files and targets to t=
he build.
>     build-system
>     kconfig
>     testing
> +   acpi-bits
>     qtest
>     ci
>     qapi-code-gen
> --
> 2.34.1
>

