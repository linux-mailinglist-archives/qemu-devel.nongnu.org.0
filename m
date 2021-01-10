Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59182F065A
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:17:36 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXmx-0002iD-Pc
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZS-0002Js-9s
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:41 -0500
Received: from mailout04.t-online.de ([194.25.134.18]:55108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZP-0005c5-Hr
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:38 -0500
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout04.t-online.de (Postfix) with SMTP id 5ACF941AA787;
 Sun, 10 Jan 2021 11:03:34 +0100 (CET)
Received: from linpower.localnet
 (EfTN+OZprh-BWn25zQbkigENNIvkLSbknsOU5mAn48wvbOPEnyHJa8DexFQe1Y8Qme@[93.236.152.29])
 by fwd22.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZM-3uvsqu0; Sun, 10 Jan 2021 11:03:32 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 14A482006C4; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 21/23] dsoundaudio: rename dsound_open()
Date: Sun, 10 Jan 2021 11:02:37 +0100
Message-Id: <20210110100239.27588-21-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: EfTN+OZprh-BWn25zQbkigENNIvkLSbknsOU5mAn48wvbOPEnyHJa8DexFQe1Y8Qme
X-TOI-EXPURGATEID: 150726::1610273012-00011FFC-DBEE0940/0/0 CLEAN NORMAL
X-TOI-MSGID: ce1ef6d0-3cf9-428e-9905-c4287ba24236
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
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

Rename dsound_open() to dsound_set_cooperative_level(). The
only task of that function is to set the cooperative level for
DirectSound.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/dsoundaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 0fbdf770ac..d3695f3af6 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -342,7 +342,7 @@ static void dsound_clear_sample (HWVoiceOut *hw, LPDIRECTSOUNDBUFFER dsb,
     dsound_unlock_out (dsb, p1, p2, blen1, blen2);
 }
 
-static int dsound_open (dsound *s)
+static int dsound_set_cooperative_level(dsound *s)
 {
     HRESULT hr;
     HWND hwnd;
@@ -673,7 +673,7 @@ static void *dsound_audio_init(Audiodev *dev)
         }
     }
 
-    err = dsound_open (s);
+    err = dsound_set_cooperative_level(s);
     if (err) {
         dsound_audio_fini (s);
         return NULL;
-- 
2.26.2


