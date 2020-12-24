Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6D2E2940
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 00:35:47 +0100 (CET)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksa93-0006CW-Q7
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 18:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksa7Q-0005JB-Kj
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 18:34:04 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksa7N-0007MS-Vr
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 18:34:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AD37C7470DF;
 Fri, 25 Dec 2020 00:33:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 81AF2746552; Fri, 25 Dec 2020 00:33:56 +0100 (CET)
Message-Id: <cover.1608852217.git.balaton@eik.bme.hu>
Subject: [PATCH 0/2] Fix via-ide for fuloong2e
Date: Fri, 25 Dec 2020 00:23:37 +0100
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
Cc: philmd@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

This implements the legacy-mode emulation option for via-ide which is
needed for Linux on fuloong2e. I've tested that the Debian kernel now
finds CD ROM and MorphOS on pegasos2 is not affected by this.

BALATON Zoltan (1):
  ide: Make room for flags in PCIIDEState and add one for legacy mode

Guenter Roeck (1):
  via-ide: Fix fuloong2e support

 hw/ide/cmd646.c      |  4 ++--
 hw/ide/via.c         | 19 +++++++++++++++++--
 hw/mips/fuloong2e.c  |  4 +++-
 hw/sparc64/sun4u.c   |  2 +-
 include/hw/ide/pci.h |  7 ++++++-
 5 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.21.3


