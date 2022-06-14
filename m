Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46954A82C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:32:57 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yEa-0003z7-BC
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2C-0003fB-DY
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:08 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:35459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y29-0001pn-Mp
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:08 -0400
Received: by mail-io1-xd35.google.com with SMTP id y79so8242377iof.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDt4lR7a0j8LSpHDvGx01/LeHWwn1L1uADG9APhxRcg=;
 b=nzgHstqdbAy9ZErsUi3E2V2lWA1Z6PTpCBFg0YV+E5Jua949vbL7Jts6ZyEG9Mz3lc
 +aEHNcgLELlvxCXLPlzHlzu1JhwcvAoRfP2yGxQehRPsntdL///Y+Sbzb1f+nfaHQZTH
 MwpejFFUwfoijZGWQOT0AlY8Lxuw5OOuV8Mq3Ytk9txa8mdGpNVMjKZxEv1LMqQmor2K
 V+FAYFCl465FsUZ8wO+QN+8GqViHwoVucggeukQnEBk+6S6F7T/eQHDVxFlO2aTY3oBh
 mdaxBBFACv+KZF7KujIWBW20Jy0Kd8LbyuE2XWeovIMKXPyqqjhRqj2nnlnkd8UcJJt1
 8zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDt4lR7a0j8LSpHDvGx01/LeHWwn1L1uADG9APhxRcg=;
 b=I0asTYpHGw0fWmkixl2wdFALN1QO8KvONVYIvGM+CjbfbV0aGKQbjYWFHvZvkMMyGE
 sgloVhLZz6cDcwJi33K5SUIKXzsVvFcrznUpYqIWwUqJtoUDjpRGisCD4vDh30gyj0vB
 OarZeGuqhsQE1Gz3vx6pHl2x0QGY3EL74P1yDbvNDt4TrUpAwZ4ExB0dom+YsafzoBIk
 y3EMymHNsJah632/ix/whZMlSmZXL44aYkecagLB+2+FjZCVhMsVLOGQk8/CHTld7b50
 geH8sMU/7+geMOJFDonzMezMwD+UbF2E2/6WtOl1ZfX/FjIAQ05MLl1E8RdCWRwXslKv
 oaFA==
X-Gm-Message-State: AOAM532r+g20PxaS9WoHbQZn6ghkdJFapEtQOczi7sutYIuOxq9HtCNA
 NEDSEytsoB1pzTrBZOj7xsFdjiUQsc5zdw==
X-Google-Smtp-Source: ABdhPJwO+oJNtJbcFlQsOFqvYMB067VZMvxqVKPswQw55wIVpviLn/u22AG7ec/Hu2bHVrUCb2gb1g==
X-Received: by 2002:a02:9002:0:b0:332:e11:bf87 with SMTP id
 w2-20020a029002000000b003320e11bf87mr1704473jaf.91.1655180404414; 
 Mon, 13 Jun 2022 21:20:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 07/11] bsd-user: Implement mkdir and mkdirat
Date: Mon, 13 Jun 2022 22:20:06 -0600
Message-Id: <20220614042010.40327-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
 bsd-user/bsd-file.h           | 27 +++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 93e142d46e7..a4c6dd52a20 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -429,4 +429,31 @@ static abi_long do_bsd_unlinkat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* mkdir(2) */
+static abi_long do_bsd_mkdir(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(mkdir(p, arg2)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* mkdirat(2) */
+static abi_long do_bsd_mkdirat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(mkdirat(arg1, p, arg3));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c847e4d20c6..9381ddb5be1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -333,6 +333,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_unlinkat(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_mkdir: /* mkdir(2) */
+        ret = do_bsd_mkdir(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_mkdirat: /* mkdirat(2) */
+        ret = do_bsd_mkdirat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


