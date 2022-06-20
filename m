Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD85522E2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:46:10 +0200 (CEST)
Received: from localhost ([::1]:49792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LTV-0007lX-Pj
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPe-00055z-1S
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:10 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPb-00081a-Cd
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:09 -0400
Received: by mail-il1-x12f.google.com with SMTP id z16so64026ile.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxN5+FtiUGJyc7XVu/a8YwMMoYC5uxl3zjuqzVgtANI=;
 b=0zQRB+qSt4k4VWKGeJYN/pCrhbSmpmFH3i0sV2803cWGNbps9CcjZkgtgdSWB5oRZe
 B8VaAn+w70pbAkFHTiazVowb6zvKp3S39H+fIORLjKAaJbiCka+F0VyYdpSCKksnNpGU
 TcTdO+4BiaYeI0z1UghOHmHmq5kq2yaTIwtPAaPDX801GKa0wn4pM71pGkHyBfcWMO5A
 H8rr7EhO4KA0WxEeH/8V8bpZPF+sBkHC6G0MU7aP2YmW5mxiNEv6/JEZHIWkLwPo8XUg
 mepjaBvJvwtBfQYu8QqSthnCbxOGeTXZ5gcZmJwUU1HMqyNaW8dFzk3hOmm8pVTX8h2f
 fZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxN5+FtiUGJyc7XVu/a8YwMMoYC5uxl3zjuqzVgtANI=;
 b=yvYD9oeqqe2PKVi75Fn2FRy0aIKFbPuvry71Nx6ZEBsefR5Na1J9tRDVJwNtEVQjPF
 XI/RLEWst51KISRIUsyu0bggUW1IlMm4nwn3zI9BiyZVi1Ejlc0q117DNJkrmIXvECvR
 4c+WVvM2Agf0nLfzU6CcAem/ow39wSSho/gqgo1T7pdiN5nWT1qh+yP6liWhTDoAG1xG
 iKPL3Uxumil8jbG0Qo+BNsmobBc724E+IfJdkMXUiYRcEwsGrPeOG06keG6sTcIo+t8c
 fYnLFq6iOFjYC3pK+9biC/Ceot0vbMAd64FbVvwWx2mIM2Ut5yG+aVPkFBZhsiTAj5qB
 24pg==
X-Gm-Message-State: AJIora8GEFXZrP7/s5Nq8rqWHAlS7UkTftvLN4gjOjo3pS6PvUVl8ogZ
 b5lTfYuAgZxho5daE/v4rmXBGR7abHR+Kw==
X-Google-Smtp-Source: AGRyM1tf5YB2YDM0a9S/bKyEX98Y9ckE3PIpWN11G04jQqozLvmvsXIDClICmg57InfF0AAjblwG5g==
X-Received: by 2002:a05:6e02:1564:b0:2d6:5b63:80ec with SMTP id
 k4-20020a056e02156400b002d65b6380ecmr13759837ilu.46.1655746926025; 
 Mon, 20 Jun 2022 10:42:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH 01/10] bsd-user: Implement mount, umount and nmount
Date: Mon, 20 Jun 2022 11:42:11 -0600
Message-Id: <20220620174220.22179-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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
---
 bsd-user/bsd-file.h           | 52 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 13 +++++++++
 2 files changed, 65 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index b2dca586129..4545df3a056 100644
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
+     * XXX arg4 should be locked, but it isn't clear how to do that
+     * since it's it may be not be a NULL-terminated string.
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


