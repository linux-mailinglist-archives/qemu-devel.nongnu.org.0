Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A4534465
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:41:11 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwsY-0003Rb-Ct
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhB-0005M8-6G
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwh9-0003rV-1g
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5G8JJjNfgwnCLIL1ovYhV/3iQZmax8ele6WXpKp+TA=;
 b=cBBvyJxqQP3QU94S1B5CX/qJlXqa8VNtSib/GheHWGCDAtV64j3lCuKvSZ76Sw3T4cesRc
 ae9XonW7MHBDfz+CuZ7wOEym76O4tMfXBPYv7i2EJ7Mym/NY/WpE1WQQ0XIfWKnmHknALy
 OS7glx2654/krGzVwDW8/mtsJR1UQi0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-uj_VBgOJOD6QbkqZZYbyCQ-1; Wed, 25 May 2022 15:29:20 -0400
X-MC-Unique: uj_VBgOJOD6QbkqZZYbyCQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 r10-20020aa7c14a000000b0042bcc99e4cdso1515405edp.18
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5G8JJjNfgwnCLIL1ovYhV/3iQZmax8ele6WXpKp+TA=;
 b=gtFzHT9ypOliUzZsAeytZQDwTUdYkElSe59wxf/3liujFTeqBR6yF2kTxksWqVmwWL
 MzdsS8S2qLn6M+e2NHhuy55qLOt7YRSnrTlsCF8xf8hje3SdAsz0jUejtMcyX65HvA7T
 4EeqEpnCS9RUb8YQFBY80MlsgkV21vXJFSOrb6za6Th818L8Fa3dj/ydBTqiSAEezkvo
 jCZtnysmb1ita/VJiNiW+rBvyKi4Cr518DBVNA/lXWhjrMTQJqR6+90FyJOOOXXo/Z2P
 4IX4vyhGXG1T8BcQS+FZjaVkPcGOSyowa0nkrmRpUcFF/kBS7RwytECoKzo9uBYByts1
 tB+w==
X-Gm-Message-State: AOAM531emzZLdEf2vsqFRvgS5P5OFLJvDvgFgoQMie1kEAUzu4EcfFcD
 TNOhl/7rDyFwf3eyyGbum4acFmuwID54eImXCz5Y5VniPpbhlPCzWUTo12iF3eFcMSsanwjHLTq
 Y/cU6/0CqxI+VQ4ZsFWi/1hCDMReB4tYUI0pIn667vTGzK1fGXJ2ICh9chSEFI4+1Dik=
X-Received: by 2002:a05:6402:1341:b0:42a:f7cb:44dc with SMTP id
 y1-20020a056402134100b0042af7cb44dcmr35364303edw.165.1653506958339; 
 Wed, 25 May 2022 12:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypLbNaXga1g287I1jlxDDifFoX55ZVFSdTuHIMY2jusb/R3LMhk4BDJucNglPWCIZL4sJZng==
X-Received: by 2002:a05:6402:1341:b0:42a:f7cb:44dc with SMTP id
 y1-20020a056402134100b0042af7cb44dcmr35364278edw.165.1653506958029; 
 Wed, 25 May 2022 12:29:18 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a1709060ac800b006fec5cef701sm4322318ejf.197.2022.05.25.12.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/17] hw/audio/ac97: Remove unneeded local variables
Date: Wed, 25 May 2022 21:28:44 +0200
Message-Id: <20220525192852.301633-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Several functions have a local variable that is just a copy of one of
the function parameters. This is unneeded complication so just get rid
of these.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <d959aa0b267eb139a994e41ca0b7ba87d9cef7a9.1650706617.git.balaton@eik.bme.hu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/ac97.c | 102 +++++++++++++++++++++++-------------------------
 1 file changed, 49 insertions(+), 53 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 6584aa749e..be2dd701a4 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -557,9 +557,8 @@ static uint32_t nam_readb(void *opaque, uint32_t addr)
 static uint32_t nam_readw(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
-    uint32_t index = addr;
     s->cas = 0;
-    return mixer_load(s, index);
+    return mixer_load(s, addr);
 }
 
 static uint32_t nam_readl(void *opaque, uint32_t addr)
@@ -584,21 +583,21 @@ static void nam_writeb(void *opaque, uint32_t addr, uint32_t val)
 static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
-    uint32_t index = addr;
+
     s->cas = 0;
-    switch (index) {
+    switch (addr) {
     case AC97_Reset:
         mixer_reset(s);
         break;
     case AC97_Powerdown_Ctrl_Stat:
         val &= ~0x800f;
-        val |= mixer_load(s, index) & 0xf;
-        mixer_store(s, index, val);
+        val |= mixer_load(s, addr) & 0xf;
+        mixer_store(s, addr, val);
         break;
     case AC97_PCM_Out_Volume_Mute:
     case AC97_Master_Volume_Mute:
     case AC97_Record_Gain_Mute:
-        set_volume(s, index, val);
+        set_volume(s, addr, val);
         break;
     case AC97_Record_Select:
         record_select(s, val);
@@ -626,7 +625,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     case AC97_PCM_Front_DAC_Rate:
         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
-            mixer_store(s, index, val);
+            mixer_store(s, addr, val);
             dolog("Set front DAC rate to %d\n", val);
             open_voice(s, PO_INDEX, val);
         } else {
@@ -636,7 +635,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     case AC97_MIC_ADC_Rate:
         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRM) {
-            mixer_store(s, index, val);
+            mixer_store(s, addr, val);
             dolog("Set MIC ADC rate to %d\n", val);
             open_voice(s, MC_INDEX, val);
         } else {
@@ -646,7 +645,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     case AC97_PCM_LR_ADC_Rate:
         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
-            mixer_store(s, index, val);
+            mixer_store(s, addr, val);
             dolog("Set front LR ADC rate to %d\n", val);
             open_voice(s, PI_INDEX, val);
         } else {
@@ -673,7 +672,7 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     default:
         dolog("U nam writew 0x%x <- 0x%x\n", addr, val);
-        mixer_store(s, index, val);
+        mixer_store(s, addr, val);
         break;
     }
 }
@@ -693,10 +692,9 @@ static uint32_t nabm_readb(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
     uint32_t val = ~0U;
 
-    switch (index) {
+    switch (addr) {
     case CAS:
         dolog("CAS %d\n", s->cas);
         val = s->cas;
@@ -705,37 +703,37 @@ static uint32_t nabm_readb(void *opaque, uint32_t addr)
     case PI_CIV:
     case PO_CIV:
     case MC_CIV:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->civ;
-        dolog("CIV[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("CIV[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_LVI:
     case PO_LVI:
     case MC_LVI:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->lvi;
-        dolog("LVI[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("LVI[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_PIV:
     case PO_PIV:
     case MC_PIV:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->piv;
-        dolog("PIV[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("PIV[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_CR:
     case PO_CR:
     case MC_CR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->cr;
-        dolog("CR[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("CR[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->sr & 0xff;
-        dolog("SRb[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("SRb[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     default:
         dolog("U nabm readb 0x%x -> 0x%x\n", addr, val);
@@ -748,23 +746,22 @@ static uint32_t nabm_readw(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
     uint32_t val = ~0U;
 
-    switch (index) {
+    switch (addr) {
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->sr;
-        dolog("SR[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("SR[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_PICB:
     case PO_PICB:
     case MC_PICB:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->picb;
-        dolog("PICB[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("PICB[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     default:
         dolog("U nabm readw 0x%x -> 0x%x\n", addr, val);
@@ -777,31 +774,30 @@ static uint32_t nabm_readl(void *opaque, uint32_t addr)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
     uint32_t val = ~0U;
 
-    switch (index) {
+    switch (addr) {
     case PI_BDBAR:
     case PO_BDBAR:
     case MC_BDBAR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->bdbar;
-        dolog("BMADDR[%d] -> 0x%x\n", GET_BM(index), val);
+        dolog("BMADDR[%d] -> 0x%x\n", GET_BM(addr), val);
         break;
     case PI_CIV:
     case PO_CIV:
     case MC_CIV:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->civ | (r->lvi << 8) | (r->sr << 16);
-        dolog("CIV LVI SR[%d] -> 0x%x, 0x%x, 0x%x\n", GET_BM(index),
+        dolog("CIV LVI SR[%d] -> 0x%x, 0x%x, 0x%x\n", GET_BM(addr),
                r->civ, r->lvi, r->sr);
         break;
     case PI_PICB:
     case PO_PICB:
     case MC_PICB:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         val = r->picb | (r->piv << 16) | (r->cr << 24);
-        dolog("PICB PIV CR[%d] -> 0x%x 0x%x 0x%x 0x%x\n", GET_BM(index),
+        dolog("PICB PIV CR[%d] -> 0x%x 0x%x 0x%x 0x%x\n", GET_BM(addr),
                val, r->picb, r->piv, r->cr);
         break;
     case GLOB_CNT:
@@ -827,12 +823,12 @@ static void nabm_writeb(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
-    switch (index) {
+
+    switch (addr) {
     case PI_LVI:
     case PO_LVI:
     case MC_LVI:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         if ((r->cr & CR_RPBM) && (r->sr & SR_DCH)) {
             r->sr &= ~(SR_DCH | SR_CELV);
             r->civ = r->piv;
@@ -840,12 +836,12 @@ static void nabm_writeb(void *opaque, uint32_t addr, uint32_t val)
             fetch_bd(s, r);
         }
         r->lvi = val % 32;
-        dolog("LVI[%d] <- 0x%x\n", GET_BM(index), val);
+        dolog("LVI[%d] <- 0x%x\n", GET_BM(addr), val);
         break;
     case PI_CR:
     case PO_CR:
     case MC_CR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         if (val & CR_RR) {
             reset_bm_regs(s, r);
         } else {
@@ -861,15 +857,15 @@ static void nabm_writeb(void *opaque, uint32_t addr, uint32_t val)
                 voice_set_active(s, r - s->bm_regs, 1);
             }
         }
-        dolog("CR[%d] <- 0x%x (cr 0x%x)\n", GET_BM(index), val, r->cr);
+        dolog("CR[%d] <- 0x%x (cr 0x%x)\n", GET_BM(addr), val, r->cr);
         break;
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         r->sr |= val & ~(SR_RO_MASK | SR_WCLEAR_MASK);
         update_sr(s, r, r->sr & ~(val & SR_WCLEAR_MASK));
-        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(index), val, r->sr);
+        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(addr), val, r->sr);
         break;
     default:
         dolog("U nabm writeb 0x%x <- 0x%x\n", addr, val);
@@ -881,15 +877,15 @@ static void nabm_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
-    switch (index) {
+
+    switch (addr) {
     case PI_SR:
     case PO_SR:
     case MC_SR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         r->sr |= val & ~(SR_RO_MASK | SR_WCLEAR_MASK);
         update_sr(s, r, r->sr & ~(val & SR_WCLEAR_MASK));
-        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(index), val, r->sr);
+        dolog("SR[%d] <- 0x%x (sr 0x%x)\n", GET_BM(addr), val, r->sr);
         break;
     default:
         dolog("U nabm writew 0x%x <- 0x%x\n", addr, val);
@@ -901,14 +897,14 @@ static void nabm_writel(void *opaque, uint32_t addr, uint32_t val)
 {
     AC97LinkState *s = opaque;
     AC97BusMasterRegs *r = NULL;
-    uint32_t index = addr;
-    switch (index) {
+
+    switch (addr) {
     case PI_BDBAR:
     case PO_BDBAR:
     case MC_BDBAR:
-        r = &s->bm_regs[GET_BM(index)];
+        r = &s->bm_regs[GET_BM(addr)];
         r->bdbar = val & ~3;
-        dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(index), val, r->bdbar);
+        dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(addr), val, r->bdbar);
         break;
     case GLOB_CNT:
         /* TODO: Handle WR or CR being set (warm/cold reset requests) */
-- 
2.36.1



