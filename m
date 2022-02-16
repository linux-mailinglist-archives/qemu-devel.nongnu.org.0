Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B654B82FD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:35:58 +0100 (CET)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFn3-0007c1-FI
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpm-0006Vy-Ay
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:38 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpj-0006h9-Dd
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993036; x=1676529036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DVUTjB2lAiVl3JnKm7Gl1e92WjdQT2bI1iA7+W7EZ4Y=;
 b=MN8RoYl/3DbhCtaJcFI7q4xauQ6hlZLjPTjS1sUkx9a4gTDAubdY6re2
 ZjIngkwquOQ+CwKlIfIYtYf2DFmcWfICIp1ylT+ILFGy3CLeg0DeiIwy2
 jrze8J7MpgYPEsZZC3gfrXlVQuVoeaI/ghZs3egZsvKeMiUiwG4y/0FJk
 mneJAtIaTvojH8HK512KlJ95z0mFruhKKfugQXmhtpPCjlRA5w9920Osy
 SgCPxuo9JqcVgB9KUBqZ5LikfgQM0j97MdwfUG06Ef8DzixRQtJFgeyuS
 RLtNHTC/gvS8D3S5oqfjgLCZeVbzY2W3PCzAzeCLhrgpAdO0joRXj5mw9 A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="194046761"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:35 +0800
IronPort-SDR: h07u/iqRUt/Yz+m5pWFp6/w+MP8B2isObmjfIBP1zGBaJ9s3/SlFZXxsOaRUkTqARSyeSlp3I/
 TxBT9tmgTBFygKtFEwvA9lhOd8CEpCiIM4froTFJgTvgsSbEy4CxxJtDWBNesuOdG4sRsCdv4B
 fz7OhId+SJSqIkH8yCId+CzfCmpj8GRh3VPwtjicZVRvuE0BeCvNYV0mhnfiVXEtkT1TO5CoMx
 zf9SMXoXgrQOk9FYo0Q36v1cz33t9fAy5lgFdTOu+EKJk734erl8qzo8VqzXpiWDxufPyoEVX3
 L0p4GoSocTXdNznZIis5/PLv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:14 -0800
IronPort-SDR: FNVc2zM1BUkIS8WktONsJygWyZRCxnlO6KdaS1NX+Gfl9H+LWb9kYDG+CUQR4o94H+f3ZXhBFp
 cZYoY9eNIDCUsBvFs6bV6K3LjeK+00NK+g4zaKTN0aPuRHVTYbo/tfVSgL+Nr/iJ2wpvKdtPmj
 04TSuXvShOCFYjQcdTMja3TGklTPKlzfvKKk4NtClZYMY0E1EILQluuOnj6awbisbL4oDx1Xij
 S0bN9soWB1vhQDFVmWHWixYHgw3OWJHGz2CWi9klbv/H2XdNDpBXiRhUXIvc9je22SQOm/EZyt
 yr0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7PP6jwZz1SVp2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993033; x=1647585034; bh=DVUTjB2lAiVl3JnKm7
 Gl1e92WjdQT2bI1iA7+W7EZ4Y=; b=Ihin+WVi9NWNsWxhHi7w4F5KCEko337ZgJ
 ACQZlrp4jSuN0o5jKGXCsliay4sIgBSei0MX6peGFR0FYK5kNHSBHazz70QAol6R
 OnKC3iTzsVHvoZRwE07Pn3U7KDDEuYspKVcbY+FIsbaTbgXGaHfNwb7V+KqfAk1v
 xfYRQRau12I+MhACA47ONAudvFo4uuwH0fOvIg9MH9wrIC9eBBldE0t6Yqx5Gq5P
 W3cocr2Uu0APhy7G+yeymdESbm36D1Tfer16zGg6G5ODoRf7/iYLryzWDZIzuQPj
 dM5f0uJZma7+I/e0goeFxMcH9f4aDaYsddoNJyjuIfX+aVG9ZBWw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UwdMX9y_fvLB for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:33 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7PK24tzz1Rwrw;
 Tue, 15 Feb 2022 22:30:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 16/35] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Wed, 16 Feb 2022 16:28:53 +1000
Message-Id: <20220216062912.319738-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
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

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on the machine.
2) We can have devices which require a certain CPU feature. For example,
   AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-6-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  5 +++++
 target/riscv/cpu.c | 11 +++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f030cb58b2..283a3cda4b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -379,6 +379,11 @@ static inline bool riscv_feature(CPURISCVState *env,=
 int feature)
     return env->features & (1ULL << feature);
 }
=20
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |=3D (1ULL << feature);
+}
+
 #include "cpu_user.h"
=20
 extern const char * const riscv_int_regnames[];
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f1c268415a..ff766acc21 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -135,11 +135,6 @@ static void set_vext_version(CPURISCVState *env, int=
 vext_ver)
     env->vext_ver =3D vext_ver;
 }
=20
-static void set_feature(CPURISCVState *env, int feature)
-{
-    env->features |=3D (1ULL << feature);
-}
-
 static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -508,18 +503,18 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
     }
=20
     if (cpu->cfg.mmu) {
-        set_feature(env, RISCV_FEATURE_MMU);
+        riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
=20
     if (cpu->cfg.pmp) {
-        set_feature(env, RISCV_FEATURE_PMP);
+        riscv_set_feature(env, RISCV_FEATURE_PMP);
=20
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
         if (cpu->cfg.epmp) {
-            set_feature(env, RISCV_FEATURE_EPMP);
+            riscv_set_feature(env, RISCV_FEATURE_EPMP);
         }
     }
=20
--=20
2.34.1


