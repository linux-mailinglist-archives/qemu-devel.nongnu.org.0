Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B885F9AEB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:25:49 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oho6d-0004Np-BZ
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnur-0008TZ-3i
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:13:37 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:40809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnuo-000821-CS
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:13:36 -0400
Received: by mail-io1-xd33.google.com with SMTP id d142so1916238iof.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJIrnEW2CjJgiseVFf9vhdeHQVvkDq4VjsG7sq55WYk=;
 b=MgJfNF+oy0nWflIc0ebEU+YI5Q6iwRDGOy10yClKgaSKCF3T2n+UUzJrmbEoowN6Qi
 +rJ0ZI96bRBH6UOFka8REgw9g7w1eGaPCcik3/ZOYUgP/u1/UMKYhWfhFPnO4V6IXAeM
 i4G4jfAhAxlA+HtEp41yCSfyJfFWOIg7jgjQabTyIoy2dongzfEBeSN+Q5d2lZyxGh5F
 xfWdjnq15c0TK8yYKuVBCrsHKFOYlf2qCYZGyn9TdET6v9LnVXv0/TIZZBd5kN/nCL0w
 KWDDULxTAZaES4exzzAoGJuzCDKXMDL3artSTUd7S4piL/HRw6MwMeSX0LHbDTCETyRw
 M/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJIrnEW2CjJgiseVFf9vhdeHQVvkDq4VjsG7sq55WYk=;
 b=S4C1OSpPX56qBH41zdPgTXe+wMJf1TF8XhEILCJU10KisKdri3koo6ojfZAVs3vs3k
 hb0VnJgEKMOH3lx/KEoK+nqrcE5WR6JdItq0Wd8QzxI33IeWMHV8l2vfl9nbH7BRbj4V
 iT16xzlpbpV53LhyAqLjGEvCli7aIxC7StNKkJTTckrsOG5YLMFJa8iQOldcMnF9DtRA
 HSDxS1sf8gdEGiLQdOsRrf36P3Xdbb8OJ66AnpECqkeazJS6EYJr35qtSwDYWYpLN9mN
 1YTdyRde0BoVz6BA8knbTBTyxkiMgV7PllIOr2OX1yQlElQFTzJF0PF8SDT69qlS7JjA
 EPxA==
X-Gm-Message-State: ACrzQf3sA4V0FHsWwqAy9MMLsl7g6ZggEKk4LnvA1SmrWPKpK9yX83Ig
 jfo5s/nm0+GTE3dVg4sQeI9ZKTmcuTdWFVkiGxeuyXVTXQU=
X-Google-Smtp-Source: AMsMyM7ZjuTziPsnShEP38KHWfEbR8afcQSzb1KR5iCEUG3VnUI3bnSV8RO2XFV709Wn4chAT2fyj6wRLXWKTzZXd2w=
X-Received: by 2002:a05:6638:25c5:b0:35a:69fd:946e with SMTP id
 u5-20020a05663825c500b0035a69fd946emr9438613jat.174.1665389612730; Mon, 10
 Oct 2022 01:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221010075439.4146972-1-ani@anisinha.ca>
In-Reply-To: <20221010075439.4146972-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 10 Oct 2022 13:43:21 +0530
Message-ID: <CAARzgwwKthMvty72SkG_zt9rpuAek-PMS3+aK9dUKS_e50EDxA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor M <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd33.google.com
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

On Mon, Oct 10, 2022 at 1:24 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Please see the README file added in patch 10 for more details.
> Sample runs are as follows:
>
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? =
(smbios.py, line 92)
> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? =
(smilatency.py, line 47)
> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? =
(testacpi.py, line 158)

None of the above files are avocado tests or avocado related python
scripts. They are run from within bits in a python 2.7 environment. I
could not find a mechanism to exclude a directory from avocado tests.
I also do not think making those scripts python 3 compliant is a good
use of my time since upgrading bits to use python 3 would be a major
task unrelated to QEMU testing.

> 1..1
> ok 1 tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
>
> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? =
(smbios.py, line 92)
> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? =
(smilatency.py, line 47)
> ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? =
(testacpi.py, line 158)
> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smb=
ios_bits
> JOB ID     : c06a9feb423bcda5de89bb51353c6c1718719f14
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T13.12-c06a=
9fe/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PAS=
S (34.11 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
> JOB TIME   : 37.40 s
>
>  ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smb=
ios_bits
> JOB ID     : a2476dd3fafe289c5e6475f447bc8369f77d57ba
> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T13.14-a247=
6dd/job.log
>  (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PAS=
S (34.07 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
> JOB TIME   : 40.20 s
>
>
> Changelog:
> v3:
>   - converted the existing test to avocado tests as per the popular
>     recommendation. Added appropriate tags.
>   - artifact download URL modified based on gitlab-CI URL.
>
>   For biosbits repo:
>   - moved to a gitlab repo with me being the maintainer.
>   - added .gitlab-ci.yml file to generate the artifacts.
> v2:
>  - a new class of python based tests introduced that is separate from avo=
cado
>    tests or qtests. Can be run by using "make check-pytest".
>  - acpi biosbits tests are the first tests to use pytest environment.
>  - bios bits tests now download the bits binary archives from a remote
>    repository if they are not found locally. The test skips if download
>    fails.
>  - A new environment variable is introduced that can be passed by the tes=
ter
>    to specify the location of the bits archives locally. test skips if th=
e
>    bits binaries are not found in that location.
>  - if pip install of python module fails for whatever reaoson, the test s=
kips.
>  - misc code fixes including spell check of the README doc. README has be=
en
>    updated as well.
>  - addition of SPDX license headers to bits test files.
>  - update MAINTAINERS to reflect the new pytest test class.
>
> For biosbits repo:
>  - added Dockerfile and build script. Made bios bits build on gcc 11.
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
>    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifac=
ts.sh
>    The build script generates the zip archive and tarball used by the tes=
t.
>
> v1: initial patchset. uses qtest to implement the bios bits tests.
>
> Cc: Qemu Devel <qemu-devel@nongnu.org>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Igor M <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
>
> Ani Sinha (10):
>   acpi/tests/avocado/bits: initial commit of test scripts that are run
>     by biosbits
>   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
>     tests
>   acpi/tests/avocado/bits: disable acpi PSS tests that are failing in
>     biosbits
>   acpi/tests/avocado/bits: add smilatency test suite from bits in order
>     to disable it
>   acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
>     smilatency tests
>   acpi/tests/avocado/bits: disable smilatency test since it does not
>     pass everytime
>   acpi/tests/avocado/bits: add biosbits config file for running bios
>     tests
>   acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses
>     biosbits
>   MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
>     tests
>   acpi/tests/avocado/bits: add a README file
>
>  MAINTAINERS                                   |    6 +
>  tests/avocado/acpi-bits.py                    |  334 +++
>  tests/avocado/acpi-bits/README                |   90 +
>  .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
>  tests/avocado/acpi-bits/bits-tests/smbios.py  | 2434 +++++++++++++++++
>  .../acpi-bits/bits-tests/smilatency.py        |  107 +
>  .../avocado/acpi-bits/bits-tests/testacpi.py  |  287 ++
>  .../avocado/acpi-bits/bits-tests/testcpuid.py |   87 +
>  8 files changed, 3363 insertions(+)
>  create mode 100644 tests/avocado/acpi-bits.py
>  create mode 100644 tests/avocado/acpi-bits/README
>  create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py
>  create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py
>
> --
> 2.34.1
>

