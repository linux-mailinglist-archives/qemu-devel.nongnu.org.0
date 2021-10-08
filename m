Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5250426AF5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:37:01 +0200 (CEST)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp7U-0008E1-Mw
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowz-00032I-LV
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:11 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowx-0006vN-H8
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id o20so29230101wro.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OurTzLLuet6/f8y2V92mbSdjr774nC3YCF5I0yCoTU=;
 b=lgEiUzPFlftBfd4UD01/HuZpajvF5asIusRx0QeldeDWG3N7FtelKPkq1WuMvj5axM
 m6rwDL0ph1HPgKWXGejdHavYlk2iBCLEvij6n5d4ULKW5e8H5PIzsFhL13/YlNyiSB8F
 gIXhfJh8c7B9Zzg68l4cQYg/kB1schxojDNDqTcgYaR8U8B20Dlz55Y9jcLseUfhte8K
 TGfBJZOcgNqRbesEPlHLZNUbVUG1A3qG0Pk+gzS531iZY6s3w0h/9GDzsBd3CGu3dIs9
 u8Ub9iMlmaebZzrhQNunkxSlV3+S31KaybDbuZtoK9RG6pm8gEnhUx2fVcFXxx/zyQVC
 jLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OurTzLLuet6/f8y2V92mbSdjr774nC3YCF5I0yCoTU=;
 b=rzaUHJGYCw0qvUrAgaInxmCQFi0J4d8BSeWWRUVuZ4O5z7Hk3zNXGsIGxEcmrkoBSd
 a9hfHp5g3TvGMeaCkZNmFFkTbpVWlL/nchjy5jzK4k3vNDpUMgQATSl+KN8/Trwyn0jJ
 cN0jgqproCXMwMRfhbNgXplEVZLzt0mYWGzIjz83Y0CsFUUFSmL6pB/mGXzprsbfGYYv
 vvXlVwpxvN/94tV4RWE05ElDglKsaMpDsCScphOJfzOV42lIxTumYSVG4rirgvJsKilc
 fDR4tlOhH1kPBO/IZ1M7tGaOqxw+TJi/HVV9mWGdICsKJl4TTeGTCiE1cCdDZmJWP0r+
 M/Hg==
X-Gm-Message-State: AOAM530HTlfvYswB+ikFHQ0z86eoEyxigIVFCbAAMus1YO4AkN+NvjLX
 QylHhVcqyBmvgj8QwBowXYYg9Q==
X-Google-Smtp-Source: ABdhPJx3pmQUCSmESwaO2QEO1eUPGUwTCRVbpVAxbtWmT7wcTDDeSh6Upo49Q14pEwvQqpT7w5ZMjQ==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr3104360wma.33.1633695965473;
 Fri, 08 Oct 2021 05:26:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q3sm2203094wmf.11.2021.10.08.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A7E81FF9C;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 05/12] gitlab: Add cross-riscv64-system, cross-riscv64-user
Date: Fri,  8 Oct 2021 13:25:49 +0100
Message-Id: <20211008122556.757252-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210914185830.1378771-3-richard.henderson@linaro.org>
[AJB: add allow_failure]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210917162332.3511179-6-alex.bennee@linaro.org>

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


