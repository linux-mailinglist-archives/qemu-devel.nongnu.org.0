Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146391A42
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 01:19:52 +0200 (CEST)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzUSl-0002tg-IC
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 19:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hzUGX-0006cB-IL
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:07:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty.ice.hu@gmail.com>) id 1hzUGW-0005Lg-KA
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:07:13 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35085)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dirty.ice.hu@gmail.com>)
 id 1hzUGW-0005L9-ET
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:07:12 -0400
Received: by mail-wr1-x441.google.com with SMTP id k2so6753261wrq.2
 for <qemu-devel@nongnu.org>; Sun, 18 Aug 2019 16:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnMQA/uiUZlUE5JhU4VhzWAdVWlF/CgYQuC67E40M/Y=;
 b=TM3i1A+KI2u1KwNINcwi6ZWcnd2Wo53Nk4KetUpbDQJjiatYF+C4w1HblRoCEpnoJn
 GYWiqD0+H4AYeBKQwMwAg35fFQoQV7wVowgJQo+uvPABLXgVHD9ReK5dCqhqL+LgvAp7
 o+zribpCGNnRuKjzQw0yhpggPYWm4h91N3Zw9uG6jxZBZEoFoF+dle0HWjX19GRHap9m
 kHp3CpQyYcNGOt8xfyU4HyLSAiNjWzgJ6ks+YeGTus3FTcsMZrKppyuCSL/0iTYRWMzF
 gWr3ItgsAFQzloqh3JK4mvVrH0dNYNZlhFmc3Q7z4JfDY1itg8ltK+T3FGe5dJj59aV5
 vwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnMQA/uiUZlUE5JhU4VhzWAdVWlF/CgYQuC67E40M/Y=;
 b=YVBHrDP6QNlrwwVybmR45YThcV3h/0QcJSC9hvA7YzPQhzAKcFt9foxNVHxV2P2Qz0
 zXluSnFtVDAANqa6DS8aM4kOHncscxSAGrfq9m+bd2Eld5xyDVQYr31M5UB4e2kIuhYU
 HPovT+K3yWu9pWtkAiRkcmVwaNpTanFxi6bd8B0tdhDakJ0fB6sc/Au4behY0kGN9Fo6
 76FfF9fQq0OSLwdMma5Upi/8baU1vcSjWmFcQ2ZQMKm6R4zmqUU7mIPBAtmrrj38mz/P
 1hEsEQ67ql/NScRfzwUvkM4WWYXNHPsVaZom9KyniwdwDiceyXGD6s0bUL7uwjYXYHUz
 SFaA==
X-Gm-Message-State: APjAAAW0FYYcbCc9/clzfQJwfYZyZQJ847IolfdDvRhEVUC/dl/bPnMO
 wkFRcLiCc53cIEPtEUgXsD1cJj9Efas=
X-Google-Smtp-Source: APXvYqyX09olMAba0/KUEZtaZl3XaR/lAFIC/QzZS8fP+AhigaAdDEKphTHU7nRk8cNJm7xKKlQvfA==
X-Received: by 2002:adf:c7cb:: with SMTP id y11mr16278930wrg.281.1566169631434; 
 Sun, 18 Aug 2019 16:07:11 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org
 (2a01-036c-0113-49c9-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:49c9::5])
 by smtp.gmail.com with ESMTPSA id c15sm33657152wrb.80.2019.08.18.16.07.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 16:07:11 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
 <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
 <DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 01:06:59 +0200
Message-Id: <ed35e9e72aa77c9376e9c8a8f3a5443703fe6fbe.1566168923.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566168923.git.DirtY.iCE.hu@gmail.com>
References: <cover.1566168923.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v4 14/14] audio: fix memory leak reported by
 ASAN
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

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
---
 audio/audio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/audio/audio.c b/audio/audio.c
index 924dddf2e7..9b28abca14 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1343,6 +1343,12 @@ static void free_audio_state(AudioState *s)
         qapi_free_Audiodev(s->dev);
         s->dev = NULL;
     }
+
+    if (s->ts) {
+        timer_free(s->ts);
+        s->ts = NULL;
+    }
+
     g_free(s);
 }
 
-- 
2.22.0


