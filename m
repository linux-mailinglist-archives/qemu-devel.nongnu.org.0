Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A931D94F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:23:55 +0100 (CET)
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLs2-0007Po-KS
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLo6-0002TH-FO
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLny-0000Jy-NJ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r21so17135415wrr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7xvEMHCAPUwYe789c1mfBls6VgPCLJJofS5unRcGOk=;
 b=CW0uoIIY1/EXmRPSDiWjrOU5/6WETRgGy6B2uJql5oW9rtGGZkiaUiP2ZA4/rjH7g/
 +ek9zPMJeh3X16ljmMt60y+aS/UrxylAdkvWIELGX9RfCb17f32HBmla1/sPoXI3I1F8
 ZLEOeR3BFUh7ontvlt5kawfPmo8NnDPe6Pfa6QrSgFoa/vSkEeakt7ZLmoiDd8A1qgWs
 2ITf/Uw5n0L1QBUFvmytPLJEPinBpfx+/WBD40ipbe8AJX5EA/M9RD/rQfmTA6Med8ez
 V6I67C09Xx/PzgSvodzg5Cq07Uv8egDGK5jDDAROhAg3AiLxmYfLhjQjRwhrDa552133
 OFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7xvEMHCAPUwYe789c1mfBls6VgPCLJJofS5unRcGOk=;
 b=nfOQbxOYpbz14ghs3ZMrbgOeZhFXxE82sLzuxwwYQPRLSBJzzms32FP7vsu2RUuGSN
 s2gse/LQeb/Ej1rsXFc4PmvlOZORqDQ3GJQQNUbTkKBsA8+k3GAHX1tzIFkWcQluANOu
 ZbrSffLgSBiwX2dkhRbLV/dw9MTkEikxQOCZULWZsjMmLzjoRWM1Aektl8yMyO7nsUlC
 7L1KjyaQnD6CndtOq/2yzHfOToR9xxTVMUDb40lcEZ7STfdHIdxFzxaCpKXWA6q3QcJE
 EaEAwvaqHED9Ksm7JqOkMg3tI/W0HO7EK9NV1op2gqr41O+d7qqZxnBylSrm/m8LfXwJ
 R8GQ==
X-Gm-Message-State: AOAM531RTss5HcRSxInPxORcS9nYeAreTDxoMwcf5YAYRHrlEucNkbqZ
 PieeRMAq461ooV+oLPEm6hr60A==
X-Google-Smtp-Source: ABdhPJxgRsoK1aSDjRN0O8a9jWfy5Dy4kNGhgxE2UT/s/UOZn+R5vEDx2JkqjQMbcx/zDAYFQe7ZkQ==
X-Received: by 2002:adf:f542:: with SMTP id j2mr21475801wrp.46.1613564378780; 
 Wed, 17 Feb 2021 04:19:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o129sm2847535wme.21.2021.02.17.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:19:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A46071FF8C;
 Wed, 17 Feb 2021 12:19:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/6] gitlab-ci: Display Avocado log content when tests
 timeout
Date: Wed, 17 Feb 2021 12:19:28 +0000
Message-Id: <20210217121932.19986-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217121932.19986-1-alex.bennee@linaro.org>
References: <20210217121932.19986-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit ba2232bae6d ("gitlab-ci: Refactor code that show logs
of failed acceptances") we display the log content of failing tests
(Avocado "FAIL" event).

Since we are also interested in tests timeouting, update our global
Avocado config to display log content for the "INTERRUPT" event,
"possible when the timeout is reached" (See [*]).

[*] https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/writing.html#test-statuses

Suggested-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210215171438.935665-1-philmd@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7adb9a4cef..234cead60c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,7 +64,7 @@ include:
     - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
     - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
            >> ~/.config/avocado/avocado.conf
-    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL"]'
+    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
            >> ~/.config/avocado/avocado.conf
     - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
-- 
2.20.1


