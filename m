Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113112F7038
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:51:09 +0100 (CET)
Received: from localhost ([::1]:39226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0EGa-0002St-5k
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6b-0003EJ-Ok; Thu, 14 Jan 2021 20:40:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1l0E6V-0006NZ-Cu; Thu, 14 Jan 2021 20:40:49 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH3kX3gh0zMKbM;
 Fri, 15 Jan 2021 09:39:16 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 15 Jan 2021
 09:40:29 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH v2 1/7] audio: Add braces for statements/fix braces' position
Date: Fri, 15 Jan 2021 09:24:25 +0800
Message-ID: <20210115012431.79533-2-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20210115012431.79533-1-zhanghan64@huawei.com>
References: <20210115012431.79533-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhanghan64@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com,
 zhanghan64@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix problems about braces:
-braces are necessary for all arms of if/for/while statements
-else should follow close brace '}'

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 audio/alsaaudio.c      | 15 +++++----------
 audio/audio.c          | 26 ++++++++++++--------------
 audio/audio_template.h | 12 ++++--------
 audio/coreaudio.c      |  3 +--
 audio/dsoundaudio.c    |  9 +++------
 audio/ossaudio.c       | 12 ++++--------
 6 files changed, 29 insertions(+), 48 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index a8e62542f9..480b64b4c6 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -278,32 +278,28 @@ static snd_pcm_format_t aud_to_alsafmt (AudioFormat fmt, int endianness)
     case AUDIO_FORMAT_S16:
         if (endianness) {
             return SND_PCM_FORMAT_S16_BE;
-        }
-        else {
+        } else {
             return SND_PCM_FORMAT_S16_LE;
         }
 
     case AUDIO_FORMAT_U16:
         if (endianness) {
             return SND_PCM_FORMAT_U16_BE;
-        }
-        else {
+        } else {
             return SND_PCM_FORMAT_U16_LE;
         }
 
     case AUDIO_FORMAT_S32:
         if (endianness) {
             return SND_PCM_FORMAT_S32_BE;
-        }
-        else {
+        } else {
             return SND_PCM_FORMAT_S32_LE;
         }
 
     case AUDIO_FORMAT_U32:
         if (endianness) {
             return SND_PCM_FORMAT_U32_BE;
-        }
-        else {
+        } else {
             return SND_PCM_FORMAT_U32_LE;
         }
 
@@ -722,8 +718,7 @@ static int alsa_voice_ctl (snd_pcm_t *handle, const char *typ, int ctl)
             alsa_logerr (err, "Could not stop %s\n", typ);
             return -1;
         }
-    }
-    else {
+    } else {
         err = snd_pcm_prepare (handle);
         if (err < 0) {
             alsa_logerr (err, "Could not prepare handle for %s\n", typ);
diff --git a/audio/audio.c b/audio/audio.c
index b48471bb3f..55834ac8c8 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -344,8 +344,7 @@ void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, int len)
 
     if (info->is_signed || info->is_float) {
         memset(buf, 0x00, len * info->bytes_per_frame);
-    }
-    else {
+    } else {
         switch (info->bits) {
         case 8:
             memset(buf, 0x80, len * info->bytes_per_frame);
@@ -584,8 +583,7 @@ static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn *sw)
     rpos = hw->conv_buf->pos - live;
     if (rpos >= 0) {
         return rpos;
-    }
-    else {
+    } else {
         return hw->conv_buf->size + rpos;
     }
 }
@@ -788,10 +786,14 @@ static int audio_is_timer_needed(AudioState *s)
     HWVoiceOut *hwo = NULL;
 
     while ((hwo = audio_pcm_hw_find_any_enabled_out(s, hwo))) {
-        if (!hwo->poll_mode) return 1;
+        if (!hwo->poll_mode) {
+            return 1;
+        }
     }
     while ((hwi = audio_pcm_hw_find_any_enabled_in(s, hwi))) {
-        if (!hwi->poll_mode) return 1;
+        if (!hwi->poll_mode) {
+            return 1;
+        }
     }
     return 0;
 }
@@ -908,8 +910,7 @@ void AUD_set_active_out (SWVoiceOut *sw, int on)
                     audio_reset_timer (s);
                 }
             }
-        }
-        else {
+        } else {
             if (hw->enabled) {
                 int nb_active = 0;
 
@@ -956,8 +957,7 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
                 }
             }
             sw->total_hw_samples_acquired = hw->total_samples_captured;
-        }
-        else {
+        } else {
             if (hw->enabled) {
                 int nb_active = 0;
 
@@ -1540,8 +1540,7 @@ static int audio_driver_init(AudioState *s, struct audio_driver *drv,
         audio_init_nb_voices_in(s, drv);
         s->drv = drv;
         return 0;
-    }
-    else {
+    } else {
         if (msg) {
             dolog("Could not init `%s' audio driver\n", drv->name);
         }
@@ -1856,8 +1855,7 @@ CaptureVoiceOut *AUD_add_capture(
     if (cap) {
         QLIST_INSERT_HEAD (&cap->cb_head, cb, entries);
         return cap;
-    }
-    else {
+    } else {
         HWVoiceOut *hw;
         CaptureVoiceOut *cap;
 
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 8dd48ce14e..236db7136b 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -47,8 +47,7 @@ static void glue(audio_init_nb_voices_, TYPE)(AudioState *s,
 #ifdef DAC
             dolog ("Driver `%s' does not support " NAME "\n", drv->name);
 #endif
-        }
-        else {
+        } else {
             dolog ("Driver `%s' does not support %d " NAME " voices, max %d\n",
                    drv->name,
                    glue (s->nb_hw_voices_, TYPE),
@@ -387,8 +386,7 @@ static SW *glue(audio_pcm_create_voice_pair_, TYPE)(
 
     if (pdo->fixed_settings) {
         hw_as = audiodev_to_audsettings(pdo);
-    }
-    else {
+    } else {
         hw_as = *as;
     }
 
@@ -498,8 +496,7 @@ SW *glue (AUD_open_, TYPE) (
         if (glue (audio_pcm_sw_init_, TYPE) (sw, hw, name, as)) {
             goto fail;
         }
-    }
-    else {
+    } else {
         sw = glue(audio_pcm_create_voice_pair_, TYPE)(s, name, as);
         if (!sw) {
             dolog ("Failed to create voice `%s'\n", name);
@@ -553,8 +550,7 @@ uint64_t glue (AUD_get_elapsed_usec_, TYPE) (SW *sw, QEMUAudioTimeStamp *ts)
 
     if (cur_ts >= old_ts) {
         delta = cur_ts - old_ts;
-    }
-    else {
+    } else {
         delta = UINT64_MAX - old_ts + cur_ts;
     }
 
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 79a9d40bf8..408b587126 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -524,8 +524,7 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     } else if (frameRange.mMaximum < frames) {
         core->audioDevicePropertyBufferFrameSize = (UInt32) frameRange.mMaximum;
         dolog ("warning: Downsizing Buffer Frames to %f\n", frameRange.mMaximum);
-    }
-    else {
+    } else {
         core->audioDevicePropertyBufferFrameSize = frames;
     }
 
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 4cdf19ab67..ba201898e1 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -404,8 +404,7 @@ static void dsound_enable_out(HWVoiceOut *hw, bool enable)
                 dsound_logerr (hr, "Could not stop playing buffer\n");
                 return;
             }
-        }
-        else {
+        } else {
             dolog ("warning: Voice is not playing\n");
         }
     }
@@ -509,8 +508,7 @@ static void dsound_enable_in(HWVoiceIn *hw, bool enable)
                 dsound_logerr (hr, "Could not stop capturing\n");
                 return;
             }
-        }
-        else {
+        } else {
             dolog ("warning: Voice is not capturing\n");
         }
     }
@@ -659,8 +657,7 @@ static void *dsound_audio_init(Audiodev *dev)
         );
     if (FAILED (hr)) {
         dsound_logerr (hr, "Could not create DirectSoundCapture instance\n");
-    }
-    else {
+    } else {
         hr = IDirectSoundCapture_Initialize (s->dsound_capture, NULL);
         if (FAILED (hr)) {
             dsound_logerr (hr, "Could not initialize DirectSoundCapture\n");
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index a7dcaa31ad..e9f81e9b9c 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -142,16 +142,14 @@ static int aud_to_ossfmt (AudioFormat fmt, int endianness)
     case AUDIO_FORMAT_S16:
         if (endianness) {
             return AFMT_S16_BE;
-        }
-        else {
+        } else {
             return AFMT_S16_LE;
         }
 
     case AUDIO_FORMAT_U16:
         if (endianness) {
             return AFMT_U16_BE;
-        }
-        else {
+        } else {
             return AFMT_U16_LE;
         }
 
@@ -542,16 +540,14 @@ static int oss_init_out(HWVoiceOut *hw, struct audsettings *as,
             int trig = 0;
             if (ioctl (fd, SNDCTL_DSP_SETTRIGGER, &trig) < 0) {
                 oss_logerr (errno, "SNDCTL_DSP_SETTRIGGER 0 failed\n");
-            }
-            else {
+            } else {
                 trig = PCM_ENABLE_OUTPUT;
                 if (ioctl (fd, SNDCTL_DSP_SETTRIGGER, &trig) < 0) {
                     oss_logerr (
                         errno,
                         "SNDCTL_DSP_SETTRIGGER PCM_ENABLE_OUTPUT failed\n"
                         );
-                }
-                else {
+                } else {
                     oss->mmapped = 1;
                 }
             }
-- 
2.29.1.59.gf9b6481aed


