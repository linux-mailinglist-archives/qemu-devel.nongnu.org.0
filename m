Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1D4B3208
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:34:09 +0100 (CET)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgMa-00015h-Oj
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:34:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsd-00086p-At
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:12 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:7544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsb-0000QB-Hh
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624188; x=1676160188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMz1iGz8nSi3Q+ohYXo4qXkBQTK9cKb9Tg7NTM4YfTM=;
 b=mSEXdU5WKB9hDWak4To3c9xJppvTTnLFxcrvoY4BlpLCwyOTP/Zsbnfr
 2BTv8M9XMdtEVi52+coBXWZnn6lVkvkcNK3y1YhuVOjymWLTl7deAk8/N
 l06ksuPqxiM9i0nfA+2iu6D+7dBZTm/R0YYVY57KyMdr3YOc8Z0ZZgy8d
 LzWclqzoAQgfOZMGrcoV4DiAgD7czmI3AKD8bXg0XCkQcigt6JqtluDQ6
 ia4Q7DjmNK/h3lJYTR9X2RF2K8FcH7PdMsRUQQUu20ZFJ08g/hufBGnuU
 R8z8EdXDiH/67g+6hGmmupFrSaEaehjWco0PBiSfux0DzKrLzwhcNTLWW Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="192728527"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:07 +0800
IronPort-SDR: oSgfF89cB8P/lT08FoKaHVB+fzKMXCuSH7FH/bZzzSRgp1b6f1zbA3L2SRsUu/yW0neAnRrB4C
 Up2Fkmvt5xvIkzt+sQToLRDOUgmjyIR47wVPDjgKeTdxnU82Xseoigo2EGiqdqleJDUkbf4Dyc
 jbSpRr6bQYFCwQXGzFBraFXo5i3rMjV15xWxzNdfahfdZ5ute0pnMZdniLSQ8qmpyXidVvrEK4
 Z2RbDUmmW+UNc9AcrE97d+X8OZSdTR25N3ND50p+YPKlaK06TnqqOu5rqdzmG/+iaRGzN2uTUK
 aFks5UsWpSRHxALRo2GoZJMh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:34:54 -0800
IronPort-SDR: RryDNj3Y7vc+OH02kXC/ddO/bonGBOzNA11Uk6NEfha1QO/EpwC5bPH40B6w8gOxHfXf7vAVdP
 Gi9jikqkOabbXeTw77nINMNtYyzgNrAr3v1UnhM5ltOnFMXrjep6tJIDaJU3NsQNXoqKzFZNnz
 z3chxN9bPR7d6PyAIQxepJgIQ6nl2jmq8GWP/JgdoEZC6dT7uCXVkLDbNybt4hBrkA0oN0oiGL
 lZ9CAnLOo8fiuksk+UjhjBs9Qn6+/QBqC+aX7jl29twlDJc8qvj9km5we4YqFPUHV0ZXCBa//L
 Wk4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW0D4t6gz1SHwl
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624188; x=1647216189; bh=GMz1iGz8nSi3Q+ohYX
 o4qXkBQTK9cKb9Tg7NTM4YfTM=; b=Sarga69XwGKg5IUJJLmws0h9st2Ff4Yk45
 FFgiIiUvVpZkAn+87o+v4G0CEnDXktCS4y5FOIJePWbSmvJt6S3BqPfVLNto946J
 cVRmg9sxzew3earlXByqw84E19N0Nn7oHyV8SKfYGWoteHpyIgUVNDiW21WBJFdm
 vHRwhY3nuQXlzewkpbHofcpZssHm44yKQKN7C09lJo+pV8/fWP5B+j9XjEnS7jyx
 cNADNXfrRj8s3B95gGtIwumzoN0mwIxzDaGeydMG91kJCr6BuJNtKnulfQc85yus
 LKnDTR5tnfsAnOskIL2xKOhCv3RLNTfEM6X2ejSMX1a7AEPeVMWQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4ovc_PH9cYZB for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:08 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW076Wr2z1Rwrw;
 Fri, 11 Feb 2022 16:03:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 27/40] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Sat, 12 Feb 2022 10:00:18 +1000
Message-Id: <20220212000031.3946524-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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


