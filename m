Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D4B3A762D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:55:48 +0200 (CEST)
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt175-0007CP-VE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lt0yb-0002X7-Dn
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:47:01 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:10151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lt0yY-0004bW-OJ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:47:01 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210615044648epoutp036277c36b7fb97f8b60793eba5e697a08~IqAW-7FB20550405504epoutp03D
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 04:46:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210615044648epoutp036277c36b7fb97f8b60793eba5e697a08~IqAW-7FB20550405504epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1623732408;
 bh=KSXBE9F4gOnBrThEo+BacRp9od/CmJEIIzD+Xc+mdxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Eh3keMaUnPe/YR/PDEioTKxaIJy4dvljqzm1YFUwOgrPmgyNz4Y4i3rOctnQxBtqn
 wYSNUlT6rKOgh+8zEqgGZXFuWqv81cIZf7TkeGpqiHY5qekgShhGW4pyvSMJAddLTX
 /bfKMz92jCc8KsdHSv7YPzmMA0kt9bT4G7jvTw8Q=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210615044647epcas5p3f235549128c9de80a30271bea5bd81ad~IqAWZ8DZ81616216162epcas5p3M;
 Tue, 15 Jun 2021 04:46:47 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C3.60.09835.7B038C06; Tue, 15 Jun 2021 13:46:47 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210614163348epcas5p45e562850a0c1ec42470279d8fe7dcf35~IgAXm8lFx2408624086epcas5p4j;
 Mon, 14 Jun 2021 16:33:48 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210614163348epsmtrp1b32a7ad0351dcb1ba8bf115f3b696177~IgAXmMHJb2093220932epsmtrp1Z;
 Mon, 14 Jun 2021 16:33:48 +0000 (GMT)
X-AuditID: b6c32a4b-7dfff7000000266b-ce-60c830b7e0d3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BA.43.08163.CE487C06; Tue, 15 Jun 2021 01:33:48 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210614163346epsmtip2b30c2c73aaa2ffefd906fa1fc654dfa6~IgAWGBDsP3268332683epsmtip2M;
 Mon, 14 Jun 2021 16:33:46 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] hw/nvme: documentation fix
Date: Mon, 14 Jun 2021 21:59:27 +0530
Message-Id: <20210614162927.10515-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210614162927.10515-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsWy7bCmlu52gxMJBkffK1q83nmc2eLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVvMetfOZnG8dweLxetJ/1kdOD1+nGtn8zi34zy7x6ZVnWwe
 T65tZvJ4v+8qm0ffllWMAWxRXDYpqTmZZalF+nYJXBkLJpxgKmhhr9jc8IytgfEEaxcjJ4eE
 gIlE96I1jF2MXBxCArsZJV68OMcK4XxilHi/YB0zhPOZUaJ/ywZ2mJZnrZ1QLbsYJZZdnsIE
 4XQySSzsOssMUsUmYCQx++0bRhBbREBS4nfXabA4M8iSb3N1uhg5OISBavrulYKEWQRUJTat
 WQxWwitgKzFp2RZmiGXyEqs3HACzOQXsJC6v7gI7T0LgGrvEo48HWCCKXCQWz13BBGELS7w6
 vgXqUimJl/1tQDY7kF0tcbgIorWDUeLY5Q1sECX2Ev+eTWMEOYdZQFNi/S59iLCsxNRT65gg
 LuaT6P39BGo6r8SOeTC2msSCW9+hNslIzPxzmxVkjISAh8TSW/GQEJnIKDG16TLbBEa5WQgb
 FjAyrmKUTC0ozk1PLTYtMM5LLdcrTswtLs1L10vOz93ECE4VWt47GB89+KB3iJGJg/EQowQH
 s5II7+H64wlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeZeyH0oQEkhPLEnNTk0tSC2CyTJxcEo1
 MG1d0a3yZzar/jkPTRd+mdPty/q/T+EN3iWTnlvKnLCf/f56o2eLXyw6cG/LjpcMF45rHem5
 ZFSlbZ/x69hZl+5Jf6onZ2xqDjtZ8dNdhrWw4eruQ5aX58tHuz2dnBgzWYXvw9P14ev8Ir/K
 bl0vPd3VxO2PtqLj1TOF2w5OYUrLNk1YWXuY5eZS34syWV2lGYy3hLivL5K3Y01IVPEJ/xr7
 rfBD3Pr/zrecftV7uR/p6Hbe/urLkg1Vh7b+vTnD4MAX40PFykFeh2/8uaJ5YP/0qnyhPVZ6
 y3MbODQY0trWTvazORM3t0Ht5M3EaRJ+n+dy5teoe31hWJ7yckfC5D192i8+KYis5lxy9qOz
 kYISS3FGoqEWc1FxIgBkWqjBhAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsWy7bCSvO6bluMJBo2nRC1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowFE04wFbSwV2xueMbWwHiCtYuRk0NC
 wETiWWsnI4gtJLCDUWL+QgGIuIzEr1NTmSFsYYmV/56zQ9S0M0m0tmiD2GwCRhKz374B6xUR
 kJT43XUaqJ6Lg1ngKKPE5fbJLF2MHBzCQEV990pBalgEVCU2rVkMNpNXwFZi0rItUPPlJVZv
 OABmcwrYSVxe3cUK0ioEVPPlANcERr4FjAyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNz
 NzGCg1FLawfjnlUf9A4xMnEwHmKU4GBWEuE9XH88QYg3JbGyKrUoP76oNCe1+BCjNAeLkjjv
 ha6T8UIC6YklqdmpqQWpRTBZJg5OqQamMy/K3jv1Gr1qWmEhmnjAZytXxcRzGk6Zy0KSylg9
 xQUSZzlY3GB6dUzDeetKt9g870VP9Fv9xGYfCV4fNd/j05mZRqysLof3P/m6OrLftUzN4hPP
 kYWeNw+GV3gat2REzd3ytnLFDa+NokEJKSollnWuMYwSXDMVb2jvup5iZ+7pePfZ6oW39oQn
 tDrb/zm1eqrjsit8c54GWGxeqTt7ySyW758en+HoVZ9v5LdRc8MqtgCv/clRF/yYDnp/u3bu
 //GyoF1HA678lXQ2+qjqK5hSZtJUeHWN7uragOfrNDv+m3f6bjnNfPNqwWddN796PofHTDMy
 QtZ1vr9j17u/n0XGe5vaovY97bqv3zxTYinOSDTUYi4qTgQA0z4u+rUCAAA=
X-CMS-MailID: 20210614163348epcas5p45e562850a0c1ec42470279d8fe7dcf35
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210614163348epcas5p45e562850a0c1ec42470279d8fe7dcf35
References: <20210614162927.10515-1-anaidu.gollu@samsung.com>
 <CGME20210614163348epcas5p45e562850a0c1ec42470279d8fe7dcf35@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index d513b022c4..21883e4b3c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -114,7 +114,7 @@
  *   This parameter is only valid together with the `subsys` parameter. If left
  *   at the default value (`false/off`), the namespace will be attached to all
  *   controllers in the NVMe subsystem at boot-up. If set to `true/on`, the
- *   namespace will be be available in the subsystem not not attached to any
+ *   namespace will be available in the subsystem but not attached to any
  *   controllers.
  *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
-- 
2.17.1


