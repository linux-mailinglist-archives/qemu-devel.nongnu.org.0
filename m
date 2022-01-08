Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B648868E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 22:59:26 +0100 (CET)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6JkD-00043M-9K
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 16:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6JjH-0002Yp-BA; Sat, 08 Jan 2022 16:58:27 -0500
Received: from [2a00:1450:4864:20::42e] (port=40491
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6JjF-0002Se-OA; Sat, 08 Jan 2022 16:58:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l10so18642780wrh.7;
 Sat, 08 Jan 2022 13:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKfxvZum9//X1JeGHKZDnyjMBnY2y6N1dpFgEWbkZPM=;
 b=InMvGKLqTlnZ0KSe4qdI7Qa4dGM97GEFnk0Q2mmG1cAy93xnASKiugTIkuMOxpnVPT
 im6HjIJyH+jzDQR7Hv6ZLtHjQ6sJV8lpaTKXhs4rzoCwG6iCQ8NLuI1YFmfG0GoxE3Cd
 u5pDyZ2GfEfOzK1WG1KK1hEDPlBOxsVEzW1dxJGPq9kDsA4cOBbYwbAR1wUnIeebooOu
 NWu/rMnispbzUySF5PHJhfOhqphNTAvWTaUIBzZLpjAtmSSFmf375CV4qVmFTOwxsXbS
 jaVe8rkeEW7t7DUlqDRKi5V54z5I4I+mqlxzjftcRI3v40ou2I7iPYvla2irUVMr9MSP
 uu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JKfxvZum9//X1JeGHKZDnyjMBnY2y6N1dpFgEWbkZPM=;
 b=yYE+9xAIBZdTxkOHHt+DIF+JXTbKC12HOuPzngz19hwSS2LIX+VaFGP4UlPtw1o58/
 zU2kmhuC3crwRT/jhOe9TlMNB4d0J3yeepTMkTMP9Rw8PPfw/HSgSdZoFq0Eyi/8wFIc
 bm+WbZnGXHBhb4u531ys1GK90kc3mxZ97UNgdgBy+4Tq9Bc3H7jZaW3p1wH/LVQ2dkFO
 nlRIDdHrBRZWHeFR04TR2DWwp74rhwKEZwRxiUuV8sYRDnKEV8OIwr+kPOGP7VhXFyTf
 Ed+ng7l6EEfkT4ykmA5gXJMse3CaiNijJR9IhpwrEDjliSWNipdylCVM2p7pCmt853kD
 +YZw==
X-Gm-Message-State: AOAM5305QpzktAcnRFOD1M77/Gs+xLwo8FmI2eXnXTYiPzvI53wf3uK1
 lv5ikcOTuRjPb8rZWIH8G4gdYziAf2cmRw==
X-Google-Smtp-Source: ABdhPJy3ocy/M20pvkgWg7/Mt0MTCPZg8jXshVfRhU9SPOvuUDMsctuRZdx5prdJgks+E25wRlfjpA==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr61361864wrd.105.1641679102946; 
 Sat, 08 Jan 2022 13:58:22 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id v5sm1052634wrq.80.2022.01.08.13.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 13:58:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] hw/sd/sdcard: Rename Write Protect Group variables
Date: Sat,  8 Jan 2022 22:58:14 +0100
Message-Id: <20220108215815.551241-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108215815.551241-1-f4bug@amsat.org>
References: <20220108215815.551241-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'wp_groups' holds a bitmap, rename it as 'wp_group_bmap'.
'wpgrps_size' is the bitmap size (in bits), rename it as
'wp_group_bits'.

Patch created mechanically using:

  $ sed -i -e s/wp_groups/wp_group_bmap/ \
           -e s/wpgrps_size/wp_group_bits/ hw/sd/sd.c

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210728181728.2012952-4-f4bug@amsat.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/sd/sd.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bb5dbff68c0..c10a1e469b7 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -116,8 +116,8 @@ struct SDState {
     int32_t state;    /* current card state, one of SDCardStates */
     uint32_t vhs;
     bool wp_switch;
-    unsigned long *wp_groups;
-    int32_t wpgrps_size;
+    unsigned long *wp_group_bmap;
+    int32_t wp_group_bits;
     uint64_t size;
     uint32_t blk_len;
     uint32_t multi_blk_cnt;
@@ -567,10 +567,10 @@ static void sd_reset(DeviceState *dev)
     sd_set_cardstatus(sd);
     sd_set_sdstatus(sd);
 
-    g_free(sd->wp_groups);
+    g_free(sd->wp_group_bmap);
     sd->wp_switch = sd->blk ? !blk_is_writable(sd->blk) : false;
-    sd->wpgrps_size = sect;
-    sd->wp_groups = bitmap_new(sd->wpgrps_size);
+    sd->wp_group_bits = sect;
+    sd->wp_group_bmap = bitmap_new(sd->wp_group_bits);
     memset(sd->function_group, 0, sizeof(sd->function_group));
     sd->erase_start = INVALID_ADDRESS;
     sd->erase_end = INVALID_ADDRESS;
@@ -673,7 +673,7 @@ static const VMStateDescription sd_vmstate = {
         VMSTATE_UINT32(card_status, SDState),
         VMSTATE_PARTIAL_BUFFER(sd_status, SDState, 1),
         VMSTATE_UINT32(vhs, SDState),
-        VMSTATE_BITMAP(wp_groups, SDState, 0, wpgrps_size),
+        VMSTATE_BITMAP(wp_group_bmap, SDState, 0, wp_group_bits),
         VMSTATE_UINT32(blk_len, SDState),
         VMSTATE_UINT32(multi_blk_cnt, SDState),
         VMSTATE_UINT32(erase_start, SDState),
@@ -803,8 +803,8 @@ static void sd_erase(SDState *sd)
         if (sdsc) {
             /* Only SDSC cards support write protect groups */
             wpnum = sd_addr_to_wpnum(erase_addr);
-            assert(wpnum < sd->wpgrps_size);
-            if (test_bit(wpnum, sd->wp_groups)) {
+            assert(wpnum < sd->wp_group_bits);
+            if (test_bit(wpnum, sd->wp_group_bmap)) {
                 sd->card_status |= WP_ERASE_SKIP;
                 continue;
             }
@@ -828,8 +828,8 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
              */
             continue;
         }
-        assert(wpnum < sd->wpgrps_size);
-        if (test_bit(wpnum, sd->wp_groups)) {
+        assert(wpnum < sd->wp_group_bits);
+        if (test_bit(wpnum, sd->wp_group_bmap)) {
             ret |= (1 << i);
         }
     }
@@ -869,7 +869,7 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
 
 static inline bool sd_wp_addr(SDState *sd, uint64_t addr)
 {
-    return test_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
+    return test_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
 }
 
 static void sd_lock_command(SDState *sd)
@@ -897,7 +897,7 @@ static void sd_lock_command(SDState *sd)
             sd->card_status |= LOCK_UNLOCK_FAILED;
             return;
         }
-        bitmap_zero(sd->wp_groups, sd->wpgrps_size);
+        bitmap_zero(sd->wp_group_bmap, sd->wp_group_bits);
         sd->csd[14] &= ~0x10;
         sd->card_status &= ~CARD_IS_LOCKED;
         sd->pwd_len = 0;
@@ -1348,7 +1348,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             }
 
             sd->state = sd_programming_state;
-            set_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
+            set_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
             /* Bzzzzzzztt .... Operation complete.  */
             sd->state = sd_transfer_state;
             return sd_r1b;
@@ -1370,7 +1370,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             }
 
             sd->state = sd_programming_state;
-            clear_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
+            clear_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
             /* Bzzzzzzztt .... Operation complete.  */
             sd->state = sd_transfer_state;
             return sd_r1b;
-- 
2.33.1


