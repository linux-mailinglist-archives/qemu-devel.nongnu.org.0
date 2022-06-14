Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539754A829
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:29:27 +0200 (CEST)
Received: from localhost ([::1]:50096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yBC-0007oO-Ae
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2E-0003js-5N
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:10 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2C-0001qY-LT
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:09 -0400
Received: by mail-il1-x130.google.com with SMTP id y17so5735494ilj.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJEGbDyUIR4TgYHaYi6XpxnqSx1t+dwpAGBFG5Z8F5Q=;
 b=mdKMSmITyKIZszHugUUg77IaBGAjt+A/alOG63l+gf7qagzfd2xNkPkpfHZHuFrUjA
 esY809lTS3+5qlBdtKKMaEEneDIuV3FNUJ2VEMrxLiGu3osGutQOBH61B1US9DUuI+AS
 sFxYc8lXQMbfgEmwaHdqGUbp0nL9u3tcZeTrzEF0e4vqoAu6YVEnmV0+5iJXIq1GPgFC
 xUAmjJb47DQo78GkgbBBhdEsIY0oTmb8mhl862R3H9W6WttKkxmd8vl7DSOIZA2OBrfR
 +j2+X2Fk8CRSshutB3USHWbyoTBdf5mOvZ+nNqhIqkL4pkklcMGiLkVCozD6LiBKorXu
 Ov4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJEGbDyUIR4TgYHaYi6XpxnqSx1t+dwpAGBFG5Z8F5Q=;
 b=mEVKwwo03QMp1e2ZZxgMIKlCnz7XQxx42T/Uefy0BnbaIKq4Z3kFF3xY+eNte0tbgY
 ATzf7GnH0VRS2yDOAWBVDWxTov1PyHDCc0k7OuAzJuv0gLWjGM02qZkWKRdv0FtcxMiP
 7i77Q2371O88CeeRmPYNXluALTGkoojJhPEj1VXIP1uIb7ToT3TRaW+FZIOt9vtC6h/D
 gs7DAtiGLSJqbGu1KLCOjJ4YnV7tzToTLVJsZxFAnpJyGzIgT+mASHtPYK4Oj/RvssJL
 Ov2JxEcdtK64rtb6+6Eco8mPqOq6Sw/JWBOhK1GJcsbiiiQ9mGs3Nx9iatxicsZiulay
 3l5Q==
X-Gm-Message-State: AJIora9e+29eQ5VPID5zywYMo8ZxvXLU/0nfO0OXf5VRGbcYhVXhm+5U
 ezq/qaOqVITNQC7ArOXz0JFrL/CEv53hNA==
X-Google-Smtp-Source: AGRyM1tHBPoYcb9nBGqBDzSisJ2TcN4Fdctazy2LjKOvqrG4HW39dxnEuu+/L4kj9EqqBMP8EGztBQ==
X-Received: by 2002:a05:6e02:168a:b0:2d3:c56d:8042 with SMTP id
 f10-20020a056e02168a00b002d3c56d8042mr1917273ila.236.1655180407472; 
 Mon, 13 Jun 2022 21:20:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 10/11] bsd-user: Implement trunctate and ftruncate
Date: Mon, 13 Jun 2022 22:20:09 -0600
Message-Id: <20220614042010.40327-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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


