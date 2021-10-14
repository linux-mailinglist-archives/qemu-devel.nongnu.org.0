Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07142E02E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 19:41:57 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb4jr-0001wj-Vg
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 13:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4h8-0000Lj-Na
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:39:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:53019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb4h4-0008QS-RH
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 13:39:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 23433756060;
 Thu, 14 Oct 2021 19:38:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 070F4746333; Thu, 14 Oct 2021 19:38:59 +0200 (CEST)
Message-Id: <cover.1634232746.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 0/3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Date: Thu, 14 Oct 2021 19:32:26 +0200
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v4 splits up the single patch into a series

BALATON Zoltan (3):
  usb/uhci: Misc clean up
  usb/uhci: Replace pci_set_irq with qemu_set_irq
  hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts

 hw/usb/hcd-uhci.c          | 11 +++++------
 hw/usb/hcd-uhci.h          |  2 +-
 hw/usb/vt82c686-uhci-pci.c | 12 ++++++++++++
 3 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.21.4


