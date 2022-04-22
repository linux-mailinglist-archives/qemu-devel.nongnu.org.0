Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599850ACF2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:50:18 +0200 (CEST)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhV3-0001L6-A8
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIt-0006re-7b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:43 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIq-0005IK-00
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587859; x=1682123859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X22Gk/zZHhqY/tFx/pG4kivGfaZbRT7+ckrdVTNf79E=;
 b=gwxQTIFLJh6NboIVSSxRNYZEaMaz0SwRfhpn+OjKCU4h0274n4901hbK
 c7yBTDU/yI+wN1BRvWbjm3uphpgXwIwL2PHUxo5H/ljkEPZd1ikcIMtgE
 tYwwr3bzU2Uh9hMkhgyXvilIYFgVJnUKTtIuhSmuBeuAFLTwWoQ3mVmr1
 WFXWxLaQwYFiSVFGKMPLP6c96IwFQ4kpXdLOFTNARlCoamnWgAkw9kA5j
 2ZrrXhQ1pOVdr4YFuzu+1KBtoc41Qd9n9UzIvdKocEK/Dn8QIv/gThTLa
 fWmbWXx32h0Z4lEZb6XvtjhwbEsjxJOWp5duayyfJ8hW4rCy6WUJAy2Nb w==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715747"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:39 +0800
IronPort-SDR: lvSr7W3xV9ox/5eYMzy8io0skbe8k24yql6//dJiJofyI8n6QRol5uP8oETUJOOUu4aAdBnYur
 3QPrd/9n9sWc1fXPhlqxbFIyLI7CZyD6xm5yc86Ko07UIJNYa4yd1VWMzdOTry+YrqtSgQUR4i
 DX/VLjMgjkIu16h5+wKXSmQTgT4k/VVjlGmcmbRjzag12dyoPbHIVERsp03kn8Nz/+yb43t4Z4
 Ip9gnIlNZuk7ortN6IHQWLIKg/jufJUFUvyvKAMRK6DHU9JrFEbSrr+gSiR5Y2HL6OSxfJe/ob
 kOB+93sn8JpvR0KYrm7tbX+G
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:56 -0700
IronPort-SDR: 8M4Ggm3vuTbuCoiV/JDYq8N3PbPFu4qVVvKEctA4s6Ms2FbKGN7dfZxBfFoaJiSPezaUCvUnl7
 +UzxBgSiMZR3Fc5yTM+IT+2UGXHfjoo45EVkWtCIpg9wK/8UgbLCI533LTHNJLyUiNxg++pwJC
 tJ93TfXqJ1dST9DhbbtiE8NZzBF2ZWgD7flU2lW4Vq+o1RfB4pbFPhQujmbu1dP2ZIs/SBjusZ
 aMiVVlsuDN+3mYj/jhw212mKR9FF7RKDqPD3hq9ion+DHadSB6A49gfPSCahBuRwfeIO5bABOJ
 Sgs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVC0SkBz1SVp0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587858; x=1653179859; bh=X22Gk/zZHhqY/tFx/p
 G4kivGfaZbRT7+ckrdVTNf79E=; b=JLbKhSC3jeClHzgz2meK0OINY2yAvMYgrb
 OzlnpfC8OWjmqT1maWd0ifOu3A9OXuUqyi6moOEyrdH+b2EB4HcjniEJ9A6B+uuA
 RuO/ZEOiNAHSWSH+S7aMquBCDd0IH2XmlitA3IbW1rN33TS8eiLMqCnvsnTXtqVw
 LdjwDVq5PEfuOEP4AO/zYf/l93TuUY2XUoR1QIJFwL37lMw+nDqOxmLlS4ixq2Wp
 PTDF+Cqz3jszaI3oeE4gLfLrEXIOGdb3NAf/n9O7kV2kQrKuqHQ0zMLaRXHD0am5
 SHFqGWJOLNkFlcANPYzcM2ORLoATDVSclh5Msjl2QGA8AyLmuYPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dtVxPdHijHkn for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:38 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwV76D6Pz1Rvlx;
 Thu, 21 Apr 2022 17:37:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 09/31] target/riscv: cpu: Fixup indentation
Date: Fri, 22 Apr 2022 10:36:34 +1000
Message-Id: <20220422003656.1648121-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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


