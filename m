Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB924CB672
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:34:17 +0100 (CET)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPe6S-0001wh-Ec
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:34:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe19-0001hz-Ti
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:48 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe18-0000IF-6a
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285325; x=1677821325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t1GoyBNEEoH1/4EjkN226ZZt19ZRWA/EXrkabE2mpbo=;
 b=Qm4E9pT96yzr12V/R3HJGMJOpEZcbHbVUzuK5daUKdnCkpfBcus023mX
 dENkfvi+3RgtpMnn2CN9aItok3sB0McU00f00VVlZjjiqTtCnRFUx1Dpi
 LKRr00lUfXR+tVLTPDwG0AUrdgJmhQubbwAyoKnVOccRoCP6PDG1xauKL
 45zCbEitnp/J0URJKtNzaIdmgmDzx54KaHO4vPQv3vgAST7kE/YjKnKid
 LSYVp2b+Ql7qKQ115Zm3CxExRR2Fw3moZf24Jvoe1q25cS8WM3UfLnRQe
 MtOR5sEApUnvtkPkVA6E9rVV8ZZHi+jevVUlvr4Rn9sp5Ci8K62CCvfck g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194355348"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:44 +0800
IronPort-SDR: /OXtp6sV3qi6+wmw0aQ0OtCcaQSoewhPmqsQsbHEG8hdrv7oQiGUuAB6+odtkvTfZOhUu0fG70
 wzwyEG/Q4Fw66Jq9yjaunqdDaArGVV89fAIWUYTBJqAhCkUVx12I3rneBiO6EhSRSh9iOUIbyl
 T959fRAvyZ2QuMDPUbFAhHpgWVMsJxIh1fLwCn9hKJUTWeABcubY+mij+VtPf55/tTwGQSiuLf
 SbNwVZ0WodOzzE9sJW4ZAkYpMYYQB4E/1mtwDSzVtkJfv7KoEJL5K2dMohubgtaI8+CtaLeE7Q
 CQ2lTzXn5Km1Wf2G/j0QGFU5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:06 -0800
IronPort-SDR: GsAgHEve2DSu8FuH87RPbFuwu/ZojSd15FHdvSYkdUrkRlbCqrbqgL6SNV7/XqioLbk0MML9jn
 SrUvQjcjJHDDoJ+FyQ8xdZj9b0DvMB7DNEVaIWA6n+83EgEqn45e9iSxcMCePG/wxox83kxr+1
 k3gyjKDteGU1cSn4cx2JAJtGO5o2nDeGCQh2QolOos7CzmwLySazEkPN7LcTNW3bVIIQu+Lhwy
 sObGFl+6YGjvwmYZLXzI7VECVM9lhO86GaPMExgxQB6p67uBMYAaUZZgdT2N809RVZ7lhrOLqR
 UkA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KK81ZGYz1SVp0
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285323; x=1648877324; bh=t1GoyBNEEoH1/4EjkN
 226ZZt19ZRWA/EXrkabE2mpbo=; b=pR2h4qk/JZwzB+21hNiKkgsVc1sfg08Zn9
 L/wVclOkjE3VwIqLsU0IN4veaU4d0RyX8QdO09U/rQSTyqlKQcnpeH4m/MlZdVyp
 8OzWOhZAFED/gjOy/tdDvks/K/pRHWDaV6COiMTM9khpaLHkPXB25RosCrmBJabd
 2ySbLn5fwU76ZYkUPXv7aFYtsgvs4zpj4+uVMQhFoFl6p91Kpk9LpCVI0rl+umXe
 GcSsqVuezc1HDKoVtTAvG97c5103Lk4VcM4gl8B3plwlxrT4cqLM7GcfWW5deGoF
 21/IGNIVFDCjw7B/yBJ7lXgphOtLYdxjRHy7NTn2q0BWat7w4/9g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lI0hGlKMqDQ0 for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:43 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KK40Zlqz1Rwrw;
 Wed,  2 Mar 2022 21:28:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 05/13] docs/system: riscv: Document AIA options for virt machine
Date: Thu,  3 Mar 2022 15:27:56 +1000
Message-Id: <20220303052804.529967-6-alistair.francis@opensource.wdc.com>
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

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20220220085526.808674-5-anup@brainfault.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 08ce3c4177..1272b6659e 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
=20
+- aia=3D[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=3Daplic" sel=
ects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=3Daplic-imsic" selects APLIC and IMSIC (in=
coming
+  message signaled interrupt controller) to handle both wired interrupts=
 and
+  MSIs. When not specified, this option is assumed to be "none" which se=
lects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=3Dnnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a g=
uest
+  having AIA IMSIC (i.e. "aia=3Daplic-imsic" selected). When not specifi=
ed,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
=20
--=20
2.35.1


