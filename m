Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6038FCC7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:27:41 +0200 (CEST)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSPc-00064f-1d
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOG-00047f-Ts
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOF-0007Ip-B2
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:16 -0400
Received: by mail-wm1-x32d.google.com with SMTP id h3so3477526wmq.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ux6np9ztAdqQGvdxsklQqqZAAfB86o2ZJo9IT2gBAyM=;
 b=L1bBpTctMztGCoEqU+eEqaPboM08ILeHaGUdYgVwae3ODzKh1IfRfIY5y4kfVNFNZy
 mkVgclxYtkDdl3BeK7n8ii56iXbOo7Xdix5Yxk+YAKHyP4TbJ1zLZXf5DcIzqZ5lq4m/
 CSM1qjSmetW7mU/PP+paYZa9tR1+i8DqH/0oHD3+M8Qkw1izVKIu4Pr/1xX5HETEOkd/
 2z+S+Cy73ttOU+I6J4RbL63du6PqhybUkQCnGEXmena87yreSj0yj/vermvWD5ZkAvhI
 YGNB8K8aiaxwEK2xwXlSdp96VhrLz+VyOwb2QZMwKNShT1oxhTmGcHfA0pri0u8tkF3B
 PM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ux6np9ztAdqQGvdxsklQqqZAAfB86o2ZJo9IT2gBAyM=;
 b=T3d/osD9NshDdAg7+qXErGOlIF8m+FpI/VN9IqaHPobIDdqrzPcpECVh6zSKLEqDRI
 EwnQpIYhQ+jl0SwIDOr5AH+2n0OT2QZ3E6n6tNrNhAy+b9rweyrphQFiQhH4lecqG4xb
 AzPoWfofmy+A6tcmKOI4ImE2JGTS/Pxe253XfSGNUkqvDel8wHXm1loxAkGf10PWSk37
 nfuasFExzxRzRdQxiJT7/rqAyoASaEgmLRihByHq+1zf2GUDKQACOjTwfnSTWfLVdcGx
 4zKEGuwBt+OQwHAJ9Gf2xsUWaITbPL0k2GIGa1Y+LPf+OvMtDViM+3uoJLaolbWKHT4t
 Dfmg==
X-Gm-Message-State: AOAM532pk9uBXUAoLlSPE3SEPOZEd85Kpm0qQI4ym5UbdfaWUaEhPZhI
 PnNlRW7sJHH20pKMqr6c0hPEcnKzP/9l7Q==
X-Google-Smtp-Source: ABdhPJwbUhS0ZSgs26UIDzNPKWYmqLJCnhcLqqDyEILyFz9JciLmd8Liuj00/CyS1iCaWaDpsoYrxA==
X-Received: by 2002:a05:600c:2dd0:: with SMTP id
 e16mr9147218wmh.135.1621931173831; 
 Tue, 25 May 2021 01:26:13 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y22sm2265191wma.36.2021.05.25.01.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] gitlab-ci: Document how forks can use different set of
 jobs
Date: Tue, 25 May 2021 10:25:50 +0200
Message-Id: <20210525082556.4011380-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
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
---
 .gitlab-ci.yml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 533a7e61339..8c843e5f20e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,2 +1,16 @@
+#
+# This is the GitLab CI configuration file for the mainstream QEMU
+# project: https://gitlab.com/qemu-project/qemu/-/pipelines
+#
+# !!! DO NOT ADD ANY NEW CONFIGURATION TO THIS FILE !!!
+#
+# Only documentation or comments is accepted.
+#
+# To use a different set of jobs than the mainstream QEMU project,
+# you need to use the "custom CI/CD configuration path" option in
+# your GitLab CI namespace setting and set it to option and set the
+# location of your custom .gitlab-ci.yml:
+# https://docs.gitlab.com/ee/ci/pipelines/settings.html#custom-cicd-configuration-path
+#
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.26.3


