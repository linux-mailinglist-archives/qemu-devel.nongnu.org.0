Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4D47A4E6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:16:33 +0100 (CET)
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzByK-00027L-PU
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:16:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp0-0004dw-8b
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:50 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAox-0000FH-Dq
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976567; x=1671512567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1lSYilsoOlB6KrKbkUU9FSVyrNPSDjxMYcpdA4KhwA=;
 b=f26qHMdZ9gtwwfOCmIt4/dF97RQaj1Ehd/RVmh4VDUBuPrHEpKVRCZMr
 bYFi/4jsMKDw2CVoFF8VR3M8YcIpKzcAvFoCu9FAfa8PHutPqZppSiTf4
 FQQicG82DgqzJW7Ub08Ib3/1u9y521948+/0jrEnYeqaPbwaU6C5Uat4H
 p3ZsQADJxMs3PkWux5oeax3Dr+3L6sGG+ikTQ+I+S2CfNwMOY0okkERKO
 wjOygje7F5Jo+o1/Aqss9Tt5LxZgMYjMkldpMuoMHlgpaB32yK0At+3pK
 +NaQLI8MUzWfqJw6LQGJJ2Iv1e+P/eTwwo4wDtc0SK8vImoqA1kyzGU4r w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662340"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:36 +0800
IronPort-SDR: 64W+99kL8ChJyYRiX93Li1ECaFYPtbspRb9sZ2byzJNjVcDuG1KGw4OA9gIhQasnLozsurKU7E
 u0cgeAgI6W9L5FhnqqtkbQCgQsZ297+kWbTP/zq5ozx7xHXGn2+e6mh+7OvF5QhpOjS6GEL24J
 AbJjIYETyGizyeEAyxQynjH8NZi8tvcVg/jHOb3100r3knR9KRbffhLHLvJCVnputrPZtEF9uP
 Ur4Dk1eoyUDTd4RByVdDlK3KiUhHhun+HdfJHCNqRG+b5WQgmoEID3buChCm5GspVz6h0J3qsZ
 NsyeodiUXhO4CGtbk1U3e2eC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:26 -0800
IronPort-SDR: PFTRcda/4IJAJ4AIjDzpmbFsbQlGihiVWbGXYaykQJGI1mDbwYF9UDh9zu0EqerpPUDqgc3CPI
 oLtlsZ/fv7wTWXPSXbb4KQNrExSlt102kUgI+flRxa/gdEV/57Ram/OMn3whDdLo5b6ZqAFYWf
 rLrmcfjlH7sE/H4wp/PiM9KNeHzw3PcWUOzJHV5czxO1TWAlE9YnLaWiUlMfHj7XsUNTY+g8J8
 rrYiBgCLAXjSFF3//bQe8ci7DPmP3S/q3OlAQknUrfo8PIZ3UB0hKT7PTyBTu0IQQvJI0zKofh
 yww=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBh3yPHz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:36 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976556; x=1642568557; bh=L1lSYilsoOlB6KrKbk
 UU9FSVyrNPSDjxMYcpdA4KhwA=; b=MRoi3XSRJ417HYbdTRVVsaqfJf3spURaX8
 CNsOw6GBCa1/zjbOGtxNZmWgT2Fl0T/mpEcjywITGnqjzb3PjP+T6ugzOvmSTpeL
 H77LMGTlkemPmsvu4QXalQhSFR/oBTYqeIa1yA8b3bmhft7tRzPBkGtm/lyykBOQ
 SXxgah0PkFuPhTwFIvy9plAFG9HYHvije5bmoEzt9UR/SiV8aobTa+b5Vdblx6+R
 CrP/v5X24dsMICzeS9fQjoQmQiRNyTcyPz86cQAz/LJsMaPuKUIgzo86xzAyVLi4
 UX3vUYPvK2YlrzMpVDF4bE1zdoDCwpeI7zf3LNCdzmUnodYojuTA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cwhSkZzvPDx4 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:36 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBd4WPZz1RtVG;
 Sun, 19 Dec 2021 21:02:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 80/88] target/riscv: rvv-1.0: add vsetivli instruction
Date: Mon, 20 Dec 2021 14:56:57 +1000
Message-Id: <20211220045705.62174-81-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-73-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d7c6bc9af2..3b6524bad9 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -79,6 +79,7 @@
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=3D1 %rs2 %rs=
1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=3D0 %rs2 %rs=
1 %rd
 @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
=20
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -672,6 +673,7 @@ vsext_vf4       010010 . ..... 00101 010 ..... 101011=
1 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
=20
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
+vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
=20
 # *** RV32 Zba Standard Extension ***
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index ff8f6df8f7..e540b5d33c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -160,6 +160,26 @@ static bool do_vsetvl(DisasContext *s, int rd, int r=
s1, TCGv s2)
     return true;
 }
=20
+static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
+{
+    TCGv dst;
+
+    if (!require_rvv(s) || !has_ext(s, RVV)) {
+        return false;
+    }
+
+    dst =3D dest_gpr(s, rd);
+
+    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_set_gpr(s, rd, dst);
+    mark_vs_dirty(s);
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    tcg_gen_lookup_and_goto_ptr();
+    s->base.is_jmp =3D DISAS_NORETURN;
+
+    return true;
+}
+
 static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
 {
     TCGv s2 =3D get_gpr(s, a->rs2, EXT_ZERO);
@@ -172,6 +192,13 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetv=
li *a)
     return do_vsetvl(s, a->rd, a->rs1, s2);
 }
=20
+static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
+{
+    TCGv s1 =3D tcg_const_tl(a->rs1);
+    TCGv s2 =3D tcg_const_tl(a->zimm);
+    return do_vsetivli(s, a->rd, s1, s2);
+}
+
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
--=20
2.31.1


