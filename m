Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298C59B6D4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:48:55 +0200 (CEST)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPugY-0008NF-C9
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuaw-0001Vj-Ji
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:43:07 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:43024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuau-0003Bt-U3
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661125384; x=1692661384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xMaY8NlwoSvGdUIAmYJVI0+3gJBYtjFwCsHeIDt7NGs=;
 b=INkECxUAvqxd1jz8eRPoXifd5loDWejHKxRrMb9UMnIm9KtBBmPKzRGz
 hgt78pM4vK+A5UkAzC7gjcMqFUcJ6E961jcTLv7xAYlHgSgbWrmmnhdqE
 QBQ4TQXlhodhBDyIcpltB8OMUyCqADACi6iF/jfJYt/0oEf8KXTZwO2+Y
 nAwSGI4LpduLGBnRQgF2nDZBrkDoZ/czKOSlWP8zlspgxshpzUs2PsoCT
 5VMtxvKfebSrRu+DGcB5s9qkDwectL8t+FvXPNdZxthRG2Xpkmh3G0UU3
 0wqbDqVcDxlyyfnmN7GJn4+i2sGqgrnAGvy6n/1ayAd6PJoy0OzykIzH+ Q==;
X-IronPort-AV: E=Sophos;i="5.93,253,1654531200"; d="scan'208";a="209788377"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2022 07:43:03 +0800
IronPort-SDR: JYoLxS7mhjHld0Q4DJsnxCGOomBS8m/G4rZX3aC9YLeURiv0sSZy1NcXy+Z3Q7r9PH0HWGffeE
 KNXwqXGSCAEt7pkdY3GIJPAYjzNXIkAtYwLm81nXor4l93LLv4k2RJuWmRYW8TWsZQm8eoBjsV
 1K7UWbmndXQPFwHe3UMOXxqLqgIO9rXzNgASOaE9UPw62we+R+ldRWj65nl0fUI6cLTgOUUW5Z
 6nls6i9mViPACUeWlg1VvYAIvbzL2alOdCVoNulzlhw3Cgu25xTcqdWDD7TWbxDzXk906JWOOF
 +9K4U+JG5eBMEdZLwMiP4cE5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 15:58:25 -0700
IronPort-SDR: FD7vho3hu6FxgocxQ9rSwB+3snDvlF2Unn0SjPFih7/22rY67RIRaYJCkvtxJQff89OIb1i7FZ
 QsagsXOBzojK4QBezQAeFoEN1i4PahlrAiVBegV3lufjMQllWV9bTCW9lOmlH13+UDsVQfIpzL
 WWAY2mmM8HAoSxVAyHGX3b1JVL2HJUebgCIbpZzlO2JJJswPg3IdNOPGarw2zVMJOl1Plzsrq8
 CKTQre6wu61q2Xns/GJ/lTSRZZUjuqdk+P+MW+WLbyIs84Xpu+JlkuH6TEHSD6TWpORJtOJWkb
 azQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 16:43:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M9sVt46sVz1Rwnm
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:43:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661125382; x=1663717383; bh=xMaY8NlwoSvGdUIAmY
 JVI0+3gJBYtjFwCsHeIDt7NGs=; b=rpgHw5fgfIQJg1AxmkN1WZ+T2dQDg+t2iu
 FSFOjDewSJ5iS4FD+Mut41qBkX0QWUdWf6x9ClCt383ygZyNKWxN91CDJAMVOz33
 6JVQaWdgZNrN2szl0DB1L9ngQCAUwrpk9OAqDc0xkGZcecVMtwvGKdXKcipzdJMA
 AG9EuUtXcRELL/NaED/6ymQXg5+/LBtXl47Ob8fiPDAhKY3qoxalWmQBWPkzC9Pc
 rIyYiTTW+iHk6nwgmL78YpfWYggFbm1VMoMnBZI1BbyHZJwzCx7Yxpzfb0jE5TEi
 N2b33ZeYSxRzWEwtrO0emhjY0Z6t3R9zVOsibftkgDrUR1A59Rcw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id H4jviKen7R3V for <qemu-devel@nongnu.org>;
 Sun, 21 Aug 2022 16:43:02 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M9sVq4Dk9z1RtVk;
 Sun, 21 Aug 2022 16:42:59 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/4] hw/ssi: ibex_spi: fixup/add rw1c functionality
Date: Mon, 22 Aug 2022 09:42:00 +1000
Message-Id: <20220821234200.34052-4-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
References: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=225a36311=wilfred.mallawa@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

This patch adds the `rw1c` functionality to the respective
registers. The status fields are cleared when the respective
field is set.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c         | 34 ++++++++++++++++++++++++++++++++--
 include/hw/ssi/ibex_spi_host.h |  4 ++--
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 1298664d2b..3809febb0c 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -350,7 +350,17 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
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
@@ -493,7 +503,27 @@ static void ibex_spi_host_write(void *opaque, hwaddr=
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
--=20
2.37.2


