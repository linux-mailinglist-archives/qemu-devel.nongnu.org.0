Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4369943BF2D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 03:44:08 +0200 (CEST)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfXz4-0003zT-OF
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 21:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfXwL-0001TU-3R
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 21:41:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfXwI-0003G6-AW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 21:41:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AF2FE75604D;
 Wed, 27 Oct 2021 03:41:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 90057746353; Wed, 27 Oct 2021 03:41:08 +0200 (CEST)
Message-Id: <cover.1635298341.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 27 Oct 2021 03:32:21 +0200
Subject: [PATCH 0/6] More SH4 clean ups
Date: Wed, 27 Oct 2021 03:32:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, INVALID_DATE=1.096,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Based-on: <cover.1635036053.git.balaton@eik.bme.hu>
^ (hw/sh4: Codeing style fixes)

Continuing the clean up stared in previous series this now removes
printfs and QOM-ify sh_serial.

Is there somebody who will merge these? I don't think there's anybody
sending pull request for SH4 so maybe Peret/Richard might need to take
it.

Regards,

BALATON Zoltan (6):
  hw/sh4: Fix a typo in a comment
  hw//sh4: Use qemu_log instead of fprintf to stderr
  hw/sh4: Change debug printfs to traces
  hw/sh4/r2d: Use error_report instead of fprintf to stderr
  hw/char/sh_serial: QOM-ify
  hw/char/sh_serial: Add device id to trace output

 hw/char/sh_serial.c   | 149 ++++++++++++++++++++++++------------------
 hw/char/trace-events  |   3 +
 hw/intc/sh_intc.c     |  79 ++++++----------------
 hw/intc/trace-events  |   8 +++
 hw/sh4/r2d.c          |   5 +-
 hw/sh4/sh7750.c       |  83 +++++++++++++++--------
 hw/sh4/trace-events   |   3 +
 hw/sh4/trace.h        |   1 +
 hw/timer/sh_timer.c   |  14 +---
 hw/timer/trace-events |   3 +
 include/hw/sh4/sh.h   |   9 +--
 meson.build           |   1 +
 12 files changed, 186 insertions(+), 172 deletions(-)
 create mode 100644 hw/sh4/trace-events
 create mode 100644 hw/sh4/trace.h

-- 
2.21.4


