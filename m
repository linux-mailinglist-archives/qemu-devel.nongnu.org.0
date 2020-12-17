Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120EF2DD077
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:36:08 +0100 (CET)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprZn-0004V3-1U
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprX0-0002Pd-TX; Thu, 17 Dec 2020 06:33:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kprWy-0005fr-Cx; Thu, 17 Dec 2020 06:33:14 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CxVG70Xnnz15f8P;
 Thu, 17 Dec 2020 19:32:15 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Thu, 17 Dec 2020
 19:32:46 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 0/7] Fix some memleaks caused by ptimer_init
Date: Thu, 17 Dec 2020 19:31:37 +0800
Message-ID: <20201217113137.121607-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 i.mitsyanko@gmail.com, sundeep.lkml@gmail.com, b.galvani@gmail.com,
 jan.kiszka@web.de, antonynpavlov@gmail.com, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1->v2:
Changes suggested by Peter Maydell:
    Delete the modification of unrelated whitespace.

Gan Qixin (7):
  allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid
    memleaks
  digic-timer: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_mct: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_pwm: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_rtc: Use ptimer_free() in the finalize function to avoid
    memleaks
  mss-timer: Use ptimer_free() in the finalize function to avoid
    memleaks
  musicpal: Use ptimer_free() in the finalize function to avoid memleaks

 hw/arm/musicpal.c            | 12 ++++++++++++
 hw/rtc/exynos4210_rtc.c      |  9 +++++++++
 hw/timer/allwinner-a10-pit.c | 11 +++++++++++
 hw/timer/digic-timer.c       |  8 ++++++++
 hw/timer/exynos4210_mct.c    | 14 ++++++++++++++
 hw/timer/exynos4210_pwm.c    | 11 +++++++++++
 hw/timer/mss-timer.c         | 13 +++++++++++++
 7 files changed, 78 insertions(+)

-- 
2.23.0


