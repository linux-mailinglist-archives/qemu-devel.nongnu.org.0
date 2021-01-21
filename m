Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C42FE9C2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:17:56 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2YuR-0008IA-42
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Yro-0007NC-91
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:15:12 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Yrl-0004go-LV
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:15:11 -0500
Received: by mail-ej1-x632.google.com with SMTP id hs11so2308377ejc.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeptPGkig4ZfJi5qcPRSSeG3bfmczJuwdpPpMWxHH4k=;
 b=miAfYE1i0yZqBbZI8iABd+c33sAQp26tsMRTrVTgVYq40f0/Y3hY0bmLBB3XISXCIY
 QdQaMp2HNhyp8WJSkJn4N3DFYbdQK88XEGYo7r8YBDVrsCSQvc2FyrWlPj/lh8Wgi4K2
 OHvkWSUYAmvZk9zTra/9/lT/M4u6w96lotzbIihPuCtdDyYb+bnPYjyYakV0FIHcgezU
 BHnY1viSl6T45TXI2u3QYG19jbJ/BDWYVucUmV+JHvNQg4kbVdfWf8QrcKjb132KDbAj
 TD3auQZp4mG1pvlcka35x9Kk1R0fS+qhiWYCfVCX2ttf+V9aIMPB8J/sTvaN52L7MyUH
 o1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jeptPGkig4ZfJi5qcPRSSeG3bfmczJuwdpPpMWxHH4k=;
 b=oGpsbWhgXnGcPpv4o7MIqGM+kHLTwoolCYRtPa85Z0g5Qcw5f+tZ1r2ONZFjQIZgsA
 fhXC/83Y4NSj8rffg9a+G9HtE6hNaT8GFEkI2cvCC5/ITtoWQOZ4PVOsq9Ha6gGzT97N
 63SHLrrYNMA6zA0u6JPOXUlZDO0RphyEdmC6jZ2N0QoC0Qm8YoEEefHKQkhcA+43AuoY
 z4IshS+VCIbEWjogajLUurvkO0JdASD9XNrDViSMAG1vHM85LBBbsq/ea5w3KIScjmw4
 rS92TRNidAwNcgHJOoTE04MYg848M1nfyMstsJK6fmrxCsXU0nIyEDED4Kt87WzcCcLb
 UMgA==
X-Gm-Message-State: AOAM530DfLQpfgDD6T2fBFujgu/QA5Xy8MLznOm+IaB/uIshPRPcRbz2
 y7q1j7FYd9AWzt1MdQzAunbua3YG7Ws=
X-Google-Smtp-Source: ABdhPJzBt//gjfYK3//N4AK2/L/2gDWryTrCwtcil/TsMn4xJhcAD4bIz5XApHhEQprpYDm/7o2O2A==
X-Received: by 2002:a17:906:ca08:: with SMTP id
 jt8mr8595305ejb.368.1611231307592; 
 Thu, 21 Jan 2021 04:15:07 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id ke7sm2180937ejc.7.2021.01.21.04.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 04:15:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Test building linux-user targets on CentOS 7
Date: Thu, 21 Jan 2021 13:15:05 +0100
Message-Id: <20210121121505.1523156-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
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

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
[3] https://gitlab.com/philmd/qemu/-/jobs/977408284:

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 203b1671c43..ce52d6cb2cb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -378,6 +378,13 @@ build-user-plugins:
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


