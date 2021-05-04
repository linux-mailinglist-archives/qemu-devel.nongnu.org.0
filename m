Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51787372884
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:11:30 +0200 (CEST)
Received: from localhost ([::1]:58144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds1Z-00044G-CB
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrt0-0002Wc-KZ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:38 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsy-000395-UE
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l2so8703562wrm.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwczTv5129u5O7lJOfx5qiNR/mY52Y2070Oy1pXCw8c=;
 b=IYIBqAgDL07hOg5ABqIvhtNUaUVpxnQo9C+viwLVGCHRYFNusaK4W9bVRx97YnGglg
 uGIepz0dRmJaGgS9Iq2j329Q2TkSBOFy5vm3IAq5jRkit8kqjIAz22AITjLowYkEoe7c
 j77ofzLqByPjVX2LET4mSXdkav8uJ989qjE0EvZf3ZFGDVaj81i36EZdXiJTDBs9UL6P
 lY7YoedCrIqPyP/Dya6YpC4XnVYeneDMuK6jt9kxnp2qTUyPKkRqRgBuoR0CSwoMf2nS
 wMsft80AQnDAWK8Tg3WWVZnbgJbNe/BJjEsR1rIKbdhvRF2VNOh5SdAelANm61atBxXh
 Iw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwczTv5129u5O7lJOfx5qiNR/mY52Y2070Oy1pXCw8c=;
 b=QaVuiXfZ65Ld05KBqjoVewP6QpJRxLPio/SnVqQAFOJCcn0upBOzC9T1wZrtA0mMWG
 CoMXbvfFqYjfxiUK5XeEK4lwZq476ihU3zl4fSBsyWM2440J/vndzeK65syzo7J3SqH/
 N4cRi1WBK9FPSSiglQ21xAWKXmcFO2oP2gVEyZqMOw94cBppF8HyEncUZeHtSZmjMelC
 qfEtX2lGn+MY9qqQqMunWVb8zx+rm5fqWtg0LZRLyLnXVOkn7MGL/DjhGGJtnWwTNmiI
 omHxgVKx4bLQc/4uu7RDSu8d8GIcWJa4hSPFdwSwZZAVLw5Xxtqx8dEfDmHF1kyyfG++
 WGKA==
X-Gm-Message-State: AOAM533xnYgk5FxEZLiAy37CMcNZpE5yvuP0yLOHx9FSN3Li/aMq31ud
 lDVCBXj064s51qFqNC3pqdScQQ==
X-Google-Smtp-Source: ABdhPJxoAaqzs6jLSVBMA5jIEgt98/gwPw1HhRgY6I+RvDXpKjtLK2w14orLq+qLIZcImWQ9ztj+1g==
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr30016366wrs.415.1620122555642; 
 Tue, 04 May 2021 03:02:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t2sm1981672wmg.38.2021.05.04.03.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F7951FF96;
 Tue,  4 May 2021 11:02:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/30] gitlab: add build-user-hexagon test
Date: Tue,  4 May 2021 11:02:01 +0100
Message-Id: <20210504100223.25427-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

We special case this as the container with the cross compiler for the
tests takes so long to build it is manually uploaded into the
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52d65d6c04..87d1172b03 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -413,6 +413,17 @@ build-user-static:
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


