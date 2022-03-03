Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5734CB680
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:38:25 +0100 (CET)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeAS-0007zN-S2
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:38:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1E-0001m8-JM
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:54 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1C-0000XC-81
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285329; x=1677821329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lhTxYmg91JpfH29IdCPqqOgWEV/DYvR1IbtewiR2zo0=;
 b=DJIR7bS435WFNrymrrkZv6irtAJVbAQVcSGtQs25M2WSaPtwbo463VZS
 N0RWr42iI6XBm2u2oITiOHpaQC9k51eHWKsYZF5HEv1MnFXL++C75e1dk
 oBEI95GtqCma76pN+98jNi5f7remTeNeUw1xPhmA7QAyOv5ymUuieWJR/
 MtX5HMCFvTEk4Y3g/ar3PN1LKw6JZcmCVfll8CGPxZ4XjYEJLQc3SKn7H
 NsM6plYCC22Y3/131XwkyzlO+CfrQru+4ziLIIamDK3+4YBmgC/KI67H4
 qZW3cNPujHI5/n1coLAfxd5qovG+R22fuv0fKxjsxakPqi15SQIsRkfNV g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194355352"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:48 +0800
IronPort-SDR: AvvRBeOYpJ64+hLkij8lLBqNFRkvx61M3SByXAiqJM/thCm1BZK6g1Uq5ZF4+PQnIgoa4hn50L
 CVf8CiFCgtHXaamP4UbxR2kUnDucRtw1fPPbEhA2HpCDbEGWMLxctVYLy/KG4sS4CNQllbq7Ur
 To62i0Djq/1cwAMzlxWbTiaiIKJZD4yQ6V+1w/VpRIv6Fh6wfH6jZAfEH5LzQ3e6+76uiNSyss
 vzmpbi+bNrk7z84jhN2z8zY9sFvE+e9dJ+GMDk1C+KuijtAmV6VkWMlkEHx0qBRj+ecV9fHKjU
 26VdZe02Op6kjtuU5hzYTxZK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:11 -0800
IronPort-SDR: pgsAmCX7mjt9VZKQFGe3msVjhH5zoJrIb/ikjQV5N8fmKOqA8Q+Wswpjn0UE1u/7i1oCLla9kY
 IWPWbldxLcMouKuNmwKUNVINzzpJeNabnNhEmcr8G3JXkaYgEYqPpOzi9oN7yl0SpUEwxxKbWl
 yN33aXjZKvnbh33Q3iwUUz5KYtuygN7u5vRHEEUpekNbw+gur6Aw5bPN444HbL1C5ofOBuQK33
 yK6KwqPpx4LCCsQcAy/kGVOQiJAmxmgqpM9r8H12S2v2jn1CIPE2jjXmvVDLiAd+LGc9rzjMI6
 nDg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKD4rlnz1Rwrw
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285328; x=1648877329; bh=lhTxYmg91JpfH29IdC
 PqqOgWEV/DYvR1IbtewiR2zo0=; b=potzfNse3gcPliWYQVSg3tXr3vNY9+qsJs
 5fm35zTdD3n4svNANVOndYPj3B/t5wHyAd8nZpc6GjH12qKOsY3rMMb3210h8fqE
 QIpgIewEZMuqj8STx+O2iqy2B8p2/geoHbjmPZ59biGXQwiOKLz6BpMqIfRJT5DT
 yr6Mmc7OHhut9mchp+aPk2AUaP54JV8SnquHq+orbcXx4LAKZjzSQS2+EgLOaMdh
 HdS6CUXmsB+VEoM+pJuJcvSNuLf7TU9y09vwIsqiN/HrZ30k1q1ETbXEtNJNv4/G
 uOExbqtmxLoAIkecnGB5X/bnEcM9gj+PV7DLmtq7y5QoI6ugajhA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1x6acQtbdo3e for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:48 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KK83rrpz1Rvlx;
 Wed,  2 Mar 2022 21:28:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 06/13] hw/riscv: virt: Increase maximum number of allowed CPUs
Date: Thu,  3 Mar 2022 15:27:57 +1000
Message-Id: <20220303052804.529967-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Anup Patel <anup.patel@wdc.com>

To facilitate software development of RISC-V systems with large number
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).

We also add a detailed source level comments about limit defines which
impact the physical address space utilization.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20220220085526.808674-6-anup@brainfault.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h |  2 +-
 hw/riscv/virt.c         | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index d248d0dfa0..78b058ec86 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
=20
-#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94fbf63ec8..da50cbed43 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -45,6 +45,16 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
=20
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
 #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT=
)
 #if VIRT_IMSIC_GROUP_MAX_SIZE < \
     IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
--=20
2.35.1


