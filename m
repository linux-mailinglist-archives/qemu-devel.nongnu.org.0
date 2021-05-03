Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83873712D3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:04:30 +0200 (CEST)
Received: from localhost ([::1]:52148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUVB-00078o-Tn
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4q-0003Yt-No; Mon, 03 May 2021 04:37:18 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4U-0000sE-2f; Mon, 03 May 2021 04:37:16 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTRhS-1m0cb20ke4-00TpDR; Mon, 03
 May 2021 10:36:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] docs/system: Document the removal of "compat" property
 for POWER CPUs
Date: Mon,  3 May 2021 10:36:20 +0200
Message-Id: <20210503083623.139700-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:71FFrYxxH0X/QM1imY/A4cHUoGNjR4l6nxssji5KPAz4+GHnFYk
 SFrccdsomAS10PlyMuEC0bWATVs93KCwBvgHsx/MKU4dTMiqMF7likVnkG+B4d/xxki0ID1
 Ardt7wQh5mxq5BfVBOfyRjVj1zKVyLLS3dgzEIOzsITRXUBWsY4kq7YuAtx3BqOBRFIIRTN
 OC4pH9O4KCboBfvMaQ2Fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jz1L0etsp10=:E/5Fnxh/t5SOnSHKJn51y8
 LsgHiB2hd7jSocfIsk5UC9SczmYiCUzlSmWdg8m6PASJJzvMsplUHY2ewJPYxx7awal+fpPiE
 R8sYc63gOzwRP5Jmj8D0sXZ0Up+vVU6WidWkS4Lnbh1kxDBqvTTDGfyR/84GTcdU60ttRQA8/
 rQgRlQovXBOfELLnui+bVJCGPFw2PfRFDlAiyXWuz7yCCiZWGnQBpI9jaLiAM9sEBgElzLN0N
 G4J0Yj7XHnsLOmYgmezV7b6TMPRPOJL7vjvZ6pwmTEEAa2uDVQSusJN0HF1IYXp3cTZMaUVkA
 XswDah/ejOUj/RKZbtiEX+IWJwqLaCfkQVC/xgj2HyMTsrFQHrU33EPJ/yc3gzC7EPNnHCH+K
 T0iLGqX9z7JBjLRiGOiqE6WerPXWpOwZIFnKwypUsY2IvpfXXkWT1Fx6ec0K3FpnYsqzIu5d9
 4LN2yRc+V7wkWXnBnZtTzNzPQrO3rgd8AgBjiVmWU2dya3s8kS5tznqVwjRcF5C5G7QVFd5Je
 UkyQfg+8tpUA7uaDtQMkV0=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

This is just an oversight.

Fixes: f518be3aa35b ("target/ppc: Remove "compat" property of server class POWER CPUs")
Cc: groug@kaod.org
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <161399328834.51902.14269239378658110394.stgit@bahia.lan>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/system/removed-features.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 29e90601a51a..c21e6fa5ee3c 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -285,6 +285,12 @@ The RISC-V no MMU cpus have been removed. The two CPUs: ``rv32imacu-nommu`` and
 ``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be specified
 via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
 
+``compat`` property of server class POWER CPUs (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``max-cpu-compat`` property of the ``pseries`` machine type should be used
+instead.
+
 System emulator machines
 ------------------------
 
-- 
2.31.1


