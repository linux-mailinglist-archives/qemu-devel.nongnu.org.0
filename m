Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D74B320F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:36:33 +0100 (CET)
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgOu-0004tH-NJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:36:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsS-00085p-88
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:01 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsI-0000OM-94
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624168; x=1676160168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6y3dsWCf1ia7rtV5ptSfzr6nuJuaFHm6pTp3m7sfs0=;
 b=OKBEFW+9nxpme8WGjJ4Tes8vBNAcGANo2zUiAQ5R0jx1+yb4gnHu7u7q
 KFWjNYpXRPUWboI1mSD+bSHqzsEFwtAHei5uLs4DusOq7Ud153B3s1/6K
 DomZU7TzId8tW4J0GivIURn6S9Yh1xooMtY9ISa1u6OAGcXfbS3ILOjzg
 D0NFEBU/5x8a9a8ULz/3S06x8GhlcNFqzRqmM/Zd+YA4YvAdBY7LwEzk/
 G3VxaY5P7HWAUfCGTIZP5ytUVl7IQxnC0tKra/hCnqyDzs7L6mhy/IXRK
 27m9M+LtbA1bi9RU09SQ2HtNyDWl68ZoNl9DyFz8dNFgJITU32rPalJhC A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="197552482"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:47 +0800
IronPort-SDR: YaKbraWTl/6XwEM0e+1Pmuw6OlClbdU4g/6w3V4fuL7XIhHMXcC4MMa2znqjos7xNjL2q2zewr
 hEaEqfh5hzZoYgUE0J5keDababPAc6qBVzvcVs9onUEz34DL6RJqrNfPOsb9kPM6+E00IP3W0a
 ZdLZr3DPZrw/bUnmFHlS602KIAv7H8ulkJskfojLZhF+2+mlNhAAIAHkQjb69ehgxaBwdqEapQ
 ZVYf+omHgAm571wk5/UaNKRmpUaAx/g4wQaDPWmezFQcq9GpC6Dm2mSkX6jPpiikiU01F0zgEf
 rAakgYNs8bBDZXy54ajMqC6Q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:43 -0800
IronPort-SDR: hMYWmJ/9xrf0yO2Xgv8QEo7rUwswCLlfk7XSOKG/8JK5Vz9tPsVMaAhCyCNv00E4BoAmfM+yIm
 GK1DBW0zm5ST1IHh2l6CzW2IBxz7IAPAgXtMSLF1GyY+7Z1zDREkUmhQfzWmDdP7E8o4jm4nWd
 uv+ArrjM+8So9SvZ5H6jyJv65EauzwlmiIWnYeg4wtr5d6ByC+K48l9/gmxJ+anuQhumaX+LAi
 ZKoLjEB4TIxLT8JXk7r/5AOs6MPTUU24lFAWGY8lV73zf6GClD6w0tzesMJYDe89vwPWqOLjVn
 qkE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzr4rnnz1SVp2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624168; x=1647216169; bh=e6y3dsWCf1ia7rtV5p
 tSfzr6nuJuaFHm6pTp3m7sfs0=; b=owzKThw5aGTDJcpbVqBASsV/t4/lZF5+I/
 ErS4tvBeblugbFpJjWD6cSLHxomDtimWTvno3jfsEz3SgGb3YcxYjBFtZX5mLW0G
 2zbdY4Bx5z7tOug2MHC7IY/1y0JmLz6ODd5v1AmeBIFmYrjR4+NOtFVOyTAMtGwe
 SLh333w+BSjT56zW6gRsjGCutGjUk+txif7kjD7YhyvhzbY3BhYm12uM6tWRfg9J
 NyU//eUdYiczY/+ebu/QlzcV00Uv9F6uWlyRnfem+yGi86fWXrUpoO/3VS1JixH4
 trE5dnnjH42EZnsdfK3WWFSpZGO0iBo48/jeQ0Rj/Gxt6GEQK/xw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jcYa6FAbsc_Q for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:48 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzl6gXDz1Rwrw;
 Fri, 11 Feb 2022 16:02:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 23/40] target/riscv: Implement AIA interrupt filtering CSRs
Date: Sat, 12 Feb 2022 10:00:14 +1000
Message-Id: <20220212000031.3946524-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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


