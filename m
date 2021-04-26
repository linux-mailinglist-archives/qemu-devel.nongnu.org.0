Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AB536AAF5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:08:23 +0200 (CEST)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1larbi-0006nG-NP
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNq-0008Au-Nn
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:02 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNj-0007cs-70
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:02 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n10so16989650plc.0
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=czFZI/NFQntzpjxoTjv678VOeQ01AF5BMV5dgR6vLHY=;
 b=gF4y+2hvbJcjf9qwhvVtqH3iUAVH6ow8Bju48DBUwffmpefn4OhXnsRfomMU2oyM7n
 a7h2hMFsqmMZ6lTIe6vQzFFo3uBkdAFJcoGJz6VzMXsVwRTvm4jPzksy9wV8FroNBU3N
 uLxgB0oV55bGSLTFw9h0VNMbQ82A/Uwu8qk42df7Ps3eg15w8sAgi6yaAX7+zIx//93u
 Hjgh3jCb3w+ciiJLYSqyFU+JS+CD/ZDV/ghRT/nwJfOzkslaWlOA76MiLA/xvtsK6sA8
 eHyHJ2ZAGI8G+P7pca/Ty4Ch+Vc6Fg5FiLNkaHeoH1xCXssH+k9nAIktipMDhe8xK2W7
 jGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czFZI/NFQntzpjxoTjv678VOeQ01AF5BMV5dgR6vLHY=;
 b=VZWPP1yAhTPsAQzszNmfrTcCUykR5Yjymg4pFS/VsAh+NjGSEEvdnHJgh7Ns62nWey
 bTOK2PmLEdNlXzYKQN/ie4cRzbBpD69+gkIoIa0fMn8S0+bMv/WrLeQFrQTEKAszRexC
 arVPMBCo6id4GgyI7UdatIwnQUTkd5N6bhnk5VtCXjZeM/xCa7Z+9xAclktOI/yx+DyR
 yIsgu1L+VVYFIVwf715An+gcHAZL03l9riQEMov4wEnXBy2l8JdrO/zu85oPlgtnP26v
 ciEYdn1aqXIx37wSScd04yzEmLqZWmwMVN6/2KH2WLR47P/SCaw4HjLJ8d2IJdLLDLhg
 yC7Q==
X-Gm-Message-State: AOAM5320qi2P59dm6Vjg056BbM8pxs5x3t/qQdnw2vZj/w6FAQIo+J56
 bs3HOtFj+dKZ4odAKDer7a9xzd3tYJjFTg==
X-Google-Smtp-Source: ABdhPJyU8kc82mwiJmn+MG7bnqrlhLb4mOqbbZqZ2vjvOK17z8icOn02PRX/ImYhPkQuu6A4Hicezg==
X-Received: by 2002:a17:90a:c28f:: with SMTP id
 f15mr1233676pjt.30.1619405632042; 
 Sun, 25 Apr 2021 19:53:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/25] tests/tcg/sparc64: Re-enable linux-test
Date: Sun, 25 Apr 2021 19:53:34 -0700
Message-Id: <20210426025334.1168495-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It passes now that we support signals properly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/sparc64/Makefile.target | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/tcg/sparc64/Makefile.target b/tests/tcg/sparc64/Makefile.target
index 5bd7f90583..408dace783 100644
--- a/tests/tcg/sparc64/Makefile.target
+++ b/tests/tcg/sparc64/Makefile.target
@@ -1,11 +1,6 @@
 # -*- Mode: makefile -*-
 #
-# sparc specific tweaks and masking out broken tests
-
-# different from the other hangs:
-# tests/tcg/multiarch/linux-test.c:264: Value too large for defined data type (ret=-1, errno=92/Value too large for defined data type)
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
+# sparc specific tweaks
 
 # On Sparc64 Linux support 8k pages
 EXTRA_RUNS+=run-test-mmap-8192
-- 
2.25.1


