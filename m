Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810F1AE13E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 17:36:15 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPT2M-0005NE-92
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 11:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thatlemon@gmail.com>) id 1jPT1B-0004Ij-0i
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:35:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thatlemon@gmail.com>) id 1jPT19-0008B3-Iv
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:35:00 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55016)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <thatlemon@gmail.com>) id 1jPT19-0008AJ-AJ
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:34:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id h2so3343283wmb.4
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=kkCLmi9oWjBzkBGULATx+MJSyq22Wa4RJ0EZaDJRy5w=;
 b=K9tgLHv/JApizKWcV3P8cHsOfW4snIrnooSzSj9xx6E+9vIh09hQa6E93zRo1ZnPvt
 5hA1hNQPZo9NgcoMEqTdcunk4MQdVkE1D6//qiyGFtXMElYIDmSrdtSJesc6t/7RD6qu
 nntEEUSOAjzyktBBzySnFUn3FL2yXLzhIRjdFW7G3m7oU40j6Uwj73JBcvLgClBt5wwY
 7XcK7X5TK+nKvZN5XuYT8Mkgvip2kGqKcRDGFl1yVo/u4T9wva6iCDMay/4ftyMQ+sPc
 GgFylIbZSKyxN2tEeap0yqyYq0zC4Q8E+NQ+mTgQxn/de7e5jdsUUgOd4orwpNkFTAjD
 R6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=kkCLmi9oWjBzkBGULATx+MJSyq22Wa4RJ0EZaDJRy5w=;
 b=jOHTWPAScfWno9RIVByYuwG2AYHZ44nDeSYe0g8QKjpj/hhXoffQHbeI+25PxlOjsA
 U83ztkfLyvd6SuQU01qVHneQEOECpnx9vHwieZTNrWpLNZ1vUybutNaSLsgYTzKMdT+0
 gIKUyMtaKmIgwRJAyYC0t9P86fKpQ7i8FhqUpX8xTtfnWwuwBg+StzF1lvoqL35bgCq+
 eNBQIjVPgLMwtacsTvtnSE4eW+7jxdpu1BNYg+9gaHLpEN0vduwPumcS/7+4BfO9y43n
 zfcWmoR0fbjboX/puFzkkK2vq/8exaQPALluTlfXN+378rzMSbFKRvtfNJv51kC3K5kj
 4qqg==
X-Gm-Message-State: AGi0PuZqlUFni8mYnI8GW8sTYHIeciV4j1a2SLPUYQtDK2DQLgt+rxKp
 gpUlPBKxyw9ZPKzMBsQh+Bk=
X-Google-Smtp-Source: APiQypJNuD/jykxSp/AiGq+uEbd9EcH7ayPUxYLINovnrPQCwpFXEmbYsuxZFvzL5AYgkGlZH8+9EQ==
X-Received: by 2002:a1c:9891:: with SMTP id a139mr4235281wme.129.1587137696908; 
 Fri, 17 Apr 2020 08:34:56 -0700 (PDT)
Received: from [192.168.1.199] (93-43-179-29.ip93.fastwebnet.it.
 [93.43.179.29])
 by smtp.gmail.com with ESMTPSA id t63sm2738680wmt.37.2020.04.17.08.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 08:34:55 -0700 (PDT)
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
From: LemonBoy <thatlemon@gmail.com>
Subject: [PATCH] linux-user: Prevent crash in epoll_ctl
Message-ID: <a244fa67-dace-abdb-995a-3198bd80fee8@gmail.com>
Date: Fri, 17 Apr 2020 17:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From 894bb5172705e46a3a04c93b4962c0f0cafee814 Mon Sep 17 00:00:00 2001
From: Giuseppe Musacchio <thatlemon@gmail.com>
Date: Fri, 17 Apr 2020 17:25:07 +0200
Subject: [PATCH] linux-user: Prevent crash in epoll_ctl

The `event` parameter is ignored by the kernel if `op` is EPOLL_CTL_DEL,
do the same and avoid returning EFAULT if garbage is passed instead of a
valid pointer.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
---
 linux-user/syscall.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 674f70e70a..a51ff43f9b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12020,17 +12020,25 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         struct epoll_event ep;
         struct epoll_event *epp = 0;
         if (arg4) {
-            struct target_epoll_event *target_ep;
-            if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
-                return -TARGET_EFAULT;
+            if (arg2 != EPOLL_CTL_DEL) {
+                struct target_epoll_event *target_ep;
+                if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
+                    return -TARGET_EFAULT;
+                }
+                ep.events = tswap32(target_ep->events);
+                /*
+                 * The epoll_data_t union is just opaque data to the kernel,
+                 * so we transfer all 64 bits across and need not worry what
+                 * actual data type it is.
+                 */
+                ep.data.u64 = tswap64(target_ep->data.u64);
+                unlock_user_struct(target_ep, arg4, 0);
             }
-            ep.events = tswap32(target_ep->events);
-            /* The epoll_data_t union is just opaque data to the kernel,
-             * so we transfer all 64 bits across and need not worry what
-             * actual data type it is.
+            /*
+             * before kernel 2.6.9, EPOLL_CTL_DEL operation required a
+             * non-null pointer, even though this argument is ignored.
+             *
              */
-            ep.data.u64 = tswap64(target_ep->data.u64);
-            unlock_user_struct(target_ep, arg4, 0);
             epp = &ep;
         }
         return get_errno(epoll_ctl(arg1, arg2, arg3, epp));
-- 
2.20.1

