Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB02606249
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:56:01 +0200 (CEST)
Received: from localhost ([::1]:57452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olW1f-0001vy-JQ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:55:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVkC-0007I1-3n
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZK-0001av-Uy
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZ3-00017T-HH
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so2286079wms.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uyb2S8n7eO9/MF2z1HfUN8RrOfF7l5TiXrW0whPNRBY=;
 b=eWk/8EAvJaOUoOLjvN1nAVZDR0I0AR/VEeZpRdgcnSCzJcjvQYTV+576vb/MIkypIB
 foCfCKWRgF7yLvAuRBEqQ6bQZfGAvtB3IzwXPVPdf8d87EkvS0r7i9VnFTQ7wztDpYo4
 68XqE3qrJpX0FEwj9CeGekRvqEGq7fYh66Uq9WNTb5AO0A6+iTv+yCCU51AIbAOlJXO5
 qDizEL+kkBNSp6mQZW59FyHebggNfxVJXJ0aQ/HSeEdsYJxh3dQw/Zyu1FMhq6ZwFkiQ
 LL6SQaWExk/geTCmZbiSTBUDBGARsmHGV2VlNDENAQcDTbcBuKEALYFEq0mq0tSVVofc
 uiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyb2S8n7eO9/MF2z1HfUN8RrOfF7l5TiXrW0whPNRBY=;
 b=lVEXy7+pCxMjVnA+any3jsIC1eMs5Qo+Vzp2RWYleJlEeJ/y8aE+tPBNpicVEiRjMc
 zRscN/UR4bDQMlDHUPZOpfV2+67/mq+E//TUQkAmAU5WqMNN1jw2zACDxkP6WvtibKq5
 0k4yrrNyPOcNyFfsld1uRSX0GZBUxA0H2kvdhY1NAqkkcbJiWigitrF6vNFHgKO20bnA
 Y4xrH7sCag/4cZlZddVTRyci5SoZakdiHX3LoZGHBKsYc6nolSjUB98U9UqWL+Eb4Hd1
 8t5DfXAEowH2mWsmf4xcCiRXPF3AyThdwxbdRyFz6OJNqIKgm8bbGgtpJoMX21CNh1eP
 XLcA==
X-Gm-Message-State: ACrzQf0lRj3eBBWqEHSR2ZRI3GF6PyZkg16298ySWfqoAwqrgbaHOmh4
 gK1cOHigtm09RIVUzH0BFUwO/A79uGeWZw==
X-Google-Smtp-Source: AMsMyM60XDkk/iujmmuflBXlQAl+FacANm2FZ9X339MOGYCEXXN7bS/k2DrNzxbIUaTcm2EVFNrnWw==
X-Received: by 2002:a05:600c:1586:b0:3c6:bfcf:90a7 with SMTP id
 r6-20020a05600c158600b003c6bfcf90a7mr30319298wmf.163.1666268539422; 
 Thu, 20 Oct 2022 05:22:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] hw/ide/microdrive: Use device_cold_reset() for
 self-resets
Date: Thu, 20 Oct 2022 13:21:46 +0100
Message-Id: <20221020122146.3177980-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently the microdrive code uses device_legacy_reset() to reset
itself, and has its reset method call reset on the IDE bus as the
last thing it does.  Switch to using device_cold_reset().

The only concrete microdrive device is the TYPE_DSCM1XXXX; it is not
command-line pluggable, so it is used only by the old pxa2xx Arm
boards 'akita', 'borzoi', 'spitz', 'terrier' and 'tosa'.

You might think that this would result in the IDE bus being
reset automatically, but it does not, because the IDEBus type
does not set the BusClass::reset method. Instead the controller
must explicitly call ide_bus_reset(). We therefore leave that
call in md_reset().

Note also that because the PCMCIA card device is a direct subclass of
TYPE_DEVICE and we don't model the PCMCIA controller-to-card
interface as a qbus, PCMCIA cards are not on any qbus and so they
don't get reset when the system is reset.  The reset only happens via
the dscm1xxxx_attach() and dscm1xxxx_detach() functions during
machine creation.

Because our aim here is merely to try to get rid of calls to the
device_legacy_reset() function, we leave these other dubious
reset-related issues alone.  (They all stem from this code being
absolutely ancient.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221013174042.1602926-1-peter.maydell@linaro.org
---
 hw/ide/microdrive.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 6df9b4cbbe1..56c5be36551 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -175,7 +175,7 @@ static void md_attr_write(PCMCIACardState *card, uint32_t at, uint8_t value)
     case 0x00:	/* Configuration Option Register */
         s->opt = value & 0xcf;
         if (value & OPT_SRESET) {
-            device_legacy_reset(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -318,7 +318,7 @@ static void md_common_write(PCMCIACardState *card, uint32_t at, uint16_t value)
     case 0xe:	/* Device Control */
         s->ctrl = value;
         if (value & CTRL_SRST) {
-            device_legacy_reset(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -543,7 +543,7 @@ static int dscm1xxxx_attach(PCMCIACardState *card)
     md->attr_base = pcc->cis[0x74] | (pcc->cis[0x76] << 8);
     md->io_base = 0x0;
 
-    device_legacy_reset(DEVICE(md));
+    device_cold_reset(DEVICE(md));
     md_interrupt_update(md);
 
     return 0;
@@ -553,7 +553,7 @@ static int dscm1xxxx_detach(PCMCIACardState *card)
 {
     MicroDriveState *md = MICRODRIVE(card);
 
-    device_legacy_reset(DEVICE(md));
+    device_cold_reset(DEVICE(md));
     return 0;
 }
 
-- 
2.25.1


