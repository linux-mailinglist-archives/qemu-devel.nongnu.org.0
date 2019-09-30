Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A143EC27B4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 23:03:54 +0200 (CEST)
Received: from localhost ([::1]:57300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF2pl-00084g-H9
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 17:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45807)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iF2Hh-00044U-0C
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iF2Hf-0002cn-Oe
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:28:40 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51244)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iF2Hf-0002bQ-Gq
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:28:39 -0400
Received: by mail-wm1-x341.google.com with SMTP id 7so874260wme.1
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 13:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lJbQYocXSR3LzW21RYjme2hTgIUpvB0ikUNj0SmxGA=;
 b=Byr95vn07831RUV2a4jbCWBZmItFbDeMuDk1Mcju/0Zg+6kj933+VAXsnAWiCIY+B2
 Pde3MdmLmdSzbOnC7Y6k6dqDi1XBfYiasdfsvhYMKjUwkI/PJySqZ6DXiRQy+sjQhLki
 GqWPEgwaFociTSP+fJoz/tbMnPVDncjMVBtcJfqtEF22vUXyEDbEhZ4Rr0CBdfVqi+gy
 ZHSg9s7hKVZfj00d4zyoJRaIBaCAUMeagFKjlObAL7cg8TKy1Db0QrotPLjIlxCxFu2u
 aXaSDi6cMgiQ1BL/Xy0x58LLmxIYaBcKmEkFqA6NuA7YtiH3K2kKL2ipHSvAL1vObSzt
 pzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lJbQYocXSR3LzW21RYjme2hTgIUpvB0ikUNj0SmxGA=;
 b=n5Xol6VIlDLumffXVnx8cvzsXZJTWxKnJ56WMmgaXgGrJxbj7yPTm2AUQoj6iRxVIE
 NTVWeIYQKe1SzSzLHCnMQtFGNAjnLPMzXHO1Mz4NiRL5F3sjjewhFf91iePj0YxJP333
 yMVDCys+e0cQyT7CRWC2g6AlJw5YiwPHyQN04r2omIyzda9KJhoBElX2SkszYRMuhtHA
 Z0WbI72Lh69Z5WoagTO3cTCQr/jM4+0Dv1WjlCqtVe1N4f3ZVuYVBFdKOQKL8QBtlyjg
 ziuzU48gEwzUyA1ka+xd15bQWBz9ECl5g2ODk7gDmMX+AcEC0vPRdHowYCRumPu+VxMp
 a82w==
X-Gm-Message-State: APjAAAVx+1KUt+rSss3ZDdqqXfmMzx4E09WZozfU70NmwyAIVhc+8sGr
 YY8a0BhSgfQ3EOiz6lrGW8u2wihG
X-Google-Smtp-Source: APXvYqzM8borh3GRSyhiCmeMRcxrsLXcASHKIBcuvqCaV5QgtreZXQMVWH8tuCvTpFdzdoAsth4rCg==
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr712482wmj.25.1569875318269;
 Mon, 30 Sep 2019 13:28:38 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-e8f4-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:e8f4::5])
 by smtp.gmail.com with ESMTPSA id o9sm34402911wrh.46.2019.09.30.13.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 13:28:37 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/10] paaudio: fix channel order for usb-audio 5.1 and 7.1
 streams
Date: Mon, 30 Sep 2019 22:29:03 +0200
Message-Id: <e91c64e888a0bd7c7a3f3ac9381dbb07ed40d2d1.1569874641.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1569874641.git.DirtY.iCE.hu@gmail.com>
References: <cover.1569874641.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 audio/paaudio.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index d195b1caa8..6ff0d17537 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -338,17 +338,59 @@ static pa_stream *qpa_simple_new (
         pa_stream_direction_t dir,
         const char *dev,
         const pa_sample_spec *ss,
-        const pa_channel_map *map,
         const pa_buffer_attr *attr,
         int *rerror)
 {
     int r;
-    pa_stream *stream;
+    pa_stream *stream = NULL;
     pa_stream_flags_t flags;
+    pa_channel_map map;
 
     pa_threaded_mainloop_lock(c->mainloop);
 
-    stream = pa_stream_new(c->context, name, ss, map);
+    pa_channel_map_init(&map);
+    map.channels = ss->channels;
+
+    /*
+     * TODO: This currently expects the only frontend supporting more than 2
+     * channels is the usb-audio.  We will need some means to set channel
+     * order when a new frontend gains multi-channel support.
+     */
+    switch (ss->channels) {
+    case 1:
+        map.map[0] = PA_CHANNEL_POSITION_MONO;
+        break;
+
+    case 2:
+        map.map[0] = PA_CHANNEL_POSITION_LEFT;
+        map.map[1] = PA_CHANNEL_POSITION_RIGHT;
+        break;
+
+    case 6:
+        map.map[0] = PA_CHANNEL_POSITION_FRONT_LEFT;
+        map.map[1] = PA_CHANNEL_POSITION_FRONT_RIGHT;
+        map.map[2] = PA_CHANNEL_POSITION_CENTER;
+        map.map[3] = PA_CHANNEL_POSITION_LFE;
+        map.map[4] = PA_CHANNEL_POSITION_REAR_LEFT;
+        map.map[5] = PA_CHANNEL_POSITION_REAR_RIGHT;
+        break;
+
+    case 8:
+        map.map[0] = PA_CHANNEL_POSITION_FRONT_LEFT;
+        map.map[1] = PA_CHANNEL_POSITION_FRONT_RIGHT;
+        map.map[2] = PA_CHANNEL_POSITION_CENTER;
+        map.map[3] = PA_CHANNEL_POSITION_LFE;
+        map.map[4] = PA_CHANNEL_POSITION_REAR_LEFT;
+        map.map[5] = PA_CHANNEL_POSITION_REAR_RIGHT;
+        map.map[6] = PA_CHANNEL_POSITION_SIDE_LEFT;
+        map.map[7] = PA_CHANNEL_POSITION_SIDE_RIGHT;
+
+    default:
+        dolog("Internal error: unsupported channel count %d\n", ss->channels);
+        goto fail;
+    }
+
+    stream = pa_stream_new(c->context, name, ss, &map);
     if (!stream) {
         goto fail;
     }
@@ -421,7 +463,6 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
         PA_STREAM_PLAYBACK,
         ppdo->has_name ? ppdo->name : NULL,
         &ss,
-        NULL,                   /* channel map */
         &ba,                    /* buffering attributes */
         &error
         );
@@ -470,7 +511,6 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
         PA_STREAM_RECORD,
         ppdo->has_name ? ppdo->name : NULL,
         &ss,
-        NULL,                   /* channel map */
         &ba,                    /* buffering attributes */
         &error
         );
-- 
2.23.0


