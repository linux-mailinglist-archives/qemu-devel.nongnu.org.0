Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172655EB69A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 02:59:52 +0200 (CEST)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocyww-0000R7-W7
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 20:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=26253d5f9=wilfred.mallawa@opensource.wdc.com>)
 id 1ocyvB-0007RV-Vm
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 20:58:02 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=26253d5f9=wilfred.mallawa@opensource.wdc.com>)
 id 1ocyv8-0007wJ-DD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 20:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664240278; x=1695776278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zkuza5YoW1bBRMz8l5OoICr1gdHHVOvq9V8RqOY35fs=;
 b=F2Aaj4lfqaztoFFzcyhAOp6LgXiV7Q4Iw1pXwWOINpafBEL+sdQMYZtE
 XOjYJl5syeSXymtZZTaQjJmOqdQHJQ9Ql/xY6mAmjQOlDdKqPXkxmYVSE
 T8b/SZ27oeToTxnT+uXWtjki+5FP4KmEzNeqJH+fdsH5O0jOssCYOjWQa
 bQZ/mGg4fGRFMHINDRDs7SFpfdScKLJ68MBXT92BuDLDhhezHMn9u2L6g
 zMO67dqTPemY0fYnF6tve8ezrFyHRvyKxZ48cxNkWLbnm0p2UVR1Uo9t3
 VnnANO8q42v8p52LaQG0vi3/0wGf3+WI+luhas+t+oeOBFbwcVKzqjI1u A==;
X-IronPort-AV: E=Sophos;i="5.93,347,1654531200"; d="scan'208";a="316614277"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 08:57:52 +0800
IronPort-SDR: IOEOGM5a6xVbfeXd080+vI+xOfmV5ZiSDSDqL3S5Uj4Ax9Hn6H+viJ5F8plERba+kh15TpsZdi
 ApcAI+LePwsSMi5Lxc2/WyC6y9hrwZpHaSrR9eeFtmDNUXldJcm/GJHh1OVrOP+t8QHbRGvJW+
 Pf5h8wsat4zLBmTBZB7zA8B/GcMRgLMr+vkyt4qnhzafTJDecxFRdivEAMyz0L8v5pDWYAnVLU
 uCaPNkWDnJ9PDaLLEUHaMUGOPdNPG9dTezkgriZPfTUyH8BIJ6oijgsEHsaeDM+LkcwVfTqRLY
 P4tZa0mFk5YzSS8FRz70zW32
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 17:12:18 -0700
IronPort-SDR: 0uBkB8zZXQG1CwVTQwfmbUMx8SkMep7WYMWovZlovOPc0YVijBB1oQlGGOhwY+uMB7x7WkYvga
 uCdlD/fOR3v+w85/1htTSA5HWxSJJn8n66C/IFKF+Ri/CUWlh98cb/yXKEj5OEAIx7/C6vjyKI
 Ve6Yss0s/oaRkZRMwgOE7kR6M46NYIcUiSkpRQMc3m1wyCnUUhjKfAwQsOUJ4MoJNTnboBs6jJ
 Jd5aFXRwWSlc2IRCY96dtW9sIAF/msmS5gbBu/a/n2QwW6ACYX4v04IwBGvJJAS0eSaw/uM96T
 qt4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 17:57:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc1Sc1tsYz1RvTp
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 17:57:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1664240271;
 x=1666832272; bh=Zkuza5YoW1bBRMz8l5OoICr1gdHHVOvq9V8RqOY35fs=; b=
 DCtq9w7WJxsdABtRFe3iuOWcnqQnHyDOR4sJNhOf9D8ROiHcjye6DbmmU9emq3uI
 acxz1Hs0E4EvNzY83CGXRy/dW6BuLdOkZcA5myznzznJwsVRAI7ACh/Gusa19OQS
 ocAoY1JwgP/tcbQxlaSgld89s7CXEqxe6b7TNGSzQFAHVkS610aEIMkYoBbvWobk
 ZPk2YZGFDkyzoj6SgI1+ZpI07pdDwfbGNGG0guaJK51+oKwzCMuLdz5nEFewdL+7
 IZEDjAH315lbD71gfzlWo9z+mpG7EmfYzAvNaj7U6yS7pzoNWZSPbNmcpndHvIgt
 HUvJOLw3bd4g2Hyp7bj76A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JPCcYGpSzujC for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 17:57:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.53])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc1SY6FWPz1RvLy;
 Mon, 26 Sep 2022 17:57:49 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: alistair@alistair23.me
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [RFC v2] hw/registerfields: add `FIELDx_1CLEAR()` macro
Date: Tue, 27 Sep 2022 10:54:31 +1000
Message-Id: <20220927005429.146974-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=26253d5f9=wilfred.mallawa@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Changes from V1:
	* Instead of needing all field bits to be set
	  we clear the field if any are set. If the field is
	  0/clear then no change.=20

Adds a helper macro that implements the register `w1c`
functionality.

Ex:
  uint32_t data =3D FIELD32_1CLEAR(val, REG, FIELD);

If ANY bits of the specified `FIELD` is set
then the respective field is cleared and returned to `data`.

If the field is cleared (0), then no change and
val is returned.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 include/hw/registerfields.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 1330ca77de..4a6a228339 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -115,6 +115,28 @@
                   R_ ## reg ## _ ## field ## _LENGTH, _v.v);            =
  \
     _d; })
=20
+/*
+ * Clear the specified field in reg_val if
+ * any field bits are set, else no changes made. Implements
+ * single/multi-bit `w1c`
+ *
+ */
+#define FIELD8_1CLEAR(reg_val, reg, field)                              =
  \
+    (FIELD_EX8(reg_val, reg, field) ?                                   =
  \
+    FIELD_DP8(reg_val, reg, field, 0x00) : reg_val)
+
+#define FIELD16_1CLEAR(reg_val, reg, field)                             =
  \
+    (FIELD_EX16(reg_val, reg, field) ?                                  =
  \
+    FIELD_DP16(reg_val, reg, field, 0x00) : reg_val)
+
+#define FIELD32_1CLEAR(reg_val, reg, field)                             =
  \
+    (FIELD_EX32(reg_val, reg, field) ?                                  =
  \
+    FIELD_DP32(reg_val, reg, field, 0x00) : reg_val)
+
+#define FIELD64_1CLEAR(reg_val, reg, field)                             =
  \
+    (FIELD_EX64(reg_val, reg, field) ?                                  =
  \
+    FIELD_DP64(reg_val, reg, field, 0x00) : reg_val)
+
 #define FIELD_SDP8(storage, reg, field, val) ({                         =
  \
     struct {                                                            =
  \
         signed int v:R_ ## reg ## _ ## field ## _LENGTH;                =
  \
--=20
2.37.3


