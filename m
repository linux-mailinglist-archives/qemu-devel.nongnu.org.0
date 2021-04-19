Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5336468D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:59:16 +0200 (CEST)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVMp-00089e-BS
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIZ-0003KX-6e
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIX-0006yE-IX
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id r7so22359780wrm.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ZRa9dJU3X3YZmZI32EUbAw3uIAMhrZ7g8+qJZIpd14=;
 b=R7KuBGiic1QPQ1Wz3YMjjkaBnQkBNS0PXISsUopP53aVnDYxcHWnConjACZtQkYqHI
 M84LsQjj+Fxi1hNqhjd5qRljeWDUQz60bnWJ2TbMbSst6JwTQrA01PFblv3hzCJopseq
 Y+bN43K8qdMQF41lY2yEMCqzd5Se+CpjxpiIADQVfwHACOLjlyqfErl7c9C1+I57voMS
 RkXYarVWMwJDc2ueuksWdp7lnjY0rrB01aFPNWht01Tj41gML/D71AWsG3c//ZmvjhAN
 ErkI0KpSWm4H00PWHhTL5u/1aMORiaNOaYoJoP2SfmqM2rC452ErAxYvKQN3XlJEs8hM
 Cg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZRa9dJU3X3YZmZI32EUbAw3uIAMhrZ7g8+qJZIpd14=;
 b=bMC7FyCJNAktFjL/iLuajEeGaylxhFKSHmtbLU+WNq86pVHqI+r2iweDZnqhq+DA4v
 DjmbjRZG1cP9ui96NzRLHnLLKHvReono6elWuv6kuf5WLqNK1ydoqWseXOUGKPL4OMUP
 Hl6PY9WeXaogWL9t15uO9U1oVjCqjdKN7ml2sKQ+4A/V94rxhRo/NcC+IypUyZVS/ijh
 PZ6KH73CGbblLahKznmsoi7nIDR8Wqd908EpM4qJ7yCRJXEjhEGJx5+0daXYe3ZngR8y
 gKkD467B8aDRDePjP15oEjUWl4hNcjoZLSlDuCVrTo718bhfUKQ5uIpYxm4apq0SSjNk
 JIxw==
X-Gm-Message-State: AOAM532gUlT+Yz6TQfI9TKMhBHqNheZMPO4jU7JUkFxtVoqfRubONA5+
 CvaYzID6YFRsMCqjI84gM+e2yw==
X-Google-Smtp-Source: ABdhPJyxtCniDEU04d3gU68aogxemhsuSVQRPEK/Mxa4NctaBirEuQeWuBFvKjSoETPKd1LKhk7oag==
X-Received: by 2002:a5d:484c:: with SMTP id n12mr14610699wrs.377.1618844088202; 
 Mon, 19 Apr 2021 07:54:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 200sm21131713wmb.1.2021.04.19.07.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D9E11FF96;
 Mon, 19 Apr 2021 15:54:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 08/25] gitlab: add build-user-hexagon test
Date: Mon, 19 Apr 2021 15:54:18 +0100
Message-Id: <20210419145435.14083-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We special case this as the container with the cross compiler for the
tests takes so long to build it is manually uploaded into the
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52d65d6c04..87d1172b03 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -413,6 +413,17 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
+# Because the hexagon cross-compiler takes so long to build we don't rely
+# on the CI system to build it and hence this job has no dependency
+# declared. The image is manually uploaded.
+build-user-hexagon:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-hexagon-cross
+    TARGETS: hexagon-linux-user
+    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
+    MAKE_CHECK_ARGS: check-tcg
+
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
   <<: *native_build_job_definition
-- 
2.20.1


