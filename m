Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DA5796D3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:56:34 +0200 (CEST)
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjxx-00075F-1Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjsg-0003px-3W; Tue, 19 Jul 2022 05:51:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjse-0003d8-Hw; Tue, 19 Jul 2022 05:51:05 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so8835300wmb.3; 
 Tue, 19 Jul 2022 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9Z2uy4g8Ct2OgMS3JKQ4Rli/sEtDSG4EP2iBDjVkwc=;
 b=md2XJSVt98a1/sKSnuEIT+RJ9+avMttJW7OX8uqpp8pCy/+yPOz7AXmE22Ont/TUUm
 ZvuRETJv3st5RDIfVEZdhs3D66Ng2shUjDPwydDkyyBSK+N3sq+IL6G1dooK0kv3y760
 TOdIxjCChcZrRTlZRFlZRfW8GOLqgf7x6ssF134AoX3boL2S2laxSGI4ugQQGN1dGxWL
 XLBA4kX9P8v4xx/bm0xLK26B8yNaPMq8/WdL0hpI+UkELDjpf1VVww//yCmKiSfF1xNe
 ubYaIqjMF30aRqum1za12X4gImYB6Uu7rsG+dLpWd8CwI189rfhMCGSFNydQRf6qgYbI
 9MXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F9Z2uy4g8Ct2OgMS3JKQ4Rli/sEtDSG4EP2iBDjVkwc=;
 b=DXxOn4hfD0tbiyF3X/CrpOOXLwNbf33z0ZOA1R1oQg5paJoHtfKOb5TIi3r5VXh6sM
 bbLjTofGeXFCEps4BWVS8t4wQ6rqROiVnxGdM7R68cXUFa+1bnguZy92ZvgLk9aksucW
 ocOvlzyh/qNV9tkvUaCePJ4dmypLgTkCLY6MBtkAy80Lc7qvLBK0lNsdWkblV93sxXv2
 4+F0+d5T4xvL2MVugvbK4afr0Y2UA/AuSz9vt674irN6B2e/U8p+z7pHKMA4PbpbaE1B
 1VpB3oGyPjg3XymVofvK58TWdnFsTCzgB54gZYJLB2xYUOQ1qar9qdPMzAoo59CI6zXs
 G9bA==
X-Gm-Message-State: AJIora++CwfLs7kGcYxq8gL3vFRaFeNgoCebHdkQDfwJnnpz7VXBFfhS
 Os4af5jLt25kt0jgQqshuDI=
X-Google-Smtp-Source: AGRyM1v+1VFJP7A5rmcQ4Zr8e4K0GgNjTFHqDj2Yujmix82kndqktJOHD9MRoyRd35T/mtbp42JtAA==
X-Received: by 2002:a05:600c:4f43:b0:3a2:ee79:2dd5 with SMTP id
 m3-20020a05600c4f4300b003a2ee792dd5mr29845584wmq.143.1658224262185; 
 Tue, 19 Jul 2022 02:51:02 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d4c44000000b0021b956da1dcsm12841263wrt.113.2022.07.19.02.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:51:01 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 2/8] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
Date: Tue, 19 Jul 2022 10:49:44 +0100
Message-Id: <20220719094950.1049516-3-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wm1-x333.google.com
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

From: Brice Goglin <Brice.Goglin@inria.fr>

.. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | 0
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | 0
 tests/qtest/bios-tables-test-allowed-diff.h   | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..245fa66bcc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
+"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
-- 
2.25.1


