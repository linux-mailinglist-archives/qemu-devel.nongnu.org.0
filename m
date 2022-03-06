Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B664CEE7F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:29:52 +0100 (CET)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Jz-0008JV-9p
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09b-0000NW-K8; Sun, 06 Mar 2022 18:19:07 -0500
Received: from [2a00:1450:4864:20::336] (port=40575
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09a-0007SY-6i; Sun, 06 Mar 2022 18:19:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so4581455wmb.5; 
 Sun, 06 Mar 2022 15:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4dYzTMB+Jz3sFZLoUhLXf7pjh7WrTTvJu05cnU9v1M=;
 b=HTjfaERoODP3fX64s/67Rj6axuCUoOWQ2hG9VkggexW/zR8TYJB7l5EnTID1mdFvR/
 1NfdDAS9t+y3OseNnVHw/Ut3fQwRE1cBZhILbJO2ECVm8W5hGBGHWhaB0UM7PldFAHLi
 xSh6KcGgNZWPeFqjjyWvxM+sxxhCh/ilJxnDTqn17StnjaZGohzovJ1bvOprdDRYyVET
 /Rhg5QIqukkYVlXgbKNxN7xFdehHpTYZ4gSPM9Xi/Im5vghPV++5AmheKNHCCrq7aON0
 4jsgAZGgBRcL3EIC4k4OJg9JRqKF1u8E9oCuJMAW7h2f26jTI8g1P27mWxXUyEN7/1xL
 7oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4dYzTMB+Jz3sFZLoUhLXf7pjh7WrTTvJu05cnU9v1M=;
 b=mUDTH5jLfweQlrkNHz5sd/pEJEJSt5BJsyZ2nG8pkwYQF3OffmPtuiqjJghKlyMSyp
 eo5p/ooHCGrRy9zTeiwgbdoTeudVPHHQHB+EWNB1as03yk2RP6AEWrwmLhpVEneMcOn/
 CpK9Sq1Xax9MJhLkI37rcplFeuyV6EXdZ1h+rPZF/l4Py5D8PJE/tm1xHtDqAlBjOUrU
 lcpCqI99Xw9Bcs4ob+sYFQ4LcGEJF/B2zOECVlt8+mvgLJDEWXEQaLyZE1r5F2XYLtCc
 H9Vu2YOT2Z3OeaEgheF+rc+XMUHdmUy8bNwRi/xC37BO/9O3xWHrX/XuzP+EABqsXyYE
 I5rw==
X-Gm-Message-State: AOAM530aiVYqHQLKeZrY0PiaLrd05cs/2nncmwUf44nA12wj6l+NnlgK
 VuZMHuqg51PZA3uqKgd+jk2lLx0uFzo=
X-Google-Smtp-Source: ABdhPJzYO1d1r6tQBXQ8q3BqS1+M3olYNHhRnCnillI232nIT07DDOm4ByaCk6Axy8EBgkgfEtwIXg==
X-Received: by 2002:a7b:c2aa:0:b0:389:891f:1fd1 with SMTP id
 c10-20020a7bc2aa000000b00389891f1fd1mr9252655wmk.138.1646608744333; 
 Sun, 06 Mar 2022 15:19:04 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d4dc7000000b001f1d99e9441sm5196902wru.106.2022.03.06.15.19.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/22] osdep: Avoid using Clang-specific
 __builtin_available()
Date: Mon,  7 Mar 2022 00:17:44 +0100
Message-Id: <20220306231753.50277-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Remove the Clang specific __builtin_available() to allow building
with GCC, otherwise we get:

  include/qemu/osdep.h: In function 'qemu_thread_jit_write':
  include/qemu/osdep.h:787:9: warning: implicit declaration of function '__builtin_available'; did you mean '__builtin_scalbl'? [-Wimplicit-function-declaration]
    787 |     if (__builtin_available(macOS 11.0, *)) {
        |         ^~~~~~~~~~~~~~~~~~~
        |         __builtin_scalbl
  include/qemu/osdep.h:787:9: warning: nested extern declaration of '__builtin_available' [-Wnested-externs]
  include/qemu/osdep.h:787:29: error: 'macOS' undeclared (first use in this function)
    787 |     if (__builtin_available(macOS 11.0, *)) {
        |                             ^~~~~
  include/qemu/osdep.h:787:29: note: each undeclared identifier is reported only once for each function it appears in
  include/qemu/osdep.h:787:34: error: expected ')' before numeric constant
    787 |     if (__builtin_available(macOS 11.0, *)) {
        |                            ~     ^~~~~
        |                                  )

Beside, on macOS Catalina we get 2254 times:

  include/qemu/osdep.h:780:5: warning: 'pthread_jit_write_protect_np' is only available on macOS 11.0 or newer [-Wunguarded-availability-new]
      pthread_jit_write_protect_np(true);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix by using a stricker toolchain version low range, replacing
MAC_OS_X_VERSION_MAX_ALLOWED by MAC_OS_X_VERSION_MIN_REQUIRED.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/osdep.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7bcce3bceb..488a286300 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -642,19 +642,15 @@ size_t qemu_get_host_physmem(void);
  * for the current thread.
  */
 #if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
 static inline void qemu_thread_jit_execute(void)
 {
-    if (__builtin_available(macOS 11.0, *)) {
-        pthread_jit_write_protect_np(true);
-    }
+    pthread_jit_write_protect_np(true);
 }
 
 static inline void qemu_thread_jit_write(void)
 {
-    if (__builtin_available(macOS 11.0, *)) {
-        pthread_jit_write_protect_np(false);
-    }
+    pthread_jit_write_protect_np(false);
 }
 #else
 static inline void qemu_thread_jit_write(void) {}
-- 
2.34.1


