Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFFD50FDAB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:53:03 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKgg-0000TO-77
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKaC-0006LT-Ng; Tue, 26 Apr 2022 08:46:20 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKaA-0007DX-Ux; Tue, 26 Apr 2022 08:46:20 -0400
Received: from quad ([82.142.9.138]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MysBI-1o4amq2DJK-00vyii; Tue, 26
 Apr 2022 14:46:14 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] docs: Replace Qemu -> QEMU
Date: Tue, 26 Apr 2022 14:46:09 +0200
Message-Id: <20220426124610.639614-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426124610.639614-1-laurent@vivier.eu>
References: <20220426124610.639614-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BVWSMNZ8ZzYQaSQNSyPt9gTkxJicL0/tTqyrH4Jq0/3HJOXoHxc
 WWnn39M/Nt3ITI3I96vibYh7h83rtwtHbckFgVg2L7jwHzLp6CIeKEhkOLF63XSmMqWqrNx
 oUXCbqs1X2T/Dl18Fjz5VuwdlXYQQ08CagujpuSGqqtbyBVlEj/abZdptDj4+tt1Rh9ZVwI
 yJLHWMdLsmFjrFTC8TX0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oh0jsigXXpQ=:6evrnPj7txYUf2wdjmQOb0
 odq3to2/tHtbUuqWz3+yA8c7+e2JlUroycaFRa9TlAmWPOYkxRNaJstu2R1dVQmPir7ynva5U
 Uooq7jKNTWcOHMg0edv38B/QW729Yg6/2x/7tjzweGH4ZD6AGQXkZ4Lc3lLr3VeWxfdo9DF/S
 c2lUyOBsRAcz0b/7tPE1hGqXiiY5Eu9Xs1Rc2xF2B4ykJFbdC2WJMWgMe9FbQltYg0dqe/QLx
 YNfpqiXwTo2mQdBkUnwCd/7aNB+cHUwIYgXo0VO5KFjaEv1LVUJrytiCksRFf7Hz8ICKz5egR
 lWZo8fRohyifwPAHH7JEXtTPYhToR+OCLXYJ2E5YVym2bgpk8CNWXlAfftKmQkVNyns1+MCc6
 vwrGxMxM9DbEkKtfvkXTTRJlzfuXd0BFQtqGRYAyuoKcacDc2wnwXswL8iP2nfaj24xvOVH/6
 YentCh8YyJlFI+GE62FUEYuiDTbUQ5uyoH7x2uAoZihoy565vqENCPIAXeEIdneA4KPMzl3lh
 S3tYuBh4P9kt4RyBmjOt+MyyPQCFD+zeJqgTIpIj2RtsAtIXzOmQU9XA/VZ6BREolzwrBSqm5
 NvYGsm43RZA58MlFzR2/GFnJJJSRa/nWkD6L23fOa/v6RRn/mfj0m5oG8rQxLnBbvlp+I6ax2
 kfCteC1a2rLjYgYplsScHlNzs6i/hCGjvOR1GA+NZmQxGEkQ45bjFysqxlER1eF6SRts=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bmeng.cn@gmail.com>, Knut Omang <knuto@ifi.uio.no>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Knut Omang <knuto@ifi.uio.no>
Message-Id: <20220422083007.1082667-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/pcie_sriov.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
index f5e891e1d451..11158dbf8890 100644
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
2.35.1


