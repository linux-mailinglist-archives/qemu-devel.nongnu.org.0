Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E8591B88
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:39:22 +0200 (CEST)
Received: from localhost ([::1]:36750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtEP-0006S1-Io
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9n-0008Re-JM; Sat, 13 Aug 2022 11:34:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:23019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9l-0006IJ-3b; Sat, 13 Aug 2022 11:34:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8BF0E74633F;
 Sat, 13 Aug 2022 17:34:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E9B0E746335; Sat, 13 Aug 2022 17:34:26 +0200 (CEST)
Message-Id: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 00/22] QOMify PPC4xx devices and minor clean ups
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:26 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is mased on gitlab.com/danielhb/qemu/tree/ppc-7.2

This series contains the rest of Cédric's patches modified according
my review comments and some other small clean ups I've noticed along
the way. I've kept the From line of Cédric for patches that were
originally his even though they are modified a bit. Not sure what's
the best way for this or what Cédric prefers.

The last sdram changes are not yet here because I'm still looking at
those and will come back to them but this series is ready to merge
unless there are comments that need further changes. Please let me
know what do you think.

Regards,
BALATON Zoltan

BALATON Zoltan (22):
  ppc/ppc4xx: Introduce a DCR device model
  ppc/ppc405: QOM'ify CPC
  ppc/ppc405: QOM'ify GPT
  ppc/ppc405: QOM'ify OCM
  ppc/ppc405: QOM'ify GPIO
  ppc/ppc405: QOM'ify DMA
  ppc/ppc405: QOM'ify EBC
  ppc/ppc405: QOM'ify OPBA
  ppc/ppc405: QOM'ify POB
  ppc/ppc405: QOM'ify PLB
  ppc/ppc405: QOM'ify MAL
  ppc4xx: Move PLB model to ppc4xx_devs.c
  ppc4xx: Move EBC model to ppc4xx_devs.c
  ppc/ppc405: Use an embedded PPCUIC model in SoC state
  hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
  ppc/ppc405: Use an explicit I2C object
  ppc/ppc405: QOM'ify FPGA
  ppc405: Move machine specific code to ppc405_boards.c
  hw/ppc/Kconfig: Remove PPC405 dependency from sam460ex
  hw/ppc/Kconfig: Move imply before select
  ppc4xx: Drop empty default cases
  ppc/ppc4xx: Fix sdram trace events

 hw/intc/ppc-uic.c         |   26 +-
 hw/ppc/Kconfig            |    3 +-
 hw/ppc/ppc405.h           |  182 +++++--
 hw/ppc/ppc405_boards.c    |  360 +++++++++----
 hw/ppc/ppc405_uc.c        | 1071 ++++++++++++-------------------------
 hw/ppc/ppc440_bamboo.c    |    7 +-
 hw/ppc/ppc440_uc.c        |   27 -
 hw/ppc/ppc4xx_devs.c      |  473 +++++++++++++---
 hw/ppc/sam460ex.c         |   37 +-
 hw/ppc/trace-events       |    3 -
 hw/ppc/virtex_ml507.c     |    7 +-
 include/hw/intc/ppc-uic.h |    6 +-
 include/hw/ppc/ppc4xx.h   |   71 ++-
 13 files changed, 1223 insertions(+), 1050 deletions(-)

-- 
2.30.4


