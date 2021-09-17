Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3240FE08
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:40:16 +0200 (CEST)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGuN-0005jr-Lm
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeP-0003Vl-28
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeN-0005Ut-ID
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so10395985wmd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=554gJAf51sCeJWu+v3QBNYrShBWM+FpQpxvcowr/wK0=;
 b=HeZX23b4MfsPjAESFRt2N5WQrnxZMmB0QFVbppTuOkqEEqAkpqSTSzDBqqT3qbCCLS
 l9XSir7tJHI+0Ed/9m9gkaXNE4HCAXysjOVux8uOYz2lLhz2e2Z8o+P4UJYXzTWyrzuU
 Wn9ciDSE6D6zibPpDlJTm++DZO0b/ZN32tjSF9YfM6tUbnwrQkvreFXYLGdhQdHamO5h
 ypsxzB0nQ/YHX8xqLBY6pPLTvAB/QbRLJ+XjIBeQFo2JAcA3iHQE/IXrDk0kArvDPU0I
 wDZ3pPfAOPW9BnuSz6q87b523kJwuHfbmeDHwc3K3XHCOwD8B3YAbwR0+ko7vyArY+gn
 SmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=554gJAf51sCeJWu+v3QBNYrShBWM+FpQpxvcowr/wK0=;
 b=wDz56kbzrMi8aguJAUcTMfAhKOCV02qODekPDihiD1u/fmWhTd6hKJvAVtjsyw63ci
 OWbvoq38KHcWndSlbbINpa3URBHwwDsEo3BZeVKLmnIP/ZM0PdHiR85fRShu0hTWpWzU
 Zh68t16jqefU5jblQtt/jwEzQ0DvKmBYayANc1f2ksPyV4GCLITJtP/y4qZovIJoYiBU
 3M+zLi19z0q36RNpTVRcMhtGuPcM8uPYkqV12+bd/oPF04ZyDbQAntrjB0tExUqPcaZP
 9QTS87sirfK1p8O68v9nVN2wONHAmXI9QZkdMRguBehyXUZwSpEacUVOMcdOgzn0Numy
 yOlQ==
X-Gm-Message-State: AOAM532fQ/NEhI+Z1EtecVQ398M46GazDAYAgfIv1RSyknVQ67teVXMy
 bVYrIcjSEyHB8dRFmSXyYIQYww==
X-Google-Smtp-Source: ABdhPJxrKwHlLQomOVUwbeBGJ0JjrNKNU6USSZHut/fwog6LzriBzwUX/wKR5Z1gbX93T1oncskh9g==
X-Received: by 2002:a1c:cc16:: with SMTP id h22mr11387291wmb.117.1631895822099; 
 Fri, 17 Sep 2021 09:23:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm11246390wmc.41.2021.09.17.09.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A20011FF9C;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/11] gitlab: Add cross-riscv64-system, cross-riscv64-user
Date: Fri, 17 Sep 2021 17:23:26 +0100
Message-Id: <20210917162332.3511179-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210914185830.1378771-3-richard.henderson@linaro.org>
[AJB: add allow_failure]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>

---
v2
 - allow_failure: true
---
 .gitlab-ci.d/crossbuilds.yml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index f10168db2e..17d6cb3e45 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -124,6 +124,25 @@ cross-ppc64el-user:
   variables:
     IMAGE: debian-ppc64el-cross
 
+# The riscv64 cross-builds currently use a 'sid' container to get
+# compilers and libraries. Until something more stable is found we
+# allow_failure so as not to block CI.
+cross-riscv64-system:
+  extends: .cross_system_build_job
+  allow_failure: true
+  needs:
+    job: riscv64-debian-cross-container
+  variables:
+    IMAGE: debian-riscv64-cross
+
+cross-riscv64-user:
+  extends: .cross_user_build_job
+  allow_failure: true
+  needs:
+    job: riscv64-debian-cross-container
+  variables:
+    IMAGE: debian-riscv64-cross
+
 cross-s390x-system:
   extends: .cross_system_build_job
   needs:
-- 
2.30.2


