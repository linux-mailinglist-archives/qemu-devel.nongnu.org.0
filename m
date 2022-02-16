Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5AD4B828B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:08:29 +0100 (CET)
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFMR-00058J-SO
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDrW-0007WO-EW
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:32:27 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:51232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDrH-0006vE-JW
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993131; x=1676529131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pGlKdfaHOFQg2MrLicewvmm13um5B719f/O0rDm4uA4=;
 b=Nlw34tyj7VUKdV0/TYFUjU9+rgZNIZ1zUCps/U+tg3dTSTiCKBZPpOAh
 hn2uWaPU4KFXy2VBBV7JtD0qxQI6ln+LvS9JKPJK/tqxuvgH5WmEQ3J5D
 gzG5Y68KNCVaX2UbMnGbrzNDS1bDixTCH1/KAQ2rrNJZHOpXFPVwOrqif
 GmHt0dXw94wQfwMgo+zPnRJTS+L8aY+JBDwI4HGisp9zvNGVDDkxUCEMg
 151swfijypM4dyRLpa+MInbBD/JqgCj8QCiK9PLcJYHj66FWYuQO5Rc7D
 HtpGDoRdCWoOwGAzf5DB5emxl6yD+ql0gW701AATC1b9OG2VHZlbwYiSA w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="192004585"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:32:03 +0800
IronPort-SDR: l2gI9AonZcmlR9u4ItUeERyjChcQb1iwav77zd+w3Q18xVYuaafinlGMRO1wjBdKoSh9Og/UAu
 Qp878KZRvL1yHUXpLyRHy7AkvoH7Lk15us88Wb7iQ/B63llg1lnWUCgMa3ab94YI+QmiXzbWJ6
 gydAinCPnvK+xisiHktt5hSbucqUlnHlQQkxq5+tqH2+xcmXoofaq/Skg14bxhQvVDNpWtYl6i
 FKe+FMTwPqPI+mQVMARyZZLGz4t3WdVUtiazJdj459zoHIV3h12AAJX97qH1DKpcyKvUZqvmf7
 loSkdFV8CqgN7aoJl4kaiEQ8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:51 -0800
IronPort-SDR: YOLeXcV0NGyHdtn265To0pH3quRdcQA88ABgrCUhkDmeUwA9f9uzm/gC/9ZqBlQAX4616EoRjz
 HeQztT18Jyc0f0CG5RNkxHQmy3ti/WtoG3fvtu5GsrI/0iFTpW73c/S6JrGD3Z0g7mvQwiJcJD
 v6lGOZ7jmEA4s61qr4lHglIqiJEjICI1e+WJ1stvlOX+Iu6iFInuUSidcNTXfNzApRelFHzfIr
 K3x1sZlAc9ZRl7p1WsfwcKmPD9HkWXxSun9epsdn38bHGBEstuTJW+10aquUdjMV5z6ySBxXOm
 KQQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:32:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7R66wVDz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:32:02 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993122; x=1647585123; bh=pGlKdfaHOFQg2MrLic
 ewvmm13um5B719f/O0rDm4uA4=; b=rvEsbhW5JCrhsIojJyW4EehNdIkXm+dY7x
 4eBo8ny4ZWtaznh5vx+C3kx+H0RTuxCVYVYw4zaZD9BhgX2d99C+lgPpLjF/+arX
 17w4gfjalFU8iX3MzIehlObozzyYp76GG6qoGISwrYBUyLcmEZFiH3hrRCuvrXbE
 8tMtaWRlNtIBUGLhvHC6U9VTkXZj74xuRUlMiypAPTR8C56jJ5Ft/ds72mwcjuMo
 eWjabhS5SGACU6ZTktvtv6eO7Fltn/CccBCYOyyPJ5XDEf2VDXy4TfGYRFC+huwe
 j2Vuvj9W7OAKfio6VPAjdsgl4VbGF6Ng0JwT9XyiiIadKKDO6Xtg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a1QHFbQVqnP8 for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:32:02 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7R24w39z1Rwrw;
 Tue, 15 Feb 2022 22:31:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 34/35] target/riscv: add support for svpbmt extension
Date: Wed, 16 Feb 2022 16:29:11 +1000
Message-Id: <20220216062912.319738-35-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


