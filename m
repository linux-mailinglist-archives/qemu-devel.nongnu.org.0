Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD26BC1CF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 08:35:18 +0200 (CEST)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCePt-0007ko-1o
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 02:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iCeBF-0003iT-7n
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 02:20:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iCeBD-0000um-Md
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 02:20:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58978)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iCeBD-0000uZ-Cb
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 02:20:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A68CF10DCC8A;
 Tue, 24 Sep 2019 06:20:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D474D5D9CA;
 Tue, 24 Sep 2019 06:19:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 097F69CBC; Tue, 24 Sep 2019 08:19:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] audio: remove remains of the old backend api
Date: Tue, 24 Sep 2019 08:19:48 +0200
Message-Id: <20190924061951.27916-14-kraxel@redhat.com>
In-Reply-To: <20190924061951.27916-1-kraxel@redhat.com>
References: <20190924061951.27916-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 24 Sep 2019 06:20:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Kővágó@redhat.com, Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?q?Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: 497decab6d0f0fb9529bea63ec7ce0bd7b553038.1568927990.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h |  7 -------
 audio/audio.c     | 42 ++++++------------------------------------
 2 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 8fb1ca8a8d0f..c76d7c39e84c 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -153,7 +153,6 @@ struct audio_driver {
 struct audio_pcm_ops {
     int    (*init_out)(HWVoiceOut *hw, audsettings *as, void *drv_opaque=
);
     void   (*fini_out)(HWVoiceOut *hw);
-    size_t (*run_out)(HWVoiceOut *hw, size_t live);
     size_t (*write)   (HWVoiceOut *hw, void *buf, size_t size);
     /*
      * get a buffer that after later can be passed to put_buffer_out; op=
tional
@@ -171,7 +170,6 @@ struct audio_pcm_ops {
=20
     int    (*init_in) (HWVoiceIn *hw, audsettings *as, void *drv_opaque)=
;
     void   (*fini_in) (HWVoiceIn *hw);
-    size_t (*run_in)(HWVoiceIn *hw);
     size_t (*read)    (HWVoiceIn *hw, void *buf, size_t size);
     void  *(*get_buffer_in)(HWVoiceIn *hw, size_t *size);
     void   (*put_buffer_in)(HWVoiceIn *hw, void *buf, size_t size);
@@ -237,11 +235,6 @@ audio_driver *audio_driver_lookup(const char *name);
 void audio_pcm_init_info (struct audio_pcm_info *info, struct audsetting=
s *as);
 void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, i=
nt len);
=20
-size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw);
-
-size_t audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf,
-                             size_t live, size_t pending);
-
 int audio_bug (const char *funcname, int cond);
 void *audio_calloc (const char *funcname, int nmemb, size_t size);
=20
diff --git a/audio/audio.c b/audio/audio.c
index e29a1e15eb30..435bcf20c139 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -541,7 +541,7 @@ static size_t audio_pcm_hw_find_min_in (HWVoiceIn *hw=
)
     return m;
 }
=20
-size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
+static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
 {
     size_t live =3D hw->total_samples_captured - audio_pcm_hw_find_min_i=
n (hw);
     if (audio_bug(__func__, live > hw->samples)) {
@@ -551,29 +551,7 @@ size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     return live;
 }
=20
-size_t audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf,
-                             size_t live, size_t pending)
-{
-    size_t left =3D hw->samples - pending;
-    size_t len =3D MIN (left, live);
-    size_t clipped =3D 0;
-
-    while (len) {
-        struct st_sample *src =3D hw->mix_buf + hw->rpos;
-        uint8_t *dst =3D advance (pcm_buf, hw->rpos << hw->info.shift);
-        size_t samples_till_end_of_buf =3D hw->samples - hw->rpos;
-        size_t samples_to_clip =3D MIN (len, samples_till_end_of_buf);
-
-        hw->clip (dst, src, samples_to_clip);
-
-        hw->rpos =3D (hw->rpos + samples_to_clip) % hw->samples;
-        len -=3D samples_to_clip;
-        clipped +=3D samples_to_clip;
-    }
-    return clipped;
-}
-
-static void audio_pcm_hw_clip_out2(HWVoiceOut *hw, void *pcm_buf, size_t=
 len)
+static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t =
len)
 {
     size_t clipped =3D 0;
     size_t pos =3D hw->rpos;
@@ -1083,7 +1061,7 @@ static size_t audio_pcm_hw_run_out(HWVoiceOut *hw, =
size_t live)
         }
=20
         decr =3D MIN(size >> hw->info.shift, live);
-        audio_pcm_hw_clip_out2(hw, buf, decr);
+        audio_pcm_hw_clip_out(hw, buf, decr);
         proc =3D hw->pcm_ops->put_buffer_out(hw, buf, decr << hw->info.s=
hift) >>
             hw->info.shift;
=20
@@ -1146,11 +1124,7 @@ static void audio_run_out (AudioState *s)
         }
=20
         prev_rpos =3D hw->rpos;
-        if (hw->pcm_ops->run_out) {
-            played =3D hw->pcm_ops->run_out(hw, live);
-        } else {
-            played =3D audio_pcm_hw_run_out(hw, live);
-        }
+        played =3D audio_pcm_hw_run_out(hw, live);
         replay_audio_out(&played);
         if (audio_bug(__func__, hw->rpos >=3D hw->samples)) {
             dolog("hw->rpos=3D%zu hw->samples=3D%zu played=3D%zu\n",
@@ -1247,12 +1221,8 @@ static void audio_run_in (AudioState *s)
         size_t captured =3D 0, min;
=20
         if (replay_mode !=3D REPLAY_MODE_PLAY) {
-            if (hw->pcm_ops->run_in) {
-                captured =3D hw->pcm_ops->run_in(hw);
-            } else {
-                captured =3D audio_pcm_hw_run_in(
-                    hw, hw->samples - audio_pcm_hw_get_live_in(hw));
-            }
+            captured =3D audio_pcm_hw_run_in(
+                hw, hw->samples - audio_pcm_hw_get_live_in(hw));
         }
         replay_audio_in(&captured, hw->conv_buf, &hw->wpos, hw->samples)=
;
=20
--=20
2.18.1


