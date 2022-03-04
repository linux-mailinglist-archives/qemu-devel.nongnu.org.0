Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC274CD35D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:24:52 +0100 (CET)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ63H-0006Lq-Rn
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ606-0002VQ-Fk
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:34 -0500
Received: from [2a00:1450:4864:20::331] (port=42562
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ604-0004e6-EG
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso4920332wmr.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=khb2dSFPApkPaahIP5O1Jg4lPgEuKg6KdJgWB44Ysm4=;
 b=D9lD8OG5HGPwrcRa9aTTnCMhLk2rm3gvXNJZ+0kbAdsx8PElSbOjcCZmTJfxMBwvKL
 WwvA/GSOs7maPZxp+kNaW2bAde9wUUTXo622qu4RfvrAMI3w0FvMBnQhk0Lp7eCh3Rpr
 xbTuS0BaT5b/OS1NyxtlnwA2hJg+e913ZteY6s1xXiiZ+JsXvOKLj/xbbCeIId57zHqb
 eRqkaXWQlNY0Qjujs1wpCQW8gAk7r333MzRYj1dNJkXiKMAMPc96on219pF2i0npphYD
 RZ58CSoMiV6khScQpJzDbzJSQx0ENV7dPE+QyeKPKRM3YyUGQnXDN+dLF46i/JbEeyQ2
 Jebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=khb2dSFPApkPaahIP5O1Jg4lPgEuKg6KdJgWB44Ysm4=;
 b=fKs84N/5md15VNPHEMzh+bR0PozsmkOjC+TlCwu512PkFlznjDbOWLlZ5bzIStmKCy
 Ibct7j8pnLqD9PpKr7HautVWNAO21QQfJGLOOWwxacvFnpH0KpUdA4bBlOR3XDUsxGIW
 kHyaPEFBOGRegiL4x/6Bro9EvxUpBZWkq+V/2X0p6LLc8MuAqQ/Xv4E5lZSHFbyDOyp8
 JfnHxaCQJmTNayIKk6vaCI5tSkBTgytlhS8D6Izpo1V7W9m2v020linEDJq+taqcvVu9
 xpRFD65BZ1aL5A4rOdaq6tSTHZqwcecUkVHLqOtJ2qhpiPQwn5Vb7dHuBLh9ONB4d6FL
 lELQ==
X-Gm-Message-State: AOAM530P2BiDP3L/PVZBwyEU8ahAkU+ZqAYB/eG0sg7ikFG16h9CnvRo
 udL4/Fjc33zS6EOPUb6qo6EWNx1gFEwRTQ==
X-Google-Smtp-Source: ABdhPJzoyfXKzK6aHXWkeofkojVRCe6VU7KSrrPh8EVDsCDq+t9W/+/VQc5qpDH2YK5GcGYfVjx5dA==
X-Received: by 2002:a05:600c:4e93:b0:382:b7fb:80b3 with SMTP id
 f19-20020a05600c4e9300b00382b7fb80b3mr7320293wmq.0.1646392891163; 
 Fri, 04 Mar 2022 03:21:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] util: Make qemu_oom_check() a static function
Date: Fri,  4 Mar 2022 11:21:19 +0000
Message-Id: <20220304112126.2261039-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304112126.2261039-1-peter.maydell@linaro.org>
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_oom_check() function, which we define in both oslib-posix.c
and oslib-win32.c, is now used only locally in that file; make it
static.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220226180723.1706285-3-peter.maydell@linaro.org
---
 include/qemu-common.h | 2 --
 util/oslib-posix.c    | 2 +-
 util/oslib-win32.c    | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 68b2e3bc109..8c0d9ab0f77 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -26,8 +26,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void *qemu_oom_check(void *ptr);
-
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     QEMU_WARN_UNUSED_RESULT;
 
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f2be7321c59..ed5974d3845 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -199,7 +199,7 @@ fail_close:
     return false;
 }
 
-void *qemu_oom_check(void *ptr)
+static void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
         fprintf(stderr, "Failed to allocate memory: %s\n", strerror(errno));
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef3398..c87e6977246 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -44,7 +44,7 @@
 /* this must come after including "trace.h" */
 #include <shlobj.h>
 
-void *qemu_oom_check(void *ptr)
+static void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
         fprintf(stderr, "Failed to allocate memory: %lu\n", GetLastError());
-- 
2.25.1


