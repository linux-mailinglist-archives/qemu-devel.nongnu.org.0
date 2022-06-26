Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA055B37B
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:23:32 +0200 (CEST)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Wux-0003BB-OV
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMo-00048s-CN
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMm-0000Cb-FQ
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eZwtXKiZwI5c1fcTdneXtq4K3yDO5HLTy0rKYDtmtLE=; b=YML/Jqnt48MpoSWfwLxsGIzoRt
 BJJcwFFoFYBV7JbBu8UOXLrTjl6YLJ9LSH2WJ4r8tCT4tM+Ub3JuiD1gjh3DhC4J0SNl/r1a+2b8m
 1jOQYUtaO6z+wO8zDijKawOHDfi2yf5fe5Jqu0B1JjHYNoJnEns0KXoogzJv2XXa10MsT4UHn5zWE
 Md0p7LqIMqAtLZbqFTsRT1wkoX0poofN773fPgemXqbEI0x9GIVip/OX8pyv/cDaKoJk6++TvhP0V
 UhHjnN2wmFCuu+2gX8M4bunYYvY4sFh8KTRUKb1bpHn3TMjf2VWPy6zJaTteswfkgknESZwEBfDJX
 hweZAejBwZXP78ZR+qf4joyJt+SDUyHdNtVb9NPvbmIRdy1rV6hxFpWNLItbn+fN9VFg23JWUTgFz
 CQS0YD97LefwQM6tjqqRgwwSMtMLSWtjlRLvkkecBR3gaUAc71zfUZT4V8aRYuVjGql5njURdRlhd
 r/ENSueXnCFaX4nv84sSe9JvaxHHR29AwmS3ohWR+NSjfQ01tmxNQuZ3UoDXCZBxQdLT3j5f5MV0t
 alpR131WDjehBTVFQr6mv3KFNk9Q9M22mUcKrpxxosyvwnuvOP0znf9t++Z4WwHSf5ooxGGPJsXiZ
 i4wsJe64JjM0ipF3pRIs137A7w+4WSAig8YIXvBz0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLO-0007KY-FU; Sun, 26 Jun 2022 18:46:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:13 +0100
Message-Id: <20220626174531.969187-38-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 37/55] pl050: add QEMU interface comment
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This describes the PL050 device interface implemented within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220624134109.881989-38-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index c665a4fc99..ffaa72dea4 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -7,6 +7,14 @@
  * This code is licensed under the GPL.
  */
 
+/*
+ * QEMU interface:
+ * + sysbus MMIO region 0: MemoryRegion defining the PL050 registers
+ * + Named GPIO input "ps2-input-irq": set to 1 if the downstream PS2 device
+ *   has asserted its irq
+ * + sysbus IRQ 0: PL050 output irq
+ */
+
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-- 
2.30.2


