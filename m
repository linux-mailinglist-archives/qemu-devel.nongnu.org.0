Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7555333B9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:58:59 +0200 (CEST)
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdUQ-0002as-SM
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGr-0007lf-B5
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGp-0002Yx-ES
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432295; x=1684968295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JR57HeR2olH0bmChhNxfRbTCxi6KS+tPhpEG8JNS1u0=;
 b=GkjjqVLqu4Yj+ZshR/JhGsZbI66scG1GXb1bbvQ9mxVMvoQWDFnRWprf
 +s6XWEx0azp+LMNO5jrIPK6v38i4GWA1e/QfoDvwaptw1A/Hj1vxElxBn
 lh4wEoI0e+RHcNfwFKKtEN5ZdhiX/kRs3ZtFlaZ8hU9qvMz7YfA0gNPjG
 Gs8PTFz75/jtMDRUAqcJyo6nFFw057e/vAX8WSJNJ+fnu3SIc0QiNVcvM
 Z3TGqZgeZh0cWIhSLglj3+Fu7hR9cWO2ZY97p6NAdkSv6Ub6Bp1J1Kkg4
 C3gA5ArXQZOCBgXx4Mbr2m2n8pV5+jxtTfXVDOZPjKhYXw5nJH8101Z8S Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566663"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:54 +0800
IronPort-SDR: XFkVZpmOIIfK8LPpqf5Mp0/oHeLJexhjM8Utpv5dbmmVZ8OzHxwyPTU72fHHsDsWZ6rtwSpxtw
 6DRVZdXCccrpHxLL6J87iG/nFLEGI0Z0/3En2qf3e9BfSyy7DU5E6/R4bqXePlrjp4Issaznzu
 UHzW48JfGXHNJdn3XGzXtl5wUefPxn5//qCL4eigy129Hbb4eef4H1J+E2VI1AbEywguJsaiLE
 JAgZghDOS1YNrw4UdTe9pDPfrWjddEyDnm+nZB1kNy2axStWsbdjH0XA7MiJcLKrbkv876FLzZ
 wenPlrTycMLiWVD09WKZGqQn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:26 -0700
IronPort-SDR: 3tV2o75DSzKMcCQkI1EhGttWuDj21jAnfV8jCA7E4vdzskN5QBXWd2YnUnBLCU8yw64mJcdl1R
 +Pp4MrM18mkccpJmj5uEGeSPSTB6Ls9DKtZ6s346BSJ8jnVDsYYkTHhsnbDUHvF1V+SBA5R2cW
 BP9Rm6qdSrOY338XK0SScZBcnBslBhWIjDK/gdBrsEymrsQhAT/EDFI9CZbYAT2sttvQvkZXpK
 qh5J0Ioao6QN4ikn/SzkOOBN3+LPrzKwVfIDTkLFNSSzq9Boo1LqXEvzHmV0TIClIiPV3IZpm5
 jwE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qt43Sfz1Rvlx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432294; x=1656024295; bh=JR57HeR2olH0bmChhN
 xfRbTCxi6KS+tPhpEG8JNS1u0=; b=j9Te2hl4a1apTDmkgYWobmLrEIOvlenrLj
 4+KHLBmYX1xuK4J/7iLm3IIioSsOSlDSUpjEM/wsZLo8qQM+wxibTaiM7YY1xe3p
 2Ok88rSiDBO7CLpW56pWIjK8WidCXwikW7paTRDXqf7yrMk38wYNandbcw4omx8V
 bNQpO4mi+iKa1G9el+56qW++u1E8duq1dfjvRpdgGOGdUacAYxlwr6L7n23wXfEB
 PishjwLS4i0OvGOGe2jzfMpDzXZ3zKe3Uzrxzy4vKXB+OWPO0ZxPjN7NycvysxOT
 SCNUrxMAcnQOmlegLdDrf+dcXQ8foi/WJTgy5V5cL6X7ar+Lfd2A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ruf70VJDkxYC for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:54 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Qr2PDsz1Rvlc;
 Tue, 24 May 2022 15:44:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/23] hw/riscv: Make CPU config error handling generous
 (sifive_e/u/opentitan)
Date: Wed, 25 May 2022 08:44:12 +1000
Message-Id: <20220524224428.552334-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

If specified CPU configuration is not valid, not just it prints error
message, it aborts and generates core dumps (depends on the operating
system).  This kind of error handling should be used only when a serious
runtime error occurs.

This commit makes error handling on CPU configuration more generous on
sifive_e/u and opentitan machines.  It now just prints error message and
quits (without coredumps and aborts).

This is separate from spike/virt because it involves different type
(TYPE_RISCV_HART_ARRAY) on sifive_e/u and opentitan machines.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <09e61e58a7543da44bdb0e0f5368afc8903b4aa6.1652509778.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 hw/riscv/sifive_e.c  | 2 +-
 hw/riscv/sifive_u.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 2d401dcb23..4495a2c039 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -142,7 +142,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error=
_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
=20
     /* Boot ROM */
     memory_region_init_rom(&s->rom, OBJECT(dev_soc), "riscv.lowrisc.ibex=
.rom",
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index dcb87b6cfd..d65d2fd869 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -195,7 +195,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
=20
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
=20
     /* Mask ROM */
     memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mr=
om",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index cc8c7637cb..a2495b5ae7 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -830,8 +830,8 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
=20
-    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_fatal);
+    sysbus_realize(SYS_BUS_DEVICE(&s->u_cpus), &error_fatal);
     /*
      * The cluster must be realized after the RISC-V hart array containe=
r,
      * as the container's CPU object is only created on realize, and the
--=20
2.35.3


