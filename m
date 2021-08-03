Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497A3DE5A5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:45:04 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmIZ-0002F8-Fm
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt8-0005mJ-EA
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt6-0005It-QM
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:46 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so1793491pjz.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZvnR6dmCENTgvfOhQCUhTTkcIQWTTdu6sE1/LbqswCI=;
 b=zWpWPKcc5DwaBpr14CUNEj7epZaavYNOmOUMHcj0w5b3cyYKETa/VCcqTdm8R91I3V
 t3ooMLVzPccRSHIXSp1myC078IPL4LiINwHJRndOD74LMMORCCAaFhO7vdHqb2WItibP
 JDD+3wRup/beAQIkifCTGLmYAxeGD/BNXyV0npPRTq/83yC2rK/M0lulguJwHctu8KZL
 pnVAd3jLFoyLB0hqCJiHPiyGPdhc2W87dHbBy819dz/kArgejZvT2dO/lU3il/DKHlII
 ssVXgv4d0nuhW2gel+kVJTEzGurFwiOJ6UY3gKIngp8qHNmLgbP6NsJJsteTJbqwHnSU
 DiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZvnR6dmCENTgvfOhQCUhTTkcIQWTTdu6sE1/LbqswCI=;
 b=J9tilZP9DTMYLg10Yexm05feHpYouWMNEqjGxOoZyvTURPBZkxLNaMvhwJAUEZuCBK
 0aDMho2JKmtAWCagWfvZq6pFm6tmP5ZNwJbSHzbNnkJfzEg2ElFk6T9Cqr5h+Fz0iI8a
 78jfcwe1Nca+Gh0JKadzGzOsMScYTEV4+ZDPZuBkC2UicogGGzHbwaY/b9yfSXOpldAa
 u2BdWwO7VGi6JpqkqodSgSXnS9phAAIt3yoDwCozrABAHYJJ7TWZdDuysrwJ1cTfVJdE
 bA54ZsBZKDaVvXHc9kYA/hInAztzqK7gB84jAn3lrnnRXfmDU0SWQMlRlHgJ+MfI1n/1
 jyBQ==
X-Gm-Message-State: AOAM533Tj+YLI45VPLwSGisxwUgLOD1FpfrjBgXdc0770Nu3KuJOYaQ5
 A9f+zatCShJFi/P3p+Xo/8UmMPAku9JTKQ==
X-Google-Smtp-Source: ABdhPJxQspRqWCejwQR+Qn3KTopjWtdVOymwa6Zx6QUfFIVf262YQX+0PKjjsWr/u2Q5hT8ql542cw==
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id
 w2-20020a170902a702b029012baa0fd553mr16874601plq.3.1627964323645; 
 Mon, 02 Aug 2021 21:18:43 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 48/55] linux-user: Add code for PR_GET/SET_UNALIGN
Date: Mon,  2 Aug 2021 18:14:36 -1000
Message-Id: <20210803041443.55452-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

This requires extra work for each target, but adds the
common syscall code, and the necessary flag in CPUState.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  3 +++
 linux-user/syscall.c  | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b7d5bc1200..088b2d1adf 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -412,6 +412,9 @@ struct CPUState {
 
     bool ignore_memory_transaction_failures;
 
+    /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
+    bool prctl_unalign_sigbus;
+
     struct hax_vcpu_state *hax_vcpu;
 
     struct hvf_vcpu_state *hvf;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e303a9da7f..b2e3c28b41 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6640,6 +6640,25 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
         }
         return do_prctl_get_tagged_addr_ctrl(env);
 
+    /*
+     * We only implement PR_UNALIGN_SIGBUS, and only for those targets
+     * who have had their translator updated to insert MO_ALIGN.
+     */
+#if 0
+    case PR_GET_UNALIGN:
+        {
+            CPUState *cs = env_cpu(env);
+            uint32_t res = PR_UNALIGN_NOPRINT;
+            if (cs->prctl_unalign_sigbus) {
+                res |= PR_UNALIGN_SIGBUS;
+            }
+            return put_user_u32(res, arg2);
+        }
+    case PR_SET_UNALIGN:
+        env_cpu(env)->prctl_unalign_sigbus = arg2 & PR_UNALIGN_SIGBUS;
+        return 0;
+#endif
+
     case PR_GET_DUMPABLE:
     case PR_SET_DUMPABLE:
     case PR_GET_KEEPCAPS:
@@ -6682,8 +6701,6 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_THP_DISABLE:
     case PR_GET_TSC:
     case PR_SET_TSC:
-    case PR_GET_UNALIGN:
-    case PR_SET_UNALIGN:
     default:
         /* Disable to prevent the target disabling stuff we need. */
         return -TARGET_EINVAL;
-- 
2.25.1


