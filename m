Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C03173C8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:57:45 +0100 (CET)
Received: from localhost ([::1]:52248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yQb-0003Wm-0l
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqS-00071Q-Dd
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqI-0006rY-OJ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:23 -0500
Received: by mail-wm1-x32f.google.com with SMTP id j11so3203819wmi.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HGyTKfyrMC02NQIDciJuv0x1b/kxlzbJP/1nTgEUSN0=;
 b=gR/uZKibyVFlrqalLm+DNQ7QTCzXkJqMl4ixYc8w1+ZU1CYThBDMbBUo5Bh97jxceH
 olwGv99ZTFoQxukoCi35pUBZNvvjRCzPOvLso6tcMNys0I3QIqx5zM2UmjXe0x2qQeKd
 lyba2kcKoDUN9jhFa29MbjHBwUMSL4to3qU2wwAHrp+rojFhFdVvbIOxO9lcYH1Ttc9O
 qdkjuEwok/xGKcoFXVVM/kUrbY/j/M7Zn993+zS5vcJFLQ+lATMuhMgAr/AJMyfkFop8
 /zwEjKO+oRo2QNoR6+OICuGFYi20TJ8aU3eea5IfzVp77HCUrMVkE7+Q4ZiRMhozorvs
 ZICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HGyTKfyrMC02NQIDciJuv0x1b/kxlzbJP/1nTgEUSN0=;
 b=WNbnQQdn03YIq/Ns1ySLaBsKmCQwKHiVnBUatUJkYnxXoXyC652/e+tfcyQ07fknJc
 TMIe10GX/U4Z+6lSvKDycDbMrOlN88ADsCr5rL9wOsC5YgwoYgNcWtsULgQ1QjWI1jNm
 aXGtsFqr0WgQzFRuZ1U/eKA5OkCESYIV5CvMINZ+t3JqZfFaA/Ot2ZGpuidipuAvT17D
 +rgbmXeA3ti2aP5wc+f9IfQh/ITahVCj1VvxueWlXZ2D9QqO+DkxnZnCaGYmykZlBYfG
 YX/Bd6Mxgyh1mjISfFIgz5EnxSCpklo9YMMmkTQ3+ALqrEnOHQsc7C87C9zHZMZq56FT
 HXKA==
X-Gm-Message-State: AOAM531pm7IMGTFoQVCE6RLWaYXxoncLq9HMJx7dW1bw35GIciCi/mbB
 CTOX0aLnRQNFzjIKSi8c5mBDjg==
X-Google-Smtp-Source: ABdhPJwBDy0Ky3RWW7bCjsfCHHKsgH3cWh6uN4fPYUmPVcRGTgpQlLnGRsgegWsvAbFZH+u+v05j2Q==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr1219378wmc.152.1612995613038; 
 Wed, 10 Feb 2021 14:20:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 17sm4871093wmf.32.2021.02.10.14.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:20:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2AD7C1FF9F;
 Wed, 10 Feb 2021 22:10:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 16/21] accel/tcg: actually cache our partial icount TB
Date: Wed, 10 Feb 2021 22:10:48 +0000
Message-Id: <20210210221053.18050-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we exit a block under icount with instructions left to execute we
might need a shorter than normal block to take us to the next
deterministic event. Instead of creating a throwaway block on demand
we use the existing compile flags mechanism to ensure we fetch (or
compile and fetch) a block with exactly the number of instructions we
need.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210209182749.31323-8-alex.bennee@linaro.org>

---
v2
  - drop pointless assert
---
 accel/tcg/cpu-exec.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d9ef69121c..5b6a4fe84b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -730,16 +730,17 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
     /* Ensure global icount has gone forward */
     icount_update(cpu);
     /* Refill decrementer and continue execution.  */
-    insns_left = MIN(0xffff, cpu->icount_budget);
+    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
-    if (!cpu->icount_extra && insns_left < tb->icount) {
-        /* Execute any remaining instructions, then let the main loop
-         * handle the next event.
-         */
-        if (insns_left > 0) {
-            cpu_exec_nocache(cpu, insns_left, tb, false);
-        }
+
+    /*
+     * If the next tb has more instructions than we have left to
+     * execute we need to ensure we find/generate a TB with exactly
+     * insns_left instructions in it.
+     */
+    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
+        cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
     }
 #endif
 }
-- 
2.20.1


