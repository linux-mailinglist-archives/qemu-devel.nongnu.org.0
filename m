Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6246BDA9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 15:51:38 +0200 (CEST)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnkLI-00069m-Q1
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 09:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57772)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkKe-0004X3-2k
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkKd-00010u-5C
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:50:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53853)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hnkKc-00010G-Ue
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:50:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id x15so22256943wmj.3
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aiXkUQ2gKdXWnndGoTZSa73d2EC/iSCFpvxehWxd/BI=;
 b=c4yK9Snq+bARoHabV1ZUkXfsZExH/BB9+KV3esOy6BwiDBFbF0JTXRVkBtbKv+VlgJ
 MaGf2cDsxfaqzl+ibGevXCb4kW7pQ5oEY0dQM3x0/oBOpyipMG5axPSIEIjST4yYCV7l
 hshM4Y8nUzUZVeFNIeYgXT44w6PAwwbdbhecR60lC0nyVc0g68eiaoSqtL2VoggKKwpJ
 xZ1rjAwPHj5xCI/uyPbMeGosMRkA6nlFZQ0to0yVUAucujJV8fe3AVvTwtWlh9IIJAQQ
 tMqGLuHu8soekVDnKdnl/vgk2xp34aV2yrVHsZjCxPcJ3+VxAcGqyoXF03ooPthaLAV4
 r78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aiXkUQ2gKdXWnndGoTZSa73d2EC/iSCFpvxehWxd/BI=;
 b=rDKbgz+hFfMd/I681dmXL0elzU8hVD/VRpfOilJpGHKkL4URIf0jbU4aB/xb5zRBXS
 RH7nol8rvSdp9HDzvBkEUNV/zFLTO/b+SFn5BXOYUjurbrdz4SF+4Bzh9fLU+qTq9pNK
 huwfKUw/spq2wGYuoD8GZtPK/A1MIdLRLqu2jO+a3GS1NXuDQzfFP674BnE6vkMLmANe
 lcWy+Hn0u//WVXc2OZC3wktLJQYzhG47aB1snrdO8JFFcr6nOCbQ0e7OLRMhwqJpWrpI
 c/D7WfZXKtGrRxk6LaNcRMksBjVwqXs+U8VLr2DEl5YeKCqbzWXYkRQ376E5OJ3U8y+7
 OYZw==
X-Gm-Message-State: APjAAAVNKPYX5gnhTV2AEuzHP79TdNAp6Hpz0ZOxFhBj/5MymyUpG6o4
 gUs3s0/tYOVT6la9vOuMUzX1Eg==
X-Google-Smtp-Source: APXvYqxWpowQNhwAH3cUBqXh+oZAript3ST5WgtN5GKcaAFFRzl0cGgB5Lh0FGyVsUhu9WOXyUieKw==
X-Received: by 2002:a1c:a8c9:: with SMTP id r192mr37999068wme.43.1563371453809; 
 Wed, 17 Jul 2019 06:50:53 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id b8sm22780023wrr.43.2019.07.17.06.50.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 06:50:52 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 334221FF9E;
 Wed, 17 Jul 2019 14:43:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 14:43:27 +0100
Message-Id: <20190717134335.15351-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717134335.15351-1-alex.bennee@linaro.org>
References: <20190717134335.15351-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
Subject: [Qemu-devel] [PATCH v2 15/23] tests/docker: Let the test-mingw test
 generate a NSIS installer
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The NSIS installer generates an executable suitable to install
QEMU on Windows.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190715174817.18981-9-philmd@redhat.com>
[AJB: also --enable-docs in configure step]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-mingw | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
index 4b84cfe120a..fdb1c2c879d 100755
--- a/tests/docker/test-mingw
+++ b/tests/docker/test-mingw
@@ -27,8 +27,10 @@ for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
         --enable-curl \
         --enable-vnc \
         --enable-bzip2 \
-        --enable-guest-agent
+        --enable-guest-agent \
+        --enable-docs
     install_qemu
+    make installer
     make clean
 
 done
-- 
2.20.1


