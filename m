Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD55393544
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 20:11:01 +0200 (CEST)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmKTD-00057a-VE
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 14:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmKQS-0003VS-RG; Thu, 27 May 2021 14:08:08 -0400
Received: from [201.28.113.2] (port=34917 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmKQR-00026T-9p; Thu, 27 May 2021 14:08:08 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 27 May 2021 15:08:03 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 34E1B8013E1;
 Thu, 27 May 2021 15:08:03 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] target/ppc: Remove DO_PPC_STATISTICS and PPC_DUMP_CPU
Date: Thu, 27 May 2021 15:07:59 -0300
Message-Id: <20210527180801.40513-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 27 May 2021 18:08:03.0355 (UTC)
 FILETIME=[3C6E6EB0:01D75323]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, groug@kaod.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These 2 defines are being obsoleted as we move to decodetree, so they
were removed.

Also, upon further inspection, qemu already doesn't build with them
enabled, and probably hasn't for a while, and no one complained, so I
don't think they were actually being used.

Based-on: dgibson's ppc-for-6.1 tree

Changelog for v2:
 * removed patches that were already applied
 * also removed PPC_DUMP_CPU functinality

Bruno Larsen (billionai) (2):
  target/ppc: removed GEN_OPCODE decision tree
  target/ppc: removed all mentions to PPC_DUMP_CPU

 target/ppc/cpu_init.c  | 205 -----------------------------------------
 target/ppc/internal.h  |   2 -
 target/ppc/translate.c | 184 ------------------------------------
 3 files changed, 391 deletions(-)

-- 
2.17.1


