Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A139221B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:33:14 +0200 (CEST)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm19N-0006LZ-Ox
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0w8-0003HY-Lb
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0w6-0000AL-OE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:31 -0400
Received: by mail-wr1-x433.google.com with SMTP id x8so2535480wrq.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UywJEjii0MbrynfKRWwBYy206Jhb7s4MybZ2FyOynsk=;
 b=G7krePIkBAG7tpaPkqNsY7UIj9cXUjtiS40s3Lf9EiAj4p0DhZRt+wHKkaUpi8BLQQ
 9vtYcLuAe/qpvoe1SaD29trfamEW5UgaRCT1uVCT4JlT+nH1Wb5c1xprQ1B9/oR3UlvU
 UUQqnlgr4jFs9tuokwabqKLr+NRS3WqPh6Ze0o7y/FoJbMIApWRzxrQW4IyPJmlyRknp
 /XD9Qf1x+DzzTUCx9P5s4z4bw4skxm+9eWF6qNL40BlfVrjU21kukNK9qO6qlfCqIIQF
 g5lPeWHnc+mKX1FNL1WnUASdDg61gd8okfGcjGM2RoOlMH5GxCB9UlovvwMlnR8EYC0S
 yCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UywJEjii0MbrynfKRWwBYy206Jhb7s4MybZ2FyOynsk=;
 b=AmPpEmVAj3dJsYi7paDM235RcwtWorLOuWiH496nOsFy1Wv8d+C5soHQlQJk6BjaTy
 NcAd9TejtT4hvhYs2jR1i2zmvJOC2AxyrObnDG7p/0VQoEGd7W8DXc0hdGeTcONRdcUP
 vOd7scTde9LKT6xBv6LzMZ4RKYkQcUpR6Rd/qbwCeg6niT1+KYcJ/s9hiUE9cXh/axlK
 LR7C4KQ8eh3urwrAffm13UbbRJdWpbNAUlhMO1YzO5doMMYU3eV0V8S6k1Te8R4aaWiR
 jSwNK2+o8XMzPUzALDccNd27J9ak4bHTJTh7wmX1uzuRPp5kBu8gz72C2JYXN7izIj4J
 cyQg==
X-Gm-Message-State: AOAM532OWT8OcdcUWkg3V1d5tbHQjIKkDyAhtlswAG+/RsVnSQ3NVD5T
 7yaBU2BAdwXxrfjcdSUlPB2OppS8AHn11g==
X-Google-Smtp-Source: ABdhPJzh9MV0Lq9l221f6aRGptfd+2gnRUN3ioV4k6T20r2Nd+cG7Ip8CQ/f0GRwmFNC0/Wk6atnkg==
X-Received: by 2002:a05:6000:1001:: with SMTP id a1mr2765wrx.59.1622063969336; 
 Wed, 26 May 2021 14:19:29 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s5sm155266wrw.95.2021.05.26.14.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/19] gitlab: Drop linux user build job for CentOS 7
Date: Wed, 26 May 2021 23:18:29 +0200
Message-Id: <20210526211838.421716-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

It has been over two years since RHEL-8 was released, and thus per the
platform build policy, we no longer need to support RHEL-7 as a build
target.

The build-user-centos7 job was to detect a failure specific to CentOS
7 and there are already other linux user jobs for other platforms.
Thus we can drop this job rather than move it to CentOS 8.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210514120415.1368922-2-berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ccd11e1625a..09ac74fc509 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -373,15 +373,6 @@ build-user-plugins:
     MAKE_CHECK_ARGS: check-tcg
   timeout: 1h 30m
 
-build-user-centos7:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
-    MAKE_CHECK_ARGS: check-tcg
-
 build-some-softmmu-plugins:
   extends: .native_build_job_template
   needs:
-- 
2.26.3


