Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B642931D951
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:24:01 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLs8-0007Wh-LA
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLoC-0002ZB-A8
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLo3-0000K9-8D
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id n6so17150585wrv.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGOq+H9AOLX0RoZqFCkiJAoX0PwPDAbgocinnAmhldc=;
 b=njz5qyRX7LkDEW0M+nxbH8al3WSH+yC8vtt9bLhxD7QaJ8a8vdm6qwigAIZCDZLLfG
 qrPqkiKbjn+1uU3Jv376I0imSu6VUsjiXe4JXKJC4Mtq5VDpKToGskH+6SQXMVSaj+cP
 naErzwZASJwisZcG8bVNw8ou91t+wX5jPwgcXnHm+B/bMfnvOUsAWWCEQ2bHquXVERox
 KLKyvCRxHPhuckhJsL0mNUt8n3U8OvMtuGcTQ4hFOI95KYIjZ5YTmbSoo5Noyfc0Ol9w
 wRQjvz7UB9jnt8hytySoIMVB1Fe+JRnIoCCCPt6dTIINTQDPNoE3RjIs1Cj8gxOXuyCD
 +OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGOq+H9AOLX0RoZqFCkiJAoX0PwPDAbgocinnAmhldc=;
 b=eWnLkEPm7vCJ71XxI+d/I76kyrcWDoqqSU1YaZ27RmgyLSCcy3RpdSF4srTFT1A4AA
 iBj6SDEUwLwUlHDM06kO1MUgoNzc09goLU3vX79SQxFX7qaydNqI26/0phuNgk5Tz5s3
 bnBM5fT4e/0N9i2xfzJZhOi7it4t4pgJOpZVXy/nkDxXpe7o4eLUEUBBSJ3Yr56HBjo+
 Kwn9JFKGySNrML60c02RtN5XtFQ2SpSrwVw6Hbpgt9Zt0j1vunfSCxbkdGqizp7yvJqt
 /E6vlrm23P2+cfVo8qlQoWTLiv8MLoyUmpZy9nPrwJtIaga9UFbTdXjPS2hQX/Xi5eGV
 Ywsg==
X-Gm-Message-State: AOAM5335cCE6Zib10M4mrk8BNn8L8nDWVHJ2Yxbrakezi5ujeynfGy0G
 fvxpT+8sE9yTSYFbvsWj9iBBEw==
X-Google-Smtp-Source: ABdhPJxSgPeug6UolZqj4dOoeJW+1cNeZuOiigQrqrNQpldWFiYVDeWo6qSp4U3+lUfnJnLlL0sPLQ==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr28912206wrn.197.1613564379632; 
 Wed, 17 Feb 2021 04:19:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm2682216wmc.32.2021.02.17.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:19:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC8511FF91;
 Wed, 17 Feb 2021 12:19:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/6] travis.yml: Limit simultaneous jobs to 3
Date: Wed, 17 Feb 2021 12:19:31 +0000
Message-Id: <20210217121932.19986-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217121932.19986-1-alex.bennee@linaro.org>
References: <20210217121932.19986-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 stefanha@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Even though the host machines that run the Travis CI jobs have
quite a lot of CPUs (e.g. nproc in an aarch64 job reports 32), the
containers on Travis are still limited to 2 vCPUs according to:

 https://docs.travis-ci.com/user/reference/overview/#approx-boot-time

So we do not gain much when compiling with a job number based on
the output of "getconf _NPROCESSORS_ONLN" - quite the contrary, the
aarch64 containers are currently aborting quite often since they
are running out of memory. Thus let's rather use a fixed number
like 3 in the jobs here, so that e.g. two threads can actively run
while a third one might be waiting for I/O operations to complete.
This should hopefully fix the out-of-memory failures in the aarch64
CI jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210217102531.1441557-1-thuth@redhat.com>
[AJB: add comment]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index fc27fd6330..4609240b5a 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -86,9 +86,11 @@ git:
   submodules: false
 
 # Common first phase for all steps
+# We no longer use nproc to calculate jobs:
+# https://travis-ci.community/t/nproc-reports-32-cores-on-arm64/5851
 before_install:
   - if command -v ccache ; then ccache --zero-stats ; fi
-  - export JOBS=$(($(getconf _NPROCESSORS_ONLN) + 1))
+  - export JOBS=3
   - echo "=== Using ${JOBS} simultaneous jobs ==="
 
 # Configure step - may be overridden
-- 
2.20.1


