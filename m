Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A168B5A8A34
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 03:05:01 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTYdf-00057L-TS
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 21:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=236608b13=wilfred.mallawa@opensource.wdc.com>)
 id 1oTYcC-0003l0-55
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 21:03:28 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:38059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=236608b13=wilfred.mallawa@opensource.wdc.com>)
 id 1oTYc8-0004dV-MN
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 21:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661994204; x=1693530204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oFWUJSonjgSiarw8VbtoOE8i/BfCQu20vuOckWTMp+M=;
 b=b/jJrn6rGfJi2dFlRDELp8sGYtk0kql8P3uYhYi16zlv6/eeJZakHiEK
 9ingTVl5CSG9qt6yhseQpp1lMGXjfOIZphfUSwhsvlxF+ke1niN/RDJ9V
 pjfR4w2HpclxUbSdmZHQnSYASXGyyEBwWZ7DQUrBQSmqwjAiIAmvdzJpD
 3BgbPxBEpOGz+BeGMtzFnK2u3zXc4otWW2t6+cLtmOIFbGtD+EBZNEoB/
 IBFkr16FdJZ0pjPNsGOEQZh2bnQHhA6fSNt6LkbGflmXD1u605lGZOea/
 1Ut0EYthSmM8t6qfPDX0HBUmmly3E6FtruWo4QjOIviE6gnTPIgi/quZH w==;
X-IronPort-AV: E=Sophos;i="5.93,279,1654531200"; d="scan'208";a="314464915"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2022 09:03:14 +0800
IronPort-SDR: B49VnHyucwAbE9RMR1zlH68QCTdhRSMVpjNNr6V8IhsHjnfqjd6Q4eFvDEDLDPoqid5/UmGQDV
 EIqFYzzANz8wjk4/WLaErF+gb4P7qiKQSllZEdkpT85UrtfgAx8F8ESbKqfwBkuTm84owoxgay
 ziLZrAxGLD4ao+Dfchmj5cF46c51vy66htcaSFYdk+xpMJ5F2ihSBrbwyWX1RkM8gGbUgA2mP4
 ZoP5+uKp07IhbwAIKo+g3o2Dz/wfYEUsSAT7sW5oL4cZr72NrF9suTzBArWFneYNb5kK17A12Y
 gjrCg58IQrKrwp7lE3TrZmy0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2022 17:23:44 -0700
IronPort-SDR: sMpACSLOswChcVDZd6G+syJiqtHbTBzN1UzMFEDTVBUTpeTOykAQtGAx3npZ5tTm3ss2DIVS/a
 8b5u3oG2sWrL5BZLC2pEIcXJymmHyFTwNu9RvOFMeye8p3rGY9XsM0OvpKtVr1Nt/UX4AnsX5N
 tGDfkMgye5bXFbhaehGRbfPO7rqURQjFvA23oAHOLIZ7Xwk6AfQoKpLunjsWpevfvjx0LA/2dv
 QiemI8ZGZe49ADgDljvRaUGBEdfqnrRllbLUKc4SRIutPKI6Szmb+eaiDBWq1wOeT+nuRv12sV
 qoY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2022 18:03:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MJ2pp492Yz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 18:03:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1661994194;
 x=1664586195; bh=oFWUJSonjgSiarw8VbtoOE8i/BfCQu20vuOckWTMp+M=; b=
 rAaNO/LgMPuZHaQuuyY6YxTDg8I5yBF9GaYabc3xmB9SI3Ds5utJBj8ZLtCNQHwl
 1cBBE83t83uTznSbuCNFvjZmxSKss1/JShvZFcHZOr9k0sNRCHhts9qqRj/W3zr6
 abPn17L1J+5BAMpydZcqU024IFD03TbiXpo/AXwYdlHwnCCtTR5u+0B+Pve+DY8C
 UzLR+BEGYx8zOE7L1p9sMFZatUI/Twv7CzMuiSHLiTTlCpPHGrUwNBVjOfDEWhgK
 aW1VPPYnxyvVSfhf8W2JEDyk99HghbtDEB2+/DSCsUF/QaFYZpGr8GuqHvcDWRke
 9vU+LETbE1A4Zm4P9Y+YgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oKeyHUNv39_p for <qemu-devel@nongnu.org>;
 Wed, 31 Aug 2022 18:03:14 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.45])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MJ2pm3fQpz1RvLy;
 Wed, 31 Aug 2022 18:03:12 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: alistair@alistair23.me
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC] hw/registerfields: add `FIELDx_1CLEAR()` macro
Date: Thu,  1 Sep 2022 11:02:21 +1000
Message-Id: <20220901010220.495112-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=236608b13=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Adds a helper macro that implements the `rw1c`
behaviour.

Ex:
  uint32_t data =3D FIELD32_1CLEAR(val, REG, FIELD);

if the specified `FIELD` is set (single/multi bit all fields)
then the respective field is cleared and returned to `data`.

If ALL bits of the bitfield are not set, then no change and
val is returned.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 include/hw/registerfields.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 1330ca77de..5a804f72e3 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -115,6 +115,34 @@
                   R_ ## reg ## _ ## field ## _LENGTH, _v.v);            =
  \
     _d; })
=20
+/* Get the max value (uint) discribed by `num_bits` bits */
+#define MAX_N_BITS(num_bits) ((1 << (num_bits)) - 1)
+
+/*
+ * Clear the specified field in reg_val if
+ * all field bits are set, else no changes made. Implements
+ * single/multi-bit `rw1c`
+ */
+#define FIELD8_1CLEAR(reg_val, reg, field)                              =
  \
+    ((FIELD_EX8(reg_val, reg, field) =3D=3D                             =
      \
+      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                 =
  \
+      FIELD_DP8(reg_val, reg, field, 0x00) : reg_val)
+
+#define FIELD16_1CLEAR(reg_val, reg, field)                             =
  \
+    ((FIELD_EX16(reg_val, reg, field) =3D=3D                            =
      \
+      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                 =
  \
+      FIELD_DP16(reg_val, reg, field, 0x00) : reg_val)
+
+#define FIELD32_1CLEAR(reg_val, reg, field)                             =
  \
+    ((FIELD_EX32(reg_val, reg, field) =3D=3D                            =
      \
+      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                 =
  \
+      FIELD_DP32(reg_val, reg, field, 0x00) : reg_val)
+
+#define FIELD64_1CLEAR(reg_val, reg, field)                             =
  \
+    ((FIELD_EX64(reg_val, reg, field) =3D=3D                            =
      \
+      MAX_N_BITS(R_ ## reg ## _ ## field ## _LENGTH)) ?                 =
  \
+      FIELD_DP64(reg_val, reg, field, 0x00) : reg_val)
+
 #define FIELD_SDP8(storage, reg, field, val) ({                         =
  \
     struct {                                                            =
  \
         signed int v:R_ ## reg ## _ ## field ## _LENGTH;                =
  \
--=20
2.37.2


