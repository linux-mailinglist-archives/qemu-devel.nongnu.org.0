Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B98F36A231
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:46:56 +0200 (CEST)
Received: from localhost ([::1]:42724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLQl-0005Xp-DW
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKio-000617-2u
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:30 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiO-0004Li-CA
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:29 -0400
Received: by mail-il1-x131.google.com with SMTP id a9so1188101ilh.9
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AW8Ml+/YNE+c65+lgJayPesQmaT8Aad6d4PcEHSzYQw=;
 b=qymgdilrpWDdF3GlMGmvOz+KUUAZKhjcLItWxt4m4zHbSE/vRpvdx48BxUHZnV7uB+
 cLJPvgSTrYhIi8xZ4+Ze2WeY4EdEi1kLgRTYAV7flAJ/r81d/xbwff7V0WnjJlyppIKx
 49oXMhpZTVGz1Ws5biigUf2xwKB/JPzymvG39f2s9ezE8SRslv5ky2xSwG7+K77ySIKH
 a9YtwKvkcxIaCpKlQJzKHAn+3SJqyNR5zfYdYqh2zRmpf1jDnhflaJIsMkwZCYV9FElP
 nAJ72PU/rpEzUeFS1ZROLNWHJhpciIs/tF+IgYzL8I5ZXzd+BndtROKL/cjpPMcQkIVp
 4XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AW8Ml+/YNE+c65+lgJayPesQmaT8Aad6d4PcEHSzYQw=;
 b=fq6Ku516D8HmIpEMKcVIDfgabA5BJTqq1n2Vx+Uf4NFc6xiQQ2qMp276dR69NaXzi3
 GRKij71hpecrKvWBqp93+jdCZ5+vEMpq9IR3yd9rGpxjthjB9zTsNPM1JO8yvApT708/
 zPhd2dTxc0a4IdLmp9PC5wVwHEYCbI/vkCwy+20x1lOlpjhOGO1sEgqCrKAzddmyMoAE
 WeIlGh3eSUeo9+4fmvOPbq22ajPRFxHqU774Ewv5l141IXezArmQD7en4g7l48pbLNLu
 5pXd7GO8gX8YaM6Tud52iz24qpUyX8/z7ryIkCUMJbXb0EM3pr6g5dLAtH2MxMt/V4pI
 5rjA==
X-Gm-Message-State: AOAM532oH3S2yqwidEJNTeXRP4JlKG9dFYD+OLMUk6kIbCLOwsx3F84A
 QSZVfewkk4MeiJFJiKf0bNs1aEQo4jDsQl2U
X-Google-Smtp-Source: ABdhPJxpItEusyUsEoST9c3jVtymwUFhQi1cBwslOQsdKGq8HUMWulv9weAPDbAbdOlO2H5oCKQ6Vw==
X-Received: by 2002:a92:d58a:: with SMTP id a10mr6980426iln.170.1619280061651; 
 Sat, 24 Apr 2021 09:01:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:01 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/48] bsd-user: style tweak: spaces around operators and
 commas
Date: Sat, 24 Apr 2021 10:00:10 -0600
Message-Id: <20210424160016.15200-43-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 3352735c68..5e033e8bf4 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -77,8 +77,8 @@ static abi_long do_obreak(abi_ulong new_brk)
     /* We need to allocate more memory after the brk... */
     new_alloc_size = HOST_PAGE_ALIGN(new_brk - brk_page + 1);
     mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
-                                        PROT_READ|PROT_WRITE,
-                                        MAP_ANON|MAP_FIXED|MAP_PRIVATE, -1, 0));
+                                        PROT_READ | PROT_WRITE,
+                                        MAP_ANON | MAP_FIXED | MAP_PRIVATE, -1, 0));
 
     if (!is_error(mapped_addr))
         target_brk = new_brk;
@@ -158,7 +158,7 @@ static abi_long do_freebsd_sysarch(void *env, int op, abi_ulong parms)
 static int
 oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
 {
-    int qoid[CTL_MAXNAME+2];
+    int qoid[CTL_MAXNAME + 2];
     uint8_t buf[BUFSIZ];
     int i;
     size_t j;
@@ -241,7 +241,7 @@ static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong ol
         return -TARGET_EFAULT;
     holdlen = oldlen;
     for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++)
-       *q++ = tswap32(*p);
+        *q++ = tswap32(*p);
     oidfmt(snamep, namelen, NULL, &kind);
     /* XXX swap hnewp */
     ret = get_errno(sysctl(snamep, namelen, holdp, &holdlen, hnewp, newlen));
@@ -271,7 +271,7 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for (i = 0;i < count; i++) {
+    for (i = 0; i < count; i++) {
         base = tswapl(target_vec[i].iov_base);
         vec[i].iov_len = tswapl(target_vec[i].iov_len);
         if (vec[i].iov_len != 0) {
@@ -283,7 +283,7 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
             vec[i].iov_base = NULL;
         }
     }
-    unlock_user (target_vec, target_addr, 0);
+    unlock_user(target_vec, target_addr, 0);
     return 0;
 }
 
@@ -297,13 +297,13 @@ static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for (i = 0;i < count; i++) {
+    for (i = 0; i < count; i++) {
         if (target_vec[i].iov_base) {
             base = tswapl(target_vec[i].iov_base);
             unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
         }
     }
-    unlock_user (target_vec, target_addr, 0);
+    unlock_user(target_vec, target_addr, 0);
 
     return 0;
 }
@@ -393,7 +393,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_FREEBSD_NR_syscall:
     case TARGET_FREEBSD_NR___syscall:
-        ret = do_freebsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,arg7,arg8,0);
+        ret = do_freebsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5, arg6, arg7, arg8, 0);
         break;
     default:
         ret = get_errno(syscall(num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
@@ -472,7 +472,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_NETBSD_NR_syscall:
     case TARGET_NETBSD_NR___syscall:
-        ret = do_netbsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,0);
+        ret = do_netbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5, arg6, 0);
         break;
     default:
         ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
@@ -551,7 +551,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     case TARGET_OPENBSD_NR_syscall:
     case TARGET_OPENBSD_NR___syscall:
-        ret = do_openbsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,0);
+        ret = do_openbsd_syscall(cpu_env, arg1 & 0xffff, arg2, arg3, arg4, arg5, arg6, 0);
         break;
     default:
         ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
-- 
2.22.1


