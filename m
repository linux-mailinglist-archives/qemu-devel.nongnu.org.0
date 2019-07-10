Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872736452C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 12:28:28 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl9pr-0002pm-Ou
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 06:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41713)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hl9nk-0001IC-8a
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:26:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hl9ni-0000l5-W2
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:26:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56072)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hl9ng-0000Qj-TZ
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:26:13 -0400
Received: by mail-wm1-x330.google.com with SMTP id a15so1706197wmj.5
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uf2HRIdbf2h0OGgfW33mzQxfpKIty5w+0euDRtaBug=;
 b=zROoEq6WNpkvChYeWl+NNuJ2VBffr7+CahyQPCmFDkdtJREmpD/A+3B3mEkO9odoHe
 ZcAkI/SGNTnnQABde4vhWpqiSIe3lGCAThDWT5rln6mIPckMN2JDRT84zgxoGP2/f9Im
 DFhxbf19RezX0WernUVbsVgW06BsvnLqcnTY2bm0IDj2EgZagMK0VE6ZatRt9TJxO78A
 LTaSAk1iZ5dj4RJGPDO1dPEu6anKwTJTuYySG+rXJo4wvWiLZ5JjycsidQiSnzLbRoMG
 yo6XYrPuKDdyrAsakJIUCNl21T6Wkxses/+BuUxSnnuDe1MF31ImeLxz1/TCZSr8uY8F
 jhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uf2HRIdbf2h0OGgfW33mzQxfpKIty5w+0euDRtaBug=;
 b=l9NqL38r5Gu1JOJrlszLBFWf/BuK2mzTFuNH/nWch37Ye5w2X9BkNJ9ldFylDjLS/2
 FfS3I43aWQ7VDVKCh6KKKkiqd3LivYXS4tNWqZFmS8bdcZ//2Y2xJ8uzHgsIM2OIjSwI
 1zD64S2z21fY6lgItcy/mmMpNdk/emdfeW/YaB5R7u9N0+gctJyXmTPXzaFniaXB/mke
 W0QgPfmK82ubzp6EWr5ibV4IlFNcoQpdKoE23Ude4nEC8gDj6YEUlgg64dW2rHIaX7JX
 whbS6rLHBzAvLtXOiaAylfTfxUBuhyZtY8f9Qcj/oD118+TpkICJ4xAvZEloy8GUo98O
 2Ljg==
X-Gm-Message-State: APjAAAWwYuBKfaHJntSJWJDzav41humVDK3TRtsfcUWabfW2zaSKUOE6
 poXaEQnLHobBT8BIxAjg9uDieQ==
X-Google-Smtp-Source: APXvYqyc+GVOb6SLcwgX4mEiq1A0GRTl4gWMyr0g8rqosolWD/vrJYStOYAZ/Ox9k7AQcWWGG/IAlQ==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr4863178wmh.55.1562754360745;
 Wed, 10 Jul 2019 03:26:00 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id t6sm1538550wmb.29.2019.07.10.03.25.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 03:25:59 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 018041FF90;
 Wed, 10 Jul 2019 11:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Wed, 10 Jul 2019 11:25:56 +0100
Message-Id: <20190710102557.3107-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710102557.3107-1-alex.bennee@linaro.org>
References: <20190710102557.3107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
Subject: [Qemu-devel] [PULL 3/4] gdbstub: add some notes to the header
 comment
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a link to the remote protocol spec and an SPDX tag.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/gdbstub.c b/gdbstub.c
index 687c02e598..8363683852 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1,6 +1,10 @@
 /*
  * gdb server stub
  *
+ * This implements a subset of the remote protocol as described in:
+ *
+ *   https://sourceware.org/gdb/onlinedocs/gdb/Remote-Protocol.html
+ *
  * Copyright (c) 2003-2005 Fabrice Bellard
  *
  * This library is free software; you can redistribute it and/or
@@ -15,6 +19,8 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
-- 
2.20.1


