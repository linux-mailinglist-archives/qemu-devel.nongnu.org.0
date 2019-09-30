Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAB8C268D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 22:37:23 +0200 (CEST)
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF2Q5-0001le-To
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 16:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iF2HY-0003tT-UI
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iF2HX-0002P8-No
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:28:32 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52730)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iF2HX-0002NH-Hf
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 16:28:31 -0400
Received: by mail-wm1-x334.google.com with SMTP id r19so868319wmh.2
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NOdGtCYZFjV2T1VLRLv1+R3Y8KCEl4OWA15DkTPEBe8=;
 b=TYKbgKpmdTV9lJeYPf0MHO5mT3CZ0WX2KDtqECMey8z17HiuhKcVjuubkBV9k3Gqrd
 IfR5DIX7LcX7RsBQqovyKkssINdurBFUKVNV37QbSjPOIRRM9hcIsQmuimA/oJugekZN
 DW/kaVSp6W5YDS+gfZFiNwzK6CfN9MxVlu86Ao4WjaVSDtmARmtLzgwflPyP++D0riiI
 Hq2r2XV2nD80SbzjhvrmqBa95oI8mpN4aeufnVeGHiQ6e5NzUxZQHl0B6vys4P4vR/em
 hj8FRA6tcX1MWfDGzndF0iZFVw+RTO/FH8DDizbtimgITGEJ6j5rtEnI2Dn4VYN9/k66
 broQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NOdGtCYZFjV2T1VLRLv1+R3Y8KCEl4OWA15DkTPEBe8=;
 b=QUnClNOyHOQzBtgv/OVPd5IW6AoqpwVyQZ/CL+ZISo1UNngJWDgHaCQ5JmofL1eR0F
 CZpEwhAjpNP2T0qx93RBpJFVtbG61CWaZ9Ddten/umSq1osVYnSScxZcLHoC1wvNR0G4
 t9/wFP6IFgydlqkvgZdtorrnyjBDb7KiGh0pAjtmbv5dbrJnk0nu6wMRPrf1+Yu2B9hE
 OgtxtWJH8KV2LJSBu/JHzgyiR24VITQ/59zKdQRJ8ThaxlcZ2L11VZWeR6+q2Wke+scH
 WXmt/S3W0Bq3o9d8dGpAedj6uLzMQbOS8FHoieiBkpVHHjnxfxNG04oVsYQM3vV/q0Wo
 XvJg==
X-Gm-Message-State: APjAAAVZlSKOV90HsnoyTxFZ2ABihIabcBoouJP0CER/mNxl0I+EVLFi
 NSJ85UUCknepGddA/rfs4gogme3N
X-Google-Smtp-Source: APXvYqxq9nJl1YR+Lp1jBDqtLyhj0EOAVdzd2wYr2iTlakF2cZzrMZ2ub+i6ffobAcTJd12jP9j4mw==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr773949wmi.31.1569875309934;
 Mon, 30 Sep 2019 13:28:29 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-e8f4-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:e8f4::5])
 by smtp.gmail.com with ESMTPSA id o9sm34402911wrh.46.2019.09.30.13.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 13:28:29 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/10] Audio: Mixeng-free 5.1/7.1 audio support
Date: Mon, 30 Sep 2019 22:28:53 +0200
Message-Id: <cover.1569874641.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
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

Hi,

I've updated my mixeng-free audio patches.  The documentation probably
requires more polishing, but I'm sending this now so the other parts
can be reviewed too.

Changes from v4:

* Removed already merged commits.
* Bugfix in "audio: make mixeng optional" commit.
* Dropped the "paaudio: channel-map option" patch, instead the paaudio
  backend will automatically figure out the current channel map for now
  (see the last patch).  Currently this only works with usb-audio, if
  other frontends gain support for multi-channel audio, it might require
  some rethinking.

Regards,
Zoltan

Kővágó, Zoltán (10):
  audio: add mixing-engine option (documentation)
  audio: make mixeng optional
  paaudio: get/put_buffer functions
  audio: support more than two channels in volume setting
  audio: replace shift in audio_pcm_info with bytes_per_frame
  audio: basic support for multichannel audio
  usb-audio: do not count on avail bytes actually available
  usb-audio: support more than two channels of audio
  usbaudio: change playback counters to 64 bit
  paaudio: fix channel order for usb-audio 5.1 and 7.1 streams

 audio/alsaaudio.c       |  18 +-
 audio/audio.c           | 176 ++++++++++-----
 audio/audio.h           |  10 +
 audio/audio_int.h       |   7 +-
 audio/audio_template.h  |  24 ++-
 audio/coreaudio.c       |   4 +-
 audio/dsound_template.h |  10 +-
 audio/dsoundaudio.c     |   4 +-
 audio/noaudio.c         |   2 +-
 audio/ossaudio.c        |  14 +-
 audio/paaudio.c         | 153 ++++++++++++--
 audio/spiceaudio.c      |  17 +-
 audio/wavaudio.c        |   6 +-
 hw/usb/dev-audio.c      | 459 ++++++++++++++++++++++++++++++++++------
 qapi/audio.json         |   5 +
 qemu-options.hx         |   6 +
 16 files changed, 730 insertions(+), 185 deletions(-)

-- 
2.23.0


