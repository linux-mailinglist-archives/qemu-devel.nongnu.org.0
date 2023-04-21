Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06DF6EAF65
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptqm-0005Aw-BS; Fri, 21 Apr 2023 12:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqj-00057a-NY
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:05 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqi-00036o-4M
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so16556965e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095382; x=1684687382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeRtqpEqOoSMNPEarWHZ/QkhctimiStgr4hRhWpY1cE=;
 b=Hqr2NoRCV7zOfioY9NY2qfxP5QJJB+Lv72EGGYs1FVNbXMafFJQIUXK3S5WiXdJv2t
 /5X8lLoppsqMjPUOAoqw0Nli9AFmIiZ5wgklDEtrWx2OG0vGO6IJwG0q1lkFPTUpFMdS
 8gJvXYQ5tysLvtal8AeATSlDZbcFJKehp6fRfJ4Lw+ZFDk+4RnevbNmS+0oQ0JCGeTWF
 tGDpLh19/jU5Z1Hd4UnStPbZbFmZmnIJjXlDsQf2jo2lRQ+eqLVQ8HKSUHaPl/Ui2iH3
 bavOOuOvvWacB4Z4QlYMeM/0U2atJ0hqB6Gz4lo/mJ7xrGTwA+c4I9LDxfkWGocRA6h5
 AUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095382; x=1684687382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeRtqpEqOoSMNPEarWHZ/QkhctimiStgr4hRhWpY1cE=;
 b=AAv52CIYcJWTSt/OYQiwuT0R2OcdGld/frTWZXt56nwtulmt7sZbZK5TK3D2tWZYKb
 H+dJp5vn9kQvvQAcUHWtoGH/3/5ZeNs9ht/EKz7OO4kU1TO8mLLwE/X1aPFZdkCjEm+5
 f1pJo+Kcg+V1YbahVmHiNL6IfMYykkoA1sEwr+ryquXWiH73xg+gm5BPZI3OAYp8Vq8i
 wtw7A/bAyr3feuZ1Dfuh4cMwrospIZ7jnWmNsDn3HEmW6GmuRqghbsp6/WElPvs4kqzk
 4diXoUhql43diBAJ8PP3Y88OL77MrkvP443Y9e0bS6ki4bwqryUoLz8vt50yxo0cdbX8
 MnXQ==
X-Gm-Message-State: AAQBX9ftotxnsrKV+JyV1Y+d3sVoP6h31BA0zJhz+qJ3GWIoSKhF5zhP
 9jemam1S5dqUF44pKBon/JiDhytPakU=
X-Google-Smtp-Source: AKy350bsyyqNDx502pqgMZ/51//fI2sihOWhKaeUjXmkL9+RzJq817C7qk4iFjhfBy0hVlT3iB8+YQ==
X-Received: by 2002:a1c:e904:0:b0:3ed:3268:5f35 with SMTP id
 q4-20020a1ce904000000b003ed32685f35mr2467158wmc.18.1682095382324; 
 Fri, 21 Apr 2023 09:43:02 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:01 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Sean Bruno <sbruno@FreeBSD.org>,
 Kyle Evans <kevans@FreeBSD.org>, Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 03/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:52 +0200
Message-Id: <20230421164200.2913-4-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
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

Target cmsghdr struct and flags.

Add the cmsghdr struct and alignment flags.

Co-authored-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
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


