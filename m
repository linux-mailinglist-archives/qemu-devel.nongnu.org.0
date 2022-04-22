Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8D50ACEF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:47:26 +0200 (CEST)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhSH-00056u-7R
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJH-0007H4-Ps
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:07 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJG-0005Ug-2A
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587885; x=1682123885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0bcwNN6HlsL1bsaGzbPna1G2EFlJ2LfVwXnwKyKZhQ=;
 b=MR5lAz/HvlZkSa90q9/rw3i9WL5rzsYkk+xO+BYzI7YoI+HkY7oPfjnR
 NXpvuQAYMhIMNHze08AZkHsPx1E7l3iVV80DwIM621HjLU1bvo1wjY4Ut
 AxgJTZA7HSdbigDE60wmGspHF52e2qGlzJSNljvUEPe7J3NTMt6n0XBr+
 vrRqoDfj7mUIqZikJd9YKBvInLwbJWPPQaz6xv0uhtA+1g7+rRl9eaWOI
 P2tuVxdNS7njtVt6WyO7rZdoQIbCCmWk9RjISvmJhIQII1z8gPGsbpZTf
 3dnk4gDNiQl1IUT7imV5iO/SkFAFaVcJ7yeFDAoKXxrWJm3Kcq3R5ETeg g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483397"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:04 +0800
IronPort-SDR: 89YEP/40PR/CHKwYLD7G5naoPPlzHU/W4FyB6+ZculCkgnLA16jAuDkprmLZoJ9p7FR+q/ATTo
 cGqhPea6/juoB7Q8rV4XRuVy17sOyRl+LVUqxlOTYZZs0DFiQGuqhFkqB6Go2li3BTyCBrrv7y
 EoMeuIKDqgDGhTLPA14wex+Xr1vActuQn1k8twA4W909XZ4G7eo/v928OUUZhZT4JXbUKajupP
 ZApAnVWaNcqsivAHCq5+Ta09hY7Ac0pfk+JmYKSC3eftNehNJUz5F6EIcUKNeCNMTaP3iKyfqR
 KoUD0rG/SgPEaFmbpmO2vA7h
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:21 -0700
IronPort-SDR: elaMmKUC28A0lXX37zFdfI53MHuf4NumP5bdNmbEcOrU5wWglhnxNMTuVvgR0r5nfVJb3Yz9HY
 TmbuRBkauO7STcYa/hwYMJBXLzxN8CDZkyMgxypzq/oetmgNgLM0ASpweBTtOuapQnUFHNgRpZ
 l4ux5dOw/S46O/7LyO3JStEilYuujiovhZvICDIdOSBQIaUdQtX+sEpvbz0VMgt2VUUDEKm3RG
 JH0Ubshdckvfd//d9g3IcJlu2qQHEyk8+2Nj3r5mqqlH1EUoEErApMmUanu9zsNMrwDIEpRT+4
 K0Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVh2WBFz1SVp0
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587883; x=1653179884; bh=Z0bcwNN6HlsL1bsaGz
 bPna1G2EFlJ2LfVwXnwKyKZhQ=; b=NRGGZMEo1XwPNLZn4bQDYKncjbQYAgmIDb
 i/Ib7fNptGctTpf3P2zfVW95X1exVM3nDZvzs9ReioqUvuoGKDvksw1Vax0wMA84
 +V6e8gNieI0GMoBdf4bzXem/M84IwutyiDYRUWferh5Aj+bijUCIxsvpxhofNQZi
 Tmc1QI3opbp/QHAl9q56mCkra89jlNZ9mWby9FzD5se7dwGb6XTsj9/otVOylXDj
 mqINJJ0xpGeqrBXckeeFuirjswvBcj95Uje/AWhPORgTf3fV+wGC7MzWXsc9U/Ug
 oxNdEqMFynlvpK5z9sTaGMWKoPmKtK/SuwaOP3y8yka1W3MBAvTQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xDfj3mamIsRy for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:03 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVd4PhNz1Rwrw;
 Thu, 21 Apr 2022 17:38:01 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 16/31] target/riscv: fix start byte for vmv<nf>r.v when
 vstart != 0
Date: Fri, 22 Apr 2022 10:36:41 +1000
Message-Id: <20220422003656.1648121-17-alistair.francis@opensource.wdc.com>
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

The spec for vmv<nf>r.v says: 'the instructions operate as if EEW=3DSEW,
EMUL =3D NREG, effective length evl=3D EMUL * VLEN/SEW.'

So the start byte for vstart !=3D 0 should take sew into account

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220330021316.18223-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 99f3134aa0..576b14e5a3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4890,13 +4890,15 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H=
8)
 /* Vector Whole Register Move */
 void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t de=
sc)
 {
-    /* EEW =3D 8 */
+    /* EEW =3D SEW */
     uint32_t maxsz =3D simd_maxsz(desc);
-    uint32_t i =3D env->vstart;
+    uint32_t sewb =3D 1 << FIELD_EX64(env->vtype, VTYPE, VSEW);
+    uint32_t startb =3D env->vstart * sewb;
+    uint32_t i =3D startb;
=20
     memcpy((uint8_t *)vd + H1(i),
            (uint8_t *)vs2 + H1(i),
-           maxsz - env->vstart);
+           maxsz - startb);
=20
     env->vstart =3D 0;
 }
--=20
2.35.1


