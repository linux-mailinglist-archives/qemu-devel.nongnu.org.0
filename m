Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF7550C71
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:08:20 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zLP-0003iZ-6v
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIU-0000sf-5B
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:18 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIS-0001Kk-Jp
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:17 -0400
Received: by mail-io1-xd30.google.com with SMTP id n11so9137285iod.4
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hArKZ9FFGMf88kVfdfvsuQyXRHILT3Hqc9FQtOYlbzA=;
 b=hI9W5kJJ5xh1S+YVQR0bxiP7aTbyU6Mz+MV+WnX+3H7EgKvom8xWMMR75IMtNNcvYJ
 kng1WBa8gOy4zELTKwINRDUnQv13XNEARYmFgZy9TDbEwr8bPpYHa56LWXnRmYuwE6MW
 nIg1PHcbigu8YaqKR7jK87j+6KluhfTwX3cSFtq94i5DoIBUpFOU97kVM03bWecTB2mD
 Se+ay+jG2GzPbLGRIcMNmzxvs0tUjrzHeMg/ofhL/q+Yrw5xfzzQjPcr/LwVJ7QZZldP
 f8LRHe14TRpUAluXWaeoT1zu4vkDcqSO8AFb7ex08CdjoWQxaViSEntNPq1w4C3aXroW
 5/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hArKZ9FFGMf88kVfdfvsuQyXRHILT3Hqc9FQtOYlbzA=;
 b=tqbRUOntAyyRLLdLZZZlqiRtJIxQ76pYN7sEvrn+KdeALBncqgDTe2jWGtoU2OkVO5
 Sw/xnf6iOsIoubDoyMWjbhwTHWET3eFxv3ft6Lx2Bgfoy2x7JcJR6MhfB3VBmojZ889h
 w36XW0dyHv4HQS9J0+YFhLU6c0WMgHAWg4LKidlr+WP1CYoQl+cUopbSuJool9Xw7nAE
 N1zdwUCJrOcf3Mrc2qD2iDIvORKHXLzFNLefkFQrY3iWZrIeyskdsg0FmQSRRCiVhrlj
 hICO9U5VsnHj1K3FLaVayenJASGJZIuXD8ZdARdqov6nveoHcX7rBEoNRHtJZxDe8zJZ
 chfg==
X-Gm-Message-State: AJIora+j6Wz5VOEZscb8DE4EHMh0fK6wvNNY1EImskbycoUmoppw1gNp
 s3b9c8gNWFav/KUjRbXyZUNIFNW++iVtNw==
X-Google-Smtp-Source: AGRyM1tONS75T6+8Z9d+IZSzF/j/uPn+AkNZXruFLdQW1by3XUII/dcj6nkyMAJ0ZwWvcOkdLd8b+A==
X-Received: by 2002:a05:6602:3d2:b0:65d:c151:f29f with SMTP id
 g18-20020a05660203d200b0065dc151f29fmr10111901iov.28.1655661915248; 
 Sun, 19 Jun 2022 11:05:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PULL 02/11] bsd-user: Implement fdatasync, fsync and close_from
Date: Sun, 19 Jun 2022 12:05:22 -0600
Message-Id: <20220619180531.9161-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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

Implement fdatasync(2), fsync(2) and close_from(2).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 19 +++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 2bd312f8e18..94eb03df62e 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -239,4 +239,23 @@ static inline abi_long do_bsd_close(abi_long arg1)
     return get_errno(close(arg1));
 }
 
+/* fdatasync(2) */
+static abi_long do_bsd_fdatasync(abi_long arg1)
+{
+    return get_errno(fdatasync(arg1));
+}
+
+/* fsync(2) */
+static abi_long do_bsd_fsync(abi_long arg1)
+{
+    return get_errno(fsync(arg1));
+}
+
+/* closefrom(2) */
+static abi_long do_bsd_closefrom(abi_long arg1)
+{
+    closefrom(arg1);  /* returns void */
+    return get_errno(0);
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index a824785fee8..f7d09909925 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -273,6 +273,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_close(arg1);
         break;
 
+    case TARGET_FREEBSD_NR_fdatasync: /* fdatasync(2) */
+        ret = do_bsd_fdatasync(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_fsync: /* fsync(2) */
+        ret = do_bsd_fsync(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_freebsd12_closefrom: /* closefrom(2) */
+        ret = do_bsd_closefrom(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


