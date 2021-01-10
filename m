Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A522F0657
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:16:09 +0100 (CET)
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXlY-0001Mp-Cr
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZJ-0002Ih-FZ
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:33 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:33454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZH-0005Ze-9A
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:29 -0500
Received: from fwd41.aul.t-online.de (fwd41.aul.t-online.de [172.20.27.139])
 by mailout08.t-online.de (Postfix) with SMTP id 11B2B41A5138;
 Sun, 10 Jan 2021 11:03:26 +0100 (CET)
Received: from linpower.localnet
 (rXgvaOZZYhxLXj36onIrNgRjpRJ1zuvobSP+gzmN0N2RPhWO22ENxDl4C+DY+9iwR9@[93.236.152.29])
 by fwd41.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZB-1CUsUq0; Sun, 10 Jan 2021 11:03:21 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 0BEFF2006C0; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 17/23] paaudio: comment bugs in functions qpa_init_*
Date: Sun, 10 Jan 2021 11:02:33 +0100
Message-Id: <20210110100239.27588-17-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: rXgvaOZZYhxLXj36onIrNgRjpRJ1zuvobSP+gzmN0N2RPhWO22ENxDl4C+DY+9iwR9
X-TOI-EXPURGATEID: 150726::1610273001-00000C4D-38D5E87B/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ca11905-4f8e-4589-b7fe-bf466a66b510
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The audio buffer size in audio/paaudio.c is typically larger
than expected. Just comment the bugs in qpa_init_in() and
qpa_init_out() for now. Fixing these bugs may break glitch free
audio playback with fine tuned user audio settings.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 86038f3e13..ff3dd01c96 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -538,6 +538,10 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
+    /*
+     * This is wrong. hw->samples counts in frames. hw->samples will be
+     * number of channels times larger than expected.
+     */
     hw->samples = audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
@@ -585,6 +589,10 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
+    /*
+     * This is wrong. hw->samples counts in frames. hw->samples will be
+     * number of channels times larger than expected.
+     */
     hw->samples = audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
-- 
2.26.2


