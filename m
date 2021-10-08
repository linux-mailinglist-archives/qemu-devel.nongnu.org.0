Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB775426AF6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:37:03 +0200 (CEST)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp7W-0008Eu-BJ
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYox1-00033I-Ba
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowz-0006wS-7L
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v17so29275073wrv.9
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sIzEvgWfGKFtMvrQS5KEmIsP4SzZixuq/OxHefax68=;
 b=MwCSZ+nyaHSICVRIj67x2J9Yqpq5Qg/TvIEXOT8gtvCFBPhMIHRprw/gN7Y0bVdNUM
 tFqqb0xw1UmQf534CsnXU+imyI0brGMjhxHWLTNxCvl7R0KdaadEd1NA0YK42zXc4xpT
 LHvC6WyDzL+rXThirrcUinISYHQO9vtHX6E9J5g9cnR6hnVj16Cj8RUMy0YUr5xPEeNg
 668nSKCcasHc/Lq8S+ab7rL/q9XpgFaJPb4iCVw4VAt51aQwrMCWflHodG5C434jlE4b
 cTmb2jkPq6GmKLFL8P+L32LWO6U8Z8bJoznliZ/8TQ2DmCspSxbksIwCwg3NJC3i2lc3
 ciew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sIzEvgWfGKFtMvrQS5KEmIsP4SzZixuq/OxHefax68=;
 b=gRdro2oZVNr9fdbxfRnBlcMSutNjuP2rQhvnZmrsoq0mpxOYwR+04XHJlXP+RVDyQB
 CKpxktkULU4wsDzr8EaMiks09mTDbudo4jAGbZEG1Ka5TDNXQQ+3epikyEi9DxMLDlTX
 qUKs7M5C2T93Dz9RdnjoZCGJhywv6Tst3Z5C7LwbYv2lw5olyX4W4h1vIE4GTse6Lbsy
 ij1cO1/LM5lm4p1Ylo02sDg5MAE0QVZ5A2OORQwNne8DQjE0HiJjuXDCgxGL4UOWyTzh
 cuEyd+5wfxY4bwDHx3WtSPfYfZqOuBf3nkZ2Ozim+Bv76/IeYDSAi1FYPCKlPvQLWlrl
 mqMw==
X-Gm-Message-State: AOAM532rIT5CWoo6IGjT4O6HQDEq1kMLIqgX6v/IZzG9NR+stcpKh0/N
 9uGh23byvOKgq2ak1oL7EMINew==
X-Google-Smtp-Source: ABdhPJz/wsODQ0PUaXoLGDW1E1qZTjjlvU/+7dlfC/AzEFN8APPpHuRGUEUhJoeWl9hOmzq1By/TfA==
X-Received: by 2002:a1c:208:: with SMTP id 8mr3172200wmc.114.1633695967850;
 Fri, 08 Oct 2021 05:26:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c185sm2394477wma.8.2021.10.08.05.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA8731FF9E;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 07/12] gitlab: skip the check-patch job on the upstream repo
Date: Fri,  8 Oct 2021 13:25:51 +0100
Message-Id: <20211008122556.757252-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The check-patch job is intended to be used by contributors or
subsystem maintainers to see if there are style mistakes. The
false positive rate is too high to be used in a gating scenario
so should not run it on the upstream repo ever.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210915125452.1704899-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210917162332.3511179-9-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 96dbd9e310..902843f8b3 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -8,7 +8,7 @@ check-patch:
   variables:
     GIT_DEPTH: 1000
   rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
       when: never
     - when: on_success
       allow_failure: true
-- 
2.30.2


