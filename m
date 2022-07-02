Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58B564073
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:59:35 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7deo-00019E-BV
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcC-0006pW-Id
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:52 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcB-0000bh-1q
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:52 -0400
Received: by mail-io1-xd31.google.com with SMTP id r133so4742060iod.3
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rP1gEhSKhqMbSa+L+cwEFk3+lhmI1TzozVh4dmnW1U=;
 b=73hzKv9FY3sZZ6jk0oAkJcwESRAfhq3Tp5uf4FzeKkoNrx1QjXv2b13z41++OpRXSp
 ijFtkpxn4WU9qG5MFic/J4I1GqQqMvn3g/0fNIJtN9Tl90ahTEQGbfvwZtrm0ffOhUuK
 PyreLByUZMRMQllvt2F4SkUgK+9PqzlIA92JS9TRtlA2vfVoY4yIPNquF1xlPi2A32vA
 CRNT8jhiUpRbqCnJjr7yVb5PbdmrAWCHCQb0FJnT7zkD74NO9k4nTJG3HpEcQSETRfM6
 EeUK7ZyUIpLB5FljZMXtRsb6sG/J3DcqNH4QB3Kjn92SxlsTjMpgMMPyAqZRIveRAEGp
 WkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rP1gEhSKhqMbSa+L+cwEFk3+lhmI1TzozVh4dmnW1U=;
 b=URWfmxQTEgh+KL1SC9KjFOOGPWanWCSd85WA1quiJ6HYe0kYMyWmFYL+7WhKZNNs5e
 RZ67VzJGqnTD9gP9zv9CHugW6FiKHZl+oWfLUBCO2iXzFWIPsikfei+KVzpC18R451UY
 g+RpQEjbaatXmjOJepJyrqs7F/37zjIGJ0qseHg1ZL9oHb58pAkHI5wPFhflSMCy2Xox
 0IHAEbMCCUF/n0CjdLDbd+0+itY/2Rb+6eDGtZiyGzTxtiPJnHCiBHD2I+3WT2vCRNEs
 5J4PCFsp+QzT4dyf//Jb5+q5sY090I3YzkYlw5FNKUtYhvTDrVjoJ0qPjoyNcEJXOke1
 kv1A==
X-Gm-Message-State: AJIora8wwtRdU24IWDqObo8/UJ1kR0gn5M57ycDlLVddTxNEe1O7Fj2C
 mT8+Ab/xYOIHlxVb4dvIK4rGMwc2jJ4DYQ==
X-Google-Smtp-Source: AGRyM1uwl8FkHe9mmGLD6Vonfmea2igihqwhFcJNp7yuyxloopVTPnuXR4Q5bBm98FkNr+ijABijxA==
X-Received: by 2002:a5e:9515:0:b0:675:454a:54d6 with SMTP id
 r21-20020a5e9515000000b00675454a54d6mr10270134ioj.5.1656770209844; 
 Sat, 02 Jul 2022 06:56:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/11] bsd-user: Implement pathconf, lpathconf and fpathconf
Date: Sat,  2 Jul 2022 07:57:04 -0600
Message-Id: <20220702135706.73622-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 32 ++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 4b2f6dcc1dc..065f576dfe8 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -894,4 +894,36 @@ static abi_long do_bsd_mkfifoat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* pathconf(2) */
+static abi_long do_bsd_pathconf(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(pathconf(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* lpathconf(2) */
+static abi_long do_bsd_lpathconf(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lpathconf(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fpathconf(2) */
+static abi_long do_bsd_fpathconf(abi_long arg1, abi_long arg2)
+{
+    return get_errno(fpathconf(arg1, arg2));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index be225195fbd..7de4c40bb16 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -475,6 +475,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_mkfifoat(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_pathconf: /* pathconf(2) */
+        ret = do_bsd_pathconf(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_lpathconf: /* lpathconf(2) */
+        ret = do_bsd_lpathconf(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fpathconf: /* fpathconf(2) */
+        ret = do_bsd_fpathconf(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


