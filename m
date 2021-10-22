Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902C437838
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:41:48 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdunr-0001hy-BS
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdul1-0007N7-If
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:51 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mduky-0000rC-EN
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909928; x=1666445928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOJS78NbHpnmrcqVr968CGJJySNmBZqEkreTUXN66s0=;
 b=hU01OtyMC7AMYpOOIDEbOyaphvwX51ni33zQZZh/p6InV8p03ZrexeOt
 nGyNeLBEVESnKq5+ilu+dsPLS7m9UdLtqq3rpiEhOc197s0F/Jlo+A1eN
 3UUDQiP81vym9/eC7StVI/nDHSyuGESG41kPjL17encbCEd/7IZ1dNONo
 dVN0pIgz6fa9tXgH4jV126aNlLQdh/6QzIBxosXGlw14xyZVK7MrQZThw
 dGlJM6m5qCQ9ehpbs4pJHxWqyg16L4nnCJ0CH381GDwl+LSFNFcRzyEoq
 CfT9ZgvlmOb7WAS8/8n0dIzoamqwd81B7Z20snLqmJuSu4CMtc2f9xv/h Q==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632553"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:38:45 +0800
IronPort-SDR: EhozFbUT9evHqXvwt4NIYjWQ6875YPWi9HBzSIrrSe8WLHbZgDNVOjZnEZ3RnXe8WLTAPEorP9
 V3SWg1NZYVYD8ZkskSGXcxwPOC8xXloHtt2yRxhiVMgF5KvY59xdSgST+ZqgSc+/l21kBlz2Bo
 wyxam8tsoqjWQIBly6w+EpQ72NI9JJwZLpv0lGFQTGNS/unmE9PsHBEewtN44vbxMflwTLOBwQ
 OuP/ID9KuisxX4+U/2/fDcD6STVkdjWvFiowMaMjW3/pm7WWbLpPocJMkYdQtgj2vwfgGMGVSq
 +jpOmLTiuARfCS+v01A+B6w2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:12:47 -0700
IronPort-SDR: bGSoAts47iY/0kfdHd2n8FFPAU4005kENBCYl0PwSPHX8zYgL8yYtKc1gvcq+ksh54N3kJzWcu
 31ZPMJNKDu9Nr5YWs1YfxH6UYU/sqrq7uRC1ucPqkyqc/i094GTz6woNX2ydZt5fJUvRQXu4db
 hiD/LgQnipvdk0TdBW1PP/CgPRy15bEwcTcYM1+rBiNSEiHmftGyosrCBZPRk9L/hrbhXZpXFs
 pcDYkU8Sk3LcJgL5wuB8Am+pEO3sg1dv2BK/bDKLwOPahWh2/jKtJLCGSeva0Wa1Qr4YpH+BPF
 lCc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:38:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQRT4TRqz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:38:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909925; x=1637501926; bh=vOJS78NbHpnmrcqVr9
 68CGJJySNmBZqEkreTUXN66s0=; b=ZIfRZxqD2o5iWWwzyJtJ4TpV9n0n8RF1Cj
 TiUfDPnWZEbHjVYfhIQMOH78qUbwbKmsW9Yt9nwiJIvMdjihlIysB1IeMoh32R42
 AXqUQdRTAHUSbYs5u1MgGZREeYges6y4LGdopV16WgZ/OYvFrAKovxbvMqUFTxNU
 Jhc/K0zwsa/nlhYA8d+0y4iMj2bB40EzPb8aiHIWNslPC/O8MVBRp+/gnq7KbkjS
 0uwY93wpV68HhxZ3H2Cv7M56koE2/Y4VnzMShvbMXwkeAkt3ajc8sLZoDDvObl3D
 lAJX4CIL6quV+ZyFeThmZixuREyi4rRBHI3VILYYUhwrFjYJlUhA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id w19EY_hGu0D4 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:38:45 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRP66h1z1RtVl;
 Fri, 22 Oct 2021 06:38:41 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Travis Geiselbrecht <travisg@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/33] target/riscv: line up all of the registers in the info
 register dump
Date: Fri, 22 Oct 2021 23:37:41 +1000
Message-Id: <20211022133812.3972903-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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
X-Mailman-Version: 2.1.23
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

From: Travis Geiselbrecht <travisg@gmail.com>

Ensure the columns for all of the register names and values line up.
No functional change, just a minor tweak to the output.

Signed-off-by: Travis Geiselbrecht <travisg@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211009055019.545153-1-travisg@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1d69d1887e..660f9ce131 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -258,7 +258,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
     }
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hsta=
tus);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus",
                      (target_ulong)env->vsstatus);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
@@ -289,8 +289,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval)=
;
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval=
2);
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval   ", env->htva=
l);
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2  ", env->mtva=
l2);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch=
);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch=
);
@@ -298,7 +298,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
 #endif
=20
     for (i =3D 0; i < 32; i++) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx,
+        qemu_fprintf(f, " %-8s " TARGET_FMT_lx,
                      riscv_int_regnames[i], env->gpr[i]);
         if ((i & 3) =3D=3D 3) {
             qemu_fprintf(f, "\n");
@@ -306,7 +306,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
     }
     if (flags & CPU_DUMP_FPU) {
         for (i =3D 0; i < 32; i++) {
-            qemu_fprintf(f, " %s %016" PRIx64,
+            qemu_fprintf(f, " %-8s %016" PRIx64,
                          riscv_fpr_regnames[i], env->fpr[i]);
             if ((i & 3) =3D=3D 3) {
                 qemu_fprintf(f, "\n");
--=20
2.31.1


