Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC82D8D2D
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 14:14:08 +0100 (CET)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koRCR-0002OT-Rj
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 08:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4K-0006dH-VT
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:45 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:60594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4J-0000kd-8l
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:44 -0500
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout02.t-online.de (Postfix) with SMTP id 0C61741ACBBB;
 Sun, 13 Dec 2020 14:05:42 +0100 (CET)
Received: from linpower.localnet
 (XHx-iUZcQhImH72qu4KMlIHpfvJ1jx1JfExGo3K59L3bC8R6pjNGJ9XD-slSAmdg0Y@[79.208.17.59])
 by fwd22.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koR44-1dDeAC0; Sun, 13 Dec 2020 14:05:28 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1D01E200451; Sun, 13 Dec 2020 14:05:28 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/4] coreaudio: rename misnamed variable fake_as
Date: Sun, 13 Dec 2020 14:05:25 +0100
Message-Id: <20201213130528.5863-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
References: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: XHx-iUZcQhImH72qu4KMlIHpfvJ1jx1JfExGo3K59L3bC8R6pjNGJ9XD-slSAmdg0Y
X-TOI-EXPURGATEID: 150726::1607864728-00011FFC-E437F583/0/0 CLEAN NORMAL
X-TOI-MSGID: 0af5992c-e5d9-401f-a276-1040dd383152
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the variable once was used to fake audio settings, since
commit ed2a4a7941 "audio: proper support for float samples in
mixeng" this is no longer true. Rename the variable to obt_as.
This is the same naming scheme as in audio/sdlaudio.c

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/coreaudio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 4b4365660f..0ee85052c4 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -482,7 +482,7 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
     Audiodev *dev = drv_opaque;
     AudiodevCoreaudioPerDirectionOptions *cpdo = dev->u.coreaudio.out;
     int frames;
-    struct audsettings fake_as;
+    struct audsettings obt_as;
 
     /* create mutex */
     err = pthread_mutex_init(&core->mutex, NULL);
@@ -491,8 +491,8 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
         return -1;
     }
 
-    fake_as = *as;
-    as = &fake_as;
+    obt_as = *as;
+    as = &obt_as;
     as->fmt = AUDIO_FORMAT_F32;
     audio_pcm_init_info (&hw->info, as);
 
-- 
2.26.2


