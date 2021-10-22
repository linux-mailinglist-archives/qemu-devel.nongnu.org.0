Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B7943783F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:43:31 +0200 (CEST)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdupW-0008A1-69
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulS-0008KB-6g
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:18 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:33487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulP-000107-K5
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909955; x=1666445955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/EsC/RTOkV2XvnHOFKOA1r14eC57yHygNPuQQZky8l0=;
 b=o2deabj3rV30YGS5RvAsSioxKfTB6UbmdEra/DwsRvPLtV45dlXfszps
 fWzAOpjT7XlFfCisAkHkAtsMURfm4mx6jYPf5bYjZPspBAhAH47KU/raL
 CYjvsINy44fXtmlNS2z7/5MMd5D0zt/98A2AxwnZ/dsjSP+FsiagADdlI
 VpTPRdQ/mkmuEvSVJ6qVYaLE8SuHIxRKO2lYs5f6rRxjUE/4bF8RjUGOk
 RfLNRJOw1tPxmhJwrxdcG5iAaMwXmmVHqgsj4qwmGKJEVQEe5Hpb1b/Bx
 CCPSacFPrGFSNOVXnLdsXCaYCjcWzDDB86DeHcwSbPxhD71nYEMXvFOjo g==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="295350940"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:13 +0800
IronPort-SDR: 1h7n7AfO7MHsgO4MIheCUrO9bLyixyJ/NmlFr3erXhWB9zQsOa8v1xKUd+sUABmKPyQmxg580B
 4Z9/RFefmnk/+nxh4nCmk2GJNcSGrLh1rYmxX+LadnCvcurd699mgapn34m4Nn25yBRUrtGuga
 9CTtiyuns7g1LBvw+cqm7cqpvV05ageBEq4bZxoBsbo1Asn0F8nUUtY4Hyd/5PpQLU5nS8YThu
 qLrh8tERgCOJBdPwmNv44eHyAVFLcYQGAUt+6xV9Lk/0kMGzgt4EnQeMC1EpvFGiC3pVQQqWeg
 QLYfjmw0NQVgiEMJwdxgXzMG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:13:15 -0700
IronPort-SDR: vgIUfkidJ7mzd7JfDzj54CAc511SG+vSMIGF7oUnUXp3/nO5q9gZ5y6e9RcQVJ8gQzNJyDPFSg
 ONhlS9HQxaiDY1CDd1ckUuHe5Y1rar9VKMB4hhfGkVA3RO6JGIlE8m2cV8gyfmNbthBljZy6mC
 GXMvEyB888QDtvP0/IES91TrVOh3AhTDtYjmLHYqSz3AixVBIl9SdU75kTcuXL2q3Hm8FSkqc7
 P8VKA6Mk0UV4tUI+dZEhJaG/7nHqlIBNVqGFtRk7zItrHuqMXspLxMe6gC2r/sqifTvNEbnOGY
 R5c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQS11rXFz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909952; x=1637501953; bh=/EsC/RTOkV2XvnHOFK
 OA1r14eC57yHygNPuQQZky8l0=; b=Uk5b41DPDohBhuIbACBYG1tWZw5Y4ukJFJ
 xn9KENIyFfhBbbOCiiNywKV3/gufP06BYVsOocMZQ8yGPDp6O7KK3t1Xfux5pWBj
 677o23uyVr6Nldi6P5uEZNXbEVQHr8CdioS5FPDC9gc0FQckxz9qHpNBq62YOsyk
 gAagV6cyn+cQc2pvXYbAE+VQO05afpLz7zzqNGTUDi4tjqKH1FvwurpZQCec9bDl
 d3AMEO9fkq6Vgvh0Na/KWfs/uCcJFq01xLOXyLnB7u1e/YO/7nTBgVT+iM5Ee9vI
 AUdRp+I4BMdwtfqcHm5LlO15zfTMjlcfkvxoeZaeRrkj4zcJtQlg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5yjrg7n0FgjW for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRw4DvZz1RtVl;
 Fri, 22 Oct 2021 06:39:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 07/33] target/riscv: Organise the CPU properties
Date: Fri, 22 Oct 2021 23:37:46 +1000
Message-Id: <20211022133812.3972903-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Organise the CPU properties so that standard extensions come first
then followed by experimental extensions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: b6598570f60c5ee7f402be56d837bb44b289cc4d.1634531504.git.alist=
air.francis@wdc.com
---
 target/riscv/cpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 660f9ce131..11bb59ac6d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -581,6 +581,7 @@ static void riscv_cpu_init(Object *obj)
 }
=20
 static Property riscv_cpu_properties[] =3D {
+    /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
@@ -591,22 +592,24 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
-    /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
+    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+
+    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+
+    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
-    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
-    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
-    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
-    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
=20
--=20
2.31.1


