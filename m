Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394714D8E9E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 22:20:58 +0100 (CET)
Received: from localhost ([::1]:36092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTs7c-00048H-RU
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 17:20:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3oq8vYgcKCtcO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1nTs6G-0003Jr-QX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:19:32 -0400
Received: from [2607:f8b0:4864:20::114a] (port=50342
 helo=mail-yw1-x114a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3oq8vYgcKCtcO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1nTs6F-0002bI-6u
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:19:32 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2d6994a6942so142473747b3.17
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=tIOH1nFSv+jDNX4oIuvTAdCyo3qdqxDZBL3Q1OvuhW8=;
 b=JDpGNWTaXAhTRm8XRom3j116E5qAGAeFtOAxiJm/tcMTauGOwuAiI1TOOxY7cCnqhF
 f3pWR+xsPsoRZFiwFk2J5TLgD1aYRfHE1qfCif32kAwNa8jXE9jAbEywjiu2c0DBpH8s
 b272zrB1k296AExSAPqMuO3ZmcomrzKkjvwM5hM5i0VpEptleKMbMzFmDGINQdrzD2Rf
 inaLQVzSI5x1k6sbf6v7n4WGNfuuD3R+kkFqSO/xKJsmCk26ZyuxD7gO2zWht9OutqZi
 DslzOY26loUtRcrPoG30izq5qBIrlD35pQWLfMpzMCZxL0Ep08+YGz6XIut6b4UnhITr
 Mvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=tIOH1nFSv+jDNX4oIuvTAdCyo3qdqxDZBL3Q1OvuhW8=;
 b=rvKn+Rl0Pc67BDq6NFeNk552gJvhvZQbluFeCrF54P+CXp2UWKVKnCX4fnsvGdfnf0
 GS/9EqTDPCyUISOaXpXeM/6JZ97BfnCmV8f6IpypElwi80cM74cx7+kGVaZrqXUhCg/w
 /xQYzBWDsuTfXZ3dd6TeLzEWUPUDdUl3ze+OmCtB+uMnsFcTLld6MQg2Dx3suvmvwKPy
 ybf2AXO4UWDA5GUFc083dp2mXVNURwCeEVPXE5cDAgDR0kUregfcjqj5dBZ5swzTrLJw
 KGFPLeUX+8U+Na66By9gOd+SDlvQawwZG48LtKVbe/Iq15Gx6cQ9mVwAob+fw6A6pBZe
 InPg==
X-Gm-Message-State: AOAM530bDZEVBS9OUiOstFKD0ySpTeNjT1sId9+OAwcNyxXXqTzBg7QD
 Qb+gZl0XBB7TzQz4xhOVGRcl+3cDEX1J
X-Google-Smtp-Source: ABdhPJxGe1sfkTwZyNAq3FLFeDTVDUEwTbL6AQMRiXuJFA9x/gIm7vzHP7joHCBm+eB9KCK6Wh3hw4astvJt
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:dc88:e62e:3209:cc2b])
 (user=venture job=sendgmr) by 2002:a25:c5c3:0:b0:628:b6f5:f721 with SMTP id
 v186-20020a25c5c3000000b00628b6f5f721mr20183136ybe.624.1647292322884; Mon, 14
 Mar 2022 14:12:02 -0700 (PDT)
Date: Mon, 14 Mar 2022 14:11:58 -0700
Message-Id: <20220314211158.4053690-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] hw/nvram: Add at24c-eeprom support for small eeproms
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::114a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3oq8vYgcKCtcO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Tested: Verified at24c02 driver happy and contents matched
expectations.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/nvram/eeprom_at24c.c | 52 +++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 01a3093600..abf9898f94 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -45,6 +45,8 @@ struct EEPROMState {
     bool changed;
     /* during WRITE, # of address bytes transfered */
     uint8_t haveaddr;
+    /* whether it's 8-bit addressed or 16-bit */
+    bool eightbit;
 
     uint8_t *mem;
 
@@ -85,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;
 
-    if (ee->haveaddr == 1) {
+    if (ee->haveaddr == 1 && !ee->eightbit) {
         return 0xff;
     }
 
@@ -102,26 +104,35 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 {
     EEPROMState *ee = AT24C_EE(s);
 
-    if (ee->haveaddr < 2) {
-        ee->cur <<= 8;
-        ee->cur |= data;
+    if (ee->haveaddr < 1) {
+        ee->cur = data;
         ee->haveaddr++;
-        if (ee->haveaddr == 2) {
-            ee->cur %= ee->rsize;
+        if (ee->eightbit) {
             DPRINTK("Set pointer %04x\n", ee->cur);
         }
+        return 0;
+    } else if (ee->haveaddr < 2) {
+        if (!ee->eightbit) {
+            ee->cur <<= 8;
+            ee->cur |= data;
+            ee->haveaddr++;
+            if (ee->haveaddr == 2) {
+                ee->cur %= ee->rsize;
+                DPRINTK("Set pointer %04x\n", ee->cur);
+            }
 
-    } else {
-        if (ee->writable) {
-            DPRINTK("Send %02x\n", data);
-            ee->mem[ee->cur] = data;
-            ee->changed = true;
-        } else {
-            DPRINTK("Send error %02x read-only\n", data);
+            return 0;
         }
-        ee->cur = (ee->cur + 1u) % ee->rsize;
+    }
 
+    if (ee->writable) {
+        DPRINTK("Send %02x\n", data);
+        ee->mem[ee->cur] = data;
+        ee->changed = true;
+    } else {
+        DPRINTK("Send error %02x read-only\n", data);
     }
+    ee->cur = (ee->cur + 1u) % ee->rsize;
 
     return 0;
 }
@@ -131,12 +142,16 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     EEPROMState *ee = AT24C_EE(dev);
 
     if (ee->blk) {
+        /* blk length is a minimum of 1 sector. */
         int64_t len = blk_getlength(ee->blk);
 
         if (len != ee->rsize) {
-            error_setg(errp, "%s: Backing file size %" PRId64 " != %u",
-                       TYPE_AT24C_EE, len, ee->rsize);
-            return;
+            /* for the at24c01 and at24c02, they are smaller than a sector. */
+            if (ee->rsize >= BDRV_SECTOR_SIZE) {
+                error_setg(errp, "%s: Backing file size %" PRId64 " != %u",
+                           TYPE_AT24C_EE, len, ee->rsize);
+                return;
+            }
         }
 
         if (blk_set_perm(ee->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
@@ -148,6 +163,9 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (ee->rsize < 512) {
+        ee->eightbit = true;
+    }
     ee->mem = g_malloc0(ee->rsize);
 }
 
-- 
2.35.1.723.g4982287a31-goog


