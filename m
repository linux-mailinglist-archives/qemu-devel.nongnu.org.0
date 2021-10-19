Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05EA433CF1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:04:23 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsXG-0005Q6-Po
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsFE-0000Qs-QB
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:47 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:45724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEx-0000VD-UV
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:43 -0400
Received: by mail-il1-x12f.google.com with SMTP id i6so1835171ila.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sdlEbLgXE/NLb9fk1aQgfblb5tQQaJULtHhyMEd7V10=;
 b=7u26lSAdprvYfpIVHFwPLWDKs+w2C2VOvlUf/zHe6Z7rAKIfGHf8QmsJOwKGCzAAQm
 8SAIKHNyI5jvKMIeezuObgJVRcDkSfK8aPcyMToWeQkXH0+YbvYJZFNN5Hp3nGQ+DuXW
 JXRFsx0E/2hvnvyF/SaT5geBzEiKYIGW0ISVoP7s8T5/sY0llBSIg4lvX2GkUQGnv0yk
 B1ekKU9WQimSkr2+S8TvBiUGTOz3KeOAZmnNLdFoipaTo3BpRnos0sd8EICfKVuDRAb/
 Od1wc+pb7UUGaQqE9+h7ZPWLhv925FPry0gAyy1d8cbeaiX/EaVJOvU7+Fra3ZR5ST8J
 qmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdlEbLgXE/NLb9fk1aQgfblb5tQQaJULtHhyMEd7V10=;
 b=gZ8hTAN2AIyWm0X8BDlUEapU4MWFqNleoT2cJ0epNXQFHcy+j1edd80DmGvtvCoxJQ
 zX28tQ+bKKt1c9NPRvLH58TXl9zfW1BynR/SaoHxXv1xxFFLz0AaBSFpykVTfTIZNwR7
 LSxGFEwjdB8uRFuDmYMbGbYNHRSIIoSzdmteSXsq1EsKEXi0Wbbft2l3CiABMPEngYbJ
 J17vZf4OiX7LImBLYzfkbml1NR3VyUBaLIfRs7Yt5hDnQBkeykv6RWunD5Ycqgqua4UO
 RgULIkWs8YBS2Bn+JfXztWBcPnmw0gaH7PieNQIpOM0/t/fXgZubJuZd9JtNvvr5H8pn
 HB7Q==
X-Gm-Message-State: AOAM532mmKX1sY12pv/8xW06c96AsDUo0XjILwjZWoeiRrJeuFr0wYbv
 uCRkSJMkSG26hnPkTYlimsx+gSO2oDwo8w==
X-Google-Smtp-Source: ABdhPJyXQbyJvX3kDfJOWU9jMrGUPepvJG76dENb/Bk1BWdznpqbE/vAXjw+bdREQGBdwkZ6Svd2Wg==
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr19562937ilu.317.1634661925593; 
 Tue, 19 Oct 2021 09:45:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/24] bsd-user/arm/target_arch_signal.h: arm user context and
 trapframe for signals
Date: Tue, 19 Oct 2021 10:44:42 -0600
Message-Id: <20211019164447.16359-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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

Arm specific user context structures for signal handling and the closely
related trap frame.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 9fee58ca9c..67355ff28f 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -90,4 +90,42 @@ typedef struct target_mcontext {
     } __fpu;
 } target_mcontext_t;
 
+typedef struct target_ucontext {
+    target_sigset_t     uc_sigmask;
+    target_mcontext_t   uc_mcontext;
+    abi_ulong           uc_link;
+    target_stack_t      uc_stack;
+    int32_t             uc_flags;
+    int32_t             __spare__[4];
+} target_ucontext_t;
+
+struct target_sigframe {
+    target_siginfo_t    sf_si;  /* saved siginfo */
+    target_ucontext_t   sf_uc;  /* saved ucontext */
+};
+
+
+/* compare to sys/arm/include/frame.h */
+struct target_trapframe {
+    abi_ulong tf_spsr; /* Zero on arm26 */
+    abi_ulong tf_r0;
+    abi_ulong tf_r1;
+    abi_ulong tf_r2;
+    abi_ulong tf_r3;
+    abi_ulong tf_r4;
+    abi_ulong tf_r5;
+    abi_ulong tf_r6;
+    abi_ulong tf_r7;
+    abi_ulong tf_r8;
+    abi_ulong tf_r9;
+    abi_ulong tf_r10;
+    abi_ulong tf_r11;
+    abi_ulong tf_r12;
+    abi_ulong tf_usr_sp;
+    abi_ulong tf_usr_lr;
+    abi_ulong tf_svc_sp; /* Not used on arm26 */
+    abi_ulong tf_svc_lr; /* Not used on arm26 */
+    abi_ulong tf_pc;
+};
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


