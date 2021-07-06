Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6663A3BDA40
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:32:41 +0200 (CEST)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n3v-0001h0-QB
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfI-0005Nn-2H
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfF-0007A0-HR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id d2so2833216wrn.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1h84YElBs0lvJoVGYIgs0VI8lqeK9O8muT/nnP9fJ6Q=;
 b=MfgABMvmaqVxUuAF5tu39k+ZssGDi6H6fx9AaroqhAVkUkJM8lPHiAsGxEIFE4X3hZ
 df9XOCFqPs0OHnJQ9mWTMEAXT86Yv1I+Z9/pLlbdELNbQFcwBORF2/C4fnyB1e1xteWw
 SSc8GARJ3L6E0+XxmCFyhX6eg4dJ5ttaSi7OyNDv9Ue124gHUgAoL9cJU3ZhTx1lyD9+
 1/x0QlQNwuFbZOoVqmN6P1Gqu4E4h3R2ctKulnWtgzkEkFSrJGft49VP1+rt/XqjmmcO
 0ZM27RVNNCHeUEh+EoAl3+N6BG3ArTGwtrV5WnSjxH1A9G79OhP2c1BrYqB4mZRhUkxh
 dckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1h84YElBs0lvJoVGYIgs0VI8lqeK9O8muT/nnP9fJ6Q=;
 b=CkZEPZupzSa+xrNohpd6SU/5SENxvY/8CG3r+GAJKi9lBN+ybG92A6o53MJETluiLo
 gvaPQCiYQWQX0cASsbaadcoHm1QRuGchA2/MZ01C8c9F8qh+vufqAbxsLUpZU7ebRRla
 oUrzVNx4LCvV9/oL4BUe6q24f0YBAKGYJilxAoWTkhN+XwWwCEhhZphCTKDyu3NMR+eT
 ENw4nKkfMezvkgmrfdL8Y6ogEhRwtGAGNdwqkc8Y24knu0z+sihNPXg0c2jdeb76AKqy
 joLjRku1JQjXAqxZFEX5eqRTuNQWf9jKIipN4EMwLoN1brugsOutlCJ62ubVH2TJbLMo
 06tg==
X-Gm-Message-State: AOAM533INq+/2wUKKHpILdj0bRGKR6JrJpxmpoK6hHLJF65vjPhR/jR6
 mUw4ZOCExw/YSmC+quKQnGIQ0o5DI/j3FA==
X-Google-Smtp-Source: ABdhPJz4A5i9aXSAhBwPOLiRW1eFZCIppSPHJjV4kB8E0qvi/ArbNwF+yNng1E1kQADYF8HG+OxG1g==
X-Received: by 2002:adf:f710:: with SMTP id r16mr20807316wrp.124.1625584027743; 
 Tue, 06 Jul 2021 08:07:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm1539983wru.6.2021.07.06.08.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A30A61FFAF;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 26/39] tests/tcg: make test-mmap a little less aggressive
Date: Tue,  6 Jul 2021 15:58:04 +0100
Message-Id: <20210706145817.24109-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check_aligned_anonymous_unfixed_mmaps and
check_aligned_anonymous_unfixed_colliding_mmaps do a lot of mmap's and
copying of data. This is especially unfriendly to targets like hexagon
which have quite large pages and need to do sanity checks on each
memory access.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/test-mmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/multiarch/test-mmap.c b/tests/tcg/multiarch/test-mmap.c
index 11d0e777b1..b77deee37e 100644
--- a/tests/tcg/multiarch/test-mmap.c
+++ b/tests/tcg/multiarch/test-mmap.c
@@ -58,12 +58,12 @@ void check_aligned_anonymous_unfixed_mmaps(void)
 	int i;
 
 	fprintf(stdout, "%s", __func__);
-	for (i = 0; i < 0x1fff; i++)
+	for (i = 0; i < 0x1ff; i++)
 	{
 		size_t len;
 
 		len = pagesize + (pagesize * i & 7);
-		p1 = mmap(NULL, len, PROT_READ, 
+		p1 = mmap(NULL, len, PROT_READ,
 			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 		p2 = mmap(NULL, len, PROT_READ, 
 			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
@@ -142,7 +142,7 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
 	int i;
 
 	fprintf(stdout, "%s", __func__);
-	for (i = 0; i < 0x2fff; i++)
+	for (i = 0; i < 0x2ff; i++)
 	{
 		int nlen;
 		p1 = mmap(NULL, pagesize, PROT_READ, 
-- 
2.20.1


