Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8926EA315
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:25:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFg-0003TH-LC; Fri, 21 Apr 2023 01:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFc-0003SL-U8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFb-0001fN-1r
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso219525e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054641; x=1684646641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CZjjRGyO4D1eISjTJOlp65a7EdUWPMPHB+sWYRDwFQ=;
 b=B+HcPz3Dl6iyClrwohXMTvlq0SwffLaO3XjhJTaKLXMorBHzHt6gNBkJ0bQSbnRB4n
 6OOCt+au4TlyZ7ugY1InL46JwRuE+CSKNllxYaKTt/8YlKuHa5oNrUU9/cbUMMWKo/gF
 v5cafW7wMfCH7GA06BcYD1AcfrhG31JwBj1itqRDqUML9HEDdAWi1EnbJ2lbYwucChIX
 dDZSGZSWlW9SzzhmIn8a5HBYPCCjAlK0Py1MXkzE6xsrFRM3/V0KTaoPGUEwIO+CkpH8
 5wYxzzKSkRn1GybXia7RF69kJ6Y9+xcr/KeVMvvJgdA9kYHGIPw88H8svimgR6501vWe
 FMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054641; x=1684646641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CZjjRGyO4D1eISjTJOlp65a7EdUWPMPHB+sWYRDwFQ=;
 b=bHx/6K/uin8RIHBxHDGKg/MjivsUfqBzVbE7urkD612RxgFtxIp+AkuCM1HhCjhiN1
 5l0YGwMn6Bv1veFi8NLzUogq9V+7ek+KLOLzBvu99luOvREO4cZEpL6IF0dl1rfw4Pcz
 60SBUzKLxUM4rfAeOmSnDoQlRr25Nl0eSucRQt0hZp2SpmUNM8dY5klmkxtGAfOnTjPE
 7+8Y5vUiZVCvwZb91TtDwesyIC911cEFHIq5jDLxYuKOAo1jHWKGlF6JXs3KmQv6cgyx
 VzZ9cbeqFr1MgEG8xUMRH5W30Dvda7lgrE0DTeD/abhiK9/7UPMJj2N2vGHzYdK+khic
 ypDw==
X-Gm-Message-State: AAQBX9fwJFqsCkeepLQL4UqzxMORvOAiL2tvG+qmzwpSlSwZoDR4UTWP
 Erx4om5xZ4aHlYF818bPtPq/l/474vtPJw==
X-Google-Smtp-Source: AKy350b2qrEGxS5c6FMOtIuQa0HnCzpHsQjDggwsnRYBp8Eouk80AO+zHNE1ArVPvDxJ3RMZ8IlqoQ==
X-Received: by 2002:a1c:f715:0:b0:3f0:5887:bea3 with SMTP id
 v21-20020a1cf715000000b003f05887bea3mr876209wmh.27.1682054641156; 
 Thu, 20 Apr 2023 22:24:01 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:00 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Sean Bruno <sbruno@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH 03/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:47 +0200
Message-Id: <20230421052255.5603-4-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x329.google.com
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

From: Sean Bruno <sbruno@FreeBSD.org>

Co-authored-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/syscall_defs.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index f041245792..b594fafecc 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -275,6 +275,44 @@ struct target_cmsghdr {
     int32_t     cmsg_type;
 };
 
+/*
+ * mips32 is the exception to the general rule of long-alignment; it
+ * unconditionally uses 64-bit alignment instead.
+ */
+#if defined(TARGET_MIPS) && TARGET_ABI_BITS == 32
+#define TARGET_ALIGNBYTES   (sizeof(abi_llong) - 1)
+#else
+#define TARGET_ALIGNBYTES   (sizeof(abi_long) - 1)
+#endif
+
+#define TARGET_CMSG_NXTHDR(mhdr, cmsg, cmsg_start) \
+                               __target_cmsg_nxthdr(mhdr, cmsg, cmsg_start)
+#define TARGET_CMSG_ALIGN(len) (((len) + TARGET_ALIGNBYTES) \
+                               & (size_t) ~TARGET_ALIGNBYTES)
+#define TARGET_CMSG_DATA(cmsg) \
+    ((unsigned char *)(cmsg) + TARGET_CMSG_ALIGN(sizeof(struct target_cmsghdr)))
+#define TARGET_CMSG_SPACE(len) \
+    (TARGET_CMSG_ALIGN(sizeof(struct target_cmsghdr)) + TARGET_CMSG_ALIGN(len))
+#define TARGET_CMSG_LEN(len) \
+    (TARGET_CMSG_ALIGN(sizeof(struct target_cmsghdr)) + (len))
+
+static inline struct target_cmsghdr *
+__target_cmsg_nxthdr(struct target_msghdr *__mhdr,
+                     struct target_cmsghdr *__cmsg,
+                     struct target_cmsghdr *__cmsg_start)
+{
+    struct target_cmsghdr *__ptr;
+
+    __ptr = (struct target_cmsghdr *)((unsigned char *) __cmsg +
+        TARGET_CMSG_ALIGN(tswap32(__cmsg->cmsg_len)));
+    if ((unsigned long)((char *)(__ptr + 1) - (char *)__cmsg_start) >
+        tswap32(__mhdr->msg_controllen)) {
+        /* No more entries.  */
+        return (struct target_cmsghdr *)0;
+    }
+    return __ptr;
+}
+
 /*
  * netinet/in.h
  */
-- 
2.40.0


