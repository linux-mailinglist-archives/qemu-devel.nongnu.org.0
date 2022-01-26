Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311049D491
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:34:22 +0100 (CET)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpvo-0006fe-OW
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3b7zxYQcKCsQ5ox341oqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--venture.bounces.google.com>)
 id 1nCpuP-0005zF-HR
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:32:54 -0500
Received: from [2607:f8b0:4864:20::a49] (port=56028
 helo=mail-vk1-xa49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3b7zxYQcKCsQ5ox341oqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--venture.bounces.google.com>)
 id 1nCpuM-0000YB-TO
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:32:52 -0500
Received: by mail-vk1-xa49.google.com with SMTP id
 b26-20020ac5c4fa000000b0031fa5646ccaso329839vkl.22
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=iyWbyef8NHlaoWllNSDyw+o1ffCncediRvKWa3WPyvY=;
 b=nOxPsZN7N9DWftMrbW0RhZYn+nLOnR/m8HLFg4XdJoFKG7K6h8T7c9sy2t3EceA+1Q
 UOh5jmHA2gmwt3bJDN7oAaPAb/Srh3yJ3p/MIfpiw+zkNEa/Ejvnzm6fj8S9lRt5yfLt
 zVCozL6ZGwflbLy/QXBalOvZK2YCpuFbF+aCr4t1TmWEn5qs9eK1lG+m3BDUhsex7nI0
 XpNb8xnVAvMl++oTG3IoZxipQWAeKyqQ3h5lqH8u2MxkOYl13PTiRUnoA0Kt6ZYMIV4v
 oFl0F4fQifOk0Y8f+DZuRlp7B8JWrfDo/vO8VD/jR5HLJM1mD1klnZk6AQqJy/nG5kU1
 Bs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iyWbyef8NHlaoWllNSDyw+o1ffCncediRvKWa3WPyvY=;
 b=0oDJcfEpiR44Eq95hwmQFTkpENNeFpZ+yPrY1xXBzhjU6jW9fqyovc78RKtIdWUc7d
 nsGKnFV9bf+GCSdU+tUGq9/y+cbQR6B6Y9OHWFUTdEMzRLL8+lB+j2GOsazLNru2+peF
 U8SNO63x7gyIiYu00aIbi5FdoEfbfQcWlHAoCH98Y+UHqB/TCBR2RBQ0RpAjoncrdrcs
 mjdb86C+aXOu/PQM1Uzzf62VFnCJi9/j0hc6T+BNfga9+k7tsYbZHtrWshdkIaFJRvsy
 A3D3fjwmyw07xIb4VKz7AkM/XuCoe+4KjAc/vzBjY5cQakN8AkxtKIoj4YOGw7zihrkF
 whTg==
X-Gm-Message-State: AOAM532bSzKZxTODuDr56M3+RAMeZNj4w+aCRkTEJzWKmSkgJFACbS4O
 14I0EVL1jYPcHF9CADUZqw7E/QwGZdzL
X-Google-Smtp-Source: ABdhPJwgJRovEXaRsj/WDip0215IuDpE+lgiJT9d94y1LcvR22kNw0nKS8jUB2lrQZnZsdf+q5FbazO4IXc7
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:c75c:8ce4:97cf:a279])
 (user=venture job=sendgmr) by 2002:a81:a241:: with SMTP id
 z1mr0ywg.250.1643232367622; Wed, 26 Jan 2022 13:26:07 -0800 (PST)
Date: Wed, 26 Jan 2022 13:25:58 -0800
In-Reply-To: <20220126212559.1936290-1-venture@google.com>
Message-Id: <20220126212559.1936290-2-venture@google.com>
Mime-Version: 1.0
References: <20220126212559.1936290-1-venture@google.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v3 1/2] linux-user: rt_sigprocmask, check read perms first
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, scw@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=3b7zxYQcKCsQ5ox341oqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--venture.bounces.google.com;
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

From: Shu-Chun Weng <scw@google.com>

Linux kernel does it this way (checks read permission before validating `how`)
and the latest version of ABSL's `AddressIsReadable()` depends on this
behavior.

c.f.  https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Patrick Venture <venture@google.com>
---
 linux-user/syscall.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..34bd819e38 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9508,6 +9508,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
 
             if (arg2) {
+                p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1);
+                if (!p) {
+                    return -TARGET_EFAULT;
+                }
+                target_to_host_sigset(&set, p);
+                unlock_user(p, arg2, 0);
+                set_ptr = &set;
                 switch(how) {
                 case TARGET_SIG_BLOCK:
                     how = SIG_BLOCK;
@@ -9521,11 +9528,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 default:
                     return -TARGET_EINVAL;
                 }
-                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
-                    return -TARGET_EFAULT;
-                target_to_host_sigset(&set, p);
-                unlock_user(p, arg2, 0);
-                set_ptr = &set;
             } else {
                 how = 0;
                 set_ptr = NULL;
-- 
2.35.0.rc0.227.g00780c9af4-goog


