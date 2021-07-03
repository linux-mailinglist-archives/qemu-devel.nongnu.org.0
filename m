Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC83BA8E5
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:22:10 +0200 (CEST)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgX3-0001eh-2m
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgVT-0007yb-V8
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgVR-0000Yu-QV
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so10936836wms.1
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DpIkyfAuyEzLWW94MpBDpRoPQ4tAnNvYPvY7veMTLbs=;
 b=XYLFAlt7V9RZNo0iRjURDxfhqkLypLi4KCCJwMiPPj/6XjFYkGwfESsx8zSZq+oj1R
 aVK6MNrm0Wb0HZNvrfhQ1IFQvc0w2QwnR5XpQUY8lhwKpbJenjzZfWSNi+Pxpmtf7p0+
 tbYkrB+0KM0TX7Af9Fi/AYXjUyVh634Hk0FJG8DA7jO/ySWPP+ZEnrJ+tnoaxLvvFQcX
 Xpnm1IjJa5xiPavLAYmfDqsTZbS+70aYk9nzXCUWfEawWR6QD2ndsNDyOhH8kPh6ZXKn
 3hsoZ+u6T7mtZmKmw19GYk9FT/dfwxQU1iRj/xp+933nE/wgBqXr9bf2R4w+9WXIB7i3
 yS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DpIkyfAuyEzLWW94MpBDpRoPQ4tAnNvYPvY7veMTLbs=;
 b=g4/Eur4LzbB5geuPRpXenwceM6HczwhE2g6PaZVWTWL0AytMBcRIF9u1JZm8zXfFVs
 SYNHplJXb3RgvQC8Pan7pAQlP54TbK1YOoj/sM6R2bt7cpPLD8jRoRxgIC5bVWwegkRz
 gulqyL+E6IqmuELVnmmqU/wginUu2QOKbDhwcAuz01db7RHxBABl5+nqRs3kWnXMc5Tj
 33/tXxkPKNlZ8P1wuPjWLSPZTzAfVzj4CTmrgvBYsEed2wkvWfiyF4Fh1cvbvKQ8UaHj
 VunQ3yB/Eq9ngefkhcJV6IoB3DGC0l3XsF8TnOAxOqautF42qYBYiHzNw3KB5tYydGt0
 pAiA==
X-Gm-Message-State: AOAM533a3fCfiVQjh02XYVL3MKh498fMuAk6T6ThN2agKscFsCrjRU2Z
 fStL3Li9f0d64h+6wwtHFo1rmGZC4QMj0A==
X-Google-Smtp-Source: ABdhPJwyuDo+Aq+uKNzchHrrWGyNdxWyj5eBdl7/rwsCdaK7PKasNXW3JbEamCD6vufhCmh4vjjpyg==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr5461710wmi.39.1625322027914;
 Sat, 03 Jul 2021 07:20:27 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id z7sm6283638wmp.34.2021.07.03.07.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 07:20:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
Date: Sat,  3 Jul 2021 16:19:47 +0200
Message-Id: <20210703141947.352295-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703141947.352295-1-f4bug@amsat.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of accessing N registers via a single address_space API
call using a temporary buffer (stored in the device state) and
updating each register, move the address_space call in the
register put/get. The load/store and word size checks are moved
to put/get too. This simplifies a bit, making the code easier
to read.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 157 ++++++++++++++++++-----------------------------
 1 file changed, 60 insertions(+), 97 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index bbe241ef9db..db9cfd786f5 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -162,7 +162,6 @@ struct dp8393xState {
 
     /* Temporaries */
     uint8_t tx_buffer[0x10000];
-    uint16_t data[12];
     int loopback_packet;
 
     /* Memory access */
@@ -219,34 +218,48 @@ static uint32_t dp8393x_wt(dp8393xState *s)
     return s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
 }
 
-static uint16_t dp8393x_get(dp8393xState *s, int width, int offset)
+static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, unsigned ofs16)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint16_t val;
 
-    if (s->big_endian) {
-        val = be16_to_cpu(s->data[offset * width + width - 1]);
+    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+        addr += 2 * ofs16;
+        if (s->big_endian) {
+            val = address_space_ldl_be(&s->as, addr, attrs, NULL);
+        } else {
+            val = address_space_ldl_le(&s->as, addr, attrs, NULL);
+        }
     } else {
-        val = le16_to_cpu(s->data[offset * width]);
+        addr += 1 * ofs16;
+        if (s->big_endian) {
+            val = address_space_lduw_be(&s->as, addr, attrs, NULL);
+        } else {
+            val = address_space_lduw_le(&s->as, addr, attrs, NULL);
+        }
     }
+
     return val;
 }
 
-static void dp8393x_put(dp8393xState *s, int width, int offset,
-                        uint16_t val)
+static void dp8393x_put(dp8393xState *s,
+                        hwaddr addr, unsigned ofs16, uint16_t val)
 {
-    if (s->big_endian) {
-        if (width == 2) {
-            s->data[offset * 2] = 0;
-            s->data[offset * 2 + 1] = cpu_to_be16(val);
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
+    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+        addr += 2 * ofs16;
+        if (s->big_endian) {
+            address_space_stl_be(&s->as, addr, val, attrs, NULL);
         } else {
-            s->data[offset] = cpu_to_be16(val);
+            address_space_stl_le(&s->as, addr, val, attrs, NULL);
         }
     } else {
-        if (width == 2) {
-            s->data[offset * 2] = cpu_to_le16(val);
-            s->data[offset * 2 + 1] = 0;
+        addr += 1 * ofs16;
+        if (s->big_endian) {
+            address_space_stw_be(&s->as, addr, val, attrs, NULL);
         } else {
-            s->data[offset] = cpu_to_le16(val);
+            address_space_stw_le(&s->as, addr, val, attrs, NULL);
         }
     }
 }
@@ -277,12 +290,10 @@ static void dp8393x_do_load_cam(dp8393xState *s)
 
     while (s->regs[SONIC_CDC] & 0x1f) {
         /* Fill current entry */
-        address_space_read(&s->as, dp8393x_cdp(s),
-                           MEMTXATTRS_UNSPECIFIED, s->data, size);
-        index = dp8393x_get(s, width, 0) & 0xf;
-        s->cam[index][0] = dp8393x_get(s, width, 1);
-        s->cam[index][1] = dp8393x_get(s, width, 2);
-        s->cam[index][2] = dp8393x_get(s, width, 3);
+        index = dp8393x_get(s, dp8393x_cdp(s), 0) & 0xf;
+        s->cam[index][0] = dp8393x_get(s, dp8393x_cdp(s), 1);
+        s->cam[index][1] = dp8393x_get(s, dp8393x_cdp(s), 2);
+        s->cam[index][2] = dp8393x_get(s, dp8393x_cdp(s), 3);
         trace_dp8393x_load_cam(index,
                                s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
                                s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
@@ -293,9 +304,7 @@ static void dp8393x_do_load_cam(dp8393xState *s)
     }
 
     /* Read CAM enable */
-    address_space_read(&s->as, dp8393x_cdp(s),
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);
-    s->regs[SONIC_CE] = dp8393x_get(s, width, 0);
+    s->regs[SONIC_CE] = dp8393x_get(s, dp8393x_cdp(s), 0);
     trace_dp8393x_load_cam_done(s->regs[SONIC_CE]);
 
     /* Done */
@@ -311,14 +320,12 @@ static void dp8393x_do_read_rra(dp8393xState *s)
     /* Read memory */
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
-    address_space_read(&s->as, dp8393x_rrp(s),
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);
 
     /* Update SONIC registers */
-    s->regs[SONIC_CRBA0] = dp8393x_get(s, width, 0);
-    s->regs[SONIC_CRBA1] = dp8393x_get(s, width, 1);
-    s->regs[SONIC_RBWC0] = dp8393x_get(s, width, 2);
-    s->regs[SONIC_RBWC1] = dp8393x_get(s, width, 3);
+    s->regs[SONIC_CRBA0] = dp8393x_get(s, dp8393x_rrp(s), 0);
+    s->regs[SONIC_CRBA1] = dp8393x_get(s, dp8393x_rrp(s), 1);
+    s->regs[SONIC_RBWC0] = dp8393x_get(s, dp8393x_rrp(s), 2);
+    s->regs[SONIC_RBWC1] = dp8393x_get(s, dp8393x_rrp(s), 3);
     trace_dp8393x_read_rra_regs(s->regs[SONIC_CRBA0], s->regs[SONIC_CRBA1],
                                 s->regs[SONIC_RBWC0], s->regs[SONIC_RBWC1]);
 
@@ -414,28 +421,22 @@ static void dp8393x_do_receiver_disable(dp8393xState *s)
 static void dp8393x_do_transmit_packets(dp8393xState *s)
 {
     NetClientState *nc = qemu_get_queue(s->nic);
-    int width, size;
     int tx_len, len;
     uint16_t i;
 
-    width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
-
     while (1) {
         /* Read memory */
-        size = sizeof(uint16_t) * 6 * width;
         s->regs[SONIC_TTDA] = s->regs[SONIC_CTDA];
         trace_dp8393x_transmit_packet(dp8393x_ttda(s));
-        address_space_read(&s->as, dp8393x_ttda(s) + sizeof(uint16_t) * width,
-                           MEMTXATTRS_UNSPECIFIED, s->data, size);
         tx_len = 0;
 
         /* Update registers */
-        s->regs[SONIC_TCR] = dp8393x_get(s, width, 0) & 0xf000;
-        s->regs[SONIC_TPS] = dp8393x_get(s, width, 1);
-        s->regs[SONIC_TFC] = dp8393x_get(s, width, 2);
-        s->regs[SONIC_TSA0] = dp8393x_get(s, width, 3);
-        s->regs[SONIC_TSA1] = dp8393x_get(s, width, 4);
-        s->regs[SONIC_TFS] = dp8393x_get(s, width, 5);
+        s->regs[SONIC_TCR] = dp8393x_get(s, dp8393x_ttda(s), 0) & 0xf000;
+        s->regs[SONIC_TPS] = dp8393x_get(s, dp8393x_ttda(s), 1);
+        s->regs[SONIC_TFC] = dp8393x_get(s, dp8393x_ttda(s), 2);
+        s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s), 3);
+        s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s), 4);
+        s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s), 5);
 
         /* Handle programmable interrupt */
         if (s->regs[SONIC_TCR] & SONIC_TCR_PINT) {
@@ -457,15 +458,9 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
             i++;
             if (i != s->regs[SONIC_TFC]) {
                 /* Read next fragment details */
-                size = sizeof(uint16_t) * 3 * width;
-                address_space_read(&s->as,
-                                   dp8393x_ttda(s)
-                                   + sizeof(uint16_t) * width * (4 + 3 * i),
-                                   MEMTXATTRS_UNSPECIFIED, s->data,
-                                   size);
-                s->regs[SONIC_TSA0] = dp8393x_get(s, width, 0);
-                s->regs[SONIC_TSA1] = dp8393x_get(s, width, 1);
-                s->regs[SONIC_TFS] = dp8393x_get(s, width, 2);
+                s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s), 0);
+                s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s), 1);
+                s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s), 2);
             }
         }
 
@@ -498,22 +493,12 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
         s->regs[SONIC_TCR] |= SONIC_TCR_PTX;
 
         /* Write status */
-        dp8393x_put(s, width, 0,
-                    s->regs[SONIC_TCR] & 0x0fff); /* status */
-        size = sizeof(uint16_t) * width;
-        address_space_write(&s->as, dp8393x_ttda(s),
-                            MEMTXATTRS_UNSPECIFIED, s->data, size);
+        dp8393x_put(s, dp8393x_ttda(s), 0, s->regs[SONIC_TCR] & 0x0fff);
 
         if (!(s->regs[SONIC_CR] & SONIC_CR_HTX)) {
             /* Read footer of packet */
-            size = sizeof(uint16_t) * width;
-            address_space_read(&s->as,
-                               dp8393x_ttda(s)
-                               + sizeof(uint16_t) * width
-                                 * (4 + 3 * s->regs[SONIC_TFC]),
-                               MEMTXATTRS_UNSPECIFIED, s->data,
-                               size);
-            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
+            s->regs[SONIC_CTDA] = dp8393x_get(s, dp8393x_ttda(s),
+                                              4 + 3 * s->regs[SONIC_TFC]);
             if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
                 /* EOL detected */
                 break;
@@ -762,7 +747,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     dp8393xState *s = qemu_get_nic_opaque(nc);
     int packet_type;
     uint32_t available, address;
-    int width, rx_len, padded_len;
+    int rx_len, padded_len;
     uint32_t checksum;
     int size;
 
@@ -775,10 +760,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
 
     rx_len = pkt_size + sizeof(checksum);
     if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
-        width = 2;
         padded_len = ((rx_len - 1) | 3) + 1;
     } else {
-        width = 1;
         padded_len = ((rx_len - 1) | 1) + 1;
     }
 
@@ -799,11 +782,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     /* Check for EOL */
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* Are we still in resource exhaustion? */
-        size = sizeof(uint16_t) * 1 * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 5 * width;
-        address_space_read(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                           s->data, size);
-        s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
+        s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
         if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
             /* Still EOL ; stop reception */
             return -1;
@@ -811,11 +790,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         /* Link has been updated by host */
 
         /* Clear in_use */
-        size = sizeof(uint16_t) * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        dp8393x_put(s, width, 0, 0);
-        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                            (uint8_t *)s->data, size);
+        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
 
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
@@ -869,32 +844,20 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
 
     /* Write status to memory */
     trace_dp8393x_receive_write_status(dp8393x_crda(s));
-    dp8393x_put(s, width, 0, s->regs[SONIC_RCR]); /* status */
-    dp8393x_put(s, width, 1, rx_len); /* byte count */
-    dp8393x_put(s, width, 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
-    dp8393x_put(s, width, 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
-    dp8393x_put(s, width, 4, s->regs[SONIC_RSC]); /* seq_no */
-    size = sizeof(uint16_t) * 5 * width;
-    address_space_write(&s->as, dp8393x_crda(s),
-                        MEMTXATTRS_UNSPECIFIED,
-                        s->data, size);
+    dp8393x_put(s, dp8393x_crda(s), 0, s->regs[SONIC_RCR]); /* status */
+    dp8393x_put(s, dp8393x_crda(s), 1, rx_len); /* byte count */
+    dp8393x_put(s, dp8393x_crda(s), 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
+    dp8393x_put(s, dp8393x_crda(s), 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
+    dp8393x_put(s, dp8393x_crda(s), 4, s->regs[SONIC_RSC]); /* seq_no */
 
     /* Check link field */
-    size = sizeof(uint16_t) * width;
-    address_space_read(&s->as,
-                       dp8393x_crda(s) + sizeof(uint16_t) * 5 * width,
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);
-    s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
+    s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* EOL detected */
         s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
     } else {
         /* Clear in_use */
-        size = sizeof(uint16_t) * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        dp8393x_put(s, width, 0, 0);
-        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                            s->data, size);
+        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
 
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
-- 
2.31.1


