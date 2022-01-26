Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23249D18A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:15:51 +0100 (CET)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmpi-0002DF-RO
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36IvxYQcKCtsSBKQROBDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--venture.bounces.google.com>)
 id 1nCmh8-00009w-8B
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:06:58 -0500
Received: from [2607:f8b0:4864:20::a49] (port=55277
 helo=mail-vk1-xa49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36IvxYQcKCtsSBKQROBDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--venture.bounces.google.com>)
 id 1nCmh6-0002GY-9e
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:06:57 -0500
Received: by mail-vk1-xa49.google.com with SMTP id
 d14-20020a056122032e00b00320364e9d66so131884vko.21
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 10:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fgS+QNTtfMyzoGQEpgY8eyTtvHgIOBV5p9Tua/RmFdA=;
 b=W+cNmYtpWtjHjzixv0dicxr+tblXcZOwaaVCfVZhrIJaJPv7milz+PqVRbwnUGV8MU
 Pb60r2dLV6dWmsjnOTEwoTSjHhMhSJfqicCqMCUNnVusQJgTdsLouC7iV2GQdmHZhmlX
 ultTmHapp8PmnYjrKwPrfW/aMG421+u/4LNCzWwQrRNCvFnRBZlGxf7Sx3THgoCtfr2F
 miOB/NgHrRUCa2CN9WCY6fIqU1OJ3Au7K2VNOujwvMkCvRG1p/nQzcy9A8MLVvfLzwoN
 LnjV0L7NQdB0q41UH5dGdKuwOWLrIynWR5VHStv7V7MWrAvV4e1Qmozfj+lDCfK9h7MY
 wlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fgS+QNTtfMyzoGQEpgY8eyTtvHgIOBV5p9Tua/RmFdA=;
 b=09yd+CduJ0xol/AXYD23EYbHzAV0nHesVsSocQQ3t65OwqPhSWAVDMeK02cgbunqK0
 rHnKmiIyBxfeOybCUVvmv7yxzJgDzOoaWyM7ZN3uTZHeolaZMoUdVpBh/89/l8vCs6Vf
 S1CTLJ3e8yZhSYpGGmnL5SzIyJ7hg7Ca9dwGsabTM0bhCLmMXy9WImFNH8rVmNKucx2Y
 tuX+e+0Sp9h9039LcReVowamFVjAVYXkl9xt6GnJ8bwn/XtwgPCe8d6h0OpNb7aV8r5L
 9mOW8rt40MrfLD5ohWNktMajNKzfFlCopa4MNwSk6/ka5+BeTA13LAzbaTgj2mEbvyDV
 bxxA==
X-Gm-Message-State: AOAM531b0Om37hh6AmKjTbo/3Q8SkevZV8EbvOYrQBMMUTaJDCoH29Vm
 rPqzOXZSMfmre2giqmEw1O0SXF9yFudC
X-Google-Smtp-Source: ABdhPJzc0zh6wcaWylCJ58AI8TjuXMfytURKa4jaEtddR2co1TL2X0nEtBkP9eMjspqabLc6hepk1QttOpIS
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:c75c:8ce4:97cf:a279])
 (user=venture job=sendgmr) by 2002:a81:4e8a:0:b0:2cb:4b73:47c9 with SMTP id
 00721157ae682-2cb4b734c3emr6745537b3.380.1643219944111; Wed, 26 Jan 2022
 09:59:04 -0800 (PST)
Date: Wed, 26 Jan 2022 09:58:50 -0800
In-Reply-To: <20220126175850.1904968-1-venture@google.com>
Message-Id: <20220126175850.1904968-3-venture@google.com>
Mime-Version: 1.0
References: <20220126175850.1904968-1-venture@google.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v2 2/2] linux-user: sigprocmask check read perms first
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, scw@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=36IvxYQcKCtsSBKQROBDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--venture.bounces.google.com;
 helo=mail-vk1-xa49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Linux kernel now checks the read permissions before validating `how`

Suggested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Patrick Venture <venture@google.com>
---
 linux-user/syscall.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 34bd819e38..210483d4e4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9465,6 +9465,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             int how;
 
             if (arg2) {
+                p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1));
+                if (!p) {
+                    return -TARGET_EFAULT;
+                }
+                target_to_host_old_sigset(&set, p);
+                unlock_user(p, arg2, 0);
+                set_ptr = &set;
                 switch (arg1) {
                 case TARGET_SIG_BLOCK:
                     how = SIG_BLOCK;
@@ -9478,11 +9485,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 default:
                     return -TARGET_EINVAL;
                 }
-                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
-                    return -TARGET_EFAULT;
-                target_to_host_old_sigset(&set, p);
-                unlock_user(p, arg2, 0);
-                set_ptr = &set;
             } else {
                 how = 0;
                 set_ptr = NULL;
-- 
2.35.0.rc0.227.g00780c9af4-goog


