Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE376346743
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:10:02 +0100 (CET)
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlTd-0006Eb-RA
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHY-0007AP-Oo
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:28 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHV-0002v9-Cp
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:28 -0400
Received: by mail-ed1-x534.google.com with SMTP id x21so24251237eds.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GjfIvo+L5/jOqEjoeTYoPhrLcD7SZkBt0Kv7d3/t/I=;
 b=ZFBwY6DO3yH8wA//cHdtcT3QIMpXhEutt0lxnIAvnE+A6XNZZLU36NSyDVCbfi+X4M
 IQ7AwIaxKBbLkYCo4Vz03aB7ps2iQ0RA5Dqs6taWfycvYrNG5X7bprc2qhv8EZk6PD8O
 vRXgmPKu8rTKd+Gm7s+DECxkVawnKT/7w2db6vRreHW8+DUkvGEPWkE8hAZejo24lYQh
 BkDkYcPJvF3Wyq5XLHO7j2Ov31NbCTMmpcfwqOsD5RX0XWamMmTd6DwsWyYc2bei98jb
 Z6hP6iB/2hBi62n0AEleLtX89EXqL5Z4GIW9Y5E0l7PE2x34T9c+VCpIJYBxYzMD6yOV
 dySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GjfIvo+L5/jOqEjoeTYoPhrLcD7SZkBt0Kv7d3/t/I=;
 b=Zvfk+U/DenLgiVvgsShgcInft8xzy4eDIyIHFjqR96gVIwO+urJNMabky/v+v+GMa+
 mpO4PI6vAF+ZiMoJf7IzIhszxYdSVn5UbzeCloBTgyj4nh+YkBn273gTEOfKJOm1brYC
 ZMfwXj3SwYrFrszGUQE3OdfYwGRhBnYn3CsNSk3cYrK2LhExn1z1T0iHcqA0lUeP1oQ7
 wHPjqPtM/h+vsvkNw5TdgbdIX222ltiugwtgV3UxYWRpYlgKCPQXcI2NLKT+STaL/2Xd
 ywAJXfDcJt0P+7OE6SGx5wxzQXqOS0celloJ7quBbOaYQMqVkxQ5Rw9yIjcHKaK0ECdd
 +5Lw==
X-Gm-Message-State: AOAM5339y9eQAmdpEQzoY5Knro9GXZQcg88WmCyrUx1IsQX1RLeNSsTA
 EvS7mWTYq1gV8DPfSMKYiZlMkQ==
X-Google-Smtp-Source: ABdhPJwWhljpjTwv+zRkQrmYrE3cysv194I2Zxs4/q2VFutk4PPUGJzb9lREcWtDzomME15dXYtBIw==
X-Received: by 2002:a05:6402:350f:: with SMTP id
 b15mr5488542edd.6.1616518403528; 
 Tue, 23 Mar 2021 09:53:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s6sm11404319ejx.83.2021.03.23.09.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A95791FF99;
 Tue, 23 Mar 2021 16:53:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/22] configure: Don't use the __atomic_*_16 functions for
 testing 128-bit support
Date: Tue, 23 Mar 2021 16:52:57 +0000
Message-Id: <20210323165308.15244-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
Message-Id: <20210320133706.21475-12-alex.bennee@linaro.org>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 61872096a8..69f9f05673 100755
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


