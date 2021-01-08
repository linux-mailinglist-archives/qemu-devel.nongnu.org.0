Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79992EFAFF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:20:04 +0100 (CET)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky071-0007W8-Li
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky04S-0005n6-UP; Fri, 08 Jan 2021 17:17:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky04P-0004v0-VA; Fri, 08 Jan 2021 17:17:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4CB74747100;
 Fri,  8 Jan 2021 23:17:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 224D57470F4; Fri,  8 Jan 2021 23:17:19 +0100 (CET)
Message-Id: <cover.1610143658.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 8 Jan 2021 23:07:38 +0100
Subject: [PATCH v2 0/3] Fix up sam460ex fixes
Date: Fri, 08 Jan 2021 23:07:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, INVALID_DATE=1.096,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Accidentally the wrong version of this series was committed, this
series fixes that up to the last version that was meant to be merged.
This v2 is rebased on Peter's UIC series and clarifies commit message
of last patch.

Based-on: <20210108171212.16500-1-peter.maydell@linaro.org>

BALATON Zoltan (3):
  Revert "sam460ex: Remove FDT_PPC dependency from KConfig"
  Revert "ppc4xx: Move common dependency on serial to common option"
  sam460ex: Use type cast macro instead of simple cast

 hw/ppc/Kconfig    | 6 +++++-
 hw/ppc/sam460ex.c | 7 ++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.21.3


