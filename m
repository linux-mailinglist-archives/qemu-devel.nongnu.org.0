Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C948650420
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xGu-00080s-C9; Sun, 18 Dec 2022 12:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGm-0007qP-HW
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:13 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGk-0002YR-V4
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:12 -0500
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout11.t-online.de (Postfix) with SMTP id 68800535F;
 Sun, 18 Dec 2022 18:15:50 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd73.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGM-2RNQG10; Sun, 18 Dec 2022 18:15:46 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1907F200635; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 04/11] audio: remove unused #define AUDIO_STRINGIFY
Date: Sun, 18 Dec 2022 18:15:32 +0100
Message-Id: <20221218171539.11193-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383746-2508E98D-1B3C2835/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ec173ef-a7fd-4a65-b181-311aae9c3e90
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove the unused #define AUDIO_STRINGIFY. It was last used before
commit 470bcabd8f ("audio: Replace AUDIO_FUNC with __func__").

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_int.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index e87ce014a0..4632cdf9cc 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -294,9 +294,6 @@ static inline size_t audio_ring_posb(size_t pos, size_t dist, size_t len)
 #define ldebug(fmt, ...) (void)0
 #endif
 
-#define AUDIO_STRINGIFY_(n) #n
-#define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
-
 typedef struct AudiodevListEntry {
     Audiodev *dev;
     QSIMPLEQ_ENTRY(AudiodevListEntry) next;
-- 
2.35.3


