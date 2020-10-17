Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1C29145D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 22:40:31 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTt0A-0007Ha-9C
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 16:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTsvj-0000ib-8B; Sat, 17 Oct 2020 16:35:55 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTsvf-0004ZL-Kq; Sat, 17 Oct 2020 16:35:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7E468747634;
 Sat, 17 Oct 2020 22:35:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 560D8745953; Sat, 17 Oct 2020 22:35:46 +0200 (CEST)
Message-Id: <cover.1602965621.git.balaton@eik.bme.hu>
Subject: [PATCH 0/6] m48t59: remove legacy init functions
Date: Sat, 17 Oct 2020 22:13:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Herve Poussineau <hpoussin@reactos.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

This is inspired by Mark's series:

https://lists.nongnu.org/archive/html/qemu-ppc/2020-10/msg00251.html

and implements what I've suggested in review of that series to
simplify it and avoid code churn if implementing my suggestion later.

Regards,
BALATON Zoltan

BALATON Zoltan (4):
  mt48t59: Set default value of base-year property to 1968
  sun4m: use qdev instead of legacy m48t59_init() function
  sun4u: use qdev instead of legacy m48t59_init() function
  ppc405_boards: use qdev instead of legacy m48t59_init() function

Mark Cave-Ayland (2):
  m48t59-isa: remove legacy m48t59_init_isa() function
  m48t59: remove legacy m48t59_init() function

 hw/ppc/ppc405_boards.c  |  3 ++-
 hw/rtc/m48t59-isa.c     | 25 -------------------------
 hw/rtc/m48t59.c         | 37 +------------------------------------
 hw/sparc/sun4m.c        |  5 +++--
 hw/sparc64/sun4u.c      |  6 ++++--
 include/hw/rtc/m48t59.h |  6 ------
 6 files changed, 10 insertions(+), 72 deletions(-)

-- 
2.21.3


