Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813282E2F94
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 02:29:55 +0100 (CET)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktKsc-0007FL-Ix
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 20:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkS-0008QW-0L
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:28 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:61477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkN-0001AP-4p
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D9BD57470F3;
 Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AD70C74646C; Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Message-Id: <cover.1609031406.git.balaton@eik.bme.hu>
Date: Sun, 27 Dec 2020 02:10:06 +0100
Subject: [PATCH 00/12] Misc vt82c686b clean ups
Date: Sun, 27 Dec 2020 02:10:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, INVALID_DATE=1.096,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

This series are some small clean ups to the vt82c686b south bridge and
superio chip model that is only used by the mips/fuloong2e machine.
These are also in preparation to add emulation of the very similar
vt8231 later that will be used by ppc/pegasos2.

Regards,
BALATON Zoltan

BALATON Zoltan (12):
  vt82c686: Add APM and ACPI dependencies for VT82C686
  vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
  vt82c686: Remove unnecessary _DEVICE suffix from type macros
  vt82c686: Remove vt82c686b_[am]c97_init() functions
  vt82c686: Split off via-[am]c97 into separate file in hw/audio
  audio/via-ac97: Simplify code and set user_creatable to false
  vt82c686: Remove vt82c686b_isa_init() function
  vt82c686: Remove vt82c686b_pm_init() function
  vt82c686: Convert debug printf to trace points
  vt82c686: Remove unneeded includes and defines
  vt82c686: Rename some functions to better show where they belong
  vt82c686: Do not add floppy

 hw/audio/meson.build      |   1 +
 hw/audio/via-ac97.c       |  93 ++++++++++++++
 hw/isa/Kconfig            |   2 +
 hw/isa/trace-events       |   6 +
 hw/isa/vt82c686.c         | 258 +++++++-------------------------------
 hw/mips/fuloong2e.c       |  13 +-
 include/hw/isa/vt82c686.h |  12 +-
 7 files changed, 161 insertions(+), 224 deletions(-)
 create mode 100644 hw/audio/via-ac97.c

-- 
2.21.3


