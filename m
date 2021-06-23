Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E93B1818
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:29:36 +0200 (CEST)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw08V-0003Om-B3
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw077-0001H0-IN
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:09 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw070-0001cO-Oa
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so2991374wmf.0
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQsxqROO64ifPQfJrlhBIb4V4vUbGpVp2XFtNhjxtPM=;
 b=oC411WFiAT7WK4m1kNfFxh9vq37bKiCy3F7Lm11fs19sZzs7d6KuB/M43nhKS6xT1e
 vqc/p22SuDPfL/ZLyqOlQOjYD/N+CjFjUrA7HH/CRALIL9FR1lHFfiMxBzlZZ8gK6xj7
 j7muoRa82ptrmpW0VhEtd2KbmR7XGlBLrSB8eOJGm6I6lp+XY3wb5zO50QyiJf6eJRjF
 nN0Chce+TGfADrtwaITQGB7pxwGi+K3WQovcApgwIFsOz8foR+8ThsOA7SZajCv5s+7G
 RG9XWmDeYfEU/0ZTrKUz6BpfbSRUctvUd6gzOAzILzT5+sNoaxpJlHYNBhMUrUNIjf0x
 GiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQsxqROO64ifPQfJrlhBIb4V4vUbGpVp2XFtNhjxtPM=;
 b=Jym4/tDPDlyR84osTHpam+bEWQosIb8MUoXkJjf1OpCfLlCGifr6xW2X+xztGuZ1SV
 hwM3rqN3Yq1MRW1gLRnrMX/lzihSZPGly+zAC/WAB/Yajy2a/wTz8fyf+JOPTitlVt+8
 YZrBNVPL7DiWu3zulYwdouyYwQ5UQfgfMkU18q2uhkqrL9k4k/BAWk5YwS8j2KdYIRYP
 h1rXQa2Cw1yyacRChOywS1P0BosPzcI69S8OO6cIFMoGBWn71yHdQvQeu3rSy6zoy2T5
 50IrKcA4tMKLNYilEvIGHwrXAcluPUjwTzds/+iSkinlZ1DWzrlwPyGYKLcEfwksmW+y
 4oiA==
X-Gm-Message-State: AOAM532YD/bpoerr/GWV9iBGaUAZH/blewquDUA8KrjmzlYR7FouKCsD
 kXbitC8UgshOJPRvKHWgmak6GA==
X-Google-Smtp-Source: ABdhPJwlXTtoj36j1O8wUta3kV8Gs4uAJibc82S0emshgg8fKyflvqgHrOWu+CaotND18iZLjhHtRQ==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr9692131wmc.71.1624444080637; 
 Wed, 23 Jun 2021 03:28:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm2454352wrq.17.2021.06.23.03.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:27:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F3CC1FF92;
 Wed, 23 Jun 2021 11:27:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/8] tests/tcg: skip the signals test for hppa/s390x for now
Date: Wed, 23 Jun 2021 11:27:47 +0100
Message-Id: <20210623102749.25686-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are fixes currently in flight but as this is getting in the way
of a green CI we might as well skip for now. For reference the fix
series are:

  linux-user: Move signal trampolines to new page
  20210616011209.1446045-1-richard.henderson@linaro.org

and

  linux-user: Load a vdso for x86_64 and hppa
  20210619034329.532318-1-richard.henderson@linaro.org

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/hppa/Makefile.target  | 4 ++++
 tests/tcg/s390x/Makefile.target | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index 8bf01966bd..71791235f6 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -4,3 +4,7 @@
 
 # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
+
+# There is a race that causes this to fail about 1% of the time
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting vdso support")
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 241ef28f61..0036b8a505 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -8,3 +8,7 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+
+# This triggers failures on s390x hosts about 4% of the time
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups")
-- 
2.20.1


