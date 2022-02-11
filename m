Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932404B2AC7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:46:28 +0100 (CET)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZ3z-0006Hk-NP
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYuD-0000Wf-7L
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:21 -0500
Received: from [2607:f8b0:4864:20::431] (port=40732
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYuB-0002PZ-83
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:20 -0500
Received: by mail-pf1-x431.google.com with SMTP id a39so16371580pfx.7
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hZyGzPEisEdB5PdeTihzhFaa05yodaju2Fp/TghNxIc=;
 b=SG8JrUD2fWWBw8VF6r5mDCtjVkiin3eO2yd7/fIo2nRQxxbueywGWqI/vYnSmqA4N7
 RO0XZEELyR06Jmd36bI80m63bmAgT/5T9zdo8FB8TgoWHeZKQFwUDEOtYxPyT+l0x7gC
 HB8uTVUlTerClsA9u/d7ik+9OEMyl1gbbwRFDj2OrOosx8QvV+ODrZAvPaN0cng5YC/D
 vW5acJxIDWTMCb7ohPVZvYxT++vPlDbqnnUOZxeORmDKcN94/ynoVIrWA2tfjEd+/Vee
 6F0JewGrYNag0snE8pKTfv02ujdbhX5hEvRlgyIjG52vLuEhxOVaMr5QcH1JY96Npwh6
 Q2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hZyGzPEisEdB5PdeTihzhFaa05yodaju2Fp/TghNxIc=;
 b=vKl9+LTTHsz/7h7W4+r4IsplmrzKv9bQs0lL8C5TQaz9WZ5Ea8VOh7XZPBFcYpENX6
 WvzuJwTUjld5rIvZUYT3nBofG3RpOeNz6CGNlz/x91xjkvo8CIuWvzh94hJn0LzH0htA
 hNJAiYNEIsZhoYZLcjdYCF/2WikyUqEA1tXtuIKeLr1mB3/5IgVl3sED+K6kV5jxcEEB
 dMmltHnkc3ZzvvIxdETwSb5Ckampbo4ePF+KHrXFygK3qhFydC/e8iInRtC0yQwCcH89
 CTYwQG4BMIyUodPAM5CsifI8iXt1+BZ6j8/u008F35bjJUZNOR1oy62+6ODjETl+sPVl
 mryQ==
X-Gm-Message-State: AOAM530UV7Eyhe3ebTECambLPBBjzdXDP7jPtTF0ZWfj8DaIl5J68FN1
 NMl85e6sZYYgIHCNh4w90RJlT6TLZic=
X-Google-Smtp-Source: ABdhPJxydASZEfHPxrfF0itHkcVyHUl+2gTEx8/fLAtPOhwLOaooMoH4HlLNe6hBYiXvZ+eX6tKV9A==
X-Received: by 2002:a63:e207:: with SMTP id q7mr1999565pgh.593.1644597376744; 
 Fri, 11 Feb 2022 08:36:16 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id rj12sm5859278pjb.41.2022.02.11.08.36.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:36:16 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <roman@roolebo.dev>
Subject: [PATCH v4 10/13] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Date: Fri, 11 Feb 2022 17:34:31 +0100
Message-Id: <20220211163434.58423-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When building on macOS 12 we get:

  audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is deprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declarations]
      kAudioObjectPropertyElementMaster
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      kAudioObjectPropertyElementMain
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated here
      kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) = kAudioObjectPropertyElementMain
      ^

Replace by kAudioObjectPropertyElementMain, redefining it to
kAudioObjectPropertyElementMaster if not available.

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Suggested-by: Roman Bolshakov <roman@roolebo.dev>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/coreaudio.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index d8a21d3e50..5b3aeaced0 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
     bool enabled;
 } coreaudioVoiceOut;
 
+#if !defined(MAC_OS_VERSION_12_0) \
+    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
+#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
+#endif
+
 static const AudioObjectPropertyAddress voice_addr = {
     kAudioHardwarePropertyDefaultOutputDevice,
     kAudioObjectPropertyScopeGlobal,
-    kAudioObjectPropertyElementMaster
+    kAudioObjectPropertyElementMain
 };
 
 static OSStatus coreaudio_get_voice(AudioDeviceID *id)
@@ -69,7 +74,7 @@ static OSStatus coreaudio_get_framesizerange(AudioDeviceID id,
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSizeRange,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
@@ -86,7 +91,7 @@ static OSStatus coreaudio_get_framesize(AudioDeviceID id, UInt32 *framesize)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSize,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
@@ -103,7 +108,7 @@ static OSStatus coreaudio_set_framesize(AudioDeviceID id, UInt32 *framesize)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyBufferFrameSize,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectSetPropertyData(id,
@@ -121,7 +126,7 @@ static OSStatus coreaudio_set_streamformat(AudioDeviceID id,
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyStreamFormat,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectSetPropertyData(id,
@@ -138,7 +143,7 @@ static OSStatus coreaudio_get_isrunning(AudioDeviceID id, UInt32 *result)
     AudioObjectPropertyAddress addr = {
         kAudioDevicePropertyDeviceIsRunning,
         kAudioDevicePropertyScopeOutput,
-        kAudioObjectPropertyElementMaster
+        kAudioObjectPropertyElementMain
     };
 
     return AudioObjectGetPropertyData(id,
-- 
2.34.1


