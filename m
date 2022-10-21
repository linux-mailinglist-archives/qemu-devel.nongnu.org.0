Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C951607317
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:58:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnrK-0000F7-5I
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:58:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmIJ-0003iz-JT
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmI9-0003XS-HB
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:18:05 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmI7-0005wH-Rj
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:18:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f8-20020a17090a664800b00212464cd49fso2010687pjm.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PPW7RSSNm9yil/F5lJhRwPcfplDAlAe1JqivFknlUJ0=;
 b=KVx1hoYK9RucxTU5TRva3rsIRf8/C2gqKErQVQt04WFNvoKlU0O5zcN247LNvL4cWy
 3Dh/e0Ytl+zfRRAIjOAj3Bny0hhhmmjezkZSewBjdK4K2waBNuEZOynrtPpxTM4nOkL9
 3Ju5pjBJYtClYVF/kH0Yfc3huDBwiTTUM4UVyYz3QullshaV/Hoz3/TdsraGSoewsPll
 wPqTCpSA/wuCZzYcpS0iKePO1zMlTW/F1nlOpTS9UA9THLG0xdXkKkuRytLClScL66kH
 cWMrMbAhmu4ZAqoDSyTawBV+biiqqjqKoBeI4EDzewOu2ETuq35/u4GMspxwlvBDl746
 2KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPW7RSSNm9yil/F5lJhRwPcfplDAlAe1JqivFknlUJ0=;
 b=wL4c9D7cf1yJJ3df+Z3/150pKu++DI5/L8WV8Nkh7dk92IK/a6XtgiSc0xsLePaZMx
 Fy79PTFNqmEy3k/8fP7uwIrqBiGQpSfou+v5P6+j12dpCkTA1zP2TIxOHQp8AyADol9C
 I6bQJm3ZZ3lAU65hU4z0H/2bYBP53HuJ2KuLXKS/9UG150TC4WmCK7h/4nCex7pt9ClP
 gUTN8ix7877H4wVGTNTIwdv3laLs6Fk8oDEenGh6WTFIzyE+oOWfQeFkb9i6OKQ5NUj8
 lsHtGzJZlZeSzXwJ3NKRmF17EskktZRIix36KAtT6oFgxqCeuVVamOIvDZJIa/hPM/3Z
 nrMw==
X-Gm-Message-State: ACrzQf1GPXJ0f1jUHwOx0FYCzX0twawjZkLG9mVYgAXv4EPEZ7lCbNPk
 BwNJAUXWPoAi3KItachNJ9YFxmXSXPbq1UcA
X-Google-Smtp-Source: AMsMyM5ZoQq2aSEsCTy3gmTI3iC9W90MgOWYoVCLTJ1f0oFdRonvTfeX7G/hUjLHLFWBLOj1LSPIng==
X-Received: by 2002:a17:902:7d87:b0:17f:9cd0:2e03 with SMTP id
 a7-20020a1709027d8700b0017f9cd02e03mr17919783plm.164.1666336671798; 
 Fri, 21 Oct 2022 00:17:51 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/36] tcg/tci: Fix big-endian return register ordering
Date: Fri, 21 Oct 2022 17:15:45 +1000
Message-Id: <20221021071549.2398137-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We expect the backend to require register pairs in
host-endian ordering, thus for big-endian the first
register of a pair contains the high part.
We were forcing R0 to contain the low part for calls.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index bdfac83492..114dece206 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -521,27 +521,28 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 ffi_call(pptr[1], pptr[0], stack, call_slots);
             }
 
-            /* Any result winds up "left-aligned" in the stack[0] slot. */
             switch (len) {
             case 0: /* void */
                 break;
             case 1: /* uint32_t */
                 /*
+                 * The result winds up "left-aligned" in the stack[0] slot.
                  * Note that libffi has an odd special case in that it will
                  * always widen an integral result to ffi_arg.
                  */
-                if (sizeof(ffi_arg) == 4) {
-                    regs[TCG_REG_R0] = *(uint32_t *)stack;
-                    break;
-                }
-                /* fall through */
-            case 2: /* uint64_t */
-                if (TCG_TARGET_REG_BITS == 32) {
-                    tci_write_reg64(regs, TCG_REG_R1, TCG_REG_R0, stack[0]);
+                if (sizeof(ffi_arg) == 8) {
+                    regs[TCG_REG_R0] = (uint32_t)stack[0];
                 } else {
-                    regs[TCG_REG_R0] = stack[0];
+                    regs[TCG_REG_R0] = *(uint32_t *)stack;
                 }
                 break;
+            case 2: /* uint64_t */
+                /*
+                 * For TCG_TARGET_REG_BITS == 32, the register pair
+                 * must stay in host memory order.
+                 */
+                memcpy(&regs[TCG_REG_R0], stack, 8);
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.34.1


