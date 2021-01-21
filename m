Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8FF2FF1FB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:32:11 +0100 (CET)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2doY-0008LR-En
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2dlF-0006ng-TU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:45 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2dlE-0003YC-Ap
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:28:45 -0500
Received: by mail-ed1-x535.google.com with SMTP id f1so3395682edr.12
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 09:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ScyFhGNNjGd/PPYla9+0n1b/SKGv6qozUtR0tttriMU=;
 b=BNR93uGMa+NvH7Q2KjV2QRVUkjmiv+gPbB3ChoS61irGPPcMDiEqOSSTql869KxvVj
 szodnWexoJga9MJI83FZHl7KMGdoRU5vFULMoCjI7vg9b8t1Nf3qiXSuyd79r7lqEcuj
 c2XzoNEtmhbv4xyYQwBqy5QR5QklsklI0X45QtgFIrky6Kjg0aEc53D8VZA4gLD2w4CS
 +IBkHDuEx+GqmjgNFJIhucepvJHpNt7Uks5Ui1fKOfie+wgkmvIaHrbWCBAr0Azc/ey2
 /GIpMClTMT1b3VMDvlOWz9z/b5wjWyblbC456kr5Sa1wrACWa6VoPNnM6cFuFTj9Zuh6
 VdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ScyFhGNNjGd/PPYla9+0n1b/SKGv6qozUtR0tttriMU=;
 b=iNTLx1CLSC2qEyyDuGdnL41Gca3RvBrQ+FWekFLyWGzdmWv3JmieNb/0Si7RQ6PnUS
 z5eUC7nTkpUdlCJoJxIk3uWFvNneQ6L4WTNLEW087uIpfH3VNuvbt353fuBuijSQ/ojU
 ivqSkdTu74Ex4wZ+X2HM/2XozsErdwkm0a1f7rMFGGjhcRIFOLrNrJWcCixhDq0Ehhnc
 8ImsKPFz1ljVzuSArGxHRxgnHxar6spSvbZdw6WwGcCb9DV/VWQzMPQm2Y59MVPhxHAx
 4tHf8CnM2xis1/6vGwNR2PggO/LZ9mL5gWMq7J0n9p7ArM9A931qZEN5+HYLHNnCZsVr
 DZkA==
X-Gm-Message-State: AOAM531Dg1purKK1AskSt4FtokGX8iEK0+/EcRlEFkNYUf83hc1DRA4t
 BW0odkFPjSIg0uWXt/HA+OnkzmVTNsI=
X-Google-Smtp-Source: ABdhPJwY22EUH9Ai8icpHz0LEHi2GaIP+cPtIsxOoU6v7XoTGPODMgDJkqDDT8P0kUgSZiIQWho+/g==
X-Received: by 2002:a05:6402:3582:: with SMTP id
 y2mr138099edc.345.1611250122752; 
 Thu, 21 Jan 2021 09:28:42 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p16sm3052563edw.44.2021.01.21.09.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 09:28:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] gitlab-ci: Test building linux-user targets on CentOS 7
Date: Thu, 21 Jan 2021 18:28:29 +0100
Message-Id: <20210121172829.1643620-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121172829.1643620-1-f4bug@amsat.org>
References: <20210121172829.1643620-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a configuration tested by Peter Maydell (see [1] and [2])
but not covered in our CI [3]:

  [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
  FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
  ../linux-user/strace.c: In function 'do_print_sockopt':
  ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
           case IPV6_ADDR_PREFERENCES:
                ^

This job currently takes 31 minutes 32 seconds ([4]).

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
[3] https://gitlab.com/philmd/qemu/-/jobs/977408284
[4] https://gitlab.com/philmd/qemu/-/jobs/978223286

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b58..af4d74757d8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -411,6 +411,13 @@ build-user-plugins:
     MAKE_CHECK_ARGS: check-tcg
   timeout: 1h 30m
 
+build-user-centos7:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos7
+    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
+    MAKE_CHECK_ARGS: check-tcg
+
 build-some-softmmu-plugins:
   <<: *native_build_job_definition
   variables:
-- 
2.26.2


