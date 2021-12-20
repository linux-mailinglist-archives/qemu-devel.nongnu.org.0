Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B527347B0D4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:05:59 +0100 (CET)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLAj-0008Ow-PO
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUU-00071K-8c
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:46 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:30645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUS-0002Ox-G2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982984; x=1671518984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NwpHVZ34H5xvnsBDSFpMYg4ASzoasBi2diS1mv6DgpI=;
 b=S4H0Bccdqpj4MutsdCAYIFyIs1nThkQ8O0xAJmJ88BIkcy1+E6lIVheT
 pNvHBB7nT3y5opg7F5EWwlil57VVG32/vlC2xGHcr/NQqYeStLvaRIQ7n
 P06yf1MiaKZhqNBhCG8jd/+KYIT655V9b9f9q/kRa2FWPEU5cr4EV0Qx7
 LL+O8DuLrfjuyhEHmXvWdUxAKBK773/jOsNdaxr28BfzHZqvo7hUOo14I
 tC71em0r+A3ihPpBJfbEgAwUYm5Ioy/OFyggpdNgMEa9/SdittNOJbcz0
 uvSDEX0uvdnFkxNrB1jRA4CFGCQd3rWpBKzPW2tRZ4sSgd62rXJvAFxOe w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="193458406"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:42 +0800
IronPort-SDR: cTqpMZn9sjNOXLvnl8i9yfLG0BA3Oxq/pJXySpncNz5/rb8FAPq869pOxLrQYi2uKrqJYNzsDF
 vk9/RdhudOTEIn6gb4flFvxF3mGwa0rZE5wSNkLuQTg4gxZEV+MOXE9vX68/f4k9yoKoQzqFBp
 tSZlRSmK/sPuMWrxyv6rtmtDqNAF9x26BHCZHFbK2gM9pSjWkjxthH8c0F7Lt+2Znjevz+Gk0v
 L93xUEkoaOjtvSGRWIe77Guz1z9ZzN0cpkPP+e8ajMKePZkh998Yvzo+8NIp2PiWCtSjiZV5kp
 al5ctgnrqj3je19vuxnY5pKY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:24:00 -0800
IronPort-SDR: aajGmhwShTfueerpNLjxOOC5dFMTRtWCSGA9FrlLlJrHU9l5nWa2A/ciDcqYl8k/UjPF9DNmfA
 /87sbduZ9UX1RsVQOMaFj1QPLaJtJepXYvHyLlrX5A2h8venKkt+uyV8EOx833PmnLWwVk+4uv
 WF0R+05KJppmC7PcHZJWle79vF0nSIjoxUjGSQFuKgVCRw+thx7C+2ro/8XEEzhYo3VAwPw0eC
 0WbrcMZJ3szILS4UXupyA/bL2ncfVAKy/SFK+Vv7yJ+3TfdDRzuM/baSKj1983A6A9DovSL1+v
 2vs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVZG4t2dz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 22:49:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639982982; x=1642574983; bh=NwpHVZ34H5xvnsBDSF
 pMYg4ASzoasBi2diS1mv6DgpI=; b=oldIyxlefZWLkPgW44cJKMbxJL0FORNTx1
 74+M5Lj/C4364zedijvK1HmbCGnMMueuYZuxgbBLPL6sRSw+UUbdYrSbYzRPGkAr
 GAcRE+cK34AzmryWTQE6IZeHZ8GfKRZXa7Jbxqhob9juJBMLy/l5AYRGb7XPICiC
 555vWtXVdyH/hAlgBrOz5NoBFu7THaY9eN73UkH4XVW2jfFXknWAJWYQ3KIC9ndv
 9fszeeNy+VZahlEhL3W2Pt8ouNZoebnWXEDYy8GvY7hRVyqr6i+D5b74sTagMDsd
 ZB/4LK9q5sO8MnNr62Si37QwrKrLQTFf27W/QBCRQD6uUL9NGqgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5Balkr0bmGS9 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 22:49:42 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVZB1QFKz1RtVG;
 Sun, 19 Dec 2021 22:49:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 3/3] target/riscv: Implement the stval/mtval illegal
 instruction
Date: Mon, 20 Dec 2021 16:49:16 +1000
Message-Id: <20211220064916.107241-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

The stval and mtval registers can optionally contain the faulting
instruction on an illegal instruction exception. This patch adds support
for setting the stval and mtval registers.

The RISC-V spec states that "The stval register can optionally also be
used to return the faulting instruction bits on an illegal instruction
exception...". In this case we are always writing the value on an
illegal instruction.

This doesn't match all CPUs (some CPUs won't write the data), but in
QEMU let's just populate the value on illegal instructions. This won't
break any guest software, but will provide more information to guests.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 2 ++
 target/riscv/cpu_helper.c | 3 +++
 target/riscv/translate.c  | 3 +++
 3 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..3a163b57ed 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -127,6 +127,8 @@ struct CPURISCVState {
     target_ulong frm;
=20
     target_ulong badaddr;
+    uint32_t bins;
+
     target_ulong guest_phys_fault_addr;
=20
     target_ulong priv_ver;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9e1f5ee177..f76ba834e6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1007,6 +1007,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             write_gva =3D true;
             tval =3D env->badaddr;
             break;
+        case RISCV_EXCP_ILLEGAL_INST:
+            tval =3D env->bins;
+            break;
         default:
             break;
         }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 24251bc8cc..921ca06bf9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -167,6 +167,9 @@ static void generate_exception_mtval(DisasContext *ct=
x, int excp)
=20
 static void gen_exception_illegal(DisasContext *ctx)
 {
+    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                   offsetof(CPURISCVState, bins));
+
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
=20
--=20
2.31.1


