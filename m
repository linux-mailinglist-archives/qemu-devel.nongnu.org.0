Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770F43DA98
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:55:13 +0200 (CEST)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxRY-00058H-Gf
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHx-0000xz-F9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:17 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:42396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHv-0005CM-6h
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396313; x=1666932313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bqz2jkcGkqug32R6T6pWv96TjmImip+gfc3yBS0PtSc=;
 b=QtPP53W5JmQCFX+4H76WEY8b1EDWD3iWVG48VsmjHIkIj9yxrK8UYbRH
 jqOOYYqJ4TzX7hgQ3xLOipGGOX7k9V0wgdIurQ/fmbt3EA7QpePWueGw0
 +c1QlLEpEzO0vae0VWjWCNE4adD++pEZnQ54iiQmp2eNLrvakC8kXlJem
 yQgff5GTzWGcVaqB980zlDDXckvOFSkMXOw0PSe0IFZ465psVel+riTMJ
 /iB4p+sJIrwKKofYU5e/9b1v+teqZGBW558jJn6HGdflA/U8THdKip2WV
 T/u6/slvlaYz9m9uvDI9KyCC8IXJ0mHGQWAaYPHT/sexVL6mUsijfxmw7 w==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="188815819"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:45:13 +0800
IronPort-SDR: dunWZKVXtQgnm0JtdFBsO72SwsmgG2D1SWovC4d7wmd+jBsfaPv72zT1Uz+bJELZrVUixFlIYL
 y4H1DDeljVoIkuHcN4gLXlBeI4+HomhL4YGluapNFhOhwpWTLGfTkFZo70qb58RkcJRQQISnT3
 CBtPx9Iq5qKDP9VaTxnfKRH/llo3UTZG5c14lGjVmkleeBhAnVf7nWW8xaI8FlKMU7FM3G94/W
 8Koe0xUAx905ZZRbJLnsQSbt8mgy6/KKhTKv6MUjTtVKcaHELJDe+NqMHsGnfdrLBw9mE4fQsM
 QNzXbDtkoYzq9ci6Zn2BESkh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:19:09 -0700
IronPort-SDR: fJOjZUEj97TjBiTpKLwmNhp3gSH3nIRjeKM7XukLUMhRfuka/v7NLF8VyqphCWFrIZyBOKpqMF
 PF/N/EIRcQWwPYEMei+jWEoEDTY9Jh7TmF1hVCtWLDWVP4dWNBiLAy8pzze9gCWIGpxL+dxlq8
 GjvbghIqOgQdwXXwSCD65C16ETcgsk0w8aAB4i+EhguDvFANCWMpxJbILXqvNpqCtRGLs3ZfEl
 dA0+gJ4RSzV5wJlKwV4TKbkgfxTSeNtclPfpDEyGmC63JaDwifFKGAwdxOvYRkDNmYAGpOtviV
 3ug=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:45:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftK56T1Pz1RtVn
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:45:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396313; x=1637988314; bh=Bqz2jkcGkqug32R6T6
 pWv96TjmImip+gfc3yBS0PtSc=; b=aMHZEXZDXUXR05XyvdC9UVR7dD8MR4GHQS
 zTpW0SP84plcXN7xcjl9ngbMxHZ6IQJRkYAnvK/MFvt1LYt7hWFgzRY0FF7HXjxi
 eH16LlMdBqHtZyhMTm0bRxJwGRJS1oVrbttx0fORTKMJP21XLldqfureNzSmOm5j
 EhqsLgFZbxdLDJpHX0k7UtHag/4TcBIJR/OX6zSmIrbo6ldNHWoKT5E/4XZlxgvP
 SIK/NFSgfxKBIGzLui2oJgMWa5jO/7u+48vjVdO0YuB5++2Qa4ZW66eG7t/mBX54
 AW8m+Z/bfSvmb7bfUVE64rhTqLiI0JggsvhiGuN4qShVptFtVKoA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id F9pRKx0NQfZT for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:45:13 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftK11W7hz1RtVl;
 Wed, 27 Oct 2021 21:45:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/18] target/riscv: change the api for RVF/RVD fmin/fmax
Date: Thu, 28 Oct 2021 14:43:40 +1000
Message-Id: <20211028044342.3070385-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Chih-Min Chao <chihmin.chao@sifive.com>

The sNaN propagation behavior has been changed since
cd20cee7 in https://github.com/riscv/riscv-isa-manual.

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211016085428.3001501-3-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 8700516a14..d62f470900 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t=
 rs1, uint64_t rs2)
 {
     float32 frs1 =3D check_nanbox_s(rs1);
     float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float32_minnum(frs1, frs2, &env->fp_status) :
+                    float32_minimum_number(frs1, frs2, &env->fp_status))=
;
 }
=20
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 =3D check_nanbox_s(rs1);
     float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float32_maxnum(frs1, frs2, &env->fp_status) :
+                    float32_maximum_number(frs1, frs2, &env->fp_status))=
;
 }
=20
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
@@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t=
 frs1, uint64_t frs2)
=20
 uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_minnum(frs1, frs2, &env->fp_status);
+    return env->priv_ver < PRIV_VERSION_1_11_0 ?
+            float64_minnum(frs1, frs2, &env->fp_status) :
+            float64_minimum_number(frs1, frs2, &env->fp_status);
 }
=20
 uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_maxnum(frs1, frs2, &env->fp_status);
+    return env->priv_ver < PRIV_VERSION_1_11_0 ?
+            float64_maxnum(frs1, frs2, &env->fp_status) :
+            float64_maximum_number(frs1, frs2, &env->fp_status);
 }
=20
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
--=20
2.31.1


