Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E0155A3EF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:50:30 +0200 (CEST)
Received: from localhost ([::1]:60514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rC9-0005ag-SZ
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r99-0002bb-8L
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:23 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:45769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r97-0007Uq-Fe
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:22 -0400
Received: by mail-io1-xd2c.google.com with SMTP id i194so3980566ioa.12
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrqFubMWK6vYp8ssFg9YAQd4SKhUAEjv/YEPYS2wSqs=;
 b=z7CxNARd/i4wWlyZvaNcjyY58bNxFBUibvj4nw1W4oZS9B8uS4Qi01ImscmfgVoqqM
 //VDqGuAaj/ZcW1zw78reQRKVXUcTQ+SfpOUY75ipRFcVD1OhjMaYcDLVjkhzUv+UtHx
 rB+aPzqiSDuvfOvKGBzJVxTv5FpKRKsGwfBgQG7Q6INKbXTGqSNzu+vAqLbS1t52EWZo
 bLhvm9GlhLGybPfnoPNfrXXI4n3gnqjFLkmoiKE16dDUceoQwYDkRaw2fGL0lfGfvxjm
 5YVE3kySx01oGPJt/ztso9zYdU3XelIovKOp9vP+yy82bVW7S7fTROz7y0pJTGW62Xum
 Zd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrqFubMWK6vYp8ssFg9YAQd4SKhUAEjv/YEPYS2wSqs=;
 b=LdQ8LibObdtZi5Z2XrhKE7KIZIsEzVwV4WyKYi/VLQFoIgTOobtnQhnw+v0eptUVoJ
 omNSMpfucv/jN5uYidmlj+ZZ3UBG4/GIf5Wav4hJezee4X0zbDcqNSYHypeJXFyDkRrf
 fAt9l7prRthfzcbkAVx3p60mb/CyoZHRJwBGZd7JULMYDRixBTCLb0RF06qX2RtC3ECU
 UUOhO0EctoWYRtl3KC3FdxGA2vveQrtl3l7My4LI4O7xkl8fYfmIvKwdDqOCE5n/diTD
 b2MpK0QBhCSmjhl8Rtgu7OwKf1qVA3J7sD2Ruhimt1yrUF/NH08Yp1Y193cxrdhrTZy+
 WnhA==
X-Gm-Message-State: AJIora8pCsPGOeCtO562hxepAf3vvPdecFDYUq8CAP8Av4EY81vVSnpq
 UxP3fUz6Y+sTCZsiAlbHttq5HLKwElOZPA==
X-Google-Smtp-Source: AGRyM1s+fFtPC4Jt2vGmuPRDmTAUa+zPFV6uPu5KZb7tHnnltlSN6KwdPsHzbYH/6ReAWz72AFgMxA==
X-Received: by 2002:a05:6638:1511:b0:332:3cb6:a920 with SMTP id
 b17-20020a056638151100b003323cb6a920mr798732jat.34.1656107240228; 
 Fri, 24 Jun 2022 14:47:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/11] bsd-user: Implement mount, umount and nmount
Date: Fri, 24 Jun 2022 15:47:32 -0600
Message-Id: <20220624214742.89229-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 52 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 13 +++++++++
 2 files changed, 65 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index b2dca586129..a0f03102639 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -549,4 +549,56 @@ static abi_long do_bsd_sync(void)
     return 0;
 }
 
+/* mount(2) */
+static abi_long do_bsd_mount(abi_long arg1, abi_long arg2, abi_long arg3,
+        abi_long arg4)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    /*
+     * XXX arg4 should be locked, but it isn't clear how to do that since it may
+     * be not be a NULL-terminated string.
+     */
+    if (arg4 == 0) {
+        ret = get_errno(mount(p1, p2, arg3, NULL)); /* XXX path(p2)? */
+    } else {
+        ret = get_errno(mount(p1, p2, arg3, g2h_untagged(arg4))); /* XXX path(p2)? */
+    }
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* unmount(2) */
+static abi_long do_bsd_unmount(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(unmount(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* nmount(2) */
+static abi_long do_bsd_nmount(abi_long arg1, abi_long count,
+        abi_long flags)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_READ, arg1, count, 1);
+
+    if (vec != NULL) {
+        ret = get_errno(nmount(vec, count, flags));
+        unlock_iovec(vec, arg1, count, 0);
+    } else {
+        return -TARGET_EFAULT;
+    }
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 2623caf8007..bd4dfa6ddc7 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -33,6 +33,7 @@
 #include "qemu/path.h"
 #include <sys/syscall.h>
 #include <sys/param.h>
+#include <sys/mount.h>
 #include <sys/sysctl.h>
 #include <utime.h>
 
@@ -373,6 +374,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_sync();
         break;
 
+    case TARGET_FREEBSD_NR_mount: /* mount(2) */
+        ret = do_bsd_mount(arg1, arg2, arg3, arg4);
+        break;
+
+    case TARGET_FREEBSD_NR_unmount: /* unmount(2) */
+        ret = do_bsd_unmount(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_nmount: /* nmount(2) */
+        ret = do_bsd_nmount(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


