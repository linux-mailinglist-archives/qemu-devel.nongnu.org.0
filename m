Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467D550C73
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:10:30 +0200 (CEST)
Received: from localhost ([::1]:34300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zNV-0000SH-Be
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zId-0000yp-Dy
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:28 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:43733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIb-0001MA-Te
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:27 -0400
Received: by mail-io1-xd29.google.com with SMTP id d123so9110925iof.10
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJEGbDyUIR4TgYHaYi6XpxnqSx1t+dwpAGBFG5Z8F5Q=;
 b=uGANliHeeeD0gDASlc0Fy9lkIUNfh/4rWMcurAXnGGX38fOM9LAjJIcqJQOJWeumGV
 jkEhMKTPiFOiV+A0K51V8ZYLs9tXKvZBemnUdcWifXgrljF0ksGuJWSt2YHY87fJvzDQ
 KB3tCCgeTQzZzhOwa1WPE6Z5/WeHxsQtTU6gBzrKcKfgAmRqtdLb4qxvO4a9SsU+4s00
 QAfJaQbu/THB3yrrhAc2xojEYV73K3fIulH7iCzfUzwxi9BhTVOFE3WpGYaHiKN3TZs3
 S2k/Nirwiwu6qQeSZZ4xxV/Kv7zmkx36gbx+wC8DVSEygYeX1k2SYa1pcldXD/g5KdrH
 QN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJEGbDyUIR4TgYHaYi6XpxnqSx1t+dwpAGBFG5Z8F5Q=;
 b=jxVHe0rGEtJkg/doOHf25rowhrs9/1zXKeHonPQy+t9QlbUM5JRfPTRanD7Nksg3hJ
 arn60VHlTOoa93qwY1LXeSHc/PwL0tONCKOQqrJkTR9V3DYhilOwk5htumJiV99Xrrvc
 vOiHICOP/WBsyFOf37APAoaTgSC9l9ng5s2XO0ujvhgw/V5Q5R/zsG6m1DabIFIvkz9k
 vKf/MfbSrUF1bYXthysYSbsnjkmxw5HeUeoaAN0rjoXzqkHYBz/ztPdKqu/ONdPc7cSh
 dYR98CGRlHakBGumtd6olpEBsJpJ29JsTj4giOhGh+fFin+JpUzkB8IYt1ezS0fMdATP
 51lA==
X-Gm-Message-State: AJIora+xCAK32dr6Oh2ASuwrnPrk8MX4afg8ynDkLC0/s8s+HoUjmqNw
 /ioL4VE9OfrhGDQeHCpK8I2+TfJqapwNzw==
X-Google-Smtp-Source: AGRyM1vqkHHFZ2ZEgvJzhZn8CORccoFIuuNu1ZWYWu+HV2R4aCV2IpIZZSn5jvYiweFH9+TdYegQ4A==
X-Received: by 2002:a02:9564:0:b0:331:dc7a:1cb8 with SMTP id
 y91-20020a029564000000b00331dc7a1cb8mr11309874jah.215.1655661924584; 
 Sun, 19 Jun 2022 11:05:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 10/11] bsd-user: Implement trunctate and ftruncate
Date: Sun, 19 Jun 2022 12:05:30 -0600
Message-Id: <20220619180531.9161-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
 bsd-user/bsd-file.h           | 29 +++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 021541ad2e0..fda36894605 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -497,4 +497,33 @@ static abi_long do_bsd_dup2(abi_long arg1, abi_long arg2)
     return get_errno(dup2(arg1, arg2));
 }
 
+/* truncate(2) */
+static abi_long do_bsd_truncate(void *cpu_env, abi_long arg1,
+        abi_long arg2, abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg2 = arg3;
+        arg3 = arg4;
+    }
+    ret = get_errno(truncate(p, target_arg64(arg2, arg3)));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* ftruncate(2) */
+static abi_long do_bsd_ftruncate(void *cpu_env, abi_long arg1,
+        abi_long arg2, abi_long arg3, abi_long arg4)
+{
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg2 = arg3;
+        arg3 = arg4;
+    }
+    return get_errno(ftruncate(arg1, target_arg64(arg2, arg3)));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d9ebb9d50d6..3c8f6cad0e8 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -357,6 +357,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_dup2(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_truncate: /* truncate(2) */
+        ret = do_bsd_truncate(cpu_env, arg1, arg2, arg3, arg4);
+        break;
+
+    case TARGET_FREEBSD_NR_ftruncate: /* ftruncate(2) */
+        ret = do_bsd_ftruncate(cpu_env, arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


