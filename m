Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA664438D7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:56:31 +0100 (CET)
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2hi-0003oQ-Be
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ek-0006NU-JY
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:26 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eg-0002l9-Bx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:26 -0400
Received: by mail-io1-xd36.google.com with SMTP id e144so596108iof.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=D6qFPPZIU468jjMQIJUygb0LIUHmNy+L4BJbJdq5NjGqX2UmI9iG+nmNBo6uWsa6zQ
 FeqvqO6tPwA4qlDoFvTmbEAF3Ipjeh8++nO6dBLseIGZNWMW1Gtc+dZ65wra48XSWEi9
 ka3suPGNpzR1OFfAGt/KMVZ8qB0/KSp8ch8oB0JAuF5k2hXOSEmJWNz3kapD6blhMHlC
 +bZpOCFi73OXCAqOZdOXY+Lw3i1zXpVrFmMLiLckRCdZwIDdE072aPPC7uvqZ+Jgd2eV
 q2dGvRCaQ+POfoeyZKDPxj5c+N8CQIZbQb9Ss4NreA+5OEBff7UerwZVzw6wvGCxzwLs
 nAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=Rqyfyv/hPTfa9maQrZQieW80xKO8SflONs/OMxuG0IUyH2vtNqzlUgOkkraXbDuPSq
 vp6FLU3lbqb/jGjRaD6KsBb7kw58WyHxTlO3f08ra9rNLqtasXko9GMzfio5cSN2vbXz
 8Fj+TQg1csuFzpjELFMbtm0uoY9gnP0yj5r6h8YoyogsYoxWrxHr4s9nbbkvPsfqeE5N
 ZxjHDHNBuX1svoN8lt4FpHgbw4nW2Jvibr0TUEVVUvvdwNC6lX4p4s679ekPW5Ymdv7O
 KNwizJxRhyhyUWyAFevNvvG1+hBPvqN0Lf1f3z71YhqOVPKuc5vu6aFpbF27f9sSigk1
 CB+Q==
X-Gm-Message-State: AOAM531YoUEk0wEEryDUuTYms+tL8LeLGqBBScOFSXcoPI4WRQQsaEs9
 8sm+oKjGv7CVF8SC+3a9uj+DSEUpYt33xA==
X-Google-Smtp-Source: ABdhPJyryHdSGA64tWMMOW79azozgG6Nt7EquTxcCzKsyjFG/NQs271URl5bG4EYM5XKqTt54Z66Hg==
X-Received: by 2002:a05:6638:3447:: with SMTP id
 q7mr5617117jav.136.1635893601149; 
 Tue, 02 Nov 2021 15:53:21 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Tue,  2 Nov 2021 16:52:20 -0600
Message-Id: <20211102225248.52999-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
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


