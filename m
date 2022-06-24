Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB6855A3FF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:54:52 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rGO-00035W-1S
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9A-0002ds-MY
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:24 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r99-0007V2-5x
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:24 -0400
Received: by mail-io1-xd2b.google.com with SMTP id r133so4038919iod.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBqWqkQgsRng63/sJNZmq8NBH7vr2Z23dtkmb5w8maI=;
 b=VbKwqNX58NfQE3/z1cZL2VwwVma8kT8v9EHdpsY/2OMzTYkFgfx87XuAVzOGaB0Mkg
 42jR/kZ0TlMMxbJq2aYrCOXrgX9hOTMO5OGv1Kxy8y3FBlUXr1Qb319aXaCm0Fd/XchT
 4u0vAKPRTxIGuar0Y/xZHnlFTfisQiziuFt1YPnZl2R963gzoVhE8WjGTbfsBuH6WIgU
 Mw/7d0VaZ25xTCjOPObzJ6/G8CMF/uPQueWVTHkcSF8GOxwonCm5hAEalHi0rRLo7a6Z
 TXQhHcCUwaavYU3/VffAUdzItU77lNyyfodHNHa3Qb2BocDS8B1flxUHLRG8SBjxg0vs
 MhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBqWqkQgsRng63/sJNZmq8NBH7vr2Z23dtkmb5w8maI=;
 b=XZpr4+DBhaHeXaZa6Kw/nYSV/X5r3vG8KZfcpZVlR+Jhb0GLiPa46D1+O+Dvhi1R7e
 OHC0Ihe2gPj5Sz1Q3hywmwKYD4KxnoHkeWNn18WKo73GVcX098lorlbF61QNwtQ8Oah/
 qiP3rMKT7fC/o44m/fiDz9vvs9WvqNrn3U/oWYDemD4HXaAvGkJUuvUiJDSAgd56mlTn
 j5gIJqx4wlT6GIbwGG1otcUVviOZE7f5lxfBak9AbrWUDrMuTHrYhC64K8+2HQv14Dez
 N6yM3oflNhZ0A/KgfnYrrvltbcl9tlKEuQtH4azvURcCe+VBfshGsyJHg5Ck/Qw+KCjS
 gDrg==
X-Gm-Message-State: AJIora8U6+KlsTLOqyhF+hSkorUtUG7tgGfmnWwXRGxpftYgPKgmyHbH
 CNKjf+bp0Zi+/s0SvzGDTza79Nrnz8V9Gg==
X-Google-Smtp-Source: AGRyM1treZFqKzImSMvnKycE+pD//el+MjsYJnikeZTdi9dMk0V04r/qoKAQnxAv/Lxw8RGNqzAGTQ==
X-Received: by 2002:a05:6638:2110:b0:33b:b100:551e with SMTP id
 n16-20020a056638211000b0033bb100551emr809851jaj.116.1656107241858; 
 Fri, 24 Jun 2022 14:47:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 03/11] bsd-user: implement chmod, fchmod,
 lchmod and fchmodat
Date: Fri, 24 Jun 2022 15:47:34 -0600
Message-Id: <20220624214742.89229-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
 bsd-user/bsd-file.h           | 46 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 635ac8d0e62..1af79866fc6 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -675,4 +675,50 @@ static abi_long do_bsd_readlinkat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* chmod(2) */
+static abi_long do_bsd_chmod(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chmod(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchmod(2) */
+static abi_long do_bsd_fchmod(abi_long arg1, abi_long arg2)
+{
+    return get_errno(fchmod(arg1, arg2));
+}
+
+/* lchmod(2) */
+static abi_long do_bsd_lchmod(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lchmod(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchmodat(2) */
+static abi_long do_bsd_fchmodat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(fchmodat(arg1, p, arg3, arg4));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 80ec9dd4954..b33d548a4b6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -402,6 +402,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_readlinkat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_chmod: /* chmod(2) */
+        ret = do_bsd_chmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fchmod: /* fchmod(2) */
+        ret = do_bsd_fchmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_lchmod: /* lchmod(2) */
+        ret = do_bsd_lchmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fchmodat: /* fchmodat(2) */
+        ret = do_bsd_fchmodat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


