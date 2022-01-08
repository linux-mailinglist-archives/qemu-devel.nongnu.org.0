Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB984881D6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:20:33 +0100 (CET)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n655c-00027h-68
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fS-0001Rz-Mf
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:30 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fQ-0006wZ-QD
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621207; x=1673157207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FP5/+LLL+fZAkXwPEQJdRFILxE/5wYfJg15g0i3MUOs=;
 b=GV83V60jkbL1+Rc0GJILeYkrV5JytUBX/hKyulkL2isBF3LlDWZcYyg0
 lbaIRypQyak3aXAwfCFvLkttZ8ofbxzYiRkKYAeCNh+IMVkVpo5QidHwP
 57/kIfFMB64I0Qgzjs4zzm9QHEzB7pHkeYIijz7mPLzij3nbNjV+qtY+C
 MPkoIpjMqTa5Lzl2OrNKAFiB4LNVdoTqPbrySxu8WCF36LofN57Vn0IEB
 azRI7hD/td4oakB4PSmB5Kw8NAw8rFniLAQTaYr4MZyj80wVCl1R8SaKU
 T4qB08+wHzh32h7FerNRvziBeBiYBqvyxo9WKOwdSZTch5h2fP2a9br4e Q==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984955"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:26 +0800
IronPort-SDR: Ya44toYne5Dq1jzoKOYTNabiaPes7p1wPv1JtfcOcUz1UqRVmyhmlsdmmeM7Gi+lBSH9hOYPP3
 VV/eEyK59WVOw8whs/pfGKt6Em+09QJ3YWtPYYcxME+ZYX6f2Ka3mMu86DskNQW2kfUOyICvTu
 OuzIvDsAlO+WDWa0TVLz1v1DnDLxfhy4GYikhbmAkfA/3dqG4Qnkfb/dENEdL3BvoLSpRc7kj1
 OvRIawaFHkB88jg9+rVs9pF6EejbHslINEoHQkQ/YsSm2aAGQMIP+rF/t5WMkQLNfROZaqXxeH
 Bc7vVWYU+Tskv/ZgCSdpHtqs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:54 -0800
IronPort-SDR: L24j0faCI09s48U1dYEY28NMNJqmq3ZQGFTq7F8hpYf5P+EkC95jJ3BIMEOfWKHevnPf8C7+zE
 gRhuhUIh23tRX8nS5tZZrnazOnJIcP/mgXZT6iEIZHqGCdA5E9BD/u95Hh9BL3qcX69oOeNUqg
 g00rYimUa/3fFfuKjMH1HTsaipCyJS/saqzEi/oZWmN+mmOlBHhrAspjb+7S5gcAN+xWQsTV9W
 3PhdfqMQOqQqsEV2Cc0iUkfBVY9Q1YbTFTJtekuyFtv7zySTz7E1VeRGHvZLkFXpIENB4pzDWM
 5hQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Qb3N5Wz1VSkd
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:27 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621206; x=1644213207; bh=FP5/+LL
 L+fZAkXwPEQJdRFILxE/5wYfJg15g0i3MUOs=; b=emBcPj6XB7ABvzc3Gg4CldO
 WreKexVgiGOe/WiwDVIaeQkNCD7gwI+uolYVVq4fEPgJqI2/oz11/dru/3z/d5RA
 Yxwn+jOrA/jXMMS/3i2bMxe6DOhWCZxvS6DlkM1fVeg7M49CxFVnLWKMpBFi5ADx
 58fGMDgXURAyOIKagUTTBYHtl6pJ+AAOH4y9S2Z/RIIFmGYU5dj8pIVY633zoqcm
 hv4D3WQ1OAok5rWFN1Q4iDcn7sblbwhml91GwhYC1aziMAjBRuSESBG5n3mSeqT6
 0a0yosoxUC3RbvXLOGuKqS67tRSgwZDgcH529Bkc+sWJnx0x2WCjYV2lvzawc5g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id etbqBb1MZmAV for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:26 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8QW20Yxz1VSkW;
 Fri,  7 Jan 2022 21:53:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/37] target/riscv: helper functions to wrap calls to 128-bit
 csr insns
Date: Sat,  8 Jan 2022 15:50:43 +1000
Message-Id: <20220108055048.3512645-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Given the side effects they have, the csr instructions are realized as
helpers. We extend this existing infrastructure for 128-bit sized csr.
We return 128-bit values using the same approach as for div/rem.
Theses helpers all call a unique function that is currently a fallback
on the 64-bit version.
The trans_csrxx functions supporting 128-bit are yet to be implemented.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-17-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |  5 +++++
 target/riscv/helper.h    |  3 +++
 target/riscv/csr.c       | 17 ++++++++++++++++
 target/riscv/op_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e8c664a956..73d3d22f26 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -25,6 +25,7 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "qom/object.h"
+#include "qemu/int128.h"
 #include "cpu_bits.h"
=20
 #define TCG_GUEST_DEFAULT_MO 0
@@ -500,6 +501,10 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVSt=
ate *env, int csrno,
                                           target_ulong new_value,
                                           target_ulong write_mask);
=20
+RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
+                                Int128 *ret_value,
+                                Int128 new_value, Int128 write_mask);
+
 typedef struct {
     const char *name;
     riscv_csr_predicate_fn predicate;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a8ee8a362a..6cf6d6ce98 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -96,6 +96,9 @@ DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i6=
4)
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
 DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
+DEF_HELPER_2(csrr_i128, tl, env, int)
+DEF_HELPER_4(csrw_i128, void, env, int, tl, tl)
+DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..4c6a44c0b8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1817,6 +1817,23 @@ RISCVException riscv_csrrw(CPURISCVState *env, int=
 csrno,
     return RISCV_EXCP_NONE;
 }
=20
+RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
+                               Int128 *ret_value,
+                               Int128 new_value, Int128 write_mask)
+{
+    /* fall back to 64-bit version for now */
+    target_ulong ret_64;
+    RISCVException ret =3D riscv_csrrw(env, csrno, &ret_64,
+                                     int128_getlo(new_value),
+                                     int128_getlo(write_mask));
+
+    if (ret_value) {
+        *ret_value =3D int128_make64(ret_64);
+    }
+
+    return ret;
+}
+
 /*
  * Debugger support.  If not in user mode, set env->debugger before the
  * riscv_csrrw call and clear it after the call.
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 58d992e98a..6f040f2fb9 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -69,6 +69,50 @@ target_ulong helper_csrrw(CPURISCVState *env, int csr,
     return val;
 }
=20
+target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
+{
+    Int128 rv =3D int128_zero();
+    RISCVException ret =3D riscv_csrrw_i128(env, csr, &rv,
+                                          int128_zero(),
+                                          int128_zero());
+
+    if (ret !=3D RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    env->retxh =3D int128_gethi(rv);
+    return int128_getlo(rv);
+}
+
+void helper_csrw_i128(CPURISCVState *env, int csr,
+                      target_ulong srcl, target_ulong srch)
+{
+    RISCVException ret =3D riscv_csrrw_i128(env, csr, NULL,
+                                          int128_make128(srcl, srch),
+                                          UINT128_MAX);
+
+    if (ret !=3D RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+}
+
+target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
+                       target_ulong srcl, target_ulong srch,
+                       target_ulong maskl, target_ulong maskh)
+{
+    Int128 rv =3D int128_zero();
+    RISCVException ret =3D riscv_csrrw_i128(env, csr, &rv,
+                                          int128_make128(srcl, srch),
+                                          int128_make128(maskl, maskh));
+
+    if (ret !=3D RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    env->retxh =3D int128_gethi(rv);
+    return int128_getlo(rv);
+}
+
 #ifndef CONFIG_USER_ONLY
=20
 target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
--=20
2.31.1


