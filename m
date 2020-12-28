Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896012E3397
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 03:27:37 +0100 (CET)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktiFz-0000mw-UZ
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 21:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiD0-0007SB-1P
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:30 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktiCx-0003v9-5x
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 21:24:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AF8EA7470F2;
 Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2EE9E74645F; Mon, 28 Dec 2020 03:24:23 +0100 (CET)
Message-Id: <cover.1609121293.git.balaton@eik.bme.hu>
Subject: [PATCH v2 00/10] Misc vt82c686b clean ups
Date: Mon, 28 Dec 2020 03:08:13 +0100
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

I'm sending this v2 with tags added and small edits after Philippe's
review for now, maybe these are already good to go. I've taken out a
few patches that may need some more work but I've run out of free time
for now so will have to come back to them later. I still could not
cleanly add the VT8231 model which may need some more reorganising and
found a few issues with the existin 868B that may need to be fixed
first so those left out patches may change anyway so will be included
in a future series.

Regards,
BALATON Zoltan

BALATON Zoltan (10):
  vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
  vt82c686: Remove unnecessary _DEVICE suffix from type macros
  vt82c686b: Rename VT82C686B to VT82C686B_ISA
  vt82c686: Remove vt82c686b_[am]c97_init() functions
  vt82c686: Split off via-[am]c97 into separate file in hw/audio
  audio/via-ac97: Simplify code and set user_creatable to false
  vt82c686: Remove legacy vt82c686b_isa_init() function
  vt82c686: Remove legacy vt82c686b_pm_init() function
  vt82c686: Convert debug printf to trace points
  vt82c686: Remove unneeded includes and defines

 hw/audio/meson.build      |   1 +
 hw/audio/via-ac97.c       |  93 ++++++++++++++++
 hw/isa/trace-events       |   6 ++
 hw/isa/vt82c686.c         | 217 +++++---------------------------------
 hw/mips/fuloong2e.c       |  13 ++-
 include/hw/isa/vt82c686.h |  12 +--
 6 files changed, 139 insertions(+), 203 deletions(-)
 create mode 100644 hw/audio/via-ac97.c

-- 
2.21.3


