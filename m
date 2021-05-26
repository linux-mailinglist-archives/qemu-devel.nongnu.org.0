Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4139222E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:38:23 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1EL-0005gf-M5
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wP-0003PV-UY
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wO-0000HK-Ag
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1351068wmh.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/9em1Rc0w7uvJ9uL6InauPjExLfDiqhVvlPxi7IGY4=;
 b=kc7z+v2luTx1XPNejLrkbj5gV24xfeee+dCBr0GRz2BdwfEkhGsGuFydBquDPYwKGp
 Nku8NQpDfdfb5HDRORRCoLC4/n123Xpi1Q7raCyeptzM6EfwfaMyOXcW2u6a67tXkXuE
 LqJHpsI32Agq5fqjgh7cI4qRGwOZ9QWujbUSYLkilkO0LooH1HVR1NFnYq9Sy3j/4bRZ
 PgKiWNKvvFR/gFphDFbofCG3wWrIMUaQdmL2YXbqPEW3+AsWfzRNYhJzyvUUzw/IkLw9
 QYvDgtRf4ZRwSGGMRCkHNXjpWzFMeGu83tgcTAd5hv6nbc6cCXoP0Z2utibaLHsdW1rN
 EstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c/9em1Rc0w7uvJ9uL6InauPjExLfDiqhVvlPxi7IGY4=;
 b=Kg34zD7xqUfiF3taLiYejSESKLI0QjEwySo5z6LJ1S56HeTolJsG4QHkEAKXwC5HRC
 x6V1cjoNh1R2uKiAHk/HVr+vEMqqsNKT7/NvnXvQtXOHczJPxOPHFs+Qu+qu8v+OYvh2
 DpqP9eOvdvwLHVlJlixjnGpmPXTcmGsYruXuDMPvNZcAlM+P+fSsfGBg80B7kQ3aDmaV
 M0dR19iQObhtZwgpMGFIbNQa6st9EQza7dVAZGUt69Y9PnmaTfiQwjC19lsNH45QY6N2
 eE17baWFUZ/mYfheCB2YeVdDpJDG0IdtaUd7jsuxFeye+kcs3zjT7NOMgG55DaUM3sWN
 pZFA==
X-Gm-Message-State: AOAM530q2sOLigR2s03mch7e81+gg7W7eUFIM3lZJPkZ/Z0NDzDEY2vJ
 nP6wOoMAkYuQ4m2hhaZt4OAzCy76rq7T+A==
X-Google-Smtp-Source: ABdhPJy/rg0JdE1n5TtKXxoY/+ruJN9SQ4iobXwODNZiiyANNQSIrNYePCw1ElNFdC8DpysFh4QGkw==
X-Received: by 2002:a1c:a7c2:: with SMTP id q185mr327296wme.112.1622063983990; 
 Wed, 26 May 2021 14:19:43 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id f6sm211840wru.72.2021.05.26.14.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/19] gitlab: Document how forks can use different set of jobs
Date: Wed, 26 May 2021 23:18:32 +0200
Message-Id: <20210526211838.421716-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document how forks can use different set of jobs and add
a big warning so no new configuration is added to this
file.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210525082556.4011380-4-f4bug@amsat.org>
---
 .gitlab-ci.yml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 533a7e61339..7e4ffab4d11 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,2 +1,15 @@
+#
+# This is the GitLab CI configuration file for the mainstream QEMU
+# project: https://gitlab.com/qemu-project/qemu/-/pipelines
+#
+# !!! DO NOT ADD ANY NEW CONFIGURATION TO THIS FILE !!!
+#
+# Only documentation or comments is accepted.
+#
+# To use a different set of jobs than the mainstream QEMU project,
+# you need to set the location of your custom yml file at "custom CI/CD
+# configuration path", on your GitLab CI namespace:
+# https://docs.gitlab.com/ee/ci/pipelines/settings.html#custom-cicd-configuration-path
+#
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.26.3


