Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B45321FD3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:15:18 +0100 (CET)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGft-00008j-1A
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEGNP-0003IQ-Bh
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:56:11 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEGNN-0007KA-MF
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:56:11 -0500
Received: by mail-ed1-x52b.google.com with SMTP id n1so23373317edv.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QgsAwOjDPamWAwOD3qkq8nIqhi+its/9w2GKo9lZ2Kg=;
 b=sx83gNmUfK9utCtrgxSoZdx4wuJTCYid2AsZOMgjWuf++IsNr9HhGwh+r0qSZquMTH
 YRLQloZmJx8bhwaD+iYlxVd1oKFZ7nilTeSy7IL4UPq25wbe+siA7K3dkwSjn8cxWsLt
 ucOwVM4R30Hkre9MjnbnJX2TxmaaAf1C0T7Rcpz+xzoW0lmSrSeTctY8J4PaFW/s5tBn
 AiZEO/5uqMSXkndpMtZ3rBB29PqQsTUw1qMOYgaM6302hVT00SqHIA/U4jYN6cHiTzct
 I9atBgtixnnmbAyJOf1XLti5KDRbuM+uJwsDqqeFMTHSEJRoZhFnxMb9KE728zBv0ZvH
 5bKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QgsAwOjDPamWAwOD3qkq8nIqhi+its/9w2GKo9lZ2Kg=;
 b=VhsjPurCWqKPNW4snY0z7eOkdNGUhhpoFhGcuCbLF2C+sjae/mYgeEsSdpuasfc+QK
 YEhIDE3fYJZJiXLL7X5PBwBLArZ5o1XI3EiuWPlUJIwQGcfZuRJrqV5Pd2AMNV7aryFI
 SSw4U2BhvXiTTBL9b2D02zblNv8xCAAPTNTgbtaT9HaVgK8pNWqCKtEma/LI2Ov4bI2L
 BRL0ee5qdu2iayG2/muLKkwwSDJqoP0QWhRhY7G0C+yTerBW+H7jUzhjQUNfBq6nKUr4
 De26COW/IL+ByZC36cVPYP8gCX9MMuZXOYynMF74vOyKqT9yl0H3K+l5Op1i5Uh18qmR
 1aew==
X-Gm-Message-State: AOAM5307MwvBkIn2YW+KgWpucyFmfqKtcJbwgzFyMtf2TSG/iq/S5o4e
 xRa08dHAcfC74x4Jy4UHW+cesRbsCjc=
X-Google-Smtp-Source: ABdhPJx/scagYFkFlEmw6JRvKJyx3qwI4D799SpDJfJ0qIOL3hJgCSTzwyT/YFS8Psh1ijwIDZzNaw==
X-Received: by 2002:a05:6402:160b:: with SMTP id
 f11mr7322731edv.225.1614020167846; 
 Mon, 22 Feb 2021 10:56:07 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ck9sm12043180edb.36.2021.02.22.10.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 10:56:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sh4/sh7750_regs: Replace link to license by its full
 content
Date: Mon, 22 Feb 2021 19:56:05 +0100
Message-Id: <20210222185605.2714192-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file is borrowed from the RTEMS source code, which comes
with a GPL-2.0-or-later license with a header exception.

Expand the GPL-2.0-or-later license in place to not be dependent
on a 3rd party website. This also fix the misleading comment "The
license and distribution terms for this file may be found in the
file LICENSE in this distribution" referring to the RTEMS distribution
and not to the QEMU one.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/sh7750_regs.h | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
index 3e4554af315..ab073dadc74 100644
--- a/hw/sh4/sh7750_regs.h
+++ b/hw/sh4/sh7750_regs.h
@@ -10,8 +10,28 @@
  *         Victor V. Vengerov <vvv@oktet.ru>
  *
  * The license and distribution terms for this file may be
- * found in the file LICENSE in this distribution or at
- *  http://www.rtems.com/license/LICENSE.
+ * found in this file hereafter or at http://www.rtems.com/license/LICENSE.
+ *
+ *                       LICENSE INFORMATION
+ *
+ * RTEMS is free software; you can redistribute it and/or modify it under
+ * terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2, or (at your option) any
+ * later version.  RTEMS is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details. You should have received
+ * a copy of the GNU General Public License along with RTEMS; see
+ * file COPYING. If not, write to the Free Software Foundation, 675
+ * Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * As a special exception, including RTEMS header files in a file,
+ * instantiating RTEMS generics or templates, or linking other files
+ * with RTEMS objects to produce an executable application, does not
+ * by itself cause the resulting executable application to be covered
+ * by the GNU General Public License. This exception does not
+ * however invalidate any other reasons why the executable file might be
+ * covered by the GNU Public License.
  *
  * @(#) sh7750_regs.h,v 1.2.4.1 2003/09/04 18:46:00 joel Exp
  */
-- 
2.26.2


