Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F626AB693
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:53:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4hn-00038V-Cj; Mon, 06 Mar 2023 01:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4hg-00035G-EU
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4he-0000Tx-8l
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/YB9IzBDXhgxcQG0vaC3E+bbh7YBIa2lQf4hif7o43g=;
 b=OIpXdtiYr5Tq4RrQvAQv/bSmizuVtGfK1DOUrYN/wgZ4n6RGw/C9DR49qLRuvalELNMIDA
 RFeDZeTFstdqEURZWS/a5mqIe0zhPSfzyGDKJRYR5oRH3hQ3JkcwbIqUlxaAv2aiCNY8P3
 aw8G+jLqk2ad5tE0/tVG/s5EdMDPI1A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-lSdDk4BJOmGxRX9z1sTg2Q-1; Mon, 06 Mar 2023 01:52:06 -0500
X-MC-Unique: lSdDk4BJOmGxRX9z1sTg2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A88A3C10681;
 Mon,  6 Mar 2023 06:52:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5F6C16029;
 Mon,  6 Mar 2023 06:52:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PULL 00/27] Audio patches
Date: Mon,  6 Mar 2023 10:51:35 +0400
Message-Id: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:

  configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/audio-pull-request

for you to fetch changes up to 2f886a34bb7e6f6fcf39d64829f4499476f26dba:

  audio: remove sw->ratio (2023-03-06 10:30:24 +0400)

----------------------------------------------------------------
Audio patches for QEMU 8.0

Cleanups and improvements from Volker Rümelin.

----------------------------------------------------------------

Marc-André Lureau (1):
  MAINTAINERS: add myself to ui/ and audio/

Volker Rümelin (26):
  audio: log unimplemented audio device sample rates
  audio: don't show unnecessary error messages
  audio: rename hardware store to backend
  audio: remove unused #define AUDIO_STRINGIFY
  audio/mixeng: use g_new0() instead of audio_calloc()
  audio/alsaaudio: use g_new0() instead of audio_calloc()
  audio/audio_template: use g_malloc0() to replace audio_calloc()
  audio/audio_template: use g_new0() to replace audio_calloc()
  audio: remove audio_calloc() function
  alsaaudio: change default playback settings
  alsaaudio: reintroduce default recording settings
  audio: change type of mix_buf and conv_buf
  audio: change type and name of the resample buffer
  audio: make the resampling code greedy
  audio: replace the resampling loop in audio_pcm_sw_write()
  audio: remove sw == NULL check
  audio: rename variables in audio_pcm_sw_write()
  audio: don't misuse audio_pcm_sw_write()
  audio: remove unused noop_conv() function
  audio: make playback packet length calculation exact
  audio: replace the resampling loop in audio_pcm_sw_read()
  audio: rename variables in audio_pcm_sw_read()
  audio: make recording packet length calculation exact
  audio: handle leftover audio frame from upsampling
  audio/audio_template: substitute sw->hw with hw
  audio: remove sw->ratio

 MAINTAINERS            |   2 +
 audio/audio_int.h      |  20 +--
 audio/audio_template.h | 105 +++++------
 audio/mixeng.h         |   2 +
 audio/rate_template.h  |  21 ++-
 audio/alsaaudio.c      |  27 +--
 audio/audio.c          | 392 ++++++++++++++++++++---------------------
 audio/mixeng.c         |  87 ++++++++-
 8 files changed, 359 insertions(+), 297 deletions(-)

-- 
2.39.2


