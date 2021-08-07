Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141493E372C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:46:45 +0200 (CEST)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCU9U-0006KL-1s
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5u-0006QZ-S5
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:02 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5t-0004lq-CQ
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:02 -0400
Received: by mail-io1-xd44.google.com with SMTP id n19so20054796ioz.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmdJUuoeEaAxOp6Dr3RmowtyHKMDOBstjrvo58dyLJo=;
 b=bNEraeqFEOi5gfqU21qjjmZjQ1zA+zDyfWT7YUiHUrp4HJAI0yjnM8KboepABU2f2G
 h7ErDq7YdgqJHmGi8/n5BQ2UZwDaI0Qdaaj8jovItgIuDCl6aggtzf4Up/QZBiYEqwUF
 vhIzCC4p1h3NoML4aL6ZqjZD2KaOEZoWNGA+rB/ZF61rl0le+XhWIdiRpgrwRyOrfTYj
 mOA+Kioa/Bn0UHrY5Pi/Gn2cMmIhVdoc2obwW0tEHWNdfkqdFWo27yx9lC2ZI9HRE/2d
 9O36M9PVOl6MaXPAwvKeK3fHB8nPScC8V+f4hkEQGUheq9AYJixvgMEJjtLBgDkT2cfz
 RAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmdJUuoeEaAxOp6Dr3RmowtyHKMDOBstjrvo58dyLJo=;
 b=Hg47ATy5Oexlszl8pSnazgoDI/WPo1/cIX/nzulBx1fP8iUheOKludYChKO0XcPdAI
 iuFG/+saQxPidZRtLWAuj5fdl6NeGZLvct/aaVIL9rKyqfGleWnEdDwMdYGtYo1seg0U
 3Q3UQTw1923++lr6dxBeL6rrM9f9okIYAucCurngoFY+Ifjo6+rkXpg5vvmXEKgYWyVw
 8HipxybxwJfvyDGrk9qiBpbAdA8pxxYzGNV5CrMneHUmQ8HJosyMUBbd48fDbhHDPK/d
 AcEBs6lEysA3VB7ng3SbVXXfxctBL+pn6Dg3dzQt8i4t6fVjTLEdi6tiySedqg3PdOlk
 hEiw==
X-Gm-Message-State: AOAM5309w01OcqLOZUqKdGhi58LqYqHm/7XFgB5gEjZJNYyqbkbJt9yZ
 pi3erpnu7pbL9ZK8D5bcDaBiyRTiscUL7zv/
X-Google-Smtp-Source: ABdhPJya1bVQxyFGRRuXbNN3gIMUINzBQGmmwCl/B7KszYUKKHQFqTng0pBRrSRV45mJ0K7ZmOxPGQ==
X-Received: by 2002:a92:6803:: with SMTP id d3mr83469ilc.145.1628372580118;
 Sat, 07 Aug 2021 14:43:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:59 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 09/49] bsd-user: add license
Date: Sat,  7 Aug 2021 15:42:02 -0600
Message-Id: <20210807214242.82385-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull in the license statement at the top of the bsdload.c file
from the bsd-user fork version of this file. No functional changes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 39098170d5..ec71c5e923 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -1,4 +1,19 @@
-/* Code for loading BSD executables.  Mostly linux kernel code.  */
+/*
+ *  Load BSD executables.
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


