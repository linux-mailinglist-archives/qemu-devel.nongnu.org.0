Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F5E3D0F86
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:29:36 +0200 (CEST)
Received: from localhost ([::1]:35894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CI3-0007sj-HL
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m6CAt-0006w5-CP; Wed, 21 Jul 2021 09:22:11 -0400
Received: from [201.28.113.2] (port=39011 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m6CAr-0002rI-On; Wed, 21 Jul 2021 09:22:10 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 21 Jul 2021 10:22:04 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 8A7E380148F;
 Wed, 21 Jul 2021 10:22:04 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 0/3] target/ppc: MMU clean up
Date: Wed, 21 Jul 2021 10:21:41 -0300
Message-Id: <20210721132144.39508-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 21 Jul 2021 13:22:04.0699 (UTC)
 FILETIME=[65CB8EB0:01D77E33]
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


