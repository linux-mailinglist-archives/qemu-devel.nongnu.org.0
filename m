Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C412EA0B4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:26:24 +0100 (CET)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZF1-0007mW-5k
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZCB-00066F-3w; Mon, 04 Jan 2021 18:23:28 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZC7-0007yi-Th; Mon, 04 Jan 2021 18:23:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3085E7470ED;
 Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0A00374646C; Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Message-Id: <cover.1609802040.git.balaton@eik.bme.hu>
Subject: [PATCH v4 0/4] Misc sam460ex fixes (was: Clean up sam460ex irq
 mapping)
Date: Tue, 05 Jan 2021 00:14:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Changes from v3:

- removed first two patches changing Kconfig because the FDT one seems
to be needed so we should not remove those from KConfig and there was
some question about patch 1

- added a new patch to use type cast macro in sam460ex.c

- the other 3 patches should be the same as in v3

Regards,
BALATON Zoltan

BALATON Zoltan (4):
  ppc440_pcix: Improve comment for IRQ mapping
  ppc440_pcix: Fix register write trace event
  ppc440_pcix: Fix up pci config access
  sam460ex: Use type cast macro instead of simple cast

 hw/ppc/ppc440_pcix.c | 50 ++++++++++++++++++++++++++++----------------
 hw/ppc/sam460ex.c    |  7 ++-----
 hw/ppc/trace-events  |  1 +
 3 files changed, 35 insertions(+), 23 deletions(-)

-- 
2.21.3


