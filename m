Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7103B2D71
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:14:16 +0200 (CEST)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNJH-0006b1-J0
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwMxS-0004qi-GX
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:51:43 -0400
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:49783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwMxO-0007yS-V6
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:51:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3858004|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.061819-6.40986e-05-0.938117;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=3; RT=3; SR=0; TI=SMTPD_---.KXKBQkc_1624531893; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKBQkc_1624531893)
 by smtp.aliyun-inc.com(10.147.40.200);
 Thu, 24 Jun 2021 18:51:33 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] tcg: Add 32-bit vector operations
Date: Thu, 24 Jun 2021 18:50:18 +0800
Message-Id: <20210624105023.3852-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=115.124.28.122; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-122.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set is split from RISC-V Packed extension where needs
some i32 vector operations, accorind to Richard Henderson's suggestion.

The original implementation is on
https://www.mail-archive.com/qemu-devel@nongnu.org/msg814538.html.

LIU Zhiwei (5):
  tcg: Add tcg_gen_vec_add{sub}16_i32
  tcg: Add tcg_gen_vec_add{sub}8_i32
  tcg: Add tcg_gen_vec_shl{shr}{sar}16i_i32
  tcg: Add tcg_gen_vec_shl{shr}{sar}8i_i32
  tcg: Implement tcg_gen_vec_add{sub}32_tl

 include/tcg/tcg-op-gvec.h |  43 ++++++++++++++
 tcg/tcg-op-gvec.c         | 122 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)

-- 
2.17.1


