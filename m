Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABE5098B4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:14:46 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhR1Z-0006nr-CH
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSm-0006Cy-G9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:48 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSk-0007xw-PK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523126; x=1682059126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CDXzKpjjddD5WzsgwtbuNALNh5AMoIiu9HJXurmxYAc=;
 b=Q2p1tkcl50SoO5DNzkIhoQtaDZb3RB8JScM/48AKRbk0leSMBTBfINQC
 HEmaYzu3vPAk1iOXyhLfpZ6TriMKtrvjZDcjYTnLJXgF6R/2phguPEzb/
 xMZHRNKaeH2hA3i32hrHY+6KxkGbwaBQv3hYha0xqG3NSEL2F6w7fc8AJ
 mHn9mnPKbqg4OK3U1k3+BKvMAFh4yUyPlDKS/CMfM/sHW+IO9up2MQJLZ
 nTNoxUMOeavVqj5vtHlg4DPyOM6BGxP8iHhK/G2lO38xAOnk2WD+7Mehn
 5Eb3izsKtdi3dIuVzZwdcP/f6zjS89phmXWvGVIrnJsub/ih6yQhFJjCk A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640029"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:13 +0800
IronPort-SDR: 28C4HtaqXlTsKoTT4SDn4M4jk/9l1K4lxjiP290K2XTuX7wLMqs6h2Bdy6Wqyabc/0Z6lRZROn
 Zh4AzFrSeHj21PXY1f6DCg46/D6j7jNeGxKZss+9S1cdE9PR0XLlCCfclvGhIhwQj6KmmbgKSD
 Hg4RiDnzCIOHBzkhd/rPGSIzEuJfbtPveW5x0wKcprtpEKFe8wZy1CIXsdo8bS//82faLXuAwo
 2aksZycgvIUVRCf3Bkb6HRhIQ54iEFgViCUi2L6hEGE/OvpfNQppP/MHJzDhx+E+kEL34hEx2q
 LNvhp7FFsDmU37Q3VFf4tn9L
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:15 -0700
IronPort-SDR: lBkQu1bYdw+wfwSSmsfh7k52rdcR2/MHiwwO+LVP/GrBF+nT5g5jEvOcf2Ts3k2bbtQKg4P5OQ
 kAjEtFINCcJcmy+75L2CUtutscUv6dCu1HajadE+ATVbGCHjLYZhIUb7fthO1LKwaUgj7yX2Su
 GxtC3I622rHj95K5r2ANE40Hv6Ys5ncdCl4o7VYfvV9BLGTpY0d8YPi12p31GjpcZ4g9/RZZt0
 jKBHlZbquUa95tpUxFdNdU7Oab+AHyfNbnrFjmBWkgTgBqf+xSP6EzBBbuh1nSWCmKU6T1uH5E
 B3M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXh73Mzz1Rwrw
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523092; x=1653115093; bh=CDXzKpjjddD5Wzsgwt
 buNALNh5AMoIiu9HJXurmxYAc=; b=N0SKqrnNM6UXC+wKfBvIL4O2daqSqxNx7X
 lUtPrnLOX02pDsn2e+MMPDQABX0Ygn1T6gQtp4AtxXnANftabxyOe9FpYrhi8O7E
 TsnYtUCrN7K4V3fDBrIL+WaxvZ5q2JRHTA/9eOh3uDchxSgaH4aqspGhmTsbQWhZ
 xDJEKQtXi24EfxcToR7p2IS3nuSZ15dW9a7Gmq0EtGbxmRHphdmVbqBxOC33Txli
 pXQoA5I25d22hquv91Kw310uM0Z7N0z+K7P5xrmTxsiVwAgCTEmsZWwWIcyWJkAc
 6BTkIrJJ6irLUiP+9pOlahJas+gHHmStYORFiRqGiIn1Oa4Ag0fg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XGxpoo9f84KS for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXf3wb0z1SVnx;
 Wed, 20 Apr 2022 23:38:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/31] target/riscv: machine: Add debug state description
Date: Thu, 21 Apr 2022 16:36:27 +1000
Message-Id: <20220421063630.1033608-29-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bin.meng@windriver.com>

Add a subsection to machine.c to migrate debug CSR state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-5-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 243f567949..2a437b29a1 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmtimer =3D=
 {
         VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool debug_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    return riscv_feature(env, RISCV_FEATURE_DEBUG);
+}
=20
+static const VMStateDescription vmstate_debug_type2 =3D {
+    .name =3D "cpu/debug/type2",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(mcontrol, type2_trigger_t),
+        VMSTATE_UINTTL(maddress, type2_trigger_t),
+        VMSTATE_END_OF_LIST()
+   }
+};
+
+static const VMStateDescription vmstate_debug =3D {
+    .name =3D "cpu/debug",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D debug_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
+        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM=
,
+                             0, vmstate_debug_type2, type2_trigger_t),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -315,6 +346,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_rv128,
         &vmstate_kvmtimer,
         &vmstate_envcfg,
+        &vmstate_debug,
         NULL
     }
 };
--=20
2.35.1


