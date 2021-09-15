Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809140CEF1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:39:03 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQccQ-00029n-Cg
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV1-0003Tw-Gf
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:23 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcUy-0003FR-VD
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id v19so3085090pjh.2
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtrRAfu5Qz6RZ7D6DQZXk+fHRvNXJBlXWfLYd+BVVxM=;
 b=TwNGrNDjAhC9Gf6/FAIu+8V/r6KNGL+JH4CMuC43kN34agdajwK5pVXYWfAuPmmZKU
 QpjQnv7o/1hNEWkRrF8a+wwTvdut1A3ird0mO5P6G5x+ioaVUQ3bIKL5FPS1MTXZdWdk
 Q9G5XAGM+jitlJbdlZiCBm6J4BtGhVQR0W8witxUzZpIF5EF1ZFjcinnDc0SBYAyuTnW
 +YXyYp3hczRqST0D0d5ZuPCNxFyn42p+TAhAT/RF5nlooBwDc/uP36o0zP7M1xmQsSj7
 MMn+9cgHAIxrsD4RBsG1qgrdb4/nsTOX+yezV3M1u2/YqV6JYSyBAVID6Tx9HR1UzZg4
 F0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BtrRAfu5Qz6RZ7D6DQZXk+fHRvNXJBlXWfLYd+BVVxM=;
 b=SNbSRMQ+2bYx1wq2xA5J53fwOPnSEJkatjA/2Ju+wIs2wiO1Tgw/gzqwuzej+b2AiR
 JyBpoBI/qIu9W0Bn+mRhX3j0sWwGY1Hz6wNpGxaceBEoAHFEtti+t+lnKT7CzDM6+CSo
 GtHsFBioGspV0y3dpTZceFkVMb9Qy2+LDD87vq2WNpFGcYtlwrKtTgPVrGyxN6oIwlGB
 UIQs//DM5oWUIZPCVr9ol4FXAIharmykbugR86u7fNYbTtQcU5EbF0dACW9F2wQa7Q3A
 /tmX2Sr7++REmj5vK/OeFp+bLZr0iM7fMsckMpXe4y6y7JXsy+mRjffP+9lL4LRk1LZm
 pTig==
X-Gm-Message-State: AOAM532gUkO4pSHa9AOg3UIsBLKSk4BNFIbnweC4oDEcFJLC/71n2v1v
 0+S5fr3cASC5a7oJ+11DTYkpknw/EXbCdw==
X-Google-Smtp-Source: ABdhPJwo7mDvOHIyu82XX92ZbxVacewnTm0U5a4R0DdvlfMUL5ZPCg+Z1kxAaoUUTwI2Mg08pbvztA==
X-Received: by 2002:a17:90a:e009:: with SMTP id
 u9mr1947512pjy.218.1631741479667; 
 Wed, 15 Sep 2021 14:31:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/16] tcg/s390x: Rename from tcg/s390
Date: Wed, 15 Sep 2021 14:31:00 -0700
Message-Id: <20210915213114.1923776-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This emphasizes that we don't support s390, only 64-bit s390x hosts.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                              | 2 --
 tcg/{s390 => s390x}/tcg-target-con-set.h | 0
 tcg/{s390 => s390x}/tcg-target-con-str.h | 0
 tcg/{s390 => s390x}/tcg-target.h         | 0
 tcg/{s390 => s390x}/tcg-target.c.inc     | 0
 5 files changed, 2 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (100%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)

diff --git a/meson.build b/meson.build
index 2711cbb789..1cf370ab56 100644
--- a/meson.build
+++ b/meson.build
@@ -265,8 +265,6 @@ if not get_option('tcg').disabled()
     tcg_arch = 'tci'
   elif config_host['ARCH'] == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] == 's390x'
-    tcg_arch = 's390'
   elif config_host['ARCH'] in ['x86_64', 'x32']
     tcg_arch = 'i386'
   elif config_host['ARCH'] == 'ppc64'
diff --git a/tcg/s390/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
similarity index 100%
rename from tcg/s390/tcg-target-con-set.h
rename to tcg/s390x/tcg-target-con-set.h
diff --git a/tcg/s390/tcg-target-con-str.h b/tcg/s390x/tcg-target-con-str.h
similarity index 100%
rename from tcg/s390/tcg-target-con-str.h
rename to tcg/s390x/tcg-target-con-str.h
diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
similarity index 100%
rename from tcg/s390/tcg-target.h
rename to tcg/s390x/tcg-target.h
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
similarity index 100%
rename from tcg/s390/tcg-target.c.inc
rename to tcg/s390x/tcg-target.c.inc
-- 
2.25.1


