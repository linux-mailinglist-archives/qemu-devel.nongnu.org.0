Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BDA5796CF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:56:08 +0200 (CEST)
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjxX-0005o3-Dq
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjuB-0006UO-E3; Tue, 19 Jul 2022 05:52:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDju9-0003yH-S9; Tue, 19 Jul 2022 05:52:39 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so9535760wmb.3; 
 Tue, 19 Jul 2022 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S6RZKWZer2m66jkGICoK4W6mH52++axNmDZzeqvlUBA=;
 b=agBKVFq/ygq5+EilZWlCM2E87O9C6j/nKWEen19qkFJi1flJKTeWQ6pRWqbpVd4dOo
 Gas+ogV0zyVUOu4FkNYCqYPQDh7wXqaPcVTtf7jWcU1Vtc3sr6efSPh4W4jV5muhmPru
 CQVizSDzw+OvrzFPWa2oy4p00TztlhYIYzI6PlwDygfSqoq8Jip0eaVwRsUcNI2S5/u2
 8uJPb91ukTb/3/xhXZjjCzT2wBRh5nxPO3qkQPUSL9o28WxpS6o8Mq4rcIhrjYSpiGpm
 74WAjLstc/ngtV9J1+ScnTm4ErypeHImY3RHGKtmGc4xgWBBU1zKzhzuIGmR3+tEtXpN
 WXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S6RZKWZer2m66jkGICoK4W6mH52++axNmDZzeqvlUBA=;
 b=USHT0/v92tlyVIhcg8KrTfuEsja8Ik4A+BgjiZQKYsWWk0oCnSWdyNPIfSpCeujZ94
 frpfhY4ldzA6e9AhSEsD0QWJSYpuv/VyV0BnM5g25as1FrF1AqefSwJ3xaNw2/ehek+Q
 g9be8O3kg8QoCmqmC8UJemdgWhA+mbr+AilemBtl8mDydq4NxCZ45PuR9jQnng4n5YQk
 5ea7femUhvTgoYqjJNWutSZsElytTF2eLzpCBUK4Q87k/rc+cnuzzm0G1WqkflFvQ0ol
 NoGMtzrfpAUsN89y0Rr3eIB84LijqDLyRDs/1rcOnlCzkEv6J1Rkv8XWNhwUzqz3zFGe
 +Y+Q==
X-Gm-Message-State: AJIora8jagx9tRGUnxP7cDTnRmZfkoDWtgM9UI42gBRxQ7RyqAR3nEM7
 KNjpJTXbNRyRI74hHwcevbg=
X-Google-Smtp-Source: AGRyM1tnRuqK4q+pdi+zfwMrUDurA96N4aWIo9lB4ltOM09KqHf72vbQ9xGaaZi0dxdatJLSizAotw==
X-Received: by 2002:a05:600c:3d10:b0:3a0:4956:9a84 with SMTP id
 bh16-20020a05600c3d1000b003a049569a84mr30450352wmb.133.1658224355980; 
 Tue, 19 Jul 2022 02:52:35 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c511400b003a30fbde91dsm13359458wms.20.2022.07.19.02.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:52:35 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 5/8] tests: Add HMAT AArch64/virt empty table files
Date: Tue, 19 Jul 2022 10:49:47 +0100
Message-Id: <20220719094950.1049516-6-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/virt/APIC.acpihmatvirt      | 0
 tests/data/acpi/virt/DSDT.acpihmatvirt      | 0
 tests/data/acpi/virt/HMAT.acpihmatvirt      | 0
 tests/data/acpi/virt/PPTT.acpihmatvirt      | 0
 tests/data/acpi/virt/SRAT.acpihmatvirt      | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4f849715bd 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/APIC.acpihmatvirt",
+"tests/data/acpi/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/virt/HMAT.acpihmatvirt",
+"tests/data/acpi/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/virt/SRAT.acpihmatvirt",
-- 
2.25.1


