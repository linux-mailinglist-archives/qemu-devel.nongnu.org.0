Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01031B217
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:48:34 +0100 (CET)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMRd-0006DN-Ot
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiy-0001E6-AJ
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:24 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiv-0004h3-MM
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so6110265wrx.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+j+BVGySGAa3lvQGoFM7jpkYTYESTvRi/KTVNqdSs8=;
 b=J5fOJ2isLg+gvT457xhylzISXF49EV+l532C7OC3MjEDrvQOedksYuNF5WWi7ITzxI
 MgIpkU+7dOdH7tpbtkmqZgydvvfYcgVIJVFfgI4gXG4qCkMBEpJTakGW4eMB0iAHXb/V
 WgMK5ZL5OUs83z6HIyQN5Tb0UHr9qdJNK9QQUNeLtFkU/ZaXaBCxshFJExsjDCC0lR7H
 4LXiz3zCev/GKUNuAp0H56Wasg7+GLSOsTw/60zMdWa0AIVxQ65NrVFpy34MC6VY7Hvq
 up/5IJtW/lmvdQlhIk/i4uKMoRwi2MWe4SGgk0VBxoZ32NTdl5WSNbmCJrNtKiJSFSad
 2SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M+j+BVGySGAa3lvQGoFM7jpkYTYESTvRi/KTVNqdSs8=;
 b=V4elQAUkeHZI1xjPfRaGdwPPUx9XgYq7VVmnqeQdHIe673bIv0AQKBYUVRp8y45MNs
 /JfD3VNQTu5wM5I1EH/LgWy9tfDkmpkplA12bToefKOyYtyCnAUmAW9rfL0a3GOf6dvG
 bDZSMre2d0LLevAjU+Yce+q93/2dpdI5acPXsygnLLbW+y3N6bCeKD9sWzht6DCdoorC
 zoI6phFED7+HiIAguf9oftlHlsgLRm8TP1y+X+oONM6xyNVaYv+nbkaQpDvCm6d91bnu
 IXuOavB6yjIEQJQXRge5N97YjvFFlW2ZtFgw/FtGjE6oCFri8W0HwxiLJGwj5rvJLZw8
 QAhw==
X-Gm-Message-State: AOAM532B7qob11sqaZg//GpvXnomutVSyJ/a1MIqohFkDbKbiLap39ig
 iqPKPpUuBJ3odPX9nKHRrvcqdoW9V24=
X-Google-Smtp-Source: ABdhPJzlVdQvKjhbrTIbHneJg48k1+M5mOvoZ3sm+zztUPtamwlKZLNT2I9iQAb4/kkdHXatN2I/wg==
X-Received: by 2002:adf:e988:: with SMTP id h8mr13786390wrm.2.1613325740213;
 Sun, 14 Feb 2021 10:02:20 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q2sm14134539wrx.79.2021.02.14.10.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 37/42] gitlab-ci: Add job to test the MIPS r5900o32el
 target
Date: Sun, 14 Feb 2021 18:59:07 +0100
Message-Id: <20210214175912.732946-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job to build the MIPS r5900o32el (linux-user) target
and run the TCG tests.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 28a83afb914..7d7559416e3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -622,6 +622,18 @@ build-without-default-features:
         --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
     MAKE_CHECK_ARGS: check-unit
 
+build-r5900-user:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS: --disable-tools --disable-docs --disable-blobs --enable-debug-tcg
+    TARGETS: r5900o32el-linux-user
+    MAKE_CHECK_ARGS: run-tcg-tests-r5900o32el-linux-user
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-- 
2.26.2


