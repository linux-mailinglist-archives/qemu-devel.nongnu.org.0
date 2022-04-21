Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEBD509805
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:53:16 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQgl-0002E2-Te
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSB-0005iH-4V
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:12 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQS7-0007yk-NU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523087; x=1682059087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYb56uk7QkQsKRVbU7X3OT4/rDP+/H7r/KJa/gw5Ij8=;
 b=RS8AmHpYAz9Et0JjN5Wk1wjg9VoiYzNiTcc5Yc7hGNxOVWb8LW1IkKU7
 OHVsRM89mmHxIm4+CWyE+gNQ2dPfdOEr/0p/BPdnjXxyykoyJ21Vv4sWH
 uQBBLcDycOgZ8ruj5W8QFd2tP0gfrJcg1J+gpjWjLVGNLlj4QFxYFw93a
 zW1HJb2+CkP9cpKDceFGttpJ/42cq2xWtagWx9ZIjklcottFQf9nfig+x
 58bxbZpLdfLjVabQSoyGgzkR0XYeW6SrzwZcIoWSFZsZnyytOFi1g11ac
 SkJ5NB3sg7nA8QCQIzf2XRymCd00Jq1H21Ly5pKVPJcJo7RqA78xXPRLe Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640009"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:48 +0800
IronPort-SDR: 8DJvk4hMx0RdM26UdFgiVNvqY6+Nlqdm71QRY+OTYpNAa4zAyimL9X1jiGIw6x4Edgrwn12SgN
 /u+O/njSl8eoGOYPPlvuC4ZrcVheWXdAcPmWIvNzGyMlQYMmsusWJ7v5FDOcw4c+8xJmhy0uWm
 7Wzhc3lwhokrH3BZlhLHRSc2jo9OKyW9jyEeop4Oi99y1p+2hqXCzVkzHkMJEFyCUzvqYoSij/
 BS3WqBOT2XjT8g7ojCfYdAPrZje9WAKkDqWz/ME5TpKzd4bxNv7NUyCiA6wWFLTbTb67Seqsr8
 e5MJnnmonYo49dyM0BqJADlX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:50 -0700
IronPort-SDR: tZD/KNfdz137PxHPYohtbQQMnI7Yh9XH+ab1islJkNwC1+z1v3qWTvHnxgY6CHpTrLwl6Que/1
 ceJhww0H+5dctWLmSXvG3HYjl4aO/d6YRylwR22ru5DBKA3s3IjDSc8oYSdbvWem6XPpC2D7V4
 2/1mojV7ZI7KQ8lJgzVDMM/lb9WriEtsyyfQy0D2XdMJwyvmPNGXw4v2+3MVYHxniy2UYJqTma
 0dYZuocR/GR9tiCze//v87TNSB1ErFQiXS/4S22wTL9zHfaULY3bjfwMRMoSZTAxHy3/XCG9g3
 U0E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXD123Cz1SVp0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523067; x=1653115068; bh=iYb56uk7QkQsKRVbU7
 X3OT4/rDP+/H7r/KJa/gw5Ij8=; b=sCKALq9SSeeQZ9nghpYhD/NrDfwFPPNaeP
 sZN2a7+WVm+rk1PxppVfmz8vc3YrGXADRD8gQwzOmG3ALl+fCXLcOrOZBRyHMen/
 bfuJlyA8vFpxBLm5ij38XwZhgZcghTDWJdUqRYefFNvTfaslBwlpmkLOKM0KJaOI
 DcfRrzDh7lz6dDh/hpibA4h4Hoq2XURbWocB126LmpVtpmWkC/8PbFiAZfqarN7v
 DgUBp5Fdr9b6Qb11wB+I//Pmp0XbSjSmSjZFjdI+L44VbpDBMvnEVwAAft3SlkrQ
 qrpWajPe62Eq2YGG2ftZsXUfG5h1kni26b6/1GQ8bNtx2ziSIZFg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ykrVPh71Uhbv for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:47 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSX86VmPz1Rvlx;
 Wed, 20 Apr 2022 23:37:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Niklas Cassel <niklas.cassel@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/31] hw/riscv: virt: fix DT property mmu-type when CPU mmu
 option is disabled
Date: Thu, 21 Apr 2022 16:36:19 +1000
Message-Id: <20220421063630.1033608-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Niklas Cassel <niklas.cassel@wdc.com>

The device tree property "mmu-type" is currently exported as either
"riscv,sv32" or "riscv,sv48".

However, the riscv cpu device tree binding [1] has a specific value
"riscv,none" for a HART without a MMU.

Set the device tree property "mmu-type" to "riscv,none" when the CPU mmu
option is disabled using rv32,mmu=3Doff or rv64,mmu=3Doff.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/devicetree/bindings/riscv/cpus.yaml?h=3Dv5.17

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220414155510.1364147-1-niklas.cassel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 09609c96e8..b49c5361bd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -230,8 +230,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s=
, int socket,
         cpu_name =3D g_strdup_printf("/cpus/cpu@%d",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_add_subnode(mc->fdt, cpu_name);
-        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
-            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_MMU)) {
+            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+                                    (is_32_bit) ? "riscv,sv32" : "riscv,=
sv48");
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+                                    "riscv,none");
+        }
         name =3D riscv_isa_string(&s->soc[socket].harts[cpu]);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
--=20
2.35.1


