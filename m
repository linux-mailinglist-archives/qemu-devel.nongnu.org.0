Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757145796B7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:53:15 +0200 (CEST)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjuk-0007dq-GQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjrh-0003Q3-An; Tue, 19 Jul 2022 05:50:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjrf-0003Bp-41; Tue, 19 Jul 2022 05:50:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id h17so20822535wrx.0;
 Tue, 19 Jul 2022 02:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IEUCcOYSJr1/EUOP9HoBVWfHOZkdTL8hhiO+jgXlnng=;
 b=Qs8yT5ynq3TCORC8+O0XknZ52z5+HXOlhzxjkEOa8NKx5YZJG/aaWQGYCWB48sAWzX
 zRUP9bW3TlXtVLCmpHy1yZcF7xhO4OP3Atrb5n7IN5DZSvHLzm/z84jmXh0jB5ZSSdKU
 BfFN8nyz99U8wZ+cfMVEo4bwt5Yu8LSasbHqz6GDAT9GKue7K+stYtj2lOSxAg9LIbz2
 PSxwiOUZ+a6RdpKUTJU1J5UTmC4pCKmPxv21GP6483Fb7VCCPhUcGJSeqmZQmcUcXf4z
 4V9krBd5p+3wiCcVHpuQV5yr/YzuWtya9+XSwdDRbCGKHZGPs6zFzoomuRtC0SR4FQ5a
 z+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=IEUCcOYSJr1/EUOP9HoBVWfHOZkdTL8hhiO+jgXlnng=;
 b=GFFF43cs4tc4ulsH0uJ1Yqf9lQqb+6YHyCdRVB+AYViuC2TlCuZsxB7Dlru6skA6EL
 cZu2UVURKFQuRhpjUVSE0OspZb75j23fWnyoT/kKjyEsqcpS2jbb5t4ByN5r5HQ7MnvM
 LvgdHFhCLr4CnPXTwsUdBvTZhX0+BF28qirgouvu9E9lcQub+jecKf5wxR63cppvTbuN
 XjtsJynAWXaqFu9oAe5GBJLzvrZTjZxpfhBkaGGFOAf++NpgxQH5FwaFMSsgYwjaWeS3
 jYwpyPiyIDnPiN0ihNxZJ54pZD/W4vY6r6SNE9VRFfkVEJPiY05uuDLGtKLHnmhXISOQ
 KW0Q==
X-Gm-Message-State: AJIora/3aWHCeSXy7on6GgctAHrQxxmHtXU/q+cc9j23x4hYhlMUpLR3
 LtRSUrjyLU/WjB3SWuGec2Y=
X-Google-Smtp-Source: AGRyM1uWePn42WHwHca7J87TXYB1K2LTCMN/vvGqSoulSSZuyub+9QmZMI5UzVEwzAWsNUk6uD++OA==
X-Received: by 2002:adf:b650:0:b0:21e:24a1:b839 with SMTP id
 i16-20020adfb650000000b0021e24a1b839mr5611110wre.207.1658224199661; 
 Tue, 19 Jul 2022 02:49:59 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a5d44d2000000b0021cf31e1f7csm8318500wrr.102.2022.07.19.02.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:49:59 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 0/8] AArch64/HMAT support and tests
Date: Tue, 19 Jul 2022 10:49:42 +0100
Message-Id: <20220719094950.1049516-1-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This patchset adds support for AArch64/HMAT including a test.
It relies on other two patch sets from:

Brice Goglin: to support -numa without initiators on q35/x86.
  https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
Xiang Chen: to enable/support HMAT on AArch64.
  https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/

I further add a test with ACPI/HMAT tables that uses the two
patch sets.

Changes from v1:
- Generate APIC and PPTT ACPI tables for AArch64/virt
- Avoid using legacy syntax in numa/bios tests
- Delete unchanged FACP tables

Brice Goglin (4):
  hmat acpi: Don't require initiator value in -numa
  tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
  tests: acpi: q35: add test for hmat nodes without initiators
  tests: acpi: q35: update expected blobs *.hmat-noinitiators expected
    HMAT:

Hesham Almatary (3):
  tests: Add HMAT AArch64/virt empty table files
  tests: acpi: aarch64/virt: add a test for hmat nodes with no initiators
  tests: virt: Update expected *.acpihmatvirt tables

Xiang Chen (1):
  hw/arm/virt: Enable HMAT on arm virt machine

 hw/arm/Kconfig                                |   1 +
 hw/arm/virt-acpi-build.c                      |   7 ++
 hw/core/machine.c                             |   4 +-
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
 tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
 tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
 tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
 tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
 tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
 tests/qtest/bios-tables-test.c                | 109 ++++++++++++++++++
 13 files changed, 118 insertions(+), 3 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

-- 
2.25.1


