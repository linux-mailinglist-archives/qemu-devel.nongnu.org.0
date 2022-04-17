Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A90504999
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 23:16:24 +0200 (CEST)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngCFq-0004Mx-IU
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 17:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCD4-0001rB-He; Sun, 17 Apr 2022 17:13:30 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:48562
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@luna.fluff.org>)
 id 1ngCD2-0001bW-Ig; Sun, 17 Apr 2022 17:13:30 -0400
Received: from localhost ([127.0.0.1] helo=luna)
 by hetzy.fluff.org with esmtp (Exim 4.89)
 (envelope-from <ben@luna.fluff.org>)
 id 1nfp7E-0008Rw-RN; Sat, 16 Apr 2022 21:33:56 +0100
Received: from ben by luna with local (Exim 4.95)
 (envelope-from <ben@luna.fluff.org>) id 1nfo7v-002G1Z-UR;
 Sat, 16 Apr 2022 20:30:35 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: qemu-devel@nongnu.org
Subject: A couple of new device-tree helpers.
Date: Sat, 16 Apr 2022 20:30:30 +0100
Message-Id: <20220416193034.538161-1-qemu@ben.fluff.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -0.6 (/)
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: ben@luna.fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: none client-ip=2a01:4f8:222:2004::3;
 envelope-from=ben@luna.fluff.org; helo=hetzy.fluff.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've been doing a bit of looking at riscv and dt creation, and
was thinking the following two helper functions would be useful
so implemented qemu_fdt_setprop_reg64() and qemu_fdt_setprop_strings()
and then applied them to the hw/riscv/sifive_u.c machine.

I thought I should get a review in before I continued on looking
at more possible helpers to make the dtb creation code leaner.



