Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB494B31EA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:24:27 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgDC-0006Df-Ed
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:24:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrg-0006eP-FT
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:12 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrd-0000IU-Op
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624131; x=1676160131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iLXXpXI9zgLaXQJ4bWp9YAGUXCRbcHAuyAhY5lhInqQ=;
 b=o15BK83UgMsPWJas0O6foncMsiSz3huXq7NmMphMfhoc1dpHy25picJp
 ucnrKYDrDT4X4P5oTF9qEVJXAnIr5kkALCSBmebzao6p2ibBg0/ClRNAg
 Dx0yy3fx2kq2BnbKiwI0zQzTT41LBlaUrh7ssi726/fMdHG2J0SdcvrL2
 1hhWvXsRWqoZ099aJPW1jXArK59dveGaYSW/1whku5+SXN3zPhEkcrpJ7
 ImNZGKyAoc7f79bDH69DTFOYugsMww9q8EwQqGDlgzT6Kfkwxtcs1Msl3
 LjcDOQoNseWVr2fl0osnWqaUFE/wyeupcaUmmvDgXpqpWFxIsY6tPHFax g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710125"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:10 +0800
IronPort-SDR: SheBhpJc4XM2qs/ULVo7tqzsMrOL+OhK8fNMm/mySG0AgT+eB+JUJG3t4zNj4k+r74Bnac18TR
 0oNN+vIhIUucoA2wu2jJ8+/9im9FGfY9u+FLz9MIzIgC8utK4Bb4m/H+7g+yhbzCIkGh25fyDt
 Ks9I6bZBgPtO5zJ7Kb+OFBxe2pYIP3d1Sejx1i5lA4xg9O15Rzty/H5myIYDpZrcBeDznbG+Y0
 Y7yjPS39TSK83D2HmO1z9y37/+1SvyA09cDUqJjdgVodTQ+sAAPd0m0RsFpE3vLYUKl02JeXHt
 6YWqKTUPsd358hIrr1zS+MGx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:54 -0800
IronPort-SDR: yj9A+QabWP4jT10lx/MqJCsrvfNYod//ipnORSAhvzu2MD6QEtSz89IP6D5RCxX6tYS6yPS6CJ
 7jgCeVO5Gtdq2eqZImVMTAMyHhMNyMHnIxVCdnNl0BynKhV+Q6PTxS+4VX5RePhZ8OPQGsaUNg
 o9J1b4j32cy/9xhD0/eI+xENslF63vC9gOSkJKXgl/5M2Pp5g1jCHtomtjJCcQncdJSJA64UC7
 MoehwVnb1/GfCsX1Njf+TXbZdl/1e378FBk88Tvfd6qZ43axjowYY5ebBp85ikrtVjbH94R5Uk
 138=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVz44v8nz1SVp1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624128; x=1647216129; bh=iLXXpXI9zgLaXQJ4bW
 p9YAGUXCRbcHAuyAhY5lhInqQ=; b=r1NyGWdWkTBJrPor6XlAM/rzOESkPZ7kwl
 FzYilkR7DdkM5QjlsB1TtveLcWlgFifHeUnR9TM03eLlIVXObDMc7y/wMwrNON/E
 KOafbO25/tKBZkbrc3kYF5pdWrrlSnIaE71JCuQyddv/+3iw5jPaSUhfROBIFoC0
 ri5ew0WvlvpDZKhZnIsvxkM/viVfqo2OBuYT62VQPK9P7Vwhsv4fHO3erd7l/E8L
 Ysv+eIYn9exIYxexERSdRwRuCaA4hapgLbcKrgcfxqT+IiCk96EOfKv59W8Njpbg
 bw1rGr2WLFC5q96adRrwSA1dG/YPJ2s24O3xRG/dswiOzRpkpZlg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2CkGDNwECVzg for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:08 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVz03xb9z1SHwl;
 Fri, 11 Feb 2022 16:02:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 15/40] target/riscv: Improve delivery of guest external
 interrupts
Date: Sat, 12 Feb 2022 10:00:06 +1000
Message-Id: <20220212000031.3946524-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
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

From: Anup Patel <anup.patel@wdc.com>

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=3D1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=3D0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=3D1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-5-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 698389ba1b..e45ca08ea9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -326,6 +326,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, =
bool enable)
     }
=20
     env->virt =3D set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+        /*
+         * The guest external interrupts from an interrupt controller ar=
e
+         * delivered only when the Guest/VM is running (i.e. V=3D1). Thi=
s means
+         * any guest external interrupt which is triggered while the Gue=
st/VM
+         * is not running (i.e. V=3D0) will be missed on QEMU resulting =
in guest
+         * with sluggish response to serial console input and other I/O =
events.
+         *
+         * To solve this, we check and inject interrupt after setting V=3D=
1.
+         */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
=20
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
--=20
2.34.1


