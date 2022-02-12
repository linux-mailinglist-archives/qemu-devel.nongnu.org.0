Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453134B325A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 02:15:00 +0100 (CET)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIh06-00012i-Pj
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 20:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftg-0000Xf-Ut
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:17 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftZ-0000XX-9U
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624249; x=1676160249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pGlKdfaHOFQg2MrLicewvmm13um5B719f/O0rDm4uA4=;
 b=ZPuLz1QmUDVT9dfZ5XxtdLkzvCezDrzGl1XVTyHCwFoxFrP9fws9hFDK
 HpZ6Q27d4GoshVwMUKDFVHnahmjpX4RmtYopWen5llPO8dVEQIQngmAuV
 6/nyrtMYYtez6oeWtnzwKp+zRBILxuC0JHyS8fI52dLo4E2Yfn2qOroaI
 AK+eIImVx7PVTIdv9K+bzwEudLUCqp0AvOt4IYLtvuHY2FnyJvfMOmb39
 zXnbU1xinZkb2WXvbx2LEeYMBiUUEpDXkGi/MftwvOSXQRgFwgz35vNBV
 Targ+S4Wx/qmguJHG9Ob1ukeUptabjDPAGNatAc2dFK5U3PGbZihk9kSS w==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636551"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:04:07 +0800
IronPort-SDR: MhdtMZH33lyESQTqLmxkVLsilOFhA8ZQr5lJmVQWQOn0hjt1T3oQaQD7r5SGw89Abjzt0ihDth
 lq1ijydFoivGU1FgDzLMFV4xsaaIZsRIC1/6r9SjUcGjnYtVOV5klxhz+B0rnTLyWpPJiG4Zop
 C2HlkrM5nkjrgGWi0VndrXNKpCfBPGmxN/M1/pDHRc/04HB8HdqydfuZ3OVKl1Ywq3HUhHyqeL
 8n8mwqMWQ41l3+TZMDvEZsL+ZLWxfZLree9t7fmccAt+HHIPmvUgnig/sAaerd807eH2C56Whf
 bTV1O7y2KptEhEsX9X65JMmZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:53 -0800
IronPort-SDR: L6mZj7EPvUo54m8r8jeARVpPO0d2xvNMx02j/4nLAWvHBuSMUcyJHlIAYDSz7BNP3emauxQjC8
 mgFozD5CQ9AbAA663vIaDvqN5r3lyvm9gHwn9HUQ6gDMpXPua2wt1XsGgZrA3jp0GbyEAuttav
 NHOneKloXNyOJjJ67y+Se0qHyM0LEqYnD4aoVwQpnslZ9G3S72yucMhsBPn+d0MKzTJnNrLmFK
 Rqcn7e8zA4piumu/BEpEMX5Mdb0Plfx56VlRVVL8WDtbTGjYXOGry+0eQi3iaf62QhDQIFFpr3
 31A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:04:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW1M5cKmz1SVp1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:04:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624247; x=1647216248; bh=pGlKdfaHOFQg2MrLic
 ewvmm13um5B719f/O0rDm4uA4=; b=Ckf+tOug75NefWPdoM44BBTmTDP94iCd2P
 l5RBuCWj3lcIASqYKcAcvC1UOPptE2Qeop06I2/P2ZQAB2LgQj5z/3julf1nHOEH
 XUbdGq83GypqaIOm9Cd7jc0G8m+y22ROXibIxhPi3qFEpEVkACVqeHfTvbEKVLD6
 bSL5fEZPnARYE3IXrW0tIZ6jBzcETwvt9/4AYZ8ATKvVbJJK4EZGYgRi/Z9d+v2B
 fQF2o0FbqnzKyZ5pRQSXf3VTD33ufAcmtDgLU7fr80G1xklvQ9YkIvT4eI2EJgqG
 qgUV4QFtbjm82GOx+9DDFdf5U/eSX3+p6fe1VBRHtF/ocOW5U3Hw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id sLD8RynBLG1I for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:04:07 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW1H5pfNz1SVp0;
 Fri, 11 Feb 2022 16:04:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 39/40] target/riscv: add support for svpbmt extension
Date: Sat, 12 Feb 2022 10:00:30 +1000
Message-Id: <20220212000031.3946524-40-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

- add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on=
 QEMU, since QEMU is sequentially consistent and doesn't model PMAs curre=
ntly
- add PTE_PBMT bit check for inner PTE

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220204022658.18097-6-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h   | 2 ++
 target/riscv/cpu.c        | 1 +
 target/riscv/cpu_helper.c | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 37ed4da72c..0fe01d7da5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -561,7 +561,9 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_PBMT            0x6000000000000000ULL /* Page-based memory t=
ypes */
 #define PTE_N               0x8000000000000000ULL /* NAPOT translation *=
/
+#define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
=20
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e5676b40d1..b0a40b83e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -776,6 +776,7 @@ static Property riscv_cpu_properties[] =3D {
=20
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
+    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
=20
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 437c9488a6..746335bfd6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -937,9 +937,11 @@ restart:
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
             return TRANSLATE_FAIL;
+        } else if (!cpu->cfg.ext_svpbmt && (pte & PTE_PBMT)) {
+            return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            if (pte & (PTE_D | PTE_A | PTE_U | PTE_N)) {
+            if (pte & (PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
                 return TRANSLATE_FAIL;
             }
             base =3D ppn << PGSHIFT;
--=20
2.34.1


