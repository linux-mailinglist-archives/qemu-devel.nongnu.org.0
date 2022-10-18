Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B2F603051
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:55:56 +0200 (CEST)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okowd-0003mR-A6
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okobm-00041D-62
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:34:23 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:38593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okobh-0000ey-Jg
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:34:21 -0400
Received: by mail-il1-x135.google.com with SMTP id u10so7636507ilm.5
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfD3gKBumXj48YHEGRmhAopRixdOklrZueCUIIOWTUk=;
 b=pjxen8LTm+/Y9MNn+vBbA+rE8/VNzn/N5gRAbwwDhJ7ooxphhI6Xq0H3SXNzIWcNcc
 oY/rxziDUjFv2OUoPcEKZtt2sEydDZ0Kl/GFWpaR3ibrK3Th2bGcFCFUs2kQ/48wigIE
 A8kBDkbnMTAPNZNaiSx5oGN4zOWgvhNJ8kQsmQqQqrrrlctYplc7w65kFUwrSEXZML+v
 IHF2BdDUnWYbR6VdiRUWOPjXCfsaS5sBtNEvdWJmglwF9/0GT01OkhHOYELxju8Ra1rW
 jWOJhgdVUtaD/4VCVmpML4gm13P+JqboVMVSCfDNHi3y8LqVtzxtEvuJ0IeiW4mPTgTp
 7H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfD3gKBumXj48YHEGRmhAopRixdOklrZueCUIIOWTUk=;
 b=DLAnVm/hBrUmMNxTL8I+coRFVlZHPLwVeXk3jINCsTR1oB31AGuK5NhlGweRniRDL2
 kATqiidQerSMGAnwCjYntrB39lSusUqUFMR9XOqH+MDoajOMT55rfHt+pUvYu9iB3e7+
 mPI2UOmqdozNzrXN2UjeEDvBZL6QsLmwLxsj83rsi+HyKAUiumun2NakSmMK+JLu0Fo1
 4AN2JgIzsWeWOT2NQwGi84Hzc2BANpNuIRnVnmx64bF6zcuL++vABoK0lqel+a/E4Urt
 RC++mM4w2zNMgCDSPspdQ07/6iEo68DsbRjOAcdLWr/QgZQTcLTjW2Zmx4tObPUrwscS
 p2rg==
X-Gm-Message-State: ACrzQf0kHKOpWlrfwGhfT+gWDbUnq6Sds7S9Blp+2lzAah7wyjR8+GUM
 3qWoT+vJrKuXMvKXuKVaShsflcakq7KWn+eVWqvKvw==
X-Google-Smtp-Source: AMsMyM5nz0HWPSxoLW1oXSbUqdyW8BGEszpgNFkZBSebk5oWE+zmT1pA6gDjMxfUwFiTGFIeblqrg1U1Nw67OVYJhTA=
X-Received: by 2002:a05:6e02:174d:b0:2fa:1b65:106e with SMTP id
 y13-20020a056e02174d00b002fa1b65106emr2057072ill.63.1666107252775; Tue, 18
 Oct 2022 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221014173508.222823-1-ani@anisinha.ca>
 <875yghcfnq.fsf@linaro.org>
In-Reply-To: <875yghcfnq.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 18 Oct 2022 21:04:01 +0530
Message-ID: <CAARzgww2sDAYonM61N1OYvGeWCQRrr6NKY1YezpeJXiej_gNHQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x135.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 18, 2022 at 9:01 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > Please see the README file in patch 9 for more details.
> > Sample runs are as follows:
> >
> > Passed tests:
> >
> > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_s=
mbios_bits
> > JOB ID     : e95c7413e996bfb59389839e5ca5105464ef098f
> > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.15-e9=
5c741/job.log
> >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: P=
ASS (33.08 s)
> > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
> > JOB TIME   : 39.18 s
>
> Hmm something went wrong:
>
>   =E2=9E=9C  ./tests/venv/bin/avocado run -t acpi tests/avocado
>   Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_s=
mbios_bits
>   JOB ID     : 08b6d26bf52a22ccbe1908b14d5b7b27f76ad7fa
>   JOB LOG    : /home/alex/avocado/job-results/job-2022-10-18T16.29-08b6d2=
6/job.log
>    (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: E=
RROR: Error while generating the bits iso. Pass V=3D1 in the environment to=
 get more details. Command '[
>   '/var/tmp/acpi-bits-yy4mfxrz.tmp/grub-inst-x86_64-efi/bin/grub-mkrescue=
', '-o', '/var/tmp/acpi-bits-yy4mfxrz.tmp/bits-2020.iso', '/var/tmp/acpi-bi=
ts-yy4mfxrz.t... (7.21 s)
>   RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 7.79 s
>
> have we added another binary dependency?

Try with V=3D1 , Maybe you do not have xorriso? If that is the case, you
need to install it in your test environment.

>
> >
> >
> > $ ./tests/venv/bin/avocado run ./tests/avocado/acpi-bits.py
> > Fetching asset from ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi=
_smbios_bits
> > JOB ID     : c6e588594bceb2c5fdbdf45095559c58e4030f9c
> > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.13-c6=
e5885/job.log
> >  (1/1) ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:=
 PASS (32.29 s)
> > RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
> > JOB TIME   : 39.27 s
> >
> > When PSS tests are enabled:
> >
> > $ git diff
> > diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/av=
ocado/acpi-bits/bits-tests/testacpi.py2
> > index f818a9cce6..18dc818d62 100644
> > --- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > +++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
> > @@ -40,8 +40,8 @@ import time
> >
> >  def register_tests():
> >      testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Pr=
ocessor objects", test_mat, submenu=3D"ACPI Tests")
> > -#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", =
test_pss, submenu=3D"ACPI Tests")
> > -#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstat=
es, submenu=3D"ACPI Tests")
> > +    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", t=
est_pss, submenu=3D"ACPI Tests")
> > +    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstate=
s, submenu=3D"ACPI Tests")
> >      testsuite.add_test("ACPI DSDT (Differentiated System Description T=
able)", test_dsdt, submenu=3D"ACPI Tests")
> >      testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", tes=
t_facp, submenu=3D"ACPI Tests")
> >      testsuite.add_test("ACPI HPET (High Precision Event Timer Table)",=
 test_hpet, submenu=3D"ACPI Tests")
> >
> > $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_s=
mbios_bits
> > JOB ID     : 16a8b8c7f8dc87c4b84f8a2f95135bb63464a71e
> > JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T22.43-16=
a8b8c/job.log
> >  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: F=
AIL: '1' !=3D '0'\n- 1\n+ 0\n : Some bits tests seems to have failed. Pleas=
e check the test logs for more info. (33.01 s)
> > RESULTS    : PASS 0 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
> > JOB TIME   : 39.17 s
> >
> >
> > Changelog:
> > v4:
> >   - renamed the bits test files as .py2.
> >   - fixed a bug with missing log file parsing. dump bits logs automatic=
ally
> >     for test failures (no need to re-run with V=3D1).
> >   - fixed issues with README file and enhanced it.
> >   - cosmetic comment updates.
> > v3:
> >   - converted the existing test to avocado tests as per the popular
> >     recommendation. Added appropriate tags.
> >   - artifact download URL modified based on gitlab-CI URL.
> >
> >   For biosbits repo:
> >   - moved to a gitlab repo with me being the maintainer.
> >   - added .gitlab-ci.yml file to generate the artifacts.
> > v2:
> >  - a new class of python based tests introduced that is separate from a=
vocado
> >    tests or qtests. Can be run by using "make check-pytest".
> >  - acpi biosbits tests are the first tests to use pytest environment.
> >  - bios bits tests now download the bits binary archives from a remote
> >    repository if they are not found locally. The test skips if download
> >    fails.
> >  - A new environment variable is introduced that can be passed by the t=
ester
> >    to specify the location of the bits archives locally. test skips if =
the
> >    bits binaries are not found in that location.
> >  - if pip install of python module fails for whatever reaoson, the test=
 skips.
> >  - misc code fixes including spell check of the README doc. README has =
been
> >    updated as well.
> >  - addition of SPDX license headers to bits test files.
> >  - update MAINTAINERS to reflect the new pytest test class.
> >
> > For biosbits repo:
> >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artif=
acts.sh
> >    The build script generates the zip archive and tarball used by the t=
est.
> >
> > v1: initial patchset. uses qtest to implement the bios bits tests.
> >
> > Cc: Qemu Devel <qemu-devel@nongnu.org>
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> >
> >
> > Ani Sinha (10):
> >   acpi/tests/avocado/bits: initial commit of test scripts that are run
> >     by biosbits
> >   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
> >     tests
> >   acpi/tests/avocado/bits: disable acpi PSS tests that are failing in
> >     biosbits
> >   acpi/tests/avocado/bits: add smilatency test suite from bits in order
> >     to disable it
> >   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
> >     smilatency tests
> >   acpi/tests/avocado/bits: disable smilatency test since it does not
> >     pass everytime
> >   acpi/tests/avocado/bits: add biosbits config file for running bios
> >     tests
> >   acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses
> >     biosbits
> >   acpi/tests/avocado/bits: add a README file to describe the test
> >   MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
> >     tests
> >
> >  MAINTAINERS                                   |    6 +
> >  tests/avocado/acpi-bits.py                    |  353 +++
> >  tests/avocado/acpi-bits/README                |  128 +
> >  .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
> >  tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2434 +++++++++++++++++
> >  .../acpi-bits/bits-tests/smilatency.py2       |  107 +
> >  .../avocado/acpi-bits/bits-tests/testacpi.py2 |  287 ++
> >  .../acpi-bits/bits-tests/testcpuid.py2        |   87 +
> >  8 files changed, 3420 insertions(+)
> >  create mode 100644 tests/avocado/acpi-bits.py
> >  create mode 100644 tests/avocado/acpi-bits/README
> >  create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
> >  create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
> >  create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py2
> >  create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
> >  create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2
>
>
> --
> Alex Benn=C3=A9e

