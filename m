Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967BA650638
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ib-0008Bl-4Z; Sun, 18 Dec 2022 21:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iW-0008AP-JI
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:24 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iU-00013w-Ex
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416242; x=1702952242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CI5uErihF5w7ZBbRgK9Gg9eNSt3tdaxo7HSFvtv5odE=;
 b=qrgNKs2huN6YJ691dHgNyz/q8SpTxqymjOdutBAZwcG/8fwMssXPVb8M
 tE6i4veCIvtLE7uh00DmZSmYVYNjounjdMdZl78pUDjmioNFFHit2oAEG
 X2x85mClkmF3TlFVuA45xM84Z+vZhkiOEezHgazAAw/JIPGY3Tbx/qfXH
 hsfzPNnSAwxU1nhsknzXCCGAShL4cmMh0MO97PGGYQlU8bNfA4X/E4oo8
 iL/IdUcwDmK755rnkx9n5/4kLKbtUDOpxNaKMJu/mA4f5m5vuuqWeBaEf
 2zk16ur6Tr7nIVaIBaGnh8uTGZ6GTvC435t31aocyzzjvcrP2ah1HeQjz A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199259"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:17 +0800
IronPort-SDR: 1vnKhNL7y/jgzeyMyDjrTmK5OIWlaXZXPEsjtLVwLmjIqaEdGtPUiUyknCYWS0aq2tgJXTPwX3
 8kOq2hmRcQ594eVSxb26V7EJku/ytOyNkjUQbgVYwp+sXWED4RhBinSaOoQF1Cki6eoFRguHRa
 Wsm+wifFPphM5Z+SagKT76cteeOvXKBw6WhSYvo4jqqboauT4JAaQ+qC58Bs4qNlpHym6YtM6P
 2GSd1pFuDZCa8KZZxFfepzR3wFMlHwzqPBggSaS7vo2MJiG2zJo7+cc28VsR2kYhulBXBC7dMO
 /PY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:29:50 -0800
IronPort-SDR: Y6v/X8AUxcuVyZKe/QOTgFH4DFv/JwtFYEA1tocK+Y4Y0tcsSsWSr5p9D9uqOlg9RoeUEAnZ70
 v1vYN0X+Fj5mJvMQH1kLLhK5sv8vaKWXp4dY55hBlXjtprkqDDkUPHJ6d6gcEyARJ08e8StQLI
 My3u7Q5hIDmKk8QlkGbBoBbV6pJZav0KPr5YDJpF2NUxvjJvtq2Mhj0TFB00LND3lcFAmdE99j
 DEOeZFoFdOryLm5Lfb8Msh3DoZGvM+IXs+O7j9hgUIRQM4TaSjH2wddUsDGhcTmaWLCwmBXhbs
 wCo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Hx3dRPz1RvLy
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416237; x=1674008238; bh=CI5uErihF5w7ZBbRgK
 9Gg9eNSt3tdaxo7HSFvtv5odE=; b=RQ055jm+OukAQA03iXgKw1L1QjOXnJNy1j
 x4ofbfSDPpIDEAzPsYRsiASkLdnpEG8z3PyPTLQkiNttXD/gKQOF/+NB5lZCZk0m
 TCeXHRUY05Ye1m5jCPUZ4HqvjrDrIlGr5erl/4LOFVzox0G/Ned4cOCl7J2S9LV6
 2g1y1rdgdyY/WXRDBxBYI6s6mN+Uv4/mnVpjGKubaEru5DhIVU2xiMzHwZfwFAv2
 DvxmcBJCZWnkdOj/FAqSd27WEkT8hMzhgWbGuKJIOoEB76N/DzIZO2Qr2jKf232K
 4Vwj87JLeGa886omcAd6E1zkFK4ywpOBguF1Ejhle0/8//arp0Lw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DDNW8Vf7Fxcu for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:17 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Ht4vLCz1Rwrq;
 Sun, 18 Dec 2022 18:17:14 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/45] hw/registerfields: add `FIELDx_1CLEAR()` macro
Date: Mon, 19 Dec 2022 12:16:20 +1000
Message-Id: <20221219021703.20473-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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


