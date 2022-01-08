Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF44881DC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:28:40 +0100 (CET)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65DT-0005VC-Kk
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64e4-00005q-52
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:04 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64e2-0006s7-FQ
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621122; x=1673157122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GccwERZd4w732c5u0GwMOuI+54qAAx86skkAMRVuqL4=;
 b=cXEhNBCIz12dROFee3pr/NrAq/A1prIaIl5Doq7/M0ksrdkvLwinrfh2
 G+CQZO3uUK2EUNDvbWReDSL3lO0uFzSKX8IG5xy0QI6ngmJuxsivwyMzH
 rmZsgznxhO87cGTqc/EzEuZocg4nArJdRijVA83SDOiPVj9yldlnQ3MAi
 gQkxqWp9P34hSZ/avkcyccduES72roFtGRBuZec+yMgvygHiRoIS5GFPD
 LGzOZQlX0/eQJTZokyDCjyb/FNKH0jdHM54AlzJk4AxnoqCv46CDmxeMP
 4j0ab1QJyzNr6XSYlXBWHn7Gy/5jXpZkxDcRgUKCsyBu08M1tso0B93hZ g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984906"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:00 +0800
IronPort-SDR: LJts1lcM4dJiGTxbiZCv6QWvyPk0GW+X4vjvzZMKve6bI64o7Im9z2jgdw+7NC3wmFl03aOLik
 w+MRtkccbsN4wT2BhCeRHq9ee5y4Wz5vulC4gG4RFol0ave5ulXhDd8OL+euXe+D+WarJOB+42
 ykI58yDS3gKeTq//ujsYAbNJ3J6uA6tRP+c76aKWvzykybukTaLwSI8hTuaJrPWYCFq3Uwla9I
 xybLqV+JVxzjJq9cx0ZcZxj8S5LXTW2YYhBX3OAE7YHgzwpD9G/Sqk7Eqlb1yg7AEkMa97/kvu
 HTOOgbwRGk6qudCozXqpPWDG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:49 -0800
IronPort-SDR: tYVPpWPPsXKkl0Rqpk9U0cVrnCGOzoF/Dia5w7Y3c+A68h2OzFX2SVrtLq+joGL+d1xfrCyzsS
 qePxu5ilELtKFgKZKO5rAjNsd+CHccVpi+refE6ONxQC/qdjs7/I8kxySdwHrqeFoT662xCmBM
 9ti6Gbwouz9DzI7wolfA0nolc+8W06jPeP7u7tmYstY0OXkUHH1R7tuikRfCkUELSaVfoaymzf
 YTf9+zpptQOhyLDpyYy8qx6WPOLnQWGx4qaW02b7bL/NkCLDtRW/LmMqM91yvd+dZRqhQ4TAUG
 qsI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Nw6VbRz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:00 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621120; x=1644213121; bh=GccwERZd4w732c5u0G
 wMOuI+54qAAx86skkAMRVuqL4=; b=IC2qkQhlE4j5c4e0Wc6bwdPy5yATKcYoLJ
 +a3OQgCSHp80f0AFrwFQTP6iVspuT4TRIqgknb66cBoxqrzmgD/hwZU7OJTXzb/R
 aPcQ+aOnyKNtPMQoCLMrzOpvjSNJNQQzAfeFP6kZBqDE1YXnfnb4IT5/xYHLYEmA
 tsk/cX72rSgW/7O5n7HB+a61OjIfzS5jpYHWQQv93XriRaQ5qQkrXcsrR2A0GLPo
 i9a8f+WF4E8wl6sX0X2FI61O2gLB9JQX8lQ+Z1NJA0tytL53gYCJ1OZuHzwdC+Yb
 L5h6v7jEAXxbculSQBsNM222414GQURYECzLOLls2aD5cWJvmt7A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wT4QMlWRoFrl for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:00 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Ns6DK9z1VSkV;
 Fri,  7 Jan 2022 21:51:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/37] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 function for widening fp insns
Date: Sat,  8 Jan 2022 15:50:24 +1000
Message-Id: <20220108055048.3512645-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

Vector widening floating-point instructions should use
require_scale_rvf() instead of require_rvf() to check whether RVF/RVD is
enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220105022247.21131-2-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 5e3f7fdb77..8d92243f2b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2254,7 +2254,8 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
 static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2292,7 +2293,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
 static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
@@ -2321,7 +2323,8 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2359,7 +2362,8 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
 static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
--=20
2.31.1


