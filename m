Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ECB65063D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:18:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75id-0008CM-0j; Sun, 18 Dec 2022 21:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iY-0008Ag-FJ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:26 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iW-00013m-E9
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416244; x=1702952244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R0UTDDb8qlNNbQTJDvqcP3kxtottUm1EerNxVeKk0so=;
 b=Pmd7sxl3JiSLyDPGYTXhMYTimVkn/IXy22lBFN88maqLebhndl+NmbNo
 mVgcbuUTUuqZGbwmmSgqnDz2+CwcuyB2MSS33G42LMvIzw46YoGZfh2ow
 CJuw2+zU4oiCZxa/MbBifNbSHANlEEoucZflClreNgHn8BT5cWbzZSJta
 /S5VqUt3X19TiDCUcST5/IKEG2dgCPIy4OqxZAed15cvqceuBHqPXNyx7
 WLMs1KFOGq9DmiJnfdT+K5EZ0jXNXya7maKRlvqqnghy06bTm7DTYIgbm
 Tl38tADxnYQkzAVcJWm58v0Tux4dGQAe659s6R2b+Jc6DBoJ/+jjeixC2 g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199271"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:21 +0800
IronPort-SDR: wknXpZ5H9p8SXbejzJJ1ibWlCZ1yfb+HSvUAK5ST0rfIfjJAPjBvcVEauTILD9+qaDpZX5I2BA
 w45zru8gLF6FB7/4Yb1zXGfiPlJ2vUDvGQG2M9DPZsKWxW2L7guYhEwJNApBme5iDeQQg2wOby
 vSOZCaBFrmUdJQEPzip9d2kQWwVPcbL5sAk6+IItWeF2rGiZ67f9bsQyoPnbRSQC3XnX6gV8Qd
 sLmPeGk6fIihgSrIDRXVzANO46W2Eyz5rAdeSgPPDR5vefPFw5p0F2MX+I6gls2n6uXattfaAf
 5BE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:29:53 -0800
IronPort-SDR: 1iIhUNKUijMZJLZLEsZ0MNHvDsZxwSTvgn3RaZQp+9Tm41uGQneccOqII7FFwTMsHMWiSqcdVr
 D+1JM3PwLgEnpn4N0mqOQgEYQEDcOWk7hZLVx2qudIPmZcsFPH/lW80jjK4HicIlOfP2w4In/y
 JlmIfSHgMTimqV7rPhf6L/cUv9zyImbunq+sAX0z5HH30fhpY55L97mCiQuxMbJopdrPAHQTHC
 vZd3oA5EBZlcGFhtCK+C1J1VD89MW3xWanLbzJwY4vE66J5L+m+u4oNTtMYqZvOOh1fm45wPL/
 yaI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:21 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3J05ySMz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416240; x=1674008241; bh=R0UTDDb8qlNNbQTJDv
 qcP3kxtottUm1EerNxVeKk0so=; b=beK9Z3a6yXA+TKAea/21lac2bMAbFNNbRO
 t35tk/0K6mHZgWOk3ekNQKny54H6JKSQlgF2NfGR0cxKzKDnDmjFydPgGQxCKP8H
 GpECRw8PNBJZlBHnPpL1LUzNgEyh98l6f0PC94OMnAfLRxcDozgPJqNCpxh58qz0
 wnE64FphgI4iN3A6KEehJx0VHymjOzXoSk+Pl9k6Gig/ZWowqY29xzzxcyqIxf+I
 CdMgzdFea5+289aMzAiOMVBzYz768Fw+an8Xr0QFZW9NT0cTw0nIFbQXxr1cLXGy
 RRNKvEXbIdBtw4ZO8RJq8k8WqrRldRPgADqGIKgT8X/Ig8p/KOPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XqR75-9dbV8i for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:20 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Hy1LYjz1RvLy;
 Sun, 18 Dec 2022 18:17:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/45] hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
Date: Mon, 19 Dec 2022 12:16:21 +1000
Message-Id: <20221219021703.20473-4-alistair.francis@opensource.wdc.com>
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


