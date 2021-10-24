Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9712643860B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 02:48:22 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meRgT-0000De-8D
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 20:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdo-0006FO-ED
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:63822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meRdj-00048Z-Lw
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 20:45:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 047467475FA;
 Sun, 24 Oct 2021 02:45:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8ADFA746333; Sun, 24 Oct 2021 02:45:22 +0200 (CEST)
Message-Id: <cover.1635036053.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 0/5] hw/sh4: Codeing style fixes
Date: Sun, 24 Oct 2021 02:40:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes coding style of files belonging to SH4 system emulation
which were not following current QEMU coding style requirements.

BALATON Zoltan (5):
  hw/sh4: Coding style: Remove tabs
  hw/sh4: Coding style: Fix multi-line comments
  hw/sh4: Coding style: White space fixes
  hw/sh4: Coding style: Add missing braces
  hw/sh4: Coding style: Remove unnecessary casts

 hw/char/sh_serial.c      |   77 +-
 hw/intc/sh_intc.c        |  313 ++++----
 hw/pci-host/sh_pci.c     |   10 +-
 hw/sh4/r2d.c             |   68 +-
 hw/sh4/sh7750.c          |  571 +++++++-------
 hw/sh4/sh7750_regnames.c |  148 ++--
 hw/sh4/sh7750_regs.h     | 1600 +++++++++++++++++++-------------------
 hw/sh4/shix.c            |   12 +-
 hw/timer/sh_timer.c      |   55 +-
 include/hw/sh4/sh.h      |   20 +-
 10 files changed, 1466 insertions(+), 1408 deletions(-)

-- 
2.21.4


