Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C569C5B5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 21:01:11 +0200 (CEST)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1xlG-0000Jk-Hb
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 15:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i1xXW-0001SU-Mh
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i1xXV-0004x3-Jp
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:58 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:45179)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i1xXV-0004wp-FH
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:57 -0400
Received: by mail-qt1-x843.google.com with SMTP id k13so15899108qtm.12
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 11:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oup2xTgLOuc5pQrwdWdp2p8hzuUK4Bunh8yLJZfvb+Q=;
 b=SNfnfncdOW66zji8f1KafYc+tq1eD81p6J8+EbVs9qn7SN3lBFCHvvXc6GQ3mowXwn
 lZPWcW1gXUWVm1/wREp9iQxbyECcd9q+ug+79inKE765n2vunRyrFRZES/JJYJS7VFoQ
 mApqUoqyNNE4EvTNGjaCHYow6Wfa7PShwB2gZ3zhw7aeawTmixk7wMSRBBKR7mGZY2uG
 fCCnNVH67CYMWzU6Nya9FEtKJK8axAteSWHUn11VhpiVyFPpM6mN5au92J5gVRkX/w0/
 7AIRkFQpaOKWzb+CPQGDKcdacwBqBIbyh/QpqWgHujY8HkY+yPEN6JsG8xbkGZRjvMZ4
 zfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oup2xTgLOuc5pQrwdWdp2p8hzuUK4Bunh8yLJZfvb+Q=;
 b=fgUUxLT6xB9wvEVF6JFCfcpbtowEGu6pvcWQaDgZkEsqmvNEem90r4YkzsV3x289n1
 WQAeS0l1iwCMnrdP629z08eWxBlxiw14I9B8jGOs03b8gifsItaxuHH+TVYbzBo2j+E4
 gaqQ8LfLSM+A4jRobWZcwUL0TsoaRVdX/DUoMMnvXslyxePT4HpjBAJHIwDwH3cx9WGC
 k3NbiXc5aTm+KScpry5vNZ4S9ywNUShWH+W9Cy4MJ7/OJ8scvW4dNYRwuDUEdn69PGmz
 qCHxTe8i7UyWuZ+V0o5W4i/rQpKOp0MimJhqQFSSWedrIJ18masLE3916plsGEw73bBw
 oJNw==
X-Gm-Message-State: APjAAAWj2fUBY56Q13rVjhxXwK7N/hsAAHEw0OQT72o9sOJ+LIhuO8Zu
 dQdVgDej7w4faGewrNVcn+Ca3FyHwDk=
X-Google-Smtp-Source: APXvYqyiyXQjvY+7teULzdtLqxxI1Lf6fPFe6LYTHfAViKosHMUezI5bmVWhn0kdq0PvJKUYZWYknA==
X-Received: by 2002:a0c:b251:: with SMTP id k17mr12658518qve.132.1566758816916; 
 Sun, 25 Aug 2019 11:46:56 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-61b1-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:61b1::5])
 by smtp.gmail.com with ESMTPSA id d3sm5348870qtq.32.2019.08.25.11.46.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 11:46:56 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 25 Aug 2019 20:46:25 +0200
Message-Id: <f09fc2df16e0dba25fe1a514b817cb52f97c4c47.1566755452.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566755452.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566755452.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: [Qemu-devel] [PATCH 23/25] usb-audio: do not count on avail bytes
 actually available
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
 hw/usb/dev-audio.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

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
-            return;
-        }
-        data = streambuf_get(&s->out.buf);
+    while (avail) {
+        size_t written, len;
+
+        data = streambuf_get(&s->out.buf, &len);
         if (!data) {
             return;
         }
-        AUD_write(s->out.voice, data, USBAUDIO_PACKET_SIZE);
-        avail -= USBAUDIO_PACKET_SIZE;
+
+        written = AUD_write(s->out.voice, data, len);
+        avail -= written;
+        s->out.buf.cons += written;
+
+        if (written < len) {
+            return;
+        }
     }
 }
 
-- 
2.22.0


