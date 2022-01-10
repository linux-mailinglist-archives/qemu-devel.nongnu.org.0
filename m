Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C9C488F8A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 06:18:05 +0100 (CET)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6n4G-0000Y8-Q1
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 00:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6n2f-0008AF-U0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 00:16:26 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6n2d-0002zm-MD
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 00:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641791782; x=1673327782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cv2ZUuGwiGunwBJ79b+awlep6CGPwh33SMQrtYKqgJE=;
 b=mLFetI1R16tXRr1Wi38cxldCPduCWQFfGbXhwgufYMEbNrsp08j/SIuF
 +esQq+dISSOe2qDJSKhe6qSn7GXnaqq0FxhzlhBbuBelTVYpo7Yam4Nm5
 SQ9k8t4Rzle0Dv1ZHmQ6OmYwOTcXKahjwBjI1jWpleiumE2ZmbJHQFdLM
 j/04Z0DZyI6Imxx+35BRyFadGgoQA60Fr1J2PceLGw2OA08EHpv/AZyAE
 kpkojdlytD1ie7oraaKZkTYGsyF0gVERVL2S5mXeIiAk/bXpf8Xs9nuG2
 fLc4iH1FfXKYcehRU/AOSml9eblh6o0ga4I/V8aX5USGuG+6TV2msxDIo g==;
X-IronPort-AV: E=Sophos;i="5.88,276,1635177600"; d="scan'208";a="190071101"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2022 13:16:21 +0800
IronPort-SDR: w2HI9Veb9M1tfRs73kDUpxHJa7dZ/0ihLJ/NdpUY7vZhjfpEhNE4GfgqYv0+nsqc962gIkgMgm
 CBNK6N7WbUF2JyQI0azDoWZyig8/dYBoTnLcJCxjTOXB7VGWRbIqGjNGEUvitFuPWPfgg4FzBK
 n0q5fyGTNEQrfye2n5viMuXxcjH/f8cKp+Bh52tp4TLeq4SCSb5eahDvbiW068Cpwli+8/VVus
 D1U/KdczoTWWLmf5YLLGUVE/JsqntmsiaD/zIkHU2rSPRDgSXBP4eAFHHnMUdlG4GxRofZ5NIL
 xL6gfqPxBEgdVXlRo2Zn/vra
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:48:46 -0800
IronPort-SDR: gm0zRjMwNLvgYwdA3l8vRx6l9sGARZW+erKud9QRW0AfiPGsxuJVPeojpbZBCXCPZ6KhEvqAvz
 11Zzk3YKsGMv4rvq4DGjQdK/na/rd+uqnawc0iNTkBOKjoL4e5d6sr+U8gFhpjPRtaRRa8yhUn
 wVGVm+hEfLEDF8HWZdMqrYOREghkaqdl2bWr/WxQ8XdyOpnMnzNEF8b0W3X75trrXvZlLLcSm1
 eoaVbKrubWmk0LFUD1hmKS6QVNVWm144vE9nph41S/wWLUh8QReLTiEtRN+z7YevVQDDa59vmk
 9Zw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 21:16:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JXMVp5PQtz1VSkj
 for <qemu-devel@nongnu.org>; Sun,  9 Jan 2022 21:16:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1641791778;
 x=1644383779; bh=Cv2ZUuGwiGunwBJ79b+awlep6CGPwh33SMQrtYKqgJE=; b=
 SmKEwimQEmRi5GXtjNDwgH6MAkzP0kE0QP3qMYPuR7LjTaC3ozYMN5pCXeIYvT4s
 7XHKr7PVKjdCFeYYzps8JgmNraWf08iLiLk/I3btVzkUZqBK3aG9sF6V0H6nRwsn
 l6Llrl7fiYjj+v+WsvbBEi40UlGUr4tMea4/QAYSWzc0NJEyndulPV+A+c5IQuyo
 R1y6EBIEdNIXhkneb0iIwurZpPH6HIbH9E2dVB0EtDRzgVtlgXV+xhheOaKPZEho
 IsoVNreN1Y8tQLZIKL7YOn+EqF/8zQvmAkzlcd1dJYdC9jG69dmKHjrmzS7xKfWG
 6rNjd2254kynjeUl9dE3dA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kwP9wd2AroVF for <qemu-devel@nongnu.org>;
 Sun,  9 Jan 2022 21:16:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JXMVk0hQZz1VSkW;
 Sun,  9 Jan 2022 21:16:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH] hw: timer: ibex_timer: Fixup reading w/o register
Date: Mon, 10 Jan 2022 15:16:06 +1000
Message-Id: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=002fe4623=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This change fixes a bug where a write only register is read.
As per https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
the 'INTR_TEST0' register is write only.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/timer/ibex_timer.c         | 14 +++++---------
 include/hw/timer/ibex_timer.h |  1 -
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 66e1f8e48c..826c38b653 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -130,7 +130,6 @@ static void ibex_timer_reset(DeviceState *dev)
     s->timer_compare_upper0 =3D 0xFFFFFFFF;
     s->timer_intr_enable =3D 0x00000000;
     s->timer_intr_state =3D 0x00000000;
-    s->timer_intr_test =3D 0x00000000;
=20
     ibex_timer_update_irqs(s);
 }
@@ -168,7 +167,8 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr =
addr,
         retvalue =3D s->timer_intr_state;
         break;
     case R_INTR_TEST:
-        retvalue =3D s->timer_intr_test;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Attempted to read INTR_TEST, a write only registe=
r");
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -215,10 +215,7 @@ static void ibex_timer_write(void *opaque, hwaddr ad=
dr,
         s->timer_intr_state &=3D ~val;
         break;
     case R_INTR_TEST:
-        s->timer_intr_test =3D val;
-        if (s->timer_intr_enable &
-            s->timer_intr_test &
-            R_INTR_ENABLE_IE_0_MASK) {
+        if (s->timer_intr_enable & val & R_INTR_ENABLE_IE_0_MASK) {
             s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
             qemu_set_irq(s->irq, true);
         }
@@ -247,8 +244,8 @@ static int ibex_timer_post_load(void *opaque, int ver=
sion_id)
=20
 static const VMStateDescription vmstate_ibex_timer =3D {
     .name =3D TYPE_IBEX_TIMER,
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .post_load =3D ibex_timer_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(timer_ctrl, IbexTimerState),
@@ -257,7 +254,6 @@ static const VMStateDescription vmstate_ibex_timer =3D=
 {
         VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
         VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
         VMSTATE_UINT32(timer_intr_state, IbexTimerState),
-        VMSTATE_UINT32(timer_intr_test, IbexTimerState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.=
h
index b6f69b38ee..1a0a28d5fa 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -43,7 +43,6 @@ struct IbexTimerState {
     uint32_t timer_compare_upper0;
     uint32_t timer_intr_enable;
     uint32_t timer_intr_state;
-    uint32_t timer_intr_test;
=20
     uint32_t timebase_freq;
=20
--=20
2.34.1


