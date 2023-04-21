Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0C6EA31D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:27:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjGK-0003s8-GY; Fri, 21 Apr 2023 01:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjGG-0003jJ-Mp
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjG6-0001h8-7X
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso1173371f8f.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054672; x=1684646672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdSz8sfGXerLHj+//5JckNuHJl54BMlu1Fr23wWAZHo=;
 b=Z7UJ0f1Tbf7Wyk4+SSNvn+A5E0jlQL8tDtesC2SiUeW6baNvbKgP3TjhUGuaxvjewo
 90U0oMljMpj2DC3j1zF0IhNYOZ5LT/CVRiLDKQjnrOu0gMLC8m7OF1iSXpxUlhytP+WB
 rZEqH1gm1VTKCivA9EvKRThcBhoGPWfwtWFDOUTRFhASuySc2CyqHYvY+srdxv/5PDTB
 sdNMJWeISNjUXxumMjLMdY28ADnMBQqNU2WXz2KSztW7VtPy9oM0sV8oMBj4x2CZ0SNs
 +y6kh1TRt3pNlfZp+3B9i66G5cr8LtXk0urbPINdqSvl4yy5Obc+LCUw3nid0B+S+Zsw
 ryQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054672; x=1684646672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdSz8sfGXerLHj+//5JckNuHJl54BMlu1Fr23wWAZHo=;
 b=edINXPDQAX+EywTpE8pu+UNkVj5v3gF51yXA9uIqTJ+grcdGs5947GKG4SworNgkGb
 kM4nJyw2HHcGH2gDRUVNdKRGUvyQePSN7q8mLj81r61bzuuBQeTipT3ay1UCX6cI+jDJ
 HRBSm2TJqb1QLs/rd3bmzqMPV1azZ65srpwHkzQb2LKoXHFcadqovZlJMOKzxMe9QOYN
 eN7oeXxufSNhp9MUXl74g3Sibjg61Wdgui1SrKqPSjIKjpDPHrh1GggaiuvJkaaeqErQ
 8cTyvTf/xKIRv7PLbGfFhJFxq9VKmTgUS7vBxwGA/vq8TAyqGe8SSU0OFvVLdRHto3x6
 ZVGA==
X-Gm-Message-State: AAQBX9dNm6i5jMI9AED652B5qAxK3h/5Xu4rEAh0fFzPoT/54/1i/qXp
 nMq3vWTwI/K/bvllgbFdXp2r9uo5Rm4=
X-Google-Smtp-Source: AKy350ZDl8cAWyHbFuXuVlc/HYH7jLTRShXkpiuJ+K3z4BoMvcPL01KTa41j5HQQJagrCU88ua9ZxA==
X-Received: by 2002:a5d:6585:0:b0:2f5:953a:4f59 with SMTP id
 q5-20020a5d6585000000b002f5953a4f59mr2676085wru.5.1682054672566; 
 Thu, 20 Apr 2023 22:24:32 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:32 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com
Subject: [PATCH 11/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:55 +0200
Message-Id: <20230421052255.5603-12-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Warner Losh <imp@bsdimp.com>

added the bind(2), connect(2), accept(2), getpeername(2) syscalls to
freebsd_syscall function defined in bsd-user/freebsd/os-syscall.c
---
 bsd-user/freebsd/os-syscall.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c8f998ecec..7f29196a05 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -44,6 +44,8 @@
 #include "signal-common.h"
 #include "user/syscall-trace.h"
 
+/* BSD independent syscall shims */
+#include "bsd-socket.h"
 #include "bsd-file.h"
 #include "bsd-proc.h"
 
@@ -508,6 +510,25 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
         break;
 
+        /*
+         * socket related system calls
+         */
+    case TARGET_FREEBSD_NR_accept: /* accept(2) */
+        ret = do_bsd_accept(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_bind: /* bind(2) */
+        ret = do_bsd_bind(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_connect: /* connect(2) */
+        ret = do_bsd_connect(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_getpeername: /* getpeername(2) */
+        ret = do_bsd_getpeername(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.40.0


