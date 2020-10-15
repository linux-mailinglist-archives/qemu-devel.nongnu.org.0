Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6616028FC09
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 02:21:54 +0200 (CEST)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTDVJ-0001Ea-G4
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 20:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTDRT-0005hM-35; Thu, 15 Oct 2020 20:17:55 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTDRM-0006ve-MM; Thu, 15 Oct 2020 20:17:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0C11C747625;
 Fri, 16 Oct 2020 02:17:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E55DF74761F; Fri, 16 Oct 2020 02:17:35 +0200 (CEST)
Message-Id: <cover.1602805637.git.balaton@eik.bme.hu>
Subject: [PATCH v8 0/5] Mac Old World ROM experiment (ppc/mac_* clean ups and
 loading binary ROM)
Date: Fri, 16 Oct 2020 01:47:17 +0200
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

This is the cut down version of the earlier series omitting unfinished
patches that I plan to rework later and rebased to Mark's qemu-macppc
branch. Compared to v7 the only change is the cast to (target_ulong)
from (uint32_t) as requested by Mark in patch 1.

Regards,
BALATON Zoltan

BALATON Zoltan (5):
  mac_oldworld: Allow loading binary ROM image
  mac_newworld: Allow loading binary ROM image
  mac_oldworld: Drop a variable, use get_system_memory() directly
  mac_oldworld: Drop some variables
  mac_oldworld: Change PCI address of macio to match real hardware

 hw/ppc/mac.h          |  2 --
 hw/ppc/mac_newworld.c | 22 ++++++++------
 hw/ppc/mac_oldworld.c | 67 ++++++++++++++++++++++++-------------------
 3 files changed, 52 insertions(+), 39 deletions(-)

-- 
2.21.3


