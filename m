Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E347A4D8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:06:20 +0100 (CET)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBoR-0004aG-CT
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:06:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmM-00048l-5Q
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:06 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmD-0008HP-Lj
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976398; x=1671512398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KyE/KWqy53uagTbUnF1cph5MWN5V5tD0ZfLmBj2Alik=;
 b=OG76pp7OZa4i3JQCO0VD8n+3CN1zvaZyXEn2i2Xd4ru9VvMi5CPyUwOO
 lfFAT4zC2CYUtiH+Ph+dLnXWPjhuOab2tPrd5nBu8z4UcG6QGzN70Rx+0
 nNkb9KRP79ozz2cgGZBDICxEsLCD85qkE5Hmc7ET/av+nW66M0PGGiLla
 6SrT2NWMIMJRTDLz4RyLgoYHnFwMxgpDOEDtOKCQBZFY4CfhZb6Vjd55W
 Z4YoL8HXhUPLfvISzfw2O8TuOXdE/8EylzYZb19W56qPyDyAUDkTUnelI
 JQfu6GA14OCY4lT/QR9QyZkbceiPvBziYS08YGxXTujstQnwzD8g392iP A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680068"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:57 +0800
IronPort-SDR: MFC7C9oI7vgQS/n3Ybcd142ZF7JNmXxP28OLtcPpt2zjQ1Yn5VysxA1uH6x+MV6GZYXk49t7P5
 RE/Z5Ki7iwdE6moI1zBoPZmFfK/CKhkGNPSHs7rc4w7CwCQsh6CTobUSYbuk2Dk5QlK+yB98Mw
 BTUwzQ6yJMVbn7gBkiVfyCxD3XaPiUiq9El9VHWvZrQj63DTKhUKEcQi60sBPOpIl//spaUxqX
 Qf+6csFDojlhx7IHIcv87zxB8BuASy7wAA/cSXrTtDBC9WPEqkivVmJovo10K+BiCxukxDsMSn
 CAp2V0QNxP+Wrb5t4tzbpd+Z
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:45 -0800
IronPort-SDR: /U9uzaQQVjV80wtd94Ra467o7ejd2GdKKAt9bPpW8JKixYlzSHDqVH0DLpxiNNCg6LjDiavgjb
 BWvYeGSLURzdvcMZGaeUrWeekB7B5A9/ec1kHKPgjNJePmnPwf79PoZIFWrjO7fO+lzJ6CJLDN
 /luMan+zwthg9lw31orB8P+sHwPGGid/lRxxg6YwW1curaaeKuD6xxxFGQ/9x4OVYvUmq6kKCm
 /A/3h39SFOQ++rike3+sWnIJGZHW4O2rjyM2JAgCv1o7goQOo40K+h2giniTeire3TF/L98thf
 ulM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7c1cfjz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976395; x=1642568396; bh=KyE/KWqy53uagTbUnF
 1cph5MWN5V5tD0ZfLmBj2Alik=; b=sOQPdhIjsD9PmOTo+DOBbsdDObbncTkR+K
 ETFQepCmSGhsGpG9m9QsflCB4uJfhUtMMGUyQK64Pnv0B+qbcvyBd1IblnRmsGdp
 cO/tQ2TPY42IA2wlkRhf5JY7qIfl4kTjPd3QzU8R19kJ6MkWyGNt0oGWDyYTPxXC
 0ftdMT1LqKxcylpKEr67C8BWcbaVv/gcrwHY3YXYxSbu20uMlr0sw+84H/IWUSij
 x6jexD0zvDkUDit8YuKZOATdMKcmCiZtrySlWGy71lvFZjJVZBFy/jrJhKUBiq1S
 fGvW8KLFjYZ4GXsdD2ExA3Xl8TCDsTXeHiyQqb0Nh2mrNw4XzIhA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dmLlfusuDAlQ for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:55 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7X3MBQz1RtVG;
 Sun, 19 Dec 2021 20:59:52 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 38/88] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Mon, 20 Dec 2021 14:56:15 +1000
Message-Id: <20211220045705.62174-39-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-31-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/vector_helper.c            | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3f30882aec..7646567eb2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1022,7 +1022,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, e=
nv, i32)
=20
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
=20
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
=20
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e748f7ca71..4df2aa9cdd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -628,7 +628,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 101011=
1 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9451112b3d..f97783acf0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4233,9 +4233,9 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, C=
PURISCVState *env,
     return cnt;
 }
=20
-/* vmfirst find-first-set mask bit*/
-target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
-                               uint32_t desc)
+/* vfirst find-first-set mask bit*/
+target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
+                              uint32_t desc)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index b53cd2e6f3..3645bb9635 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2696,7 +2696,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr =
*a)
 }
=20
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2715,7 +2715,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rm=
r *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
=20
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
=20
         tcg_temp_free_ptr(mask);
--=20
2.31.1


