Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F12EC069
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 16:32:47 +0100 (CET)
Received: from localhost ([::1]:49224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAnm-00061v-7P
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 10:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAkU-0003vL-En; Wed, 06 Jan 2021 10:29:25 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:13311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAkM-00032j-25; Wed, 06 Jan 2021 10:29:22 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 73B337470EC;
 Wed,  6 Jan 2021 16:29:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E98717470E2; Wed,  6 Jan 2021 16:29:10 +0100 (CET)
Message-Id: <cover.1609946641.git.balaton@eik.bme.hu>
Subject: [PATCH 0/3] Fix up sam460ex fixes
Date: Wed, 06 Jan 2021 16:24:01 +0100
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Accidentally the wrong version of this series was committed, this
series fixes that up to the last version that was meant to be merged.

BALATON Zoltan (3):
  Revert "sam460ex: Remove FDT_PPC dependency from KConfig"
  Revert "ppc4xx: Move common dependency on serial to common option"
  sam460ex: Use type cast macro instead of simple cast

 hw/ppc/Kconfig    | 6 +++++-
 hw/ppc/sam460ex.c | 7 ++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.21.3


