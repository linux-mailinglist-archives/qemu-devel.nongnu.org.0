Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6E50AD0B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:04:48 +0200 (CEST)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhj5-0006mL-SR
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJq-0007wx-Rs
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJh-0005V8-Ub
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587913; x=1682123913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iYb56uk7QkQsKRVbU7X3OT4/rDP+/H7r/KJa/gw5Ij8=;
 b=GSAksDqhPxLV3V7aqNVNYEfPgVW7B7Ojymfk6fCr2Wzb1izLRIUa3oqK
 Yqfo8oL/u4KEtk8zDiLp0atEiXem1gesOWRv+iF51ETiVx2WF2ARt3WLq
 R6FQK+d7e+CIAXrcEZhMpIkGZqTcX1UbMV35b1PXhRNayM3h/6egoq7Yx
 omt0i8dfDjlfM5o9lc+6IVNOWG8LqECguF5b3LwhibIFyVzJNhdBRg4Cr
 EQAh0pL3aEWqom8HR8/7B7L3/q3CxMhRq4lKqNkiMyNVBBXoBmso7I6bk
 3/K6l5LYHRpvIpsc6pL8oFR13eNa7Eqde14qIikedAv+0aKdFDf0PNhSI A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483415"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:17 +0800
IronPort-SDR: kUfEXNazXEaN0IwSGjWEGu/0jYO5GEuNaIDCZq4XnvUqMyiak9qSx9eDfLFRxnZOD1R66V4Ujj
 PuWr4reypkqsVqzhQm1DeNNBwHgh7PY4GOXMOYq/Zt7la2vDGG9OUqlKjbkBJlzQfso+4TBkO9
 GmQgJo/nL6miInMl8H0/pIGtx7Sw6d9tcCsLp1rXVSia2N+l79XB6x4XpwvkGjS3LZtmh9lR3y
 DIEex6wHjjpIzQFuZ3smgcgJsgc9k8EgYYilzC3dNUPSPyQUB9hVAvYJzb59mKMJxFOVustqPz
 rwgSC5s1fUlXQ+Dz7OyZD+wf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:34 -0700
IronPort-SDR: pZ/l5DXOJxwD7hU4/BAGnXVXb8jPVDI1ov55K/NhAHjjpOzRMI2YR80O5keVZU0mGUW/4+XziH
 hKjkmYjYECAwnvgTbgxAmLWD5upmiSuQSYx5xo3VBnams3MXWcY2Mpfif50m/XXylAn2yUFfcE
 lUsrMDxuNSv/dPwkD01JXg2b3iGMiAed4cqtidUpF4lfWmN6KwzTKxfFAZamjfX4Y1StXD6H31
 hKd0291t3vp77L9l0yuZBg/gtsdNhgLS6QbLyQottTei5NgJe20NZWOPyDyguLlVWc8thY9GWX
 x7E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVx14GKz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587896; x=1653179897; bh=iYb56uk7QkQsKRVbU7
 X3OT4/rDP+/H7r/KJa/gw5Ij8=; b=GBvWhDqM/1Ud5hrvy7YCI+0N7QueQwF6S2
 zccktdBJCEJ9RKZrP59yZ5GpIP8OTMtXc6HKOCeqY4DrjVSyaq07T4K7gnZaYhvm
 h/QEYePRvZ+sBHmHM7YNi01utcSZ/ZqlpyKyBuYu1XpT7sL1VmdpKrL6cDiF9kwm
 CB7LQU5kb8XWbx8qTYMZtOAjGT5bRoWK5VIqeHCRxDjeCiBD3ZGPz1UKb852934e
 sbILym0Fgtuy4xiTYc3A9k6HnaHg3w7dbT2qCPlP94gKMxGZRWUFXbFXMjCFpH5L
 4ZeTkfP3R6+NqZy/wfWQnT9wTKlxp2ENr2xLOSJjAyXQcvPCrcJg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qba5LWlY1I5A for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:16 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVs3mKKz1Rvlx;
 Thu, 21 Apr 2022 17:38:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Niklas Cassel <niklas.cassel@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 20/31] hw/riscv: virt: fix DT property mmu-type when CPU mmu
 option is disabled
Date: Fri, 22 Apr 2022 10:36:45 +1000
Message-Id: <20220422003656.1648121-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
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


