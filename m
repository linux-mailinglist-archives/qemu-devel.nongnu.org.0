Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D4A3513A3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:31:18 +0200 (CEST)
Received: from localhost ([::1]:58078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRubd-0007i3-Li
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWp-0002oZ-Aw
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWJ-0001lX-Jc
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id k128so779732wmk.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jl280ftsbGJDzLbgIATSWoh0jwVe1aZy+bZVBiUjAp4=;
 b=nwWpnuftyW2eIc8D9MWXqCZRkX5rs+Ep399vvRLnKnVtD+jfZP8uToGl5Iz0YZq64a
 Khehsy05a6POkLFYsq1Cwp1NZJ8OneruC0uda3gNQrRaE+qljM7a0lYwB7B6b6sziAU3
 ZL9GWyhGK/66bZzJGU7Mmiy9qqPSZ51o6+5R+kRwfCv7728XwqNFyiRlOGHJjVf7UUg2
 wv2MmleUFQdW9fGIpzuYEdNXLbAMqYn7OceivudaAKslWkiy6/6pC1xFpACFcJ9LbkTJ
 ZFqVEYR/qf8zJWb83AGbdCwF41BN5CA72i+5MJ3rbUF9f0ZSgxACivZWLklOHMsr0jSo
 AOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jl280ftsbGJDzLbgIATSWoh0jwVe1aZy+bZVBiUjAp4=;
 b=LbXug4DjylbMJhhO2Lg8mjZUJUnY+ri9eUA4qdEjEO9e0DV9eonzcnDtkDMRYPyuxg
 HMxFBGUaePGa0I18XmbocsHbdTns0H3xJlVjF+YDbNLHAilXR5sJaDR5/U5oQINMrZag
 xaAtUnVT+FvRFx31FoWKO7NCw1e7sO4mz5sJdPfD6miPaAgzLTFM6J6UXe8+PbCMohyf
 5QPYsS/8amBbpTM579LTd+MSu+R99Pr8HQxCsyGuyMRTxF7w7ayAiLVGPOO+q2e7OvZO
 H7UBpWyNPpsk4joLMgy9nz6T/2gUilHipgieiAgAtKaPCeZCBcncT4SyaG3spCMB5Sv5
 VsVg==
X-Gm-Message-State: AOAM531aKVkKVbtADozv0Pt+A4R0FCXVjjTukP73hiobYdtkC23R2CZE
 YJ503iP5GW+pHP8oj6o9E9wU0MLo3N9Niw==
X-Google-Smtp-Source: ABdhPJy1R9KkAFZUi/v2B7vMRGYHzuUfMGvtrFCiMzX+5kHk7Ok12zXdfsP0Y/4GEgzgS7WCLAeBkg==
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr7552241wmk.49.1617272745133; 
 Thu, 01 Apr 2021 03:25:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j9sm7430776wmi.24.2021.04.01.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F90D1FF9A;
 Thu,  1 Apr 2021 11:25:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] gitlab-ci.yml: Test the dtrace backend in one of the
 jobs
Date: Thu,  1 Apr 2021 11:25:30 +0100
Message-Id: <20210401102530.12030-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We are using the dtrace backend in downstream RHEL, so testing this
in the CentOS 8 task seems to be a good fit.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210331160351.3071279-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml                          | 2 +-
 tests/docker/dockerfiles/centos8.docker | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 85b8e10b84..52d65d6c04 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -223,7 +223,7 @@ build-system-centos:
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
-                    --enable-modules
+                    --enable-modules --enable-trace-backends=dtrace
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index a763d55730..a8c6c528b0 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -29,6 +29,7 @@ ENV PACKAGES \
     rdma-core-devel \
     spice-glib-devel \
     spice-server \
+    systemtap-sdt-devel \
     tar \
     zlib-devel
 
-- 
2.20.1


