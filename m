Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E562E7FA1
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 12:22:44 +0100 (CET)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuw2U-00038V-Iw
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 06:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuw0U-0001XT-J3; Thu, 31 Dec 2020 06:20:38 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kuw0R-0003eY-Mu; Thu, 31 Dec 2020 06:20:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 53FCB7470E9;
 Thu, 31 Dec 2020 12:20:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2A2CE7470E3; Thu, 31 Dec 2020 12:20:30 +0100 (CET)
Message-Id: <cover.1609413115.git.balaton@eik.bme.hu>
Subject: [PATCH v2 0/3] Clean up sam460ex irq mapping
Date: Thu, 31 Dec 2020 12:11:55 +0100
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

v2 of https://patchew.org/QEMU/cover.1608937677.git.balaton@eik.bme.hu/
with added Tested-by from Guenter and revised patch 2 as suggested by
Philippe.

Regards,
BALATON Zoltan

BALATON Zoltan (3):
  ppc4xx: Move common dependency on serial to common option
  sam460ex: Remove FDT_PPC dependency from KConfig
  sam460ex: Clean up irq mapping

 hw/ppc/Kconfig       |  7 ++-----
 hw/ppc/ppc440_pcix.c | 28 ++++++++++++++--------------
 hw/ppc/sam460ex.c    | 16 +++++++++++++---
 3 files changed, 29 insertions(+), 22 deletions(-)

-- 
2.21.3


