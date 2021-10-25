Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36D439544
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:52:03 +0200 (CEST)
Received: from localhost ([::1]:52532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyWI-00020U-Rx
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyM1-0004hI-6c
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:26 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:48236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1meyLx-0006rb-NI
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:41:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DA1A3756194;
 Mon, 25 Oct 2021 13:41:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BB2AD755FE6; Mon, 25 Oct 2021 13:41:15 +0200 (CEST)
Message-Id: <cover.1635161629.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 0/4] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Date: Mon, 25 Oct 2021 13:33:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the same as posted before just omitting the two patches that
are optimisations by caching the func0 and avoiding QOM casts which
could not be measured to have an effect but these reamaining patches
are still needed to fix USB interrupts on pegasos2

Gerd, could you please take them?

Regards,

BALATON Zoltan (4):
  usb/uhci: Misc clean up
  usb/uhci: Disallow user creating a vt82c686-uhci-pci device
  usb/uhci: Replace pci_set_irq with qemu_set_irq
  hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts

 hw/usb/hcd-uhci.c          | 14 ++++++++------
 hw/usb/hcd-uhci.h          |  3 ++-
 hw/usb/vt82c686-uhci-pci.c | 15 +++++++++++++++
 3 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.21.4


