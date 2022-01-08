Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF96488273
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:41:20 +0100 (CET)
Received: from localhost ([::1]:41844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66i8-0002B9-Tk
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ic-0005Js-Hi
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:08 -0500
Received: from [2607:f8b0:4864:20::d36] (port=41727
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0003Mc-5P
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:01 -0500
Received: by mail-io1-xd36.google.com with SMTP id y18so10100404iob.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZBnE033yruOj+6+f3yOKrn/YgX/XwTkzCLoSaIb1ZM=;
 b=AKiLWI/cL8f4kLeRdGVVgrZK6k3G69gBbcyuVJxz/S1KIKHayC2lM5BYPfbf0T4Bxu
 qjyMVL5lVd70sCQSP3JG5iflIv4q10kbDwyI+KdO9Y16g+y7kewfg2dcMgegNj0HyQCy
 FBWCm3eA26+2Pf+3apl+NWB3T458ma9V6hFK6vMMDJtmECNzwb+Cll5P92Xitr9Fl7zB
 7qCuvEzTgvQ9UDV+werTNNbmbfXi4TjsY/aSi3l5ATRXXFsMerbssROtgWSE+4gsX9bn
 JuLvUh9ve9ioRueqOaFFbPe4oietQMA7Mf0IhTL0G6jE09eemBsRhoUZblQPOqmzXt48
 dbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZBnE033yruOj+6+f3yOKrn/YgX/XwTkzCLoSaIb1ZM=;
 b=dUFXlAt3gLHH6XDLu2iEusDSudhRR2cJOcARAXIHdW27EQf7WkwQN4CT29SVU7/IT1
 wYwnY0qMiildWkBwK4bJs54B/App7marFLNLs7SPoq/mRoJrAmu6ZWIaMKGECOykiuic
 Z0lDkK0cG2qSPS7E0SRi8Ew0hkiHBhEvq9ZCMByiyEbYC1aLgNnyjarmvc62O1C1Ho9R
 PUGed7y+naft4ApniBHjOWnRIskE4n0l4Mk6fC/0rD37ejEXpussUKMkH6H8/BkRnxDO
 KZHxGi9gAi8nmH/YkORN636xE/WSENzcxVQoo7olwVaZFeiMMCIW/CFronX6TINvfT6j
 xhhQ==
X-Gm-Message-State: AOAM5311tnJeVQQpky7SM6wOXKh/umoxfYO+UAWCuibBtaqDoqqz2MNP
 U/+WwhOSbnMO+x99cWM1qt+G0uTVhCVsHFHA
X-Google-Smtp-Source: ABdhPJxbDqp1hWqU2X9l+8w+gUAFoHdtMT4t8MGQ9iDymheGG8yKXO0w+dHwBlxiTZ47VDQEQ1DEAg==
X-Received: by 2002:a05:6638:160d:: with SMTP id
 x13mr30818617jas.120.1641627475714; 
 Fri, 07 Jan 2022 23:37:55 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:55 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/37] bsd-user/arm/target_arch_sysarch.h: Use consistent
 include guards
Date: Sat,  8 Jan 2022 00:37:13 -0700
Message-Id: <20220108073737.5959-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
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
index 632a5cd453a..8cc6bff2077 100644
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
2.33.1


