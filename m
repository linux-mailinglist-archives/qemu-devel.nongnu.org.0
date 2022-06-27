Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A355B838
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:32:59 +0200 (CEST)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jEw-0006kj-Pg
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jBT-0003gy-I9
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:29:23 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jBH-0005eI-Rv
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:29:23 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i64so8174782pfc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cRsTRN1AsSgsAmzGyYvfKibHMH7K74pROfGImtCsGRM=;
 b=Z8Cp09cFyT2AOElG7UD2pzw50UA6JkSf3XBGWae2NdoAojic3SQsNXmd1kyJBH/Exx
 gzHsMO9F6hcK70ujRKWX9aZy1QAD0hBOPxTPlF6Nz+Kar/pFVjgU2vI4L1GEI2FJMVsZ
 YhCLPQYXtsYBClvQ0S98Qe5e7HcXEGaJ+yJbn2cfHoVH+8zngmUupph6xbzys5VyZ86R
 kzruGjop8rkhnJRSbWd8rkbPNk6tTWhJWlYOROM1v/BK2BSE0g05kzpHFK8cTiffefCQ
 wJoTj0kH0jjNT0ka0njQdi85Kb3K9qt37Ce8BNR8KxcLX1N/XnLXhMNy9uBKwXOcNNE0
 DiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cRsTRN1AsSgsAmzGyYvfKibHMH7K74pROfGImtCsGRM=;
 b=4uhWB4Op2eE1/kMh/fcKztv9J0ljqADKF79trLIPWv9qZIPonxES90oFEKb7TB4onS
 /RcF8fz2wbmqXyCSnlB85q7WeRJntng3KeE0/pGNIuOm2kq+nUH4TJET8yUGlkEZBZML
 EDu7EdPfJKkKJH3e3lDK3rkAKs1bgTJ9QHiJEkxicZS1CmNhCl06Ed7GIWa/UA6eZIus
 RZgfkljiXs3woe3B+dNnOMyRhIF/TSOvQBon+t8N/YGbuFVjc2uTgwB7lExrvbPFgW9d
 U9vRTAuDSNMxLPc+fK0OmjItg4VGaTIpPcjmNvij9cVHxxOBrz4KMryMVrrVrZCJtuby
 GTyQ==
X-Gm-Message-State: AJIora98fSI9rkb9kqFrTwiBPngBDXL++TVWJ9QniTeNpLqqwqWUWyQ6
 Vrd2XbwqHq40dY19jHr0CVQ8amqjVU8n+BqjShU=
X-Google-Smtp-Source: AGRyM1ujbHWzoybEemA3k1iBPMfF/FJ47a+omYcuBB/d8d00uBCboHzfN66AIZTsidaCZkhFUXt85Q==
X-Received: by 2002:a05:6a00:1306:b0:512:ca3d:392f with SMTP id
 j6-20020a056a00130600b00512ca3d392fmr13195862pfu.79.1656314949954; 
 Mon, 27 Jun 2022 00:29:09 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:29:09 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
Date: Mon, 27 Jun 2022 12:58:44 +0530
Message-Id: <20220627072856.1529357-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42f.google.com
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


