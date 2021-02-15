Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3CE31B6B4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:51:06 +0100 (CET)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaX2-0008Fg-U6
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP9-0008Q6-Ef
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:55 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP7-0004NA-Rt
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id z63so3392242wmg.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsgmgeisR3V8KOdFSJI7b3VF9nzKkel07mYy63N1vcE=;
 b=wHQw74GOzrEXsxVafk4I+mGjR0Wv2CbNsVwsaM4R74x55kCVDi1IaQBcsGxUZJY5eE
 5eZi37hrnLbphRuWIgFTWUykZureNZajjD54d7r2QyLkd46beALGbRTPpbQpNWtFkj9+
 YWpKRWFRWmIHTkiBU2gvCGhufnqTq0IVi8KvpXWvzTjR0ZqcoLzBdglbiqeSzXZKHgld
 tc2MIs9LnhGSfUsn+++Rd5+8VDdoIWLfAdo7b1F3oexbG4J7TL/BZLJ5lPIl42rIuJjc
 SzVshQxzpPExenX3lx0b2yqbKSZUSSB9Fi92XDjFofn6gbPmRignq3O3295pKG2YYrPd
 JHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsgmgeisR3V8KOdFSJI7b3VF9nzKkel07mYy63N1vcE=;
 b=sHko87u8oZYIX+Hhx10PyR6Wlf5NcFZQ3RNfQL5kS2Bcg/GIa4NZVc2HMOClu4pqh5
 Mx6FbYnrR7K2ZD/D6XqhA+12eJ+zyCZMFPHW14vogCZ0Dy0TvtudzOU0U46an/tXhrqw
 13Aup4IDxiVeAA7RflDlzbcz2uQNtTA9kt01O8HaQCaM3laQSMp5ZOWX5UBFawIbQGRB
 G++iWlz05XkmJcAEcsg3pH1Kt+C+ZDMMLn+dfHNMu5haZ1eTrQEzhkguT0jOxA2ZzdmE
 8EAuH9Pda/CkdnPxef+PxTa5B/OrHZRb8ul9owURNv6q2GmF/eDDzkXpJMlYb+LodCys
 ll1Q==
X-Gm-Message-State: AOAM530oWEFtR+ZHMFkI3/uxIA2othdURn7jiQgid9IH3ZeKCgf6AqKT
 vGVXc/2B1BiNKxW0cZZ2erniqA==
X-Google-Smtp-Source: ABdhPJydJTnovGWZbcqGm/K3E/W7Y63lKomAIql630LbArnpFlSxKJhc+6y0FCv2Y1JTX1plE6Zynw==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr13807863wmc.68.1613382172470; 
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e12sm14449633wrv.59.2021.02.15.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 565C21FF90;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/15] travis.yml: (Re-)move the --enable-debug jobs
Date: Mon, 15 Feb 2021 09:42:33 +0000
Message-Id: <20210215094244.12716-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We already have similar jobs in the gitlab-CI ("build-some-softmmu" and
"build-user-plugins"), so let's switch one of them to use --enable-debug
instead of --enable-debug-tcg, then we can simply drop these jobs from
the Travis-CI.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210211045455.456371-5-thuth@redhat.com>
Message-Id: <20210211122750.22645-5-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index da2fad1249..e878cc0847 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -403,7 +403,7 @@ build-some-softmmu:
   <<: *native_build_job_definition
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --enable-debug-tcg
+    CONFIGURE_ARGS: --disable-tools --enable-debug
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
diff --git a/.travis.yml b/.travis.yml
index 7744ec3a2f..f0e2b1059c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -118,18 +118,6 @@ after_script:
 
 jobs:
   include:
-    # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
-    - name: "GCC debug (main-softmmu)"
-      env:
-        - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
-
-
-    # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
-    - name: "GCC debug (user)"
-      env:
-        - CONFIG="--enable-debug-tcg --disable-system"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
     # Using newer GCC with sanitizers
-- 
2.20.1


