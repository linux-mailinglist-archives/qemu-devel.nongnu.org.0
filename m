Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B5495C8C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:09:57 +0100 (CET)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApvg-0000Of-9W
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0Y-0008GL-P7
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:47 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0W-0004B6-IC
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744964; x=1674280964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TKBKT/lup5hc/at0bly7ZZuFETEagyAi3iVW1VXJx8I=;
 b=V21/qSjZLjATjbhUX09toOd/fHBYNMTknmMgNC+z1HVuOhgq+Q4M7NDB
 SCC4m4qcpHzYbm3u/M4F2X2gmrFg2yWaUtLhE+1WPdEJNNYnnJvV7q7x3
 66X37/jp040ZRy3Sx9m1wB/WJxeMgvnIRSttVpITNC4pS/2+MvK/0lw1H
 Kli8dLqtN6vtfBr47N/Q3nJJ36s25qDfy11n8JZzRbTU7gnvShuAynkf6
 JWFZyc+usSS599D47D0pWM/ot1TbHqIHOTURmilOizo5jy9BoJy/AeyFD
 rilkfZcsW5CxoVz8co9dgjwUTwyItq9JhoUJocgBblZTMoB9LrLh9yrRZ g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083054"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:33 +0800
IronPort-SDR: 52lsbi39bTMVyWZgIPz8F9HnXRyEpW2cUBQh7QOOxB/GUapSa6L3cR0kMHfHZBlMk1UYvxVdi8
 CfjeGQqGTu8N7iSjhsT6/3OurXgD0Y9sOHlbY1NuEoCGwico+V7IEOmocI/BJaHTVnvTs+gmPK
 LejPwd/On7ii/mxe9qY2SFavuo5L5ipuMIWbuZ7pE5yQAcohJ7mziqbQ5pHII+kzCbC1LfqRGu
 6nXG61nJWFdhYC+rg4XKsmCvAe2UVbu4fAjvh21xsop6DRErgQT2rXd8wfBoDMb3j33xf13mgf
 P8grVKbNsx2wugzGg3FjMa6M
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:00 -0800
IronPort-SDR: XVX52CDEYW8M7QsYdYugGySTjbYn9ZqPqmAHQf92iG73B4gp49rYpf3gMmAk5pL/v5KIPq2XoL
 kpFA4ej8H3Z6JKn4atgMHpURvP/VWvsf7yEPUoyoYV7MS/AN8qHXKolZeXmI6HjJg8QKO0JRAe
 3u4oeAZz1NQiE9v6cq63bglLuTGHMHDnsqfjROBK7HCbeC6k+ZoJzjaliF/bEoUJe8+5ET4vc5
 XwTITQhD/t3VkySJBO0jh/cdgZm764BmBFnISso3YAy2Ws8v0lCtvCQMtXn1vUfqNTqwffr32B
 3UU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zx1NG1z1SVp1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744892; x=1645336893; bh=TKBKT/lup5hc/at0bl
 y7ZZuFETEagyAi3iVW1VXJx8I=; b=RSAt3j5IE9Yl6U4qOhQ3g6IOjkSgPFn3t8
 7GU11WOeFACf7m3FgT1RIlNpjtor9EvMM0NosCtNB7D1pgoWePgSAZ8HQOH46GcS
 +kSjJzd3yIF5hoIswJeR/DvDNnWQmz5rQq55OG3ZIn1LXJYZDLOVk2B/Py76t2Zk
 2lM6wP/r1OMU6NWZZqJ1/uZSjHFBxXPADpO+k+MhP+eIzONtxSTeikItoucmlpxG
 UfxMr+4cLlM1tZ17e6+JyGsi8LThKQSQSip1eJ3+G2MX68kLOiJXTYtcNa+gcXq4
 u7G8EtjlQShnNR3M5sGt85yHVO1Nhutpz6qFKA9+0Fe35jf6teqQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jtXtcecu8qVg for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zs6qztz1RvlN;
 Thu, 20 Jan 2022 22:01:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 41/61] target/riscv: Sign extend link reg for jal and jalr
Date: Fri, 21 Jan 2022 15:58:10 +1000
Message-Id: <20220121055830.3164408-42-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-4-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                | 4 +---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 330904265e..30c0e28778 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -369,10 +369,8 @@ static void gen_jal(DisasContext *ctx, int rd, targe=
t_ulong imm)
             return;
         }
     }
-    if (rd !=3D 0) {
-        tcg_gen_movi_tl(cpu_gpr[rd], ctx->pc_succ_insn);
-    }
=20
+    gen_set_gpri(ctx, rd, ctx->pc_succ_insn);
     gen_goto_tb(ctx, 0, ctx->base.pc_next + imm); /* must use this for s=
afety */
     ctx->base.is_jmp =3D DISAS_NORETURN;
 }
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 3a0ae28fef..b9ba57f266 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -68,9 +68,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
         tcg_temp_free(t0);
     }
=20
-    if (a->rd !=3D 0) {
-        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
-    }
+    gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
     tcg_gen_lookup_and_goto_ptr();
=20
     if (misaligned) {
--=20
2.31.1


