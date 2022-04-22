Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0650B302
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:35:17 +0200 (CEST)
Received: from localhost ([::1]:46640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhol2-0001eU-1P
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhog9-00085u-Sa; Fri, 22 Apr 2022 04:30:13 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:51056
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhog7-00052Q-Ir; Fri, 22 Apr 2022 04:30:13 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id EB505DA0C54;
 Fri, 22 Apr 2022 10:30:08 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id DB124462074; Fri, 22 Apr 2022 10:30:08 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Knut Omang <knut.omang@oracle.com>
Subject: [PATCH] docs: Replace Qemu -> QEMU
Date: Fri, 22 Apr 2022 10:30:07 +0200
Message-Id: <20220422083007.1082667-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/pcie_sriov.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
index f5e891e1d4..11158dbf88 100644
--- a/docs/pcie_sriov.txt
+++ b/docs/pcie_sriov.txt
@@ -8,8 +8,8 @@ of a PCI Express device. It allows a single physical function (PF) to appear as
 virtual functions (VFs) for the main purpose of eliminating software
 overhead in I/O from virtual machines.
 
-Qemu now implements the basic common functionality to enable an emulated device
-to support SR/IOV. Yet no fully implemented devices exists in Qemu, but a
+QEMU now implements the basic common functionality to enable an emulated device
+to support SR/IOV. Yet no fully implemented devices exists in QEMU, but a
 proof-of-concept hack of the Intel igb can be found here:
 
 git://github.com/knuto/qemu.git sriov_patches_v5
@@ -18,7 +18,7 @@ Implementation
 ==============
 Implementing emulation of an SR/IOV capable device typically consists of
 implementing support for two types of device classes; the "normal" physical device
-(PF) and the virtual device (VF). From Qemu's perspective, the VFs are just
+(PF) and the virtual device (VF). From QEMU's perspective, the VFs are just
 like other devices, except that some of their properties are derived from
 the PF.
 
-- 
2.30.2


