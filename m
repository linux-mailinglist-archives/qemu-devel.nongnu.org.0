Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EA445E9A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:29:20 +0100 (CET)
Received: from localhost ([::1]:46308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipup-0002nS-Rz
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplq-0004Nk-EL
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:03 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mipln-00046u-Am
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:20:01 -0400
Received: by mail-io1-xd36.google.com with SMTP id y73so9312245iof.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=FU4E+e5BGZ8StZdS8YofTWyLMY6Bibvm3gcKaj1PVpm/xJOXUy82TMM0QBUrfH+F99
 r+l51Tswko5UPzUpJSzeUQPRBM9YLAgWViy9GyJ42jReFbKJwDA99taB7w7MzKB4iZJd
 FjAwPt0YLqyT70KjeCCB1x6k/kCRT5jvhNUjtNJjhgyJu9P9SojY8gYLUgXzXzytx9Yd
 EKTfck6XjTimkYq5rEgIlvV/YNtzOQnG6Y9G/p70lXY3nnIwM18/iIQfZei0jLnOm71A
 RXsy435txb4yek6NQlG4VMSYtXFwL5h1Z7HlZPt7f9JGOgmpfgchX//jXkWM9tq93JOl
 inIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=Z2PmzB5izGrhQ/rh2wje9vfYGml7AL08ZWpzFKTebcIYL0ZwrYrKFgxBfTDq33XlmT
 +ens0UI98knvfJzYtmcLrz/zlVa4ZiAkStnobBz+AbEmRUg8mEEfbn2x6Tpir/1E3CAf
 IY2Kf53+Yu2kRilbmrniuYNUo3AMvIudrIWgjYgSaa1wWM/qrVQUCQ7VyhpiKeCoXwCV
 exa0qP7qFPGhwV42lyzMafzKtl5tW1pEG09Vlet3Q4fL5vRdyo4BFleg2o1Po8WS9Qxf
 GK4ujnwLHqc3uDa6HQJqF8VRoVZzbFjum5Dq9oGMgLXYHvazN7ftcDQqft4VRulDgKmc
 LYgw==
X-Gm-Message-State: AOAM5305mHeDfIt85KYIx2XbsGlsPSDBTOSwQFeGK+WhinmTscs9bjrE
 /ov0tda9Fu8rrHjYTCI47/FgRoDeAIxdAQ==
X-Google-Smtp-Source: ABdhPJwafey/NN/waSEqjhmiF3mK62/RzNz1kglWNiO1P8xAPs0KXUpYmFFq/uBglV0n5wZagmX8Iw==
X-Received: by 2002:a5e:d80a:: with SMTP id l10mr39587725iok.182.1636082397988; 
 Thu, 04 Nov 2021 20:19:57 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:57 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/36] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Thu,  4 Nov 2021 21:18:53 -0600
Message-Id: <20211105031917.87837-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As part of upstreaming, the include guards have been made more
consistent. Update this file to use the new guards.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_sysarch.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_sysarch.h b/bsd-user/arm/target_arch_sysarch.h
index 632a5cd453..8cc6bff207 100644
--- a/bsd-user/arm/target_arch_sysarch.h
+++ b/bsd-user/arm/target_arch_sysarch.h
@@ -17,8 +17,8 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BSD_USER_ARCH_SYSARCH_H_
-#define BSD_USER_ARCH_SYSARCH_H_
+#ifndef _TARGET_ARCH_SYSARCH_H_
+#define _TARGET_ARCH_SYSARCH_H_
 
 #include "target_syscall.h"
 #include "target_arch.h"
@@ -75,4 +75,4 @@ static inline void do_freebsd_arch_print_sysarch(
     }
 }
 
-#endif /*!BSD_USER_ARCH_SYSARCH_H_ */
+#endif /*!_TARGET_ARCH_SYSARCH_H_ */
-- 
2.33.0


