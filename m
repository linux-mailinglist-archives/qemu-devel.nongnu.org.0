Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EF936389A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:49:45 +0200 (CEST)
Received: from localhost ([::1]:46188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYHAe-0005Uy-JD
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxF-0001MY-M2
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGxE-0003SH-66
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so10128463wma.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=luRvL4igtqHocK7BdoHgxFjXZoT3hewA/GRk+uJX/ss=;
 b=jKddbjnv8OIKs/jfXACt4C6Sx0y3wznhvs1+aKB3OmJrcIb3Tgn7gEvKbVOKly+uba
 1OHNOcS8FI/0A6oHgVxyZWbDLx0U1tyYxJbZ9PZECvPdkCNYN62pIywLN7NttOAjcqJI
 e3df/3CFpFM2ggqenMDS2c08bGm8pBTW4I11b92+5LrVrbpbk+zhf0hOf0TZw0M9STQQ
 5Mjwi8bLwLIThYlxyGAEErrS+SnHgOe+veaD+KYub3DdH8nJm6pAYJWEUpZpxmjPdaJF
 LF3LvH1G55Cwocj/7qzl/2lvulrM7edIKmbRwwYufS01KIMV4DAByCYXfHUXdr2cFcdM
 +aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=luRvL4igtqHocK7BdoHgxFjXZoT3hewA/GRk+uJX/ss=;
 b=V0toFwqBPDpG0d2Pv28PXfnTJQgLs/PltsX/mU9YI5mpZd6dS5Or/s1/tuPVeHNaLk
 e4FEntAUdM4uCXejcykNrdA0bapJV167Ug/boiMZYVadPu4uaf5Ylca0hqoy6v2HJe80
 FRaC6wZWQUQpbMiMe8hnRYww3j9QifqwkZu6chIv+c1o9NNwlCOdoCj8n67uslfUeWCd
 VKUx1lKtyU5n/Qk5KtuHS2PWSEpu8Z/c50pyj/GKnDZjowajMOQLfDIBGGevaSjPcxrr
 qX0AjY2o32mUKwZFAYM4pia/4ny1rcyWRMf7QRXro7xQ1+/YYVSqf2rCd/2M+Dho+q26
 kq0g==
X-Gm-Message-State: AOAM531iP3BRoyRRV1nKBORgQboE0GVYtHnL3XS2CwnUhpYb2M/ObWxr
 d3yCTg4uzum0t2fLFokMwkC8eh5S8KNXJQ==
X-Google-Smtp-Source: ABdhPJy7vtnvn00eCQMpl9J9/aJCewjn3E7E07DSQEUFV5oXTFrirh20AgOX1R6Iig7N/NXY4oVcFg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr18809350wmj.128.1618788950776; 
 Sun, 18 Apr 2021 16:35:50 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p3sm4621011wmq.31.2021.04.18.16.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] gitlab-ci: Move current job set to qemu-project.yml
Date: Mon, 19 Apr 2021 01:34:45 +0200
Message-Id: <20210418233448.1267991-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow forks to easily decide which jobs they want to run,
but without disrupting the current default, move the current
set of jobs to a new file corresponding to the jobs run by
the mainstream project CI:
https://gitlab.com/qemu-project/qemu/-/pipelines

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/qemu-project.yml | 8 ++++++++
 .gitlab-ci.yml                | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)
 create mode 100644 .gitlab-ci.d/qemu-project.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
new file mode 100644
index 00000000000..8f13a584a29
--- /dev/null
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -0,0 +1,8 @@
+include:
+  - local: '/.gitlab-ci.d/stages.yml'
+  - local: '/.gitlab-ci.d/edk2.yml'
+  - local: '/.gitlab-ci.d/opensbi.yml'
+  - local: '/.gitlab-ci.d/containers.yml'
+  - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/buildtest.yml'
+  - local: '/.gitlab-ci.d/checks.yml'
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8f13a584a29..533a7e61339 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,8 +1,2 @@
 include:
-  - local: '/.gitlab-ci.d/stages.yml'
-  - local: '/.gitlab-ci.d/edk2.yml'
-  - local: '/.gitlab-ci.d/opensbi.yml'
-  - local: '/.gitlab-ci.d/containers.yml'
-  - local: '/.gitlab-ci.d/crossbuilds.yml'
-  - local: '/.gitlab-ci.d/buildtest.yml'
-  - local: '/.gitlab-ci.d/checks.yml'
+  - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.26.3


