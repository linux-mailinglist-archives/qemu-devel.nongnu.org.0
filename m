Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC83C3F76
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:19:13 +0200 (CEST)
Received: from localhost ([::1]:55542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gr2-0004lc-7V
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjR-0007Ws-VU
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjQ-0007Lu-9O
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so3091358wms.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XI/+RLNcOZRL3x9ImO4jyG/hJF8EqE05K9qsRROWbv8=;
 b=a2ZcGy3j1BlVyykZaA8ubL8iGR3DGuvqa+1MV3KO70cT06t+u+jol/CmMwBIQeevp1
 7HqaqVpCm94anwkRrbf0An7VCwaK3gZFB/IPZZSpS2ze4A0lq5kv1qOey7GaR3i+JlVn
 At9RmltowyGCKVf8cYBjelUSmI5Wf68nm3IokkiE0qNgVHMEmg0GKl60MM7F/2FyCepM
 kPKxaU3EJ5wEYsUhJicycN1rfu2lwG0zix+PkAABiEfCQpIQyAXi/hIU4O9QXM2OVXq2
 OEFkP1vkTw5KRWD4Um/gn4pGH2A94iF3D8nYljWfm+jZFnNuTbZGmnrjXI2AYynbJgsY
 AXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XI/+RLNcOZRL3x9ImO4jyG/hJF8EqE05K9qsRROWbv8=;
 b=W/jPA7TLLhmJgGSG74aFDYda4Lt7AyL0yXIi1Dqb6ELju1BJ29IWLrvn5BmDJNu3hV
 yXGdizETAFSBahu5KZ4EaYLbwp4s4YCJ/M36sPQ3mjoofi599aThrvi+ld7Up56weXQ+
 S+qh28b0qMQCX4N48erNDN3lo2DGElTlcHxnX7eJlK9HxTYjLocE4whUklpXRYsj3o1l
 BOmFwhrmG2MJHeTPoPFij/oFH0z5lC967wPXDA0AZ0KE05I5C633VHxz+wBYVM3b6Msj
 uMdY95ok7vSzYQHpn6wN/maROmQw+x7fQnhMYzIU+2qJlUgO/cOnMYVUzPV08DNTZIvM
 EjKw==
X-Gm-Message-State: AOAM531ULCx6LY/D5e39I6AEXYiJ6dM/5QRkd29IRkqp9jsSR6T30jSz
 NplmKaIoaEbpotSiTfn9s08Sx9S4NYkkq6I7
X-Google-Smtp-Source: ABdhPJyYUHp92bNkOGe3HrpRtxW4ll2j6PCGfylNMnrGzgyxiAC0KGX1ch61BYSLe5f9+cDrkk349Q==
X-Received: by 2002:a7b:c113:: with SMTP id w19mr10910006wmi.44.1626037878792; 
 Sun, 11 Jul 2021 14:11:18 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id j10sm12080523wrt.35.2021.07.11.14.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:11:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] hw/sd/sdcard: Extract address_in_range() helper,
 log invalid accesses
Date: Sun, 11 Jul 2021 23:10:55 +0200
Message-Id: <20210711211057.2714586-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711211057.2714586-1-f4bug@amsat.org>
References: <20210711211057.2714586-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Multiple commands have to check the address requested is valid.
Extract this code pattern as a new address_in_range() helper, and
log invalid accesses as guest errors.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-3-f4bug@amsat.org>
---
 hw/sd/sd.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d8fdf84f4db..9c8dd11bad1 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -937,6 +937,18 @@ static void sd_lock_command(SDState *sd)
         sd->card_status &= ~CARD_IS_LOCKED;
 }
 
+static bool address_in_range(SDState *sd, const char *desc,
+                             uint64_t addr, uint32_t length)
+{
+    if (addr + length > sd->size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s offset %lu > card %lu [%%%u]\n",
+                      desc, addr, sd->size, length);
+        sd->card_status |= ADDRESS_ERROR;
+        return false;
+    }
+    return true;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1218,8 +1230,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         switch (sd->state) {
         case sd_transfer_state:
 
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "READ_BLOCK", addr, sd->blk_len)) {
                 return sd_r1;
             }
 
@@ -1264,8 +1275,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         switch (sd->state) {
         case sd_transfer_state:
 
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "WRITE_BLOCK", addr, sd->blk_len)) {
                 return sd_r1;
             }
 
@@ -1325,8 +1335,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
         switch (sd->state) {
         case sd_transfer_state:
-            if (addr >= sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "SET_WRITE_PROT", addr, 1)) {
                 return sd_r1b;
             }
 
@@ -1348,8 +1357,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
         switch (sd->state) {
         case sd_transfer_state:
-            if (addr >= sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "CLR_WRITE_PROT", addr, 1)) {
                 return sd_r1b;
             }
 
@@ -1826,8 +1834,8 @@ void sd_write_byte(SDState *sd, uint8_t value)
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
             /* Start of the block - let's check the address is valid */
-            if (sd->data_start + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "WRITE_MULTIPLE_BLOCK",
+                                  sd->data_start, sd->blk_len)) {
                 break;
             }
             if (sd->size <= SDSC_MAX_CAPACITY) {
@@ -1999,8 +2007,8 @@ uint8_t sd_read_byte(SDState *sd)
 
     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
-            if (sd->data_start + io_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "READ_MULTIPLE_BLOCK",
+                                  sd->data_start, io_len)) {
                 return 0x00;
             }
             BLK_READ_BLOCK(sd->data_start, io_len);
-- 
2.31.1


