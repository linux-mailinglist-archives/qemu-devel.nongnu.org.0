Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C84E55B800
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:49:22 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5iYj-0002Zs-5j
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5iUT-0000S7-Sp
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:45:00 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5iUQ-00062p-4J
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:44:56 -0400
Received: by mail-pg1-x52a.google.com with SMTP id g4so1325682pgc.1
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 23:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cRsTRN1AsSgsAmzGyYvfKibHMH7K74pROfGImtCsGRM=;
 b=Aurghkt7Gs05K8PFbMYMAHv2KLqeG3MyT/FMew4pMSZoZUmZf4A4wZ96+e32d5Nec9
 X/RVCXSCHxL2xGNUx9XR/7hIABOX+WoAfNfm5KYtal0lBFHCmtO82cQwmw26eoGdhuls
 RbFXWzCnSCDtxem/vZu383NEMnLUW0SmtTSebfQriygmUk5jdB+kSoR1TDjBLqHPdnJe
 a1zX6FQCSx74wymGdLotgLASuqFQLBCpX8Q8pDfzSueFJEmo23BuKBFu7sgVM+CtbSaA
 oEkAUHh/iItAWPXV2fbXwCpNyO6cq0RhwoLqrGTNEkZbu6c64/xaQ8QcfipFfmREkSGe
 dnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cRsTRN1AsSgsAmzGyYvfKibHMH7K74pROfGImtCsGRM=;
 b=zhgAVW19G/mw8DdBQS1YHo1227Gpi4QAc9r41pEzrAYZeKphLA1nwTk1ocJA+mT5LL
 ovZIKJ3SXNKDqOCq03QVf6e2HxFREZa6zjdS6KiUkhrLeUhRbgqYOXMMYciH24sFaZvo
 c3YAcrlnra1pls6xryF+fkFRmDjY49HzhIMgGTLamrz9VbUJjJTIO3eIfCQmoB0dleq6
 cqCSryJIYeNcKY8Sy4Ptwje2WkiifZORTkQXr0FYfLm2G4k8lhLr95RaXAwxBid5sdox
 CQ9/TGooga8oF+ihhyt8VIB5PLMpB/Eg7p6FS19oh4VSXpaY2FSwU9Ozw7U+gas+1nIq
 t8DA==
X-Gm-Message-State: AJIora8MmD+Y9gNZkEdI/RzzYddyx0QkxE0e2wx+EeW82oa3lILsZ//q
 w9qQ3rnbYIBNashqZYOB3KpRxWUH8foq3nPcJ0Q=
X-Google-Smtp-Source: AGRyM1vcd93WlAYjxVUb7IXeKIDeY0vuPMD67MkjDLnJucoy6ElVPEaUtxE6fBZT8t7KNoMrFpXm4g==
X-Received: by 2002:a63:2bcc:0:b0:40c:95b5:46a4 with SMTP id
 r195-20020a632bcc000000b0040c95b546a4mr11202208pgr.535.1656312290962; 
 Sun, 26 Jun 2022 23:44:50 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h8-20020a056a00170800b0050dc762819bsm6310126pfc.117.2022.06.26.23.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 23:44:50 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
Date: Mon, 27 Jun 2022 12:14:02 +0530
Message-Id: <20220627064414.1527623-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
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

Biosbits is a software written by Josh Triplett that can be downloaded by
visiting https://biosbits.org/. The github codebase can be found here:
https://github.com/biosbits/bits/tree/master. It is a software that exercizes
the bios components such as acpi and smbios tables directly through acpica
bios interpreter (a freely available C based library written by Intel,
downloadable from https://acpica.org/ and is included with biosbits) without an
operating system getting involved in between.
There are several advantages to directly testing the bios in a real physical
machine or VM as opposed to indirectly discovering bios issues through the
operating system. For one thing, the OSes tend to hide bios problems from the
end user. The other is that we have more control of what we wanted to test
and how by directly using acpica interpreter on top of the bios on a running
system. More details on the inspiration for developing biosbits and its real
life uses can be found in (a) and (b).
This patchset contains QEMU qtests written in python that exercizes the QEMU
bios components using biosbits and reports test failures.

Details of each of the files added by this patchset are provided in the README
file which is part of Patch 11. Every effort to contact Josh, through various
means including email, twitter, linkedIn etc has failed. Hence, the changes to
build biosbits with the newer compiler, upgrade acpica and other changes are
currently maintained in a forked project in my personal github. We may want to
maintain bits in a separate fork in a stable repository that is accessible by
QEMU developers.

The newly introduced qtest currently only run for x86_64 platform. They pass
both when running make check on a baremetal box as well as from inside a vm.

Thanks to Igor M for pointing me to this work.

(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
(b) https://www.youtube.com/watch?v=36QIepyUuhg

Ani Sinha (12):
  qtest: meson.build changes required to integrate python based qtests
  acpi/tests/bits: add prebuilt bios bits zip archive
  acpi/tests/bits: add prebuilt bits generated grub modules and scripts
  acpi/tests/bits: initial commit of test scripts that are run by
    biosbits
  acpi/tests/bits: disable acpi PSS tests that are failing in biosbits
  acpi/tests/bits: add smilatency test suite from bits in order to
    disable it
  acpi/tests/bits: disable smilatency test since it does not pass
    everytime
  acpi/tests/bits: add biosbits config file for running bios tests
  acpi/tests/bits: add acpi and smbios python tests that uses biosbits
  acpi/tests/bits: add acpi bits qtest directory in meson for running
    tests
  acpi/tests/bits: add README file for bits qtests
  MAINTAINERS: add myself as the maintainer for acpi biosbits qtests

 MAINTAINERS                                   |    5 +
 tests/qtest/acpi-bits/README                  |  168 ++
 tests/qtest/acpi-bits/acpi-bits-test-venv.sh  |   59 +
 tests/qtest/acpi-bits/acpi-bits-test.py       |  327 +++
 .../qtest/acpi-bits/bits-config/bits-cfg.txt  |   18 +
 tests/qtest/acpi-bits/bits-config/meson.build |   11 +
 tests/qtest/acpi-bits/bits-tests/meson.build  |   11 +
 tests/qtest/acpi-bits/bits-tests/smbios.py    | 2430 +++++++++++++++++
 .../qtest/acpi-bits/bits-tests/smilatency.py  |  103 +
 tests/qtest/acpi-bits/bits-tests/testacpi.py  |  283 ++
 tests/qtest/acpi-bits/bits-tests/testcpuid.py |   83 +
 tests/qtest/acpi-bits/meson.build             |   39 +
 .../acpi-bits/prebuilt/bits-2095-grub.tar.gz  |  Bin 0 -> 41416278 bytes
 tests/qtest/acpi-bits/prebuilt/bits-2095.zip  |  Bin 0 -> 31922898 bytes
 tests/qtest/acpi-bits/prebuilt/meson.build    |   11 +
 tests/qtest/acpi-bits/requirements.txt        |    1 +
 tests/qtest/meson.build                       |    7 +-
 17 files changed, 3555 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/acpi-bits/README
 create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
 create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
 create mode 100644 tests/qtest/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/qtest/acpi-bits/bits-config/meson.build
 create mode 100644 tests/qtest/acpi-bits/bits-tests/meson.build
 create mode 100644 tests/qtest/acpi-bits/bits-tests/smbios.py
 create mode 100644 tests/qtest/acpi-bits/bits-tests/smilatency.py
 create mode 100644 tests/qtest/acpi-bits/bits-tests/testacpi.py
 create mode 100644 tests/qtest/acpi-bits/bits-tests/testcpuid.py
 create mode 100644 tests/qtest/acpi-bits/meson.build
 create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095-grub.tar.gz
 create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095.zip
 create mode 100644 tests/qtest/acpi-bits/prebuilt/meson.build
 create mode 100644 tests/qtest/acpi-bits/requirements.txt

-- 
2.25.1


