Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB63A8E7F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:45:03 +0200 (CEST)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKc2-0000KV-Ke
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTu-0008WP-1e
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTs-0005dm-8w
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:37 -0400
Received: by mail-pf1-x42e.google.com with SMTP id s14so857531pfd.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQdvWRX1hZO0Z1j1TwBSyfUR2Ola+BhQ1+6mdvjTZu8=;
 b=vPOQ4kblqHHKFJFGhsoJ+34RHM+LE0OI1Rc/YOuVIbBRlsWBS83oSnESr46+HWtDr9
 QDCejuyic5MOZ76vzAR4IkIG585sOGmdXpQOsU7/F2e6r1CQS2gBoML9wiHPsSYgGmvO
 kB8C++9oAHLZyw3BrebegUneTn0X33zzSB5U3RtGVVfEyfGdE9HXiRJvJ1b5OO8Ai2TC
 NTm10oe4/cXW4dqIyvZpS/f4aEAGy0EE7UkJVRhxs+SImnPqUKXvQcK8gc0tIV0slMGr
 hW7KXKwG3BIRpkRXcgw6Y7zMquqxg3ZBKMt42QnjzVUdG9RRQ06sfb3/0chSre4oQh+G
 9scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQdvWRX1hZO0Z1j1TwBSyfUR2Ola+BhQ1+6mdvjTZu8=;
 b=AT4yUyG4EPO+CG15R4lQSol5uuwhdwoZta8d62f+C6JuNcqQedXURkZ8DNfV3cgOnW
 lt/KIXhRvs5Nf8yMdJ+4J23pjI8/WCFtMb1gnsdm+vYni5QkGR3nZ34L44BKvnaYVhF5
 0ZcewQ7VxdacC9r3oZO8pVLnv+pY/IrXB9ONbPR8seSUoR+jpK4GkL+wc5e34E8ZKj4Y
 7FfwgUQBeDWVm7xBpiddziXrjYwupJgDYLWNdQiv6LGT5Dfu95kGblSFbwm4FtKohM2n
 f2gi6r31zUvfmYMwxzeDzYjNW+3dDEejKLUsk4r1HMcuhv0x6cmQE5HklTlbIGiQEx5q
 BhTA==
X-Gm-Message-State: AOAM532p2yoEuBGlctIMQYXl6MHmAYywxBMLI5XAON5yo+Mu4RcNJ9yJ
 8KAal6hOju29ZjtxSQMyAjZtkuUJ6T4mKQ==
X-Google-Smtp-Source: ABdhPJw2j4H+CVHGwj6iy/rW7tCKE3h/DLz4eAgCr/DJ7tKJQVHpl8J8fLIWg9rxboKrWu6Rna7dSw==
X-Received: by 2002:a05:6a00:1a41:b029:2ef:9721:879e with SMTP id
 h1-20020a056a001a41b02902ef9721879emr7126393pfv.74.1623807394992; 
 Tue, 15 Jun 2021 18:36:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] qemu/compiler: Remove QEMU_GENERIC
Date: Tue, 15 Jun 2021 18:36:28 -0700
Message-Id: <20210616013629.1458790-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All previous users now use C11 _Generic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-8-richard.henderson@linaro.org>
---
 include/qemu/compiler.h | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 091c45248b..5766d61589 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -173,46 +173,6 @@
 #define QEMU_ALWAYS_INLINE
 #endif
 
-/* Implement C11 _Generic via GCC builtins.  Example:
- *
- *    QEMU_GENERIC(x, (float, sinf), (long double, sinl), sin) (x)
- *
- * The first argument is the discriminator.  The last is the default value.
- * The middle ones are tuples in "(type, expansion)" format.
- */
-
-/* First, find out the number of generic cases.  */
-#define QEMU_GENERIC(x, ...) \
-    QEMU_GENERIC_(typeof(x), __VA_ARGS__, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
-
-/* There will be extra arguments, but they are not used.  */
-#define QEMU_GENERIC_(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, count, ...) \
-    QEMU_GENERIC##count(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9)
-
-/* Two more helper macros, this time to extract items from a parenthesized
- * list.
- */
-#define QEMU_FIRST_(a, b) a
-#define QEMU_SECOND_(a, b) b
-
-/* ... and a final one for the common part of the "recursion".  */
-#define QEMU_GENERIC_IF(x, type_then, else_)                                   \
-    __builtin_choose_expr(__builtin_types_compatible_p(x,                      \
-                                                       QEMU_FIRST_ type_then), \
-                          QEMU_SECOND_ type_then, else_)
-
-/* CPP poor man's "recursion".  */
-#define QEMU_GENERIC1(x, a0, ...) (a0)
-#define QEMU_GENERIC2(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC1(x, __VA_ARGS__))
-#define QEMU_GENERIC3(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC2(x, __VA_ARGS__))
-#define QEMU_GENERIC4(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC3(x, __VA_ARGS__))
-#define QEMU_GENERIC5(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC4(x, __VA_ARGS__))
-#define QEMU_GENERIC6(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC5(x, __VA_ARGS__))
-#define QEMU_GENERIC7(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC6(x, __VA_ARGS__))
-#define QEMU_GENERIC8(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC7(x, __VA_ARGS__))
-#define QEMU_GENERIC9(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC8(x, __VA_ARGS__))
-#define QEMU_GENERIC10(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC9(x, __VA_ARGS__))
-
 /**
  * qemu_build_not_reached()
  *
-- 
2.25.1


