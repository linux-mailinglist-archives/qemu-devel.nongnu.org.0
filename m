Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7C9C5C5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 21:08:13 +0200 (CEST)
Received: from localhost ([::1]:46464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1xs4-000704-GC
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 15:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i1xXV-0001R4-TQ
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i1xXU-0004wQ-Nh
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:57 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:34191)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i1xXU-0004wC-EB
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 14:46:56 -0400
Received: by mail-qt1-x842.google.com with SMTP id q4so15966567qtp.1
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ECptL8lQSTguMqq/LB40663siPqUvdjJaVqTJAuQZkg=;
 b=ukbeSz1oPi0PIDpCS8VZigWW8EJ986rAkFWfUUnDa912W6hgumtSrPKDjbMCWg3pAi
 Ftfq2dwhe9W/cbxCPwvrxQKtoXXkoB/18sqTDE1h8y+/jhVwQPc2DPDMiiRpiRoBGj5O
 VaqZTAdLFl+S3uYabk3tofLpsCnG1UCxrBu4g5WnxYQmNEvslu//cmTPwVTZGcrsJpcs
 udYzHxZKImH5jySAx8U9twlqX+WmmvUCoiyBhzsZcgnPON9GHhkA8jRiY/oKRq/QzuDj
 VWVyARtmynXyF9+wAIGouP2Hh8prmo3Ua/SqSqF8ah5chlIp2joAMgUMvS4Rc1oIayCr
 sP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ECptL8lQSTguMqq/LB40663siPqUvdjJaVqTJAuQZkg=;
 b=oU/R2MrnvrxI1OFZOxLD098bcQVI/m85q/n/dx2dVfls6RF4+jj7GEJ8klCKLmqiuy
 ttLGKDpATlILM0O9qmXwoXjh0Pr/QR/eaMB3UOSW3RfmgLY2EN1Ap83+tr1p/ph3M78v
 u+Q3hBv1znMR+33zfQRGqHjl8l8vq5WuWeEi/HKTJT+o3YpyLGvZYWjttgzDBGxfFvnC
 LiMZdbwxk0oa2c9UslHP9+u4aNiS4eivP3qDt7dU1c3RlTQOtWpVLOuJi7kGLAqyJVrf
 POjnzwfsHs8lbgT/AwzmuG8v/X0WbXWAlHcgMXFjkE7ZAq/AZIqb5enXUwRh4oWgp+E9
 utDA==
X-Gm-Message-State: APjAAAUje0rVJX9lGwS3EUwqy61u6Q/zbeKVxfGr/UQ1lv79yAU0abqw
 8u9tCkwQlI5QeVtNEos3Iu3Vu5FMpcI=
X-Google-Smtp-Source: APXvYqw6luoS+Pl3cqcPwfZ3U5BLP9SrE446xsh4ckXVzXeceik16Xb8N+y62tQAR2oUivAVJaFU+A==
X-Received: by 2002:a0c:ee82:: with SMTP id u2mr12202963qvr.156.1566758815876; 
 Sun, 25 Aug 2019 11:46:55 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-61b1-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:61b1::5])
 by smtp.gmail.com with ESMTPSA id d3sm5348870qtq.32.2019.08.25.11.46.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 11:46:55 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 25 Aug 2019 20:46:24 +0200
Message-Id: <8ddd9c04b32fca07e3aa4f5a327bcb486a077b2c.1566755452.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566755452.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566755452.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: [Qemu-devel] [PATCH 22/25] paaudio: channel-map option
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an option to change the channel map used by pulseaudio.  If not
specified, falls back to an OSS compatible channel map.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 qapi/audio.json |  7 +++++--
 audio/paaudio.c | 18 ++++++++++++++----
 qemu-options.hx |  9 +++++++++
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/qapi/audio.json b/qapi/audio.json
index dc7f9cb1e2..e9e040a156 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -214,13 +214,16 @@
 # @latency: latency you want PulseAudio to achieve in microseconds
 #           (default 15000)
 #
+# @channel-map: channel map to use (default: OSS compatible map, since: 4.2)
+#
 # Since: 4.0
 ##
 { 'struct': 'AudiodevPaPerDirectionOptions',
   'base': 'AudiodevPerDirectionOptions',
   'data': {
-    '*name': 'str',
-    '*latency': 'uint32' } }
+    '*name':        'str',
+    '*latency':     'uint32',
+    '*channel-map': 'str' } }
 
 ##
 # @AudiodevPaOptions:
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 796890a3a5..4ce4f03c72 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -338,17 +338,27 @@ static pa_stream *qpa_simple_new (
         pa_stream_direction_t dir,
         const char *dev,
         const pa_sample_spec *ss,
-        const pa_channel_map *map,
+        const char *map,
         const pa_buffer_attr *attr,
         int *rerror)
 {
     int r;
     pa_stream *stream;
     pa_stream_flags_t flags;
+    pa_channel_map pa_map;
 
     pa_threaded_mainloop_lock(c->mainloop);
 
-    stream = pa_stream_new(c->context, name, ss, map);
+    if (map && !pa_channel_map_parse(&pa_map, map)) {
+        dolog("Invalid channel map specified: '%s'\n", map);
+        map = NULL;
+    }
+    if (!map) {
+        pa_channel_map_init_extend(&pa_map, ss->channels,
+                                   PA_CHANNEL_MAP_OSS);
+    }
+
+    stream = pa_stream_new(c->context, name, ss, &pa_map);
     if (!stream) {
         goto fail;
     }
@@ -421,7 +431,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
         PA_STREAM_PLAYBACK,
         ppdo->has_name ? ppdo->name : NULL,
         &ss,
-        NULL,                   /* channel map */
+        ppdo->has_channel_map ? ppdo->channel_map : NULL,
         &ba,                    /* buffering attributes */
         &error
         );
@@ -477,7 +487,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
         PA_STREAM_RECORD,
         ppdo->has_name ? ppdo->name : NULL,
         &ss,
-        NULL,                   /* channel map */
+        ppdo->has_channel_map ? ppdo->channel_map : NULL,
         &ba,                    /* buffering attributes */
         &error
         );
diff --git a/qemu-options.hx b/qemu-options.hx
index 8de6deb691..4eb4d6fe6d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -471,6 +471,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "-audiodev pa,id=id[,prop[=value][,...]]\n"
     "                server= PulseAudio server address\n"
     "                in|out.name= source/sink device name\n"
+    "                in|out.channel-map= channel map to use\n"
 #endif
 #ifdef CONFIG_AUDIO_SDL
     "-audiodev sdl,id=id[,prop[=value][,...]]\n"
@@ -636,6 +637,14 @@ Sets the PulseAudio @var{server} to connect to.
 @item in|out.name=@var{sink}
 Use the specified source/sink for recording/playback.
 
+@item in|out.channel-map=@var{map}
+Use the specified channel map.  The default is an OSS compatible
+channel map.  Do not forget to escape commas inside the map:
+
+@example
+-audiodev pa,id=example,sink.channel-map=front-left,,front-right
+@end example
+
 @end table
 
 @item -audiodev sdl,id=@var{id}[,@var{prop}[=@var{value}][,...]]
-- 
2.22.0


