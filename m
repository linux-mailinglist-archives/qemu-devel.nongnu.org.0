Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C955A42D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 00:06:16 +0200 (CEST)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rRQ-00011H-1Y
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 18:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9G-0002lz-AV
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9E-0007WB-CV
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: by mail-il1-x132.google.com with SMTP id a16so2328821ilr.6
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rP1gEhSKhqMbSa+L+cwEFk3+lhmI1TzozVh4dmnW1U=;
 b=bHfFibFvcLe/62zx/9oqlTXeBIFXMS0AykQZ7JeySWrlR3MLDWV/NFXH+SyZoFLpUA
 +Bs8+EH/jQVnovWZjJiKKMzIJ4lwG9ZvNUFn5ymM7yxi2zdLtDJxarJelR29Nnv8uCJr
 cF18XaPeIG2UzFUMVxWKXJZ+aCrnScdOXTCDMbCcaUZ52Yzb3YQACLcBAdo+WqSd1AEZ
 HsdAa+APfcDpNnIPNT0zsOinuPzTMVc9ZRBEqVUgZ2tXEyMK4Cr743OaeIGkVKh8hxdd
 rAKfoQvzz620id6wXB47aUwGjrY+uEXxbewTThvSjxLYU8fWMSH8Vs2VL7IM6QiReVH3
 1njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rP1gEhSKhqMbSa+L+cwEFk3+lhmI1TzozVh4dmnW1U=;
 b=dMjOHXz+64dQRpoDF4KJjZKGLcTNJGyfXHdNsEk1mUemosjonpO8/DwmZ8PN8shQKq
 9ou2SyjuV+LV6/ln1zoeGxTfxqqX+Xs1O3sOCR78LBrPLVCmi2QWqws0e0BW0XA6ts8q
 YlXqQzGbVT58tEETOOAY6nGTBZA+liPzFrWx7z6rZK9th7PCi3UoIPnucJUBaySPvIX9
 gXXHRRu2v3aGh0lYuNiIm2kfLRBgml6ZtuBx3QUL/k1MPkJ/7C9VMC3MfjOOrirdDkQJ
 YemHkZCfUmaBTSE00RCHzNdaXLE3a0Gfm29SChOym1C5nxtIlcUPg1MuzW+9xwQyC/p+
 rPyw==
X-Gm-Message-State: AJIora87bpCOTdVs19+KV3EJh4kj1qga89qiW0R75Ymu8D3Ai8udBIF4
 +ko3W+GsBYRuLt1zZ5x5E4zicSPhpHYoYg==
X-Google-Smtp-Source: AGRyM1s8oi05Om5ixXeUqWPVXXnD98/QMruUX8kNv0BZEUUEGvwFrUuXIR4TmeLoDrIYLPpCOD+pDg==
X-Received: by 2002:a05:6e02:1487:b0:2d8:faa7:b62a with SMTP id
 n7-20020a056e02148700b002d8faa7b62amr606114ilk.228.1656107247029; 
 Fri, 24 Jun 2022 14:47:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 09/11] bsd-user: Implement pathconf, lpathconf and fpathconf
Date: Fri, 24 Jun 2022 15:47:40 -0600
Message-Id: <20220624214742.89229-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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


