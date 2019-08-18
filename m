Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFF691A3A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 01:13:41 +0200 (CEST)
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzUMm-0004cb-14
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 19:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hzUGT-0006Uk-3r
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:07:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hzUGS-0005J3-1N
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:07:08 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1hzUGR-0005IX-Rt
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:07:07 -0400
Received: by mail-wr1-x442.google.com with SMTP id q12so6728990wrj.12
 for <qemu-devel@nongnu.org>; Sun, 18 Aug 2019 16:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rslzC2c2WDwNlJOxHo//ed6lLff8LJfI6lnQMj5SLIg=;
 b=bhm7J5WmqoaiqOT9MpO/YBlLvJe2+OELuIQxSHhTPuJ/UnOP28hg03rFukTJMpHZMS
 9YWtMjmspgdeap3qRuPUyj0WdSvV4M7CCpbKo5Tjgg1uH4LtUPZ+0NuFEzUJAF+v+28v
 ticIqugalbBHuQuLB5s7V7CYjUFCaIy34b71PTYnDNUGK4YfIryPBIHAQrXhEv/5Gjrj
 LPeLsn2SqvTpbk0mRvUFtiNpIbh4JNUp6DOd6kbE2gwENAk+SDH9f73QbGlMdgpDNp0i
 rrlsJ7eLksZtExxu5Dt9BuH66y032i6GIx+O+uetsCmcA6K+1FgO1hYJAqivqwVZQjTq
 MPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rslzC2c2WDwNlJOxHo//ed6lLff8LJfI6lnQMj5SLIg=;
 b=V9AU0c5hDR3NeGFfu7JpoNGOZcrQdbVs7gXKv90X1VoNuZCXGpOA6lCvFUfpch25pu
 eaPpafM00lNUcBP156UOsMawSJ0XlN8sYix12Rkx+iuXqmKIYmNF5XKrUSCS8auNAcao
 mBeBmAotzvD4Ya+55ra9Jn5QSQ0dNaYyKkQZ17JpFdDSt5smVQ+DM7n1BFNb7trWcYNJ
 Q4hAtH+Blorg0FO28RYYcNgH/DjhPAEV5roWAYlQuBNweNM/f9gYsbkfmJ7fhe+Tn9eS
 rDm6+Fa2FpAERGuVf9VBV5xuUdsOYM4tT5bCssxs/CfiEyqZhFpSQ5xY/30Q611Nk/eS
 HAzg==
X-Gm-Message-State: APjAAAVRjH/ruogHIwgdZaDCm2SsLsPVLQs88v8hyoyvJ3P3x6FiTlHJ
 Qp8I2nP/vN7VHtpSrupjr7PAV74AxUw=
X-Google-Smtp-Source: APXvYqwYF2hOooTME+dXctIkL5vuCECTpDypSc3fiEQKeXemYjoSfDA+d4fWycw6MPPkJ8wKyp40iA==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr21987734wrt.278.1566169626737; 
 Sun, 18 Aug 2019 16:07:06 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-49c9-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:49c9::5])
 by smtp.gmail.com with ESMTPSA id c15sm33657152wrb.80.2019.08.18.16.07.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 16:07:06 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 01:06:53 +0200
Message-Id: <c81019d550d9c3518185d3d08bd463ae3ccdc392.1566168923.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566168923.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566168923.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v4 08/14] paaudio: properly disconnect streams
 in fini_*
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently this needs a workaround due to bug #247 in pulseaudio.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/paaudio.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 24d98b344a..1d68173636 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -685,6 +685,27 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     return -1;
 }
 
+static void qpa_simple_disconnect(PAConnection *c, pa_stream *stream)
+{
+    int err;
+
+    pa_threaded_mainloop_lock(c->mainloop);
+    /*
+     * wait until actually connects. workaround pa bug #247
+     * https://gitlab.freedesktop.org/pulseaudio/pulseaudio/issues/247
+     */
+    while (pa_stream_get_state(stream) == PA_STREAM_CREATING) {
+        pa_threaded_mainloop_wait(c->mainloop);
+    }
+
+    err = pa_stream_disconnect(stream);
+    if (err != 0) {
+        dolog("Failed to disconnect! err=%d\n", err);
+    }
+    pa_stream_unref(stream);
+    pa_threaded_mainloop_unlock(c->mainloop);
+}
+
 static void qpa_fini_out (HWVoiceOut *hw)
 {
     void *ret;
@@ -696,7 +717,7 @@ static void qpa_fini_out (HWVoiceOut *hw)
     audio_pt_join(&pa->pt, &ret, __func__);
 
     if (pa->stream) {
-        pa_stream_unref (pa->stream);
+        qpa_simple_disconnect(pa->g->conn, pa->stream);
         pa->stream = NULL;
     }
 
@@ -716,7 +737,7 @@ static void qpa_fini_in (HWVoiceIn *hw)
     audio_pt_join(&pa->pt, &ret, __func__);
 
     if (pa->stream) {
-        pa_stream_unref (pa->stream);
+        qpa_simple_disconnect(pa->g->conn, pa->stream);
         pa->stream = NULL;
     }
 
-- 
2.22.0


