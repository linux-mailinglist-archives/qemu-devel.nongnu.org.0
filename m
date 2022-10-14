Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F715FEA36
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:12:04 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFnY-0002CK-1v
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFb3-0002bj-4Z
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:11 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFb0-0001sU-QM
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734346; x=1697270346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvQpTxAt7Jwe815We3BWQr037VMPQp+0sj7tkdyGg2k=;
 b=dO7ULAHFakZeNKiplDabXV8Q8aNOEnzFicvRQseZBi3m5cqY4DlzNxBz
 NHNbFXm2LcCJtV4purVLo3zn/lYXPmDrrzzNWH3aXu6ZyS9jIpqKKZQZd
 cHMsUogaNfcO1br0CxcQI2Pf4ZcEt06NOSOg7+Wp+DDaAZOOYbTTlBkHQ
 FN6FHUevi4eBAyNZqCLeT8AfaeFL0QKwagYVJQhFle4VoKksm/RoySGq6
 JK4rs+TojoaqQ2PHc3jmalO7zWmi65gW9tl5SwKfFENS6OJGxeD3U+F/R
 iccNU99NgFVVcio9Y2HO6XNRbvBRQ4lwfC3u+9sYt6wFHYszj5UxGmnij Q==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="213790427"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:59:05 +0800
IronPort-SDR: NpUL7me/zLTm0Uonq0G1u03jO72uY2MZdzgB2Cj2GE5/tAwOKTWLsghu/E+pRqjLX/W0SGQeTp
 kd1x6/81dXailK3WXt/zu6JevUxDmrVBWvV9jMEVzMFMDQrj88hGzJ5YCcpGH8THUI/GmSjQ4Q
 G26l9Up1ooIga92gpi1JtNVJipugHVNXb1DMj9Y7KqjrSDu5nJpP36XcC3cjdO3E1HfCRN98jg
 BX7gk5WS8CkEWohVJtWo5ennRzlgY6Li2ai6F4jRcSS0eOGgYs2Zp/xKNswIFH55nCKMTSCcLk
 KY/z4VNTnCLQwu/jiwkJxbiv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:13:04 -0700
IronPort-SDR: nrY1lHwX/jaYYVqHS+gyTdBYf9//d0WTOqoPVYlh4euoDOJ8rlmv6LDL6j6uF+PvShfJtIBEZW
 Sd1q6NUcgUUC6ouA8ucgAjMPWom1cRnoHfZJCalfkYoRlK5fxVdQRAVxNRBHEOnZReij+BM/HW
 oJpPZO5rY3YCU5UU3Xg0DfLrI0j+TOJbg3WG5wABhigBAZk/ULYG4I+nnIA/PQ6UzqEgT+Jt7Q
 ph5mKy+oaFRfWQo2p03F8yQJ6k/alUklGsMp9+n86if/1lxWg75z4tZ/ewV4d29ke5+ysp0Mlj
 Xms=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:59:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf0n1HLSz1RwqL
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:59:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734344; x=1668326345; bh=NvQpTxAt7Jwe815We3
 BWQr037VMPQp+0sj7tkdyGg2k=; b=ghvTIYIAC3MbCGH/vPMlAfSSEMLvLXqN8F
 6Fg2csy4vwjZvpKTRQZ3FKdvHhE6icUCTsp4iTFlEg9fokMHmSdCBgh6+qzsMGeD
 38DRhgNOjsxdWEPTOfspKqo75H3JY6QT3zwpjKPDEyboiRo3A4LL169UaDdDoP2/
 vcmYP/ym1hFi7phsDy3GXIJPWWCtan/g+2FDKL/YE5Vsjuppl0/tG4Hz5b8q/HWe
 w3xEI0f33fvtI8pjvwcaIYhE4kFnaR8+wFRdql+q/GfcrF5vUY6KaunLx5SA7Kxz
 paEE7tY14RgT8tz3/boNwBdCN6SIEa1OJfXJQgm4RqNxxwNLMZsg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1eMwV4MkrFvy for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:59:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf0h2vLpz1RvLy;
 Fri, 14 Oct 2022 00:59:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/10] hw/ssi: ibex_spi: fixup/add rw1c functionality
Date: Fri, 14 Oct 2022 17:58:23 +1000
Message-Id: <20221014075830.914722-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch adds the `rw1c` functionality to the respective
registers. The status fields are cleared when the respective
field is set.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220930033241.206581-3-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/ssi/ibex_spi_host.h |  4 ++--
 hw/ssi/ibex_spi_host.c         | 36 +++++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_hos=
t.h
index 3fedcb6805..1f6d077766 100644
--- a/include/hw/ssi/ibex_spi_host.h
+++ b/include/hw/ssi/ibex_spi_host.h
@@ -40,7 +40,7 @@
     OBJECT_CHECK(IbexSPIHostState, (obj), TYPE_IBEX_SPI_HOST)
=20
 /* SPI Registers */
-#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw */
+#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw1c */
 #define IBEX_SPI_HOST_INTR_ENABLE        (0x04 / 4)  /* rw */
 #define IBEX_SPI_HOST_INTR_TEST          (0x08 / 4)  /* wo */
 #define IBEX_SPI_HOST_ALERT_TEST         (0x0c / 4)  /* wo */
@@ -54,7 +54,7 @@
 #define IBEX_SPI_HOST_TXDATA             (0x28 / 4)
=20
 #define IBEX_SPI_HOST_ERROR_ENABLE       (0x2c / 4)  /* rw */
-#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw */
+#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw1c */
 #define IBEX_SPI_HOST_EVENT_ENABLE       (0x34 / 4)  /* rw */
=20
 /* FIFO Len in Bytes */
diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index d145a4cdbd..57df462e3c 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -342,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff, status =3D 0;
+    uint32_t shift_mask =3D 0xff, status =3D 0, data =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -352,7 +352,17 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
 addr,
=20
     switch (addr) {
     /* Skipping any R/O registers */
-    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
+    case IBEX_SPI_HOST_INTR_STATE:
+        /* rw1c status register */
+        if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
+            data =3D FIELD_DP32(data, INTR_STATE, ERROR, 0);
+        }
+        if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
+            data =3D FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
+        }
+        s->regs[addr] =3D data;
+        break;
+    case IBEX_SPI_HOST_INTR_ENABLE:
         s->regs[addr] =3D val32;
         break;
     case IBEX_SPI_HOST_INTR_TEST:
@@ -495,7 +505,27 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
 addr,
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
-        s->regs[addr] =3D val32;
+        status =3D s->regs[addr];
+        /* rw1c status register */
+        if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
+        }
+        if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
+            status =3D FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0);
+        }
+        s->regs[addr] =3D status;
         break;
     case IBEX_SPI_HOST_EVENT_ENABLE:
     /* Controls which classes of SPI events raise an interrupt. */
--=20
2.37.3


