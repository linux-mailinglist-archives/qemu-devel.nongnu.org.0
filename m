Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B60F514172
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:33:47 +0200 (CEST)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIKA-0000Z1-Gv
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIH-00062u-2f
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:49 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIF-0002SM-4K
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206705; x=1682742705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DYi/CZ05TiOUnrE+ghXPcVEsft2lcK9V1sqhgr1wLls=;
 b=oPeNe5HBWqp6ldYLG1jVx/Fi9+5j/mZtlSt56rJHI/tSMxDMfaX8kBPF
 JtMflFJAx5qhxmVxljDzhPZSZqfcQ1FPpsbuW+TkTGVCSb2kX0VZFF+p/
 y2HePXplXIjVGc+J5oohuM2Au55EqQzh5nFHTJcxpyWpgUST3D8r/1qqG
 INbsYVhlpIm7iI/a4ZycHH0MfYBJNV+CL/yFEtopzyPtOIO1+y1YUhi4A
 iezDSnTDXCRkb48F2IQIs5pi+Ix+E0whi1lGw5SWLxrjl4TdE6xgX6e9M
 1q0mHCblIFAvH60+QDbPiAF9/T7blv7U+PAUuySHzoiKLqcnJvCCqiC2K w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995901"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:44 +0800
IronPort-SDR: Z4A9RM7vdA/6kRZe7uItWopoZTzIVvvNTzYyHuaag1ETDLMJQi5X8uxBO9bTk+oXynOo87CITF
 5RtM25e7lSaYGZPu84EM//gOylaGUgWVymQHtbalncsJ73mX8rN9MP6urlq7IcGlz9PEV4z+gw
 IWN7o0ptuVgotJBUDVUFkZEvcpncPMe7GKTAzeBSutROdhi/X0wpzCxmgNKvoj+0q02HcCpt8p
 m0Nf0u0tQnIGdCRU+aT9pJ7metEwPfRMNfzwsI9aTqEglW/1lfEZvj/JGw7inudqw3r0tFUu7z
 gKIE63NHIIcvEKa1vKqCYkD+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:01:54 -0700
IronPort-SDR: N2ExxaGELalzEZivy9Jsvs4rvu+nHYCL2oVpSS15KE2/Ln1XUgGSySi+wrj9WPw0AIfZzM+RUx
 kOPncrikyRbGYslmq1Z3gC+YpQ4jCQa/JhUDaFa+Yu0hlOUMrHoR8kE4LJ7yiF2n1UDhuxDZAc
 aO9HMoG/ZNCIhFRF4WflQflH1fLgifdl4cpbPn15Jf23uJ5FwDVXwU7hlGed8IHfT/s5K33Ydc
 OSwf+bC6jOMdoMekYu0snaU5OkqRiaCQlSQyW3C6YBPW7gBrADyDAj01RW3xo/5Cr2QdewckXb
 gL8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKM60478z1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206705; x=1653798706; bh=DYi/CZ05TiOUnrE+gh
 XPcVEsft2lcK9V1sqhgr1wLls=; b=erh8ppk/RR67JJoIlzoJFZRiAKqc5pSm6T
 ptuZbmZxaS/m4tKp0wVvkKH3TFGN5Nlqa2bCJ68+90H+ej3USttl4To/n3rMiJ15
 ie2oNW3Lvj4vvA8EGjLmju1GESxOuoenHRAC8ur85MmEgXtpIf219yDKv+jsJoQP
 U5MjSzvPJtUS1X3okCLtU3syrsYzXk3lz3Hfn2xIWbQAdGAQahj8BEAaWZ7reBNW
 pj62VBUf/X0QLoYMYloZ+YgyWVy/QCnlVlu+rva44B2V93RKz0WCr53h5ZcOTWhs
 JaexkHbKt/X1UX8kME32e91OKohTSo4GsZ1Bs2tZRqDe7d29Tu9A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OEc3VDu-DuvD for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:45 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKM32ZB0z1SVnx;
 Thu, 28 Apr 2022 21:31:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/25] target/riscv: rvk: add cfg properties for zbk* and zk*
Date: Fri, 29 Apr 2022 14:30:58 +1000
Message-Id: <20220429043119.1478881-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 13 +++++++++++++
 target/riscv/cpu.c | 23 +++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 46c66fbf8e..fe6c9a2c92 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -377,7 +377,20 @@ struct RISCVCPUConfig {
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
+    bool ext_zbkb;
+    bool ext_zbkc;
+    bool ext_zbkx;
     bool ext_zbs;
+    bool ext_zk;
+    bool ext_zkn;
+    bool ext_zknd;
+    bool ext_zkne;
+    bool ext_zknh;
+    bool ext_zkr;
+    bool ext_zks;
+    bool ext_zksed;
+    bool ext_zksh;
+    bool ext_zkt;
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ace68ed855..62a47c197b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -612,6 +612,29 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             cpu->cfg.ext_zfinx =3D true;
         }
=20
+        if (cpu->cfg.ext_zk) {
+            cpu->cfg.ext_zkn =3D true;
+            cpu->cfg.ext_zkr =3D true;
+            cpu->cfg.ext_zkt =3D true;
+        }
+
+        if (cpu->cfg.ext_zkn) {
+            cpu->cfg.ext_zbkb =3D true;
+            cpu->cfg.ext_zbkc =3D true;
+            cpu->cfg.ext_zbkx =3D true;
+            cpu->cfg.ext_zkne =3D true;
+            cpu->cfg.ext_zknd =3D true;
+            cpu->cfg.ext_zknh =3D true;
+        }
+
+        if (cpu->cfg.ext_zks) {
+            cpu->cfg.ext_zbkb =3D true;
+            cpu->cfg.ext_zbkc =3D true;
+            cpu->cfg.ext_zbkx =3D true;
+            cpu->cfg.ext_zksed =3D true;
+            cpu->cfg.ext_zksh =3D true;
+        }
+
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
             ext |=3D RVI;
--=20
2.35.1


