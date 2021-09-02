Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01B3FF834
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:02:40 +0200 (CEST)
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwfH-0006qH-6h
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR9-0006uj-DR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:05 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:38443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR7-00030Z-RL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:03 -0400
Received: by mail-io1-xd36.google.com with SMTP id a13so4706226iol.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+3JXv1jQolF4HbQW+/G3IQp5iEJMYXKuexla/7K7h8=;
 b=qWVK0dV2i3X5VFJ8Ho0hZ0wpwbtGEu7VgklvFTyVMVjJ9Z4FgxXXE90GaHkasnYal6
 SDVCwQqR7v4sNXDIKW5WqZu+lWjTnvc4Q/8mFZGqtD10hx5OIk6J/WSV6KTLZNxr7eQf
 aRXF6UnJIw9+hRJOoQOiFKKsoTvYJer55a11Oz7U95RJnNcwrkmXbt+11Ar9yQu5cb7r
 UlKguXeLLNV8eU5jBLGwY2a1ZglAjvEbfkzYos+83+5Z8csdkcII1DiJlHp8EDSvI042
 zsJUZX5gdhv5e1Y5+mKzELrLX69+FJGRszRn+8o3oYC030O1RB65RKw3fBaUyVmKVSgA
 AUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+3JXv1jQolF4HbQW+/G3IQp5iEJMYXKuexla/7K7h8=;
 b=b7LxR223yQ6iuEffdmJjT9Rop5JdKE+IXCdvORxFptTGMxwRjEUpWQEsa+0llvCS8a
 Inrt3Ajn22ojT4yTZmhgiO2bcSML+Du6HnVoGPf93JtM9lxxs0Tfu+QT40H25kkEm2GH
 BkSxp+o7Fcy/R1oowvn+kWOtOljYghZXrTwWehqgF0iDgWCHrnrevsZvE5XNtbOxUHxq
 bfvA6hGHS+TiBfEugJU4Bw7T4bwewM1v1egAA3a3QOlfPf3QPYtFFJaBpa+OoUuQ8Vwf
 Vz2Js43NUv5Y3GakLoSHCZBv0p0h2fFildYUX5W6m2re19zc39m3kkV/fO9nKGgky0WG
 5q1Q==
X-Gm-Message-State: AOAM532m+wqQYpa5AagVLWFV7o1/ABQQXnGOtdWnAQ/1wErmHButes//
 oA9GAJfOC/67RRuYg04kmcq0qcDkPnhJbQ==
X-Google-Smtp-Source: ABdhPJyOqQshO9y3JX0rnjmBJPDecd/ugcEzrg3Bmzg6z+QreryPAYezWi42t9o1Ke/ft9o/h1+3LQ==
X-Received: by 2002:a5d:9e0f:: with SMTP id h15mr722342ioh.133.1630626480547; 
 Thu, 02 Sep 2021 16:48:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:59 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/43] bsd-user: Include host-os.h from main
Date: Thu,  2 Sep 2021 17:47:03 -0600
Message-Id: <20210902234729.76141-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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


