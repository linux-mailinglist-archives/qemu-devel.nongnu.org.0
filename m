Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701244393D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:01:21 +0100 (CET)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2mO-0006lA-95
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2em-0006U4-6k
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:28 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eh-0002lH-Fr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:27 -0400
Received: by mail-io1-xd2a.google.com with SMTP id h81so581321iof.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=WJ2X+X5Z5uuP6VuW8UMLWTQ7I7RYV7cGEunMqDGJl0v7y8WTdSTpIlaQtbg6P60IDX
 VOdhTU3VDjbV3dbRcG0KjOZHyaNG+FhFTZtE1nDtKmSqD3NNrJC/XAIGQFcRZVHztu5p
 POqaKMZmjJIV9XYJAKwjXQ0+27I3CY64eJwwwqTd+Bt8KV0RCpwan9RFvZlk3mMMhgyV
 71X/5EicLpZJ/2VOstpqAYsWmU6oRRxRJqMe9ZYxt1X+UdAXUK6KJt53OhkMGg5MU4gX
 zmjxGUlG4eapxNapMXnnWvPZQd8QyIQpC1IA8yU98S6IYLipLafpOYuaCrpWJDHdx+5c
 S4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=C4podvvIqK++FNxUIhIWavSHPkJkzd+2ss7tEcCFHDGlryGUpkNzmT+JPERD10GhTv
 CmeZzqRnLa5lkydtcKUM3DabPqRV5CDd+WsdBfXtTcxEYRpGQgrRP0Wwl6ZveRlrjaW0
 VA/25bdMtGjew/ZIF9KQ47s6Se45lGe35ftxXheCN7hYBkjMKfNY1qDf9JSaqeVaB8Bw
 ItcpYWPfaGNfonysvT5q6J4dZhXSiEV2hT0GYq7mR3bH/c+4MiEeyT3faQlH9f88M1pr
 SBICyj/lhDztMKvmAtLxozbZLuiB+WxBWNA78uADVzCcHWMHMPjHObIU30JJUfG2fdAY
 rI5w==
X-Gm-Message-State: AOAM532lwOSNp8ivOlxMCqaI3kEmufDfI+jbqZ35qCb5nzK1TfXi68id
 uAEDtkSm+WpKPLdV9kVdxAl8POqS3n8O5Q==
X-Google-Smtp-Source: ABdhPJxgYYnJTtDUJHZE1xMLzl9vjYaZ29b+6OCZpOEIebAErGhzpFOkA7Fo+XDfC0Xp3bOwaMt8mg==
X-Received: by 2002:a05:6638:3722:: with SMTP id
 k34mr29810923jav.57.1635893602197; 
 Tue, 02 Nov 2021 15:53:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/30] bsd-user/arm/target_syscall.h: Add copyright and
 update name
Date: Tue,  2 Nov 2021 16:52:21 -0600
Message-Id: <20211102225248.52999-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred name for the 32-bit arm is now armv7. Update the name to
reflect that. In addition, add Stacey's copyright to this file and
update the include guards to the new convention.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_syscall.h | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/bsd-user/arm/target_syscall.h b/bsd-user/arm/target_syscall.h
index ef4b37f017..a5f2bb4e01 100644
--- a/bsd-user/arm/target_syscall.h
+++ b/bsd-user/arm/target_syscall.h
@@ -1,5 +1,24 @@
-#ifndef BSD_USER_ARCH_SYSCALL_H_
-#define BSD_USER_ARCH_SYSCALL_H_
+/*
+ *  arm cpu system call stubs
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_SYSCALL_H_
+#define _TARGET_ARCH_SYSCALL_H_
 
 struct target_pt_regs {
     abi_long uregs[17];
@@ -31,6 +50,6 @@ struct target_pt_regs {
 #define TARGET_FREEBSD_ARM_GET_TP       3
 
 #define TARGET_HW_MACHINE       "arm"
-#define TARGET_HW_MACHINE_ARCH  "armv6"
+#define TARGET_HW_MACHINE_ARCH  "armv7"
 
-#endif /* !BSD_USER_ARCH_SYSCALL_H_ */
+#endif /* !_TARGET_ARCH_SYSCALL_H_ */
-- 
2.33.0


