Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB032E4F5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:35:37 +0100 (CET)
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6rw-0001nj-Ts
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gT-0001D0-P6
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:45 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gP-0004M8-Pi
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o2so800796wme.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjPLHR2X9UYJehWsCedSbfMVoyAVoUPt0kPUSCJRhEo=;
 b=CRm0VzPTUgwJS6tsEymVjX/1mxzo8IhFBFOg1IQ98wqb56NROR39IyRv68NqnHY/PL
 lObj/rC6IPodMk6tA6s/miFYqsRNUWlpdv9cxxZpB6GUn0WQdtCNaOib9vlcC6qE9X8n
 28DPkxkO43Kut6Kj1JmPAfC/vPnFSwPiypg0VWVJFyoOfGi3ue4voPH12KVIuAooKVzx
 JaBZsP99LZif/GtVjtZxGml8Um0AES4zyVIgQzhcSdhuRJYHBbWWYhFBpKanoY7SocLD
 adDdp2nNDaIovf6gLGXoV3TcnOAwlrxONi/Mf3sKhAZRconf7RD1VK0De73dfDbxwvC9
 hLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjPLHR2X9UYJehWsCedSbfMVoyAVoUPt0kPUSCJRhEo=;
 b=QS6S2NGu4EPXo5IPKMcEwv3oOCtRSQv0ewetkT3v/9unp4nQzjD6GJlIbB45TTmX6d
 Em69vgJUZIwpMarijivuWfBfUeQhG9BZrCMTuNl0IRaMxKf89lyXdGnQuxKUSduLykbS
 pKnfJPKnE/G6N7u9yiJdzgDDVkkcs2hAz/ArJ0X6KfM8gaAPCaCFX9j8S2r+524/YA0Q
 AWznZ6luEAOl2J0vnGa5LyjNExCaKHl+AZbPt+ecFKeVl3o6BlST4oO2DspoQ89bsD47
 Ug0ZWTZ915xngesHSqXF9fsZLnkWInGHtDLwO8Ds8fpZdXeXxqgYI6zwMlPabVQIWiP3
 NYng==
X-Gm-Message-State: AOAM532hjbtFKr7y2mqW6oYcmchm6sU7bXZU+L/5wc2ERnEeOkwmj1OU
 ANOZ84NLVpT+EuvdQXWgWLsGEA==
X-Google-Smtp-Source: ABdhPJw6KPZDmHa2v/d6UZFQU18ZNcS4oICVZs6ohKDFLKCcHUvowcTUEfu6h1ygV4kF7qm/4SqeCQ==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr7858812wma.157.1614936220576; 
 Fri, 05 Mar 2021 01:23:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i11sm3740735wro.53.2021.03.05.01.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80C0C1FF92;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/9] gitlab: add build-user-hexagon test
Date: Fri,  5 Mar 2021 09:23:25 +0000
Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We special case this as the container with the cross compiler for the
tests takes so long to build it is manually uploaded into the
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8b6d495288..c2c5196b8b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -417,6 +417,17 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
+# Because the hexagon cross-compiler takes so long to build we don't rely
+# on the CI system to build it and hence this job has no dependency
+# declared. The image is manually uploaded.
+build-user-hexagon:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-hexagon-cross
+    TARGETS: hexagon-linux-user
+    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
+    MAKE_CHECK_ARGS: check-tcg
+
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
   <<: *native_build_job_definition
-- 
2.20.1


