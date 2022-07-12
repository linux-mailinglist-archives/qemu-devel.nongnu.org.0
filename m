Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87725725F1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 21:41:06 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBLkn-0006vu-Je
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 15:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oBLhl-0004OP-Dk; Tue, 12 Jul 2022 15:37:57 -0400
Received: from [200.168.210.66] (port=54201 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oBLhj-0004T6-Ry; Tue, 12 Jul 2022 15:37:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 16:37:50 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5766D800146;
 Tue, 12 Jul 2022 16:37:50 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com, richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH v3 0/2] target/ppc: Implement ISA 3.00 tlbie[l]
Date: Tue, 12 Jul 2022 16:37:39 -0300
Message-Id: <20220712193741.59134-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 12 Jul 2022 19:37:50.0730 (UTC)
 FILETIME=[DF55DEA0:01D89626]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v2:
- Moved TLBIE defines from helper.h to mmu-book3s-v3.h

Leandro Lupori (2):
  target/ppc: Move tlbie[l] to decode tree
  target/ppc: Implement ISA 3.00 tlbie[l]

 target/ppc/cpu_init.c                        |   4 +-
 target/ppc/helper.h                          |   2 +
 target/ppc/insn32.decode                     |   8 +
 target/ppc/mmu-book3s-v3.h                   |  15 ++
 target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
 target/ppc/translate.c                       |  64 +-------
 target/ppc/translate/storage-ctrl-impl.c.inc | 104 +++++++++++++
 7 files changed, 287 insertions(+), 64 deletions(-)
 create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc

-- 
2.25.1


