Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF2433DC1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:49:07 +0200 (CEST)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mctEY-0004i3-2b
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFI-0000Uk-NU
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:49 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:37575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF1-0000ZG-3m
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:44 -0400
Received: by mail-io1-xd35.google.com with SMTP id m20so21052013iol.4
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGeY1cL3xNaPESfbUDMTLYMl8VTNvNtAa+jInbYxLI8=;
 b=32BhYA10gLry5vJ1oulUQbu5nWHIAajbv5IxxkWukwQpSCw3hfwvOBCqcnoI6/UoY5
 lazrxcNuyIGw6eam+ZJ9YWuCf4tqYvhN5RuzLDzJJqPy6HEVFh4xeahEhmSlJnQoUnPW
 bmZHWVyAAF44ISQo27dQmYZNEhSSoG1ylbVgws7JJchQFXBUQUfoz7Ar5NhP2PWEOvdD
 4NjL/gB00Pr1yv0Sh/j6K/i6v3jRic2pbSic3nUQ5N19pKpE3g9RUh0+6waD9ZbtpRGC
 x8wwBqRqEpujgujdxzRzkSzM4XgMrAq/oaO8EfejHVHInGjEV66qB3Fym3HFg4QHrWkd
 MNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGeY1cL3xNaPESfbUDMTLYMl8VTNvNtAa+jInbYxLI8=;
 b=qj2vQtBmgcBNHaYpv9p2gKrLsqB1jQMOrMfo5vWWOlfk4IWeuAdFOjtvHPopYmRnAv
 TayRoupyX/MKlisV5llYo6FMsKuOUcD0rWgCiGK6NLmiQuqUiV9cqW9f8VCmKjlH9G3M
 U0MlVrMmgWXCafjUYBIx8VlUM0r4CeI7rZBO4UB9IksbBtf0xVrEWXXDUECUdv5agT7l
 tBywa2ZX1U1pdHS7S1EgEfr7zXspqt0oO8VKmgCLzOJBKi5iLECPxJViRizlQxRLcoBu
 ZsmjI1B+3PRJkKrF/Ac8s1tv0X9y8fezGg85zKd8pM45QvtKF8JZzAdf9WUXpHq00nPN
 Rd3A==
X-Gm-Message-State: AOAM530KQFnilHg3nrTte6fdc5ggNGEHmclOxxKmPnkydD/YWdLpZUxL
 f/TNEeGHWrmKxSyVSVjJxY7mhxoY+Wxgrw==
X-Google-Smtp-Source: ABdhPJzP8E9QWHMMvial/gQolRcMyH0Z5SoEbOVifxBV8ZyLgE+ttWy+BkTk/b3SkeMaOJI1lLZP3A==
X-Received: by 2002:a5d:8c83:: with SMTP id g3mr19165095ion.24.1634661929706; 
 Tue, 19 Oct 2021 09:45:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/24] bsd-user/arm/target_arch_signal.h: arm
 get_ucontext_sigreturn
Date: Tue, 19 Oct 2021 10:44:46 -0600
Message-Id: <20211019164447.16359-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update ucontext to implement sigreturn.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 1d051af9ae..7da68c727c 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -232,4 +232,22 @@ static inline abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
     return err;
 }
 
+/* Compare to arm/arm/machdep.c sys_sigreturn() */
+static inline abi_long get_ucontext_sigreturn(CPUARMState *regs,
+        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    uint32_t cpsr = cpsr_read(regs);
+
+    *target_uc = 0;
+
+    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
+            (cpsr & (CPSR_I | CPSR_F)) != 0) {
+        return -TARGET_EINVAL;
+    }
+
+    *target_uc = target_sf;
+
+    return 0;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


