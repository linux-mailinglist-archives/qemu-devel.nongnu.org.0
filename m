Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A505B495C80
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:04:26 +0100 (CET)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApqL-0004jr-CE
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:04:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1C-0000Dn-Tg
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:34 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn18-0004AK-NY
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745002; x=1674281002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fm47EllRl2wXvlxAZ/r1Y8qu9vascqutym+Rvh5sLy8=;
 b=mJataqURzNTK6Tk60YE5JOgRbRekbJTi4jPVsdV83EX+RuJDm9jfZBxB
 FQFjHrBhHN1hHCAorXElrBTS57M/gJeyH0emQ8IDxHL4JhXknW+84KeFW
 PDrKuwATV466t7OkOUCQDwQ6cH0z2FK0DqPJ+aL5SEbPD2iTmPyOc2zZo
 9KIer8fHdMXxTrCz+S5FgzQd51Z/lqrzoAHvty3nHeECCGwx49SqY2rlI
 qWZXJU9DzZcDq0vO46y9wVQd25FL7LB5buCgpgpzoWVLVwcKE4r0SAOPM
 V9cNeUj4s05M9zkwC24tbnortTuYXARj3TAIzU0T5hqQXdkJz9nx54tZ+ w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083151"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:28 +0800
IronPort-SDR: RqKLKK1on/H/4pMKYO7eXd75SMvXf7NWrpHksqm48QDxMtlGXbASzC5bOd31q8aFOh7TyH/XXg
 Ugf/jP5Ei+jBbi57Ay+Tq2YpeMiqRssSnSMRIrY56RbZlnx0L8WElJy/EFPE+Bd4bWNFYr3gdc
 QiY+/ev/OJlsJkRu2jzp7R1gd5qQt7SDTrZFgepU4qC7zZBlSbro0x4rfbg38s+E8nHB2Cw/k9
 /uVf5EfdjPQB2cvdTr10TfOxUGG+Gy5VzifaanyGgIAQb8spE743xN2NOQlvG0XEu8FT4qMSyU
 g//UFUaMvrgtDxsBBzSltqQA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:55 -0800
IronPort-SDR: q6dcgaoiGFN4+MMg9XjtuNkI7CHDFV4BGzN45w5GXqhbQvLpV2W31XbXw/2CudnhnvbbmXuehV
 NM9G8GhdvATTkY89+1js2arYKqzo9eykdxDHeQ/Y3BL3kTRX8HxPCYNWhQGk8gtXY1VmK3rEml
 u26S9ATtRKcuWXiXqOsuCI/eKPEwK1eRbfWXN9UivqZPVrM4Jw3V2UcTSTw3ZQLy9w1e4o+5zE
 fzHMspbfLaPu1jTuk3Fd8gMDH0hm+DhfovFJB3xtcI74p5dNIGSq7cXhwOCh/hOEsZZs7Lys6J
 iMc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80z74Stz1SVp4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744947; x=1645336948; bh=Fm47EllRl2wXvlxAZ/
 r1Y8qu9vascqutym+Rvh5sLy8=; b=BlR1NTW/mGILsttZNvRRqvLvIS7jgr0g1l
 /v1JNCTiJQUe214qffFhYm9LiiCY9XO4PGqet6hYwrfoz5nqDG+xtlBA2DUPtrLg
 L6pU9ossbQMW0WycUrxcJx9QMdxMvZ+H7e2/X7wowU6Lvkx6ih7m7Ipns9Qpae9U
 sfp8ojgb+d8+5ptxU/UEHzbdHbmZ2d0FBnxfMagQnf8nAHmCfcp31XDg/G3bLvGi
 DBguXV2hPeR6B5fpPXFYBSWrEL0amQPOrTCVQLUuLBoNRrcL2BoxfKwVm32b3cO9
 VwjL2HVgJBqJR1dEOcSVazNcGeX7qTWTCRpuBzcJt0kShJ2wQCSw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id d_NdNhMpa5V3 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:27 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80w3NWzz1RvlN;
 Thu, 20 Jan 2022 22:02:23 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 54/61] target/riscv: Adjust vsetvl according to XLEN
Date: Fri, 21 Jan 2022 15:58:23 +1000
Message-Id: <20220121055830.3164408-55-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-17-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           | 5 +++++
 target/riscv/vector_helper.c | 7 +++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6c740b92c1..fe58ccaeae 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -491,6 +491,11 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVStat=
e *env)
 }
 #endif
=20
+static inline int riscv_cpu_xlen(CPURISCVState *env)
+{
+    return 16 << env->xl;
+}
+
 /*
  * Encode LMUL to lmul as follows:
  *     LMUL    vlmul    lmul
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a9484c22ea..8b7c9ec890 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -36,8 +36,11 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target=
_ulong s1,
     uint64_t lmul =3D FIELD_EX64(s2, VTYPE, VLMUL);
     uint16_t sew =3D 8 << FIELD_EX64(s2, VTYPE, VSEW);
     uint8_t ediv =3D FIELD_EX64(s2, VTYPE, VEDIV);
-    bool vill =3D FIELD_EX64(s2, VTYPE, VILL);
-    target_ulong reserved =3D FIELD_EX64(s2, VTYPE, RESERVED);
+    int xlen =3D riscv_cpu_xlen(env);
+    bool vill =3D (s2 >> (xlen - 1)) & 0x1;
+    target_ulong reserved =3D s2 &
+                            MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
+                                            xlen - 1 - R_VTYPE_RESERVED_=
SHIFT);
=20
     if (lmul & 4) {
         /* Fractional LMUL. */
--=20
2.31.1


