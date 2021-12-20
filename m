Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82C47A4E4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:15:29 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBxI-0000gQ-AU
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:15:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAo8-0004Sq-Ft
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:01 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAo2-0008Lj-00
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976511; x=1671512511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pMWBorG8cCiC4NLF8pTDQeQCsCb304DB0d//huLQV6E=;
 b=MeENjvTp5e/o05lGxNxQ1OltRQSgOEISkKk2ektm0NmTIdy8qavxreAX
 bDcz5IR6wa62128XyE0eQIsru9/Ax9ZsNdbY+hgLedM2GCSTQpzVZD34D
 xCCsjzSEbjT7ubFaOVU0ADg1H25MJqWUd+qfrYxDlrf7RQwymFCjgKO5m
 K4IWKq0Y5YNnB7uFrMFFZc98vfbNk9Fd3zqtUO7NEBMfIMt2yBaOxFrmI
 7eDobmM3jCOdHKipV7Gi8sfswxMin//A+j/RntPWECf0rx8djO76UTKFq
 ReK1uXOwydFrwcp9Ag1kMCes/RMdncFAWlZQxbmlAalS1NBW18nXJ4pbp g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680178"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:06 +0800
IronPort-SDR: xmdhju7m2ld/okgihVTv2gH3U9h8mf4pPmPDFBNGl8Tqlw0sytaYRSuKK6m2dY49X1VSY99R/u
 DdbmVcQpZKd2CtphwzmEgeMYMYjpD4f9LxxS9k5ElCnEob+HVbKCAAWWhj419rCFd+h6jRFB1y
 jwgj2RmjmbZOqBYm3vGR5puAnJRw5ig2TJj+yzLl5NR7/AIh5Uog4VraYQ4tBD4hKPG9LaR2yJ
 ayjm04emY+mE9CAj4BCjyYISOr8mWLhE75FQv3bOrHzA2jSkJDYKHA6r1ZX1r5hIobPryyr6YA
 wxO3swkkLMmmWiC9PmVZaF0P
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:54 -0800
IronPort-SDR: HKx/cWZpKFQnCWNHPMB+I+TFR0RRJUt0e9V4udGmepIO+f23GIKRo16laV9E0ALaAid/kbegsu
 thcPztgKMLLP7qw7uUNUir05sgGSyJW3Ijc04d2307JvIeTvFugXtgLnDGkxd6LL6E6HMYDy3L
 JJ5Ib8/HKhw1bVflxtg+0ZhJ3me6r4zCboYbtq7wQjxZgE2fTqfEBgFXDGTBRT84SFsCTXhzHJ
 WKFWO6GM3n5AHrEbBLfjokGvlUFsoA92RVCYKTX58BWUY9h0yu66Ud2zdcR6bYNio3A+dXFRFX
 R5Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8w6fLRz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976464; x=1642568465; bh=pMWBorG8cCiC4NLF8p
 TDQeQCsCb304DB0d//huLQV6E=; b=fNlQDS2LbQj6pY3iNgNpB9n5/4F2toRC8N
 ruj3MwOPvIFhEsKg9YwPZFOfSKjoY9JRTaD0FiBrHMogxx6JS3hWKQWiG15WGOPV
 OV7qzOyD6YWwILRCP8l1ilPoL3Vj8PTwVzavPEqYFQcH1kxeoDSOZ7Hi13g/GUlR
 sZsMLEl8q7ZnArQEMgFZl6/0u6jcqfKETNTgdqIbSSoK462fRMdbJER/6LK6LcRX
 Zj2tpnEFYnDtVL7vzRSOCWB3M6gb6PIYd5Bay/vKEJSyN001dwIvpZoBQY72tbLX
 VpfcQucim/Xfm7AN4Q7e5XHrb4sLKVB7oyHWkmwEgNiJKAJBw0Dw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9m7tys0Z79E5 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:04 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8s3nBdz1RtVG;
 Sun, 19 Dec 2021 21:01:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 56/88] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Mon, 20 Dec 2021 14:56:33 +1000
Message-Id: <20211220045705.62174-57-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-49-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 277a5e4120..71d7b1e879 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3710,8 +3710,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
-    uint32_t vlmax =3D vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i =3D 0; i < vl; i++) {                                \
@@ -3723,9 +3721,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
=20
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3738,7 +3733,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D 0; i < vl; i++) {                                      \
@@ -3749,9 +3743,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
=20
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
--=20
2.31.1


