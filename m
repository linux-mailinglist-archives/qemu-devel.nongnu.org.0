Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB943C2611
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:37:07 +0200 (CEST)
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rco-0001zp-LD
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWF-0004h4-Fx
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWD-0005XH-7w
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id j34so6440451wms.5
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0T57Dc3nW1plGWjw3nuVtK4UawlZ6tR8xwYyvQKWOq4=;
 b=yCBcgxwwU71Oa62Prvjvu8HXufc8O+ICYrwoZ0YDi7sSAxfs9AbWliBEegDs7/Bb8L
 HkunK9ChUzfzjErRdCAHFSs7yw3bHGLHjYicKUSvzXfn3x6LMVfe4/y+bYtiwqh54tMy
 WbDklCa5T3rNV8TNq3YBxO6GOhd9/ylwwscRWqP5eioo+Oq2229rKljkrCkKx519kQp2
 WRXdVXoKP4enCqkWaphsohy7eXoDOS2V/Ipp2+LYOo1iPDHgpvLP3mkuAoQg000XE6xh
 UrZf44EptvM7/w1M2C4m8HN9OkWjkmedf1XZJ8fRv7cmhLpWApxbqjhQZ4Z5kt+LkVxG
 FrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0T57Dc3nW1plGWjw3nuVtK4UawlZ6tR8xwYyvQKWOq4=;
 b=G4nGsD5/G1Dbmiehl0H512gCSmmiJOh1b66yGjRmWSIdzFWXEbMx5Lf9h/k/VQ7gkd
 ZfL3+sWaMjYRJ1qVDBAkuVQy5LCJrn0wMfMjkIOrSioMy3xU1SYbnnAQMcbyfPeEefGP
 6lwgbiw7i/iQ9qWOSEJD6oa4+TP5aMrRQ67p95ekiVRjrVo0uKD8sCKViCsHM6LTex38
 sjPdhNarciF/ZQiPxnhPv4nJoYPF7J+kdxdwQxqsbfGLBoXfQt4wcpsYaYqmOYQ85Pjk
 sCszhlssQD3whT8MHm9nEH4p6F0V8VnCJFNFMyihDQuwmBehY4r8hevUrNxcE6W8nPI0
 zxIQ==
X-Gm-Message-State: AOAM531dlTxGXHRgqkd3a/ppZNwNEHA4KzupTI9/aR0iTmE0D8azakkU
 oN6q90Tir/BH9TY9jKNnNP8ZBA==
X-Google-Smtp-Source: ABdhPJxSm8n5fy101xXqFrdG1iKxYWaX3gSLsUfaI9KIeoIWNxMNwkaOhgUl+HLOkO7csjFsIlgDtg==
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr40221791wmi.180.1625841015936; 
 Fri, 09 Jul 2021 07:30:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n18sm10222489wms.3.2021.07.09.07.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9CB31FF91;
 Fri,  9 Jul 2021 15:30:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/40] tests/tcg: also disable the signals test for plugins
Date: Fri,  9 Jul 2021 15:29:30 +0100
Message-Id: <20210709143005.1554-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be more important when plugins is enabled by default.

Fixes: eba61056e4 ("tests/tcg: generalise the disabling of the signals test")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index d57a115873..85a6fb7a2e 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -37,6 +37,8 @@ signals: LDFLAGS+=-lrt -lpthread
 run-signals: signals
 	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
 
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
 
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
-- 
2.20.1


