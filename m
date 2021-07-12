Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D73C5C96
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:49:45 +0200 (CEST)
Received: from localhost ([::1]:48264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vNY-0001MN-IP
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vH2-0007Vr-3r
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:43:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vH0-0006HD-FF
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g12so3488428wme.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DWU5y/nf061VnY3HK74lTL314WIvo/gGKxXixXNuyA=;
 b=Ool0Zblwnq0w4zx+O/Qz87Ksq26natJbE996QQN8FuCdFLi3J35lvUO3EItVPFlakb
 h7TyQ9Ggsmj4sn5koLQVMu8PFhiECmhXlbAt/FxmECSVkk17cVd0l7sAv8olKxaDpRfH
 G7U8JcOFiF/KVbJEFqhjc9Duvr4Axpbyz4m04r0l7tDO+qfEWo7pglu3G53Bm4+eqeTE
 e4FRodZwP0aHJq+Q/C41uLe/NV4E6lPzJ9u4oWLrb6AJHnhspJUaN7CjlXqXcXA7X2p5
 W5xdiATPEIc0YovJqWouNxmhrht8SvaoAXkn3fgth6j3+Bhf4CNAxP15slK4I6vajf1e
 RPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DWU5y/nf061VnY3HK74lTL314WIvo/gGKxXixXNuyA=;
 b=AGtPfOrCnRUCuwdTC86UetYVLe2K0Q2+cad7zn79GS+2ZYn6PERCIKPQwnDC6LLQSn
 +uXXTf/jNuV3hXGcErLLXnko3otlEEEuAvT4Ux+Nv7Z8OXlyMNlHKH22+aoPCjT4u9lA
 WxlmBQXnXIxomcynKU4G278MALDtv7S2ZbCTS521ECf6XX89D7o4F72PGrlU586cwcX5
 XBBVc/k9EOJKFSYq18g/9Stp7g1dZ/q12M0BUFPqhn+rD6ViaAQjg56gqlCLOF5r0PNc
 1psrrMjCEPl/fOsTCRK1ydW3GZxXgvGRVToFP6+XLB8Sptin5EQvyRLxEVXwwpedtLGK
 FXAQ==
X-Gm-Message-State: AOAM5312hPiOeROvA2uz2LKsbR/AFk1VChSInzJFLMzEObk3vl4pZTEo
 hRK68Qr92BP9Tf1rcQZpCtUipw==
X-Google-Smtp-Source: ABdhPJy4k1X3VCJ5TffpbQ4TRFyX8wxwJPni9aRKGCP0JHiiSBe8+QANVMhUciIagtHxomeiYBCN7A==
X-Received: by 2002:a7b:c1c2:: with SMTP id a2mr8870451wmj.15.1626093777181;
 Mon, 12 Jul 2021 05:42:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n20sm12206700wmk.12.2021.07.12.05.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:42:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DA081FF9E;
 Mon, 12 Jul 2021 13:26:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/40] tests/docker: fix mistakes in centos package lists
Date: Mon, 12 Jul 2021 13:26:28 +0100
Message-Id: <20210712122653.11354-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

mesa-libEGL-devel is not used in QEMU at all, but mesa-libgbm-devel is.

spice-glib-devel is not use in QEMU at all, but spice-protocol is.
We also need the -devel package for spice-server, not the runtime.

There is no need to specifically refer to python36, we can just
use python3 as in other distros.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-8-berrange@redhat.com>
Message-Id: <20210709143005.1554-16-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index ee52305646..5f1c57b4ad 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -21,16 +21,16 @@ ENV PACKAGES \
     libgcrypt-devel \
     lzo-devel \
     make \
-    mesa-libEGL-devel \
+    mesa-libgbm-devel \
     nettle-devel \
     ninja-build \
     nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
-    python36 \
+    python3 \
     rdma-core-devel \
-    spice-glib-devel \
-    spice-server \
+    spice-protocol \
+    spice-server-devel \
     systemtap-sdt-devel \
     tar \
     zlib-devel
-- 
2.20.1


