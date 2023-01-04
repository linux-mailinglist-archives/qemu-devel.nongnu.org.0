Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6259565DFCD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:20:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBrO-00079J-74; Wed, 04 Jan 2023 17:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpi-00069c-C0; Wed, 04 Jan 2023 17:02:14 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDBpd-0003BJ-PW; Wed, 04 Jan 2023 17:02:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7F31074900C;
 Wed,  4 Jan 2023 22:59:35 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 63E6D748131; Wed,  4 Jan 2023 22:59:35 +0100 (CET)
Message-Id: <cover.1672868854.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 0/7] Misc ppc/mac machines clean up
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed,  4 Jan 2023 22:59:35 +0100 (CET)
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is the remainder of the series that were postponed to after the
freeze the last time I've tried to submit them with some new patches
I did meanwhile.

BALATON Zoltan (7):
  input/adb: Only include header where needed
  mac_{old,new}world: Use local variable instead of qdev_get_machine()
  mac_{old,new}world: Pass MacOS VGA NDRV in card ROM instead of fw_cfg
  mac_newworld: Add machine types for different mac99 configs
  mac_newworld: Deprecate mac99 with G5 CPU
  mac_newworld: Deprecate mac99 "via" option
  mac_newworld: Document deprecation

 docs/about/deprecated.rst    |   7 ++
 docs/system/ppc/powermac.rst |  12 ++--
 hw/misc/macio/cuda.c         |   2 -
 hw/misc/macio/pmu.c          |   3 -
 hw/misc/mos6522.c            |   1 -
 hw/ppc/mac_newworld.c        | 130 +++++++++++++++++++++++++++++++----
 hw/ppc/mac_oldworld.c        |  21 ++----
 include/hw/misc/mac_via.h    |   1 +
 include/hw/misc/macio/cuda.h |   1 +
 include/hw/misc/macio/pmu.h  |   1 +
 include/hw/misc/mos6522.h    |   3 +-
 11 files changed, 142 insertions(+), 40 deletions(-)

-- 
2.30.6


