Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61D4B82FF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:38:38 +0100 (CET)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFpc-0000vB-W7
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:38:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqm-0007H6-4D
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqk-0006rq-Dp
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993098; x=1676529098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMz1iGz8nSi3Q+ohYXo4qXkBQTK9cKb9Tg7NTM4YfTM=;
 b=Mo8MwZq33WNnuS6MLZCw5FgDNGuu1LAXpjdLU0Vy6DuY4R+krFBRRbTL
 CWevJI955q8FJXdr+g6cLv7AxyCUSIUKTclSKgQ2GCpI2USZkCFbR6reA
 Fne8fE4wQv6beGbFeYV8bWkygjr9CP2ez+oIYBJ9e4E2sX+IuEqqmLPq0
 n4ENEGTlZ83qul4G6J87Ov3Wa+7gWN90INg6uaavA4xIrZ0Wgilna7sMD
 Xf3HdZOVjxlCstLOE8JQdJen85vVv9wprv8q3WYB0JLcy7MBLWcU4P6Kc
 iuYpuz6sODDhE30g81PYM3/D+i51DfKQistb0Emqw1rhRvWyJlOvLKzVC g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181857"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:27 +0800
IronPort-SDR: 8rO1TZm0WpFIkqnxbWktIVFUHu9aNeDs1kbihVVarr7CL50wAZpHvYg4f1CbAujLcfhTWSktu8
 WqxeEOOl7l2bi05jWBF36c0UQXi6vvy7LcJ2A2g6N3jDShjZWG5LgEUI9CFthctgWRlg7Y0BgC
 29E1BqY4GLVTsOSwsxMsCKMbpGEodDuOEwIKGmK82COwX2nhE5v5HvqJiqr5L0Pf9QTW1aSiM1
 ZSrMKxU5NUXAZd/EJPa5EiHlAlroDGEfyWLic3UliUy11LEPmq7jKqAjrpQX2ux+qwP+kscYjh
 kFteDK0rPowXcAucaGzO+bFy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:15 -0800
IronPort-SDR: E6/KL2ENdCaik8CQBWC4Cw0A9UUo7FcYqILamMFUngyZL690RoY+H9/6t+E7IQ10JvVK1GwZb7
 5MkmhacjaThjjuUlY6YKKt5ovWn7iF/mrMiRd0D/UWLDio1tfeXfcwIf6e/iylFldO9u+SRhpF
 bAq0WvI1YEDbmbds9IFoPzKH9hlEWUTWyNWLM7pNWKTBSwEqKtstzpI11kSXxH3AfXdmkQr0ht
 RhlKZLcIoXGHl2vvGxQpVQpV6rq++wrF2gqOU2mB9No3EneZqLnAAcIrO5CempjAqj6ZPeG4DS
 vtM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7QR3vF7z1SVp1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993087; x=1647585088; bh=GMz1iGz8nSi3Q+ohYX
 o4qXkBQTK9cKb9Tg7NTM4YfTM=; b=P2WBnR6DufmLu8oCednolZAiTDQvxTZP7G
 nMMMMvMJf2zU2zv3m4uLronzTOwXcCyPeOxeFoYYaqWhvssONa/dCUG4Ybcfa2w0
 RTmTqnJbF1JmFvF2CziL0RX2z4bHY41T6akrlnRautgUlpKZObVwSsRyhtVansQT
 iUSuQCKqMfwo6k2jAISmZKqJBE9TnBHsSNl24y6jj0TGtSxftg83IovpsXLT3Pgm
 s3J8A5iJgrjtckaY9uxqxtZKmdvdIUrynAJhzNz6ifyWCJCNs/qui8EWCRmTVKYb
 mM4ViRP8CqfNJ8ks3adQsRVUIUItCTk1W9Wf4C7FXZxEneeIlfLg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bfgVOLW-5ANm for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:27 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7QL5S3Tz1Rwrw;
 Tue, 15 Feb 2022 22:31:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 27/35] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Wed, 16 Feb 2022 16:29:04 +1000
Message-Id: <20220216062912.319738-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
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

From: Anup Patel <anup.patel@wdc.com>

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-17-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2643c8bc37..e3068d6126 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -212,8 +212,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s=
, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-            "riscv,cpu-intc");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_AIA)) {
+            static const char * const compat[2] =3D {
+                "riscv,cpu-intc-aia", "riscv,cpu-intc"
+            };
+            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatibl=
e",
+                                      (char **)&compat, ARRAY_SIZE(compa=
t));
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+        }
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NUL=
L, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1)=
;
=20
--=20
2.34.1


