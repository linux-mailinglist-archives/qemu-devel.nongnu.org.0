Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B34B80D9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:56:13 +0100 (CET)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEEW-0004Ke-1L
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqJ-00076h-T4
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:12 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqI-0006ld-1E
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993070; x=1676529070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6y3dsWCf1ia7rtV5ptSfzr6nuJuaFHm6pTp3m7sfs0=;
 b=Wz6SZkj1aFoPyA0wcJbdBwuc8lWpH9P1nGbTNnzJDbRVDK7q7yYIFJd5
 hPLhO30kUi8AYqshnAQZmVOWZLVe9s9MZE5STgGOBXZXzYPaS6+Llvse6
 EtNqBLw1KvXHlFWEHjAryQQGSdCpLkneK7lAqQXTnUKauxWpBSMskg2qP
 roonn+p53x4w1IeXELAqrm278FfBNhuP6JL2XR+MfOVgEptIfm/3Hmw3j
 Nazd30GT5+kbG4fghc9/L4DOAlBbRhPSswLuwgw9ZLFoGn+JZ3X9vbfQ6
 gORWE/1lsYmlTG6EgKUK699Ldp1Ux7sr8Dwpbd3rW0FYzePxkQJPvUFYE g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181825"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:08 +0800
IronPort-SDR: czA6wZ8WBfNFLkuzxK/Rk/vLjThMdtJpSiSWg2NFuRTTMUYCH8d2IwDnPUXow39ZSfO4Z+vhvc
 LCgY0YmxTnKQNO8kZnBrIKXjoLNg672jLuekytIr+URqrJ2ZhaGf+aGklvetoWvIaw8yoBYFyu
 bGgbNErSRut1Lk7U4ISrm8StEp4rHQRY8qH9gt22kME0z2o77Pj6ZVWZKOg830/4RQ09FBIg4W
 FHtmOiAZBHMf04b4BC0ILR6ehEt3cdykMc+vD+Z/qGwIua6+mpjhKrk1qqUwonIAXEn9ZZRzh3
 Nk1xPZYEY10TRRW90WeXdg6p
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:56 -0800
IronPort-SDR: R8OL8D68S6kQDACWpl0MSjbmArZc7Fwr/igh2ChP3lFOqxCKN7uGmKlYDvNmDIz4EoEv7lVwcI
 80e9+DXQPlsqM3ysIbJO7K64ZIVL21PCj5A9xz1/8M3j7N6JQgs5k7elI1kFu3YacGic6DnGf7
 37JltjotrPLlNI3N1Dt4zYQMwcceLiv37Lr+Cxb51Ft4bHea7GU2vydKD7schxXTLmjs/ndIvH
 aoEZ595fQyptHBhd4VX2iH6K8kqitkSQnU32iwBOzhACMZxnE/0oKYbtTZ9eR9JsdGmSznnIud
 X20=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Q42TYCz1SVp1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993067; x=1647585068; bh=e6y3dsWCf1ia7rtV5p
 tSfzr6nuJuaFHm6pTp3m7sfs0=; b=bmkTBEv9IF5RcWwnJ57zWQXTOcv8CSBy+u
 RhjbYo5plLRTltc3ir7+kaYiAbGFf74MUOYSQGDWj4N/v/S4T48rlDVnR8c1Jo4o
 X3bh9HTUlq0rkaRLO/U7D3vJmQxdcpWZXk/5oTwKQeUphUFpvABAGYTRR+Z1e24/
 qOKF+MSOtTf2L3FbYGylDdcniD1DCB0wRY96tsezSzJh1JpX7qBV2btGT6sRMXej
 rrs73Ocjs7QSONdtAzUKpS0n0S9izmfUISEvYAGsYD2bdWuIY+xPC8HNqdz7+ArI
 pl7xcMZJRCvBStT4GYsSD9q13ZmzO9OcBVqu087UcerwlNbjC7Gg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tcx7f51JDdbF for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:07 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Q02DKfz1Rwrw;
 Tue, 15 Feb 2022 22:31:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 23/35] target/riscv: Implement AIA interrupt filtering CSRs
Date: Wed, 16 Feb 2022 16:29:00 +1000
Message-Id: <20220216062912.319738-24-alistair.francis@opensource.wdc.com>
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

The AIA specificaiton adds interrupt filtering support for M-mode
and HS-mode. Using AIA interrupt filtering M-mode and H-mode can
take local interrupt 13 or above and selectively inject same local
interrupt to lower privilege modes.

At the moment, we don't have any local interrupts above 12 so we
add dummy implementation (i.e. read zero and ignore write) of AIA
interrupt filtering CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-13-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 46448a2b7e..89700038fb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -158,6 +158,15 @@ static RISCVException any32(CPURISCVState *env, int =
csrno)
=20
 }
=20
+static int aia_any(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
 static int aia_any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -568,6 +577,12 @@ static RISCVException read_zero(CPURISCVState *env, =
int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException write_ignore(CPURISCVState *env, int csrno,
+                                   target_ulong val)
+{
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -2598,9 +2613,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
     [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
=20
+    /* Virtual Interrupts for Supervisor Level (AIA) */
+    [CSR_MVIEN]      =3D { "mvien", aia_any, read_zero, write_ignore },
+    [CSR_MVIP]       =3D { "mvip",  aia_any, read_zero, write_ignore },
+
     /* Machine-Level High-Half CSRs (AIA) */
     [CSR_MIDELEGH] =3D { "midelegh", aia_any32, NULL, NULL, rmw_midelegh=
 },
     [CSR_MIEH]     =3D { "mieh",     aia_any32, NULL, NULL, rmw_mieh    =
 },
+    [CSR_MVIENH]   =3D { "mvienh",   aia_any32, read_zero,  write_ignore=
 },
+    [CSR_MVIPH]    =3D { "mviph",    aia_any32, read_zero,  write_ignore=
 },
     [CSR_MIPH]     =3D { "miph",     aia_any32, NULL, NULL, rmw_miph    =
 },
=20
     /* Supervisor Trap Setup */
@@ -2654,12 +2675,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,      wr=
ite_mtinst      },
=20
     /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA=
) */
+    [CSR_HVIEN]       =3D { "hvien",       aia_hmode, read_zero, write_i=
gnore },
     [CSR_HVICTL]      =3D { "hvictl",      aia_hmode, read_hvictl, write=
_hvictl },
     [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,   w=
rite_hviprio1 },
     [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,   w=
rite_hviprio2 },
=20
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw_=
hidelegh },
+    [CSR_HVIENH]      =3D { "hvienh",      aia_hmode32, read_zero, write=
_ignore },
     [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL, rmw_=
hviph },
     [CSR_HVIPRIO1H]   =3D { "hviprio1h",   aia_hmode32, read_hviprio1h, =
write_hviprio1h },
     [CSR_HVIPRIO2H]   =3D { "hviprio2h",   aia_hmode32, read_hviprio2h, =
write_hviprio2h },
--=20
2.34.1


