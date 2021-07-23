Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351093D4011
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:59:13 +0200 (CEST)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6zS3-0007fo-NV
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m6zPf-0005bb-8K; Fri, 23 Jul 2021 13:56:43 -0400
Received: from [201.28.113.2] (port=37617 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m6zPc-00038U-78; Fri, 23 Jul 2021 13:56:42 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 23 Jul 2021 14:56:34 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 3A05C801022;
 Fri, 23 Jul 2021 14:56:34 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 0/3] target/ppc: MMU clean up
Date: Fri, 23 Jul 2021 14:56:24 -0300
Message-Id: <20210723175627.72847-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 23 Jul 2021 17:56:34.0353 (UTC)
 FILETIME=[134CD210:01D77FEC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series aims to clean up some of the code mmu_helper.c,
including removing the #includes inside ifdef.

This version of the patch has been rebased on the current ppc-for-6.2
branch as adapted accordingly.

v4: Moved functions declarations from cpu.h to internal.h when possible.

v5: Changed the copyright of target/ppc/mmu_common.c to be the same as
target/ppc/mmu_helper.c. Updated the message of helper_regs.c

Comments are welcome, thanks,
Lucas Mateus.

Lucas Mateus Castro (alqotel) (3):
  target/ppc: divided mmu_helper.c in 2 files
  target/ppc: moved ppc_store_sdr1 to mmu_common.c
  target/ppc: moved store_40x_sler to helper_regs.c

 target/ppc/cpu.c         |   28 -
 target/ppc/cpu.h         |    9 +
 target/ppc/helper_regs.c |   12 +
 target/ppc/internal.h    |   39 +
 target/ppc/meson.build   |    8 +-
 target/ppc/mmu_common.c  | 1620 ++++++++++++++++++++++++++++++++++++++
 target/ppc/mmu_helper.c  | 1590 +------------------------------------
 7 files changed, 1686 insertions(+), 1620 deletions(-)
 create mode 100644 target/ppc/mmu_common.c

-- 
2.17.1


