Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2E2F0654
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:15:37 +0100 (CET)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXl3-0000C1-1z
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZY-0002Le-Us
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:45 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:60078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZU-0005cz-MS
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:44 -0500
Received: from fwd35.aul.t-online.de (fwd35.aul.t-online.de [172.20.27.145])
 by mailout07.t-online.de (Postfix) with SMTP id 4EC1F42D62B8;
 Sun, 10 Jan 2021 11:03:38 +0100 (CET)
Received: from linpower.localnet
 (Sy6OJwZCrhFIfcTErfdQiBmZE0t5-otkGSfIMOQZZlRKmXObCZOmAC1ZwucH9A9ghW@[93.236.152.29])
 by fwd35.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZR-0ysPIm0; Sun, 10 Jan 2021 11:03:37 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 18E602006C6; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 23/23] dsoundaudio: fix log message
Date: Sun, 10 Jan 2021 11:02:39 +0100
Message-Id: <20210110100239.27588-23-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: Sy6OJwZCrhFIfcTErfdQiBmZE0t5-otkGSfIMOQZZlRKmXObCZOmAC1ZwucH9A9ghW
X-TOI-EXPURGATEID: 150726::1610273017-0000E07B-BE1B176D/0/0 CLEAN NORMAL
X-TOI-MSGID: 57f0680b-7a8b-4f3f-ba47-a697714bf775
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
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

There is a mismatch between message and used argument. Change
the argument from frequency to format.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_win_int.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index b7db34900c..5ea8157dfc 100644
--- a/audio/audio_win_int.c
+++ b/audio/audio_win_int.c
@@ -54,7 +54,7 @@ int waveformat_from_audio_settings (WAVEFORMATEX *wfx,
         break;
 
     default:
-        dolog ("Internal logic error: Bad audio format %d\n", as->freq);
+        dolog("Internal logic error: Bad audio format %d\n", as->fmt);
         return -1;
     }
 
-- 
2.26.2


