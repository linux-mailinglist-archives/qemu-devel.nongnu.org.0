Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C454D9BD5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:09:27 +0100 (CET)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6vW-0005bj-7P
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:09:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6iF-0005ZR-VG
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:45 -0400
Received: from [2607:f8b0:4864:20::429] (port=36850
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6iE-0008Bm-Gk
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id z16so19539966pfh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T/cRYsvljJjM7J77pLO7Mi0qGdNpxLyCaN5IKbfOo00=;
 b=dAbqaDhhfcsAkPwfe/G5FX4sIbY3PkzZmZjGi5k/QILSZNxnmnNcgreRypR8x09vKF
 QJXXy0wNjLMRPUKFEcH76Isy0oQYJDKv3tvqXDt+IMahyTfv81AtMi3UgVAEn2JRsXn+
 hpKzjBRUPIVv6Mk9EcBT5VpAHrWzVUmqJKe9gFwKDo1e62c0ImArzXsnIs2L2LY19V1t
 4nbQfzW+ArwobFDY/9Q8CsWupZghdT3Co+7T6D0KV5N3/wJdmfL1vv8HKB6EhUAQ3e61
 AkTo0gNliQ/+M339Ox4X6Hh+zztWz9j/jMU+9J1P1++9oCt8m2CDiglQL/F+aOI+5X/v
 1kTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T/cRYsvljJjM7J77pLO7Mi0qGdNpxLyCaN5IKbfOo00=;
 b=X113bSotkqv2VOkJdL5pPy4N684C8m13Wa39Y9R9DOuvQLwmwaJLkvPliO+ZhacNmU
 j8o1sfy11yAoZGuswaHltehmG6KFWbBo8XMZJXilNzfZkTZ74iN6K4y8mphfvCnS5jbD
 s8qvOJKxeWrP3HNVnfs53uvGsP7c40ZNGS1crTRRLfbKhpKVCsiOLOag5kpklaHRTl3B
 9D98/7EMeNDkdwUBJLZ0pbc+gDFClFxvUrAOjONPPwfsT6fDpaCQ0ONsXkNWuNamnPgS
 kLFt9w++AR1VGTqAJmDQLRjor3U4bHH7/RB9ZTBrXHH0uVTULd3X76GYOSrZcjVNJ13p
 vFEw==
X-Gm-Message-State: AOAM5327CkcKJBa/o5VpDbzHDAXXg/S1b8soSK8A/CDlkEjEjixIabi7
 b2N6/YsVH0WUiq21V2jS7OuR8U7yK0U=
X-Google-Smtp-Source: ABdhPJx0m1gMeQ9Lv+CJ+s8cbqOIV+r+IZRPpfEiwhr386lDAQmMuwnFie9iUgWdzbBk15jCHVFFAw==
X-Received: by 2002:a63:ec16:0:b0:381:6a51:6231 with SMTP id
 j22-20020a63ec16000000b003816a516231mr1842456pgh.189.1647348940471; 
 Tue, 15 Mar 2022 05:55:40 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a056a00178100b004f731a1a952sm25717785pfg.168.2022.03.15.05.55.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:55:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] osdep: Avoid using Clang-specific __builtin_available()
Date: Tue, 15 Mar 2022 13:53:41 +0100
Message-Id: <20220315125350.82452-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
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

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/osdep.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index c9ec7830c9..322103aadb 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -624,19 +624,15 @@ size_t qemu_get_host_physmem(void);
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


