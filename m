Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8A369BA1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:52:47 +0200 (CEST)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2n9-0004GV-1M
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b5-0005ss-65
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:19 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b1-0008BP-M1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:18 -0400
Received: by mail-io1-xd33.google.com with SMTP id p8so1666573iol.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3vvSJlvlo+EU8vIqeNNS+/akqD84ySOCzpwxiSaklTk=;
 b=n5jFvz8pds8wGwF434Lx9l9TV0k3nDCu481sf3F+/T1ZB0Kne/pAUHxXvVhmog/yqH
 grvnJcsBgXGwrTz9KrBYpqjCMU0OwMrngLggdZXr6XvPAq9W5Z/zFtgigfSG63rfxP+F
 aJRc7gWyedSjOTDGCjQO9XyR/Kl3YGMlYuMy4um61WICCaS2mfRWrflqJBirIjKgmfhw
 KkmU7yS2nwxcKwbevCgiS38Qja0C5QPvf8DDm7xhv/ElMjKWmg7/H2j7Zma0/zyj0oWb
 fuUa7csoG3XJ+hZpxK/4loJ0RMV1FPNuY/kHm7HQ/2evUXUorKIRrdy5dTIpeOTNCYUB
 3ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3vvSJlvlo+EU8vIqeNNS+/akqD84ySOCzpwxiSaklTk=;
 b=oJRMc0fOeNJ9ttCeo9WQGZonRYdtyV1F6SPK7Lzz4SJtuuDwPadq6AovEPbf/xNaXH
 LVXPVgKT4XIun1FSq64DfwharvFUsn3g4jQ6lBttM9SgeCCKMdauVgHw8liho9OanKmp
 r6l6PtmXO+5bG+U5xZyU9r+u+0HGxVbgluMcrZ6oEZEQITwh0MEifz48VNHr6flXgRdN
 6EYEM4857kxUpz8S+nqf7+smQQkDLdytjxvhJY2tr9PvHeOfweDMb21DpaoMok48w2s0
 MlfCC02HoP2TCeeSppBfyJZuL4yLO1pv0POfSyQdHntc/2fcArDiJXRtACVSRaF9tx7O
 OoQA==
X-Gm-Message-State: AOAM532V/z9/YOVvksXSBpBc5RcahUyckiyNZOF/4PZY4uVSeliyvFVL
 30Eo21YO0tfBaCOwj7ijvxNl1CrolSgFesrB
X-Google-Smtp-Source: ABdhPJzj7NeJ+UHFuYeIE7I7QyqEPATw7qZmNwd/gr+30j32KA5HSPx901jl+C1CAcZ5wPQ47Ly4SQ==
X-Received: by 2002:a5e:c74a:: with SMTP id g10mr4645808iop.165.1619210413645; 
 Fri, 23 Apr 2021 13:40:13 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:13 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 15/24] bsd-user: Fix commentary issues
Date: Fri, 23 Apr 2021 14:39:50 -0600
Message-Id: <20210423203959.78275-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Lines > 80 or 90 characters
C++ comments
BSD /*- block comment convention removed.

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


