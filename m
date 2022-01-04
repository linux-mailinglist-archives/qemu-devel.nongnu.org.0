Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF54483E16
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:27:27 +0100 (CET)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fAF-0004Vm-3q
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:27:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4eeE-0005i3-Jc; Tue, 04 Jan 2022 02:54:22 -0500
Received: from [2a00:1450:4864:20::42f] (port=42608
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4eeC-0007DE-U3; Tue, 04 Jan 2022 02:54:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w20so65385844wra.9;
 Mon, 03 Jan 2022 23:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBJgYpxMfElZCjSoM/LIb7+pEggDV+9LpvhxGVUtM6k=;
 b=Ruk3r5wFFU0Y7dO4gXZ7PA6NplKKwWSnJjmptGNd2EsRQ94gaHhHGm/qxZN8cv9ZN1
 SydGjF2EpoH9LRfPpOj+vsG9qIqGpSKm1GNTsErhRFmU5r2pB99GuepwtEPU2GxVyOCP
 6vix+Hxcuk4biikzGXjcIXkJNvTwanYnvazayM5v09OFaglaMlVPTSEOn4/4wN8FNiTg
 f7+PvzzPGd6oIvQF8mDhO/0+gfsd8RRekHS73aHaQhu8eSx08WFFW0d/oEhajo6snQGB
 cXq7OaRWVLLOHVrXWFVXCKTl/qOXYVlVp8U/5MmUYgxVtY7Gf+4VVi0klzhys1MLT6Km
 zR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eBJgYpxMfElZCjSoM/LIb7+pEggDV+9LpvhxGVUtM6k=;
 b=Jgw2p6K9tBYcvhj5YryndUdmTsjbRqiHpr8UrBekhUixhXBHM/+Baxuyd3/QCJnNRE
 zOoqOrgeXPcvuvO+ezf/Y6BLoDXqvtG7g4lOYaf4y5QHCwCawaoXmRtoJfzhqgXTUG/c
 VttrbV1is4v8VUAv++wyYqhTOx5mOBLQEhv9X9OEhVkfJD+xuNyA+Qg2zZfc8FONgY1m
 HI2xMe7uM97cAWPS4z4WV7EqOmUoaXIfhfZWM0DVQpFKGfMnxVX6Mvepv6dLd1GJMb+0
 oy+EiLP3UR6dST0tdFXiOI+rJYUQ7tzyTXwQ3TKczOMsikhndhw2TjFM+FcxRUzYemoR
 UEPg==
X-Gm-Message-State: AOAM531USzI/MGP1rlXpNzLNrQRgRfMisTzgFJRqlcK/fsWYfl1eF6be
 gUPHZE3/PsDZ3VWypboZNAw6FIpSkXsqxA==
X-Google-Smtp-Source: ABdhPJzwUprtIiK4OhIfP9UbUHM3M2CnDbmYP+PT3RRFvgq9y6I2b5+64Le9Zi0Cbpnt2CGiCzWc4w==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr41154070wrz.60.1641282859150; 
 Mon, 03 Jan 2022 23:54:19 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id l2sm37545576wru.83.2022.01.03.23.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 23:54:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] hw/sd/sdcard: Rename Write Protect Group variables
Date: Tue,  4 Jan 2022 08:54:11 +0100
Message-Id: <20220104075412.2088859-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104075412.2088859-1-f4bug@amsat.org>
References: <20220104075412.2088859-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
 hw/sd/sd.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bb5dbff68c0..0bb99352cc1 100644
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


