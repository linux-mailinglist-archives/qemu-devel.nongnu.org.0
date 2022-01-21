Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CE4959C0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:10:43 +0100 (CET)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAn8E-00021M-06
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:10:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwr-0006jA-Lc
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:58:58 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwh-00040G-Ti
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744727; x=1674280727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTUeuDOPS8TLMYomzQ7t+tG/Y8qjZkpTXIbQk5JIizA=;
 b=OQ4okP01rm94bt1jZKn1enq6vzIiL6nVJzw6SgsfbP1l5WnAxotoeISi
 c8J3JesxuBl3y98EcS+LsqtqN8g1XTtJSbXeSOSBpZtVrw/qc1v13LC07
 YZ/puyyCvU/ErUGRpKlN6AmKzbi/7joXm2mhAuTZpDulIWrO7Sz/TgFwB
 ueUSXgEEDKHDvnqu3Pqqb+Xpn4GY2X6hd1aokbUE1olqF1bilMwFpMUrN
 8Uo4KR+w70X1qZTUoMsV1aTPC93tzMSUyKkAkV43cjlRD9crLO83wDgRP
 8T9GaeLVxTqJm5XagW+zFystIsTLRecM3R7zrzODaGnztpoY7cuJgKnrI A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976469"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:58:46 +0800
IronPort-SDR: GZKZEXCV5k7ZI48RrevjLJUB7nZGV6qTVkV6XD6ArSRXmdkcVzyqm5IXsnyPhHHGfDLjhMiE+s
 XjXL//fDKyfBTrEiYL3qiHQGbZuyL3AgvD3WljPsFNKD5CR6EFTRlrDzDEz10AoId+tk6/Vg2g
 NpPWYOjJbw5oauGzPNm4CBoCDX+4UAxXzUdAsrw0w3xWqpYyGfmrjTv2IBf82rqe8tWic8vDjp
 CNINm0ETOYaM2T7baiV381G/1Be9P5WnHIHFk9BtLEBuimJitbdLUGSEqKvrSfthZhXPA9zuxq
 jr+b+bW63QbofV4EocKaqwDv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:30:57 -0800
IronPort-SDR: Cmm7MVb8lk2z5iEwnZlTpEs0ZfjsJh7edax8PyYcivlW0YF3DvvFdNzZWnTSQ0C7c/0yIWZXay
 4OTy6s+xrBIQLAUUO/o+bVURSGkZC+5cyyqB/Ri0Iw/embrMcRnGlxQm5ll6jUeONXIFAr/SzX
 aAgjhCIWJ5suWxusO8ktUkE8C2TZYclqsHGKs2Sai4OlL0OY4iDkSdNcHObGnFI8lUkNeOoPbm
 fR/DIckUczTLSF8iaG8opsHbJKXhGAR0Uo6OZJufIg0toqb9SU0SNiX/4Q/g0R7P+H570MNUh9
 234=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:58:46 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7wj62CWz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:58:45 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1642744725; x=1645336726; bh=uTUeuDO
 PS8TLMYomzQ7t+tG/Y8qjZkpTXIbQk5JIizA=; b=O1YdTcQJbktg2TcL5XD+pjf
 lhGkfdtFPX+gOZThLDVbP2xzfUq5+OZljUpUBYO/m02JvNHHMvaJzGHDXzFdZprh
 2IXl867O/zD2b1aA4zvvaJD/Go9BEEFBrnQSl7IUpaLfgr7tiROmnGai+f84Tvph
 +ZmeKy1PxuJ9LjP27Soj7CKJvdfqYfYzyTVz0m9Y/FzdX3K2ReprT6NeWjgWYIWf
 u6/IKB/VPGSSpnqhhr6hcZtXUMR3sA59UW7wbeZCvWqHJAgrXJIF4KwebHffQ8jp
 gvKrjmYM4TM0auHOBnBP10ChqNuYhXSz5S9P0qssKlgsWaKcGYv/q4Kk2wN+HXw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2EVTQpzFCNmt for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:58:45 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7wc50psz1RvlN;
 Thu, 20 Jan 2022 21:58:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/61] hw: timer: ibex_timer: Fixup reading w/o register
Date: Fri, 21 Jan 2022 15:57:30 +1000
Message-Id: <20220121055830.3164408-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This change fixes a bug where a write only register is read.
As per https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
the 'INTR_TEST0' register is write only.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20220110051606.4031241-1-alistair.francis@opensource.wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/timer/ibex_timer.h |  1 -
 hw/timer/ibex_timer.c         | 14 +++++---------
 2 files changed, 5 insertions(+), 10 deletions(-)

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
--=20
2.31.1


