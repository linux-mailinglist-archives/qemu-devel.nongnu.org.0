Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7D1DD7B0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 21:56:52 +0200 (CEST)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbrJD-00075U-58
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 15:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbrGR-0002Dq-0m
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:53:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jbrGQ-0007c1-5P
 for qemu-devel@nongnu.org; Thu, 21 May 2020 15:53:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 057E7748DDC;
 Thu, 21 May 2020 21:53:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7027C748DCB; Thu, 21 May 2020 21:53:43 +0200 (CEST)
Message-Id: <1392cad2ad1315a5a50409970e0af061821462e6.1590089984.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1590089984.git.balaton@eik.bme.hu>
References: <cover.1590089984.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 7/7] sm501: Remove obsolete changelog and todo comment
Date: Thu, 21 May 2020 21:39:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also update copyright year for latest changes

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/sm501.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index e7a9f77de7..edd8d24a76 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -2,7 +2,7 @@
  * QEMU SM501 Device
  *
  * Copyright (c) 2008 Shin-ichiro KAWASAKI
- * Copyright (c) 2016 BALATON Zoltan
+ * Copyright (c) 2016-2020 BALATON Zoltan
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -40,23 +40,6 @@
 #include "ui/pixel_ops.h"
 #include "qemu/bswap.h"
 
-/*
- * Status: 2010/05/07
- *   - Minimum implementation for Linux console : mmio regs and CRT layer.
- *   - 2D graphics acceleration partially supported : only fill rectangle.
- *
- * Status: 2016/12/04
- *   - Misc fixes: endianness, hardware cursor
- *   - Panel support
- *
- * TODO:
- *   - Touch panel support
- *   - USB support
- *   - UART support
- *   - More 2D graphics engine support
- *   - Performance tuning
- */
-
 /*#define DEBUG_SM501*/
 /*#define DEBUG_BITBLT*/
 
-- 
2.21.3


