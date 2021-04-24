Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66AD36A205
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:18:48 +0200 (CEST)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKzX-0002iP-OT
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiL-0005d7-6T
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:10 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:37738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi2-0004Fi-DF
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:59 -0400
Received: by mail-io1-xd2b.google.com with SMTP id b10so51767512iot.4
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzQaTwpcBBBA0bJhz9jyCl+zJZ6Jo5JR+AjitG9u2PU=;
 b=ewp5Et71qIuOhJMbvZlTYN1RyD39vkkI0NqYNR+KKEz+z2zJBnxJ40V0CnxmK212mI
 5soaJ8e8xMAy2DqYhl0cVw05bA22GByYcEugFvaH3oq10a5CYMID+m18cc1FJf3CSr9A
 7iZ+e+V0trHq+u3CQ+KsWw1gmf4gcvrPeI5fke+jB6rFBBprZgWCYjfEmXoZXrmJgh9A
 hYRh2yJqXaeNPRRIr6ePrMcQWQzALNKFEOFRwcAyJI/8V0lhWGI2bo6DrEYGtc1uZGTx
 QTzb3WBT/PrubpB0VOcRl/+Te9x5Ltf7Hw95Io8WQFGgKDewRig6J+wxpBt0YA/xW8E/
 z6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzQaTwpcBBBA0bJhz9jyCl+zJZ6Jo5JR+AjitG9u2PU=;
 b=W2jBir6EpNHWy3+dv4/dJVi+z+LYjDPx0dC7R+ynjykYWTID5TiA+Kv23pZapuaHJK
 wkK99OkNBKW4eTNs28FTozde7uoH2Z+lWj0ai8yigwavAnnXZyxTtK6zUvVl6xPnACqc
 noDqkHCb4FUpDwHCnXlEarLmYIHSGvTkYGhpsal+PTbexOwmZiRQepuV7aEmLemVlSly
 1dXXqQQ+2anZrzJ+Jbczsfn5xOg+uH8eFxwhG6mzNufruFZYZRoUE9/gjreao4Ro8r/s
 JplMjfUt8kHutZVbttvreNqWqxOwWreec0PKd1ys/jQNdT7Gmr5zmug+Q0D252FCPkeW
 BwUg==
X-Gm-Message-State: AOAM533WkXU3nFAXDYZ6lxBO1fVPxTLS5vg71BDmBFCe6fvtyxiRy7B9
 k9P/hXHfN+faqWD8SATFBGSp9aWASO3mUG7h
X-Google-Smtp-Source: ABdhPJyImwXnnQd9imAGhb91+CFkTGfRDLlzEcg5j+CjxGugi01OyxIIPS1Y2tjNW1kbmcW0LIo/oA==
X-Received: by 2002:a05:6602:1611:: with SMTP id
 x17mr7378087iow.65.1619280040636; 
 Sat, 24 Apr 2021 09:00:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:40 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/48] bsd-user: style tweak: Fix commentary issues
Date: Sat, 24 Apr 2021 09:59:45 -0600
Message-Id: <20210424160016.15200-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Lines > 80 or 90 characters
C++ comments
BSD /*- block comment convention removed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-mman.h | 42 ++++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/bsd-user/bsd-mman.h b/bsd-user/bsd-mman.h
index 910e8c1921..5a64d0d425 100644
--- a/bsd-user/bsd-mman.h
+++ b/bsd-user/bsd-mman.h
@@ -1,4 +1,4 @@
-/*-
+/*
  * Copyright (c) 1982, 1986, 1993
  *      The Regents of the University of California.  All rights reserved.
  *
@@ -30,16 +30,20 @@
  * $FreeBSD: src/sys/sys/mman.h,v 1.42 2008/03/28 04:29:27 ps Exp $
  */
 
-#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080  /* previously misimplemented MAP_INHERIT */
-#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100  /* previously unimplemented MAP_NOEXTEND */
-#define TARGET_FREEBSD_MAP_STACK        0x0400  /* region grows down, like a stack */
-#define TARGET_FREEBSD_MAP_NOSYNC       0x0800  /* page to but do not sync underlying file */
+#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080
+                                 /* previously misimplemented MAP_INHERIT */
+#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100
+                                 /* previously unimplemented MAP_NOEXTEND */
+#define TARGET_FREEBSD_MAP_STACK        0x0400
+                                 /* region grows down, like a stack */
+#define TARGET_FREEBSD_MAP_NOSYNC       0x0800
+                                 /* page to but do not sync underlying file */
 
 #define TARGET_FREEBSD_MAP_FLAGMASK     0x1ff7
 
 /*      $NetBSD: mman.h,v 1.42 2008/11/18 22:13:49 ad Exp $     */
 
-/*-
+/*
  * Copyright (c) 1982, 1986, 1993
  *      The Regents of the University of California.  All rights reserved.
  *
@@ -69,18 +73,21 @@
  *
  *      @(#)mman.h      8.2 (Berkeley) 1/9/95
  */
-#define TARGET_NETBSD_MAP_INHERIT       0x0080  /* region is retained after exec */
-#define TARGET_NETBSD_MAP_TRYFIXED      0x0400 /* attempt hint address, even within break */
-#define TARGET_NETBSD_MAP_WIRED         0x0800  /* mlock() mapping when it is established */
-
-#define TARGET_NETBSD_MAP_STACK         0x2000  /* allocated from memory, swap space (stack) */
+#define TARGET_NETBSD_MAP_INHERIT       0x0080
+                                /* region is retained after exec */
+#define TARGET_NETBSD_MAP_TRYFIXED      0x0400
+                                /* attempt hint address, even within break */
+#define TARGET_NETBSD_MAP_WIRED         0x0800
+                                /* mlock() mapping when it is established */
+#define TARGET_NETBSD_MAP_STACK         0x2000
+                                /* allocated from memory, swap space (stack) */
 
 #define TARGET_NETBSD_MAP_FLAGMASK      0x3ff7
 
 /*      $OpenBSD: mman.h,v 1.18 2003/07/21 22:52:19 tedu Exp $  */
 /*      $NetBSD: mman.h,v 1.11 1995/03/26 20:24:23 jtc Exp $    */
 
-/*-
+/*
  * Copyright (c) 1982, 1986, 1993
  *      The Regents of the University of California.  All rights reserved.
  *
@@ -111,11 +118,14 @@
  *      @(#)mman.h      8.1 (Berkeley) 6/2/93
  */
 
-#define TARGET_OPENBSD_MAP_INHERIT      0x0080  /* region is retained after exec */
-#define TARGET_OPENBSD_MAP_NOEXTEND     0x0100  /* for MAP_FILE, don't change file size */
-#define TARGET_OPENBSD_MAP_TRYFIXED     0x0400  /* attempt hint address, even within heap */
+#define TARGET_OPENBSD_MAP_INHERIT      0x0080
+                                /* region is retained after exec */
+#define TARGET_OPENBSD_MAP_NOEXTEND     0x0100
+                                /* for MAP_FILE, don't change file size */
+#define TARGET_OPENBSD_MAP_TRYFIXED     0x0400
+                                /* attempt hint address, even within heap */
 
 #define TARGET_OPENBSD_MAP_FLAGMASK     0x17f7
 
-// XXX
+/* XXX what to do in the future? */
 #define TARGET_BSD_MAP_FLAGMASK         0x3ff7
-- 
2.22.1


