Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56740445495
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:11:49 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midT2-0007Fi-Fx
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNc-0006Lr-7Q
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:12 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:46934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNY-0000wG-TT
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:11 -0400
Received: by mail-io1-xd2e.google.com with SMTP id i79so6687218ioa.13
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=NlQCfHimpk4aRPZKtWg75SM4pU74fxKpE1YdbDXod+PaLCD+tpb0e20wDNXFz9jvE3
 KjZnTs+nrbtD5ubmdxvJlwcRVBN9YhdVoD5gMYMCl8ThnX2tf/dkk/8aRyr0UbiD9JSC
 0WpibltrrJ5D4izcP1Jwoc4aQf6vETXFsw8Ad4qXDx67ste7U3Ub+CkHf5z3EwQD+EsM
 nAJTszFfujH8yE/YUaDzWZggz3WOwBnoRE/zee/qVqe5z5duhyYBzaqMhuLz1eS/7cF4
 9fFfva5wfw9HNVrGPuJIiS+Fgh9YtLfl9ki15rXqsDzXWjshzT8gUraN76kdiWKEszSy
 h19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0zcqxxx9i9efPGyMNGiYlMMaZ7Z90otmzxtyKTD4u1s=;
 b=X/62+9lMwewnXi3m/zVnZf0fLaCuO/yvCOXfPv2lX/cHKmVwz2PH01x0Ysk7f2yQff
 qljEwT1XzNkzuFDtDtjoE4nNG1B9XWrlLcOoKi45mce4vaIgaE99w1zK3gFIUdB8uHRa
 +fAb0caaqpxKiRbUn78Cosqx7K0DHthsmpGGB+SslObv4PhYmtFgPfKEKurcLr/Wv0J1
 TltaNDlM5OwfdsDjjthCz8ZimaCAO/8fNDrxpVG3YGAAuYq/qJ5pmCesSAyo0GZZK26m
 W8agJpcOM5heakhy3y6wZE9tIvHwLodTTWjmX8G/46rD1dCezA2SB5uKEMdvxY3hjnwa
 kIIA==
X-Gm-Message-State: AOAM531b1zHDO6x+tbLodvoiWO9cVt0aGVbnGVFA1kkgqmbV3FTQhK+o
 ZWJg6iTgVoyRqDg6fxF1EwNOQYDugItiCA==
X-Google-Smtp-Source: ABdhPJw1e5LIrGAGhh2JX7DCH7hfx9brPOjWjBxTdjophY2zoJRquf7dLTO2N86ERG3XwktZbDBPIw==
X-Received: by 2002:a05:6602:1242:: with SMTP id
 o2mr25611695iou.183.1636034767111; 
 Thu, 04 Nov 2021 07:06:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/29] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Thu,  4 Nov 2021 08:05:08 -0600
Message-Id: <20211104140536.42573-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
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


