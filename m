Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D530C008
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:49:31 +0100 (CET)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w3e-0004t2-5S
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vus-0003rn-NE
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:26 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuq-0007QR-UU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a16so1959477wmm.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkuLK63yEXX5SW08QBjGa4Wz+OKzv7+Xm922jA3ia8k=;
 b=Ft35cCBGkrqz3Y9sMSNzYiHugOId5lMWmej468fnr9pQxQh9Cjgr2usjNpZiqqvPAw
 wY2FNxHTYjuVfShKpMtKXRcNDxz3N3CqqIHIuCi6rJXMIpu6uKzYthuHoLsrwU2rMtwV
 I94qwe6wBBgfeJmjENuYCVyGl8Ql7VqREA1AD+dtMULBVvdMZG2aD9MSjRh+bGxPLcSf
 DrNefvjcZRoxqwIuAAl04curl8qchfsIXhjp3pSDE3FGMjjTLKJzM3daQ9J0P2YZ4lvk
 vgWf5sgt/pbnFDDoJ2na9w6VCHIDkJOnqjMU3HwGaLNTF4AVIArC/at/yUjNEAB6zLl6
 guQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkuLK63yEXX5SW08QBjGa4Wz+OKzv7+Xm922jA3ia8k=;
 b=aK7vmFFjKade7r5Mu5UbpsQCTj3pnplQnqK66bWqOajnydxDvtKJi023qIG+1f/EhB
 ljoeW5XL8FR8fk/KWPdU2+b5xNjrXAjMzLnIPbf1YjbxFQNVjE7Z19m5g9oZ8crz6WAN
 g+GsijVqFLagkyXXz6rEi77yXv4qOFIQrYQZv6XEBHgEfs6jm143ku1JiLCF3BepfbVP
 2y+mdf4a8cgtLXLpFegngf5QevvI89yEoFG4Wf+3QUalGlBKnVdvobHyNDSf2Ux6YF/z
 j8ydF4TWn5g1eW97ThRjKxp9NR2uyY8k0drmzWyenVXEg6K71S4N4d0n+8aiOoum+k9a
 KtnQ==
X-Gm-Message-State: AOAM530LLz+B5w2ey8KAaxA/A/Wg8IwJgz+ejQl+DI9OOsqWs6m3Jw96
 gUV5I8MaRgVUwIrcu+hn5sbz0w==
X-Google-Smtp-Source: ABdhPJwpLsEUOLomagVBtphOZV6NJl1EsDprqCtb6GSEeyyLgww1LgzGJxlxtIj+h41tZIOTi7+Gsw==
X-Received: by 2002:a1c:2ec2:: with SMTP id u185mr3672580wmu.83.1612273223596; 
 Tue, 02 Feb 2021 05:40:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c18sm4744430wmk.0.2021.02.02.05.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E0851FF9C;
 Tue,  2 Feb 2021 13:40:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/15] tests/Makefile.include: don't use TARGET_DIRS for
 check-tcg
Date: Tue,  2 Feb 2021 13:39:58 +0000
Message-Id: <20210202134001.25738-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_DIRS reflects what we wanted to configure which in the normal
case is all our targets. However once meson has pared-down our target
list due to missing features we need to check the final list of
ninja-targets. This prevents check-tcg barfing on a --disable-tcg
build.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210126145356.7860-3-alex.bennee@linaro.org>

---
v2
  - move everything to Makefile.include
---
 tests/Makefile.include | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 17dafdfe98..d34254fb29 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -40,11 +40,13 @@ SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
 
 SPEED = quick
 
-# Per guest TCG tests
+# Build up our target list from the filtered list of ninja targets
+TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 
-BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGET_DIRS))
-CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGET_DIRS))
-RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGET_DIRS))
+# Per guest TCG tests
+BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
+CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
+RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
 
 # Probe for the Docker Builds needed for each build
 $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
-- 
2.20.1


