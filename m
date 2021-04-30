Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B71370037
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:11:02 +0200 (CEST)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXbR-0002yu-9x
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvt-0001Cx-Ql
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:05 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvr-0003nY-Pf
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:05 -0400
Received: by mail-oi1-x22a.google.com with SMTP id d25so33185484oij.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Fz+RgLlV/5d3FX/11NndYX6n76xs9r7NNgNsOK4IgI=;
 b=vi0+EeMjleH3uSmWGbCdvu/kRkNqCKH+LFk2L4zSCvfdL1JYR5itxQam2J7qQpN9k+
 zZJXlFA7JruffL6qd4EWK6jgTQ4gSaAL2RqjSC55GhJHiDs+7hGzBwog2eM/fiN9aLeZ
 hmm4dEsY318qP08Itc1GASr1rj5g0qCVpwO9w1LoO5KeTg4kR5xkLtRyqMiSpQOxYc7n
 u0GBvMj6gf1hLneBsSZnUcVU7tJiijpxMJrqx/xHU6o0lMARnj7hAO/0Zxn8jQ8JHnuc
 Dkg2U92t1lv1eIo13KGWnTens0U8UYvHXYW6rkZEGuUXV+Evk6d5WOkavHodHV9hOx5Q
 a/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Fz+RgLlV/5d3FX/11NndYX6n76xs9r7NNgNsOK4IgI=;
 b=bfm8j4PDgme0Wmxpca4C9DAnYC47GEnmBUwk3IF1/oqW6Miym9Pb/AlToEkEyNhrDp
 D4ilax38JLnLIDI2zwgCInCIM/n8q8FuQX3AtcCh8Q/6OJl0Cw1Q2X8yw1XSmg5Dk8/m
 gq787bSknqMnZ0Sn+FaS7d1Cio4bwNX5o9oEhklw1odNaPOn9HQsFKgTxqJmXFWInFCC
 wouiP+tgWRKuxmAFcxdnEByORco1DnqdU65S2FIqlG7LXIyWmXTF+rBfTaeO5gZhTYoC
 YR4G0ZBMcFH3R/fHZAPe2oyA1wmCuOE+Y0PPVWSCRwV7I9kx/hHM3RcWPK3II7f9i2Wh
 sivA==
X-Gm-Message-State: AOAM533JcjezX4DCMmrvNCFRQ54BIUlxLyCfP7m1RlUAVOx+6hsf5tIX
 UQDiBWV70SyAc1M9yBLT92IrfT5QpBBb5g==
X-Google-Smtp-Source: ABdhPJy+Qv2uK6iYq3p9Pjm0/jd609OKFLKtPjSIBqcpbCWnD1HKgS3VRPDKIIb8g224sq9TdIwXuw==
X-Received: by 2002:aca:d416:: with SMTP id l22mr4835137oig.124.1619803682215; 
 Fri, 30 Apr 2021 10:28:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d207sm297587oob.7.2021.04.30.10.28.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:28:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] bsd-user: style tweak: return is not a function,
 eliminate ()
Date: Fri, 30 Apr 2021 11:27:44 -0600
Message-Id: <20210430172746.99818-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210430172746.99818-1-imp@bsdimp.com>
References: <20210430172746.99818-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22a;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x22a.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 546946b91d..fd14ffa4cd 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -28,7 +28,7 @@ static int count(char **vec)
         vec++;
     }
 
-    return(i);
+    return i;
 }
 
 static int prepare_binprm(struct linux_binprm *bprm)
@@ -38,15 +38,15 @@ static int prepare_binprm(struct linux_binprm *bprm)
     int retval;
 
     if (fstat(bprm->fd, &st) < 0) {
-        return(-errno);
+        return -errno;
     }
 
     mode = st.st_mode;
     if (!S_ISREG(mode)) {        /* Must be regular file */
-        return(-EACCES);
+        return -EACCES;
     }
     if (!(mode & 0111)) {        /* Must have at least one execute bit set */
-        return(-EACCES);
+        return -EACCES;
     }
 
     bprm->e_uid = geteuid();
@@ -75,10 +75,9 @@ static int prepare_binprm(struct linux_binprm *bprm)
     if (retval < 0) {
         perror("prepare_binprm");
         exit(-1);
-        /* return(-errno); */
     }
     else {
-        return(retval);
+        return retval;
     }
 }
 
@@ -169,5 +168,5 @@ int loader_exec(const char *filename, char **argv, char **envp,
     for (i = 0 ; i < MAX_ARG_PAGES ; i++) {
         g_free(bprm.page[i]);
     }
-    return(retval);
+    return retval;
 }
-- 
2.22.1


