Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22321E122
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 22:07:01 +0200 (CEST)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv4j6-00048y-D9
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 16:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4gZ-0007v8-OZ
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:04:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jv4gX-0006GI-Vl
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 16:04:23 -0400
Received: by mail-wm1-x32e.google.com with SMTP id q15so1134726wmj.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 13:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfI68+hGedk3QHICFsR2P3eF65wa15xU34V8+iox5Mc=;
 b=Fk7BignJC4e2MO5V34Np7ijOb2FvQ4tc3ItjokhW1S+X1rbUwRrf3sijfTT0Ta4IDH
 JJRGXrI90GE46IdXyWc+AiCfd/efrULGeAaRqk8Tkqxkcznq2t4u/ng/CRFMd5tpZmf/
 sQk3YeEKaDmYzX7bOd+BO2dB7mVGWQg49nQVoQhKKwyiH7bHyyrEaxODfD2JWWg+6mFT
 2zz3jgI2mForK6vK33+b8T/hgWwm+dN3I74Jduqlf168FOwGzQqBxtU4WUBRDcPITkow
 YnKDI/C1d3TxAvqSKqvTCTOHKiJ+Y90CO03Tof9pgP0hLtWrrkqaCU+oqyKEiKu2ApqY
 fZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IfI68+hGedk3QHICFsR2P3eF65wa15xU34V8+iox5Mc=;
 b=O6YOxmtfoRcU43POlstb3MoWS8HHSbJPUvRJE3+B+6ufQbJHq8lfyjZYrea6lb0Ead
 rroSfQrno0jClFp1nmJwsq8MTIr9XfpsZHgfRlFiZgcWTm3fRdXmK8Ull5Z/x0N9Vzd/
 LWENxNCcHBD5q766jmg6tQ8s/casie06GZRvR4fuQEWmJZYCjndWblxrB5UyisgPXVnj
 Hrm1UW1aOqdG2kgMsJwRyZS9I+6fKR0C1eaekdLP6UYMcztI6LmqEdAdtA44xpBEL9Y5
 UZAB5lLqCPyXXJ3Lfe7+ZEi352NkQsdk/qGjirnTITEh8FBfTVkIXx+Xbo99HT390fpL
 rHtA==
X-Gm-Message-State: AOAM533b1oQnvMMgmB9Yuzh29sXmpOnY4mXYH9PPEpdZ1UqdcPdreZqN
 4MzI2AyILOrmPYyppFCRb7YqHQ==
X-Google-Smtp-Source: ABdhPJybkxT1AZnUTwMuQDEsYfqC5lNOeZcExMC4AWUVm2jwrzJx/KMvk6CFD9jKmM73grcrP/U5PA==
X-Received: by 2002:a1c:1bc6:: with SMTP id b189mr1005398wmb.166.1594670660274; 
 Mon, 13 Jul 2020 13:04:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n125sm887378wme.30.2020.07.13.13.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 13:04:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2B7D1FF8C;
 Mon, 13 Jul 2020 21:04:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] tests/docker: Remove the libssh workaround from the
 ubuntu 20.04 image
Date: Mon, 13 Jul 2020 21:04:06 +0100
Message-Id: <20200713200415.26214-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713200415.26214-1-alex.bennee@linaro.org>
References: <20200713200415.26214-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 robert.foley@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, robhenry@microsoft.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 peter.puhov@linaro.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The libssh problem only exists in Ubuntu 18.04 - we can enable it
in 20.04 again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200713185237.9419-1-thuth@redhat.com>
---
 tests/docker/dockerfiles/ubuntu2004.docker | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index f7aac840bf..8d10934a2a 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -65,9 +65,6 @@ RUN apt-get update && \
 RUN dpkg -l $PACKAGES | sort > /packages.txt
 ENV FEATURES clang tsan pyyaml sdl2
 
-# https://bugs.launchpad.net/qemu/+bug/1838763
-ENV QEMU_CONFIGURE_OPTS --disable-libssh
-
 # Apply patch https://reviews.llvm.org/D75820
 # This is required for TSan in clang-10 to compile with QEMU.
 RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
-- 
2.20.1


