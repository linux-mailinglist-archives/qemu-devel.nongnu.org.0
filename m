Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82136210D51
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:15:16 +0200 (CEST)
Received: from localhost ([::1]:43924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqdW7-000898-G8
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdL3-0005Gq-JP
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:03:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdL1-0006rj-PD
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:03:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z13so23992230wrw.5
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bOvcEoh+VzOuY+elSS3lw/PZUPV6sZX2V0ial7PUh0E=;
 b=JLKoQ3J7EBzWdb5NlzmrWWeO78CTnNVWr4J48TDyFnHQfFxMZA1595KxZQ5TvdYkwe
 AF5BOrrIKv/AvkujT9R4iglkeSsBtGVDRLN9GG4SBIH2HMXR5q8R5uKyY/yljUWufzM4
 KBZgw6lWw43Vjm2TO9fgVjbrHVjfct3DRXIr/WpdIK4RyaGxgaxYva8PIYV1lYwvsYN6
 CJZWeVESJQMgNzQXeYZ9Lf2C8pUpMmW5C0iEro0Zk+sieCM5wPh9hHxLfCzOx8ObZxGu
 CKgt+lU62fcWBwc+/v0jRdAHz/F/krp+L4vNSzx6tZCSi7P+uBeDRv0EbBL5MMhfg0tH
 0o6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bOvcEoh+VzOuY+elSS3lw/PZUPV6sZX2V0ial7PUh0E=;
 b=PXmglf1bzT8jATo2Dw69VeNWNatY1m1fm9syP8Qvhaew87Kuuf5UdEv7JQbL5ZipYo
 JTN8H1L/LZEDYPNGwPDySLICRIkKHYbxVXoN9ywpV1ythwUrY7YOJbYqa+fk8HneM1NT
 g52Um1dTAXIlrwUQaoK9Y2nB+iHIHKXOduEcol4y/8ejKVAVHyvY2o+GG7foXRZipI6I
 IDXMuSUahB65zVgPw12XqZtxc5vOZzF1wzcWj3KTtQ/RB0lgJfhmA7KrZiTbiXJRJmKE
 XFEzYqFIgijMnm1WI+FLpHltOUuTJkavLfYsJD+A5aQzRM2hPTMnueu8MKqiNueNBabc
 VAzg==
X-Gm-Message-State: AOAM530aFn6KNbdqtzUOuFyy5CN7tMxuMq02z1DbGyto0fgGFffPQleG
 pAyOzdjf4AeL7F0j13tK0z37Yw==
X-Google-Smtp-Source: ABdhPJxOoR/XFhgphdxyxCtusDFNe1OYvicCOfzFzhgDLu/xTpyj22tAtN1HgZSZ7OQ7w9kuk9VW0Q==
X-Received: by 2002:adf:f608:: with SMTP id t8mr27476592wrp.308.1593612226358; 
 Wed, 01 Jul 2020 07:03:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z132sm7330352wmb.21.2020.07.01.07.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 07:03:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 818EC1FFBD;
 Wed,  1 Jul 2020 14:56:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v4 36/40] gitlab: split build-disabled into two phases
Date: Wed,  1 Jul 2020 14:56:48 +0100
Message-Id: <20200701135652.1366-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701135652.1366-1-alex.bennee@linaro.org>
References: <20200701135652.1366-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we run check-qtest in "SLOW" mode this can timeout so split into
two jobs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
v4
  - rename :->-
---
 .gitlab-ci.yml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 13e9531724d..83e38ea19f3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -113,7 +113,7 @@ acceptance-system-fedora-alt:
     MAKE_CHECK_ARGS: check-acceptance
   <<: *post_acceptance
 
-build-disabled:
+build-system-fedora-disabled:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
@@ -124,6 +124,17 @@ build-disabled:
       --disable-qom-cast-debug --disable-spice --disable-vhost-vsock
       --disable-vhost-net --disable-vhost-crypto --disable-vhost-user
     TARGETS: i386-softmmu ppc64-softmmu mips64-softmmu i386-linux-user
+  artifacts:
+    paths:
+      - build
+
+qtest-system-fedora-disabled:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-fedora-disabled
+      artifacts: true
+  variables:
+    IMAGE: fedora
     MAKE_CHECK_ARGS: check-qtest SPEED=slow
 
 build-tcg-disabled:
-- 
2.20.1


