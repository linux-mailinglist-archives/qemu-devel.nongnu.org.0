Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E8347AED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:41:00 +0100 (CET)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4gt-0001TA-3K
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wu-0006bd-Ex
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Ws-0007Oa-5h
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id o16so24691179wrn.0
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQ6CyjRWV4zJk3tXYM7i3XWmVgXsciBwzt1eUVUQ5Yg=;
 b=u+Z2H6T3gA4RnkbRTn66m4SURlRxJddVo7Uxi2L07Gxbv29vfX4zHngCptcjLGrzMP
 3uXD6CpmuHvp/M474UeefnbW8+6asA7R0n6xaEF5c4Cgfi0m14ZwEgINBUva8gq62OXZ
 eOE+v5ua0LLR5d5f5Ed63tk7QrZ4ShaAcuP2yXhOKC86OnkXMkPP6k6NO7r2/T25r6bO
 ge/9Y2JGvN8N8+lsCqvKnRWJxpViHhgNqY+0l5Xbc6oXitnK247iw3Ld4sxcwuR82X1g
 hcUAgAPUvvQ+ax+Z3oOiD1wG+QUKMUEGPvI4Ib5BprnKUH1wp/nxiLKm00biSP0PFBfg
 6xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQ6CyjRWV4zJk3tXYM7i3XWmVgXsciBwzt1eUVUQ5Yg=;
 b=mFseNNInqK/21IAotyp1xWrM2CJiWFmyENBdJSSNznumAoTWB8uDNj4+PDQ2KpOshZ
 MsYIZUZr0Tkk074rnrRrFrM4Et85K19JtKgLOh8A4ddos92iaM/cbnnuPwUFQIaOHScR
 ZOjmopQ95kA7Q2WePZB5QEpI8RznVXKBdl6OTsFZZOaUeOqzUWFAqyaNykh3ZsTqfABy
 vwkP6wGOUEpmf/mn9/AvpPj0HnK7Rq2qOtRnGsogBJY9ZZ+finN5lKySD9kvLfNTz2kd
 s3CuAiVAVESYzN387Pj/s9ts6n8TtzI/FekOjIcyvZbxO3EgbOtmo/xu2072gSw41bTV
 Zdog==
X-Gm-Message-State: AOAM533pQtEUf3t1lsRaZXfjr54PgvTsZg+m0BO3c36IbcvFAlnAgLBV
 MSALeyqW+f1PfofBA3P5/68GPg==
X-Google-Smtp-Source: ABdhPJzH4fnE0FLQDGokWe55VUZMtn3jjs5Zu+zY2UrKmDHdBaoFtXG4qjc3Z0TSRcfIcH0Svh+blw==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr3767163wru.381.1616596236749; 
 Wed, 24 Mar 2021 07:30:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u23sm2759517wmn.26.2021.03.24.07.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEF8E1FF9A;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/22] configure: Don't use the __atomic_*_16 functions for
 testing 128-bit support
Date: Wed, 24 Mar 2021 14:30:10 +0000
Message-Id: <20210324143021.8560-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The test for 128-bit atomics is causing trouble with FreeBSD 12.2 and
--enable-werror:

 cc -Werror -fPIE -DPIE -std=gnu99 -Wall -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-type-limit-compare -fstack-protector-strong -o config-temp/qemu-conf.exe config-temp/qemu-conf.c -pie -Wl,-z,relro -Wl,-z,now -m64 -fstack-protector-strong
 config-temp/qemu-conf.c:4:7: error: implicit declaration of function '__atomic_load_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   y = __atomic_load_16(&x, 0);
       ^
 config-temp/qemu-conf.c:5:3: error: implicit declaration of function '__atomic_store_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   __atomic_store_16(&x, y, 0);
   ^
 config-temp/qemu-conf.c:5:3: note: did you mean '__atomic_load_16'?
 config-temp/qemu-conf.c:4:7: note: '__atomic_load_16' declared here
   y = __atomic_load_16(&x, 0);
       ^
 config-temp/qemu-conf.c:6:3: error: implicit declaration of function '__atomic_compare_exchange_16' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   __atomic_compare_exchange_16(&x, &y, x, 0, 0, 0);
   ^
 3 errors generated.

Looking for they way we are using atomic functions in QEMU, we are not
using these functions with the _16 suffix anyway. Switch to the same
functions that we use in the include/qemu/atomic.h header.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210317110512.583747-2-thuth@redhat.com>
Message-Id: <20210323165308.15244-12-alex.bennee@linaro.org>

diff --git a/configure b/configure
index edf9dc8985..535e6a9269 100755
--- a/configure
+++ b/configure
@@ -4779,9 +4779,9 @@ if test "$int128" = "yes"; then
 int main(void)
 {
   unsigned __int128 x = 0, y = 0;
-  y = __atomic_load_16(&x, 0);
-  __atomic_store_16(&x, y, 0);
-  __atomic_compare_exchange_16(&x, &y, x, 0, 0, 0);
+  y = __atomic_load(&x, 0);
+  __atomic_store(&x, y, 0);
+  __atomic_compare_exchange(&x, &y, x, 0, 0, 0);
   return 0;
 }
 EOF
-- 
2.20.1


