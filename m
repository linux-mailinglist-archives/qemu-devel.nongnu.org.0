Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB92434A6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 09:16:07 +0200 (CEST)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k67T4-00035G-6U
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 03:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k67Rh-0001tB-7i
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 03:14:41 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1k67Re-0007cv-Ir
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 03:14:40 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3863851|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.160862-0.00219987-0.836938;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03273; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=6; RT=6; SR=0; TI=SMTPD_---.IGxBKGW_1597302868; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.IGxBKGW_1597302868)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 13 Aug 2020 15:14:28 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Implement blfoat16 in softfloat
Date: Thu, 13 Aug 2020 15:14:18 +0800
Message-Id: <20200813071421.2509-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:14:30
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, aurelien@aurel32.net,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As bfloat16 is more and more popular in many archs, implement bfloat16
interfaces in softfloat, so that archs can add their bfloat16 insns
based on the blfoat16 interfaces here.

These interfaces have been tested by RISU on RISC-V bfloat16 with
XuanTie C906.

LIU Zhiwei (3):
  fpu/softfloat: Define operations for bfloat16
  fpu/softfloat: Define convert operations for bfloat16
  fpu/softfloat: Define misc operations for bfloat16

 fpu/softfloat-specialize.inc.c |  38 ++++
 fpu/softfloat.c                | 391 +++++++++++++++++++++++++++++++++
 include/fpu/softfloat-types.h  |   5 +
 include/fpu/softfloat.h        | 133 +++++++++++
 4 files changed, 567 insertions(+)

-- 
2.23.0


