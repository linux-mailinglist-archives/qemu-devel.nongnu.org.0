Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8D4B81E3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:47:23 +0100 (CET)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKF22-0005vR-4w
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDou-0004Za-Vr
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:45 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDot-0006I2-85
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992981; x=1676528981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gQuKw+pR0sbPYb7FHP+pF/1PuBkafM513sv97qUrNQ8=;
 b=eoK0QDIyTR14cquTswoByGDY3emLkIHl//Wb08C2S/sTOPqNUNdZEXxJ
 xbpsNasYE9Ve2lau6CMy0o5Sw3WayJsVw05POjcy5SOUSpEel1pGtr9Dy
 ZH2hTnC140XkJj4rEodiPVIigoEwV+aSbtc/BN76ilfUZXUQD7qbWjC08
 M3H+wvjCShZtLf593uu/JOwKLOSVFEKLMYCaYdjT/X3qVG4tSoH824HJN
 o5g5akDP/2WZ37r0MZ+mVb/m0/qt6c+fzMXw6tyyLSNdnfDE5heLV6XVK
 BUjDQ5EElGIcfn03yog4FQYYMM5Pz7+YSVjpL0jwsWNgk15wD0sdB7RJG A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072677"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:37 +0800
IronPort-SDR: P0FlL8Cg3TyxwQX4bcCh95rQWzP6OCF1/apovTWSCt4xsuXgDia5Kzg5QaPAasQdMQJihnQDAc
 5yXupcvvw9kKfxScyAz1RpXALQ7r1JAm1byKm2q9USum1AHdO/BMazO7JmrFum4tyz/Oe5ePyX
 u2mjCSr7eRX9c0REdhRVDhFwTgsNd9mKTm6q7NGZrMftKqOL9ER1QLV5fDX2FXMjTHRsGd/Idk
 NIF6OealqdwAAtr5mNO4I6mJYzsDPjWAfvddnx1mXl0vB1Au3TvnHlJ1TMF8FXZW147IhudrT7
 YQj0GeLBzbvrOe8DH3CMlzY2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:27 -0800
IronPort-SDR: Pf/7dIkV2vYmF5gaqsAkqDS8MqulvqNx+xPy0QiJyfQl6kRjOcf5x6jLqxv8fmUf9p/qqSbbHr
 naivmXIEzitOtPn7TyUYeXm4XCrxsFxPrBEsCZ4yb3RXJihgEh7vlyxzK717VblNZLpxa4qkZu
 iNgN9wPMgYpj3jrEoJZXZjWeu+qs/pi8SkD9n0PtIGsz8dPkMcZRtJrz9uV49njOnIMOkIqHkn
 Od0KTDo7+gmoNfErLvNTaG4Vk3pkV2fPpU56xgrv3fxJR9U37zj7JpmfeHPmllLZOcxNrRKJ95
 XNQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7NL6kM8z1SHwl
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644992978; x=1647584979; bh=gQuKw+pR0sbPYb7FHP
 +pF/1PuBkafM513sv97qUrNQ8=; b=i83ymA7ZB0ECV9/mIPKFGQiQja5eQxJIX7
 7KmcJchWcLAzRCTyu7yv9YUUpvDLfzgX9dPSFK0cp89TIll3TYCiZhawddsntNJz
 tLeR6m+uUPL+Hq1hiaHtTGNyJuZYWjAak7lRcRZEA8TQZ2z/fVuiTZzHs3CHO3SK
 UOy4UqLE/CEFUEO8oikVmIYw6OJVTFzzE3Vaaia3OMfzfw/A3MAonp9piPEIGp5a
 B6B+VLncMsH2hMbYtLbFRed/4KehsecY+QFvlOpW0SajmmOACghL9il/W+jwYimj
 waNsZ0omKClSZaD00ezeZOmmOmh98T4dzTFCRxw6Ym8KAC99htCw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0AeIG4-sBZKO for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:38 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7NH3b3Pz1Rwrw;
 Tue, 15 Feb 2022 22:29:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 04/35] target/riscv: refactor (anonymous struct)
 RISCVCPU.cfg into 'struct RISCVCPUConfig'
Date: Wed, 16 Feb 2022 16:28:41 +1000
Message-Id: <20220216062912.319738-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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


