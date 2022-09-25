Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162DF5E92CD
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:45:51 +0200 (CEST)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQ50-0007d5-3U
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqh-0002dt-SY
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqg-0006JK-2R
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:03 -0400
Received: by mail-pl1-x630.google.com with SMTP id v1so3915258plo.9
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=artXxf134UnHwbGPHataxK5Sb0F+FjJJHNdQ9P3EeuE=;
 b=hw4Ju76c9r5ZEeqOvmmALbHJ/WSeaJkcXR/bFk4ef5PQf0upstLQg+4nMapfb7e0Kg
 9UdHeChOf62mTF8kmM/Nxz1RjR30IDFE3g8A9gVSoU1otUyIlWkna8yMr9qS+ulc9wkt
 vDoAZK/Aq3dtdHwjO+XabfKQ5sOQQutfUZZneqOy0l2TMh+7v8+rfCLkFZdM5ileT/Y+
 igaVou75ZIb75j2azHMWisIxxNlQE6lzL1RXhBp5gxpqDkDSayCM4c/b7dabrK5Fthol
 LGV/y2CrfO0dH++o3U3FNoKjWWyEWK1WMkjgAzobFLuw2ObX0krV82+GKxzq46JSZU0f
 3jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=artXxf134UnHwbGPHataxK5Sb0F+FjJJHNdQ9P3EeuE=;
 b=AL/f2P09vdWI6Kex1u2FlfEKR0F6eXIxawv2eS2Ey4X/uRfFYWmiB6MlrrskKC++kb
 M5HdqbP6WH+OlZQ39Jvv7mJtNZhdLCKSSVIySD5rsqfGXKPFXcRJ7tg+Fae7YfiDnqW7
 37LEmECSZ3xsLPqE/GPqrZCHHqT9VVpn87M83O/WbYGgE436F8qbvIM+m8ZJWt/MqP4n
 9kKxoiwSW7SQv5rX19v4xQ2sBi2SLzYpsTFlRkAsglbQhaN2X4XrcAThIpWPvvUFfXZL
 Y822zQtv6/h44Tt31nkAu2ZrXqPU7ZuXtkrqXi7nZnTVNPNfnKTYRyZSpIo0zQyB7zQa
 xNVw==
X-Gm-Message-State: ACrzQf134cgTbTdy/t0Wq3MuTU3WkOMy6nAclmNzs54g5i78hztnGK8Z
 dfEO74mWWSnme6JHhn/SjsKEVYVpDj4=
X-Google-Smtp-Source: AMsMyM5CZDUOuNC1DHO1i+icS0Iy3SpL0mNH+2v3rG3bqUV7x1gw/ovPTiBW7etpSvCNFJA1lgoIaQ==
X-Received: by 2002:a17:90b:48c5:b0:205:a605:4f40 with SMTP id
 li5-20020a17090b48c500b00205a6054f40mr5017900pjb.104.1664105460500; 
 Sun, 25 Sep 2022 04:31:00 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 07/54] tests/qtest: boot-serial-test: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:45 +0800
Message-Id: <20220925113032.1949844-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Split to a separate patch
- Ensure g_autofree variable is initialized

 tests/qtest/boot-serial-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 2f99d71cab..72310ba30e 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -224,14 +224,14 @@ static bool check_guest_output(QTestState *qts, const testdef_t *test, int fd)
 static void test_machine(const void *data)
 {
     const testdef_t *test = data;
-    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
-    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
+    g_autofree char *serialtmp = NULL;
+    g_autofree char *codetmp = NULL;
     const char *codeparam = "";
     const uint8_t *code = NULL;
     QTestState *qts;
     int ser_fd;
 
-    ser_fd = mkstemp(serialtmp);
+    ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
 
     if (test->kernel) {
@@ -246,7 +246,7 @@ static void test_machine(const void *data)
         ssize_t wlen;
         int code_fd;
 
-        code_fd = mkstemp(codetmp);
+        code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
         g_assert(code_fd != -1);
         wlen = write(code_fd, code, test->codesize);
         g_assert(wlen == test->codesize);
-- 
2.34.1


