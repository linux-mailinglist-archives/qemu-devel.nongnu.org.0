Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B037CE5F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:20:26 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsX3-0001iY-Jg
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUZ-00079M-36
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:52 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:43645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUM-0008L6-3f
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:49 -0400
Received: by mail-il1-x130.google.com with SMTP id j20so20760919ilo.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yWXUyWETpLT8cYtiPoj8jXWwE01ysUMsOZKweL2JKVo=;
 b=MQol5lSN6Z3knNoh4WyVmdV12HQxnhfEt7L2JUcrp6Ev2sEZHbgsPq7c0zZ4TnC+GA
 lULL4Ca6xi7H2MMtLAizEdHGdCNvdCd/tCAth2ywNLw0HB0+BMjGNeIcI4OIBsf66NrO
 yicVjWonIBqx/6ygV6P9uvsCexq4YcodLOciKIukp+FwrPPTHXKyXTm+yHE+oy9FAyqR
 B2QVFLWmo/coOoAlkiAZi3+r99VozxLgD3W6HeUdgcr1yaoXYyRYDnYS++IDCwgzR9Ta
 W3Rin3NF/wezyonF+EcL7b5+0S9ng8MkPgXEs2T182rG9Gkql5BFg8YmMCzJBYyN1WyO
 u5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yWXUyWETpLT8cYtiPoj8jXWwE01ysUMsOZKweL2JKVo=;
 b=EC0TpIJfd4LFCgxUBWL33KPZReAw6VDp17SEPCLtAgm7aobDRw5TuCHxgmMDHyU+jS
 wlPcFy5M0iicHJrMWl7VBaL/E1FYjT5NSg3QbDAXyfffw5FCoIFLDC8tOV2S62epr313
 nMOPr7UF8VrQWNOU+O9p9KRHDe0gvfPGyA4nYm/yD5bdJfIZtRkk2OyUChSY3RShwOcM
 vVkYPJDdfCAH5VDy0/jiQgttmoGrI2UotnC+Gu20T9GgwV190ugElAFkVDrIiNER5LKp
 KIbjpA0i4lX6cY2uMSa9jTQOGLeTYt2jER01iZVz+zU8PzmqDNwNziDBYO/2UB4TSET5
 g47w==
X-Gm-Message-State: AOAM533gbxh2Xoc8XLDh+OoRLjJ3Ediuhoh/esFA8JVvFFgWdaiFr8+P
 dOVvloqkyGyw+N0Lv4myna71eZ0HGvVA1Q==
X-Google-Smtp-Source: ABdhPJy6A80YbdixyN073EhSXC8Pw/Xdjwvfn6nyoNmicYpwxs9AaKQwTcIZ5v4BT/YcJyimG88z9w==
X-Received: by 2002:a92:c5a5:: with SMTP id r5mr32750984ilt.122.1620839856431; 
 Wed, 12 May 2021 10:17:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] bsd-user: style tweak: don't assign in if statements
Date: Wed, 12 May 2021 11:17:09 -0600
Message-Id: <20210512171720.46744-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 7f3cfa68aa..2494d9209d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -288,7 +288,8 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
     abi_ulong __gaddr = (gaddr);                                        \
     target_type *__hptr;                                                \
     abi_long __ret;                                                     \
-    if ((__hptr = lock_user(VERIFY_WRITE, __gaddr, sizeof(target_type), 0))) { \
+    __hptr = lock_user(VERIFY_WRITE, __gaddr, sizeof(target_type), 0);  \
+    if (__hptr) {                                                       \
         __ret = __put_user((x), __hptr);                                \
         unlock_user(__hptr, __gaddr, sizeof(target_type));              \
     } else                                                              \
@@ -301,7 +302,8 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
     abi_ulong __gaddr = (gaddr);                                        \
     target_type *__hptr;                                                \
     abi_long __ret;                                                     \
-    if ((__hptr = lock_user(VERIFY_READ, __gaddr, sizeof(target_type), 1))) { \
+    __hptr = lock_user(VERIFY_READ, __gaddr, sizeof(target_type), 1);   \
+    if (__hptr) {                                                       \
         __ret = __get_user((x), __hptr);                                \
         unlock_user(__hptr, __gaddr, 0);                                \
     } else {                                                            \
-- 
2.22.1


