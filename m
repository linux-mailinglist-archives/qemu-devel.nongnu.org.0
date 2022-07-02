Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977B56409C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:05:28 +0200 (CEST)
Received: from localhost ([::1]:42036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dkV-0002DD-4Q
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcD-0006rc-KM
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:53 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcB-0000br-P1
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:53 -0400
Received: by mail-io1-xd2f.google.com with SMTP id z191so4727961iof.6
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8kkD0I+Ru5IcZB0L5eyNo83IbFVlqdLSdNar/0a50Tw=;
 b=Xj7y6iy+2GOiZmudhMDYDsoH3aBSrV0mul3BLjnzc1+f27K6pQDVpz1K76wHfuvn9W
 7OPqCx12zi8KVS4yKBAMJgJTClmMMJ76tId2k5pd9vr4TcqAR2BucmRn2HxZuGsHcRul
 qs5oTMH4Fsktz7l2atacGAbLAvjNth1uwz+VR47wFnXgfqjMqDuWJBfNsYHTm2vpuN7C
 f9/Ks9e3T7YUOKJggsC/y7LPX0fXd1LXrBBWrbzeYNHf+ZzYJpJTz2wQon1ptH1w9Bs+
 aHbZ2+M9wRbczD42+SSFE0d0IlprDVZPbtoEqNNVuXqpYMZcyo3YUGiBAPp64/e6XovT
 cFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8kkD0I+Ru5IcZB0L5eyNo83IbFVlqdLSdNar/0a50Tw=;
 b=Gp03dzWYiZLyDzwli4AOmiCKzMJmZ7f5R7rXvl4vHLlARujIiPmO6rbSSu3W7E4vOa
 xhKRxTNJIvWWzOcd6PyQf1TrV6twIoJ9L94WEujrKnnm4uLy1nYCjNG0WTVfpuwSgDwl
 a5a4BNiRxSFmk/Po3RVYf81SKST2BAapHxrkreMvGdsUpWGYInAc+RY8H1UUSigZmYEb
 T2HKIRIIbH7+1KDiEPQyYV606weTdp8qF9A4UweFfGqB5fQQBZefugj5dwpuFYmyulFU
 k4OYfaA0SbKbbfLknfVLJaoM49sA/hoVYlhufjQd/CXejiQw5gx5VVlBvVbRk1ejeg4U
 mW6g==
X-Gm-Message-State: AJIora+kNVGFMD75nb1GNEV5H7gzJ2/NB9A9E8mmswoJpTZNubdfICxO
 F9xivalQrONCPATrVCGpWCRGilm2XgBr1Q==
X-Google-Smtp-Source: AGRyM1vpo3r4hI7UBS9UrRHZrUBazNVNyzjv8gWUYMRRg0e4dN191ZAZKHJiDtLlFHPX0fLcDEwgCQ==
X-Received: by 2002:a05:6638:3725:b0:33c:a0d0:32d3 with SMTP id
 k37-20020a056638372500b0033ca0d032d3mr11962664jav.283.1656770210586; 
 Sat, 02 Jul 2022 06:56:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:50 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/11] bsd-user: Implement undelete
Date: Sat,  2 Jul 2022 07:57:05 -0600
Message-Id: <20220702135706.73622-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
 bsd-user/bsd-file.h           | 13 +++++++++++++
 bsd-user/freebsd/os-syscall.c |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 065f576dfe8..108a5061850 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -926,4 +926,17 @@ static abi_long do_bsd_fpathconf(abi_long arg1, abi_long arg2)
     return get_errno(fpathconf(arg1, arg2));
 }
 
+/* undelete(2) */
+static abi_long do_bsd_undelete(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(undelete(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 7de4c40bb16..57996cad8ae 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -487,6 +487,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fpathconf(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_undelete: /* undelete(2) */
+        ret = do_bsd_undelete(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


