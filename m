Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E415D405
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 09:47:17 +0100 (CET)
Received: from localhost ([::1]:36176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Wd0-0006CV-Vj
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 03:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1j2WcA-0005kX-J6
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:46:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1j2Wc9-0001gz-AE
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:46:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47852
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1j2Wc9-0001dQ-4n
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:46:21 -0500
Received: from host86-175-83-30.range86-175.btcentralplus.com ([86.175.83.30]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1j2WcD-0008V4-Hl; Fri, 14 Feb 2020 08:46:29 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	rth@twiddle.net,
	jsnow@redhat.com
Date: Fri, 14 Feb 2020 08:46:05 +0000
Message-Id: <20200214084607.20471-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.175.83.30
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/2] cmd646: remove pci_cmd646_ide_init() function
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41c9:1:41f::167
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recent cmd646 discussions reminded me of this patch I've had sitting in an
old branch for a while.

The DP264 machine is the last remaining user of the deprecated
pci_cmd646_ide_init() init function. Switch it over to using qdev via pci_create()
and then remove the now-unused pci_cmd646_ide_init() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Mark Cave-Ayland (2):
  dp264: use pci_create() to initialise the cmd646 device
  cmd646: remove unused pci_cmd646_ide_init() function

 hw/alpha/dp264.c |  8 +++++++-
 hw/ide/cmd646.c  | 12 ------------
 include/hw/ide.h |  2 --
 3 files changed, 7 insertions(+), 15 deletions(-)

-- 
2.20.1


