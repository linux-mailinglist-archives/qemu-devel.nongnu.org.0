Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB703342D26
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:48:58 +0100 (CET)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbyL-0005tS-Gn
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbnG-0003CD-JF
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:32 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbnC-0004J7-Gk
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:30 -0400
Received: by mail-ed1-x535.google.com with SMTP id bx7so14013450edb.12
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDQfMQ2++LPf2hEK5W0FEnogdPCtNwE5cK792H3OCyE=;
 b=v8a6cZu447FTG2LFvEhb+HrBBConQem4MaGj0GgfuHv8Uxbcl6IpEMUfyvFjsyDS72
 kgrQw2yPa+fUwvaj9qeG2E/xDzluypj9YekHRwsEyJjtd1ibZ6vzkFLzQ1C0i5DbPJLw
 Pru4SV94M5oVfJtLKLUEkWsFYxFiY4fu/pO3oeZHsHYJcyqoNF2smD4zEf/XoZCzPt11
 rk65FvyknFftieehIb2jGskySYZ1aDYSMNEiM7MkED22cHi4AEfI4WklIecgFdz9NJmn
 wizXUSxNHBQKvypepDWVen++iBM+BRJwEzqUvNhMGs+9DC5qPoGAyWJrMSQLPD+uQwc8
 cw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDQfMQ2++LPf2hEK5W0FEnogdPCtNwE5cK792H3OCyE=;
 b=Mbh0uHUyWXcHP2orFrFmdi/OXikCCWR6He7EGFPKnSHzkIGUuob5r6Ac1XbwHJG2+Y
 yEUpqNvhmaBvRp+9/TJ6KrfamaLvtrbLP0yHvOSIP/CiaOX4A/ADqeeW3pRMTW9Nqy8e
 EMADutIzaUn0tWEUBMzQ8d/rtnMcBQV5NRVzhtoq6HbbakLF2sYjjHHmw/VrUu/CYjT9
 nf9qi9DCdORwkr7uyQ8a/x4ts8g+U/uYvUZV/z1zIZbaiz+vCJPArNK+J1ZAONfrKFbi
 lRL1vqM4LEY3xf0ADPJs4gGQLdT8XVP7pmE5vTUPdtQqRO6nBuo8eBnbg9P49USv5VGB
 n2ig==
X-Gm-Message-State: AOAM531cZOhy0Q9gphS49OoYcdug/yQqHOtm/7cNeOFsUpq471ydkjUK
 WczyGpRijZ+hkz1qB1wiozHBP0T4JBdrQZWH
X-Google-Smtp-Source: ABdhPJwruwQ+9jLq0xS+GnlTBVLP568vCKT2IK6kuyvjHy+tx8thf+tHy7+eaduldfqmfgbV9/hrNQ==
X-Received: by 2002:a05:6402:84b:: with SMTP id
 b11mr15281895edz.56.1616247441692; 
 Sat, 20 Mar 2021 06:37:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lx6sm5359387ejb.64.2021.03.20.06.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C38401FF9A;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/14] configure: Don't use the __atomic_*_16 functions for
 testing 128-bit support
Date: Sat, 20 Mar 2021 13:37:03 +0000
Message-Id: <20210320133706.21475-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
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
Message-Id: <20210317110512.583747-2-thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 847bc4d095..1be6bcec0a 100755
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


