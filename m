Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586B47C4C1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:12:27 +0100 (CET)
Received: from localhost ([::1]:41204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzigb-0007Si-7D
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:12:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJC-00014e-2T
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:14 -0500
Received: from [2607:f8b0:4864:20::1032] (port=34536
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ1-0007f5-Ac
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:13 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so2365064pjc.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtulYz0vZ5KnXAsfRYqp5VTF0oSZb47z69E1p8MpidQ=;
 b=tv6V0O3fpElQYZGFQcY/jgwB8BAyP/RpdYjZJ6IOF7Jt9m8F8bpC2ky1tZG01a/cNl
 I9LD2ZG72yRXn7yh+ymOK4JixE1LPmDDJRKO2X4YjzRelfnR5HKUQrgJdmttbMB65AMO
 aylpirK1D4kcuVYF8YC35/1dRg2g/jc6l3saN2cXUoUdRorZ1gx/I+LJ5ZoOan8XLNMJ
 AE9XgxqPrpUPV7XKJBnKX+BFsVoU35dY1nCmEWjVhZwOXCnwPm7Sd/z6QDLmViXGZKKx
 o7qchZ0d1V06yOKwMKfm2f4HQkMkGBHCMYPXDahN72sJWny5a/LBMIM+v55mFcSNC1ex
 SgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtulYz0vZ5KnXAsfRYqp5VTF0oSZb47z69E1p8MpidQ=;
 b=F/nFkvF2j1TroELRvO1SX4FDuZttWlfqzKpOBYsJ7iwsiL6B69+fWdlCNOfH4LUPZw
 we5Qu1wfWO1AJKm0UEjYFzN0VFB1R3AYJhPfDr3kSHbknUUSLV2IS/7bH2ou5KP3csdN
 U82axKlTnktUkHCbPczti0EHjntHz6vtQ8H7D+DqJSikIZc4//F4QUeIe6q6vGlJ6E5u
 YsD4Zk+GT2121pwgCexlGK0dVXK1lfJVFD9Zzop89oq/Ld322A3si71YSqCLPl/Gc66m
 sMmn2inOEuBJTziaj5RNiWiWANbwkYGj6dq3jem0oCfxb1ND+DtXNGHN/vsqMNp61tGb
 ei6Q==
X-Gm-Message-State: AOAM533t6xGUigSz9LyNSJwDQXrE3CpB7ONanGeyZ6SzoWFlPXx3zo3A
 fcN3WwfhsQzvWEwn2jJEUo7WYBL6lV152A==
X-Google-Smtp-Source: ABdhPJxLqsRiHl9z7PdlmN2fIgvSSufsc65GivrSA42iznfRfYXG7SMDxeZlIQIoowPIYw5VSllNMA==
X-Received: by 2002:a17:903:1cf:b0:149:b6f:4e98 with SMTP id
 e15-20020a17090301cf00b001490b6f4e98mr4199167plh.118.1640105281913; 
 Tue, 21 Dec 2021 08:48:01 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/31] tcg/loongarch64: Implement exit_tb/goto_tb
Date: Tue, 21 Dec 2021 08:47:31 -0800
Message-Id: <20211221164737.1076007-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-26-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0b7d6458c5..92a30b791a 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -980,6 +980,25 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
+    case INDEX_op_exit_tb:
+        /* Reuse the zeroing that exists for goto_ptr.  */
+        if (a0 == 0) {
+            tcg_out_call_int(s, tcg_code_gen_epilogue, true);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
+            tcg_out_call_int(s, tb_ret_addr, true);
+        }
+        break;
+
+    case INDEX_op_goto_tb:
+        assert(s->tb_jmp_insn_offset == 0);
+        /* indirect jump method */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        set_jmp_reset_offset(s, a0);
+        break;
+
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
-- 
2.25.1


