Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B232E89C5
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:27:17 +0100 (CET)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsAu-0006Ql-35
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvs8Z-0004mI-TF; Sat, 02 Jan 2021 20:24:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:20372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvs8X-0000t7-63; Sat, 02 Jan 2021 20:24:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2857374760C;
 Sun,  3 Jan 2021 02:24:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A2F8C7470DD; Sun,  3 Jan 2021 02:24:43 +0100 (CET)
Message-Id: <cover.1609636173.git.balaton@eik.bme.hu>
Subject: [PATCH v3 0/5] Misc sam460ex fixes (was: Clean up sam460ex irq
 mapping)
Date: Sun, 03 Jan 2021 02:09:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

So this is v3 of a series that started to fix a potential problem with
irq mapping in pci440_pcix (used by sam460ex) that got some other
fixes along the way as by-products. But it turns out the irq issue
this was trying to fix is not really a problem so finally we just
update the comment for now documenting why it works and only the
by-products remain in this series. Of which there are two more in this
v3 finally fixing a long standing problem booting MorphOS on sam460ex
(which I've got after debugging similar problem with pegasos2/vt8231
that gave me an idea how to debug this.)

Regards,
BALATON Zoltan

BALATON Zoltan (5):
  ppc4xx: Move common dependency on serial to common option
  sam460ex: Remove FDT_PPC dependency from KConfig
  ppc440_pcix: Improve comment for IRQ mapping
  ppc440_pcix: Fix register write trace event
  ppc440_pcix: Fix up pci config access

 hw/ppc/Kconfig       |  6 +-----
 hw/ppc/ppc440_pcix.c | 50 ++++++++++++++++++++++++++++----------------
 hw/ppc/trace-events  |  1 +
 3 files changed, 34 insertions(+), 23 deletions(-)

-- 
2.21.3


