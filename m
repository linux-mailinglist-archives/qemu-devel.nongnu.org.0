Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5F47A4B9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:51:42 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBaH-0008Bb-JR
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:51:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAn2-0004H5-8P
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:50 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmy-0008MN-SG
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976445; x=1671512445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3gRQu81GWMU0aB9KuDEYcvhtof5XpUEDpokRRJWn/A=;
 b=Mdf6ccLfiy0qDPD3b9hl9srl52xomDmYvQ44RnFSiiuRshPijQD/LB95
 W7TLnOC3gYs9qFWoV0NouwEyytuOeJ6Wj7AvZ94VRyzCg1Kaf2b6jS6nl
 73WRGz/FJmjUDP2KP7Cf2vhXqQH8VZaIr7+g3Yr1/vKmkJXa99fA/DP0B
 0rWSbxiLH5VJ8KsYiPiRzMx7tD7qGiUDdmmqMHLGR8mbceG5mZSkpomrg
 oS7yN/PqEkX39fWWR35gRImCbq7UQZcta4/l4l7GjIsQQCaCbKz4PcUhL
 fwqQo3yDVDyklkorW33y/sFDwxaQ5LScBhgbam12YkipmiDD+7jlYMz8t A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680113"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:31 +0800
IronPort-SDR: MhV3FAOK+agCw9uf+aRcsrVbj2nQBMzN15iUfYBvaVqbiLfiWMStoxc5bnbsfnwkA7PeVfbiBb
 uBT0CN+vDLl/A90JviUEhnzQ/GTrPHOWOwHqvnGDYCqL8wZRFWuSm6D+tL353xiVC4y8fpUFh0
 faL86QZVzas4d2kd6XCGPhF/Kj5siAfTpI+El8Z7sQHRHgadb6mQlSsQ7GbjrpXYAtaMheD2or
 x6hZHXS12ULCyp6yNnSB4mlBFPvWG8dXC2DgWGoe7EuA/NCAsw3Eg+JGUZ8yRkg6A7m2XVfqRK
 Jg7lwMEyVVRt/eKwD9E9QUy9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:19 -0800
IronPort-SDR: f/xC0oeT8XK5SxaU/OvkhRg0LgI+ymZJtmfPZHsDWgDX1aNi2qTp1OpMuMC4RMRsJqLVUd2k4U
 bp7XhWYufTEGSNLzE5jnEEuhObsMKXV8Wv2+D9po04EO3DHWGqY5GLep9gyp5fYuKAbtltk/GE
 mjTqy7OohQPtP6DMhtJ2NoKb2j9HgpaKkMKAu1yOSmGv43eVKh1fqPDr9qa/HeacC0W8HEEyoi
 m+yOt4d1ySZOk/OPkGaMiAYTs7XURuNy90/I/6YSJBXisYyVUERsq7GjrqIMJPHGmHxfvTssRB
 nQ4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8F5pQPz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976429; x=1642568430; bh=F3gRQu81GWMU0aB9Ku
 DEYcvhtof5XpUEDpokRRJWn/A=; b=Shgh7nEEoL4bd+o9YPBvCgngeHfAh/eY5H
 1in4Y6pbpVE0Nkcc/f9MChVnonlacAzWvsB0YAZzlP+EmxM7ckqJVdfCbGxujGuo
 +qk5QFqfzLu/jPtIwcc0ua/VJBaAUThlVp2h4BnUmnb5UVhEm8zTNNI3GUyaSCMz
 wB7AY6eTuq4VqtMn7nn1wpvf3LUS2Fgd8bgCkBeGa35N7NRcmF6YoueRMP1w1s5g
 RwUfftXopsUjUrW5KyMemc7U7yUn3ywhNZnXNPiurQ7QwFaoTPZlLR/iuIwuFkKl
 gmgjEF1W64mZ+5wzaoUmIlGu2Df7jTBuBY25W3w+0E5816uWEDqA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id TS9IUOvy8s5b for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:29 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8B5Dwdz1RtVG;
 Sun, 19 Dec 2021 21:00:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 47/88] target/riscv: rvv-1.0: whole register move instructions
Date: Mon, 20 Dec 2021 14:56:24 +1000
Message-Id: <20211220045705.62174-48-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-40-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ab5fdbf9be..06a8076311 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -650,6 +650,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 10101=
11 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
+vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
+vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
+vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
+vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
=20
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 89f88a0ea7..91e7c14ec4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3259,3 +3259,28 @@ static bool trans_vcompress_vm(DisasContext *s, ar=
g_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 16.6)
+ */
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
+{                                                               \
+    if (require_rvv(s) &&                                       \
+        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
+        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
+        /* EEW =3D 8 */                                           \
+        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
+                         vreg_ofs(s, a->rs2),                   \
+                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
+        mark_vs_dirty(s);                                       \
+        return true;                                            \
+    }                                                           \
+    return false;                                               \
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
--=20
2.31.1


