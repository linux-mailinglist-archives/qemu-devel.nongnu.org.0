Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A549D47C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:27:08 +0100 (CET)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpop-0002vK-Gp
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dbzxYQcKCsoBu39A7uw44w1u.s426u2A-tuBu1343w3A.47w@flex--venture.bounces.google.com>)
 id 1nCpo0-00028Q-8Y
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:26:16 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=33734
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dbzxYQcKCsoBu39A7uw44w1u.s426u2A-tuBu1343w3A.47w@flex--venture.bounces.google.com>)
 id 1nCpny-0007yb-MT
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:26:15 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 u185-20020a2560c2000000b0060fd98540f7so1893120ybb.0
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=v4QEmUI9SkK9M3C8zfYhP5Whu+uSZGt4xx3pkgtBF14=;
 b=aapteQWbcpvw1Fji5i9BzsxkgDW3YSndFI9mhyNP7z4NMVg/y6K06OSKMdopGUSWJG
 dMMqGbq2C5ASKy1nRB6eSmsGWbhngJxrkCtsSeeOyR/1KnfdEUjBACMDaBgPxIHVb9aq
 0CjogE9wF2I/PsdpvYCyevp/tjVIwqtCTtvHEKZ9KpYXqLjzTtLcgntITjSVSwMDgxYM
 XPTsOQUN6/umt1ETHeHi3/JlqJ0WKCbcC6y6pfBo5yd50Spx0hDEfdfoZhScz7jffb4o
 HiEj4ETAyUeJQWMtGnLc6P4OqvfMkoeM9q8uk6En+VMRdQCnlS/Sa46hGL5g535XuMsh
 xukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=v4QEmUI9SkK9M3C8zfYhP5Whu+uSZGt4xx3pkgtBF14=;
 b=257LIjn3Xaf3juOtNRjDS9uGJyFHsc6Y7fAB11Ct54fnKbA6n4sTe5/Hh064yEA2ki
 QE+PtXX2UjZqZRCUGM3+LLg8Glc+3Nx18BUBejF1QuuwIo3KV6CKwjY29vOCF26GYjKU
 0ABdxH1y7c/K5GUnGmMaTQ2NUUxQe+NOe0Fcj1Wxk6H3NguiI65Owp03LEDuj3vQ/sUI
 xsV6ZxxV4ASi9OwNzQlwnl/jpN/N2/FBq1tnfxR0yncL0bZ17Jk7rvHQlP863JsYFE0M
 9xsL4jzJDnJsFtkdO+epo3NlhKg5VQEptHZSYwWX2/+yPeNlxk52NbnCSAYR6bduUnBn
 yIaQ==
X-Gm-Message-State: AOAM533GZqFYwPskgydT8DN/nSyqD0qlDoVgJF9bE+gqQDehyKWhHbEh
 /jC0U9sUJ2C5JDYD4Myd/3dRZEAyUr/4
X-Google-Smtp-Source: ABdhPJxLjnWqAZg6LHJfQZiioNDEBF3cc0RqQWE9QRP56I4826JcphU7vrIHITdJsjFWhRFXa2kQb6llXMeF
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:c75c:8ce4:97cf:a279])
 (user=venture job=sendgmr) by 2002:a05:6902:1205:: with SMTP id
 s5mr1519277ybu.676.1643232373015; Wed, 26 Jan 2022 13:26:13 -0800 (PST)
Date: Wed, 26 Jan 2022 13:25:59 -0800
In-Reply-To: <20220126212559.1936290-1-venture@google.com>
Message-Id: <20220126212559.1936290-3-venture@google.com>
Mime-Version: 1.0
References: <20220126212559.1936290-1-venture@google.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v3 2/2] linux-user: sigprocmask check read perms first
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, scw@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3dbzxYQcKCsoBu39A7uw44w1u.s426u2A-tuBu1343w3A.47w@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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


