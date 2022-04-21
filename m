Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B3509912
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:29:56 +0200 (CEST)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRGF-0006QT-Cy
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRk-0005P4-O5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:46 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRg-0007yk-Rs
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523060; x=1682059060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NKi7BnguHKbUSL57AN/Ltful3DUcgnNz6gagWdPlB8c=;
 b=D+TGPnFnnuVKgSHjZk6SSn8GJ211jan/iajTx9bcXJMg2ZSKdb/lfNvl
 GS50oJoptsxtlZtrklgqK24Voewjr8H6WwerlVrAnOXCxc8h2NT8P4GR0
 q3dMW9S9afbPzd7ugWLRS87o6nxQvOrQWCIkoEZXvXOJEk3TYFeAPYPfG
 1wVWXKkwszGhBDJIzk1UhEkDLQ+ehc+KriGHGtY4RWZYCR6P/DUwBvReq
 DdSF5zAilFyYfST3hmIVSrLyU9Mul6PQfyzn5y18VrBUpDh1JEXSxusSj
 DHUzgArAE+OQlx0CNyYQ2PDmDjZj0Jc24AZ6548uPdAXRzSYnLGCFHTBY A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639984"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:30 +0800
IronPort-SDR: ITSBcYToVbzd6Jn8Zhaa4B+zAi0Krf0i/MoV9TfAYwOk78QpxPCB95DFHxTeOo0m7G2SC8wLwh
 MpTQZlDz5+hogTL+MFwMyGLmM3raeXXwxKbXi8AtTJpfvWK9nMDk7um50BnFhucuaqGKx/9W66
 X8LAciLJkno//exYyibe7Jm88EHuXpvDYvkjrCaQxZUmX21CcOtCPr11SaAUzlROCscG5ddL/X
 NfCdLLbToC6pAP2fr+W+foxSqJwRWOscVEc1y7gcYDcg6yGthc9v+Cc0fnWso5qMf2NqYeV1eH
 p62RyLXtPLkvyhHW9ruiXuAt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:32 -0700
IronPort-SDR: IqB5FS7IxVBqU7CCdiig5Yv78E/P/CD991sTl5AmXdFK73pISDXH1RhvkVkp+wh+aotXT7cI2U
 hUnRS6LMP23zxW9cMUBK5N12l/qu2GFvOScNTypiWUQJesvNsY+wS/oqK+buGKtE4QDBOWbCc4
 pckiKz958bE5nPeoyUsfJj8D7y+bSsjVrXRFKQy05OY3o4VnFD2uFbQtrWDgelE7ugENXJbymH
 /4XnHv2O7prUgNZCuT3Fs9F0syIOVKtMSxvRYuQSBELUEpFgOPlYciz3bcsZZ2/b5HllDOkVzc
 1IU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWs6cqDz1SVp0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523049; x=1653115050; bh=NKi7BnguHKbUSL57AN
 /Ltful3DUcgnNz6gagWdPlB8c=; b=uP9p3wmcyPZDerwiUqC7nipGlcGVTlhQEg
 Z1SEYwbr0++aj7+fOJMF2dT3IFeQhTRcQTFqdnTp0c93XIkCTTjh6a6AAoNYOGHP
 4eSPAzuSi1ant+uu/mTlSmuoJeMibFU45mSAJ7udaMqBaFFc5QhfU411zZZGKUdU
 2dzhOEB1NOOzo+S7dgT1u/7deZAbyuWklkhHX1VS8y7bYyge/vwRMpnZ1w6z72OA
 7rLClpK9HduW7jBWfEIeDspaFQjKLG47pfwWZCs95eM72V1fkhnenyn1IYr79/I0
 gzR3/o0GmUNRHpOtmRwU1PGIZQGPXD+YfvmkZDOWGLETUT0a2eYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yU4d_YRaBJzY for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWq4V0Zz1SVnx;
 Wed, 20 Apr 2022 23:37:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/31] target/riscv: misa to ISA string conversion fix
Date: Thu, 21 Apr 2022 16:36:13 +1000
Message-Id: <20220421063630.1033608-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Some bits in RISC-V `misa' CSR should not be reflected in the ISA
string.  For instance, `S' and `U' (represents existence of supervisor
and user mode, respectively) in `misa' CSR must not be copied since
neither `S' nor `U' are valid single-letter extensions.

This commit also removes all reserved/dropped single-letter "extensions"
from the list.

-   "B": Not going to be a single-letter extension (misa.B is reserved).
-   "J": Not going to be a single-letter extension (misa.J is reserved).
-   "K": Not going to be a single-letter extension (misa.K is reserved).
-   "L": Dropped.
-   "N": Dropped.
-   "T": Dropped.

It also clarifies that the variable `riscv_single_letter_exts' is a
single-letter extension order list.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cfdfe787de..edc33c44dd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -34,7 +34,7 @@
=20
 /* RISC-V CPU definitions */
=20
-static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
+static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
=20
 const char * const riscv_int_regnames[] =3D {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
@@ -911,12 +911,12 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
 char *riscv_isa_string(RISCVCPU *cpu)
 {
     int i;
-    const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_exts) + 1;
+    const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_single_letter=
_exts);
     char *isa_str =3D g_new(char, maxlen);
     char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_=
BITS);
-    for (i =3D 0; i < sizeof(riscv_exts); i++) {
-        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
-            *p++ =3D qemu_tolower(riscv_exts[i]);
+    for (i =3D 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
+        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
+            *p++ =3D qemu_tolower(riscv_single_letter_exts[i]);
         }
     }
     *p =3D '\0';
--=20
2.35.1


