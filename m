Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158E327D89
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:49:05 +0100 (CET)
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh2u-00028u-GO
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lGh07-0008Tu-0y
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:46:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lGh03-0002dS-GG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:46:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id e9so11654721pjj.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdACp36e+s+mlNYlSEiLw0HuK3TyWnXe5vN5WJyv0+g=;
 b=YaSIoOOkwi4PukaGZzx2pRZ1P3/oKhZabcujBWs7P9DtZaX1A23I2hdR7Jbwr79JA3
 hpZp0v7mRux4AXCbzrXkcp8uFIJA62JdNZmZv/2yoJ2tO6YL7OVqLJY0QUzM5X8HLkmf
 iYPCeSfeh6D44HnmrFVftKuU65FQVB14/zRpPLy4Qj3tx9uKEkOifAfam/1xVCyM0fa7
 iAvtEVy1sI9TvbE/UmYX9/RJuAxa4vepvOYGco5j02Kv2Jf4dH4q9Bb+DJIDSiuAcWZE
 lAZQFv+yXwm0xU4h8eBOAYLzSOEvQYFx47+1udQsEiEhdzQLcV/nzvhxgN7H+RAeyEmH
 MGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdACp36e+s+mlNYlSEiLw0HuK3TyWnXe5vN5WJyv0+g=;
 b=TqD6CntCQ3zCiFXSzmyqjhYKnfcxw+XNyvgjZq0P/Ax/wzJHyqq9FDqj/h2XjHCV3p
 J4mfXnj00QyNsIFj4aUfP7ZMJYKPdWb0b1ImFmHrnOUUbHMgFtkNUInJkWeEWHdRHCYO
 LlZNyW+13KiitTd/woLStADIz8/1rZPvRkR/EKXtCkxV/lj60zq5Z3JmMCg2HxMra0DJ
 BLDR3FcThX6sU7MqiKcDk+ERQDbXbRpfaW8qzW+zSjiuPqCjLESwHR7h1bs0yAFqjecc
 KS2j4JwzTnJtWbsqYzesNsYjSTnsu7pcYgr2+BUfy3JFsGJGg2wFXP4zSPh6J2QJyWtk
 3uNA==
X-Gm-Message-State: AOAM532IttNog2AsV/BtmN/zEktwKckkUD8WrJxywCNtbfGznvnzkwJN
 WHui/aFD7QHBe/ZHA0wtw1OJ+OPNyXwOew==
X-Google-Smtp-Source: ABdhPJx2Sj4cvyGoldIn3YuAl1SBBlT7EyU7qmnOV3gWZZ67Fb6Wz1U1ePo4RLi75StBWnZWYOK5jQ==
X-Received: by 2002:a17:902:45:b029:e4:a5b2:ffa4 with SMTP id
 63-20020a1709020045b02900e4a5b2ffa4mr6443515pla.18.1614599165700; 
 Mon, 01 Mar 2021 03:46:05 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:2504:67d:ba0f:9c4b])
 by smtp.gmail.com with ESMTPSA id l22sm17170321pjy.6.2021.03.01.03.46.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Mar 2021 03:46:05 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 2/2] coreaudio: Handle output device change
Date: Mon,  1 Mar 2021 20:45:54 +0900
Message-Id: <20210301114554.9430-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210301114554.9430-1-akihiko.odaki@gmail.com>
References: <20210301114554.9430-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An output device change can occur when plugging or unplugging an
earphone.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 audio/coreaudio.c | 327 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 236 insertions(+), 91 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index c5f0b615d64..578ec9b8b2e 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -36,22 +36,26 @@ typedef struct coreaudioVoiceOut {
     HWVoiceOut hw;
     pthread_mutex_t mutex;
     AudioDeviceID outputDeviceID;
+    int frameSizeSetting;
+    uint32_t bufferCount;
     UInt32 audioDevicePropertyBufferFrameSize;
     AudioStreamBasicDescription outputStreamBasicDescription;
     AudioDeviceIOProcID ioprocid;
+    bool enabled;
 } coreaudioVoiceOut;
 
+static const AudioObjectPropertyAddress voice_addr = {
+    kAudioHardwarePropertyDefaultOutputDevice,
+    kAudioObjectPropertyScopeGlobal,
+    kAudioObjectPropertyElementMaster
+};
+
 static OSStatus coreaudio_get_voice(AudioDeviceID *id)
 {
     UInt32 size = sizeof(*id);
-    AudioObjectPropertyAddress addr = {
-        kAudioHardwarePropertyDefaultOutputDevice,
-        kAudioObjectPropertyScopeGlobal,
-        kAudioObjectPropertyElementMaster
-    };
 
     return AudioObjectGetPropertyData(kAudioObjectSystemObject,
-                                      &addr,
+                                      &voice_addr,
                                       0,
                                       NULL,
                                       &size,
@@ -253,17 +257,8 @@ static void GCC_FMT_ATTR (3, 4) coreaudio_logerr2 (
     coreaudio_logstatus (status);
 }
 
-static inline UInt32 isPlaying (AudioDeviceID outputDeviceID)
-{
-    OSStatus status;
-    UInt32 result = 0;
-    status = coreaudio_get_isrunning(outputDeviceID, &result);
-    if (status != kAudioHardwareNoError) {
-        coreaudio_logerr(status,
-                         "Could not determine whether Device is playing\n");
-    }
-    return result;
-}
+#define coreaudio_playback_logerr(status, ...) \
+    coreaudio_logerr2(status, "playback", __VA_ARGS__)
 
 static int coreaudio_lock (coreaudioVoiceOut *core, const char *fn_name)
 {
@@ -336,6 +331,11 @@ static OSStatus audioDeviceIOProc(
         return 0;
     }
 
+    if (inDevice != core->outputDeviceID) {
+        coreaudio_unlock (core, "audioDeviceIOProc(old device)");
+        return 0;
+    }
+
     frameCount = core->audioDevicePropertyBufferFrameSize;
     pending_frames = hw->pending_emul / hw->info.bytes_per_frame;
 
@@ -368,175 +368,320 @@ static OSStatus audioDeviceIOProc(
     return 0;
 }
 
-static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
-                              void *drv_opaque)
+static OSStatus init_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
-    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
-    int err;
-    const char *typ = "playback";
     AudioValueRange frameRange;
-    Audiodev *dev = drv_opaque;
-    AudiodevCoreaudioPerDirectionOptions *cpdo = dev->u.coreaudio.out;
-    int frames;
-    struct audsettings obt_as;
-
-    /* create mutex */
-    err = pthread_mutex_init(&core->mutex, NULL);
-    if (err) {
-        dolog("Could not create mutex\nReason: %s\n", strerror (err));
-        return -1;
-    }
-
-    obt_as = *as;
-    as = &obt_as;
-    as->fmt = AUDIO_FORMAT_F32;
-    audio_pcm_init_info (&hw->info, as);
 
     status = coreaudio_get_voice(&core->outputDeviceID);
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get default output Device\n");
-        return -1;
+        coreaudio_playback_logerr (status,
+                                   "Could not get default output Device\n");
+        return status;
     }
     if (core->outputDeviceID == kAudioDeviceUnknown) {
-        dolog ("Could not initialize %s - Unknown Audiodevice\n", typ);
-        return -1;
+        dolog ("Could not initialize playback - Unknown Audiodevice\n");
+        return status;
     }
 
     /* get minimum and maximum buffer frame sizes */
     status = coreaudio_get_framesizerange(core->outputDeviceID,
                                           &frameRange);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get device buffer frame range\n");
-        return -1;
+        coreaudio_playback_logerr (status,
+                                    "Could not get device buffer frame range\n");
+        return status;
     }
 
-    frames = audio_buffer_frames(
-        qapi_AudiodevCoreaudioPerDirectionOptions_base(cpdo), as, 11610);
-    if (frameRange.mMinimum > frames) {
+    if (frameRange.mMinimum > core->frameSizeSetting) {
         core->audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMinimum;
         dolog ("warning: Upsizing Buffer Frames to %f\n", frameRange.mMinimum);
-    } else if (frameRange.mMaximum < frames) {
+    } else if (frameRange.mMaximum < core->frameSizeSetting) {
         core->audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMaximum;
         dolog ("warning: Downsizing Buffer Frames to %f\n", frameRange.mMaximum);
     } else {
-        core->audioDevicePropertyBufferFrameSize = frames;
+        core->audioDevicePropertyBufferFrameSize = core->frameSizeSetting;
     }
 
     /* set Buffer Frame Size */
     status = coreaudio_set_framesize(core->outputDeviceID,
                                      &core->audioDevicePropertyBufferFrameSize);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not set device buffer frame size %" PRIu32 "\n",
-                           (uint32_t)core->audioDevicePropertyBufferFrameSize);
-        return -1;
+        coreaudio_playback_logerr (status,
+                                    "Could not set device buffer frame size %" PRIu32 "\n",
+                                    (uint32_t)core->audioDevicePropertyBufferFrameSize);
+        return status;
     }
 
     /* get Buffer Frame Size */
     status = coreaudio_get_framesize(core->outputDeviceID,
                                      &core->audioDevicePropertyBufferFrameSize);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get device buffer frame size\n");
-        return -1;
+        coreaudio_playback_logerr (status,
+                                    "Could not get device buffer frame size\n");
+        return status;
     }
-    hw->samples = (cpdo->has_buffer_count ? cpdo->buffer_count : 4) *
-        core->audioDevicePropertyBufferFrameSize;
+    core->hw.samples = core->bufferCount * core->audioDevicePropertyBufferFrameSize;
 
     /* get StreamFormat */
     status = coreaudio_get_streamformat(core->outputDeviceID,
                                         &core->outputStreamBasicDescription);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ,
-                           "Could not get Device Stream properties\n");
+        coreaudio_playback_logerr (status,
+                                    "Could not get Device Stream properties\n");
         core->outputDeviceID = kAudioDeviceUnknown;
-        return -1;
+        return status;
     }
 
     /* set Samplerate */
-    core->outputStreamBasicDescription.mSampleRate = (Float64) as->freq;
-
     status = coreaudio_set_streamformat(core->outputDeviceID,
                                         &core->outputStreamBasicDescription);
+    if (status == kAudioHardwareBadObjectError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError) {
-        coreaudio_logerr2 (status, typ, "Could not set samplerate %d\n",
-                           as->freq);
+        coreaudio_playback_logerr (status,
+                                   "Could not set samplerate %lf\n",
+                                   core->outputStreamBasicDescription.mSampleRate);
         core->outputDeviceID = kAudioDeviceUnknown;
-        return -1;
+        return status;
     }
 
     /* set Callback */
     core->ioprocid = NULL;
     status = AudioDeviceCreateIOProcID(core->outputDeviceID,
                                        audioDeviceIOProc,
-                                       hw,
+                                       &core->hw,
                                        &core->ioprocid);
+    if (status == kAudioHardwareBadDeviceError) {
+        return 0;
+    }
     if (status != kAudioHardwareNoError || core->ioprocid == NULL) {
-        coreaudio_logerr2 (status, typ, "Could not set IOProc\n");
+        coreaudio_playback_logerr (status, "Could not set IOProc\n");
         core->outputDeviceID = kAudioDeviceUnknown;
-        return -1;
+        return status;
     }
 
     return 0;
 }
 
-static void coreaudio_fini_out (HWVoiceOut *hw)
+static void fini_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
-    int err;
-    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
+    UInt32 isrunning;
 
     /* stop playback */
-    if (isPlaying(core->outputDeviceID)) {
-        status = AudioDeviceStop(core->outputDeviceID, core->ioprocid);
+    status = coreaudio_get_isrunning(core->outputDeviceID, &isrunning);
+    if (status != kAudioHardwareBadObjectError) {
         if (status != kAudioHardwareNoError) {
-            coreaudio_logerr(status, "Could not stop playback\n");
+            coreaudio_logerr(status,
+                             "Could not determine whether Device is playing\n");
+        }
+
+        if (isrunning) {
+            status = AudioDeviceStop(core->outputDeviceID, core->ioprocid);
+            if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
+                coreaudio_logerr(status, "Could not stop playback\n");
+            }
         }
     }
 
     /* remove callback */
     status = AudioDeviceDestroyIOProcID(core->outputDeviceID,
                                         core->ioprocid);
-    if (status != kAudioHardwareNoError) {
+    if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
         coreaudio_logerr(status, "Could not remove IOProc\n");
     }
     core->outputDeviceID = kAudioDeviceUnknown;
-
-    /* destroy mutex */
-    err = pthread_mutex_destroy(&core->mutex);
-    if (err) {
-        dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
-    }
 }
 
-static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
+static void update_device_playback_state(coreaudioVoiceOut *core)
 {
     OSStatus status;
-    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
+    UInt32 isrunning;
 
-    if (enable) {
+    status = coreaudio_get_isrunning(core->outputDeviceID, &isrunning);
+    if (status != kAudioHardwareNoError) {
+        if (status != kAudioHardwareBadObjectError) {
+            coreaudio_logerr(status,
+                             "Could not determine whether Device is playing\n");
+        }
+
+        return;
+    }
+
+    if (core->enabled) {
         /* start playback */
-        if (!isPlaying(core->outputDeviceID)) {
+        if (!isrunning) {
             status = AudioDeviceStart(core->outputDeviceID, core->ioprocid);
-            if (status != kAudioHardwareNoError) {
+            if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
                 coreaudio_logerr (status, "Could not resume playback\n");
             }
         }
     } else {
         /* stop playback */
-        if (isPlaying(core->outputDeviceID)) {
+        if (isrunning) {
             status = AudioDeviceStop(core->outputDeviceID,
                                      core->ioprocid);
-            if (status != kAudioHardwareNoError) {
+            if (status != kAudioHardwareBadDeviceError && status != kAudioHardwareNoError) {
                 coreaudio_logerr(status, "Could not pause playback\n");
             }
         }
     }
 }
 
+static OSStatus handle_voice_change(
+    AudioObjectID in_object_id,
+    UInt32 in_number_addresses,
+    const AudioObjectPropertyAddress *in_addresses,
+    void *in_client_data)
+{
+    OSStatus status;
+    coreaudioVoiceOut *core = in_client_data;
+
+    if (coreaudio_lock(core, __func__)) {
+        abort();
+    }
+
+    if (core->outputDeviceID) {
+        fini_out_device(core);
+    }
+
+    status = init_out_device(core);
+    if (!status) {
+        update_device_playback_state(core);
+    }
+
+    coreaudio_unlock (core, __func__);
+    return status;
+}
+
+static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
+                              void *drv_opaque)
+{
+    OSStatus status;
+    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
+    int err;
+    Audiodev *dev = drv_opaque;
+    AudiodevCoreaudioPerDirectionOptions *cpdo = dev->u.coreaudio.out;
+    struct audsettings obt_as;
+
+    /* create mutex */
+    err = pthread_mutex_init(&core->mutex, NULL);
+    if (err) {
+        dolog("Could not create mutex\nReason: %s\n", strerror (err));
+        goto mutex_error;
+    }
+
+    if (coreaudio_lock(core, __func__)) {
+        goto lock_error;
+    }
+
+    obt_as = *as;
+    as = &obt_as;
+    as->fmt = AUDIO_FORMAT_F32;
+    audio_pcm_init_info (&hw->info, as);
+
+    core->frameSizeSetting = audio_buffer_frames(
+        qapi_AudiodevCoreaudioPerDirectionOptions_base(cpdo), as, 11610);
+
+    core->bufferCount = cpdo->has_buffer_count ? cpdo->buffer_count : 4;
+    core->outputStreamBasicDescription.mSampleRate = (Float64) as->freq;
+
+    status = AudioObjectAddPropertyListener(kAudioObjectSystemObject,
+                                            &voice_addr, handle_voice_change,
+                                            core);
+    if (status != kAudioHardwareNoError) {
+        coreaudio_playback_logerr (status,
+                                   "Could not listen to voice property change\n");
+        goto listener_error;
+    }
+
+    if (init_out_device(core)) {
+        goto device_error;
+    }
+
+    coreaudio_unlock(core, __func__);
+    return 0;
+
+device_error:
+    status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
+                                               &voice_addr,
+                                               handle_voice_change,
+                                               core);
+    if (status != kAudioHardwareNoError) {
+        coreaudio_playback_logerr(status,
+                                  "Could not remove voice property change listener\n");
+    }
+
+listener_error:
+    coreaudio_unlock(core, __func__);
+
+lock_error:
+    err = pthread_mutex_destroy(&core->mutex);
+    if (err) {
+        dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
+    }
+
+mutex_error:
+    return -1;
+}
+
+static void coreaudio_fini_out (HWVoiceOut *hw)
+{
+    OSStatus status;
+    int err;
+    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
+
+    if (coreaudio_lock(core, __func__)) {
+        abort();
+    }
+
+    status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
+                                               &voice_addr,
+                                               handle_voice_change,
+                                               core);
+    if (status != kAudioHardwareNoError) {
+        coreaudio_logerr(status, "Could not remove voice property change listener\n");
+    }
+
+    fini_out_device(core);
+
+    coreaudio_unlock(core, __func__);
+
+    /* destroy mutex */
+    err = pthread_mutex_destroy(&core->mutex);
+    if (err) {
+        dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
+    }
+}
+
+static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
+{
+    coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
+
+    if (coreaudio_lock(core, __func__)) {
+        abort();
+    }
+
+    core->enabled = enable;
+    update_device_playback_state(core);
+
+    coreaudio_unlock(core, __func__);
+}
+
 static void *coreaudio_audio_init(Audiodev *dev)
 {
     return dev;
-- 
2.24.3 (Apple Git-128)


