Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9499C6D6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 02:30:45 +0200 (CEST)
Received: from localhost ([::1]:48832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i22uB-0003M5-Vt
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 20:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i22sk-0002Tq-Tl
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 20:29:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i22sj-0001zS-TY
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 20:29:14 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i22sj-0001yp-Nz
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 20:29:13 -0400
Received: by mail-wm1-x343.google.com with SMTP id g67so14123878wme.1
 for <qemu-devel@nongnu.org>; Sun, 25 Aug 2019 17:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3SCYdPHixYiDa5hoVT0Tlp9GgfPbk+6aSz1nYbqKJJQ=;
 b=DP2Ci/pAQ7Upnz+VYcK/zHwMjQfsG67A1t5QEcaVSZvS5jYqG6Vr96367iK0S/Kai0
 FKIvTcsngiQb+T0w5GeXxixTqxmTRm4B1/29xgmukkN8rBfqUIa0MLWU58F/8+1KlJTG
 1qzFjo5t7IsKLcvW65z6aVyzs7/PYrvxC0K+7Cv+rxVAxDpq/o8H7mY0j3C2MsVlApzs
 nFpuXeCCU9xr7S9XxclAofPLFNaDLbRGGF8/NPnCqdSryYyvMPpLXfDcPG/c0dmgiFZB
 xlG18hW6tr1aMIxQ7eJLn5B4qpeyhdqXIOiWjGQA0aHuMtTLe6q0K/HjS/o1JGV9ryy+
 Ji6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3SCYdPHixYiDa5hoVT0Tlp9GgfPbk+6aSz1nYbqKJJQ=;
 b=rUFdsbGqnZCoccJ92S0urNJDtmHKpvLlD6o5sgElSDskl6HmupHOxOjls0YN7dQuPy
 hMAy/vFkfh86yz5xIAjJZW2WyPH9DOuR2RaVACeoL2oAuwg9yZlWm1pYTL4+V3i5MU9B
 sjAR39hVhpKOkNMKMVLalXoj6b89qilTZAnO0m2DrbUCbzXXYBEQJCXoRaY/gSaMEWjz
 Okj11Lyh0h8QuNgVz0vZBhnSrOVK3ss9XylQquzZiguhrifsLUGYjwMudZAdFEUH3LFL
 dSuZPVfKR0wbFqIdNN6mmFHw+KKQCQdTahGo9tBojEVQbBnmE8knLWBJNbg+zSqmnRcc
 8nig==
X-Gm-Message-State: APjAAAUi6voHgTxwqfWRKETE0RkcHUTNnN1Rnpqd1byt/pFdOrXtqdip
 2NdzubALy31d1r0xojIOELORwuirYtY=
X-Google-Smtp-Source: APXvYqxTcLgcqvx6VaGC/xNB2xDSeEgY6v8IOoiPaGB1cn3+dfcXqi3DAkOaUvmmoSo5eHoddzTO6g==
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr18458075wmj.112.1566779352510; 
 Sun, 25 Aug 2019 17:29:12 -0700 (PDT)
Received: from decltype.home.dirty-ice.org
 (2a01-036c-0113-61b1-0001-0000-0000-00d3.pool6.digikabel.hu.
 [2a01:36c:113:61b1:1::d3])
 by smtp.gmail.com with ESMTPSA id c19sm8662339wml.13.2019.08.25.17.29.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 17:29:12 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Aug 2019 02:29:07 +0200
Message-Id: <cd692232ed7a6158e5b77a483cb1d082108a9e45.1566779143.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566779143.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566779143.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 1/3] audio: omitting audiodev= parameter is
 only deprecated
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately, changes introduced in af2041ed2d "audio: audiodev=
parameters no longer optional when -audiodev present" breaks backward
compatibility.  This patch changes the error into a deprecation warning.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 qemu-deprecated.texi | 7 +++++++
 audio/audio.c        | 8 ++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 00a4b6f350..9d74a1cfc0 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -72,6 +72,13 @@ backend settings instead of environment variables.  To ease migration to
 the new format, the ``-audiodev-help'' option can be used to convert
 the current values of the environment variables to ``-audiodev'' options.
 
+@subsection Creating sound card devices and vnc without audiodev= property (since 4.2)
+
+When not using the deprecated legacy audio config, each sound card
+should specify an @code{audiodev=} property.  Additionally, when using
+vnc, you should specify an @code{audiodev=} propery if you plan to
+transmit audio through the VNC protocol.
+
 @subsection -mon ...,control=readline,pretty=on|off (since 4.1)
 
 The @code{pretty=on|off} switch has no effect for HMP monitors, but is
diff --git a/audio/audio.c b/audio/audio.c
index 7d715332c9..e13addf922 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1412,8 +1412,9 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
         drvname = AudiodevDriver_str(dev->driver);
     } else if (!QTAILQ_EMPTY(&audio_states)) {
         if (!legacy_config) {
-            dolog("You must specify an audiodev= for the device %s\n", name);
-            exit(1);
+            dolog("Device %s: audiodev default parameter is deprecated, please "
+                  "specify audiodev=%s\n", name,
+                  QTAILQ_FIRST(&audio_states)->dev->id);
         }
         return QTAILQ_FIRST(&audio_states);
     } else {
@@ -1548,8 +1549,7 @@ CaptureVoiceOut *AUD_add_capture(
 
     if (!s) {
         if (!legacy_config) {
-            dolog("You must specify audiodev when trying to capture\n");
-            return NULL;
+            dolog("Capturing without setting an audiodev is deprecated\n");
         }
         s = audio_init(NULL, NULL);
     }
-- 
2.22.0


