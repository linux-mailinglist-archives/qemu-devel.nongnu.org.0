Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB45650673
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kH-0001u9-3X; Sun, 18 Dec 2022 21:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kE-0001pm-DT
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:10 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kB-0001Ck-UJ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416347; x=1702952347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4bsb7C+WvHwOgjHhyitFcg8hTn062ir9rkIHz/V44c=;
 b=PeeFdTyKe3o5R/8U5HD4sF6JQkF5du0cU3Fce1tLg1bOkLNCL4ZalS5h
 4voByKdz6HpGaE6hmGtNrh5qko87IkqnmNgLYo2ldC6ZUmmHK8qm5VMJ/
 mRa0vtzS6eZ0AH+4Y+Yu00xiuXSFicGz5916VC8+Rg8Sn+/N1pDnJWfmU
 u05/F0HX7E1aizXxg0I/K9zOd/oaq2khpvUHQQXSyQ1aLZlz1Isb0Vv5T
 1jq1vBENVPmogVseyv5ljqDo7swmFYl5BWetz4PkZycVKtHN/66nvwxPO
 NIg64avfwaWig0UhUfruXGOMw/UGs0bqrIyygI/Drpzq7JhjJRMJR0dIB g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056831"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:53 +0800
IronPort-SDR: GoxfrGOvGBA2pya5U2lERwbllpaz9/z1jAvxfjDGY2vzS/gcodNc0vgFuLWrwOGYSddVfeB7iJ
 8jkLJm+jPh52ShlAmTOkgGIMv0hATVZBVhDFKLnHPk2w8O4XBRK3zaclBwGilZlMcbFLAKi6++
 wYOqjnixi2+cOEp5cZQB4SHeHOXdb8i3sPj/aTgpkXushOF3gdL2H+NDbIqd3vVZhp1wa5ZW8Q
 Jmwd+B+n3/Riz/eExz6Cc187FsOJIxkxR2Ipv+VogRLo1bU8Qq7VPGE5Q1E0LEliBh6nXXbGGZ
 pQI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:09 -0800
IronPort-SDR: lNJ55/bD4Mn+GpG2tS2Th8WpxVfZKi3aK/E6KZenQ9+maFVsHvf8tjuQ6kD70RqYLDKdqOtzg3
 Nraqh8Da5xTyu0qjZ6vG25OhEb/hhoDClilNnPXitqW1+a8lnJn9YkuVZS84JyqCkZ3mmJn6tO
 doBUwRpgCxnCm0t/jafj9Pg2L0o5u4O2JSiYCTVvAtWWy1HnfsIgNZcpzAJNBJkvKsqGgDxP7I
 xJCfeT/r3a+vaAUEtC5zHz5BN6WIfyN9ZMp3QVebygMNUqSyuFudf6goI+dB7p6m9fk4xLDLU+
 NBs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Kn0wPHz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416332; x=1674008333; bh=B4bsb7C+WvHwOgjHhy
 itFcg8hTn062ir9rkIHz/V44c=; b=ItIXg9jwX/CRg+59scZc+8TLFY/PC3FFIH
 i5xE6+ezLFrzcfpmranFT/+7Y4PXYbCBhacbNeZ5lKUuSRbx58f4zyY/IKnaTKg8
 VGVDfjl5uE519gfTx1j51T8LcbY162qzJYSyUIYXg5CKAc5ytU8DF1p+8q+NguiK
 xLdEAt/WnrCGwglSRpNsHTe5C/aqhfbGlukCks6/4JNjjYHBo9bZ821Fk09NGjVm
 yDD1p/2XObXWVQzum7YZDqSif4zquW71lJORHaRFfj8vLy4MP+iR7ZGdDTvpUG0b
 Y/guazc5OZYtl+ZdKakx2EaT/H6NC+l3mYdMWWEa0bV8jToxKWQA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wltj8jmAZ8Hb for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:52 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Kj5jw2z1RvLy;
 Sun, 18 Dec 2022 18:18:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 41/45] hw/riscv: sifive_u: Avoid using magic number for "riscv,
 ndev"
Date: Mon, 19 Dec 2022 12:16:59 +1000
Message-Id: <20221219021703.20473-42-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

At present magic number is used to create "riscv,ndev" property
in the dtb. Let's use the macro SIFIVE_U_PLIC_NUM_SOURCES that
is used to instantiate the PLIC model instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-12-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b139824aab..b40a4767e2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -287,7 +287,8 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_PLIC].base,
         0x0, memmap[SIFIVE_U_DEV_PLIC].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
+    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
+                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
--=20
2.38.1


