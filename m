Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0C143F7EB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:39:34 +0200 (CEST)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMU9-0000U4-Mj
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7q-0007J2-1i
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:30 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7n-000324-JQ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491787; x=1667027787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zU+sj6NFlQUl6HOIHmCvm2iECb2iwTMpL+G5qxObmOU=;
 b=MU9ShQnEAMZ+6cFS/jxhHjX4YUa7DBZZVftFNpUMt2bDeb7qFFEXGIiN
 xOvDkivbPpbEdE6ORCqBdPaG5LKYpYiOP4PPwaZrpTnz9WCMMLI39CF/Q
 OtsiyIskfEASRYNqQuxM/jNlkYH4zSPS5ks9VrO/WIgMa8d3kULIZKdoy
 ycHKvzxRHoRFXVqlo82r8dZDxgyF4PcdApOm8bqXR4b9R7NbBzFZLjsyO
 ruyEeNq2cKDlNvLBGJ0Run0pa3aQyh3htwP2A9u4u/p4WGaRHYVab2bXp
 FjYoZ6uFdRzI06pTH0AGSHedoWHtRH9HDilz3xGROlNexDmq46QJjXuXd g==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="183154019"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:16:26 +0800
IronPort-SDR: Riq8J+ea5Fi8iLFJeW3pIATHt7/8y0l0TaiYqE39JVAwEP+jGe/V8wyRjPOc9OI9XE87BcEzuC
 vx0dh5i8+IrGFsIY9lxH7GLi5xJFOluwKaOA4gjtyrGskFvXbNPobTkbnNn+8LqD2a1G0hLpuz
 /xq1v5J+TDT+h+r4vzOFz+b5p2OUnXXAK4bsxMimYCbRwIGB97v0A4q2Jts5ljPjUhr6FHSeMC
 LJwLmoe8ibRTtDS8Yas4UFpjYiZyIR87iD4zTYECLYVaP/6jNbFya0SaV+PC91eao9zuOzrI6X
 LrnCUG2H5F1hMBA4MgaUnb/e
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:51:53 -0700
IronPort-SDR: K4EslrYkU/9WjehlE8nmagg3/vkivP1CxYQeM0BabCcwb6B7PRb+hqjgM8+kdGXs1W08yFthqr
 82LQj1eC0vM+CdS780GqHuRJ6SjZUfwuC2KBpsyQXeuEfoUNws7MDRyv05eQF79lmHUpXu6tW6
 +OX9NpdgGPg8MAnUPElpAdJULvgus6qghjatdnXD6kT+VHK4PB+CefJOshTEr7P4tRVD96ujMc
 92/Mwf98+l+IPfKo4d3KN8uyCt+DbG1Tz0fCqxh6edqbZS/fGJh1M5yXp1KRZJySUNfjf492LD
 jaY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:16:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYd504k4z1RtVn
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:16:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491784; x=1638083785; bh=zU+sj6NFlQUl6HOIHm
 Cvm2iECb2iwTMpL+G5qxObmOU=; b=OJSge9lUS3ut8MLc+yT6lTjUXUOhEdP4kX
 RhziN73dkazpQEf+oLm4h23nE4Vg9G1xubRJxFcnOycQf36Nu1YCzwqrDe+TJo9Q
 DvNKEZxB+KMk2N+G9PpfjIZB6hAm8PsdVsRznSzzirsvqK6V+GPw+dXaEkhkbBs6
 OkIe665gt/ElWmuMUoDKB2axVXRun5t5tdn6yQYGDJME2F+Cmro5e0lCK1hp2jt1
 wzpIK1JOafvdk+PBZUmST/Q+rjmXU4KgA1SbvnWVsmqMlXQYtREC4kndT35BQs4V
 SWoYO7qZZ3XkaYT3D81EUG18JukWkFPUVZjIBoDoHIXgiSOD7K4A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eMJYpvImaYTw for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:16:24 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYcw67X7z1RtVl;
 Fri, 29 Oct 2021 00:16:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 18/18] target/riscv: change the api for RVF/RVD fmin/fmax
Date: Fri, 29 Oct 2021 17:08:17 +1000
Message-Id: <20211029070817.100529-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

The sNaN propagation behavior has been changed since cd20cee7 in
https://github.com/riscv/riscv-isa-manual.

In Priv spec v1.10, RVF is v2.0. fmin.s and fmax.s are implemented with
IEEE 754-2008 minNum and maxNum operations.

In Priv spec v1.11, RVF is v2.2. fmin.s and fmax.s are amended to
implement IEEE 754-2019 minimumNumber and maximumNumber operations.

Therefore, to prevent the risk of having too many version variables.
Instead of introducing an extra *fext_ver* variable, we tie RVF version
to Priv version. Though it's not completely accurate but is close enough.

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211021160847.2748577-3-frank.chang@sifive.com>
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


