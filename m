Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CE442741D
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:20:40 +0200 (CEST)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzAN-0008Tw-Hn
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5K-0008Rt-MX
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:26 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5I-0006gL-MA
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:26 -0400
Received: by mail-io1-xd2d.google.com with SMTP id n7so3565927iod.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06eB4JezVTDOp6PNsNCkhgYjdtZ/snCLoQwHZu1R2oc=;
 b=r6SEq8zJcw7wt2jRlFbujSBNajeMDsuKcvnh9Sv5sJqMrLnh8zvBhe+E5d1qn1T3qO
 LA3HxOaNmWCjCClgnQtp7vrhLzl3ZMNhk5+xdbjGauqZP9xeOhH3BP7RceXRbidXYatc
 xXSY3i4UQsed0NG/bXZeT5lA5/UDQGsbMMm12ZVtccgMJwSN3Bby+R7I7l+e/bfz3sCG
 l5XwgEk/Q5S6MfekNgrIrr7j79TJ0tK/Bq1qNT/+7EMcqVdaaCXS+oK99nzEt7lqB768
 lMYXcALkqquPyHhZ1pj1sX39uVJb8Zh1lx5wqv1XoeoJi0027dCMs0qyXODyWAkeeUKw
 81ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06eB4JezVTDOp6PNsNCkhgYjdtZ/snCLoQwHZu1R2oc=;
 b=6cx2tv0Z3HsTlynjiN+2PbqlHH59NyWXXPYPjUc7TjyLNqqMnOJmsrF4XiEe2fhgXv
 2sCG84yV2UodN8hsNUHNyIgpuFsCQceJQprnOV+NPsG6UYnDkwGoTjDcvj1leLkFD9Uk
 3au2xZdTkZ1h08/YadpjWjt/qdXkrK0ACRH1nWq3uTDecUBWXlwBwcFbZb1sfUUEsyzN
 /L0tjTzSzj4UFJnH6U5jy5V4V0n/0JVO64a4wwcps+igz/fs+q64DciRhdnaRnBlSGpS
 QH8G8JOw3xjD82Z+GNb2liwXAT70i9hFWIb/t1BBbN/ZTDRlwUJ4I4a7lJYAxo/qExC+
 r+Jg==
X-Gm-Message-State: AOAM531Ofs2RqFHt1PVEY2kcLj8NcJ9e9J3QApbz4rD7c5YCw+pvHxgW
 likUE0VUSZ9bk8IBogdjXjVfUyjeNabtDA==
X-Google-Smtp-Source: ABdhPJxlA2iPTTq7l61NQ24aG1Rfd36rohpws5RyYclCBb41Ve1nnCN3EGn1Kzu0uaQQTx7gStGCTg==
X-Received: by 2002:a05:6638:1909:: with SMTP id
 p9mr9813960jal.108.1633734923215; 
 Fri, 08 Oct 2021 16:15:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/15] bsd-user: TARGET_RESET define is unused, remove it
Date: Fri,  8 Oct 2021 17:14:55 -0600
Message-Id: <20211008231506.17471-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/i386/target_arch_cpu.h   | 2 --
 bsd-user/x86_64/target_arch_cpu.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index 978e8066af..b28602adbb 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu32"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5f5ee602f9..5172b230f0 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -23,8 +23,6 @@
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu64"
 
-#define TARGET_CPU_RESET(cpu)
-
 static inline void target_cpu_init(CPUX86State *env,
         struct target_pt_regs *regs)
 {
-- 
2.32.0


