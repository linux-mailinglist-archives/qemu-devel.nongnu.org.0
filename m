Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA4D57EF
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Oct 2019 22:01:30 +0200 (CEST)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJk3U-0007D4-QD
	for lists+qemu-devel@lfdr.de; Sun, 13 Oct 2019 16:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iJk0O-0005TK-0J
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:58:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iJk0J-0003CS-60
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:58:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40780)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iJk0I-00039t-Ub
 for qemu-devel@nongnu.org; Sun, 13 Oct 2019 15:58:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id b24so14684507wmj.5
 for <qemu-devel@nongnu.org>; Sun, 13 Oct 2019 12:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1UZD2cdojP5N+yfJV1QXr0vzPFC+8CHzQ1uMeT7Rhg=;
 b=FJNPBmPd4SQHNvuFtsOqPJxQtUETOfVknSc7cHHCbDcooLzq75bfTkXoBOY24rKFf/
 GVq6FAawnpQ9/J3mfqIJM8nFOhPPhBtLLDsGTTH57NA81HQWMtBP2Qd3oVwL5V/yqhu+
 SWgxQRv2WWsq74vntr50b6+f3ss6gV0Q7AUB8So3xSd6tbiSZH1FfF0B5GkJ9TEGYBb1
 dfgw+gMNiUrW2c3KnpM6q0AwoawjcAyFSb8SZc0Hs2RftpGSvbYm6KNt/o1lxENJW50h
 HGQmdK74v34SKQSFLa5vwSRYOY+1QO5tNlTQEoBfe92+gougFMMCX+A2xGAP21JNHbFE
 go/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1UZD2cdojP5N+yfJV1QXr0vzPFC+8CHzQ1uMeT7Rhg=;
 b=eR5xooc00nEhDCI8nYwoxONC7ZV3ScMN140Yst6bKM44HET8Bn2aE+4qmIa+X1QRLl
 ELWtK5C0frgW9hLbbypzAoGjA7BirBVeIZbZdQlVHYd5r0+BT/VRBuX4N/Q9Zvxxfqei
 8wOHiPXHofiGzUKAYfOOjBhuMxGDGYnqwdpdhkVwR0Isab2128hQ8McU89CLwLvXXzTz
 NID4msZT1gx63ripuqvtwLNjAb2GyJEslmkXNrUgtQ6FI3+yI3aS4b1Q2iZFk027/XGe
 +8rAQM0Cq8MMn/ppGTYXwlPMO1YjfYYWcjgqgaM0fznFHB/nbMjKbDWjLNDJWUuFJnoC
 x0pw==
X-Gm-Message-State: APjAAAUH+zMkNbj0CqSp3ILfWSdQUjtK3M1eof8uZqJqG4hb/qEFO31B
 NUJHoKQti4x28DeQFkMCgG09uVSt
X-Google-Smtp-Source: APXvYqz9MtwqOih5F0KZR1gBYxb1jdvyBA8tv0V1fBUEatxK3NIXEXWooBedEFmHUI5xOgnLLQ3pDQ==
X-Received: by 2002:a1c:990a:: with SMTP id b10mr12068727wme.39.1570996688601; 
 Sun, 13 Oct 2019 12:58:08 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-0052-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:52::5])
 by smtp.gmail.com with ESMTPSA id x129sm29941857wmg.8.2019.10.13.12.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 12:58:08 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/10] Audio: Mixeng-free 5.1/7.1 audio support
Date: Sun, 13 Oct 2019 21:57:57 +0200
Message-Id: <cover.1570996490.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
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

I've updated my mixeng-free patches.  This time it's only documentation
fixes in the first patch, otherwise it's identical to v5.

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
 qapi/audio.json         |   6 +
 qemu-options.hx         |  15 ++
 16 files changed, 740 insertions(+), 185 deletions(-)

-- 
2.23.0


