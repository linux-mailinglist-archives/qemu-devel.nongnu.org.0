Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E2E45438F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:23:06 +0100 (CET)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnH9l-000810-9o
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9488079f4=alistair.francis@opensource.wdc.com>)
 id 1mnH7c-00062K-CJ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:20:52 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9488079f4=alistair.francis@opensource.wdc.com>)
 id 1mnH7a-0000eR-IW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637140850; x=1668676850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtIiMNd+gnQkW+FJySxVeNtLsLEjUwXbl9I/M9slGac=;
 b=gBxUuiVZTRHQ16ebI7877J5BreQ96iOjBCzB0HSiXlZfeHAtQSM0W92B
 UyzCKfBe0CecdeAHwfwbVp7vcOZm56tvNf7IiG3HWELDxHL1sq5LIRfqs
 jL4x3VkGnXI4AH0MXQeGctXROzz2bPxzK2mPxG4vjf38O0NXgNMB9oanP
 pFjV3Bc8Xs/ZMwTitjGkzBmQKDlTyMjuY+DpLTgb8EsK9N201FkBcz6fL
 U6X8HbHSxhGcyLW8mYxVZ0CmUkPRbMkV7LMTY6AsKmHJPzHtx3aOmIPqL
 PrETWcWGs1Vb/SGNTfV8jOl2Y8WKqfYMV10D/6AeZqtUYphNTIE2RLCc7 w==;
X-IronPort-AV: E=Sophos;i="5.87,241,1631548800"; d="scan'208";a="184819105"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Nov 2021 17:20:44 +0800
IronPort-SDR: I5Dc7Ec4216CUQ7TbdGBkw0js8sB3v8pqgl57tyTAObLpVe9Xhrioh6dw4+0oDjI+ai8NlzdHg
 tg9uXVKj7LJt0gylv5nwR54vEIiPlZsmyCjz9jtqkfW0Drt5rafa8iqVNKo6ifk+2A84j5MOK5
 hvG8uN2Lk2oBCD33H3yHaDpk9UCja+YT2ui70Jo3zKC7W44T6+Qk/Pu6WlL5/vcvMPhR4jYjvx
 XEc2nH5forGOezKkRnQ4Nx86HgXRHlZ9LHg/PKl05/u1gSpFclRhfSgQ9iManlvlktg0LL8CgB
 OyNRUiUfUqNQZyi+tYCw8dGN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 00:54:13 -0800
IronPort-SDR: rs5f8rZ7jLVl5bbG+ENn5tSxajzwwf2FF7PX3VR5RclOpsErz2bPMqDDF0tIpURdPIzyLOLn6z
 zdrGWMpbHR2sHyBD5UU21llBTKSN+69w11Pl/OEGF6WNHsXn6pIoMc2+8pE1TdDXARMBCWcxrr
 091WfcD6RkNUjGvEocs0YujySrGuYyEhLjMza8TpBQgDEF5nv1GYwdINx7zjkO9KDLs1g2dXVm
 iy07ZX5exhxgElaptk5VMbmWTsQfDTSebv3KWiojz4a4g2UOiNsYjWdkDpYTIeS3P6apMlmA2U
 lPk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 01:20:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HvHTm3cZkz1RtVn
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 01:20:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1637140844; x=1639732845; bh=XtIiMNd+gnQkW+FJyS
 xVeNtLsLEjUwXbl9I/M9slGac=; b=B7mUUY+F6VDJSAu+EthGpXVvbQV6szy/id
 agb+mUfmuKIy+gSIWiPEq8iZ4zvPnWGpER9wbSML3tr2mqNfBsnrBRkjJ8zSbJXu
 4nLE1RgHAy33A61pMtl+ue/qgMlO27UgBET9U8ECzqq45Lp5rmzznrDgyQxs9lod
 6YqIcno1yOmjcbWCnujdBkEE7Wwn/pf1XJu63U6dQ6GeqRSfTKVPKFl/351vKnwo
 +uDFuGYk/QrL4bUjNo2zZyd6Es7cuqoPGS8EY2l21EhmVTzKUxjVQ0pKc9UlL9Br
 CrhZiD+4grahVC+vihmzzScYIgdqX18gjYFmsaOHkKpQ9jUJn0rg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wHUlJOYFjsqr for <qemu-devel@nongnu.org>;
 Wed, 17 Nov 2021 01:20:44 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.57])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HvHTj1ZzKz1RtVl;
 Wed, 17 Nov 2021 01:20:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 1/2] target/riscv: machine: Sort the .subsections
Date: Wed, 17 Nov 2021 19:20:30 +1000
Message-Id: <20211117092031.99019-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117092031.99019-1-alistair.francis@opensource.wdc.com>
References: <20211117092031.99019-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9488079f4=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move the codes around so that the order of .subsections matches
the one they are referenced in vmstate_riscv_cpu.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211030030606.32297-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 92 +++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 7b4c739564..ad8248ebfd 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -76,20 +76,50 @@ static bool hyper_needed(void *opaque)
     return riscv_has_ext(env, RVH);
 }
=20
-static bool vector_needed(void *opaque)
-{
-    RISCVCPU *cpu =3D opaque;
-    CPURISCVState *env =3D &cpu->env;
+static const VMStateDescription vmstate_hyper =3D {
+    .name =3D "cpu/hyper",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D hyper_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
+        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
+        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
+        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.htval, RISCVCPU),
+        VMSTATE_UINTTL(env.htinst, RISCVCPU),
+        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
+        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
=20
-    return riscv_has_ext(env, RVV);
-}
+        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
+        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
+        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
+        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
+        VMSTATE_UINTTL(env.vscause, RISCVCPU),
+        VMSTATE_UINTTL(env.vstval, RISCVCPU),
+        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
=20
-static bool pointermasking_needed(void *opaque)
+        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
+        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
+
+        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
+        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
+        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool vector_needed(void *opaque)
 {
     RISCVCPU *cpu =3D opaque;
     CPURISCVState *env =3D &cpu->env;
=20
-    return riscv_has_ext(env, RVJ);
+    return riscv_has_ext(env, RVV);
 }
=20
 static const VMStateDescription vmstate_vector =3D {
@@ -108,6 +138,14 @@ static const VMStateDescription vmstate_vector =3D {
         }
 };
=20
+static bool pointermasking_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    return riscv_has_ext(env, RVJ);
+}
+
 static const VMStateDescription vmstate_pointermasking =3D {
     .name =3D "cpu/pointer_masking",
     .version_id =3D 1,
@@ -126,44 +164,6 @@ static const VMStateDescription vmstate_pointermaski=
ng =3D {
     }
 };
=20
-static const VMStateDescription vmstate_hyper =3D {
-    .name =3D "cpu/hyper",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
-    .needed =3D hyper_needed,
-    .fields =3D (VMStateField[]) {
-        VMSTATE_UINTTL(env.hstatus, RISCVCPU),
-        VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
-        VMSTATE_UINTTL(env.htval, RISCVCPU),
-        VMSTATE_UINTTL(env.htinst, RISCVCPU),
-        VMSTATE_UINTTL(env.hgatp, RISCVCPU),
-        VMSTATE_UINT64(env.htimedelta, RISCVCPU),
-
-        VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-        VMSTATE_UINTTL(env.vstvec, RISCVCPU),
-        VMSTATE_UINTTL(env.vsscratch, RISCVCPU),
-        VMSTATE_UINTTL(env.vsepc, RISCVCPU),
-        VMSTATE_UINTTL(env.vscause, RISCVCPU),
-        VMSTATE_UINTTL(env.vstval, RISCVCPU),
-        VMSTATE_UINTTL(env.vsatp, RISCVCPU),
-
-        VMSTATE_UINTTL(env.mtval2, RISCVCPU),
-        VMSTATE_UINTTL(env.mtinst, RISCVCPU),
-
-        VMSTATE_UINTTL(env.stvec_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.sscratch_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.sepc_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.scause_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.stval_hs, RISCVCPU),
-        VMSTATE_UINTTL(env.satp_hs, RISCVCPU),
-        VMSTATE_UINT64(env.mstatus_hs, RISCVCPU),
-
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
     .version_id =3D 3,
--=20
2.31.1


