Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C63FD124
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:17:51 +0200 (CEST)
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFp0-0005Ek-Jv
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiN-0005Oh-Kp
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiL-0007xZ-Rz
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462257; x=1661998257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XD3rTi8XFggeJ+/STxqfhLkctUz2QETrSerNx3ORSl8=;
 b=fYQdh54zwedWdynm4LWejueHjUhn19yhAgE08sIEJlE4ZqKBGY7s+atb
 ru+62qSbWhk9fxfP1qovIXSi2xWlT2BWa+dynuittK9TKgMIqMv/pTjul
 aWrw3XMvkHvcrVmwpE2WgH1d0Oi7GmvhEJwEbTxMXrFfnUa+xfoXV637C
 n3N8Qda5MQGCPQ5NQcR/wxSqDBZEbJBpeUgXQcZU8q3BP6uE1gfO352Iw
 YYfoHuxPJtCJ+NeEzwb025X+S9THJT4B1xsvRDU3uCR3C18TH/pLgqMCA
 pa8ntGWsveRqoCzyixBxCgr7xbxWCci4gpD9vEzyiYvdmyvjtBSOLBB56 A==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="290509002"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:55 +0800
IronPort-SDR: sZHYqqTwhQuNd8eIOUed1cFt+m/iGxnI7x/TrOG7fHVCiNGKpn+TOT7507EaYcmLwxMEE1wJaw
 aO1qHDW5f9uJAZkfzfwc9XmgYhg3pM7oUXxC4dPdC8v4zqiCa8qFsrFfOLaZlPj56Q+m8s8/9X
 Axg+K7VyW2MNDH22OkY7+CDmIssMGBogum3pN6TnMlrRcvfjCycDnWbAICoSRt2E598lqjlyxL
 RfvfvfIMpgAG5Mgo4ajX7JDX9Cb8h8lIYxfz29lKGxwWhOe14Y/6Qos9nbgOA0bPDZuZyL7rlg
 PZJ3/uWjQFd/u0ECr8EqkyqX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:44 -0700
IronPort-SDR: i2iJT1vTbyOlzAFTJmcx9QsYFq4wqWvaK+CPBB92OaunLedtPtLCA4YfNaOLvB6kHeZcuvBfdw
 PtCTv+aaOHm7IrAQ6JBKoF8Bd6h1CeEB3oACHGA8v3eofTWQAIYn7duynC6G1OeR/7qoATfy99
 1nRE00fgVv/QWg4vf4HnB4qffc3HylW9GM0DpYwCirGh4kz0H35+UJL0aWHWBt2FkhheC08jLd
 U1oO7IDAYfWXNshghzAkD9gvo2obM6pU/mA81cq29yJQVZuVTonIulEV5+xv7lH1wC3w3ThgOG
 HsY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznbM5bG0z1RvlY
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462255; x=1633054256; bh=XD3rTi8XFggeJ+/STx
 qfhLkctUz2QETrSerNx3ORSl8=; b=o6VN+RT/ULqkJD1X1om0rUZrLzpOG6LPqb
 OtnkLpEST4cgWvasA0EErfvzntwTvtTzWcU/PYm9RuPCVyEcXB2QFeeMgHvsNHVX
 x6XpgnqOMvuWuMS7WE3HNMpIh6pL2yvrZnt23NeH9l9Qab4yQLxWrh2a3H3JmDwB
 TUWVA/s00aj/NrBXfA/N/OnA4OvXVUU29kMGSN8/ScFRSp2RUKkjcz5IevbUr7kG
 UMHCzH9ec7m3Dyx6KxXtQwEzwaOpqrSsk22JYqUqcO9X1GPlQkB9C9mK0sxSpoUl
 ttRE1b3tmYwGzkm1feuuUUYso7qsArmvuPCUTYBPCXuEQu/3TeOA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id db4GWoJyMVnU for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:55 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznbH0sJGz1RvlX;
 Tue, 31 Aug 2021 19:10:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Joe Komlodi <joe.komlodi@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/33] hw/core/register: Add more 64-bit utilities
Date: Wed,  1 Sep 2021 12:09:33 +1000
Message-Id: <20210901020958.458454-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Joe Komlodi <joe.komlodi@xilinx.com>

We already have some utilities to handle 64-bit wide registers, so this j=
ust
adds some more for:
- Initializing 64-bit registers
- Extracting and depositing to an array of 64-bit registers

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1626805903-162860-2-git-send-email-joe.komlodi@xilinx.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/register.h       |  8 ++++++++
 include/hw/registerfields.h |  8 ++++++++
 hw/core/register.c          | 12 ++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/register.h b/include/hw/register.h
index b480e3882c..6a076cfcdf 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -204,6 +204,14 @@ RegisterInfoArray *register_init_block32(DeviceState=
 *owner,
                                          bool debug_enabled,
                                          uint64_t memory_size);
=20
+RegisterInfoArray *register_init_block64(DeviceState *owner,
+                                         const RegisterAccessInfo *rae,
+                                         int num, RegisterInfo *ri,
+                                         uint64_t *data,
+                                         const MemoryRegionOps *ops,
+                                         bool debug_enabled,
+                                         uint64_t memory_size);
+
 /**
  * This function should be called to cleanup the registers that were ini=
tialized
  * when calling register_init_block32(). This function should only be ca=
lled
diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 93fa4a84c2..9a03ac55e4 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -30,6 +30,10 @@
     enum { A_ ## reg =3D (addr) };                                      =
    \
     enum { R_ ## reg =3D (addr) / 2 };
=20
+#define REG64(reg, addr)                                                =
  \
+    enum { A_ ## reg =3D (addr) };                                      =
    \
+    enum { R_ ## reg =3D (addr) / 8 };
+
 /* Define SHIFT, LENGTH and MASK constants for a field within a register=
 */
=20
 /* This macro will define R_FOO_BAR_MASK, R_FOO_BAR_SHIFT and R_FOO_BAR_=
LENGTH
@@ -58,6 +62,8 @@
 /* Extract a field from an array of registers */
 #define ARRAY_FIELD_EX32(regs, reg, field)                              =
  \
     FIELD_EX32((regs)[R_ ## reg], reg, field)
+#define ARRAY_FIELD_EX64(regs, reg, field)                              =
  \
+    FIELD_EX64((regs)[R_ ## reg], reg, field)
=20
 /* Deposit a register field.
  * Assigning values larger then the target field will result in
@@ -99,5 +105,7 @@
 /* Deposit a field to array of registers.  */
 #define ARRAY_FIELD_DP32(regs, reg, field, val)                         =
  \
     (regs)[R_ ## reg] =3D FIELD_DP32((regs)[R_ ## reg], reg, field, val)=
;
+#define ARRAY_FIELD_DP64(regs, reg, field, val)                         =
  \
+    (regs)[R_ ## reg] =3D FIELD_DP64((regs)[R_ ## reg], reg, field, val)=
;
=20
 #endif
diff --git a/hw/core/register.c b/hw/core/register.c
index d6f8c20816..95b0150c0a 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -300,6 +300,18 @@ RegisterInfoArray *register_init_block32(DeviceState=
 *owner,
                                data, ops, debug_enabled, memory_size, 32=
);
 }
=20
+RegisterInfoArray *register_init_block64(DeviceState *owner,
+                                         const RegisterAccessInfo *rae,
+                                         int num, RegisterInfo *ri,
+                                         uint64_t *data,
+                                         const MemoryRegionOps *ops,
+                                         bool debug_enabled,
+                                         uint64_t memory_size)
+{
+    return register_init_block(owner, rae, num, ri, (void *)
+                               data, ops, debug_enabled, memory_size, 64=
);
+}
+
 void register_finalize_block(RegisterInfoArray *r_array)
 {
     object_unparent(OBJECT(&r_array->mem));
--=20
2.31.1


