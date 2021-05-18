Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E63874E5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:17:26 +0200 (CEST)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livqv-00058G-39
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhQ-00085A-O4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhM-0005UK-8B
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so1060302wmk.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAXGx82XxM7VmXNOT6ej/QtLpo+ZWO9C8Z/4DJv4ABo=;
 b=M8TdHit31d60SG5yPc79bteZkeNXOHEZb7SC0aAvQ2iNeQQXX24EnUYwLXKZHfhyyt
 OArEscmaOOURZAD/Lk7fvALNEL0QX8zJJyhS82pdbWq0ZW6V7/TWEQK4JTjUQh0a532r
 nASDVmjkEGosTX+6qe4KE9QifBbxOiyZqIsIjnZWc4vKPWE1FR8inXHOssJCvpjFBo3E
 xXU2q+2b1NPDGvBC2MrNSQKM6G0F6rTR4dhnWvyjSztvoX9fC4DCyajZRHMaA1MDAlYR
 w/icQeon8BqKpaQDkrk4zZJjIBaBuCI2K3ZsksL6QZcyOVYzqfNC3UVVBJHP7JBpAfSY
 jpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RAXGx82XxM7VmXNOT6ej/QtLpo+ZWO9C8Z/4DJv4ABo=;
 b=k+COq1mj/koOeD+Le08u8OODqulC/KtK/Tgq3aPM8MIjilXW/NTrWMx7Q+YJ/ThKEz
 5CDiP7SQrGzpgVTgj9kGjiFBAcVMVuK1NPo1RhbmUDiKQluPafwJW9QJpjUvwtAVDXkq
 QGvbGv+PgBi5COwD7VXZoOqubynmFvqq0+/GT8goB2Me3hZ0aTJADhrMPT1c1reWCQ1y
 kObw1rXxnq2WGpRbO5l3gP4vVZtwMOYunohs2/roj/DS9AbkqCTBpyttYkzYxj2dE+aW
 BPBz0huOmk6bHnuK75Scb52eRAReQ+JYQe4L7E3X9iJq0JIr0kNuMJ5DQGXuAVDhT/dP
 +c7A==
X-Gm-Message-State: AOAM530g6U2fD+GSVN5wCRqozBTGK6MlmNV5rYVKgvPAVzmcaqB66Tvd
 8SDuhZLwQzVpO8NdMcUXq5T7+g==
X-Google-Smtp-Source: ABdhPJzI9SazYg9sbll0da5yhUeBBrAMXr9inycZIUc9EzseHdlxy1Lhf9QXBmNhCZLywq+vwJEFDw==
X-Received: by 2002:a05:600c:3545:: with SMTP id
 i5mr3679740wmq.43.1621328850865; 
 Tue, 18 May 2021 02:07:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm2020734wmj.8.2021.05.18.02.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 958E21FF93;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 07/29] gitlab: add build-user-hexagon test
Date: Tue, 18 May 2021 10:06:58 +0100
Message-Id: <20210518090720.21915-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We special case this as the container with the cross compiler for the
tests takes so long to build it is manually uploaded into the
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210512102051.12134-9-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 24f300aace..f718b61fa7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -416,6 +416,17 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
+# Because the hexagon cross-compiler takes so long to build we don't rely
+# on the CI system to build it and hence this job has no dependency
+# declared. The image is manually uploaded.
+build-user-hexagon:
+  extends: .native_build_job_template
+  variables:
+    IMAGE: debian-hexagon-cross
+    TARGETS: hexagon-linux-user
+    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
+    MAKE_CHECK_ARGS: check-tcg
+
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
   extends: .native_build_job_template
-- 
2.20.1


