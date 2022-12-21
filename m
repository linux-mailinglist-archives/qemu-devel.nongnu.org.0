Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57809653931
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:58:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87lg-0007Mw-VZ; Wed, 21 Dec 2022 17:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lb-0007Le-7K
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:51 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lY-0000Xf-M4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662448; x=1703198448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R0UTDDb8qlNNbQTJDvqcP3kxtottUm1EerNxVeKk0so=;
 b=WNmP1s4cP65j9mlkN+LkEsDzO3mxh1isTRWN5rMAKdjDySHihHbbvomP
 Gwu3VLX9gAr8tEHUYesjoigUAiV5lYjiFKuzYO0CubmONrZ4x02VCGblk
 kcj6FqsyIm6hR+Hot3zjD3fIhROLOw+al7K6Mk/k/Ldp397HsnqbbcIbq
 1A80vC8ksXqeng3W9Ghrg2wtZmaMBw3gj9VHt+D97M9z2eRSDgTf4ulwJ
 rU9BI6AOXE7n4uyWbpskO+NWCe1PCsOZ12+0+5+AKdp8y9DnGA2cjF+lX
 TsQzFEgHkbb+AwEPvJHR4v8gm9nCbrKRLZQj6iY4Ofcqla1rW54LYk02t Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561271"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:34 +0800
IronPort-SDR: 1n6NuF+m3LKxiB5eu06GcAhrCucYjRhEWNDE8cqUSwlLmyBu9kRyqtnFUiEeJk/AUMTRNdjOKA
 22ywhD3N6eZVhRB4Ip22GoSe/cYaGFzKWFRlSUBSq1PJMXRMDQ+sajIIuQBUUm/ooBuGLY/pd1
 t6rB23Rf3xnw8UPOaeQ8vBMvjqMkAY72o5iB+WjuxmMPGuUbyiBzBQet+oKrxUBXeNTcR/mKmS
 9OAlqvtA5UkKpGZy+8MREC6ylfx8bMlTVtxYSAvY5OB8d8UvV9FdpE6q2F0dAF5lwFr6N4K6NM
 jFw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:03 -0800
IronPort-SDR: HLH4DYj1WAHg5w6PVLTfa22zBvYagVEje5qVtjNbxGesSjud0okADYhpIv4qAjw+S82b+TNLvN
 8XS+CrOt+QtHOuBXSE0WJVIEAvs29kxaQpy9nCvCc6nfArU/x7RRGfCwVrIQApvqrHqfrq2A7J
 84hJBwpzeEPlTE9gHj2TsBLaC0FNBan+dxLSylBYrV5HqqznM9zZZRey1hY55Lhhpesnmxjcw5
 3/mDOzk6n70L6addn4MUSbzHozZAo0rZ+fCpaUi2gdH0ZUepHH0RXW9Q6rqTanLsIbJtiV2zv6
 0WM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLV6nGyz1RvLy
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662434; x=1674254435; bh=R0UTDDb8qlNNbQTJDv
 qcP3kxtottUm1EerNxVeKk0so=; b=fMEfVuE5bPq2uCI56Z8SdgSFMQrcXXLP3o
 cqHOvzg7pKhKke+z1j4xR7KNdqLh8mMtyJIiuxhACjojfUHaYctjCSkuI2O8sBUm
 /OEeVu1NTZhN6RAigxBgMK5vpGGDimzkQuFfog8Ga9gdnAUcWEFfE+Cq9fDHPiCG
 wDhRdeq+2HGXXOa5ytSw42KbFhyIL8+bINECTjUFOzzJNxFXX6qi76KuyndYHayL
 x+whlHeC/nHFWR+hDoolBQFAc7gddLt/YbeqPG1HRgVFz0dvMfrEFJNL5InkuVb7
 QtSm5emphopZ33bTjkaZkxVi0G1eqgyENG78n18oW/iTFaryrlQA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BJZ6zXumrtH7 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:34 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLT220vz1Rwt8;
 Wed, 21 Dec 2022 14:40:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 03/45] hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
Date: Thu, 22 Dec 2022 08:39:40 +1000
Message-Id: <20221221224022.425831-4-alistair.francis@opensource.wdc.com>
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

use the `FIELD32_1CLEAR` macro to implement register
`rw1c` functionality to `ibex_spi`.

This change was tested by running the `SPI_HOST` from TockOS.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221017054950.317584-3-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 57df462e3c..0a456cd1ed 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -342,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff, status =3D 0, data =3D 0;
+    uint32_t shift_mask =3D 0xff, status =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -355,12 +355,11 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
     case IBEX_SPI_HOST_INTR_STATE:
         /* rw1c status register */
         if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
-            data =3D FIELD_DP32(data, INTR_STATE, ERROR, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], INTR_STATE, =
ERROR);
         }
         if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
-            data =3D FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], INTR_STATE, =
SPI_EVENT);
         }
-        s->regs[addr] =3D data;
         break;
     case IBEX_SPI_HOST_INTR_ENABLE:
         s->regs[addr] =3D val32;
@@ -505,27 +504,25 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
-        status =3D s->regs[addr];
         /* rw1c status register */
         if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, CMDBUSY);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, OVERFLOW);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, UNDERFLOW);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, CMDINVAL);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, CSIDINVAL);
         }
         if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
-            status =3D FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0);
+            s->regs[addr] =3D FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS=
, ACCESSINVAL);
         }
-        s->regs[addr] =3D status;
         break;
     case IBEX_SPI_HOST_EVENT_ENABLE:
     /* Controls which classes of SPI events raise an interrupt. */
--=20
2.38.1


