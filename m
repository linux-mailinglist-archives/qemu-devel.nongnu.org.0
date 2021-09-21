Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF4412F1D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:11:24 +0200 (CEST)
Received: from localhost ([::1]:48968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZw3-0006Ox-3v
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhW-0000tN-KO
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:22 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:30819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhU-000589-Sp
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207380; x=1663743380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lSMQwbKRLR8OHi30bRKwHm7mIkz1GUbYOiyB4Zccdlc=;
 b=hIz5Wee8cr2kRnhsDXWYwOMATrQrvh2gC1f2ly9iziIEhwuLbc/S6fCR
 I+QQJeCZ53H/DGFWBK2y0wZmPd3pMTnxlZx8wK4cQPuY9bPZHLSznC9+w
 s+hH+7+qmbnWPIhQsVkvVcAOTCG+pWiPg+DKlKwNfMxNK5wAi+UvebKZ/
 JWmH7+hVRlkWIevsnj8ArbKl8ckpv8W42G1KatFwff/GPO25uqjGlgehV
 aTNVIrVmjuI8YBH1DpYfEuYUdQoe2xZVzW+gNOA5OnJHlLWLMYPpfUXqv
 wNnRI0YXS3ukWDFE5CNoL/VIsgU2uCGM0Mg5LoMcqtgc6xeNEzOsu3ef3 Q==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="185304974"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:56:19 +0800
IronPort-SDR: zjnsVzi5BN8o1TAb2euMERgspUpEmSx02HTnysxeLnnDJDwU7AWM+c9CenNyknku2RDf5TWeGs
 HtgP0qftvq1Y76GwOjWsZ8q53Q97Awph+R6mwsfgKL02KgW/hFP98Yb7Qj9BFAnVIs8kR7qB0S
 zfYLAcLFGHCT2YNGLtuxXj8QqhtHWTaFjCrOpaqOltWEUTDpSrmuee4imem+r4yhibdygLwLdP
 QifPgN+YXHsl8n4mcmjaeE7qODSJ4zKXWZJpomEraRR1UmxlbBgriupOGfhmM4NnjUhb45uJPL
 dabxlTBLPVR8+CcE7A3+zETc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:01 -0700
IronPort-SDR: PsI9xi7KDRku2WHJrZdT39Bi3e8mCQcez9/32MHGdlUDScp1DQnaeT99Gd5tIQyZjTCMQ+1dXC
 bVvvKNNAdHXDxia5rsDZfVVcHwtmSwZ+R80Y2DuxQil3JbjnWQElePqSsYhxyKPrTOx+cOMOhv
 wFPdZY9t9tAJeO49wrC8bo3Qnk6M/dXCAawCS1hkAWeh9G7DZxuvtkoCVf9SINSeMo/s0gtvB0
 746lUeHOjIgYm4+hzU1t2SiZHNp8c4vbemxnvHZfdOmGhJcwtPsnvbodp/mciLUBhbhtAjWl8Q
 Vrw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:56:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBzR2lzzz1Rws4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:56:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207378; x=1634799379; bh=lSMQwbKRLR8OHi30bR
 KwHm7mIkz1GUbYOiyB4Zccdlc=; b=hdGuRP5z7iE6+mkgySsHtovgiFRDdHSbOn
 XcRoNZOWY/SgOXJ2IWdBBv1uk/bQUiQujV+8fd6iPbMBDUhtG1oXgHuTDEDsO+Ai
 vHWCXmkO2gDqYeGW8wRayOm8MnWPa+aS3cPJcGwoe2Qb8xBihQnPMXaGNP6eYwhX
 dzBSffK5e+X39+uitcYMYzQchKpLwhbpbLhct5n44i6cAcngw0RGHQmZs6HyOP60
 B3xx4X0RHUM68WtA5EI89jw7qVAZf9Wja2hv6T5ollDcttsJz70/KXrtYT9wuRTT
 Rkhz3DrGju5UJzRnyikQD3tRqGh2suFC19zL99M/0MTRSaCqcOig==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vaaCmrJf9r3P for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:56:18 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBzL4jHvz1RvlH;
 Mon, 20 Sep 2021 23:56:14 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 20/21] target/riscv: csr: Rename HCOUNTEREN_CY and friends
Date: Tue, 21 Sep 2021 16:54:11 +1000
Message-Id: <20210921065412.312381-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng.cn@gmail.com>

The macro name HCOUNTEREN_CY suggests it is for CSR HCOUNTEREN, but
in fact it applies to M-mode and S-mode CSR too. Rename these macros
to have the COUNTEREN_ prefix.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210915084601.24304-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  8 ++++----
 target/riscv/csr.c      | 24 ++++++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ce9dcc030c..999187a9ee 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -397,10 +397,10 @@
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
=20
-#define HCOUNTEREN_CY        (1 << 0)
-#define HCOUNTEREN_TM        (1 << 1)
-#define HCOUNTEREN_IR        (1 << 2)
-#define HCOUNTEREN_HPM3      (1 << 3)
+#define COUNTEREN_CY         (1 << 0)
+#define COUNTEREN_TM         (1 << 1)
+#define COUNTEREN_IR         (1 << 2)
+#define COUNTEREN_HPM3       (1 << 3)
=20
 /* Privilege modes */
 #define PRV_U 0
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ba9818f6a5..23fbbd3216 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -71,20 +71,20 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-            if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
-                get_field(env->mcounteren, HCOUNTEREN_CY)) {
+            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
+                get_field(env->mcounteren, COUNTEREN_CY)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_TIME:
-            if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
-                get_field(env->mcounteren, HCOUNTEREN_TM)) {
+            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
+                get_field(env->mcounteren, COUNTEREN_TM)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
         case CSR_INSTRET:
-            if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
-                get_field(env->mcounteren, HCOUNTEREN_IR)) {
+            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
+                get_field(env->mcounteren, COUNTEREN_IR)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -98,20 +98,20 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
         if (riscv_cpu_is_32bit(env)) {
             switch (csrno) {
             case CSR_CYCLEH:
-                if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
-                    get_field(env->mcounteren, HCOUNTEREN_CY)) {
+                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
+                    get_field(env->mcounteren, COUNTEREN_CY)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_TIMEH:
-                if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
-                    get_field(env->mcounteren, HCOUNTEREN_TM)) {
+                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
+                    get_field(env->mcounteren, COUNTEREN_TM)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
             case CSR_INSTRETH:
-                if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
-                    get_field(env->mcounteren, HCOUNTEREN_IR)) {
+                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
+                    get_field(env->mcounteren, COUNTEREN_IR)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
--=20
2.31.1


