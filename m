Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDA63F902C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:34:15 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN0o-000076-Cw
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfw-0006Cl-WF
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:41 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:35458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfv-0006sF-C1
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:40 -0400
Received: by mail-il1-x131.google.com with SMTP id h29so4749669ila.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tu+3Mzgedz4+rqUQiO3m+rYiNxkgF+2/GqBtZIvUR6I=;
 b=CGlnBzKdvQgaVgPWCrFCQHyFDjB6HDYlYNMqrvWyO0+YvcSCuoQn0xC8uO+caFGcLU
 C/9O4BF7TojcPROZ5m7I9Zd/zHgUe6fV5chYMKfdxrzdFRGzH0W0M93sCGoXMr4SGl/4
 QgWWH1HHkUkfeYeab2nLCrZsEfS3ZjZQhEVUjrAYPbY4FgaElqndiCBmt4/qHo5LbZB9
 LQPDQymqdKNwKqc7bYi+mDLQ33KDrmWNdhUySyPMNFQeogExrTlLh/Ot5seANZhnrLVJ
 soT+8pWEW/EKu8POYze9mEMA4nnCgTgr6I9bbi/F2B+VHOOFzuLsUlmcKzO8TVYtRw4n
 3DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tu+3Mzgedz4+rqUQiO3m+rYiNxkgF+2/GqBtZIvUR6I=;
 b=dEd+2vCEiAlqBddvWQRjD71Ljmj9Ia5lZo+eP6TUqjwM1hpdoPEo/Zu7UmR9gGHX6d
 O5hM4/V2ApB3nsjxAhHYDvj3F1is6+GDM96u5eiIny0lBHVjrmAo0qGOKl8DtnrH3/PA
 OnSM0d1GQiBr0Mvxn0/advAG+7qf1ABeRKpiYCAV1qZC2m5hxkHkImA//qHa87iY4lVh
 Yumai7yhiZ5vaXDcOu8VzB+mZwP+vpDZQ3YjKiF+dAfBFnISmIejd4sqi2LcfM7sdQqF
 POqXf+RrUGPsQrGfA1P6Yw9syF03mzEns385B9XMJaguIiJWC06DpcaPhH5Gbbo1HDXv
 c/Nw==
X-Gm-Message-State: AOAM533tB5kCHJe5S5oZNTDGAZ/ivZVk8Sf0zlMqkhqDFLOwn9YPYfjJ
 KlK/Y3LSV4QKPSxocYiYPgAoZp48xp/Vs3zE
X-Google-Smtp-Source: ABdhPJwxXcVL/crUYRDGSvwK6S7J0WLD3NjJLLsyovdIJaJy7p/LE5vNCqjGQyRViGkhrX7LyZy1Bg==
X-Received: by 2002:a92:d848:: with SMTP id h8mr3842766ilq.230.1630012358051; 
 Thu, 26 Aug 2021 14:12:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:37 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/43] bsd-user: Include host-os.h from main
Date: Thu, 26 Aug 2021 15:11:35 -0600
Message-Id: <20210826211201.98877-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

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
index a799164324..ceb1543d06 100644
--- a/bsd-user/freebsd/host-os.h
+++ b/bsd-user/freebsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef __HOST_OS_H_
 #define __HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_freebsd
+
 #endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 3f6f4080e8..3a23e63cf8 100644
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
index b44cb7fdda..ccbea076e6 100644
--- a/bsd-user/netbsd/host-os.h
+++ b/bsd-user/netbsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef __HOST_OS_H_
 #define __HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_netbsd
+
 #endif /*!__HOST_OS_H_ */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
index 9083555f26..79468073e4 100644
--- a/bsd-user/openbsd/host-os.h
+++ b/bsd-user/openbsd/host-os.h
@@ -20,4 +20,6 @@
 #ifndef __HOST_OS_H_
 #define __HOST_OS_H_
 
+#define HOST_DEFAULT_BSD_TYPE target_openbsd
+
 #endif /*!__HOST_OS_H_ */
-- 
2.32.0


