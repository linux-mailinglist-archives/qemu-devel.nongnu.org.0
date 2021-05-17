Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8933829C2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:24:22 +0200 (CEST)
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaQ9-0004Lw-Bl
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaMi-0005FD-NM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:48 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:37444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaMg-0002bQ-O7
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:48 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210517102044epoutp02aa9b3e15cf3940295ceeba5eb4d2dec3~-02pWHlTW1567915679epoutp02z
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:20:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210517102044epoutp02aa9b3e15cf3940295ceeba5eb4d2dec3~-02pWHlTW1567915679epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621246844;
 bh=JWB+s20z1trhETcxanE4eIPwqFS0SRQjqMsoAG50dfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r8uzUeUQ1ms76FOhpWrzjFiSk+VyuHucueZ5wUmzJjA5Bi7tlH5+jwKQMrYHgWYk4
 G7VJePJgMJu/0A5XCknWM7Gu1Nm+Olo4+PB+MsCt45OBaOvi2QPHGhAlF0WjUnWwlX
 bl1LI6/JapuTwIMK25Gl8UhZ+FVKcx/vqVZweX+U=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210517102044epcas5p34518b142dbc6695522029c0fc7089887~-02pCwT-_0266602666epcas5p37;
 Mon, 17 May 2021 10:20:44 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.49.09697.C7342A06; Mon, 17 May 2021 19:20:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210517101216epcas5p1956b513907b466eb10ba392ea8f4b6d3~-0vQFOV8x0121001210epcas5p1E;
 Mon, 17 May 2021 10:12:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210517101216epsmtrp1b65ec6c70783ab65b55765f9aac99028~-0vQEYYV40132801328epsmtrp1J;
 Mon, 17 May 2021 10:12:16 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-7a-60a2437c7f63
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 13.F6.08637.08142A06; Mon, 17 May 2021 19:12:16 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210517101214epsmtip1fbe31e0e400fa00433e1ae2f7094497b~-0vOkwGJn1372913729epsmtip1D;
 Mon, 17 May 2021 10:12:14 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/nvme/ctrl: documentation fix
Date: Mon, 17 May 2021 15:37:36 +0530
Message-Id: <20210517100736.17063-4-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517100736.17063-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsWy7bCmhm6N86IEg2cHOS1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErozZ13kLGtgrene3sDUwHmXtYuTkkBAw
 kXi6/huYLSSwm1Hi8hmrLkYuIPsTo0RL0x42COcbo8T2E32MMB3Lby1lhEjsZZRYeu02lNPJ
 JNH4qg2sik3ASGL22zdgtoiApMTvrtPMIDYzyI5vc3VAbGGgSXfe/AWLswioSrz+9RHM5hWw
 lZg7ZyUTxDZ5idUbDoDFOQXsJDatPsgKskxC4Ba7ROfkXhaIIheJZdOXQj0kLPHq+BZ2CFtK
 4mV/G5DNDmRXSxwugmjtYJQ4dnkDG0SJvcS/Z9OA7uQAuk1TYv0ufYiwrMTUU+uYIE7mk+j9
 /QTqHF6JHfNgbDWJBbe+Q22SkZj55zbUBR4Sf248ZoWEyURGifabixknMMrNQlixgJFxFaNk
 akFxbnpqsWmBUV5quV5xYm5xaV66XnJ+7iZGcKrQ8trB+PDBB71DjEwcjIcYJTiYlUR4P4XN
 TxDiTUmsrEotyo8vKs1JLT7EKM3BoiTOu+Lh5AQhgfTEktTs1NSC1CKYLBMHp1QDk/T2Lc7N
 JSnzDs+qXmjpGe69cPNl9x8HX/x+FMBsaXfJ8UP4HraFdy9dfBOpyv3i8dyWn3pH1toVbrjy
 iHXuo8aPJ1QO/MkN8Twbw+/l9Cd43dGvqxKfxHIafQ94uIKFcdr6R0d1df59bmd9cuibyn2O
 2q/nZpiF/zsftsNiTvgFpf2PXjrJ9y34Ynww3XWZhyzjew8W1TAvZ5WgNGsFadees248TL8e
 hCk89d2QP2lxs7QAv/OMnJcmEutu7Tx++Lvh5YbM9kKP7gf5p1kWW6RaGTyVDDH4zicrZep9
 t/KAQcy3Ceo3ZiVYVd//+9royv+4Y0ftJvqzae6evaluY6B45doZn91YP/5nsj/Tk63EUpyR
 aKjFXFScCAAubYPZhAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWy7bCSnG6D46IEg9YjPBavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bs67wFDewVvbtb2BoYj7J2MXJySAiY
 SCy/tZSxi5GLQ0hgN6PEj69TmCESMhK/Tk2FsoUlVv57zg5R1M4ksad/PyNIgk3ASGL22zdg
 toiApMTvrtPMIEXMAkcZJS63T2YBSQgDrbjz5i/YJBYBVYnXvz6C2bwCthJz56xkgtggL7F6
 wwGwOKeAncSm1QfBzhMCqvnfs599AiPfAkaGVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5
 uZsYwSGppbmDcfuqD3qHGJk4GA8xSnAwK4nwfgqbnyDEm5JYWZValB9fVJqTWnyIUZqDRUmc
 90LXyXghgfTEktTs1NSC1CKYLBMHp1QD066pE/YJHXaemCcYfYG3urdi0fQDxrMXNRgzqFVG
 mKm8X3Jr07ELCZycKv8u+Lz6EeFx+kr2J/X26HuiLRPmsLz26P62+5HWVKVuHe+Z02+9MFR6
 vuqKvOfaW21r5zTxlT7NPxi+5sK67plLZgf1KWsLPZGTP6Av07YwvLZ8oVbSr6C55VsUO3fM
 sSxZusXlgfNL5ZXSm080Pa1uXjhj1b9FPn7rlnIGM01g3PUz+m/c9JnT/8xSONgZdSbqwNrr
 cpIaU15P4Ck6tkb95Jo5ukess2RW3n20cucu1cM1LxZz+77/92bF1ROaX9MumEXurgq7H2Wy
 98WRHpMfkvmXVys4qQoEm1++UjLNY8dbg/ynSizFGYmGWsxFxYkAFO8WwbgCAAA=
X-CMS-MailID: 20210517101216epcas5p1956b513907b466eb10ba392ea8f4b6d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210517101216epcas5p1956b513907b466eb10ba392ea8f4b6d3
References: <20210517100736.17063-1-anaidu.gollu@samsung.com>
 <CGME20210517101216epcas5p1956b513907b466eb10ba392ea8f4b6d3@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the documentation of the '-detached' param "be" and "not" has been
used side by side, fix that.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 813a72c655..a3df26d0ce 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -114,7 +114,7 @@
  *   This parameter is only valid together with the `subsys` parameter. If left
  *   at the default value (`false/off`), the namespace will be attached to all
  *   controllers in the NVMe subsystem at boot-up. If set to `true/on`, the
- *   namespace will be be available in the subsystem not not attached to any
+ *   namespace will be available in the subsystem not attached to any
  *   controllers.
  *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
-- 
2.17.1


