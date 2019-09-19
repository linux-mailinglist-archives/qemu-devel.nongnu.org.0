Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D06B839D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 23:44:43 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB4EE-0005E3-0v
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 17:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iB3ux-0002vw-Jg
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 17:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iB3uv-0000lJ-P5
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 17:24:47 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36217)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iB3uv-0000kh-Du
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 17:24:45 -0400
Received: by mail-wm1-x344.google.com with SMTP id m18so7427wmc.1
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 14:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=csUz3G+oANfAghQDvskgbpzawb3MHELRqPU8L59Mp1o=;
 b=PCjiQb1Ukd3EaTlXC0NfwALkyapPUWxqCykoI9T+O+T0MGz22uOm7vpL0ZI1pqqiDH
 axHC8vYf6uha4MN7o43xD4nFhnPwKgL9WxevSPWoyJ0infS0G9A9xnrVjiP8364qdySQ
 peO6z5jOtvW6OsPa7cjKsFtbVLuTmUwnQR6+y6GQInLF60ZJuZPk++nfXDbqnK23gXmT
 oqpPInHOA4x7cGep6v6gkDSDPx7y1nT0iERXM68xcc4guQLyO7FjRi1WonAB0vodmbRg
 haLj1Q3icGxYPMFzQYaoeGjmayqLHPhR5FawA6nrGxv1dn4uoefMFdI+i2pNheGFDh5P
 5kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=csUz3G+oANfAghQDvskgbpzawb3MHELRqPU8L59Mp1o=;
 b=b44cr14yB/vekLtqm38cV//Dd7lDu8ZLbacKxpg/FANJ1yVqG24gWg3FQwbpyUYjGd
 Cp4XOsWnHM5KVkC5UndeWD7YtB0Gy7W/ubkSaNmoJCHwU99VZUGPCLqaRamvE/OyeZbU
 K8t56Dfid+h26OtBxGDiHRy5wSJT7uRUkIXGvjJO5hYr/R0goaEtt9mlb22grdC/kh9r
 H9XVDJV9WUISgxjJR0kq2iVaelDN36sC8g77Lr+4WuJ55O6nN1YIPH3KUkqAVcPCeC3y
 rsdnO5M0NkREDTffyGQkPnBw59+5wNtmZcYDwTKwOGCdFmAYtI6edA3oiI7qo8uRw6oZ
 hztA==
X-Gm-Message-State: APjAAAWUPtAoHmVGneila+1BY62IiJZLF7fUnhO/GRqqHyTbWJHZrYfk
 Kt1xpukhNtZrgoDeYAU7IGSvlkVp
X-Google-Smtp-Source: APXvYqzJXk8w8sNEDuQEJ41udFDdphxK/RGU/Xg1Q3ficrd2a81f4dJxy+wWiSWyQGtYoHMz4N2jbQ==
X-Received: by 2002:a05:600c:241:: with SMTP id 1mr74963wmj.162.1568928284238; 
 Thu, 19 Sep 2019 14:24:44 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-74ef-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:74ef::5])
 by smtp.gmail.com with ESMTPSA id w125sm13191292wmg.32.2019.09.19.14.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 14:24:43 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/24] usbaudio: change playback counters to 64 bit
Date: Thu, 19 Sep 2019 23:24:32 +0200
Message-Id: <71151db7022c023bdb16b88659cff0a25fa6235e.1568927990.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
References: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With stereo playback, they need about 375 minutes of continuous audio
playback to overflow, which is usually not a problem (as stopping and
later resuming playback resets the counters).  But with 7.1 audio, they
only need about 95 minutes to overflow.

After the overflow, the buf->prod % USBAUDIO_PACKET_SIZE(channels)
assertion no longer holds true, which will result in overflowing the
buffer.  With 64 bit variables, it would take about 762000 years to
overflow.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 hw/usb/dev-audio.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index e42bdfbdc1..ea604bbb8e 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -578,9 +578,9 @@ static const USBDesc desc_audio_multi = {
 
 struct streambuf {
     uint8_t *data;
-    uint32_t size;
-    uint32_t prod;
-    uint32_t cons;
+    size_t size;
+    uint64_t prod;
+    uint64_t cons;
 };
 
 static void streambuf_init(struct streambuf *buf, uint32_t size,
@@ -601,7 +601,7 @@ static void streambuf_fini(struct streambuf *buf)
 
 static int streambuf_put(struct streambuf *buf, USBPacket *p, uint32_t channels)
 {
-    uint32_t free = buf->size - (buf->prod - buf->cons);
+    int64_t free = buf->size - (buf->prod - buf->cons);
 
     if (free < USBAUDIO_PACKET_SIZE(channels)) {
         return 0;
@@ -610,6 +610,8 @@ static int streambuf_put(struct streambuf *buf, USBPacket *p, uint32_t channels)
         return 0;
     }
 
+    /* can happen if prod overflows */
+    assert(buf->prod % USBAUDIO_PACKET_SIZE(channels) == 0);
     usb_packet_copy(p, buf->data + (buf->prod % buf->size),
                     USBAUDIO_PACKET_SIZE(channels));
     buf->prod += USBAUDIO_PACKET_SIZE(channels);
@@ -618,10 +620,10 @@ static int streambuf_put(struct streambuf *buf, USBPacket *p, uint32_t channels)
 
 static uint8_t *streambuf_get(struct streambuf *buf, size_t *len)
 {
-    uint32_t used = buf->prod - buf->cons;
+    int64_t used = buf->prod - buf->cons;
     uint8_t *data;
 
-    if (!used) {
+    if (used <= 0) {
         *len = 0;
         return NULL;
     }
-- 
2.23.0


