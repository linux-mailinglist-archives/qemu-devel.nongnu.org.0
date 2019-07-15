Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A469D5E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 23:10:38 +0200 (CEST)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn8F2-0007sH-Uf
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 17:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hn8Cw-00084C-SQ
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hn8Cv-0004kO-V7
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:26 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1hn8Cv-0004jl-Or
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:08:25 -0400
Received: by mail-wr1-x444.google.com with SMTP id g17so18585716wrr.5
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQdS/4gPbCHrpQ6QHLwZkQ1izi38pwhpM703vz5qgTE=;
 b=NeeklbMOPknojBBnqgNy+O5xmyEnrAy8xqqEN1N4c2U/XHg7aHw7we7U7ZXLN+gu3J
 1mvw0qifjaiolVJaYcqwP/tVQhuqfoOb9MFqtQA+G/B+7RJTKXboVGu2/v5H87lCxBHt
 ZLtLXM3YopjpMrf0g+NgVj9GZbT4IvriUVM1QIpZOOFCG1dzyjrdeT5rY14QXjD1nZgj
 BP6EJNtfpSLbU74AaQKTpNHA/4plhAPhyM1Xj39SeZcVeSWgvJNj+qq9CnvyY6MudD5Y
 a5x+UcVwB5I7m70eB34ju5Xiz4KKMM8yUxlcK8XeKrbHUCfiR5MMXmvv3J0ei0mXXCOQ
 GVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQdS/4gPbCHrpQ6QHLwZkQ1izi38pwhpM703vz5qgTE=;
 b=uVmpfUXr+bx+E9/LzIiVhqCBlUXWUIQYPjhfE0q4kCV+KqPDr/PpsQ4w+Erd/WOtOu
 HdjRICoIsggAXmu/3RPTP0QQNQJvPKNaE7OMDy/US65nmxkiMaEsoGUkbHMzmvIiF7up
 4VLnuNa+S95rjLn6qYeD60NdxnPDGHRCdPlfqJE/d8nPCPu/3IGiRH1qeTOPJ+mxN5BL
 wVTt+mrGXwCudVNW+whbo9DyR/bAPgS6QWQR0aFUQJ0QUdTPhCZA3bX3eFdPtPE3d1gJ
 Mw0p7MobQSkc9AxvibR+BdlDJjvLO6SvY29nqr/yD+tuHDFZI0ybxvdTcWz/tmgmlnZr
 peDQ==
X-Gm-Message-State: APjAAAUlMT+IfyQM9ltGuPqfUOgcqLKlSsYMxuIEPpnqldGrCH15ssIV
 ICzydJXDAsT8ePTwpvpLU2StyEZG
X-Google-Smtp-Source: APXvYqxV3HKQ+7L5f/MQTywQ5q6tI+uolGSV7P7XBJnvGgIjhT6fnmAS8nXLVbtSiJ+P5D20rXWkdQ==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr30468323wru.195.1563224904680; 
 Mon, 15 Jul 2019 14:08:24 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-31ca-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:31ca::5])
 by smtp.gmail.com with ESMTPSA id n8sm11513447wro.89.2019.07.15.14.08.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 14:08:24 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:08:09 +0200
Message-Id: <e87ca466ba1489422266bae0a857037f36c16c5b.1563224628.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1563224628.git.DirtY.iCE.hu@gmail.com>
References: <cover.1563224628.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v2 07/14] paaudio: do not move stream when
 sink/source name is specified
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

Unless we disable stream moving, pulseaudio can easily move the stream
on connect, effectively ignoring the source/sink specified by the user.

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/paaudio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index cc3a34c2ea..24d98b344a 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -517,6 +517,11 @@ static pa_stream *qpa_simple_new (
 #endif
         | PA_STREAM_AUTO_TIMING_UPDATE;
 
+    if (dev) {
+        /* don't move the stream if the user specified a sink/source */
+        flags |= PA_STREAM_DONT_MOVE;
+    }
+
     if (dir == PA_STREAM_PLAYBACK) {
         r = pa_stream_connect_playback(stream, dev, attr, flags, NULL, NULL);
     } else {
-- 
2.22.0


