Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088203C2667
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:56:46 +0200 (CEST)
Received: from localhost ([::1]:56262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rvp-0004tf-1v
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdO-0004nO-BF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdJ-0000Dk-8I
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id k4so6154189wrc.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zx6fx7Pip4aXrkap6Yt3wuj5u2/wTlufg0YMoYBwslY=;
 b=WQ6e2nPJS/sbG2EAWOhNKjEG72dP9pLcPU5oCaM1Rgdawtrlx5i7Ae4Y49KYHmVMXD
 FPHogKmHQiaFGToA8QWm+uVS8AO+cEWrQ7q5IXJ62E4ETRXUUnmPL0fZHjBTYmuyO3N9
 b72Dl7fYggoNL7NrvwrYZmjDP3/sLkWhX9nFvgS7EDAhX2Tmz5FmGwEG9xIqv3rHbxa6
 +bvqJhK9REF6IA5e9dD+PZb+t60CVGI5AknJjhiiJ4LvdMgq6b1lCt0uHxEfXBt+Gikv
 vcohMDy+iYbfjyaPLTaEv+De8SXCPxqZ5PXxgzHLgXyyMC8lVGPN5j1v42qz4Qj5a3Qx
 gXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zx6fx7Pip4aXrkap6Yt3wuj5u2/wTlufg0YMoYBwslY=;
 b=i/n0HgSIhhylVct/YkGQmNR8DAD9sjv79dZ3xiKObx9id/WnznQfQhZK5QdL3plXWx
 rR8eaw2v53FqdksO3tHPe0O8s7XyoJd/Lb90cPQKJaqcIeiRunvTIjBGEIPml/2nkpBp
 WjOefp79S6sgrAMkGHc2U/K9QzqFmSeOSID0p5DSoCLXx9SckhWYupF4PiWYcdY5cVLm
 N88AKfAIV0ed3GdIcr0jOBo2jrFP69SBn7aKrdeBxtAEOIqf5x5uj+06hobgE3doqelA
 i4XlrGjOBhV4FXBb0gTG9gDyb64rCJwBVS7izmAWZzrsims2aRbg5KGkM2N75rbUOf0J
 kirA==
X-Gm-Message-State: AOAM5314t4EvCZoE6gaVSXPPKuUGF89AuK9K1G9PDZT34Ar0UI1J779V
 SEQi1eaZIAibyOzR+tx456LEkA==
X-Google-Smtp-Source: ABdhPJx7oIbpm11v4I9hkWmsh8lm3K58Naj027PU8hfct7NSIK+W9DNJ+VnAJFohGH2mVzIlty7+jQ==
X-Received: by 2002:a5d:48c6:: with SMTP id p6mr42032057wrs.45.1625841455741; 
 Fri, 09 Jul 2021 07:37:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 11sm7441712wmg.40.2021.07.09.07.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7E3B1FFAE;
 Fri,  9 Jul 2021 15:30:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 26/40] tests/tcg: make test-mmap a little less aggressive
Date: Fri,  9 Jul 2021 15:29:51 +0100
Message-Id: <20210709143005.1554-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, aurelien@aurel32.net
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

---
v3
  - style and whitespace cleanups, reduce loop even further.
  - remove hexagon timeout hack
---
 tests/tcg/multiarch/test-mmap.c   | 208 +++++++++++++++---------------
 tests/tcg/hexagon/Makefile.target |   9 --
 2 files changed, 104 insertions(+), 113 deletions(-)

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


