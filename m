Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586493962E0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 17:00:33 +0200 (CEST)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnjP5-0000qO-Tk
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 11:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjMI-0007Q2-Bc; Mon, 31 May 2021 10:57:38 -0400
Received: from [201.28.113.2] (port=60167 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lnjMG-0001Ug-Jo; Mon, 31 May 2021 10:57:38 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 11:57:32 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 732DD801481;
 Mon, 31 May 2021 11:57:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] target/ppc: Remove DO_PPC_STATISTICS and PPC_DUMP_CPU
Date: Mon, 31 May 2021 11:56:25 -0300
Message-Id: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 31 May 2021 14:57:32.0617 (UTC)
 FILETIME=[48D53B90:01D7562D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These 2 defines are being obsoleted as we move to decodetree, so they
were removed.

Also, upon further inspection, qemu already doesn't build with them
enabled, and probably hasn't for a while, and no one complained, so I
don't think they were actually being used.

Based-on: dgibson's ppc-for-6.1 tree

Changelog for v3:
 * Re-added patch that removed cpu_dump_statistics from hw/core/cpu
 * added HMP documentation patch to this series

Changelog for v2:
 * removed patches that were already applied
 * also removed PPC_DUMP_CPU functinality

Bruno Larsen (billionai) (4):
  hw/core/cpu: removed cpu_dump_statistics function
  HMP: added info cpustats to removed_features.rst
  target/ppc: removed GEN_OPCODE decision tree
  target/ppc: removed all mentions to PPC_DUMP_CPU

 docs/system/removed-features.rst |   5 +
 hw/core/cpu-common.c             |   9 --
 include/hw/core/cpu.h            |  12 --
 target/ppc/cpu_init.c            | 205 -------------------------------
 target/ppc/internal.h            |   2 -
 target/ppc/translate.c           | 184 ---------------------------
 6 files changed, 5 insertions(+), 412 deletions(-)

-- 
2.17.1


