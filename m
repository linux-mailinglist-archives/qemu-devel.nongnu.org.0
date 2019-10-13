Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED114D57F9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Oct 2019 22:08:12 +0200 (CEST)
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJk9z-0006JR-VR
	for lists+qemu-devel@lfdr.de; Sun, 13 Oct 2019 16:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iJk0O-0005TU-3g
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:58:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iJk0N-0003IZ-1W
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:58:16 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34570)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iJk0M-0003HU-S2
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:58:14 -0400
Received: by mail-wr1-x444.google.com with SMTP id j11so17263360wrp.1
 for <qemu-devel@nongnu.org>; Sun, 13 Oct 2019 12:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8TTUthXqXhh1DdLxMpTCEbLpELmMAAhIVdhapb9+b1E=;
 b=j3AAwwsMmK1wBGCWAY08+feGmI9W/OiiQxbXFLKlgUIqJBfMggl4hQ20inpDRNnH0z
 oziaZ2dlzqEvRXy6fbCVXTDWBNnPy0HzCSe8M6d646AJ0ihFvWTlxuxYKFn8H3SZMQSG
 ZzSGTnClL1R+g2IFX8PUBHUzf//NTGboiKKie9iZS5bFyXL5qwMHqWNycqZUR+cf+eVa
 PwL9m8XwtAoHUotI8Qiz1E4WAcyJDCEp21E6IWlweOu85WDWIEbiyoVpNcYsf9VvyUhM
 JMr/ZonTEgL2TR4z2+lq5ZY+OI0unmg41TqKahXXrzCAukmjtsZxLAyTRImkCVIcHpNK
 e7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8TTUthXqXhh1DdLxMpTCEbLpELmMAAhIVdhapb9+b1E=;
 b=lj595W5ttyZen2dkzFVcBiPZwcMAeBKRIGg5YHPn/5MRb6uHdUJ1eZY6rmr6nG4Oww
 mqpuQ0KwQdsaCAbPjW/1khksx0Jg3J24Yt0/vuQvDrDokJE5ppbJkzEVSU2Qd2mBdyBj
 aDdHiZUtVMsmH57qPE0p7PaSJG6XjTv9ouV1ZJlntyTapFgLvwhSPkZuA26MOEJoyJwC
 +9FbT/vsjk9+mtUikcoqLv4LVqPcZFJe71s/aq7yZVS9USQ0J/O6xJ6H1rm/HVXXFyfc
 J7DDlVKsBl8tKxrlZY0CdLoBE0P+z+3CnaJHocGJ9gB/bpVzweDibOZ6sOKjWcZxQTtd
 gwbw==
X-Gm-Message-State: APjAAAV/cwEB/wkLzR3OPogVdo17o1GCjd3OZ4ZsyvoGKALPh9M3YeDC
 V1KOmyfMMIJ9yNuo9nCJZUwykiw6
X-Google-Smtp-Source: APXvYqxONJH4A4co2xrTivkqxeS61xKWlPRBwR/iJL71RP6wV3pPYu4qd2itDZy82VelvOuuUzyqKQ==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr22694214wrv.225.1570996693775; 
 Sun, 13 Oct 2019 12:58:13 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-0052-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:52::5])
 by smtp.gmail.com with ESMTPSA id x129sm29941857wmg.8.2019.10.13.12.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 12:58:13 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/10] usb-audio: do not count on avail bytes actually
 available
Date: Sun, 13 Oct 2019 21:58:04 +0200
Message-Id: <d63f4d39a0ee7a2e4e7e4a2eb005ba79120eaf1d.1570996490.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1570996490.git.DirtY.iCE.hu@gmail.com>
References: <cover.1570996490.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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

This assumption is no longer true when mixeng is turned off.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 hw/usb/dev-audio.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index ae42e5a2f1..74c99b1f12 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -319,30 +319,31 @@ static int streambuf_put(struct streambuf *buf, USBPacket *p)
 {
     uint32_t free = buf->size - (buf->prod - buf->cons);
 
-    if (!free) {
+    if (free < USBAUDIO_PACKET_SIZE) {
         return 0;
     }
     if (p->iov.size != USBAUDIO_PACKET_SIZE) {
         return 0;
     }
-    assert(free >= USBAUDIO_PACKET_SIZE);
+
     usb_packet_copy(p, buf->data + (buf->prod % buf->size),
                     USBAUDIO_PACKET_SIZE);
     buf->prod += USBAUDIO_PACKET_SIZE;
     return USBAUDIO_PACKET_SIZE;
 }
 
-static uint8_t *streambuf_get(struct streambuf *buf)
+static uint8_t *streambuf_get(struct streambuf *buf, size_t *len)
 {
     uint32_t used = buf->prod - buf->cons;
     uint8_t *data;
 
     if (!used) {
+        *len = 0;
         return NULL;
     }
-    assert(used >= USBAUDIO_PACKET_SIZE);
     data = buf->data + (buf->cons % buf->size);
-    buf->cons += USBAUDIO_PACKET_SIZE;
+    *len = MIN(buf->prod - buf->cons,
+               buf->size - (buf->cons % buf->size));
     return data;
 }
 
@@ -374,16 +375,21 @@ static void output_callback(void *opaque, int avail)
     USBAudioState *s = opaque;
     uint8_t *data;
 
-    for (;;) {
-        if (avail < USBAUDIO_PACKET_SIZE) {
+    while (avail) {
+        size_t written, len;
+
+        data = streambuf_get(&s->out.buf, &len);
+        if (!data) {
             return;
         }
-        data = streambuf_get(&s->out.buf);
-        if (!data) {
+
+        written = AUD_write(s->out.voice, data, len);
+        avail -= written;
+        s->out.buf.cons += written;
+
+        if (written < len) {
             return;
         }
-        AUD_write(s->out.voice, data, USBAUDIO_PACKET_SIZE);
-        avail -= USBAUDIO_PACKET_SIZE;
     }
 }
 
-- 
2.23.0


