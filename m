Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908250981E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:04:45 +0200 (CEST)
Received: from localhost ([::1]:37360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQrr-0001ur-V5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRK-0005Ft-9s
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:18 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRI-0007xw-Ly
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523036; x=1682059036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X22Gk/zZHhqY/tFx/pG4kivGfaZbRT7+ckrdVTNf79E=;
 b=LIe/M+pg2D0YOJ1J110qGRK7SXWq7KfzmfO1J1nB+2mSMAEvW1Zvqj4+
 GNbhZ98s6x71494hdyzrIbv4s0aydhZLLQkFCAlvACbIfnhRvE2qwkFKd
 MZYMIRjZw2BveaUVc8WySUmcJH38qo3gheveDv1cCtOq6dR8w3Gjoe3BV
 Bu2AamM1EdkQOXdTQpp5WCOBFKBi6a/V+RF27Q3Gc2YXrNfMFvhA+rJ1Q
 yxAdb+3UF17iYxwFWJfWfWzW++MswZyC20NmAeB5C5pJjYxXJVHqTWyuW
 yIj8MgpXh/hpGj9l5+T6SXFVHZdZkZoTPWOLfm6SUGH6cXjmrXZozVgu/ w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639963"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:15 +0800
IronPort-SDR: jcxzerP5YdZx9lzparjTfeT8QaQS3uZpsSiPJR2N3xa/ij+ezu5jUaeqEU99WTBVUHPfENYgrX
 5VMCE0MSOKe9/f1XIzfjOU9tMiKMnzm3NWdX3k4ruP8X+mSIjkRFXwktqr8hZsWfzLhVm4aEUF
 YcDrq5urgzyoosdUH4pPsGb8N8MoJxlyDxHEXkpQetgmsKGS6bxrMWVrgbb/jMPs+FGMdu6+al
 nx5BHHOUXtHQsDqAxghfBfDAvVrbfmKvRMbclAU+6zs5fr3CnhvRq8HJi6qJT3cqkv7+M/Qk5y
 EBd7GMOvElD8ZOG6lRHB2lfp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:17 -0700
IronPort-SDR: DOAuENAH7qmYGi5MIsX1eJe6Nv8hkPAxvu+eflgEWPyy76LJi2mPz61WRBNsAzgZ+c8VP89gK8
 ++ABVsBbl5JYVnZkntTrsYwKkE5q3dyKcbpE2ptB9U+L8mgYCep3ZTg6TkUBIKvUCMTRN399+O
 wotIZmwvNcWwYMa6OaFoX0iqH8UHVPpZ+0pTatbG+pP1mo1ONB47mufBnS67y/VfnQXj6My7Bu
 2Rx85CQNSNdMZRb8og/WNBnFWlQ6QUsZq5SXUvXOkbRb1DapiDZIWapMhDcJpN+2QRSw8iuOvC
 q+I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWZ6r48z1SVp0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523034; x=1653115035; bh=X22Gk/zZHhqY/tFx/p
 G4kivGfaZbRT7+ckrdVTNf79E=; b=JZasZDboMNUdRJydkDoMOkgrISDLFIeGMl
 DuYhWMFtEQuaKLxV08nnQ2hIYwHSwymlXdAGW8bPH3NQIIys7Qvhu6cyR5OXEGaW
 DmNuGfWGaymalANQLKpKNiyx8eKSJww/10vXCRQTea3PkIjHKX0bhJbgnrZ/7Ay2
 D20v0c99ithfOzOChm5J0AID0v7mJR8Tntuua8EauwYkS7LfoLmV5z7CVHwD64kh
 t6ub/u79wx0O8UheT+axhxxcjVXGj+vLKZ0fpzBHMnB/YQIE483Hk8lm59RWEj2Z
 tOnfPeR/a4TkmW3yDjbWAn0qSqgo+JmNprgatoCO762tvpGav99g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1mYs0dQtgofm for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:14 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWX2hWPz1Rvlx;
 Wed, 20 Apr 2022 23:37:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/31] target/riscv: cpu: Fixup indentation
Date: Thu, 21 Apr 2022 16:36:08 +1000
Message-Id: <20220421063630.1033608-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220317061817.3856850-2-alistair.francis@opensource.wdc.com=
>
---
 target/riscv/cpu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c3fd018ecb..78fc7b22ed 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -569,18 +569,18 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
-                       return;
-       }
+            return;
+        }
=20
         if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
             error_setg(errp,
                        "Either I or E extension must be set");
-                       return;
-       }
+            return;
+        }
=20
-       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
-                               cpu->cfg.ext_a & cpu->cfg.ext_f &
-                               cpu->cfg.ext_d)) {
+        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
+                                cpu->cfg.ext_a & cpu->cfg.ext_f &
+                                cpu->cfg.ext_d)) {
             warn_report("Setting G will also set IMAFD");
             cpu->cfg.ext_i =3D true;
             cpu->cfg.ext_m =3D true;
@@ -711,11 +711,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
         case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
-             if (kvm_enabled()) {
+            if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-             } else {
+            } else {
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
-             }
+            }
              break;
         default:
             g_assert_not_reached();
--=20
2.35.1


