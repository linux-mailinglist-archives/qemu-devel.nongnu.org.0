Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3526C5E8232
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:58:17 +0200 (CEST)
Received: from localhost ([::1]:49986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnsO-00022S-9u
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXp-0002mK-Ji
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:03 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:43258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXl-0005FR-Sz
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:59 -0400
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout02.t-online.de (Postfix) with SMTP id 5601B3B18;
 Fri, 23 Sep 2022 20:36:56 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXj-0OOg2T0; Fri, 23 Sep 2022 20:36:55 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id A45A120061C; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 07/12] spiceaudio: update comment
Date: Fri, 23 Sep 2022 20:36:35 +0200
Message-Id: <20220923183640.8314-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958215-50A2B689-9875B662/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f69420a-de52-41ad-81e1-d55dc4fbc536
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Replace a comment with a question with the answer.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/spiceaudio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index 22892a7b9d..f52f3a8bbb 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -242,7 +242,10 @@ static size_t line_in_read(HWVoiceIn *hw, void *buf, size_t len)
     uint64_t to_read = audio_rate_get_bytes(&hw->info, &in->rate, len) >> 2;
     size_t ready = spice_server_record_get_samples(&in->sin, buf, to_read);
 
-    /* XXX: do we need this? */
+    /*
+     * If the client didn't send new frames, it most likely disconnected.
+     * Generate silence in this case to avoid a stalled audio stream.
+     */
     if (ready == 0) {
         memset(buf, 0, to_read << 2);
         ready = to_read;
-- 
2.35.3


