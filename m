Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B954A7CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:22:33 +0200 (CEST)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0y4W-0006Mp-Ql
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y27-0003TR-9T
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:03 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y25-0001dU-Kl
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:03 -0400
Received: by mail-il1-x136.google.com with SMTP id u2so5764230iln.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uedUQ2KHIZe9tCAw1aTgfSJGduq3Rf0+S18JxCMy0Hg=;
 b=0WS2XlJokgZPRu33CQBIT4WdUP2FVpAm5PpswM/4p1M5Kt+h5A4i9hwRCOaLVtplH+
 LMyxbzjGVQoXQkvYhX6Ear4D74q8hwANjx9RpaCiMxk4eS5Q/8qLklIR9nhR3WInZHw/
 ynXDqXLWiyF4PU2xdsvZtNppI037WYpN6qpO+KVFV3JYax/yzq15LZzycPemAWqTHjGC
 wDmj7tUz6XFA0sIIFhkyoS4+oW8oM/lLwb4ni42sTbVjuGBMMxv4mlXM1wkePLzsp+9h
 Jd+QlRg/I8fYfu3+X8C2jBD9kddEdnong7mZzUddpuBv7BzJLFJBZ6hoYybIAfL5Oyje
 3FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uedUQ2KHIZe9tCAw1aTgfSJGduq3Rf0+S18JxCMy0Hg=;
 b=dz2TEJ5OUh15N+1ryapcnlAhST9X+X/Wt4qqXyPWgCib6GAA4CZUviPEmM3du+JOVZ
 r80hXMC4f+UgppzZ2lveyTW3xGMtNSnnJDXQKb8X/OjAIFs0dV6BnmlcomXvFvj/9ZNP
 Rcqm3a4gl6xsdFzYFmCeq9tgfgnNh4KUaPj+NEyoNf33JzXxdgYgIkvNEc2ZBSanDbPs
 UUMVfr8TYdzfAwue3ME1xZkRt4VWIzLbPrGlaFqDjXcxAhS0nG8ffhEs+TRyZUrnhBCE
 huOUF/Hd4Kgw9kQASweLDDW1s9RhvSspzHqzmsby4lx14fc6zLDv45CQ9JwtTrZDtqX7
 aGpw==
X-Gm-Message-State: AJIora9+BvqCwgeO7/iKGoZh9c915wY6a5NF667vlxtgkLULBJN/h7cb
 3vrPeRn29y6EeaG5G8iwXAdgssDICweBWQ==
X-Google-Smtp-Source: AGRyM1vpDR29inae6Y88v7lUvItLyVK/lbOCDI/tlcyhFU4LITSRh92TlWjqosJ89+UIcp+fUcQu0w==
X-Received: by 2002:a05:6e02:1a0b:b0:2d3:d8b3:10c4 with SMTP id
 s11-20020a056e021a0b00b002d3d8b310c4mr1947209ild.164.1655180400303; 
 Mon, 13 Jun 2022 21:20:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:19:59 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 03/11] bsd-user: Implement revoke, access,
 eaccess and faccessat
Date: Mon, 13 Jun 2022 22:20:02 -0600
Message-Id: <20220614042010.40327-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
 bsd-user/bsd-file.h           | 53 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 +++++++++++
 2 files changed, 69 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 94eb03df62e..6ff2be24e30 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -258,4 +258,57 @@ static abi_long do_bsd_closefrom(abi_long arg1)
     return get_errno(0);
 }
 
+/* revoke(2) */
+static abi_long do_bsd_revoke(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(revoke(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* access(2) */
+static abi_long do_bsd_access(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(access(path(p), arg2));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* eaccess(2) */
+static abi_long do_bsd_eaccess(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(eaccess(path(p), arg2));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* faccessat(2) */
+static abi_long do_bsd_faccessat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(faccessat(arg1, p, arg3, arg4)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index f7d09909925..7b7af914e49 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -285,6 +285,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_closefrom(arg1);
         break;
 
+    case TARGET_FREEBSD_NR_revoke: /* revoke(2) */
+        ret = do_bsd_revoke(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_access: /* access(2) */
+        ret = do_bsd_access(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_eaccess: /* eaccess(2) */
+        ret = do_bsd_eaccess(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_faccessat: /* faccessat(2) */
+        ret = do_bsd_faccessat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


