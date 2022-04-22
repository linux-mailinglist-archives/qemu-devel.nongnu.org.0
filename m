Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC9950ACFB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:53:59 +0200 (CEST)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhYc-00075K-9V
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJD-00076I-Qt
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJA-0005Tt-Gf
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587880; x=1682123880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NKi7BnguHKbUSL57AN/Ltful3DUcgnNz6gagWdPlB8c=;
 b=XlxRtTjuYq+RLkCX1SaEbvL+bx7sKkT6Caizhjtfsw+pkrg4QhdOhlgV
 yi3S15sOoSHOhOdwRyX7949uxRweXULQkKFkMQL8/O520hVac3ww48eLV
 p2rR95236ojspvjhJYHBny9LD8HxcMLCCNXHGRElMSWjUj/0rpkwyibi4
 n0UvKE63hkP2k2Gzg7czMYoXOAXFkF1wv+eIXsz/b+2RC8sPD3PLcJpQW
 9CCXJsx8uZCAIzzlf9IjgiUT3rd/VFR2RP86H7l+AV6UuhxS6s3hls6bs
 BC3MvtiFjUKbaC8NG4Lq5r9xQqedxA/fkQC0HOwzLasH+XrEKRGZQp5hl g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483390"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:57 +0800
IronPort-SDR: FJgQF/XEhDawrTYVS9i/L8zFlNTUWTcRrfBsmcVa5ZGU7/khWJsBIs5VIrP0rgf4wZmD4iNKlj
 Mso86f4OkLxSGZtjiRUJXL3As7au3N86QG4IJ7j/oH2ydShXR8s+T77a+Cm1GI4NfsTiHF/uFp
 Ag5otSat+fJQUJm8mqoK9sqboSf2Nh3jtooBa/ZgK2Q+aZnXFRys7Brp+BdJ3nYDHttAtPxoQt
 HAlPqeQfkOY77mEtksX9jnKk25ZnKqIjFVqW5NhmM+6KQIhpcdaFxijjLv5I964iBA+uMTfQli
 2MtYBO5iRs198CXbT/TxEtlp
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:14 -0700
IronPort-SDR: 7g7n7hYuX5uD0PDVuv8gqZcTApzRkjF/7+53XbGtrGPwetOiuHCYgtzcqz4+wACEZwGSODpdTC
 XkWNUXn5990rA23u/Qz3pZWeM4M/NpJRqA7KophDfSWy3Jr/66kkJhcAkeTOPhizj5MV5AAT2G
 6G5xl38Q3WX3CvggH9RnsgyLXrwa3jAMc2ZzCdKLyaXr8zUaBTBHomdg87Q6hchSM+QN9I5ZDJ
 GAZTYU5XshhNk8hoSmK2OQLM99IDLMU445P9EFmGPRCnpDiFFWd5FhVBlJrnjPdl1Uc3we+PKO
 diw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVY2J96z1Rvlx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587876; x=1653179877; bh=NKi7BnguHKbUSL57AN
 /Ltful3DUcgnNz6gagWdPlB8c=; b=Q0B7k0BEsdwQ5cIzPgS2rfV+00aTVG3jbB
 BBE5GIsuiP3HEr5x318dmss9Oh/OE9xPSxsEDidedKqU78MRO7Ju1r3P9ZjsMkHX
 GcHmbRI/ZMKQUskB0mFqrYeeS0H77DfG94uBsqXwOLDRktH8jGtXoJRaPgBspptD
 18nFMqhzWTILoL+8UO114QVzoridlMI9cl2lEeCYOHeuHtFmg4NWH45ZN3X1M4A1
 4d6JaRxsv8Bqi3OQvGxMHAqnzZYfOL/Hl6a6lWYxq5v7SoEqARYOcQZTy3i002cZ
 l68ZPKAG+eH8CFwJP+aebUXnE4TqfaBkKCYfk/Owk5li7kzJbWPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id aOvW5mIGs_yv for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:56 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVW0Gzwz1SVnx;
 Thu, 21 Apr 2022 17:37:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 14/31] target/riscv: misa to ISA string conversion fix
Date: Fri, 22 Apr 2022 10:36:39 +1000
Message-Id: <20220422003656.1648121-15-alistair.francis@opensource.wdc.com>
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


