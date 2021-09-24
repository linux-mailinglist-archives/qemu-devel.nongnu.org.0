Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BD417034
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:19:27 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiIg-0007Qp-Sz
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiU-00088j-12
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:42:02 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiS-0008U6-Lj
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:42:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d21so25384457wra.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lsD8NWGZdgfbGQhaRvFJOuKgMHvFJkt23n3sZARQWU8=;
 b=UwDdJkXdPu+UwIOLG7cF1DpN08NOVjUXh5QxZO3b8BlxRdAye0OJz2hLqKgxw0ZKDG
 PzPuRnVN0Hcwvs9ZnlPJBOVuyUiE5Wibc1gFbRerxlFnnfoCR6m5gcEaRGIRw6flshnx
 eKifOQnMKcSSPap9xcmf4wa0TYhT3HsYptzq8553VGvUn4ZHNZlKA4MnxYoP9K5hQV7R
 lLE/TCBgRrYvCvnP6+FbiCLac7cjuVYnGRwe7QyKDzOhYCfBflTL06U6GT3YPkIwozTj
 Kp3qDVZS0fvkxnYKCFUI2Ya3nOV56tP3mPcK8INiJEdk+MEH85+SQXa14dlfdHNGLro3
 Fycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lsD8NWGZdgfbGQhaRvFJOuKgMHvFJkt23n3sZARQWU8=;
 b=vzcRaPNiK+otTAzANYUaKtGYWipPLvqvdMcdoAX2XbKI7eBMzSdnw94jHO6DN1KmOV
 NvLjoh/Lv0gF2Tpmpo0nRzLTjYYSLuOQzHVM0j2ZPYhZ1o5sAJXlmNJYsRD2YLtmWxJn
 nWE4imCX0tfQ4sXuIC+6mAJR10Y2rH5Mkw5Jmwe9RY+AMmfE+l8qllV29A8cOVhxA6p6
 1MAkSXz7vCMV/pwH7BISY9HLjAdxZW0H92UyIcHMT2V1/Jqymwk/LIx9/65i+XvvKpJg
 XTXDLPEGY9Idc8UshXkuuE09djfF0wZiq6aaJvuYKei0v5WeEgM5tx8IpdC155BDiWw3
 oZTQ==
X-Gm-Message-State: AOAM531Y8yTZFk3BEk663Perh7tjC4glbJ1Y33D+ndBDBb59o69JPGUF
 IQAp3D+WH6YB4AmwFdFuBaH7LYSLhxM=
X-Google-Smtp-Source: ABdhPJwRCbd+wpqeirpoZIHuJdD3JA83d7V/aSnH6KC/kwAqhcT7iG/DayNhWUkLO3DFjrX2xrvT/A==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr10164901wro.99.1632476519278; 
 Fri, 24 Sep 2021 02:41:59 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 y7sm5082791wrs.95.2021.09.24.02.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 40/40] accel/tcg: Simplify tcg_cpu_has_work()
Date: Fri, 24 Sep 2021 11:38:47 +0200
Message-Id: <20210924093847.1014331-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All TCG targets implement the TCGCPUOps::has_work() handler.
We can remove the non-NULL handler check in tcg_cpu_has_work().

Add an assertion in tcg_exec_realizefn() for future TCG targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c      | 4 ++++
 accel/tcg/tcg-accel-ops.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed34222..18c20e5759b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -993,6 +993,10 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (!tcg_target_initialized) {
+        /* Mandatory non-NULL handlers */
+        g_assert(cc->tcg_ops->initialize);
+        g_assert(cc->tcg_ops->has_work);
+
         cc->tcg_ops->initialize();
         tcg_target_initialized = true;
     }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 3c75ed2cccc..6cd32f04cb9 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -78,10 +78,7 @@ static bool tcg_cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->tcg_ops->has_work) {
-        return cc->tcg_ops->has_work(cpu);
-    }
-    return false;
+    return cc->tcg_ops->has_work(cpu);
 }
 
 /* mask must never be zero, except for A20 change call */
-- 
2.31.1


