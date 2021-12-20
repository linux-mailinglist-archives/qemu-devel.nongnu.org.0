Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E247A490
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:29:28 +0100 (CET)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBEl-0007B6-Nr
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkw-0000NX-DM
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:38 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAku-00086v-Hr
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976316; x=1671512316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9omsRc3kQ/f3l32qfSbwNIAjwccD6RsIuv0w3YZF3U=;
 b=a7brOqXiLDXOEvLrvaW+b1Y2LivTmahguR+FrbAfLaBpCEWKkuFD77mM
 D800PMFAf+WNJwQ8OzWkB/HqMRRktj/QBnFrIWbXxzfTKjlQfyhST/PAq
 wp5DI8Tr9AE8WOGAavkokqeepj9CZ77/XvmPl5SGWKuMEwOXgl2KAZ91l
 uhcE7Iz5uq3CAgpVer6CZ925/SJwGqKsm9+eY7MMvgsujuoDIOn5cwZzf
 6xgujH8QbpgSyF72YvhmNapAARVuEnrUPVFvCqv/rv0oXa1M6smHviK4r
 qlCQnFW2F3Foi5uVK8TlwkruY2yFZFHf+SUK7vah3Metc1UccvX4gC2bx g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661930"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:35 +0800
IronPort-SDR: 1ECs2IPiAgg5bzWO9TIfD689F1dtuJGe4Jifd/h4TvZiorN3yIltZkR3Leh4zDuSI9GlGsFg/Q
 Wlm/hnoB85Rd/eN6HUhHKpVCG3LnGZU6tjy6abt75jq358B7Yrj4NurAvEjqauiT95hWHcvnYb
 Z/7bcg+6BT2wbQI3DzqB2UGSSCAt4anPwMoVhR9MMt0DM9MEHx8amAhS0bqFCto6uh4mjsddUy
 Pv364gLOBDxMz/wChEFhq6alSQ/STxTn+BeDPXo1wQDJgUvyaGvd05aUE9cwXawdnlsXaQd8Wp
 yyWPiW7LKIHZwxyfb6YCk1VB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:24 -0800
IronPort-SDR: 1/tZpehRsGoB5bewmR4pdkRRFiV9ORhStuyJwmqohxnyLlJoKTOfhG6OhueIalDFrR3c2mKNkb
 E8qp7HBZFqTIVs/EvEiEufZcy4PnLfPPvR9cHTGU0wPCFTPysVnNr54EM69n1e8DUDMOg7DNWJ
 Ze/WFV/NARUhPZo/OtpfxcvPsvttd4aQbqOhEhpG/9hU4btchkm6D49KM+phD9vCwDw9c3iJt4
 u/Q7kIESROPfyh6pMW/E+UIJdaCwFZtufSJm+Z0O81I3960/NmTHMkhmjkvQmDcOTtsm6N8gmk
 emo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS630ZBBz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976314; x=1642568315; bh=z9omsRc3kQ/f3l32qf
 SbwNIAjwccD6RsIuv0w3YZF3U=; b=jsshxU7jQ0STE9F9IbJjZHpCTuH/tEPTN3
 K+yAVXXwK21VeqxaRioPjATQLV2bupxUmjcmJyb7DsHb+XKqAkcmdV0p9oQJiWmx
 AF3ls3E5+cfvgM0IJTUqobbnpW5E2ohxCYqXUNVKyuriNVBAeL0dJBkOR3xJDla3
 HI+QH3aaVjRffL6VArIjhf32hh/H3tkiXt30LYmPgWcp1BUqvJP8QaZFAuNjN8iy
 u/ulEVgpASNP7Q/HQpMLJGRFxtA8KAi4yaNk82GNOnDuto8NXh50NAhtZJPmCx63
 3RhmymWBzeLNYFiuAtYvfhXZUnJuc6FVGf7DeiFT4tWKkvc7auOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id g9OvKnQRT5yw for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:34 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5y6qLQz1RvTg;
 Sun, 19 Dec 2021 20:58:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/88] target/riscv: rvv-1.0: add vlenb register
Date: Mon, 20 Dec 2021 14:55:55 +1000
Message-Id: <20211220045705.62174-19-alistair.francis@opensource.wdc.com>
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

From: Greentime Hu <greentime.hu@sifive.com>

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-11-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8dc6aa62c6..1e31f4d35f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -63,6 +63,7 @@
 #define CSR_VCSR            0x00f
 #define CSR_VL              0xc20
 #define CSR_VTYPE           0xc21
+#define CSR_VLENB           0xc22
=20
 /* VCSR fields */
 #define VCSR_VXSAT_SHIFT    0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 832ccdcf33..5d1eec1ea0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -285,6 +285,12 @@ static RISCVException read_vl(CPURISCVState *env, in=
t csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val =3D env_archcpu(env)->cfg.vlen >> 3;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_vxrm(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1835,6 +1841,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_VCSR]     =3D { "vcsr",     vs,     read_vcsr,    write_vcsr   =
},
     [CSR_VL]       =3D { "vl",       vs,     read_vl                    =
},
     [CSR_VTYPE]    =3D { "vtype",    vs,     read_vtype                 =
},
+    [CSR_VLENB]    =3D { "vlenb",    vs,     read_vlenb                 =
},
     /* User Timers and Counters */
     [CSR_CYCLE]    =3D { "cycle",    ctr,    read_instret  },
     [CSR_INSTRET]  =3D { "instret",  ctr,    read_instret  },
--=20
2.31.1


