Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5A5708A4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 19:07:32 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAwsd-0006Rq-9G
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 13:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DFXMYgcKCgU0jsyzwjlttlqj.htrvjrz-ij0jqstslsz.twl@flex--venture.bounces.google.com>)
 id 1oAwd5-0004y2-Hm
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 12:51:27 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149]:35381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DFXMYgcKCgU0jsyzwjlttlqj.htrvjrz-ij0jqstslsz.twl@flex--venture.bounces.google.com>)
 id 1oAwd3-0007Yt-MM
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 12:51:27 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-31c936387fbso48763397b3.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 09:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=CS03g6LdUzLlF3X/TJXikbBtMI46Jvzm72BrBzkJ1i8=;
 b=PPhQOn9jkKVIy4EjQPlzMIkA/NHYOWRqAd2VLjobLHTuYWqNYIZxN717f3fUcVF9c5
 6HvbM4x+pjTDC05X5FNpD4NegKO9KP2oxvsfj80CgnEJC4DGYM8Q8PNx3eOOiq2JlCL3
 JlMaiOtVNZ7gShDDelRVqSlNy8iSZRuof+t6mJkAhMt/6dzVG4KViibBIlTsjF7/tJhE
 daTDdn9zY09nLyECSRsvRg3qdKidiYocjPMcyqrq8txQAlG2y+D1ngK4a+bc1e3pgpIK
 oTGD6TU1aJ9wSuPxXI7kkLsCVcQIAebRMTxzGFz4KI5nFh8mgf37pjxiOXGUqsNL9PXo
 zKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=CS03g6LdUzLlF3X/TJXikbBtMI46Jvzm72BrBzkJ1i8=;
 b=fVJUvVdw8m8u7Xla558MI3BES0m+wwmFxSTTceOEXdnw/ouHDAFgWLKl5P4TX2gksH
 jcvuLjQ2Fb7OQ/TJCmbG8joRtqGi2zyEx/N36LgX1Gp4CCJXhSq2+IfaO3JHrEkUFEu+
 KyUq5Z8QwGs/QO7dteW8IG4uSDsuMBA/pDPDmRc+sbL0dgJ2O4SAf1dLuv/t4LCEiL9z
 ssObExcMi1O5VYov5z9vkwRjnGeP4qK55E7Fgi3z99JzzN5PR4iui2BpVV7wx3IueWch
 tdGPHvTJtrMb3WxUOGIWCR01Y+CUrVwybuQNd/5rHQrA72fLbJRfjnXghBVkQfm2skdJ
 xWzQ==
X-Gm-Message-State: AJIora+K+ECuHv/8e2w/JbPcU5jLAzZeKyLY0K+NKxlfEZJJXR6g0eS7
 6EPmrh9V8ve5klKZOnrncBkgYpkICER1
X-Google-Smtp-Source: AGRyM1ukpFuYN7ZEL4/dTieGA/8zz2XF0kLp28znsvFy2dxNlwbe781RAkGQWbs/c6fSJ6Rllu4dMLnFrZzY
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:cd82:31ee:d030:c73c])
 (user=venture job=sendgmr) by 2002:a0d:dfd7:0:b0:31d:6466:3485 with SMTP id
 i206-20020a0ddfd7000000b0031d64663485mr8819808ywe.509.1657558284043; Mon, 11
 Jul 2022 09:51:24 -0700 (PDT)
Date: Mon, 11 Jul 2022 09:51:19 -0700
Message-Id: <20220711165119.2591835-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH v2] hw/nvram: Add at24c-eeprom support for small eeproms
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3DFXMYgcKCgU0jsyzwjlttlqj.htrvjrz-ij0jqstslsz.twl@flex--venture.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
v2: Added comment describing the new behavior.
---
 hw/nvram/eeprom_at24c.c | 56 ++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index d695f6ae89..eb91ec6813 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -45,6 +45,8 @@ struct EEPROMState {
     bool changed;
     /* during WRITE, # of address bytes transfered */
     uint8_t haveaddr;
+    /* whether it's 8-bit addressed or 16-bit */
+    bool eightbit;
 
     uint8_t *mem;
 
@@ -87,7 +89,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;
 
-    if (ee->haveaddr == 1) {
+    if (ee->haveaddr == 1 && !ee->eightbit) {
         return 0xff;
     }
 
@@ -104,26 +106,35 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
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
@@ -133,12 +144,16 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
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
@@ -150,6 +165,13 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    /*
+     * The eeprom sizes are 2**x based, so if it's strictly less than 512, we
+     * expect it to be 256 or 128.
+     */
+    if (ee->rsize < 512) {
+        ee->eightbit = true;
+    }
     ee->mem = g_malloc0(ee->rsize);
 }
 
-- 
2.37.0.144.g8ac04bfd2-goog


