Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3331B213
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:45:33 +0100 (CET)
Received: from localhost ([::1]:54364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMOh-0002ay-NO
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLih-0000rs-QY
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:12 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLig-0004ff-FS
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so6167303wrz.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Twme+gWXDR778jC4YebnrwyqPShuK2VSIsTo2Civx54=;
 b=VwmE/3r1M2iBkyrkmvuLhDibJN6OXHSVINP8i7r9044dgZHmXhQNj3f9wfPe+AWs7d
 RXoD2pRw5RTUn+INffLlrk42WGf3wcd/A+knkNVHsP4Kj6pLojzJ6o5ZLl6NRqoDMqHD
 rU74d/aUemUOUhXzQwtVf3xvD9SENZcOO/2h12CRYPdHq+rOc2aqkoRP+N1fh2aqEBd4
 ECmeT4aKXXGZlFVwwb79pncqrDgdNEIE3whWyRT2XMV2IfYSRdXjXegQLdhiFqNEOfBD
 z+yk4a1qkIfJn/9DOIPEagXqc7/0J5Lr8t7/4AAijcW4h1atsb7Bdiu6MyUZk8Ldd2fH
 7zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Twme+gWXDR778jC4YebnrwyqPShuK2VSIsTo2Civx54=;
 b=Di21yqM9UiXZknLIbUdHVWhW3/QEqKS2hd+u4q1vzIb8au7FJ4yGuBJr2Ckm/x3Pmf
 i4pnyAeWTeuWjnmbT4jah9nAtUQGWvsBy6weCa7Z7quSLxDJZRWXdNhzFFAPaLB7sADp
 DVWZZpyrNUhRT/1lKi1ZNzEZkAYstFE8ynSJ1XB21kLZcx5rtTsDva98IfkpIWIPNrIv
 YX1Xwlbrr6U0uuPvIU82IDKmBAwGMxf+ZGCgwgxNPuyH915J53TYCMNgembI57QYsOt7
 ObsrL+qirUePd3Y8eXblBQJmScePYm4HCgYcdcACA+ztxVkF0tDNI643EU322Iac4Ue2
 TuIA==
X-Gm-Message-State: AOAM532EQFQRpmrAVJne7+u8LQnNURw6UlNWIvFOFndkGzYzvwwNGPEt
 xWW8MJJ19cpQHuBG8rvwoy1/knFzQ/E=
X-Google-Smtp-Source: ABdhPJwrap/KMyoG7tgmtAtQVe2cC4NvXaIEDYyGbRp7pLiEY7sC5J9RuoVnCD3Tvstr9jpudWx9Gg==
X-Received: by 2002:adf:e98d:: with SMTP id h13mr15198324wrm.246.1613325725056; 
 Sun, 14 Feb 2021 10:02:05 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r124sm22218427wmr.16.2021.02.14.10.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 34/42] gitlab-ci: Build MIPS R5900 cross-toolchain (Gentoo
 based)
Date: Sun, 14 Feb 2021 18:59:04 +0100
Message-Id: <20210214175912.732946-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job to build the Gentoo based MIPS R5900 cross-toolchain image.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/containers.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 587bd4ba2e3..f441e608446 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -152,6 +152,13 @@ mipsel-debian-cross-container:
   variables:
     NAME: debian-mipsel-cross
 
+mipsr5900el-gentoo-cross-container:
+  <<: *container_job_definition
+  variables:
+    NAME: gentoo-mipsr5900el-cross
+    EXTRA_FILES: tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
+  timeout: 1h 30m
+
 powerpc-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
-- 
2.26.2


