Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8D3C5C87
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:43:08 +0200 (CEST)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vH9-0005mW-Du
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7I-0004hQ-On
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7G-0002Im-Lt
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id d2so25437909wrn.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6c/2UKBKcmwZO3rKn9f4u9KmPaZeHBM5vy4ozHzctY=;
 b=u6HTZ5YExTncGSR+Zpwn6zpVJmQy38nueXIkpCEA76swjBzDJBEp1bS6/knghXdO9J
 3FFb7eP26acStmSIgygKXQHoAEcbddvnK0EKclbR/z0VDMRJXcGOAVtEjbnWrj9/Mg3x
 kFqPzAPEXApQXa+OaFsHmm+Esbn1N/YprCB1VzsaRj74QeUcJsA2+5iUUug+ZegUwOFi
 CMOHuvuiQBPrwj38KZ53ZPmbtdnHY0YzlWdMgIWrPp1EIFPGzckXPiBU+RPO1k/mkd+Q
 fFraGK22psvkS2n974iBC1JZcamEIZ/Lt/NpXxdCeamAi07ou8rBKPq+33uDgeFnqVbA
 dd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6c/2UKBKcmwZO3rKn9f4u9KmPaZeHBM5vy4ozHzctY=;
 b=m5ZzicgwsuOArFj1WHvurgrxFqruKjT0JQ5jv7sQnCJM9XRtMKqokZMIIoM/5OGk2b
 Tsqybv0O6J6ly6pFjJF+kqcDpAnMoUY287wE1xuiGda5/RDlt+eCjbBpt5EgN0phN708
 wbsZwCyL3CBXYGiNo2DjZ9fIQFjLlzguNMC/8SwE6r3fvaMCX8HeEWLBpAx7/Qvf+GwJ
 tMsNdnK2Gd8Rlp2IIp114s2Ouxtg0a685BC2yi1X2qbOtH5rkhpGeAl2w38tTQpxSYrT
 oEv0waY3DX/g/47CBIKYTJjvzGzJlEaKbqSn/NbLvygZmRA9xeFL9wiunj6IS73dRtuu
 nsbA==
X-Gm-Message-State: AOAM532FtM70fLMW5zo+2gxxryDuaEeWV4DDaXvoIiU7IITs7neWCUiv
 XWrQ3INHuxTEXdiU5jbaWp+SAA==
X-Google-Smtp-Source: ABdhPJx8gpJ0UbRkIMORyoziGP6aCjHggbIuDxFeWROozP1sk+T2ZnxpPibD1k9V5TAn5g2I1Fuhsw==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr40391139wrg.65.1626093173327; 
 Mon, 12 Jul 2021 05:32:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v2sm4343790wro.48.2021.07.12.05.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C0DD1FFB1;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 26/40] tests/tcg: make test-mmap a little less aggressive
Date: Mon, 12 Jul 2021 13:26:39 +0100
Message-Id: <20210712122653.11354-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


