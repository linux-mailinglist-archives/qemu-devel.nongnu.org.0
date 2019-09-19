Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885EB8396
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 23:43:21 +0200 (CEST)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB4Ct-0003c1-VS
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 17:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iB3us-0002q5-MD
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 17:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1iB3uq-0000hi-Ga
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 17:24:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1iB3uo-0000eX-8H
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 17:24:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id h7so4600766wrw.8
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 14:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SAJE24jrD+6zgfdi/kjreA5oPQEW/oM4tr6aWGLatS8=;
 b=T729J/bi5mNiTOXtjBdx/MmujoNm0zzx/BBO1/CPFFXJZcgThXQrbOq8uzpKF5HDOb
 pw3vud2Ca+C+USedsJrxM+EcuKxB/JgsLJjjbSn4r7x6VO+g1ZSu0RgBiBz4hW3TwYGI
 qPAuKIjdDuk+aJkdfGhM9friSpf8cXs3C5X4BiwPzz+JR8uGLcGF8ibXDunq0JTcrZqs
 xSGikditgUy1xH186Is6u4ZPTDt46a8izcEFnwjAnR0MV4W4xI+sr2RyKSBtiY+Ap7QX
 zRTCkdsaVM9voPf2bjfFslaq7A65Ofe4OPCwOUvr8eMZhnVvwGOjWTv1rxd0VgR/TCpj
 eXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SAJE24jrD+6zgfdi/kjreA5oPQEW/oM4tr6aWGLatS8=;
 b=FqqJHJWIrifmzo5sw7fsOYieZLyCEXg4TQus4vvHNv7QNmneNkksqtBHfP1CQafLBI
 DlrrjcVQm1EEXtnBLq/uC1/XigUkmcNDmAv8O/nlwq7hxkya7Z9319X1SGr9RrFv/Lut
 VLFxJOAiczxA3CYQZEjNbikaC4KT3umNxjMCIJbnunBlO3ZVni6jbuv7MSbo5GnsxBu1
 Ny31+6tRv/3o4cVOZyd3sPnGpPpd5UiBrBinrY59gCWFBuT1GFxda4910NLeX+hA9Q9p
 yCk0HTpU6SGW+cimo89X5XzCweyJwFd1wZJcEeL9+SdLTU6IgwnneWOCnLG5K9hJh/1A
 QRMg==
X-Gm-Message-State: APjAAAVyoPKjIuqJokXehtjvyubIUy1CwYC910TzQiLlASWdGjRTs0bm
 UY6Q38Y2+0lnJSxijSs1x2aLKDIz
X-Google-Smtp-Source: APXvYqylUWYkxcp/rt9vR5158j6CZuG4ZQeJ2Hz0o9VBP16zRV56KaFwHtMVRGksgkQ1y/SQn1zLqA==
X-Received: by 2002:a5d:5384:: with SMTP id d4mr8582649wrv.255.1568928276927; 
 Thu, 19 Sep 2019 14:24:36 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-74ef-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:74ef::5])
 by smtp.gmail.com with ESMTPSA id w125sm13191292wmg.32.2019.09.19.14.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 14:24:36 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/24] audio: add mixing-engine option (documentation)
Date: Thu, 19 Sep 2019 23:24:23 +0200
Message-Id: <68c4b4bd438e9cb5c97aed32ee31e3dabd96cbf6.1568927990.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
References: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to disable mixeng when we use a decent backend.

Disabling mixeng have a few advantages:
* we no longer convert the audio output from one format to another, when
  the underlying audio system would just convert it to a third format.
  We no longer convert, only the underlying system, when needed.
* the underlying system probably has better resampling and sample format
  converting methods anyway...
* we may support formats that the mixeng currently does not support (S24
  or float samples, more than two channels)
* when using an audio server (like pulseaudio) different sound card
  outputs will show up as separate streams, even if we use only one
  backend

Disadvantages:
* audio capturing no longer works (wavcapture, and vnc audio extension)
* some backends only support a single playback stream or very picky
  about the audio format.  In this case we can't disable mixeng.

However mixeng is not removed, only made optional, so this shouldn't be
a big concern.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---

Notes:
    Changes from v1:
    
    * renamed mixeng to mixing-engine

 qapi/audio.json | 5 +++++
 qemu-options.hx | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/qapi/audio.json b/qapi/audio.json
index 9fefdf5186..0535eff794 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -11,6 +11,10 @@
 # General audio backend options that are used for both playback and
 # recording.
 #
+# @mixing-engine: use QEMU's mixing engine to mix all streams inside QEMU. When
+#                 set to off, fixed-settings must be also off. Not every backend
+#                 compatible with the off setting (default on, since 4.2)
+#
 # @fixed-settings: use fixed settings for host input/output. When off,
 #                  frequency, channels and format must not be
 #                  specified (default true)
@@ -31,6 +35,7 @@
 ##
 { 'struct': 'AudiodevPerDirectionOptions',
   'data': {
+    '*mixing-engine':  'bool',
     '*fixed-settings': 'bool',
     '*frequency':      'uint32',
     '*channels':       'uint32',
diff --git a/qemu-options.hx b/qemu-options.hx
index bbfd936d29..395427422a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -433,6 +433,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
     "                specifies the audio backend to use\n"
     "                id= identifier of the backend\n"
     "                timer-period= timer period in microseconds\n"
+    "                in|out.mixing-engine= use mixing engine to mix streams inside QEMU\n"
     "                in|out.fixed-settings= use fixed settings for host audio\n"
     "                in|out.frequency= frequency to use with fixed settings\n"
     "                in|out.channels= number of channels to use with fixed settings\n"
@@ -503,6 +504,11 @@ Identifies the audio backend.
 Sets the timer @var{period} used by the audio subsystem in microseconds.
 Default is 10000 (10 ms).
 
+@item in|out.mixing-engine=on|off
+Use QEMU's mixing engine to mix all streams inside QEMU.  When off,
+@var{fixed-settings} must be off too.  Not every backend is fully
+compatible with the off setting.  Default is on.
+
 @item in|out.fixed-settings=on|off
 Use fixed settings for host audio.  When off, it will change based on
 how the guest opens the sound card.  In this case you must not specify
-- 
2.23.0


