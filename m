Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8F156408F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:02:25 +0200 (CEST)
Received: from localhost ([::1]:35382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dhY-00065f-Ct
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc5-0006cj-K9
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:45 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:43965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc3-0000Zy-Ly
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:45 -0400
Received: by mail-io1-xd2c.google.com with SMTP id p69so4709311iod.10
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gFTuenHsOjgeoRs6av29ZkHUZxMNdZzBHc5JK4Uv6M=;
 b=LKKcNMqr68kvvwO6+XkF3ZpAbNw06W+U13pWkzAoAy3OqAPnNx7nW4hqUbCmTdhpsf
 k6brpnUREdnfp8CfQYvXZwqXEDZpG4uy/8GlnrDzTlrtNYsjm+SJ2x9h0EzfwGKkqtXR
 8sM91AEspnTdAmm6VhznUOWaGko8CAZ4hcwuSaI+6Bx30D+4ajES799UN/UZ4a4hnQMV
 EDmF6hiryICTyNRKElVxBYVXcYRmSQKAmFmOfK5Me6fUPgSLRnaSqlM+PqcwjP/11EXN
 QK4RXlVu91vh7ehQTcMAXFcXkqyMx9HEurwMWFPOBPgy8i/HikDIlPNDoYsocSLPsirx
 WbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gFTuenHsOjgeoRs6av29ZkHUZxMNdZzBHc5JK4Uv6M=;
 b=6MOuRhN9RZrJV7mDQ0vyZ1CVehba4hHOy/HcwG3qqAgg4LH6nIJRlipggvQabU+LW2
 dpTKKRkgRkJIMHE1f+pUaPA3ymjHvZ52NpF6t6Gfew6piUbkBomjYZhUtsFsmiRYdYCB
 AkBeuXbApxZcRxAe39ieR/Y+ZCDr6KUptx+vXIX0XmuVkdTY13P12nQ2BDF+tyBFP3Mm
 Smw1RoBje60gKOV4RO6GNcsKqL2pD7yJr0sIq6Bm3UQn5PQe+g75LVKkUxPKiJXELu71
 rBt58QjCGjf5ZKwCesY2gRfxgyuCNZNle2DaHwKN7D85Mf3gBNV5tSqdPIbpnTQNba3t
 avyg==
X-Gm-Message-State: AJIora/qKSrBwk+n5s6iv4oj63hF2Imu8IE1UdNbgnQg5vEdtLjdC1Ri
 yhu3i1i2QI8d5sW61ufCH2Kz7h1xxeQwbQ==
X-Google-Smtp-Source: AGRyM1vHKxoDlmLXejgMtnur/ZbSQ5mvCps5XRO2cFJQXlG6srG0+iyTyVsnZ6c8/uLPZ+R+WtaM3A==
X-Received: by 2002:a6b:b74e:0:b0:675:594e:140d with SMTP id
 h75-20020a6bb74e000000b00675594e140dmr10508077iof.154.1656770202306; 
 Sat, 02 Jul 2022 06:56:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/11] bsd-user: Implement symlink, symlinkat,
 readlink and readlinkat
Date: Sat,  2 Jul 2022 07:56:57 -0600
Message-Id: <20220702135706.73622-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
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
 bsd-user/bsd-file.h           | 74 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++
 2 files changed, 90 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index a0f03102639..635ac8d0e62 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -601,4 +601,78 @@ static abi_long do_bsd_nmount(abi_long arg1, abi_long count,
     return ret;
 }
 
+/* symlink(2) */
+static abi_long do_bsd_symlink(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    ret = get_errno(symlink(p1, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* symlinkat(2) */
+static abi_long do_bsd_symlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg3);
+    ret = get_errno(symlinkat(p1, arg2, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg3);
+
+    return ret;
+}
+
+/* readlink(2) */
+static abi_long do_bsd_readlink(CPUArchState *env, abi_long arg1,
+        abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH(p1, arg1);
+    p2 = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+    if (p2 == NULL) {
+        UNLOCK_PATH(p1, arg1);
+        return -TARGET_EFAULT;
+    }
+    if (strcmp(p1, "/proc/curproc/file") == 0) {
+        CPUState *cpu = env_cpu(env);
+        TaskState *ts = (TaskState *)cpu->opaque;
+        strncpy(p2, ts->bprm->fullpath, arg3);
+        ret = MIN((abi_long)strlen(ts->bprm->fullpath), arg3);
+    } else {
+        ret = get_errno(readlink(path(p1), p2, arg3));
+    }
+    unlock_user(p2, arg2, ret);
+    UNLOCK_PATH(p1, arg1);
+
+    return ret;
+}
+
+/* readlinkat(2) */
+static abi_long do_bsd_readlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH(p1, arg2);
+    p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
+    if (p2 == NULL) {
+        UNLOCK_PATH(p1, arg2);
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(readlinkat(arg1, p1, p2, arg4));
+    unlock_user(p2, arg3, ret);
+    UNLOCK_PATH(p1, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index bd4dfa6ddc7..80ec9dd4954 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -386,6 +386,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_nmount(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_symlink: /* symlink(2) */
+        ret = do_bsd_symlink(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_symlinkat: /* symlinkat(2) */
+        ret = do_bsd_symlinkat(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_readlink: /* readlink(2) */
+        ret = do_bsd_readlink(cpu_env, arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_readlinkat: /* readlinkat(2) */
+        ret = do_bsd_readlinkat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


