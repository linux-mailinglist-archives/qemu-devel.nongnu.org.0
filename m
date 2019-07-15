Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF369D4C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 23:09:00 +0200 (CEST)
Received: from localhost ([::1]:43781 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn8DR-0000id-Bd
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 17:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hn8Cs-0007y4-SV
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hn8Cr-0004gq-Fu
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:22 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39534)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1hn8Cr-0004fX-9M
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:21 -0400
Received: by mail-wr1-x442.google.com with SMTP id x4so18565047wrt.6
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+qW6Pj25vUonYSa1yjKo82KCr5hWKkCFatG8S6MW820=;
 b=fB/8WMw9ZaBdUKK9VNDlCGN+rVQCEpeDFWDY70w414G1gJYfLSxxSoZn56WQk5gYjq
 5TcRLK1NIvklOiciAKvTyMj/wQ2pK9HfmsHxP7PvFGZlq4GOMzxbxkMLNwoEhVYkHWSL
 yrWfZcp3eRY2EUlbBGsknsGiY3N8WcHy8jKV3OF7IQIcaswb/d7K0XGdbWYKHUakIISt
 o4RKrTy6N0lSVgOyfAwGDPT1iSIgX34dzuyZu8FOxYPp25LqR+uextSXzE6FwG9v3EZR
 NZcKRnEA10tVRVXHDNzp2tluNdX+MCOLDlG6o869pm/5c2Irt571v+AMtE9mqvFTXxuD
 4qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+qW6Pj25vUonYSa1yjKo82KCr5hWKkCFatG8S6MW820=;
 b=iL3kexwarkAhiHp8vMcRBLcnSAzjKgpnmjn0iBPlnR8H3oIHzghu//3u3HUFR5DRJR
 zya4o6MK1NHQ0QYMM24jIpeu07moleNpyX6j1a2K6Sv5jc2USnf+z6U4nIg4Lp/N8f01
 jsy8dCO/FTroQDmkjLJdkL21858WigLLtlsJdcj2dKJaeMmKkmjcskUgzgY0iiRaIzoN
 itl1/wXPd72pM9a3cpAk/sM3nzki2Kan162JKFpl+4Gsg7vmbDDFJ76c+L/99xGeiI4D
 Qn1D38pxYDcDvk+R2fmoEZ/TUhL6Tfqa6gkHkG4oJYFktjrAsVLq8fN+bGf0eI9MDyi+
 l0Mw==
X-Gm-Message-State: APjAAAV9prOFnVrYImT9KBWiRhIb5RARsgap4eNrNDw5+sQtnd0FSenH
 eThibicaAN2J/orCKmTuWfZnT2U0
X-Google-Smtp-Source: APXvYqyStqL/Ex6rdvYi1pjKtcy9s3xTKy41lcJEgq+0Sb0HlYq+XoVN8IBsyCr8wi3ZBHPDXS/PPg==
X-Received: by 2002:adf:e4c6:: with SMTP id v6mr29435559wrm.315.1563224898052; 
 Mon, 15 Jul 2019 14:08:18 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-31ca-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:31ca::5])
 by smtp.gmail.com with ESMTPSA id n8sm11513447wro.89.2019.07.15.14.08.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 14:08:17 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:08:02 +0200
Message-Id: <cover.1563224628.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v2 00/14] Multiple simultaneous audio backends
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is the v2 of my audio patches.  Copmpared to the previous version, the only
major change is the splitting of 2 commits ("basic support for multi backend
audio" and "audio: audiodev= parameters no longer optional when -audiodev
present") to ease review.

I also included a patch that fixes a memory leak reported by ASAN.

Regards,
Zoltan

Kővágó, Zoltán (14):
  audio: reduce glob_audio_state usage
  audio: basic support for multi backend audio
  audio: add audiodev property to vnc and wav_capture
  audio: add audiodev properties to frontends
  paaudio: prepare for multiple audiodev
  audio: audiodev= parameters no longer optional when -audiodev present
  paaudio: do not move stream when sink/source name is specified
  paaudio: properly disconnect streams in fini_*
  audio: remove audio_MIN, audio_MAX
  audio: do not run each backend in audio_run
  paaudio: fix playback glitches
  audio: remove read and write pcm_ops
  audio: use size_t where makes sense
  audio: fix memory leak reported by ASAN

 audio/audio.h                    |  36 +--
 audio/audio_int.h                |  43 ++--
 audio/audio_template.h           |  62 +++--
 audio/mixeng.h                   |   9 +-
 audio/rate_template.h            |   2 +-
 include/hw/qdev-properties.h     |   3 +
 include/sysemu/replay.h          |   4 +-
 ui/vnc.h                         |   2 +
 audio/alsaaudio.c                |  49 ++--
 audio/audio.c                    | 345 ++++++++++++++-----------
 audio/coreaudio.c                |  18 +-
 audio/dsoundaudio.c              |  25 +-
 audio/noaudio.c                  |  39 +--
 audio/ossaudio.c                 |  75 +++---
 audio/paaudio.c                  | 421 ++++++++++++++++++-------------
 audio/sdlaudio.c                 |  30 +--
 audio/spiceaudio.c               |  34 +--
 audio/wavaudio.c                 |  18 +-
 audio/wavcapture.c               |   6 +-
 hw/audio/ac97.c                  |  11 +-
 hw/audio/adlib.c                 |   5 +-
 hw/audio/cs4231a.c               |   5 +-
 hw/audio/es1370.c                |  13 +-
 hw/audio/gus.c                   |   7 +-
 hw/audio/hda-codec.c             |  17 +-
 hw/audio/milkymist-ac97.c        |  14 +-
 hw/audio/pcspk.c                 |   3 +-
 hw/audio/pl041.c                 |   1 +
 hw/audio/sb16.c                  |   3 +-
 hw/audio/wm8750.c                |  10 +-
 hw/core/qdev-properties-system.c |  57 +++++
 hw/usb/dev-audio.c               |   1 +
 monitor/misc.c                   |  12 +-
 replay/replay-audio.c            |  16 +-
 replay/replay.c                  |   2 +-
 ui/vnc.c                         |  15 +-
 hmp-commands.hx                  |  13 +-
 qemu-options.hx                  |   6 +
 38 files changed, 790 insertions(+), 642 deletions(-)

-- 
2.22.0


