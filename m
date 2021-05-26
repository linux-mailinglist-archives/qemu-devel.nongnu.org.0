Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D7392212
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:30:05 +0200 (CEST)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm16K-0001ru-LL
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vb-0002EO-03
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0vZ-0008Hg-D9
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:18:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id x7so2505070wrt.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1xtIIdcRklMtNBJaqxpAYm419XChwTUcQvEdXYlclE=;
 b=CmMhp2VH6NkRW+iZ0ra6sXs2nT4/pqhNCAojcgi8JNKB9rIf/lKX4ejSACkGzGAmOw
 Wdq46BmQVcKGte8er+ZnzQ046u2aqzc+ECNymz2v7K0zxV0DL6K6ZwHD8zOKpOF6666L
 DKo0NU2vFjXkzRb4ceCZzci34QOtar6V4z/yXe4t9IVfAzyKLRGKEkHn1xmCP3sv8LQM
 QLK84Uh/2wVKZp28yw3PByji/5kURdVCw0TiRFB/2/SMWYuCVeaeKzk2nIYtueBeFRP2
 bcsdvF3vHihm19H6fU2fFXfdz7YEXKuj052OucbuQS8ZHgJqfzXFMr8TD2LZ4thFms1G
 /hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W1xtIIdcRklMtNBJaqxpAYm419XChwTUcQvEdXYlclE=;
 b=TlRhpwPlfgHAcrX69IRg4QZBh+lYQx6vQkHzgDreP94JZMSPEiCuj6+Nm0Fw0B4/bH
 COfUQseMG5RkkGTF2jmWv0cpy7mH8IwuloumjFJU8GRzQCo/IKt43fkH0oj8XANQ23c1
 nIUs7CzOU2p+jct945Q9ymdDFdmwIIrXrCo8aI1yDjY/HSbXeylKlfGD1guQIAz67LSD
 EkXHrncAcdoP0NiDNCDAV+ZafYRhM+wtlGDnZiBVGVu3hmq8W8sN5FHtaGbmE70F9i2g
 AiHMNUHsXjkjcASsXi6TfVvyt7XYtIV0o4vIbYRNtJyJen5Mk+pmm2JGGWlRJhwGsr+x
 y3uQ==
X-Gm-Message-State: AOAM530A4gybIU2MZ5KyDDC0zunEJrmxJHRlxbhtrZNYW5GzmHSBdhVv
 nBheVuI9V34wvbriZVEt6C6ffmPrctiVcg==
X-Google-Smtp-Source: ABdhPJx/sR9ywq6DYazP/O5Oa9ZWqubwkOsxVmqD40poUq54roeE+QiBvw/qK5m5i6PEQgSM05qiZA==
X-Received: by 2002:adf:d081:: with SMTP id y1mr34041077wrh.179.1622063935837; 
 Wed, 26 May 2021 14:18:55 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id c15sm191442wro.21.2021.05.26.14.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:18:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/19] gitlab: Enable cross-i386 builds of TCI
Date: Wed, 26 May 2021 23:18:22 +0200
Message-Id: <20210526211838.421716-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We're currently only testing TCI with a 64-bit host -- also test
with a 32-bit host.  Enable a selection of softmmu and user-only
targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210502235727.1979457-27-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/crossbuilds.yml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 2198abb400e..edf3a625633 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -27,7 +27,7 @@
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
   stage: build
@@ -98,6 +98,15 @@ cross-i386-user:
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check
 
+cross-i386-tci:
+  extends: .cross_accel_build_job
+  timeout: 60m
+  variables:
+    IMAGE: fedora-i386-cross
+    ACCEL: tcg-interpreter
+    EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
+    MAKE_CHECK_ARGS: check check-tcg
+
 cross-mips-system:
   extends: .cross_system_build_job
   needs:
-- 
2.26.3


