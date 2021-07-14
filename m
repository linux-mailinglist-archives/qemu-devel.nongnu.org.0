Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6993C873E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:20:47 +0200 (CEST)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ggo-0007nM-IL
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geN-0004u0-P5
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geL-0002IO-FJ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id l6so1856925wmq.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q40Rn3JF+d2/b2IrZBQBwjU1N/Ro9qFu5x8Qg9QFHkA=;
 b=PNB5aEGl/dxqqXalJtDRCHzob6M86G5mWpCuXF+kWkEAEAN9LCSoJu0RhxSTnCRUTI
 pto0/7tNFFNse600gUIdQ9xGZwkFvYMNaS0zmG30mBWIiR6RrshOHNlHmIvJ9esnfo4I
 Xhl48gbUImD6J8iHXNCXJZfZivQelKH9CNZR2ccU+MSL+ZPhfL/IC3+I6Vp3z7ghcWZX
 7809X+M6La1lLheAXoczhevbQo6SEYpY7W4/K0LZ+HXjoLoigImytfrM8hhkqilC/TPv
 fXhyegfu+r8Um4KhT5Dz2ZhcN2pY0F6tfMCy4OLJXkGeERyuYe8g5An42hxTAo6ZHeXI
 +8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q40Rn3JF+d2/b2IrZBQBwjU1N/Ro9qFu5x8Qg9QFHkA=;
 b=BJh1zKumhbG+zvSlCN/uY+govAvDSZJOF0tIfQoAW5VmfySW93oVDVTrouQgiQzu7e
 r4S345y/vwnA8lYujxJQHORBRPjld5PirhZ3bwaBRIfoRvG9EbZHrd/PELoXLWQs+6Zc
 PnKym6tCo7lGFAp5snR9b3CRtf+RSd/LjcvkLI6IZvTzkV6BDkiAP8IsQOvikOBX/xCd
 vY3D89pPOuAiI2Qgsi/gfYkw7iC2zKLq9ccHt8D4dU8OdmgRsLiJ/3HTm4C+9VGJ+3qu
 rvYRxsmClzoD7GmWj7BX3341T0griaP6boTqVx3oJNmGfi6MJS2cxs8/spHdtxGbZSu/
 XIKA==
X-Gm-Message-State: AOAM532VJjc/BZolZywiUP0HftREcTaC4Dy0IuXg+M5ndwbA1gYkLh9A
 yCkk4og6Wx537b0oq+f1uj5Ocg==
X-Google-Smtp-Source: ABdhPJzr7Q7TD8anr54zz4gqFsXUTqL1p06fP6ZWp8XgJWx41beRwbqNaau7rxRGaABngtWLvyFiaA==
X-Received: by 2002:a7b:c1ca:: with SMTP id a10mr4907431wmj.0.1626275891646;
 Wed, 14 Jul 2021 08:18:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm2353954wme.2.2021.07.14.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFDA51FFB4;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 27/44] tests/vm: update openbsd to release 6.9
Date: Wed, 14 Jul 2021 16:00:19 +0100
Message-Id: <20210714150036.21060-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update openbsd to release 6.9

Signed-off-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
Message-Id: <20210709143005.1554-26-alex.bennee@linaro.org>

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 4d1399378e..c4c78a80f1 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.8/amd64/install68.iso"
-    csum = "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56f62b6c"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
+    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1


