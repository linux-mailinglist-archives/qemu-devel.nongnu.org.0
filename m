Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEF4CEE74
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:25:29 +0100 (CET)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Fk-0005HY-Ok
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:25:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09B-00079a-U7; Sun, 06 Mar 2022 18:18:41 -0500
Received: from [2a00:1450:4864:20::429] (port=35781
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR099-0007Nb-Vm; Sun, 06 Mar 2022 18:18:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id b5so20692595wrr.2;
 Sun, 06 Mar 2022 15:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ueCRNYHpSl6dEFkGrmfKFWZkvVO5EBSCasWZO0J78vo=;
 b=U5ei4TH3S8XxIZlt4RgO+7P/tBEUcV6o7xcG2x5CJynAWXi0/Rtam26DJtjtw0Etco
 1Ei/xB6BgfLok483qLS7wVNwdqNKqTxt0GT9QyNznCUEKCts23Gz39PHtO/51JTrK7dX
 6NDBvkrw4a2R5sXHlTqfzfDOnDVvBbK4yAaCdv0LOUBpvxVsYRgVfv9Vfigfe8tZoCLE
 cuYNKK9mBtnXVTwDFYaTpXTIgpTFuezC1VUjhOdHbOLicQxkQxByCG8VHJvsovHJd77I
 NDHyuw0wAsMmN87bjpsr8DlYH8MjwtmadgpOdMqj6WXR5nAIh7s1Bk9saHypiwBaVRyj
 D4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ueCRNYHpSl6dEFkGrmfKFWZkvVO5EBSCasWZO0J78vo=;
 b=686ID9CmYTeeIw70d9jJ9MVm9ClWLvqLCRq06StAtQSncTOt9b3NTkzIpKchTjQD9j
 uG2V5WghCotKj8LmkGtM/7CMReDL+UC6QMkFiIKU4bts58Rg37iKMpmp9Gp/KVYBTz6i
 gjTjU26/9mJZHSJ0LLPQpApLGIy2oGp62IAeDHn91Rstm5ALjteiRT4IzZjtv9TbPvoi
 FbJyvkBSXyoRfVif6UUhXbYv72iXORrZyKuavABjmVeRA8XYgdvJqBLMYOmcZcZnPKDy
 BS+RPiUeAwdied1Bs5ajj1GXRX7tPQihNsgIVu+Ym8/pASxoZzUOK7IDITYKjaS+yAlW
 65fQ==
X-Gm-Message-State: AOAM532UxgWvOv8Qq4pwB3ttDhEsiZsCRBVQ54t+a8MnrCI7D4zQwsbn
 rDLVrcBm6pKV/AUbm2ZUHHMmTH9tTEU=
X-Google-Smtp-Source: ABdhPJyelMFuK8tCm+0iVxr5V3OhDo4zrLlUwOc/INeybtyOEL1KQrwReidrzNoYpu7HJT+oISRp1w==
X-Received: by 2002:adf:d1ec:0:b0:1f1:e586:87ae with SMTP id
 g12-20020adfd1ec000000b001f1e58687aemr4886744wrd.619.1646608718072; 
 Sun, 06 Mar 2022 15:18:38 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00380fc02ff76sm12243212wms.15.2022.03.06.15.18.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/22] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Date: Mon,  7 Mar 2022 00:17:39 +0100
Message-Id: <20220306231753.50277-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/coreaudio.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 0f19d0ce01..23d7593eb9 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
     bool enabled;
 } coreaudioVoiceOut;
 
+#if !defined(MAC_OS_VERSION_12_0) \
+    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
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


