Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C393C47A31B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 01:45:32 +0100 (CET)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mz6nz-0007Rs-61
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 19:45:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Nc-_YQcKCuYdMVbcZMOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--venture.bounces.google.com>)
 id 1mz6jL-0006a8-AT
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 19:40:43 -0500
Received: from [2607:f8b0:4864:20::249] (port=56269
 helo=mail-oi1-x249.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Nc-_YQcKCuYdMVbcZMOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--venture.bounces.google.com>)
 id 1mz6jI-0004Kl-OR
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 19:40:42 -0500
Received: by mail-oi1-x249.google.com with SMTP id
 i82-20020acab855000000b002bcea082cf7so5323934oif.22
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 16:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=7078gaAJf+uzCYVmXGnF+FGQtg5NDYOEemRIptnsdL0=;
 b=F/a8PBxnEplCsYXoclgEtjZcOQyWzoPmKLlxzdwkcnGMOhzvi/riF8Eyl1D868+IvR
 DNEmQZLAQIZ9cWs/ABXy78aE8aBkFuMJvlBOnTwF8ijSpwDdkpkDdsyk+jmT10s4Qtx6
 hzG/CMwT8hxQoMReWkoyQuS1/LmdlLZuJJEGkm4KowfNfdcBY4bp48PCFDdwiSPAHU2z
 VFi2Hg2x/B/Ych0VguW2CkVJHZeK52Kj3XUtSUvXSJGptnXcWIClzRe2yPm8EtCNgAq9
 CrYHP7UgnEsIdzTEipNuA/yWSOfuN7bVz69TE30lPjc1Vvg18n9ZaSAdvjB1HgCs17DQ
 vwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=7078gaAJf+uzCYVmXGnF+FGQtg5NDYOEemRIptnsdL0=;
 b=UP4Ovzmf/70MtwtaOYZw/vvtOPk+J5xrVWsTOeCKTpzaTZfjFs6MAGN+78iRYcIrDL
 NFS1PP0YSN06u7eoHxNzsTZ2/OVzaihP0HQBVBrVMExU2O3iA43G6rd2wvJldTCpF7g8
 s7FHIHlkPl1pRyq7IO7BiZ6lZI57H7S6UiD4Oh5W+vvPSr7AFrjdNik2l8vsv1iAZXYP
 scqm5TMKsgCFYgrIlIRuSyJ8JczCNjx5QNlarwVC/9bRTk5j+1Rtj5GCsg36uudrJvuv
 TlZ9WhXh0bidSP5NuhZLEtqjOj1dwtpvO6h6D7wyW7rJD82uKvDtzLsHzpUwC0zAtfo5
 hwWg==
X-Gm-Message-State: AOAM5334Z/jx6N7TWMhGPdrPvpyT/PJ6v+0PIZiNn/1maYQaMheO3t/C
 RJoUhFt+XqS6TwqT+7HMbYkO4BFFPZ7/
X-Google-Smtp-Source: ABdhPJwaJ7FMnSZUf+aL2l6dwMNDDFnzIYoBWoVEXwFzd/fKPf5H8DjhtIDW/ncqoN6Buhxg/DDOavPjUUu2
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:2a5f:489a:1bc5:ad6c])
 (user=venture job=sendgmr) by 2002:a25:e090:: with SMTP id
 x138mr18908944ybg.501.1639960373956; Sun, 19 Dec 2021 16:32:53 -0800 (PST)
Date: Sun, 19 Dec 2021 16:32:40 -0800
Message-Id: <20211220003240.1081986-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH] hw/nvram: at24 return 0xff if 1 byte address
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::249
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::249;
 envelope-from=3Nc-_YQcKCuYdMVbcZMOWWOTM.KWUYMUc-LMdMTVWVOVc.WZO@flex--venture.bounces.google.com;
 helo=mail-oi1-x249.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

The at24 eeproms are 2 byte devices that return 0xff when they are read
from with a partial (1-byte) address written.  This distinction was
found comparing model behavior to real hardware testing.

Tested: `i2ctransfer -f -y 45 w1@85 0 r1` returns 0xff instead of next
byte

Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/nvram/eeprom_at24c.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index a9e3702b00..184fac9702 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -62,7 +62,9 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
     case I2C_START_SEND:
     case I2C_START_RECV:
     case I2C_FINISH:
-        ee->haveaddr = 0;
+        if (event != I2C_START_RECV) {
+            ee->haveaddr = 0;
+        }
         DPRINTK("clear\n");
         if (ee->blk && ee->changed) {
             int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
@@ -86,6 +88,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;
 
+    if (ee->haveaddr == 1) {
+        return 0xff;
+    }
+
     ret = ee->mem[ee->cur];
 
     ee->cur = (ee->cur + 1u) % ee->rsize;
-- 
2.34.1.173.g76aa8bc2d0-goog


