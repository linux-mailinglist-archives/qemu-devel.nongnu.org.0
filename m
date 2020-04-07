Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13D1A10AD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 17:53:01 +0200 (CEST)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLqX6-00059z-B9
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 11:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVd-0003RA-4o
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jLqVa-0004Jh-UN
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jLqVa-0004J6-O3
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 11:51:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id t203so2239722wmt.2
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 08:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TbMEKb/R1jjoicwVt8GVgYsRKVdxSn1pbcevDhKYxlE=;
 b=QMcnDLCYCI6j24s0UEFCh6kpU8DGUJmIcsHNkx05XdYFAQ96HcOzwjAGwzuHIT82P7
 QqeennngPNuCQGH1Df4sCa5Vt+jLUpXIQzWV4xd1+9nt46IlDwSgoFcTQWs65t2yuPpe
 BHf/XKfuSS9+iysdf14PCjRLtkUY/XptG6A/gmg9AHXa0/q8vtN+Y2h228e5ddVvTNWd
 LXJlgTAiiZ7QNDUeJ7Zmn6QLuf5zKmOvDb56tn6Gg4KfYYo5AQALlisSYHRLn8k1T31p
 LA3ryr8qTAUJqe8RarxvW2mP9r9sTFrWZv/7hDcBnJ9O37VWVPN05wzYxZTi8aRqFq0+
 RLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TbMEKb/R1jjoicwVt8GVgYsRKVdxSn1pbcevDhKYxlE=;
 b=m8Xvie6PH9UWh5IuhZiEGuwJ4UVX400vZ788MCeW9RCdIhv3i3d6GID7rspSfkSDsL
 s1kngZlD8OF3VtUEeTO3QIFQq6Pz9VR7pAW75/x2VwPAIEZrfJZ/CribkpJyiiY00hCE
 ZKZuseAQJDS0XOKJaGuOG4ekBtTAm4reOyQ7xESNVqN88jaRP4qO5TffDBkp2CG/pHjt
 IO13tJWGMUg0pwht5VVcrjjbY/q2ykbLpMfUWqalcgXdq82slqxsyl6tcWUABWzY4YTu
 uel197HS7kR7jhAWb3anbPo/EffpBVgfzwhT83hm1xr2lL4nvlhfrEbg79YCol7ceL1I
 1JXw==
X-Gm-Message-State: AGi0PubzuOC5GwUF3h3t+UfnzxOtU8VPKH+zfb2Uyv4keiedaLxeJdJy
 9B9Bp3HlqM8gq+1yxe9qiYKa4w==
X-Google-Smtp-Source: APiQypLhdoF4roh63frw+bubDMnq8i0uuUrgUWbZ2wiltgqiuegyblDMgkSutH+Mu738rF7w3f8KzA==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr2950628wmc.93.1586274685635; 
 Tue, 07 Apr 2020 08:51:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b82sm3124895wme.25.2020.04.07.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 08:51:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 598301FF87;
 Tue,  7 Apr 2020 16:51:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/13] .github: Enable repo-lockdown bot to refuse GitHub pull
 requests
Date: Tue,  7 Apr 2020 16:51:06 +0100
Message-Id: <20200407155118.20139-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407155118.20139-1-alex.bennee@linaro.org>
References: <20200407155118.20139-1-alex.bennee@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Some GitHub users try to open pull requests against the GitHub
mirror. Unfortunate these get ignored until eventually someone
notices and closes the request.

Enable the 'Repo Lockdown' [*] 3rd party bot which can autorespond
to pull requests with a friendly comment, close the request, and
then lock it to prevent further comments.

[*] https://github.com/dessant/repo-lockdown

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20200406214125.18538-1-f4bug@amsat.org>
[AJB: s/fill/file/ and point at canonical qemu.org/contribute]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.github/lockdown.yml b/.github/lockdown.yml
new file mode 100644
index 00000000000..9acc393f1cf
--- /dev/null
+++ b/.github/lockdown.yml
@@ -0,0 +1,34 @@
+# Configuration for Repo Lockdown - https://github.com/dessant/repo-lockdown
+
+# Close issues and pull requests
+close: true
+
+# Lock issues and pull requests
+lock: true
+
+issues:
+  comment: |
+    Thank you for your interest in the QEMU project.
+
+    This repository is a read-only mirror of the project's master
+    repostories hosted on https://git.qemu.org/git/qemu.git.
+    The project does not process issues filed on GitHub.
+
+    The project issues are tracked on Launchpad:
+    https://bugs.launchpad.net/qemu
+
+    QEMU welcomes bug report contributions. You can file new ones on:
+    https://bugs.launchpad.net/qemu/+filebug
+
+pulls:
+  comment: |
+    Thank you for your interest in the QEMU project.
+
+    This repository is a read-only mirror of the project's master
+    repostories hosted on https://git.qemu.org/git/qemu.git.
+    The project does not process merge requests filed on GitHub.
+
+    QEMU welcomes contributions of code (either fixing bugs or adding new
+    functionality). However, we get a lot of patches, and so we have some
+    guidelines about contributing on the project website:
+    https://www.qemu.org/contribute/
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d156d73b31..0559e847901 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2833,6 +2833,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 M: Fam Zheng <fam@euphon.net>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
+F: .github/lockdown.yml
 F: .travis.yml
 F: scripts/travis/
 F: .shippable.yml
-- 
2.20.1


