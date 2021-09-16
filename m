Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24040ED1A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:07:05 +0200 (CEST)
Received: from localhost ([::1]:35558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzX6-0000iO-N6
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHU-0007Eu-F2
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHS-0002yi-Hw
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829054; x=1663365054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lSMQwbKRLR8OHi30bRKwHm7mIkz1GUbYOiyB4Zccdlc=;
 b=QNhqbZMfhLoKAoUjOiwHOMOWZv+ICoWeL8cgwL8DrmvVcFDhuBsYadoI
 pdfpG3hYKlF2TdGqIiNydJIP6rR7obKXXwrQIqi/Ya/z1xlLDryvbWJJX
 T9I0YyYgPS7XPaxU39l18/P/x4GZclD6Ic3TyqYO9MyCbi5K+OXIhibhv
 H4YOkNbHrtZxK6Sn8jzDqWekt0VuriyV52e1PQ+9qBBbffNZQqBvaxyBN
 3khtqorqWJ2JM8AT89/2EeFJX5xSC71IehOE00PcWv10EV3HaN0zatUDq
 LwcY3X5zAnHL9FqPlsWyMBa0l72lCHGjwoCDBNjijl6xSu2jkuMWsM5TX g==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="284004773"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:53 +0800
IronPort-SDR: SqOluTY3kXWoXjhYA+/01Xlarav+MebrpnWC3r6pUzhWLPu+6ksxMZisf3H05ydsPh9N17ek9P
 2k6ZobdX9R7/A/DYXDlO70gRlK44fI0kfqC4OBRPnvT6HB+YrpjiL9BBxCAsWaUt85ZQmPxRpk
 CmtzY2iLhH/swQDCq5JJN2u+Oe36pNoRwJq7PHYcNwccnmwdkBcFja1FOsrPaWkl/37wsYx07Q
 Jg29Nt3NgJErGp0KSc0tcQmFxSxviCC0yxq2hCZ9ybcrbCNlBZWIzsEmlp/CMxCX2MvdASpc4W
 hFp0x/ZR/UutXEpy0jmezfSa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:41 -0700
IronPort-SDR: 7jOC9kpIE0kcYr4jp4Ri6oudylx/K6RyF9LEgb+tZCCNc1aXTgV5ZL3l3air8O6EiE+QKJEa6d
 ezL7LcDTuAwu1ykIV5daxtOmNtkZQKaAUfMjVMLfcwih19CDGOsIII5ZHzn6sQCMdBXJZGaiFo
 4Th15b36xcr5Tn/TWXgBu7w9PqlIRpKYAJifyN3ergkGg0VSSIr9tb/s8azpcPeyAhmoTr0JJw
 8b02msqZYov7dBhCKm+e/eZn2DJXovcpNt217jw2lSD2oPECn6OTzTC5cypPdVgkGC3VLwGzf+
 HrE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W3x52CFz1RwsB
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829053; x=1634421054; bh=lSMQwbKRLR8OHi30bR
 KwHm7mIkz1GUbYOiyB4Zccdlc=; b=nY4NHdhNuP377BN1qBmv6DlX3dhtpyjrcj
 7F/ujfDCPSqomZDdvReaC51+dNDojKee0OXYy9npkekp5lPbpsGWkGwyr9tYv5ry
 oAIfZtAsJotdMWhUQs7EiNER1/4B02JI3UAH6jdHzjM6ROZZuqg6UE+sHF3bSWNE
 ocAOzV4H2oKqWKKfYDfZOfaIWNDFQBFNS28kxdvglzuQ667tcrZRJigA9JDSlD0t
 VP4R8prTtactreqQ3UywNYfAcLDvXhCgp50K9U9zyA8alfsP2PBW/ZlCvpdXPc68
 Jb96DtAAWG6oUTMtf5TSF1YFsWhuJbzErqi7ZyIcEyF3aXTVM5aQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id K8cbdb9Hs0Vs for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:53 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W3s5SqDz1Rws0;
 Thu, 16 Sep 2021 14:50:49 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/21] target/riscv: csr: Rename HCOUNTEREN_CY and friends
Date: Fri, 17 Sep 2021 07:49:03 +1000
Message-Id: <20210916214904.734206-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
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


