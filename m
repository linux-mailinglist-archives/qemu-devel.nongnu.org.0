Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1647A437
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:13:26 +0100 (CET)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAzF-000661-S2
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkL-0008Oh-AB
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkI-00084p-7w
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976278; x=1671512278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s/nk8y6xF9mNKU/F8FdgoBWMm9FwkZtkUl4ZWAAnL7Q=;
 b=AtAXPQDZFioaV95+OFKDQAgh2lvmkITgSPGP9vT0e7Os8Dihrj0thH42
 6QM/ML54C0SCYgwCjH+eLwtVV7koXVxXUPtwbAowOBD6Jp164g7oMbBzb
 CjskXRFvyI7nexxHWt2TAt0MoesGaqDVshGUEo0gcp5usoFnZ9lUnHu6b
 HFNoIGaxRntl5Gep9RuwRuqCzMZm97JioLVdn0v+q5xFzJEnSRzPT0Vuo
 4RzWJG1371Z2aW+nLzKrDbpQwoPZfUyNH5FgYus0VjH0sDvwtDFEVpnU1
 YXg6htfHvwQb1dD5F966VlP2BiaXiU3D2g96Ve0nu/QlJ5pBP2lxgR5Xm A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661895"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:56 +0800
IronPort-SDR: 74Zjgcf8soneH7bG+wDPwccuS/hAuMENsthnQhcxAyjdsm0X9F8qjk5PK6cpYvnISsUN5LPUBi
 j+56ikAEDo6MMUM7FCvymmfyOQJiL2Khtjg5EJs2Df8mU4r43CSaXqtrMPJl9/+ayNemYM0BNd
 GmQAzFEUXz9UZNIdP1QbhC0u8bHuRf1RMNptX1C+vaU1k0X061PuuNdnKsLW9bykhSUWm6E1pf
 RJda/I9lWrqB1FgmficiVUZfTZLZd8PQpLILxFfhqdFFsNKjo13OwaMR5V+8AjLUJiipYa2Eiy
 t5Gw+shLUGhC91TDVS6QsJcS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:45 -0800
IronPort-SDR: 0GMYgOEl4jmf4QGs/3eHhQnSaeSG7Qvl6pz7pfMCUyXbI1xyzPzK1P97RoY2A7UCe9PepEAi90
 bqToUQnfLc3EVmzftwsvB8nmYyk3A60dXxjOiQuECyQ2lysEZXEG3AJBt0Smalm1jiQS1KB6am
 Z91By+BbDLNUV9pJbDAs49h6jzACMANQcOtd7Sgmf76ItV0g85NyaoiZnN2FS3DG7Si3Tci1aS
 Zkta4TsmT9G83FMtX8dvFqBzIkpfJTGi7OzeZl++redgoRY8XssxkXSdLBQ2rlvhqGQt+nrUB4
 z3c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5J14gtz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976275; x=1642568276; bh=s/nk8y6xF9mNKU/F8F
 dgoBWMm9FwkZtkUl4ZWAAnL7Q=; b=ed6m8E5UOYJyyR6i3fz8+ZHSVGv+r83Hs1
 ijvuao6Ke3B5VOD2xx8tpYqfBhSJb6ZtgOtE2gRbqUVGNpYv+sZJe9QPlgbS07tk
 ocb3bx2DcAliYa8KxhfnoUjXVBbAXARxh4UABV7a+R/LNADtZ0DsvbFDyaO3tmUB
 BvQZcWEcTL5BqKSwszGf3md3M1xs2rS9I8FvPKSUQBNypQz7Jazl/W9KYoGb3emi
 vBcWrZsSbjE48oyT9UNQ3Q4bRGKXt39QOEbHm/kM+TeUUEV9orgWlhKpLMXDShHy
 6Iycenr8XWJzaY3kZSgETvOB426+XSPSRCb5xPvuLPQ84ETVEUWg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iw0jXsNSEqOA for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:55 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5D0GRdz1RtVG;
 Sun, 19 Dec 2021 20:57:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 09/88] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Mon, 20 Dec 2021 14:55:46 +1000
Message-Id: <20211220045705.62174-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20211210075704.23951-2-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  2 +-
 target/riscv/cpu.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ef677f9092..5ea2004ae0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,7 +81,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
=20
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
=20
 enum {
     TRANSLATE_SUCCESS,
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9835829588..728092f78c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -523,7 +523,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             ext |=3D RVH;
         }
         if (cpu->cfg.ext_v) {
-            int vext_version =3D VEXT_VERSION_0_07_1;
+            int vext_version =3D VEXT_VERSION_1_00_0;
             ext |=3D RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
@@ -548,8 +548,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version =3D VEXT_VERSION_0_07_1;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                    vext_version =3D VEXT_VERSION_1_00_0;
                 } else {
                     error_setg(errp,
                            "Unsupported vector spec version '%s'",
@@ -558,7 +558,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
                 }
             } else {
                 qemu_log("vector version is not specified, "
-                        "use the default value v0.7.1\n");
+                         "use the default value v1.0\n");
             }
             set_vext_version(env, vext_version);
         }
@@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -635,6 +636,9 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
=20
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
+    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
+    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
@@ -643,10 +647,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
-    DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
-    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
=20
--=20
2.31.1


