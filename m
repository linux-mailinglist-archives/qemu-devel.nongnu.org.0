Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD947A451
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:24:14 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB9h-0001fD-PZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkm-0000B5-6C
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:29 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAka-00086R-DZ
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976297; x=1671512297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rwK2fmbknHszBrnqC0mYeaL/DBCF3QpDaIGNemTAA8A=;
 b=nZ7B8KNzv7X/5sA2CtBBlBXHN/MH90fZ+KGoDXFohpOLLXT9v385QaOd
 yblPwJYi34cjLc4XUkTtEwxlwrfBGt1lCL00d+AlYqt+S6ZLxfZNuILuw
 TWN/az0wrRt9sL7Z8D05IhVTwZUSD6Q58+PogoeCQCvOEmQ4/XI7AjIkY
 5zc7k7IICPA2XA0XS6CKlWG209MqFCiOF2aDxHkJ0tYMU9mH6HS696RPK
 PQgsvdsmenFg2gHdNpkXHQZqPQQnvSg+h1RV6vZbwDMvSo1NdOwHoOMit
 M39fFYMZJ/Ou9oZdHNvLHDdwpz5q+EKDnwsQqGCaj3IRBurEUn/ZDAXh3 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="187626128"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:14 +0800
IronPort-SDR: YiAP+z5+i3tc5aBY3iPOqjZ+yRgY2R7oxSW1nzeYnoBFTJT4BFKSfuPemCVt5AQCXHrz8EBE5i
 czSaItz0JbanL4+lFPU9CObhCHWiupMSSoZVB9t28JCN8j64zKLbxURNmQmxXvdyKKNuePyvha
 eNDT1HdqoFs4J6y/fVunxrdoSznzhbYMN9v4uwI1kZMViaE7OQdbHaK+xtoyQ+MfcKjcNHpz4x
 Gt9KfPe8iGhKXFC3YAvHnuJvuDuArIRxJOsM5FrJmedwQPDpR6ab2khImr5B7EFbkXYz742DEu
 BZ6jRgthFpjDPrVWUgVFDqDi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:30 -0800
IronPort-SDR: ljMuN4YH98QI/6YIxRb8tZV+Qp4C1ent4XxiCNHhZsjza/mjknnfhUl1RZdhOci9XyasNGwbYR
 Q5th33uHG21rZAHJy0OSjo67iU0+SUtvqdEpKmd4J5b0JeizO3S9/SPpF/txFLoe4dhXfudwOS
 xjveiIChTb+JouPaUx+jra/oTIGPah7624dhDAS2mRj9SFd9WPd9IMlstaHewPbPaCCirW6YRM
 iQstGhm1Jg2UD9/wv/I3lPcyoGVyAGXFI3ezP/Au5QRQe1TXa75mhCjTkiMCdTyp1ZB4T9NrvT
 Mo0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5d1n2rz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976292; x=1642568293; bh=rwK2fmbknHszBrnqC0
 mYeaL/DBCF3QpDaIGNemTAA8A=; b=VtixNys5I8qzVvcbTmk9z+u0ql4DP7zHIT
 7mAZp/Ca7/iueDtG8D0M79g7Nc1ZtqVhpr8ksao3T0cJqDPHcUR8d0ODSGVr0ZBF
 sxOOLdft0CLvTb8DZ6q9Zdg0vutfpK5aUgvJB5Pf6lU0C0xjwIMvtCS3WAUlw1X6
 +o8OyQTy92i3yB3nVbqrC/F/Lpc/jm7v/1dOWbfWHsKh7lTRB8+Lw9dF52p0C9Px
 vaou4L7eTf/Xp5nC5SpoPXelOzE11BJFy7Z8bF8WGRZOfLd05n5M33Dxh9MTWcs8
 OeaCPfPeujfEvP8+p/arckuvsW0g8fw14yZ1SirBVBITMuUsvnVA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id v09IRR3bDm6y for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:12 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5Y0tyPz1RtVG;
 Sun, 19 Dec 2021 20:58:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/88] target/riscv: rvv-1.0: add sstatus VS field
Date: Mon, 20 Dec 2021 14:55:50 +1000
Message-Id: <20211220045705.62174-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-6-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 72a716c999..bb62da7549 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -409,6 +409,7 @@ typedef enum {
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bb500afdeb..83f4dbd824 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -463,7 +463,7 @@ static const target_ulong vs_delegable_excps =3D DELE=
GABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_S=
PIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MI=
P_UEIP;
 static const target_ulong hip_writable_mask =3D MIP_VSSIP;
 static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |=
 MIP_VSEIP;
--=20
2.31.1


