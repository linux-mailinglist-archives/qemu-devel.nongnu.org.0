Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842B44548D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:09:37 +0100 (CET)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midQu-0002oS-Bx
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNe-0006OK-03
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:14 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNa-0000wW-0n
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:13 -0400
Received: by mail-io1-xd32.google.com with SMTP id d70so6053156iof.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=Fht7BRK1sFf0xIRTby7u61RJ4guM3kfj7y1SZfgUyGSfV55eiRhbB5vQq+pu2F9W99
 lDCy4Jg2asRvBOo0EoVIL25Ydi7LOin1BfycgScomANuR/vfTtqz6eaAYSkjteGfizXT
 6cMhTngWOPvFEjBsIRRPk2smVWfNibStHVkW6a5/6aK6tr4Oxjho9LjMR0euYbSSulPg
 xdb0WKYlYn9f9GhZSsgNP8OtQcFwp03KM8gN23dspLYnEj6MSoNpLNQdLa2O26OMUeez
 g4gSL012s4rw5fTWY+ScESo552A5sJr3PY5MmQMhSGA8muWH3zklrRo0AObySxNyQBwg
 vVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5K9w6Dgj9bW+v4mINR6IMzovYCKqh6rwlm+KG2b5Ybg=;
 b=xRKw2iV2ZRwWiR/3N6EzUQE9kbGXpV8ga8dQlGATSJqzKc6w0Kx+/TfhaA5CcT20cH
 gAL6oDLbzBHTonli7opFLsB4MRM4L594PYYkqFvuJrMxLhWOpZDoWeJxIGK2KWI0YKnU
 DRbHAhIVyGbx0fXc8x0uKMsgjkpBUyP2WCf3WWPBhR14O1w8kGpC+WE6kWtEFncOjm0v
 XS8uqbnAYHnesnmuz213JOlK6Q9vqzJqLWERChHGuYZPSHf0r84cZh0ZQeEnN9IMHcwn
 QvCC3p96b2WrflGR+rHzAP+QbdZWKZnkapyESi/zasLcr/N1OwujlMFztbr5BTXCzUk7
 jcgA==
X-Gm-Message-State: AOAM533pFNkKJ3Vfmd9h8BNh3wvjXFKMZX6ChbMBtFrqlfjgcTOxqzgk
 JLUk++bSUyhTlr54vuKUtOY89NtsOkk7Nw==
X-Google-Smtp-Source: ABdhPJzUNanoZa8JdJ1wjQF/CKoXWYtskUqV5yBT+TYWNYWY1awD72TBgasMptS1DELE63XgTSyv5g==
X-Received: by 2002:a05:6638:348e:: with SMTP id
 t14mr3885547jal.145.1636034768458; 
 Thu, 04 Nov 2021 07:06:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/29] bsd-user/arm/target_syscall.h: Add copyright and
 update name
Date: Thu,  4 Nov 2021 08:05:09 -0600
Message-Id: <20211104140536.42573-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
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


