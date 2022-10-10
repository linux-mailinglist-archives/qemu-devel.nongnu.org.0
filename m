Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C05F9A8D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 09:59:54 +0200 (CEST)
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnhZ-0006An-6B
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 03:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnct-00027T-7K
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:55:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohncq-0005DE-ND
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:55:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id h13so8676431pfr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TAUnOzxFbHkCy4i6XY8t3SkTDTEUaBZ5ezDkuX798ZE=;
 b=KKg7YoklPLpSYOmCTUINPMbjFrre8IpLw5k49M7uOZqa3/3MRXR+YC3A7a1xf90Pm4
 WNc3hrEFnm/1zHqBkVmENXbBVcweUiuVrS9Z+Ic8GykB5yS/cQ65o7fgZuAh4TYK0IQP
 L2dUDx+t3asdldmiZzeCC/ZWDJF42OFrppbEoVN3PMbCyZFw65H85TjhJtypUgnggX6Q
 pkhMg2ezvv7SJHJUcbtaYvxE6842JuSiNO3Nra2ppJUBxFT9O3m0NR68woZS1zCBptB2
 X1gMglT4TrCZbXzytIA44jD0IxNOVgBmVGijqtU4j5E8C0rzvsADkMweLfOx/vprF0bx
 BAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TAUnOzxFbHkCy4i6XY8t3SkTDTEUaBZ5ezDkuX798ZE=;
 b=AZ+smFcyRbSrSnbBHNvG5jl9hDjoZPfz+AV1SsIwVNVE6twMf68n+4VkTtBfEKPmgH
 Deu+9v3+kjWnHOl9S68RGxI9B/NDpNJLfb/fkggdXw49WLTfpEQkQYvwe1J5TAB/vd4R
 V5XKbnHXqmEYcHbTdwesOviPll67ToqP1tE/qJj1Tloqxarp18KCplbAwD8F/f0w8vb4
 oD2V4wdecHK6WWOnBZmYzT7Rk1ZBxPePS1863ETn1hYDGqY+xQ3ch7ZqVctSy3kYu5iD
 yJvwNuJuGBDkAfdw+BM8Fip3bI/t3nguL2gbWKwooS1Vze4JT+daA1gD+uhq8zh5E+RO
 lA5Q==
X-Gm-Message-State: ACrzQf2rq2gm1Z7rwML73a14ZuQLGGZHTl/q873oWFb9Y7elTs9sv3cd
 /WHQnJ+kbMioAq7If4sOZUICf22zfOvTmg==
X-Google-Smtp-Source: AMsMyM6Rzt+J9Wxsag3776kd6Ji5MtaX/HgL1/B1c7cy6wvHd2sZAIUKDJ7gFJJzf+2setny+9530A==
X-Received: by 2002:a65:468a:0:b0:44e:66d3:898a with SMTP id
 h10-20020a65468a000000b0044e66d3898amr15403960pgr.264.1665388496054; 
 Mon, 10 Oct 2022 00:54:56 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 n7-20020a170903110700b00179eaf275d5sm6013844plh.27.2022.10.10.00.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:54:55 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor M <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>
Subject: [PATCH v3 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Mon, 10 Oct 2022 13:24:29 +0530
Message-Id: <20221010075439.4146972-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
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

Please see the README file added in patch 10 for more details.
Sample runs are as follows:

$ ./tests/venv/bin/avocado run -t acpi tests/avocado --tap -
ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smbios.py, line 92)
ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smilatency.py, line 47)
ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (testacpi.py, line 158)
1..1
ok 1 tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits

$ ./tests/venv/bin/avocado run -t acpi tests/avocado 
ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smbios.py, line 92)
ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (smilatency.py, line 47)
ERROR:  Missing parentheses in call to 'print'. Did you mean print(...)? (testacpi.py, line 158)
Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : c06a9feb423bcda5de89bb51353c6c1718719f14
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T13.12-c06a9fe/job.log
 (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (34.11 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 37.40 s

 ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : a2476dd3fafe289c5e6475f447bc8369f77d57ba
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T13.14-a2476dd/job.log
 (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (34.07 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 40.20 s


Changelog:
v3:
  - converted the existing test to avocado tests as per the popular
    recommendation. Added appropriate tags.
  - artifact download URL modified based on gitlab-CI URL.

  For biosbits repo:
  - moved to a gitlab repo with me being the maintainer.
  - added .gitlab-ci.yml file to generate the artifacts.
v2:
 - a new class of python based tests introduced that is separate from avocado
   tests or qtests. Can be run by using "make check-pytest".
 - acpi biosbits tests are the first tests to use pytest environment.
 - bios bits tests now download the bits binary archives from a remote
   repository if they are not found locally. The test skips if download
   fails.
 - A new environment variable is introduced that can be passed by the tester
   to specify the location of the bits archives locally. test skips if the
   bits binaries are not found in that location.
 - if pip install of python module fails for whatever reaoson, the test skips.
 - misc code fixes including spell check of the README doc. README has been
   updated as well.
 - addition of SPDX license headers to bits test files.
 - update MAINTAINERS to reflect the new pytest test class.

For biosbits repo:
 - added Dockerfile and build script. Made bios bits build on gcc 11.
   https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
   https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
   The build script generates the zip archive and tarball used by the test.

v1: initial patchset. uses qtest to implement the bios bits tests.

Cc: Qemu Devel <qemu-devel@nongnu.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Igor M <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>

Ani Sinha (10):
  acpi/tests/avocado/bits: initial commit of test scripts that are run
    by biosbits
  acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
    tests
  acpi/tests/avocado/bits: disable acpi PSS tests that are failing in
    biosbits
  acpi/tests/avocado/bits: add smilatency test suite from bits in order
    to disable it
  acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
    smilatency tests
  acpi/tests/avocado/bits: disable smilatency test since it does not
    pass everytime
  acpi/tests/avocado/bits: add biosbits config file for running bios
    tests
  acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses
    biosbits
  MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
    tests
  acpi/tests/avocado/bits: add a README file

 MAINTAINERS                                   |    6 +
 tests/avocado/acpi-bits.py                    |  334 +++
 tests/avocado/acpi-bits/README                |   90 +
 .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
 tests/avocado/acpi-bits/bits-tests/smbios.py  | 2434 +++++++++++++++++
 .../acpi-bits/bits-tests/smilatency.py        |  107 +
 .../avocado/acpi-bits/bits-tests/testacpi.py  |  287 ++
 .../avocado/acpi-bits/bits-tests/testcpuid.py |   87 +
 8 files changed, 3363 insertions(+)
 create mode 100644 tests/avocado/acpi-bits.py
 create mode 100644 tests/avocado/acpi-bits/README
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py

-- 
2.34.1


