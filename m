Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FB2EF436
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 15:52:52 +0100 (CET)
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxt8G-0001II-1W
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 09:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxt6b-0000kI-A9
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:51:09 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxt6Z-0003Ta-C5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:51:08 -0500
Received: by mail-wm1-x336.google.com with SMTP id q75so8654884wme.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 06:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zQcZp8bkA2WeZ/wn/evI7oLuy1OM3HJbolNiXmykBOk=;
 b=bCdHUttOpd6TrBZfxyS6QUpD6XI170rtl1ysrFSex4XSKLxKHKXddK9+jmQS8suwLP
 yUYGc6pYhlADrNUzidQ+BNJKPREFsOqOBjl59Ia9JNMg+eQBRf9278IWyWcJxm3ArILF
 +l5iUmA2bULtdH9TstrPxDvIDNsLYv81pL63DG4Tz0hcVGtKilF0bD1ZJ3CSWZSZKVVV
 rNqHEFssVSW8evh7/tL4cBfxGoimHeVm/qb2d+iMc4SBPE31u9wj6etN3BkOwuHjry4o
 zPzM6qjZ/S8gYm2CUd/8kYLJUzjeNLht0GPGTBVL6cIQjxa2oeyLGdayW/J9KkeHnTCr
 Hrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zQcZp8bkA2WeZ/wn/evI7oLuy1OM3HJbolNiXmykBOk=;
 b=KI8gq6q9k5tISZo5czFnp/U3gOgdKQN9imS7wi6Z4F2gBTdr/ovJw+7Wtj6ZzsFRGg
 2pZYkw6ZsQV+IdQ67xwclZCOeqQVW/AcPlXN97ULZcyZtN2x4qQSYNQRkQK31aIExUXB
 icZvXv1fUC7DYZQgTyGMo4d6O4QxckzN/Jnl9OdcwBgXMbaps7VKIZ8EiLIAobIyQUl9
 9U497JtGtU7XKTz2kI8TxODsMU87s1c+AwuKzHJkry236qErKQ9XkJOA0ftKP+lr9CSP
 sFNb1/HLbXy35FfT3ztPeILFShUvSKVgyqwYLM6RRSbVzg6LLXr85gC/IjKo8pIymhCY
 /eoA==
X-Gm-Message-State: AOAM530RQycHrQ6rXtrhkXe3COOGg/dJKKYfi14YXMFo04+iHYX2tMIa
 F7WACBflBQZi5VEfTORClNME7vx/El0=
X-Google-Smtp-Source: ABdhPJxCKGgRuh4n6ks6A04peQkyfwTqRAQt3IKvJ41lL3pDFQjWkDRsPtQ4L8uAWcrtmSsOiZpySQ==
X-Received: by 2002:a1c:b742:: with SMTP id h63mr3341274wmf.122.1610117465620; 
 Fri, 08 Jan 2021 06:51:05 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id x7sm11691942wmi.11.2021.01.08.06.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 06:51:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] shippable.yml: Remove jobs duplicated on Gitlab-CI
Date: Fri,  8 Jan 2021 15:51:03 +0100
Message-Id: <20210108145103.269353-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following jobs are duplicated on Gitlab-CI since commit
6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):

- IMAGE=debian-armel-cross

  TARGET_LIST=arm-softmmu               -> cross-armel-system
  TARGET_LIST=arm-linux-user            -> cross-armel-user
  TARGET_LIST=armeb-linux-user          -> cross-armel-user

- IMAGE=debian-armhf-cross

  TARGET_LIST=arm-softmmu               -> cross-armhf-system
  TARGET_LIST=arm-linux-user            -> cross-armhf-user
  TARGET_LIST=armeb-linux-user          -> cross-armhf-user

- IMAGE=debian-arm64-cross

  TARGET_LIST=aarch64-softmmu           -> cross-arm64-system
  TARGET_LIST=aarch64-linux-user        -> cross-arm64-user

- IMAGE=debian-s390x-cross

  TARGET_LIST=s390x-softmmu             -> cross-s390x-system
  TARGET_LIST=s390x-linux-user          -> cross-s390x-user

- IMAGE=debian-mips-cross

  TARGET_LIST=mipsel-linux-user         -> cross-mips-user

- IMAGE=debian-mips64el-cross

  TARGET_LIST=mips64el-softmmu          -> cross-mips64el-system
  TARGET_LIST=mips64el-linux-user       -> cross-mips64el-user

- IMAGE=debian-ppc64el-cross

  TARGET_LIST=ppc64-softmmu             -> cross-ppc64el-system
  TARGET_LIST=ppc64-linux-user          -> cross-ppc64el-user
  TARGET_LIST=ppc64abi32-linux-user     -> cross-ppc64el-user

Remove them from Shippable CI.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .shippable.yml | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/.shippable.yml b/.shippable.yml
index 14350e6de8a..97bfa2a0f38 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -7,20 +7,8 @@ env:
   matrix:
     - IMAGE=debian-amd64
       TARGET_LIST=x86_64-softmmu,x86_64-linux-user
-    - IMAGE=debian-armel-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
-    - IMAGE=debian-armhf-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
-    - IMAGE=debian-arm64-cross
-      TARGET_LIST=aarch64-softmmu,aarch64-linux-user
-    - IMAGE=debian-s390x-cross
-      TARGET_LIST=s390x-softmmu,s390x-linux-user
     - IMAGE=debian-mips-cross
-      TARGET_LIST=mips-softmmu,mipsel-linux-user
-    - IMAGE=debian-mips64el-cross
-      TARGET_LIST=mips64el-softmmu,mips64el-linux-user
-    - IMAGE=debian-ppc64el-cross
-      TARGET_LIST=ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
+      TARGET_LIST=mips-softmmu
 build:
   pre_ci_boot:
     image_name: registry.gitlab.com/qemu-project/qemu/qemu/${IMAGE}
-- 
2.26.2


