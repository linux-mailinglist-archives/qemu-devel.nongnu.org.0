Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B036538F0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:43:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87lf-0007Lw-EM; Wed, 21 Dec 2022 17:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lZ-0007LN-UJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:50 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lW-0000bf-IE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662446; x=1703198446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CI5uErihF5w7ZBbRgK9Gg9eNSt3tdaxo7HSFvtv5odE=;
 b=aAeEC8vG6SkKtjg/Q5wOikOqqORwnj96WNhwPaU6QHkXup2/rcYJRpGY
 9sT5banDyvikFcpNR5VbRb8zTvepaOhnR1YUqqnBDL79VDflcXufWqakn
 UbxLCgVgsJ9h7x/ARe+HAk14F0n02k8Xtu3C6/z+XuJC6FdBUBsA1k6EB
 z0tfSu1Vwqrksz7QYS1QVF4ImzwkHK1ZJ4fVrlCbalRD1ugrRW6LFfEZh
 0yxJl3gJaEEjC/j842KN3GnxpNEWB8g0qMzuKUqzD9kZF2GtOOjimr3+l
 GiHdFw2u46vWaHuAq5nfrry9ulo9nayLKCnIZ5IQFWrxBzFfesgk9BcHs A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561264"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:33 +0800
IronPort-SDR: 2v8QIhBxuFNP2FlJXbEsJbPMzZzJiIX8pya3YD+ixaABejoNFSK4v5xJJRqvrnlpSZWXH3hPIU
 O1we+0D0DAXVOpwgh7S7SpBg0UXHN8prvkyV81Xsybj2oxAKl1XCDdVRwSD+l42wd8+gcBerEW
 Tl0Q28YurJHmrx2DIfUQ1QPZq8z9bSYeemdqDNes2bnVs/r66iLz1LxdGseqhIEUoPEUelSu0d
 RtDmGk1K7kvh0qM6bYzYwQip50zlrZCGIWQJ55tnY4DvBJoy2FN5oqMwggbMjIpkFNJV1wUr7D
 ywQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:02 -0800
IronPort-SDR: TTaMnDWPk+TQTvCom3G7KcfvwWlfDpp6VxpHjs4NH3wo41ZU4MkVy9BKTG5KCQXPcbKvVfxFzJ
 j5Kvb1sljpr16BAlhl5r/+hWm/QDEadlIo2r8Zyksq1P/RwLgpABGBEz6OnhmGBKrarkPE57R1
 Xw+1v6V7MV8Ypy4LcxXbu0iklP4z+CcqGvbM4rqJMzI1SPuCaovclrAWGs97lRJD+DBzqmDSo5
 67djWYqCtqpKkBTCNshcEBHJajXP3yI7QnvcuKWHuSIQauI2oW44tVYHHVB5RxjEbLt84S0EvF
 iNw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLT1F55z1RvTp
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662432; x=1674254433; bh=CI5uErihF5w7ZBbRgK
 9Gg9eNSt3tdaxo7HSFvtv5odE=; b=X8jG4t/WUpVLeHa3pMMptxNIfeYqDit5KA
 l64Hy6+V21Lq4k82MohAMZjP4HSngQX8wvQIZa+s/92+E4p+wLY9swvoDCUKhi4q
 dNy5kAbJDtL9EO7LPZm01z/RSuX58s/2CiWs22ShxVt2O6SCkLRxPqTdR4qlsWwu
 dPfti2DHBM4nNH5WaR/KTSc/dOzm2K3NZo0lSJINtImyfEYb+vAq5lCY3stJwdOG
 /cGOVxtOinMDVYiJwMZfcVLxdtb9M/Rd7eNEkx90r4QLO5QIk+Mzm0UJOQelM9Dz
 XUFUxlhrAq3xCdhPohy/IYSquu6LHhxLVF3lzyeOSDlyggOyMuqg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rdGFDpOKS6ta for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLR23w3z1RvLy;
 Wed, 21 Dec 2022 14:40:31 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 02/45] hw/registerfields: add `FIELDx_1CLEAR()` macro
Date: Thu, 22 Dec 2022 08:39:39 +1000
Message-Id: <20221221224022.425831-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Adds a helper macro that implements the register `w1c`
functionality.

Ex:
  uint32_t data =3D FIELD32_1CLEAR(val, REG, FIELD);

If ANY bits of the specified `FIELD` is set
then the respective field is cleared and returned to `data`.

If the field is cleared (0), then no change and
val is returned.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221017054950.317584-2-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/registerfields.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 1330ca77de..0b8404c2f7 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -115,6 +115,28 @@
                   R_ ## reg ## _ ## field ## _LENGTH, _v.v);            =
  \
     _d; })
=20
+/*
+ * Clear the specified field in storage if
+ * any field bits are set, else no changes made. Implements
+ * single/multi-bit `w1c`
+ *
+ */
+#define FIELD8_1CLEAR(storage, reg, field)                              =
  \
+    (FIELD_EX8(storage, reg, field) ?                                   =
  \
+    FIELD_DP8(storage, reg, field, 0x00) : storage)
+
+#define FIELD16_1CLEAR(storage, reg, field)                             =
  \
+    (FIELD_EX16(storage, reg, field) ?                                  =
  \
+    FIELD_DP16(storage, reg, field, 0x00) : storage)
+
+#define FIELD32_1CLEAR(storage, reg, field)                             =
  \
+    (FIELD_EX32(storage, reg, field) ?                                  =
  \
+    FIELD_DP32(storage, reg, field, 0x00) : storage)
+
+#define FIELD64_1CLEAR(storage, reg, field)                             =
  \
+    (FIELD_EX64(storage, reg, field) ?                                  =
  \
+    FIELD_DP64(storage, reg, field, 0x00) : storage)
+
 #define FIELD_SDP8(storage, reg, field, val) ({                         =
  \
     struct {                                                            =
  \
         signed int v:R_ ## reg ## _ ## field ## _LENGTH;                =
  \
--=20
2.38.1


