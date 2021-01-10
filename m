Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB142F0650
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:13:59 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXjS-0005Em-Nt
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZH-0002IK-Hl
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:33 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:59868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZE-0005YH-UR
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:27 -0500
Received: from fwd25.aul.t-online.de (fwd25.aul.t-online.de [172.20.26.130])
 by mailout01.t-online.de (Postfix) with SMTP id 17E7B421C82F;
 Sun, 10 Jan 2021 11:03:23 +0100 (CET)
Received: from linpower.localnet
 (Z2Phi2ZJYhPj8HmMDUpCXF3MhYcJfuwTs6JP++5G8eszSJCKXKk7kgy3eCQCFLLwJl@[93.236.152.29])
 by fwd25.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZ9-059WpU0; Sun, 10 Jan 2021 11:03:19 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 09B4020063E; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 16/23] paaudio: remove unneeded code
Date: Sun, 10 Jan 2021 11:02:32 +0100
Message-Id: <20210110100239.27588-16-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: Z2Phi2ZJYhPj8HmMDUpCXF3MhYcJfuwTs6JP++5G8eszSJCKXKk7kgy3eCQCFLLwJl
X-TOI-EXPURGATEID: 150726::1610272999-00015F3A-8A20DDDB/0/0 CLEAN NORMAL
X-TOI-MSGID: bce6983c-cc70-412c-ba05-262134147708
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit baea032ec7 "audio/paaudio: fix ignored buffer_length setting"
added code to handle buffer_length defaults. This was unnecessary
because the audio_buffer_* functions in audio/audio.c already handle
this. Remove the unneeded code.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 4a1ffda753..86038f3e13 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -539,8 +539,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = audio_buffer_samples(
-        qapi_AudiodevPaPerDirectionOptions_base(ppdo),
-        &obt_as, ppdo->buffer_length);
+        qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
 
@@ -587,8 +586,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = audio_buffer_samples(
-        qapi_AudiodevPaPerDirectionOptions_base(ppdo),
-        &obt_as, ppdo->buffer_length);
+        qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
 
@@ -738,10 +736,6 @@ static void qpa_volume_in(HWVoiceIn *hw, Volume *vol)
 static int qpa_validate_per_direction_opts(Audiodev *dev,
                                            AudiodevPaPerDirectionOptions *pdo)
 {
-    if (!pdo->has_buffer_length) {
-        pdo->has_buffer_length = true;
-        pdo->buffer_length = 46440;
-    }
     if (!pdo->has_latency) {
         pdo->has_latency = true;
         pdo->latency = 15000;
-- 
2.26.2


