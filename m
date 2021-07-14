Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EA3C87A1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:32:20 +0200 (CEST)
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3grz-000406-UM
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geY-00058u-R6
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geT-0002NP-0d
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4138281wmh.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6c/2UKBKcmwZO3rKn9f4u9KmPaZeHBM5vy4ozHzctY=;
 b=VIrK27poLTtyA7PxTkHxEbmRq22AN/2gBBLNxYEfYLhnBULcQ58C58lYcEafbYBmWO
 RDv7+CyVAoxwJTEsD5M5xptYRwkUMDt6gHeU6oQWSnAOina/E1psunVR67TolB4we1Zv
 bLdsjUqcfHkwbFY9i2eLtQ9xvobfj8tVXV4w9on8ZFx2I/B61dmOrJpm3iF9p6awSTUb
 9lqwWXeE9IlWKgCnzUN9LxeNp4OGtAwvdUp7zVdiZSaDefluVXS1yNUNwmVgSPtiQn1m
 Y6+zsQyswdajKRFkXkqhFucSKBs+7JK6kNZ3eBw6jzutSs5J6YDBgvOyUJAFbDD8vFNH
 AooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6c/2UKBKcmwZO3rKn9f4u9KmPaZeHBM5vy4ozHzctY=;
 b=exPvUHHn8FnbMYIEZawPVTNmZ1ryMCC9XQxxa8wspYavuWmKfB0sld+Hw9eDpab4Dq
 eIDZiSXOi1euJG0vXNZzzAUJgJ1ySrAypbEBDX9D1p2XRbiH2p9yo4b3TCdFhJ19nKoO
 A5aPnuZccODEsasziRoYpqZMeSpZ8fmGSNY4y50TUqvIphN7/TTMwvv7gXtJ7PiaQ/HH
 smNAD0H4l/N9KkUnNphnIN5Pq5385rErt645fJ9YiSdMH7j/dHJITjjV+aEslhLBvjob
 jbE/Ym8x4m3VoP3k2oRFmBeOuEBhOydzDbZJDKz9ZYg3LXBWrYugCf5ghGjpJOid0n02
 1hag==
X-Gm-Message-State: AOAM533elA/QEBDEVImDZqoeFSqkIiBCo+RmHTYjhKSJEdadFjN1yA9O
 zGDfP08bITr1dgaBybFPKsBikWRJaiKVHQ==
X-Google-Smtp-Source: ABdhPJxAEYDtQYdPFiMSYFcKYcooz24UriLUOR+HdsS8x+OoxxLOkD0H0PBZsHs7XcVmcVRFIV6dRg==
X-Received: by 2002:a05:600c:8a9:: with SMTP id
 l41mr4818832wmp.152.1626275899616; 
 Wed, 14 Jul 2021 08:18:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t6sm3099249wru.75.2021.07.14.08.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C910B1FFB5;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 28/44] tests/tcg: make test-mmap a little less aggressive
Date: Wed, 14 Jul 2021 16:00:20 +0100
Message-Id: <20210714150036.21060-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check_aligned_anonymous_unfixed_mmaps and
check_aligned_anonymous_unfixed_colliding_mmaps do a lot of mmap's and
copying of data. This is especially unfriendly to targets like hexagon
which have quite large pages and need to do sanity checks on each
memory access.

While we are at it clean-up the white space and style issues from the
legacy code. As we no longer do quite so much needless memory access
we can also remove the hexagon timeout hack.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <20210709143005.1554-27-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/test-mmap.c b/tests/tcg/multiarch/test-mmap.c
index 11d0e777b1..96257f8ebe 100644
--- a/tests/tcg/multiarch/test-mmap.c
+++ b/tests/tcg/multiarch/test-mmap.c
@@ -49,64 +49,62 @@ size_t test_fsize;
 
 void check_aligned_anonymous_unfixed_mmaps(void)
 {
-	void *p1;
-	void *p2;
-	void *p3;
-	void *p4;
-	void *p5;
-	uintptr_t p;
-	int i;
-
-	fprintf(stdout, "%s", __func__);
-	for (i = 0; i < 0x1fff; i++)
-	{
-		size_t len;
-
-		len = pagesize + (pagesize * i & 7);
-		p1 = mmap(NULL, len, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p2 = mmap(NULL, len, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p3 = mmap(NULL, len, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p4 = mmap(NULL, len, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		p5 = mmap(NULL, len, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-
-		/* Make sure we get pages aligned with the pagesize. The
-		   target expects this.  */
-		fail_unless (p1 != MAP_FAILED);
-		fail_unless (p2 != MAP_FAILED);
-		fail_unless (p3 != MAP_FAILED);
-		fail_unless (p4 != MAP_FAILED);
-		fail_unless (p5 != MAP_FAILED);
-		p = (uintptr_t) p1;
-		D(printf ("p=%x\n", p));
-		fail_unless ((p & pagemask) == 0);
-		p = (uintptr_t) p2;
-		fail_unless ((p & pagemask) == 0);
-		p = (uintptr_t) p3;
-		fail_unless ((p & pagemask) == 0);
-		p = (uintptr_t) p4;
-		fail_unless ((p & pagemask) == 0);
-		p = (uintptr_t) p5;
-		fail_unless ((p & pagemask) == 0);
-
-		/* Make sure we can read from the entire area.  */
-		memcpy (dummybuf, p1, pagesize);
-		memcpy (dummybuf, p2, pagesize);
-		memcpy (dummybuf, p3, pagesize);
-		memcpy (dummybuf, p4, pagesize);
-		memcpy (dummybuf, p5, pagesize);
-
-		munmap (p1, len);
-		munmap (p2, len);
-		munmap (p3, len);
-		munmap (p4, len);
-		munmap (p5, len);
-	}
-	fprintf(stdout, " passed\n");
+    void *p1;
+    void *p2;
+    void *p3;
+    void *p4;
+    void *p5;
+    uintptr_t p;
+    int i;
+    fprintf(stdout, "%s", __func__);
+    for (i = 0; i < 8; i++) {
+        size_t len;
+        len = pagesize + (pagesize * i);
+        p1 = mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p2 = mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p3 = mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p4 = mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        p5 = mmap(NULL, len, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+        /*
+         * Make sure we get pages aligned with the pagesize. The
+         * target expects this.
+         */
+        fail_unless(p1 != MAP_FAILED);
+        fail_unless(p2 != MAP_FAILED);
+        fail_unless(p3 != MAP_FAILED);
+        fail_unless(p4 != MAP_FAILED);
+        fail_unless(p5 != MAP_FAILED);
+        p = (uintptr_t) p1;
+        D(printf("p=%x\n", p));
+        fail_unless((p & pagemask) == 0);
+        p = (uintptr_t) p2;
+        fail_unless((p & pagemask) == 0);
+        p = (uintptr_t) p3;
+        fail_unless((p & pagemask) == 0);
+        p = (uintptr_t) p4;
+        fail_unless((p & pagemask) == 0);
+        p = (uintptr_t) p5;
+        fail_unless((p & pagemask) == 0);
+
+        /* Make sure we can read from the entire area.  */
+        memcpy(dummybuf, p1, pagesize);
+        memcpy(dummybuf, p2, pagesize);
+        memcpy(dummybuf, p3, pagesize);
+        memcpy(dummybuf, p4, pagesize);
+        memcpy(dummybuf, p5, pagesize);
+        munmap(p1, len);
+        munmap(p2, len);
+        munmap(p3, len);
+        munmap(p4, len);
+        munmap(p5, len);
+    }
+    fprintf(stdout, " passed\n");
 }
 
 void check_large_anonymous_unfixed_mmap(void)
@@ -135,52 +133,54 @@ void check_large_anonymous_unfixed_mmap(void)
 
 void check_aligned_anonymous_unfixed_colliding_mmaps(void)
 {
-	char *p1;
-	char *p2;
-	char *p3;
-	uintptr_t p;
-	int i;
-
-	fprintf(stdout, "%s", __func__);
-	for (i = 0; i < 0x2fff; i++)
-	{
-		int nlen;
-		p1 = mmap(NULL, pagesize, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		fail_unless (p1 != MAP_FAILED);
-		p = (uintptr_t) p1;
-		fail_unless ((p & pagemask) == 0);
-		memcpy (dummybuf, p1, pagesize);
-
-		p2 = mmap(NULL, pagesize, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		fail_unless (p2 != MAP_FAILED);
-		p = (uintptr_t) p2;
-		fail_unless ((p & pagemask) == 0);
-		memcpy (dummybuf, p2, pagesize);
-
-
-		munmap (p1, pagesize);
-		nlen = pagesize * 8;
-		p3 = mmap(NULL, nlen, PROT_READ, 
-			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-		fail_unless (p3 != MAP_FAILED);
-
-		/* Check if the mmaped areas collide.  */
-		if (p3 < p2 
-		    && (p3 + nlen) > p2)
-			fail_unless (0);
-
-		memcpy (dummybuf, p3, pagesize);
-
-		/* Make sure we get pages aligned with the pagesize. The
-		   target expects this.  */
-		p = (uintptr_t) p3;
-		fail_unless ((p & pagemask) == 0);
-		munmap (p2, pagesize);
-		munmap (p3, nlen);
-	}
-	fprintf(stdout, " passed\n");
+    char *p1;
+    char *p2;
+    char *p3;
+    uintptr_t p;
+    int i;
+
+    fprintf(stdout, "%s", __func__);
+    for (i = 0; i < 2; i++) {
+        int nlen;
+        p1 = mmap(NULL, pagesize, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        fail_unless(p1 != MAP_FAILED);
+        p = (uintptr_t) p1;
+        fail_unless((p & pagemask) == 0);
+        memcpy(dummybuf, p1, pagesize);
+
+        p2 = mmap(NULL, pagesize, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        fail_unless(p2 != MAP_FAILED);
+        p = (uintptr_t) p2;
+        fail_unless((p & pagemask) == 0);
+        memcpy(dummybuf, p2, pagesize);
+
+
+        munmap(p1, pagesize);
+        nlen = pagesize * 8;
+        p3 = mmap(NULL, nlen, PROT_READ,
+                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        fail_unless(p3 != MAP_FAILED);
+
+        /* Check if the mmaped areas collide.  */
+        if (p3 < p2
+            && (p3 + nlen) > p2) {
+            fail_unless(0);
+        }
+
+        memcpy(dummybuf, p3, pagesize);
+
+        /*
+         * Make sure we get pages aligned with the pagesize. The
+         * target expects this.
+         */
+        p = (uintptr_t) p3;
+        fail_unless((p & pagemask) == 0);
+        munmap(p2, pagesize);
+        munmap(p3, nlen);
+    }
+    fprintf(stdout, " passed\n");
 }
 
 void check_aligned_anonymous_fixed_mmaps(void)
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 0992787d50..050cd61c1a 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -18,15 +18,6 @@
 # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
 EXTRA_RUNS =
 
-# Hexagon has 64K pages, so increase the timeout to keep
-# test-mmap from timing out
-ifeq ($(CONFIG_DEBUG_TCG),y)
-TIMEOUT=800
-else
-TIMEOUT=500
-endif
-
-
 CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
 CFLAGS += -fno-unroll-loops
 
-- 
2.20.1


