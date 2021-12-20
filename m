Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A8F47A491
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:29:36 +0100 (CET)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBEt-0007T3-3U
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:29:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkp-0000Bl-Dc
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:31 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkn-00086v-OO
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976309; x=1671512309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sN0n9NWP/8kia9791rAn4EaDBIz30hbStjmbIzn0qnc=;
 b=Pwik9vkAA5AG0z4JSuq6IWVoOhgCBBrXaxeqL/xxSPdzT5PSE5i82Ctm
 qv3GJJcv5ToyYUdNMk1S3FIdkQtIAOVM9iZNJY3HZ96kXTSJwGVHglCFA
 akOq8f/WnrOFWe9B7SjKRHJrrQDjDSXcv86TKPVRgKPubv9ejTJkniV28
 h7qKuhwnmHPwTEgHK5F33FOP7g3uPjWf2JcRmXf/RerbNYsk8PNrrnhWY
 SirVRib6R0/EAQx2024wMexdig9yI1L01eql+4F8khrgiX3FKtzCvhulb
 no+VIrsQpTyTn1w8TWDyHpkgUOgTG88/nUkEO0FZci/kCRoF4rR13p7vW g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661920"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:26 +0800
IronPort-SDR: 5U8AZkCJzrOUrSlWzOxP4/UXWjHhx+nAvVBHEJrmQOAMdGnJuEBosjtNOcMhp8PVmDcttzrZVY
 WCuvdcOUS2s2KnLBZGjuM9EcG35tpCcE2A9EdF4na7VREyvIClZcNwVAWCc7UqHJNZ/AY51exq
 o8rFD37MdRsaXC00mcIoe7jU2OUKgBufjUNAzJpOv26nG6ujxAuYgCIxfAi/sSxwl+b30RNtEP
 bYzkXO0TwXTujeu/GmH1jQ9VyGXc0hsYWhJ+ZGFGAy3Upw4lTFnskOVM6bPwB0qMNgtmPCpajl
 MXyNpfLjKj4g5gfZJgnLITJU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:15 -0800
IronPort-SDR: WDSVwM02Hdtqb890WzRL9iJbKl+zY+v8XGL3H0hIYQ+HfA1COlgEiuWTUyzFtjYnoddN+wOiCG
 g7Q7ZACisuSBcvH9Swem2wQRJfuGWop+JAw6U15D29OFw8bzMZBOn5EsDjgpPmOAU2/4h9RfVf
 Xk8mA1MTg2F5NdSES/DVLzlAXk0iEeJw4UeycFDAapva8eAClqrZJ7c4uhjvNE+TrG/4VvP8hV
 5hFKghs3pV/MEGAO2sHIEoGfp+XqhlCSqK6xlq0cvu3u/waatkBDWYSNf0SvvD036+C1ZXoF9Z
 Eu0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5t1bSHz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976305; x=1642568306; bh=sN0n9NWP/8kia9791r
 An4EaDBIz30hbStjmbIzn0qnc=; b=BD4hY0/MgusEQpfalNkcQbn/Sxqnc3e68Y
 Y8NulY73W0axrndM6mlKGhnR0w2aSno2sZXwvsdGDjWZi20vk4J3lIipPzXfPm5M
 mEguTqIASNoie1MLbstdvsVLJXm5xPKAXwoaoUJbJgxqPBkLeMTXtWrLItTUxIyU
 +vXw3ncbjPcAFmzOBpSufLrfqxaKOHU/KpdWnpHHP0z09AeYJ3QlFQI7mRu370TU
 X7X8XF9l0s00y3yTURxblk/zRmeEjuhlX2TlTiFmsh9DgZjKWr78yOZsD1hAYuhi
 NLXxO5YZxP9hmoPQ/LI7jz/CbcRe6eA9TU1PELaBzJ/t5j6OR2hA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wxH8OaVeRqiK for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:25 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5p5STBz1RvTg;
 Sun, 19 Dec 2021 20:58:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/88] target/riscv: rvv-1.0: remove rvv related codes from
 fcsr registers
Date: Mon, 20 Dec 2021 14:55:53 +1000
Message-Id: <20211220045705.62174-17-alistair.francis@opensource.wdc.com>
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

* Remove VXRM and VXSAT fields from FCSR register as they are only
  presented in VCSR register.
* Remove RVV loose check in fs() predicate function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-9-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bc149add6c..c522260986 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -38,10 +38,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations=
 *ops)
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    /* loose check condition for fcsr in vector extension */
-    if ((csrno =3D=3D CSR_FCSR) && (env->misa_ext & RVV)) {
-        return RISCV_EXCP_NONE;
-    }
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -261,10 +257,6 @@ static RISCVException read_fcsr(CPURISCVState *env, =
int csrno,
 {
     *val =3D (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
         | (env->frm << FSR_RD_SHIFT);
-    if (vs(env, csrno) >=3D 0) {
-        *val |=3D (env->vxrm << FSR_VXRM_SHIFT)
-                | (env->vxsat << FSR_VXSAT_SHIFT);
-    }
     return RISCV_EXCP_NONE;
 }
=20
@@ -273,13 +265,8 @@ static RISCVException write_fcsr(CPURISCVState *env,=
 int csrno,
 {
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |=3D MSTATUS_FS;
-    env->mstatus |=3D MSTATUS_VS;
 #endif
     env->frm =3D (val & FSR_RD) >> FSR_RD_SHIFT;
-    if (vs(env, csrno) >=3D 0) {
-        env->vxrm =3D (val & FSR_VXRM) >> FSR_VXRM_SHIFT;
-        env->vxsat =3D (val & FSR_VXSAT) >> FSR_VXSAT_SHIFT;
-    }
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
     return RISCV_EXCP_NONE;
 }
--=20
2.31.1


