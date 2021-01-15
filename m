Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E6C2F7DCA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:11:12 +0100 (CET)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pol-0003Qx-9K
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3Y-0007DY-Q6
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3B-0003KE-9t
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYqCyIo4OwaI3GXpKHpQHr16hkxGPKuMRBn/0f1Qeuk=;
 b=ff12enlIyAyL71gHJYNC1iYd/gFr62vKBLbz0jaz9a5pb/r7ZJzX2oPFc60Zyzi37MCOax
 rqPbufBSSwbah/rmI8rxhDsPFYkEyKu2Dt/mfwWAD2DqDCy2GuicEbfBrV/OUMSogK6A57
 hXjXXYNWOu3YURaxcclt8dQTQq/Scxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-yTD1UuRcMemhGIayhtp-_g-1; Fri, 15 Jan 2021 08:21:58 -0500
X-MC-Unique: yTD1UuRcMemhGIayhtp-_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2EF2107ACFA;
 Fri, 15 Jan 2021 13:21:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BCE419C71;
 Fri, 15 Jan 2021 13:21:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 422E11800D53; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] audio: Add braces for statements/fix braces' position
Date: Fri, 15 Jan 2021 14:21:40 +0100
Message-Id: <20210115132146.1443592-25-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Han <zhanghan64@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Han <zhanghan64@huawei.com>

Fix problems about braces:
-braces are necessary for all arms of if/for/while statements
-else should follow close brace '}'

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
Message-id: 20210115012431.79533-1-zhanghan64@huawei.com
Message-Id: <20210115012431.79533-2-zhanghan64@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_template.h | 12 ++++--------
 audio/alsaaudio.c      | 15 +++++----------
 audio/audio.c          | 26 ++++++++++++--------------
 audio/coreaudio.c      |  3 +--
 audio/dsoundaudio.c    |  9 +++------
 audio/ossaudio.c       | 12 ++++--------
 6 files changed, 29 insertions(+), 48 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 434df5d5e750..f77210e40435 100644
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
 
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 5a871aaf6b48..fcc2f62864fb 100644
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
index 34c9cb918279..6734c8af708c 100644
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
 
@@ -1532,8 +1532,7 @@ static int audio_driver_init(AudioState *s, struct audio_driver *drv,
         audio_init_nb_voices_in(s, drv);
         s->drv = drv;
         return 0;
-    }
-    else {
+    } else {
         if (msg) {
             dolog("Could not init `%s' audio driver\n", drv->name);
         }
@@ -1848,8 +1847,7 @@ CaptureVoiceOut *AUD_add_capture(
     if (cap) {
         QLIST_INSERT_HEAD (&cap->cb_head, cb, entries);
         return cap;
-    }
-    else {
+    } else {
         HWVoiceOut *hw;
         CaptureVoiceOut *cap;
 
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 79a9d40bf8ef..408b5871261c 100644
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
index d3695f3af653..e59bd83dc717 100644
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
index c1db89f23300..60eff66424b9 100644
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
2.29.2


