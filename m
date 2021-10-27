Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA643BF32
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 03:47:00 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfY1r-0000nU-PX
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 21:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfXwP-0001WU-3l
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 21:41:21 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:62139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfXwI-0003G8-An
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 21:41:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 16DB0756078;
 Wed, 27 Oct 2021 03:41:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 96C0F7463B7; Wed, 27 Oct 2021 03:41:08 +0200 (CEST)
Message-Id: <f03f38eb6b70b8586f33868b0ba4839f3b214fc9.1635298341.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635298341.git.balaton@eik.bme.hu>
References: <cover.1635298341.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/6] hw/sh4: Fix a typo in a comment
Date: Wed, 27 Oct 2021 03:32:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/timer/sh_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 02eb865908..0a18ac8276 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -107,7 +107,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
         if (s->enabled) {
             /*
              * Pause the timer if it is running. This may cause some inaccuracy
-             * dure to rounding, but avoids a whole lot of other messyness
+             * due to rounding, but avoids a whole lot of other messyness
              */
             ptimer_stop(s->timer);
         }
-- 
2.21.4


