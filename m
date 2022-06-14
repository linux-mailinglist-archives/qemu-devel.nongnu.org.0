Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A6B54A82A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:31:23 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yD4-0002m3-81
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2D-0003hj-HJ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:09 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:39548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y28-0001ox-Tj
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:09 -0400
Received: by mail-il1-x12e.google.com with SMTP id z11so5752334ilq.6
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4lp3jEo9v2BadFnXv+3JFzH727s9UtBSFIowCjnWXXo=;
 b=5w8411/+3AGpx/MOxJgYiXpoFlrwo5MNIDFiYwxdhV/X2W9sA2kHAakUOaMV2w4w0W
 a8oZvVySV8nllcD0rVtOcjQE4xza6asEjBTNVg4HmRe0dcCGq+j0nny+KcZpSn9ZdTEe
 AvbrarUQ47cT1H0BulyfnCVd6u2J/n17L74DxQCJeqHRbj8x+dd3qFlY+MmfmOhUJSeV
 6se9tkWhTOASQZ+a5DRjoTHPbEnljuToN9UqnXmB43ZDoG4ikjhd3o2/yDg2XhaBjvbS
 dAEO+hLhtMR5Og60TWX40/0zGdsgTve/GenJpvWhVMFH+CP361BQBZ3TtpRyvN3j0GPT
 qc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4lp3jEo9v2BadFnXv+3JFzH727s9UtBSFIowCjnWXXo=;
 b=KXZpIj/PSWAdUTvQG1swsq/rRKxHCIsO4idu6yRpSVt6IqJMwLt1Z208FIGFCTCfH6
 +ipPJ4RVNSNLuPIsMaeAYT2GLyLxvf7UiS3jo4KW064ia4h3CClgRAFVa1BagUZD0coJ
 D04EUMf+TNqqmQ+qwYwFE7oXXg9cdPEZu6Mefz3T54rhcITw8soJ6Kgj6ACXORMhZUqg
 MzntNLB6oAjVZfQPfANBcLu/QMmJYnKsNCDePgoa4plT5W2ms/642sGEDMXxpCkudVW/
 OXAIz+57lTcR+g42nLhkS4OybgVzyJhtiWfL/m0HMrmW786quPepDr2nD5chcsFHmmR/
 BM8A==
X-Gm-Message-State: AJIora8xvJDOWlTaQ5eCw17PqPjaxa0N3dhyPlHMvTtnCYhUZZb0epRd
 WGr/X+ZMLPo0EoXfnxJNT/rfA1N4ZghNGw==
X-Google-Smtp-Source: AGRyM1soOtC1HFxqigoEhpKsM8Af0+ncX+aBV1lSIvS/MEJw9tcEQbLXAVtXx7NH9fON9c+PwkQ1PQ==
X-Received: by 2002:a05:6e02:1bc8:b0:2d4:342:9c68 with SMTP id
 x8-20020a056e021bc800b002d403429c68mr2004643ilv.254.1655180403339; 
 Mon, 13 Jun 2022 21:20:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH v2 06/11] bsd-user: Implement link, linkat, unlink and unlinkat
Date: Mon, 13 Jun 2022 22:20:05 -0600
Message-Id: <20220614042010.40327-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 54 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 +++++++++++
 2 files changed, 70 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index fd8aba96180..93e142d46e7 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -375,4 +375,58 @@ static abi_long do_bsd_renameat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* link(2) */
+static abi_long do_bsd_link(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    ret = get_errno(link(p1, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* linkat(2) */
+static abi_long do_bsd_linkat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg2, p2, arg4);
+    ret = get_errno(linkat(arg1, p1, arg3, p2, arg5));
+    UNLOCK_PATH2(p1, arg2, p2, arg4);
+
+    return ret;
+}
+
+/* unlink(2) */
+static abi_long do_bsd_unlink(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(unlink(p)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* unlinkat(2) */
+static abi_long do_bsd_unlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(unlinkat(arg1, p, arg3)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 2d62a546328..c847e4d20c6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -317,6 +317,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_renameat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_link: /* link(2) */
+        ret = do_bsd_link(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_linkat: /* linkat(2) */
+        ret = do_bsd_linkat(arg1, arg2, arg3, arg4, arg5);
+        break;
+
+    case TARGET_FREEBSD_NR_unlink: /* unlink(2) */
+        ret = do_bsd_unlink(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_unlinkat: /* unlinkat(2) */
+        ret = do_bsd_unlinkat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


