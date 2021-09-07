Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB04030B5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:07:49 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjFs-0006LN-7R
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2S-0005oC-Ln
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:56 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2Q-0000te-QZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:56 -0400
Received: by mail-io1-xd29.google.com with SMTP id f6so536750iox.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+3JXv1jQolF4HbQW+/G3IQp5iEJMYXKuexla/7K7h8=;
 b=ibwU/ovrvBIENngWKPnAwjwadKGjip5MhTTChdAROfLy991HtQvMJxewJlm5yUAYyS
 h/NK3mEw+9nMpiyDvO7OUbaA5sCV7xK+3Y3wJj40VcnFAXL9ti2+XCTSrW3RtwvyMbBq
 LxqHsRbcIEA+rSGOWHhtvIDUNvSuCm0wPNZqZTUTdBK9Aq0qb6pnABaLX3QCzc+eVMvP
 UQKSBWB5QA2f5adyGuVBe6uCDiK023dGI2KGwDZnGsm9MNjM6sTgcc+tWk9P1w6WNiFk
 oN24XLSxiNBwib5LXuJIEWhv/smBX1CF0uRPlfTdTTGbfTe0FhzUuEp+kx7jWaN8kQff
 wQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+3JXv1jQolF4HbQW+/G3IQp5iEJMYXKuexla/7K7h8=;
 b=bLX1+6IDY4fZ+/DrmHwKiboEFJJaj8gSMLwb56dnl7g0VWvii+Twpq4HKB+WEN5AiA
 MVNb0vi26pru8Qlmhr640DrhZvRVJQJu9YcgVk4ViV2SZlQv8vO9NKwOI+JRQOhKN29h
 AzhQe7wRYVaiYUmBzE2H1qQMsnIFdOOXfPPxJ1+NmC6JY254lg26ORD+jmEvDuaXvdyF
 ZxJZEF66GIAw9AjImrzLw6PPk63Amx49joHZeGLg4h4QkJG7YzPJ6aj5N7T4/V/Es/Se
 MFmRg97SK3HNHZTZmaeH/ydCgpE5FtZuxAhpK+iZNGjNTLLWCRUkyq5qnZmcOYQbNhHv
 3HkQ==
X-Gm-Message-State: AOAM530JXrczWCKSwbJwLzhE1G2SDF6GxIVyt7zUE1h4MPGA6kxvnCP4
 0r+tZcRMul7ThFUWEIFVQeavIY/wrC9kE7FSnWg=
X-Google-Smtp-Source: ABdhPJzV8m4xizAHbDTRK+AXFJIxT9R4SwUPNbdC2+FPfpIolb2CPBlRi/vYYFX/2w1E0ah2JPZTpQ==
X-Received: by 2002:a02:9608:: with SMTP id c8mr437867jai.133.1631051633603;
 Tue, 07 Sep 2021 14:53:53 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:53 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 17/42] bsd-user: Include host-os.h from main
Date: Tue,  7 Sep 2021 15:53:07 -0600
Message-Id: <20210907215332.30737-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Include host-os.h from main.c to pick up the default OS to emulate.  Set
that default in main().

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/host-os.h | 2 ++
 bsd-user/main.c            | 4 +++-
 bsd-user/netbsd/host-os.h  | 2 ++
 bsd-user/openbsd/host-os.h | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/host-os.h b/bsd-user/freebsd/host-os.h
index bd3f2892db..dfb8344b7b 100644
--- a/bsd-user/freebsd/host-os.h
+++ b/bsd-user/freebsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef _HOST_OS_H_
 #define _HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_freebsd
+
 #endif /*!_HOST_OS_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index e06cc7b414..607fdd8380 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,6 +41,8 @@
 #include "exec/log.h"
 #include "trace/control.h"
 
+#include "host-os.h"
+
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
@@ -352,7 +354,7 @@ int main(int argc, char **argv)
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
-    bsd_type = target_openbsd;
+    bsd_type = HOST_DEFAULT_BSD_TYPE;
 
     if (argc <= 1) {
         usage();
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
index d4bbc7d58f..c0be51a7ef 100644
--- a/bsd-user/netbsd/host-os.h
+++ b/bsd-user/netbsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef _HOST_OS_H_
 #define _HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_netbsd
+
 #endif /*!_HOST_OS_H_ */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
index ae23bfef64..eb8fdf1567 100644
--- a/bsd-user/openbsd/host-os.h
+++ b/bsd-user/openbsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef _HOST_OS_H_
 #define _HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_openbsd
+
 #endif /*!_HOST_OS_H_ */
-- 
2.32.0


