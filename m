Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD584B31B5
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:10:45 +0100 (CET)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfzw-0005PJ-Vg
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqu-000524-BO
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:25 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:14675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqr-0000AY-7T
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624081; x=1676160081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gQuKw+pR0sbPYb7FHP+pF/1PuBkafM513sv97qUrNQ8=;
 b=bQ2N+60UiquVZMVgJtx3CxZxWQ3NEem7nU1Cft5DoJjRvbazIZpJyYtp
 ychtrmMh+HyW4JmHaVlqeQiHmC0wW/XL7mVukJZpginUASXC1BbWVbffC
 M5q/69t/IsuwaUWnEtCV5R8YLqgtDpIR6nID36gtgp3k6nYV3BnH0lsbD
 xuZHsY4mXURqqIrjpwaafVUUJfX4w7BlU1JreteXX79WBl/ARwLP17HvI
 aMxWUc2Hbsh0C4s35uh9iLw67fcyjCKBkdG5QFy5R6mJM+XYhAJQiMN5K
 B2AOSqYgCfDVls/hftSi6AFRj3z8iI4wDby6x7xdfR0k6oEehySR/TmRe A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="191669385"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:15 +0800
IronPort-SDR: DZ6ytewnJu74UdEwkOHgugKtwoVCpZ3HLESYF1xNC/z3fYq+UkU6aaVaR687SbOUZTjQqmY8S/
 hBoE08THMaBRG6+ecrUquQcRnAhhER1DWs6WP27l0BwPSd1b+eJxR/52xQf9geZTvgh4JRVsYT
 NgACgtuILGxN46NFqKLMOrJZQUCN1zt+wf3csydIVgH0pQHuUAv0X5bE7l+wyO8BUq8kM2i/CV
 ++hfVXF4n5cy8B58AmA8lgcncfussUHY9QHi6rGeS3Eh18EdLSXuR21yQi5yOrzQOVBWPYhS7W
 fpbq6vdYe/W/Hb3GWNamyMYA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:00 -0800
IronPort-SDR: uVSU1KofcS37cfdVZ5vhES9clR0dwto2LhN4jCIapMW5F0F11WgLh0uL2oI492VLCblA7uI4pe
 g/lxK5tv9jG1PGS0uga6jSfJ9RFJN7R71DZXAhpxSflBguLHA+G4w+Pk/nsmX4tVKVIe6BAbIT
 fC2KAuBDXBxXFHff223Qkarj1GV24MR60vBEr3WAV0aq0vHIrTTr1tqAowG8Cy7u0tChkl0vMm
 vNiyXKm3zXjP6uUlz0xGxCC8gW7dsdICn14ZzEvk3PbDfVLfL2grj8RyYzsnz7TvarXCAGWsD/
 0lU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVy32Z4tz1SVny
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624074; x=1647216075; bh=gQuKw+pR0sbPYb7FHP
 +pF/1PuBkafM513sv97qUrNQ8=; b=AscqQ25djSVHMdVFXcZxclsUwISYC6Rn5K
 IBDziqWo1IBvUkcO5lxGBbMvYi5LvlUYS4nM1mg75855FLn87hEhO6PMaAfapC+Z
 46KD0IgyMjqRQqH4B2Z/bIUKafldAP4CYHVfVIeWp7IAWKWOTIw+3+mQ8G42rdN8
 3aYc16MDuYMH9lWiXKK0Ru9w7mce2D30vigTrG8X6JTypZUfYkfkzXFKwpjWRoG2
 Xym0KECHSFYe7xVFNo7A0j3mMLimzRumwXB6E9ZFyFWWvencGT+FeeSfBH9znLBN
 qOCUB0NE8limasavzDvvrq+96W6BRqQIi106oZav6+oXGkZs++JA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PcCR9dcp63pF for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:14 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVxz2zwKz1Rwrw;
 Fri, 11 Feb 2022 16:01:10 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 04/40] target/riscv: refactor (anonymous struct) RISCVCPU.cfg
 into 'struct RISCVCPUConfig'
Date: Sat, 12 Feb 2022 09:59:55 +1000
Message-Id: <20220212000031.3946524-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220202005249.3566542-2-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 78 ++++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 55635d68d5..1175915c0d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -303,6 +303,46 @@ struct RISCVCPUClass {
     DeviceReset parent_reset;
 };
=20
+struct RISCVCPUConfig {
+    bool ext_i;
+    bool ext_e;
+    bool ext_g;
+    bool ext_m;
+    bool ext_a;
+    bool ext_f;
+    bool ext_d;
+    bool ext_c;
+    bool ext_s;
+    bool ext_u;
+    bool ext_h;
+    bool ext_j;
+    bool ext_v;
+    bool ext_zba;
+    bool ext_zbb;
+    bool ext_zbc;
+    bool ext_zbs;
+    bool ext_counters;
+    bool ext_ifencei;
+    bool ext_icsr;
+    bool ext_zfh;
+    bool ext_zfhmin;
+    bool ext_zve32f;
+    bool ext_zve64f;
+
+    char *priv_spec;
+    char *user_spec;
+    char *bext_spec;
+    char *vext_spec;
+    uint16_t vlen;
+    uint16_t elen;
+    bool mmu;
+    bool pmp;
+    bool epmp;
+    uint64_t resetvec;
+};
+
+typedef struct RISCVCPUConfig RISCVCPUConfig;
+
 /**
  * RISCVCPU:
  * @env: #CPURISCVState
@@ -320,43 +360,7 @@ struct RISCVCPU {
     char *dyn_vreg_xml;
=20
     /* Configuration Settings */
-    struct {
-        bool ext_i;
-        bool ext_e;
-        bool ext_g;
-        bool ext_m;
-        bool ext_a;
-        bool ext_f;
-        bool ext_d;
-        bool ext_c;
-        bool ext_s;
-        bool ext_u;
-        bool ext_h;
-        bool ext_j;
-        bool ext_v;
-        bool ext_zba;
-        bool ext_zbb;
-        bool ext_zbc;
-        bool ext_zbs;
-        bool ext_counters;
-        bool ext_ifencei;
-        bool ext_icsr;
-        bool ext_zfh;
-        bool ext_zfhmin;
-        bool ext_zve32f;
-        bool ext_zve64f;
-
-        char *priv_spec;
-        char *user_spec;
-        char *bext_spec;
-        char *vext_spec;
-        uint16_t vlen;
-        uint16_t elen;
-        bool mmu;
-        bool pmp;
-        bool epmp;
-        uint64_t resetvec;
-    } cfg;
+    RISCVCPUConfig cfg;
 };
=20
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
--=20
2.34.1


