Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3013E3730
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:48:29 +0200 (CEST)
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUBA-0003lW-Vf
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5t-0006JZ-0F
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:01 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5q-0004iP-I2
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:00 -0400
Received: by mail-io1-xd41.google.com with SMTP id n19so20054643ioz.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w22VXCkHbqUvOP5ZDRCDaOrYu5LDO7rbH2N3Pl/PXGA=;
 b=YMAZs9NolUJngRhcmg1B965kBu3Rf7Q86A7PMzONbCCd29TTEoDJtOJBe5aYwrDITo
 lXyMl7QTsRYRhUflMQE8qDG3+/SaXnkJLD+3oiE3VsYh6PXSafgLdceFAQBnii3++OGP
 2Oh0YiRAZ3sS/uChp6JPX6ijYATB/5Z5Y/XiP+bSQfNa3bO+rA98UvGFOyzBmJ2U20rq
 ouS9EFUsv203Hyf2k5/fD/Nx52Cs8qx1RWM+v2eWe/NDiy/szpeZFUBTL3pNy3UarEGd
 Ws2zqccX8Ra2MU1k63whIFnJz279hIKR8QsAjmChWvO41drwTDD24e9I7I1wHCpjZ53k
 CGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w22VXCkHbqUvOP5ZDRCDaOrYu5LDO7rbH2N3Pl/PXGA=;
 b=Hl0b36yaEqkiwlBAc5Ei3Cs8x4mo+AleBmmy20cZfK2SRn0+6pW7xzmhrx3UN6GXOR
 VjMv/IqJJ/9LhC4K8i8DP4TyiYZEAsVx40Wj+E6z6t7riT6h3MWZ2MRGHsMBd84goNUc
 Qo2uir39cj6lJKUB8zSUvNACE/4OUudBW3/NAyBuZjxg4YUdRab1HaCHCChSMvIdC98S
 1geNjVHSCD3fRE4/OIaqGDV2A1oELNGFMk4rYJHgVRhs636TScOEDo4u8OqmDVo2P7zg
 nA7hIZpViI2hLv9BB2qoSUhVGXDBHyNhs6yYdiRDTt9IPNKLYAbT2v2B1IUz1ZRnDgNG
 y7qg==
X-Gm-Message-State: AOAM5312o/I9HIbydLlwRnQe0f/XS7qLCMZQbhn0BuuHhEy57Z4jc5jj
 o+tH7ZU8ng2jMfa0ZdTXlQ2CT+3obGbBzyUv
X-Google-Smtp-Source: ABdhPJzkgI3mKpOKRnsCV0rSqWT36pHfA8NceYxPwHTNBPgBB5Yd46EA8eXUYMBFSgC6XySWDPIjNw==
X-Received: by 2002:a6b:4406:: with SMTP id r6mr50049ioa.192.1628372577181;
 Sat, 07 Aug 2021 14:42:57 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:56 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 06/49] bsd-user: merge comments and guards from
 bsd-user fork
Date: Sat,  7 Aug 2021 15:41:59 -0600
Message-Id: <20210807214242.82385-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d41;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd41.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Diff reduction against bsd-user fork: bring in the copyright/license
comments, and guard ifdefs.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_elf.h   | 22 ++++++++++++++++++++++
 bsd-user/x86_64/target_arch_elf.h | 23 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/bsd-user/i386/target_arch_elf.h b/bsd-user/i386/target_arch_elf.h
index 084c9a7814..20ef0ccbdb 100644
--- a/bsd-user/i386/target_arch_elf.h
+++ b/bsd-user/i386/target_arch_elf.h
@@ -1,3 +1,23 @@
+/*
+ *  i386 ELF definitions
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
+#ifndef _TARGET_ARCH_ELF_H_
+#define _TARGET_ARCH_ELF_H_
 
 #define ELF_PLATFORM get_elf_platform()
 
@@ -52,3 +72,5 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
+
+#endif /* _TARGET_ARCH_ELF_H_ */
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
index 08a86da1a5..d3c139c7a9 100644
--- a/bsd-user/x86_64/target_arch_elf.h
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -1,3 +1,24 @@
+/*
+ *  x86_64 ELF definitions
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
+#ifndef _TARGET_ARCH_ELF_H_
+#define _TARGET_ARCH_ELF_H_
+
 #define ELF_PLATFORM get_elf_platform()
 
 static const char *get_elf_platform(void)
@@ -39,3 +60,5 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
+
+#endif /* _TARGET_ARCH_ELF_H_ */
-- 
2.32.0


