Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE040307F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 23:56:25 +0200 (CEST)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNj4q-0008WE-UN
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 17:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2H-0005Xd-UR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:45 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:38556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2F-0000i0-Ps
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:45 -0400
Received: by mail-io1-xd41.google.com with SMTP id a13so463605iol.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lv7qzc+bwvqvCUY7KRQHdm4K9UxT525dj3NdW6F5N3A=;
 b=awhNazjkiWjn6vpXmSZuRBQGqEWb9NQLBT80TJi+AdV1wMHvVp5iTclBc0ZQnftMeq
 FjClOvklPEZzSgVFpHbfF9ejA6RzlNMqehRRwzq7yem5Al2Rxd0MHBnhr6Im0lF9T/+7
 6G35/m6Be9TXvc6nXKr3gyZYWbyj9HFgrnwbHpZebihqdorBohQBQFF5WqH+mVmAXLuh
 X/vkmn08M0XZpDUzYbrzx1FCI+F1LAbedGfZqscnJ1x0Sfp/5dx3135e2CpdEn6/qyFt
 VyjsNQ/8x1wyC7i9rE5Vl6ZA7BhkOcfHO21x3WXMhCt6gJXzBPsG79DmsDWclIXlCkRN
 /zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lv7qzc+bwvqvCUY7KRQHdm4K9UxT525dj3NdW6F5N3A=;
 b=q7yRe6HDsx64vfxnZM8geZStcyIg0BJXzc9ob9k+mElEjLanUhFFI/pnlEVdq+IYv0
 VYHa00QamOZX0BTlgHfoMT1JC5Qo9R4vvivn/T7kpvl5SNImu6h/BLXcZ/lPk+EAnhXp
 0auN/XrCPVQBo2ddHySLjRsS69xhQoy0h0LOXNK99hv0soOJtyhieILuOFqOTQCPTiH8
 rjVU3+iwQ2joS5YAEwWlVoG8zvbWQFcyg8Ifzt3Lq+fGuQIxQpdLZoq7it26ZEwC89Ek
 n43scEvZ0F0hmUnABOijpqQ2JZnMIyD5Y2G8pH37ApYNFV5zuyVK3hEUx8C+X0XvGSVA
 hCzQ==
X-Gm-Message-State: AOAM532JgSacEP6ks5rg2ONSHBHXJXUS/0r4boolxga+cC6av3O0jD8x
 nGCjlYaNwpT8lwEwNlUOUbNF3+3SO2I6cGdYgfU=
X-Google-Smtp-Source: ABdhPJznRYSk2ZiOSYK+GK1aIpb7BEjYrDn+pxnN5BBMc9vZe//U0nLBobxsSKos/e5KP0xHZvyfpQ==
X-Received: by 2002:a05:6638:e8f:: with SMTP id
 p15mr454456jas.114.1631051621647; 
 Tue, 07 Sep 2021 14:53:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:41 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 04/42] bsd-user: add license to bsdload.c
Date: Tue,  7 Sep 2021 15:52:54 -0600
Message-Id: <20210907215332.30737-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Pull in the license statement at the top of the bsdload.c file
from the bsd-user fork version of this file. No functional changes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 8d83f21eda..0ade58b9e2 100644
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


