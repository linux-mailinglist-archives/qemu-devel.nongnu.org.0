Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49756D04D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:05:07 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaMj-0002wO-IB
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaIy-0005xa-Fu
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:13 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaIj-0003Kw-EZ
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:00:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id j12so2635755plj.8
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DEULjk5KUSU33OsQANkhEgG1hp7hx7lns7y2X2Upn1g=;
 b=Z44rX69zZZWR2YeUcUKIwgTsoAS9jI1NN2Sm3nNTWS59AC7BMIsvu17Ln6zJaSIPIr
 tdKMsTRQBd+YMuKwIJ07JUiOxt6h7tcN6muClrIThfzzw3Hk/905qI3yZOV0xX5YtWHk
 rjQSDP2+Zkzmu6UdOTELHsxvGu4ujeeAP7GeXDdIoLAZW0WurAOKd11Ji0amiRGO1FAO
 LvLnIyUz2l08MJb6VIy91BnV4THTkNIZyuam2jFq7qyESyxP5ezb5VTCFvNxbOfFIjSx
 vvOn5kyDncu6+oAKjy5m03PRRfieLLPvo6XrDRtJwEl17qnn39SvSfeooElwbH6Nb7kX
 bTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DEULjk5KUSU33OsQANkhEgG1hp7hx7lns7y2X2Upn1g=;
 b=axhrGGWE2WUc3JpSW3D6L8lYxrxTPKAk7g1QiAvR3nNGq1IQNmMRbHDSvn2DUUmw1/
 23mE8JwSR0q6gddyN6NTCoseqTafGMeg1LQxjT5qIS8FEXDVChyXkotzgqNXcfHHTlLF
 OH2Wy4s2ahZi/aoBUF/3jUVDy3Zt8WS8hwV6JHUQI6QM/xa9Er3jHg7wMc+7jvCLHqiC
 IgDE0gJ2p69AmPgSASZay/t1gYSaKATBXJJ560UvowT99PIxZSEuX5Yyz04TtOEnDJL9
 LTk/0kTK9yeK5tRl6h6LhR2wN5ECV5MFf+O5ew+gcjxTLLdzRFRLbXXWRmjY/E9p0ahW
 RKZA==
X-Gm-Message-State: AJIora8F4sCIEo0aZnw5SWqGXv4XwevK30BlLpdlF0S6GMGAexi/wj1D
 rnT0stlr6SHxAHAUHmESX3wDwr0thm+tXVQE
X-Google-Smtp-Source: AGRyM1uTbHeXrc0iq6FpY9KcrF2QdW/WBufvu5fHZ4q7U1jJcSVskABPQvQLKqi+RByASZO6PoCOEw==
X-Received: by 2002:a17:902:d50e:b0:16c:1664:81e5 with SMTP id
 b14-20020a170902d50e00b0016c166481e5mr14531165plg.149.1657472455318; 
 Sun, 10 Jul 2022 10:00:55 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:00:54 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 00/11] Introduce new acpi/smbios python tests using biosbits
Date: Sun, 10 Jul 2022 22:30:03 +0530
Message-Id: <20220710170014.1673480-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x629.google.com
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

Changelog:
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

Ani Sinha (11):
  acpi/tests/bits: initial commit of test scripts that are run by
    biosbits
  acpi/tests/bits: add SPDX license identifiers for bios bits tests
  acpi/tests/bits: disable acpi PSS tests that are failing in biosbits
  acpi/tests/bits: add smilatency test suite from bits in order to
    disable it
  acpi/tests/bits: add SPDX license identifiers for bios bits smilatency
    tests
  acpi/tests/bits: disable smilatency test since it does not pass
    everytime
  acpi/tests/bits: add python test that exercizes QEMU bios tables using
    biosbits
  acpi/tests/bits: add biosbits config file for running bios tests
  acpi/tests/bits: add a README file describing bits pytests
  pytest: add pytest to the meson build system
  MAINTAINERS: add myself as the maintainer for acpi biosbits pytests

 MAINTAINERS                                   |    5 +
 tests/Makefile.include                        |    4 +-
 tests/meson.build                             |    1 +
 tests/pytest/acpi-bits/README                 |  129 +
 tests/pytest/acpi-bits/acpi-bits-test-venv.sh |   59 +
 tests/pytest/acpi-bits/acpi-bits-test.py      |  382 +++
 .../pytest/acpi-bits/bits-config/bits-cfg.txt |   18 +
 .../pytest/acpi-bits/bits-config/meson.build  |   11 +
 tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
 tests/pytest/acpi-bits/bits-tests/smbios.py   | 2432 +++++++++++++++++
 .../pytest/acpi-bits/bits-tests/smilatency.py |  105 +
 tests/pytest/acpi-bits/bits-tests/testacpi.py |  285 ++
 .../pytest/acpi-bits/bits-tests/testcpuid.py  |   85 +
 tests/pytest/acpi-bits/meson.build            |   33 +
 tests/pytest/acpi-bits/requirements.txt       |    1 +
 tests/pytest/meson.build                      |   49 +
 16 files changed, 3609 insertions(+), 1 deletion(-)
 create mode 100644 tests/pytest/acpi-bits/README
 create mode 100644 tests/pytest/acpi-bits/acpi-bits-test-venv.sh
 create mode 100644 tests/pytest/acpi-bits/acpi-bits-test.py
 create mode 100644 tests/pytest/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/pytest/acpi-bits/bits-config/meson.build
 create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
 create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
 create mode 100644 tests/pytest/acpi-bits/bits-tests/smilatency.py
 create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
 create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
 create mode 100644 tests/pytest/acpi-bits/meson.build
 create mode 100644 tests/pytest/acpi-bits/requirements.txt
 create mode 100644 tests/pytest/meson.build

-- 
2.25.1


