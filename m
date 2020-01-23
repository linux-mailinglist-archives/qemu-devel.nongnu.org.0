Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C321462EE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 08:53:53 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuXJI-00021o-4T
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 02:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFP-0005j2-79
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:49:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1iuXFO-0004Qn-0a
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:49:51 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:46088)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1iuXFN-0004QA-R6
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 02:49:49 -0500
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout08.t-online.de (Postfix) with SMTP id CE67941D32A5;
 Thu, 23 Jan 2020 08:49:48 +0100 (CET)
Received: from linpower.localnet
 (GWuX+2ZbYhZMP2LnDvdsdzW1bFHbiQ56L2Ypt+hmmL1J6fwYxXlj+OxkMz0rwroZ5x@[46.86.62.122])
 by fwd22.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1iuXFM-20d0IS0; Thu, 23 Jan 2020 08:49:48 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 567AA200F4D; Thu, 23 Jan 2020 08:49:43 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/9] paaudio: remove unused variables
Date: Thu, 23 Jan 2020 08:49:37 +0100
Message-Id: <20200123074943.6699-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
References: <1e29e1d3-b59b-fcd6-cdff-a680bcdbffa4@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: GWuX+2ZbYhZMP2LnDvdsdzW1bFHbiQ56L2Ypt+hmmL1J6fwYxXlj+OxkMz0rwroZ5x
X-TOI-MSGID: 4ed9fe2e-aa59-4e09-8147-285958c7a8cc
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 194.25.134.20
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

The unused variables were last used before commit 49ddd7e122
"paaudio: port to the new audio backend api".

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index dbfe48c03a..8f37c61851 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -32,7 +32,6 @@ typedef struct {
     HWVoiceOut hw;
     pa_stream *stream;
     paaudio *g;
-    size_t samples;
 } PAVoiceOut;
=20
 typedef struct {
@@ -41,7 +40,6 @@ typedef struct {
     const void *read_data;
     size_t read_length;
     paaudio *g;
-    size_t samples;
 } PAVoiceIn;
=20
 static void qpa_conn_fini(PAConnection *c);
@@ -488,7 +486,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audset=
tings *as,
     }
=20
     audio_pcm_init_info (&hw->info, &obt_as);
-    hw->samples =3D pa->samples =3D audio_buffer_samples(
+    hw->samples =3D audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo),
         &obt_as, ppdo->buffer_length);
=20
@@ -536,7 +534,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsetti=
ngs *as, void *drv_opaque)
     }
=20
     audio_pcm_init_info (&hw->info, &obt_as);
-    hw->samples =3D pa->samples =3D audio_buffer_samples(
+    hw->samples =3D audio_buffer_samples(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo),
         &obt_as, ppdo->buffer_length);
=20
--=20
2.16.4


