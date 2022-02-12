Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E664B323E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 02:02:03 +0100 (CET)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgnY-0005xB-OY
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 20:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftN-0000MC-CB
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:58 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftL-0000Ve-Jj
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624237; x=1676160237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=djZsNSZmj0MwafL68wVEq02+3j86tpfYBkXVMiPOOEo=;
 b=f+mkOZ4hv0IgbJB8ccRgyS7aC6Ms575urohfQrH/dyP2hQ6cNAsmRiur
 eA5c0QkCq6gl90HrIkz69PvrDkV5adwdptx9iPZGk7eQmanvJMJi7zPBx
 3z6eHRtmsh8C3qehUZeannnZd63g88Yst7SPjTIWGV2tF6sp/CudnYdTn
 F8jyBEie/1QcbapJZEuWkJhX54JnC7LimR+vl/BQEau1/4loTviNAKGuw
 CL+9LAYRgsdfKp+sQcTv+v7XUamTa/ElFH9ulGC/jlFk/gO9vdwrzXUwu
 9UnXx3twovi6G3CNK64nxdtlNGiACoKbOuPIBngVnyp5XNB8xszrR8Fyh g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710279"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:46 +0800
IronPort-SDR: 1ct+szuj5TXa2QCKneeG/Ew1ogj3HHVQ/tWKWN6gZPCSUBdMN809w2BHWbKm3YNel3FUQunUEQ
 Sq9pPq5H7jb+Vh4dUwJbIE3umbtufrQ6xr+JYFSzK4JPdhGN7Q+Azx8bp84ok84fXfn8tkZD8a
 WUrno3BfcSE8sxTVJ2fHkG1WFd5wj/DUbg4rUQP4bcB9pg1Dsd8lIWH8K1hbJcRSQCPK9WoMNL
 4sJ4/qknGgMzjD/JtuK2TL4rqutcbN/M2UfBFhiy5TaMQ5crR/Vgu25Q6dNExJyrruV4oGa2hU
 bHT9M8LcQSEbXAr9Lvkg6DwH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:30 -0800
IronPort-SDR: fXsWF320OluuxLtSG4DIE/ie7i4ngqrw0mJfCCXZZEVEOcyn0d3JXl3bjmWAGmQJ5QI2smUAN3
 vXztI+8jRbYfF24tBuh5dd4TlMo7pEHedH4Xi//DqXiwEQrJXwuyNW3Vu8/YGmlsHRArRxyblA
 TrWd4akNlHoUfPpViHwBknvovHSLMHAvQAbQMEmccFH3Eq0/0e1T5EVsBKC7MU+C+kS8TA27rB
 mBnYkP8Kn3rNrsYgDbSP1VgPf/eEyR/sEfqJtUF62My058HQwI9N9ZhfwQTTAaTp3d/rws0E5Z
 EzE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW0w1dwgz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624223; x=1647216224; bh=djZsNSZmj0MwafL68w
 VEq02+3j86tpfYBkXVMiPOOEo=; b=Ca8SBWV8hMlHlqENPG/hcshx5MYRWEFeqK
 mNNRx3X6pH4ZrVLgfjyrhcf1iQME4snrmtHcSRr1PwaxN/IEHceHqrg1dQcsYWnW
 kaasRcXEPpwrlZv53bPfNzV4f1/5mg0wGU0HqeE2ybFhThyur46WwVXmDi5wzWFF
 7JLCIJz6KbXLYzHX24Our9qczYfDIbOTN/3BKCxqwDO7ddmh+R6U5SwBES4zV+KD
 PiqAzqWz6M1iEXTWAuea2hgZQGLsFxuicAd1V0H+LWM/tcmisxsH64ucqEBjHUMh
 euf3cgvXMCtxlONyaVFaxcbopAhrPgBwfCQMIMCg4vQSAJdNdbzg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id No_0NwbHws3x for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:43 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW0q2yxhz1Rwrw;
 Fri, 11 Feb 2022 16:03:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 34/40] hw/riscv: virt: Increase maximum number of allowed CPUs
Date: Sat, 12 Feb 2022 10:00:25 +1000
Message-Id: <20220212000031.3946524-35-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-id: 20220204174700.534953-24-anup@brainfault.org
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
index c02710f711..7d5f1e58c9 100644
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
2.34.1


