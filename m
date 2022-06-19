Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C6550C7E
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:17:26 +0200 (CEST)
Received: from localhost ([::1]:48256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zUD-0001aZ-Og
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIb-0000wS-20
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:25 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIZ-0001Kb-JI
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:24 -0400
Received: by mail-il1-x135.google.com with SMTP id m16so4569876ilf.6
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BxjVu0p+Y0YRX0GMQzrHMgnKskB8sTbcjXqEo7rVcdk=;
 b=Q2OYbWer9yXlTElfK3DXznp+/GUPJLZP+Eo6nsJT3ojLaQTbJ36x5iQ/WKs9eazF70
 dHOW4HbH5xkequyvtFTsjhZAbf8bcsFcbD1Ow31XdbIWXo9I5HUx9ricnBbPOetBnKKG
 8LciAPgjjNDvZ3IZaH6uEwp/XFEtqN4Q4tnZvq4X7m0801RrvcuT0FaEHdctwtFhmLrv
 +SSvd0oXrIU07Hzhjb/IY51PKIoZwIb1qPAGc2MHUotup0sOS1LTwELzeSQ/NF4sf/Bd
 GeTCC/CY/FMI68hZvi3HkJ1t73UqD+eyPexcXVpUBkNcB8wHzmRI+EIUP0QqoW1YsvZd
 uYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BxjVu0p+Y0YRX0GMQzrHMgnKskB8sTbcjXqEo7rVcdk=;
 b=EWS7FXp5CS70e9zySy+Nb+n9pBW94oZqxIjJrxfK9znv5tGYHzvH0SOvxnwLbyVITJ
 q8FVGIaGfSYPaLi4ajo8HCvfWJ+nJDCp73B0x9GF64F6Rky/Bd3a4bsmP5eB9BbZnWjd
 3ld1BsCs1lh54xOJoa9FqNFU1amhfz3M2Tg26Lc3TgKQaRba83+7I0em12dL4t6lupnU
 LMgT0gQ9rd9FXy+VNSVEH5jFrndFWewn1Q7sg0TPWWiuaVOjSE652clOcHGO8NDLSu57
 z1tSNUn2NHTZ/B6eqChQNpsyZORA7AQp3+9jskVvOUzg78s6D7Y+3X7SMajs0QlkX750
 LXPg==
X-Gm-Message-State: AJIora9ACBODyCHdpTaSCSLV/UNUKl8MpQal7rWzcr6YsqMfYgHYc4Ks
 NNLS/3/nakf3l1j6GW4EzWUBWHANgl+8nQ==
X-Google-Smtp-Source: AGRyM1t7XWxQiwKobxlUZPtRQHEOz4DKbuXxp8uC6taq/lCxyVVI/y81ULYY1NSzpJ11eGnPd8C6dw==
X-Received: by 2002:a05:6e02:1a4d:b0:2d3:d2d2:1f47 with SMTP id
 u13-20020a056e021a4d00b002d3d2d21f47mr11429067ilv.234.1655661922612; 
 Sun, 19 Jun 2022 11:05:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PULL 08/11] bsd-user: Implement rmdir and undocumented __getcwd
Date: Sun, 19 Jun 2022 12:05:28 -0600
Message-Id: <20220619180531.9161-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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

Implemenet rmdir and __getcwd. __getcwd is the undocumented
back end to getcwd(3).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 29 +++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index a4c6dd52a20..8ec53145894 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -456,4 +456,33 @@ static abi_long do_bsd_mkdirat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* rmdir(2) */
+static abi_long do_bsd_rmdir(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(rmdir(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* undocumented __getcwd(char *buf, size_t len)  system call */
+static abi_long do_bsd___getcwd(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_WRITE, arg1, arg2, 0);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    ret = safe_syscall(SYS___getcwd, p, arg2);
+    unlock_user(p, arg1, ret == 0 ? strlen(p) + 1 : 0);
+
+    return get_errno(ret);
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 9381ddb5be1..e28a566d6c3 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -341,6 +341,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_mkdirat(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_rmdir: /* rmdir(2) (XXX no rmdirat()?) */
+        ret = do_bsd_rmdir(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR___getcwd: /* undocumented __getcwd() */
+        ret = do_bsd___getcwd(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


