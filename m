Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C1D9D729
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 22:02:38 +0200 (CEST)
Received: from localhost ([::1]:57328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2LCG-0006mv-RW
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 16:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i2L8z-0004vJ-5d
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1i2L8y-0000lV-3s
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:59:13 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:34714)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1i2L8x-0000lI-WD
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 15:59:12 -0400
Received: by mail-qk1-x743.google.com with SMTP id m10so15125801qkk.1
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySokALVusjzAmJ3tB5VFUmu77Hw7Lnlmsc5ORnFHP8A=;
 b=D+fOjlIezy9+fjM3Cqvo66ZjSq/zVkiLsMnDeY9YNcYg2KuT0z0PrADoQynUIJDFB5
 Wvd5R6aPY5c5Z0D+K6j0n04t2JU46wedb64I1Wb5+GHty8rH5TInVtYdq8CpDNspEaga
 Xx7vaiebrm604bgTxizd4o6awLVG+aFqjKrI2o7Lk2ihvRbi8ZxzMFsUBnkmZKDHdf7O
 GXNIXsNGWXptHrqYOT5jNSRr/Z+JEMk/idchgW6LUQ0CTmKWKd7GZdsb47qmZo5XzTOg
 XCxNjguveTbg7gR58BJi+5Bxzk7qC8Phrb0p1evyCoF8eCIhuUmWip9Yi5OF9Nz8Q9Kd
 wtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySokALVusjzAmJ3tB5VFUmu77Hw7Lnlmsc5ORnFHP8A=;
 b=D6YtCbcMXMFJ3w1p6Cnyt7arPSjQ2+FV4qBl5jfJ/s8fLAsPKMeIIVLCHBG4iQ7K1g
 eRMxG8S9ioZy7G76qIgBc8Av2ahymH3uUvD61AWr0zv7BFbmC5KzZBwKczYdzUVzf+yz
 ZEkrugPywsp8ygCiJOPWG69AwqrVNrdxg/MLVD6YK6tqsLcBLXXoajycwtoMzGetZXLA
 YSbSSXSY6Jxmje0ZfhZj271kMd4sA6zXZuPGq0wBsmYh4jxM+CHOfUx4fml4lw7+lAZ2
 GJMTMgulLRG8FSUtopRAPaXyMaCxrUHuWwaoJO/OUnodCTIbvPAMzZdpOGLnEikLjOrS
 wi9g==
X-Gm-Message-State: APjAAAWSE/RaaenKBi29VI3pEIxACAEgXVRoe3+jC9KW5F32hzvhnswe
 ASy2OYSaZ6eUqPpzEIm74vLOPgzLdNc=
X-Google-Smtp-Source: APXvYqzxGj4mWY++l6Nanz89PuP3eyoMxG8rOpU2SLE6fZzdEgRa3wgRzUiNERFIXAZhsWHF3i0Icw==
X-Received: by 2002:a05:620a:1355:: with SMTP id
 c21mr17076321qkl.97.1566849551426; 
 Mon, 26 Aug 2019 12:59:11 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-61b1-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:61b1::5])
 by smtp.gmail.com with ESMTPSA id v7sm6795459qte.86.2019.08.26.12.59.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 12:59:11 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Aug 2019 21:59:04 +0200
Message-Id: <43076a2afeb0439b607b0631e0bfff77d55bc0cc.1566847960.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566847960.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566847960.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: [Qemu-devel] [PATCH v2 4/4] audio: paaudio: ability to specify
 stream name
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
Cc: Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can be used to identify stream in tools like pavucontrol when one
creates multiple -audiodevs or runs multiple qemu instances.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 qapi/audio.json | 6 ++++++
 audio/paaudio.c | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/qapi/audio.json b/qapi/audio.json
index 9fefdf5186..a433b3c9d7 100644
--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -206,6 +206,11 @@
 #
 # @name: name of the sink/source to use
 #
+# @stream-name: name of the PulseAudio stream created by qemu.  Can be
+#               used to identify the stream in PulseAudio when you
+#               create multiple PulseAudio devices or run multiple qemu
+#               instances (default "qemu", since 4.2)
+#
 # @latency: latency you want PulseAudio to achieve in microseconds
 #           (default 15000)
 #
@@ -215,6 +220,7 @@
   'base': 'AudiodevPerDirectionOptions',
   'data': {
     '*name': 'str',
+    '*stream-name': 'str',
     '*latency': 'uint32' } }
 
 ##
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 777b8e4718..827f442b6e 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -562,7 +562,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     pa->stream = qpa_simple_new (
         c,
-        "qemu",
+        ppdo->has_stream_name ? ppdo->stream_name : "qemu",
         PA_STREAM_PLAYBACK,
         ppdo->has_name ? ppdo->name : NULL,
         &ss,
@@ -630,7 +630,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 
     pa->stream = qpa_simple_new (
         c,
-        "qemu",
+        ppdo->has_stream_name ? ppdo->stream_name : "qemu",
         PA_STREAM_RECORD,
         ppdo->has_name ? ppdo->name : NULL,
         &ss,
-- 
2.22.0


