Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C93F8FCE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:15:08 +0200 (CEST)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMi8-0008C4-Vy
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfj-0005Us-CY
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:27 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfh-0006iy-QS
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:27 -0400
Received: by mail-io1-xd44.google.com with SMTP id z1so5567919ioh.7
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJRZgQI+QtTgjpShWzcLDKaF2c/eXvqYd/GhPRaiuEQ=;
 b=T64Qt+1IUbX6X9uqNbScLjTGyLA48r0dUYrdbACtvjvz7shjrabq6kaL1426N4xDDN
 ZLPYOjDALiOMzi7Xxc3AVm2Izau90dXVzi8z8V/zELl8N10F61RAPvaY5BsrSExdCsT3
 VU5UxZ5czXu9sHG+h8nyQp7r0+Y4qBlc33TCMLISz1OUyM7GAnc847PtagNV9Zjw0cUe
 bhjlYRscOAvyAqlusFBuHyBvmndPh8fl0ulNYpLHoV+Dr0U60+bv5K9v/h5WjcDuCGdC
 xk38ir7/xRGZxFuC4JLYZAZat10OWY+q8f9p4RtqqcZyMhN6ygSprcvJLo/86t5BO+g+
 YE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJRZgQI+QtTgjpShWzcLDKaF2c/eXvqYd/GhPRaiuEQ=;
 b=hksNPHPnqK/SYSzW5kNCapsf8vTKIvosG7DAoHcZZNJhAbXH1hlZ1Kn4sf2t7I8U+9
 dNtAWYJnbblPIru3jLSNrl5ybk0eOZuw3DayiTUDNes5KWWE8ecZXhG6RZRU3t6IDoqI
 oMShOn90nICfWZQx31S4i7k1A3Xf+6P3v06svNcPc56zVJVZvIfx3RJq0j0Gu68mujsm
 tvnx1NPZuYgoT/rJyz4Igrz0PWmZy/FjJGyjRNgVI0BcupyLyuGEFm4jv7I5jQnYMa4M
 oaQKOg4NkxPWcPbVJbypqTUUQfuuhOLEbiWMG/kIQ06G19E5sc4TBiXNCaTGUhprBc69
 KgSQ==
X-Gm-Message-State: AOAM530SlZqJraqYU/K8TT/PFHfi7MnBBa9hs5lPUY0sOOCPv36CR55X
 cOtuNvcFoS2/rYntBgPEtui/mjBUwQJiSrQO
X-Google-Smtp-Source: ABdhPJw0EklW8CDdiKMR8Lco1PFzZ6q0DU2Ji+1gPPVsHbuzE1eMpQZIBDI+tl7fSGE/ztvvkCNLZA==
X-Received: by 2002:a5d:9355:: with SMTP id i21mr4692921ioo.12.1630012344510; 
 Thu, 26 Aug 2021 14:12:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:23 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/43] bsd-user: add copyright header to elfload.c
Date: Thu, 26 Aug 2021 15:11:20 -0600
Message-Id: <20210826211201.98877-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add Stacey's copyright to elfload.c

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 6edceb3ea6..ae62f3aab3 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1,4 +1,21 @@
-/* This is the Linux kernel elf-loading code, ported into user space */
+/*
+ *  ELF loading code
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
 
 #include "qemu/osdep.h"
 
-- 
2.32.0


