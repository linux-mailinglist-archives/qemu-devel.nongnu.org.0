Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F89B5760D4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:47:55 +0200 (CEST)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJnW-0000LQ-Lp
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgm-0001yR-JH
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:57 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCJgk-0003jt-Lg
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:40:56 -0400
Received: by mail-pg1-x534.google.com with SMTP id bf13so4155017pgb.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klW5l721zkRtbV2/1qgZifBW4d5CZpXzNC6YAnMqrO0=;
 b=IiTRoGTSVvbDo/qJmJfokVKIxJglNuLVY1om6NFIGShZMFiF+eP95bx5JvxPK+Pld8
 oIHml+NoGwD1GUbF7n3TkTqT46KMqV7COJEpAxnYJG2B3vXTQ4pm31s98C6igHkDa9vH
 eW3q1bZWl7eOaSvYbuUfJhORlYvf8uuxKHu04ZizYPsBVG8jG6lHGA8BXf4u7cqLQwKk
 K55tymgbOATWb6a7Rm7qXTwIAXuK8uXzoFReDa3TbqUTRdCupDPu0TFFNvJRtKogYAME
 ObMhKsN6ZtMP48FhqDJL2Ngy/OPu4FbG76i8pXYmh6eWYBOSiJJ7BkPjkVp0YFyrmrXi
 A7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klW5l721zkRtbV2/1qgZifBW4d5CZpXzNC6YAnMqrO0=;
 b=jBZOLfO3R99b2dW5pFvxglQFe1RBBK65AGtb9ih524/6bPL5anutY610vJti4si+Ul
 kjpycES+1+Jn1z2WQZ0OCxvTbGYqRmQx86RTLj9Gw8JxxG2cXHpgwRjFBsF9Z1q/p/HX
 kDyM5ZB8sJrUZAalX16v2aG9796eFmAV8amv79St5qOTkyFXjs68UFQRYc3GgXMqCSqZ
 W1DuD5rMvcRVss9/6AXrMxPd9AgNHip3ih6d2weuCVFkQMWOZ+0KWsi7TOAXR6kFhx5P
 hnFqC0GD19S3udH+S8cvdNFtM14VSc1/bnBJZ5Mybfn1Md7SVnkhV8HcjxvazzGoaUUh
 YlAw==
X-Gm-Message-State: AJIora8geWFONteb+rFK2jA7xjaqjdu53ZUV0VdgY0NUvQ8ngZBHyzWW
 X9G/usRq29NpTDGLrGd7pzwtaQ/R2x0=
X-Google-Smtp-Source: AGRyM1sXJ+u1+Zafk0yMT/8B+226p2wOmljB+T9ySSWduFWhLfLB2xJPkJ2e874/cDRKeC9YXCWl7w==
X-Received: by 2002:a63:8549:0:b0:415:ed3a:a0c with SMTP id
 u70-20020a638549000000b00415ed3a0a0cmr11703766pgd.448.1657885253448; 
 Fri, 15 Jul 2022 04:40:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d554:ffbd:f962:2efd])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170902ca0400b0016c67a3b7d0sm3258627pld.61.2022.07.15.04.40.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Jul 2022 04:40:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v2 2/3] Revert "main-loop: Disable block backend global state
 assertion on Cocoa"
Date: Fri, 15 Jul 2022 20:40:38 +0900
Message-Id: <20220715114039.59790-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220715114039.59790-1-akihiko.odaki@gmail.com>
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This reverts commit 47281859f66bdab1974fb122cab2cbb4a1c9af7f.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/qemu/main-loop.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 5518845299d..0aa36a4f17e 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -280,23 +280,10 @@ bool qemu_mutex_iothread_locked(void);
 bool qemu_in_main_thread(void);
 
 /* Mark and check that the function is part of the global state API. */
-#ifdef CONFIG_COCOA
-/*
- * When using the Cocoa UI, addRemovableDevicesMenuItems() is called from
- * a thread different from the QEMU main thread and can not take the BQL,
- * triggering this assertions in the block layer (commit 0439c5a462).
- * As the Cocoa fix is not trivial, disable this assertion for the v7.0.0
- * release (when using Cocoa); we will restore it immediately after the
- * release.
- * This issue is tracked as https://gitlab.com/qemu-project/qemu/-/issues/926
- */
-#define GLOBAL_STATE_CODE()
-#else
 #define GLOBAL_STATE_CODE()                                         \
     do {                                                            \
         assert(qemu_in_main_thread());                              \
     } while (0)
-#endif /* CONFIG_COCOA */
 
 /* Mark and check that the function is part of the I/O API. */
 #define IO_CODE()                                                   \
-- 
2.32.1 (Apple Git-133)


