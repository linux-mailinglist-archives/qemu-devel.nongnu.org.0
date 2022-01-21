Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E04959C1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:10:44 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAn8E-00021e-12
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:10:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwu-0006jr-Ls
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:00 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmwr-00040j-JB
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744737; x=1674280737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hU2WmKQQeLgEXMyHGtbPPfKh2Fq7t2kR6q9L6sZTy4s=;
 b=c99f6YGdojmVy+aB2DYkHr2FCYFEAwn3F2EIIfEOiFl04jGePdx3zRB3
 gwjLtXi3B/qXgXqOm/lirSt0ydGgRoXvpFnEyGZSct64m+AwQo/E5sRZb
 srDdzcIoJ1TpuIRAVpxRCNz2mLE198fByq957XUbjAGDuummCodJ/Mze0
 C4N3xWTF5/fA3KijY8XdObgySlyLv1HwtNC7aRLaxFdbjr64zroSt5doB
 0NHRGi/pWWTwztUYrAGsGy5f6noh4/3gCN3Ew13iv7G0fyGwwdO8Yrxtd
 38l5GwrYnihG4ElpPMwzAeeBAgx9QV+bX4Owd3x06JNsv7LjKGNhUUG0B A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976476"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:58:54 +0800
IronPort-SDR: gwUvqUz9aMq3H1RqgzB61waVBQbND0jiANFT6gNpPTxUzrUwJD89PrS1QPVgLmvl4krkY8m4nZ
 4Yd4+ffcMi5IGeHrAyPbOS87k4iIO8a9bPKC1JGYJbI1UtBHU6LHE4b9wi6K3rS6pDY0zJ2e6L
 O7qvl/MjnMXODcd+jEOcUgJ0awNr5v4HQ8pqVtkYp4dW0DupOLIR48c29qZMBNi5+ndyRV3B+e
 35A3DzYUVwe02AtiFAcCrE2awisFsbx5ymuicw3bEfjTY4JACrdnC+0kUcTUxmW0tHnUZbPPFK
 xLedxYnaaJknCNvMc/6GZLIa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:05 -0800
IronPort-SDR: UNJCt9YEyxQOyY7UMxx7BukH3zv73uh1Zq76onh5LjvVneNnqUvejAlJbllgUg6sfu1Lw5oybM
 rfU0LqGIEulFuFz6PKACHS8JdE+gc/xjNL/3VIFpFfOWXDhURyI2FtBGb7xXBtmeu/jc8PrjC2
 rnd1pFdaTPP5CUsp9mFynhzxVORqsSFch8IRUvz3cxRdAWwiIM4DAR0WPI3Nt80KEtfv5qQDev
 YDJ5RCi28O8g6kJmXXOw7niDKdLA0+psyueIfzvcaAeEReiHXZEhNNvQbJqpPuI+i0ktMnyWfO
 xtE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:58:54 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7wt0PVYz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:58:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744733; x=1645336734; bh=hU2WmKQQeLgEXMyHGt
 bPPfKh2Fq7t2kR6q9L6sZTy4s=; b=Ng6xAUyinqD26DPvFxPJK80SvJcWF1r1Cq
 +5W/NpMNaKRg3FGZWTy9P+aXD8559Le8jjmqhilgXjTjZd3y4Pn7ivumQKic9Ygl
 vTQqg9fVjo1w72XxP3rckSyo3gX7cpM0WS1VR8BIKLE8B2+mu/ReF8JaXJY0bbRB
 SXttp/+xno7MOaWkbtpArDlwKEwz6hjb91d2kVbMTti6jYM1AtNs6GjKfm/qjKjD
 +1gdEHGuVXa9xTr34bQ+3rQTrW2MvSmDi0YW8OTWFgawDpkB0goqmy8GIqOdLFzM
 /i8SPJg03eXyd/mIH2BomuGLZL5LzCsNSNpb/miTfqJUqVB+fUsg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gvCqbm1yB9AA for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:58:53 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7wp1jJbz1RvlN;
 Thu, 20 Jan 2022 21:58:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 03/61] hw: timer: ibex_timer: update/add reg address
Date: Fri, 21 Jan 2022 15:57:32 +1000
Message-Id: <20220121055830.3164408-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

The following changes:
1. Fixes the incorrectly set CTRL register address. As
per [1] https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table

The CTRL register is @ 0x04.

This was found when attempting to fixup a bug where a timer_interrupt
was not serviced on TockOS-OpenTitan.

2. Adds ALERT_TEST register as documented on [1], adding repective
   switch cases to error handle and later implement functionality.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20220111071025.4169189-2-alistair.francis@opensource.wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/timer/ibex_timer.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 826c38b653..8c2ca364da 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -34,7 +34,9 @@
 #include "target/riscv/cpu.h"
 #include "migration/vmstate.h"
=20
-REG32(CTRL, 0x00)
+REG32(ALERT_TEST, 0x00)
+    FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
+REG32(CTRL, 0x04)
     FIELD(CTRL, ACTIVE, 0, 1)
 REG32(CFG0, 0x100)
     FIELD(CFG0, PRESCALE, 0, 12)
@@ -142,6 +144,10 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr=
 addr,
     uint64_t retvalue =3D 0;
=20
     switch (addr >> 2) {
+    case R_ALERT_TEST:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "Attempted to read ALERT_TEST, a write only regi=
ster");
+        break;
     case R_CTRL:
         retvalue =3D s->timer_ctrl;
         break;
@@ -186,6 +192,9 @@ static void ibex_timer_write(void *opaque, hwaddr add=
r,
     uint32_t val =3D val64;
=20
     switch (addr >> 2) {
+    case R_ALERT_TEST:
+        qemu_log_mask(LOG_UNIMP, "Alert triggering not supported");
+        break;
     case R_CTRL:
         s->timer_ctrl =3D val;
         break;
--=20
2.31.1


