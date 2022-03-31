Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D1A4EE4EB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 01:50:24 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na4YZ-0006ys-1U
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 19:50:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=08287e7cc=alistair.francis@opensource.wdc.com>)
 id 1na4TR-0004f9-DG
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 19:45:05 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=08287e7cc=alistair.francis@opensource.wdc.com>)
 id 1na4TP-00007b-NG
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 19:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648770304; x=1680306304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xjmMS+kIAcQinSufgq5Ahmy6xPuVneaoFUn5VAHI1is=;
 b=AfdDqldNgxWzIrEoWLdI/htPsz8vMhhcKw8YNfvvahCB78LYr0b8MGk7
 WtYu866I5IegAqp/jA7tKrfNnUNI965+Cuv3/PtBs7IVLBTWie1q3oEmx
 jiMNBqF7LDXzh7dxn4AVxJ2M5eV9Xvgnzcyp4dhOlgkrWto4StYOPadM4
 +Zsm4qDuHDS3d/MWRvdsttcjQsEThZKD1g7bec1B/tUyRysjlQf2cigLR
 nKtc4LEuWIRUs2PGMy+KBLLaxwRM56clLg1WSdQqU450dkwTS/u7YZFqC
 yzAKqA+CL3sP1BQev2Yg7nclZdgEJ01ro047cpXtjU6UkIHCN7/dGn6uh w==;
X-IronPort-AV: E=Sophos;i="5.90,225,1643644800"; d="scan'208";a="197691433"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2022 07:45:04 +0800
IronPort-SDR: 1yl1ERdSMQ+AWz0Lzr0sLSB2CE+Svwws8cDHyZpSSylwJ2I3D0eoHzZYtaFf5vNTmTtNEF4V83
 H6tZiSCAki9B3s3rETkXzCh3mYOMkxoSUvZ9/n0Ei3o/D9/iLe9sXK+2FiL0HvxmXlezi4MiHe
 GZk4/J9na1QPwN/tG9GeA5p5e48dfvWdHKCnAt0/ibU8JXVwz9ZF5IoeyPGmMkuY5qRPL+OWzu
 /DGDgAmW4+6HnyyJnp8OSU5XN84nwt6PhdyQsgupfiPvTA/e9NMVvNNjuBvhT0GsUxv+EaGckm
 WkzPG//15gqMBDpUOrSjCLLQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:16:43 -0700
IronPort-SDR: IsPoxiDV3FLJQILtMtYPRHOiML82jB2B7U/uuddxF+rGm4bbN36cW+SdTDc44x8TiRHFv3rdaD
 b0haIyH00ReuTkT2Aou5ghHjpX3+3c0vmDMvPmwbIw19hch3nnDZiNpg4XYuW4Dy+hHU7TVIdL
 C1bBoJOwoy6o83Qqw8dS4Xt3t6FG/LNQyEt137O8CVB1/F6HAIZzU6hyXn7WQPntFE0mIUo96/
 vpgpTpuD1WFoZ06aS2Z9DLMSLTXHjywF30s99h/T7WPF1ZbvI6r0tP5T51fHtiRWV+5ATy5NXR
 cAc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:45:03 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KV0KB5MTNz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 16:45:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1648770302; x=1651362303; bh=xjmMS+k
 IAcQinSufgq5Ahmy6xPuVneaoFUn5VAHI1is=; b=flbnGs2HOt/l5V1X3F3R3P9
 ufavgRfLwBaXtkOZmYJJDiwIFY62RZyVMj06aisIWQd2zJXZ7ApZjbLQ2LG78cLg
 o6W/U0JB9/agpzkR9EnKTHDya7xrFjDRkZwtXGRezcVOwY+hS0rCgaFd5i0eEyLx
 vgfIYWtP96CK/hHL3JhX9Iy5tLIYNRHuGu1HXQO7QONR0eKV9tTcAOlgG0Bu8Jpa
 CB8/u2WCr6leK0Ct5u/3bBnOa2m5XTzgeDsrp2Sjj3j0Rkohc1qi96YNb0eYxeQU
 vekXt3Sii5NM5yweaEJLGP1eR3EpXyXrAKT3RAuvvYGLNXNduquMql8sbIKGSbg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Gn1hXYcWcrpi for <qemu-devel@nongnu.org>;
 Thu, 31 Mar 2022 16:45:02 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KV0K76Rkkz1Rvlx;
 Thu, 31 Mar 2022 16:44:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 2/2] target/riscv: rvv: Add missing early exit condition for
 whole register load/store
Date: Fri,  1 Apr 2022 09:44:41 +1000
Message-Id: <20220331234441.15920-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331234441.15920-1-alistair.francis@opensource.wdc.com>
References: <20220331234441.15920-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=08287e7cc=alistair.francis@opensource.wdc.com;
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

From: "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>

According to v-spec (section 7.9):
The instructions operate with an effective vector length, evl=3DNFIELDS*V=
LEN/EEW,
regardless of current settings in vtype and vl. The usual property that n=
o
elements are written if vstart =E2=89=A5 vl does not apply to these instr=
uctions.
Instead, no elements are written if vstart =E2=89=A5 evl.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <164762720573.18409.3931931227997483525-0@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 275fded6e4..4ea7e41e1a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1121,6 +1121,10 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t=
 rs1, uint32_t nf,
                              gen_helper_ldst_whole *fn, DisasContext *s,
                              bool is_store)
 {
+    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / (1 << s->sew);
+    TCGLabel *over =3D gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
+
     TCGv_ptr dest;
     TCGv base;
     TCGv_i32 desc;
@@ -1140,6 +1144,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t =
rs1, uint32_t nf,
     if (!is_store) {
         mark_vs_dirty(s);
     }
+    gen_set_label(over);
=20
     return true;
 }
--=20
2.35.1


