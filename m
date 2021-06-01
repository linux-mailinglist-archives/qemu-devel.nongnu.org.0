Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68600397682
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:24:59 +0200 (CEST)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6GI-0002gb-Fl
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo60t-0008VW-QO
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:04 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:62051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo60l-0007jB-V7
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:03 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210601150848epoutp0304a05e909222513ca8c8d2c79725e6a3~Efdct1iTI2403524035epoutp034
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 15:08:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210601150848epoutp0304a05e909222513ca8c8d2c79725e6a3~Efdct1iTI2403524035epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1622560128;
 bh=JWB+s20z1trhETcxanE4eIPwqFS0SRQjqMsoAG50dfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MRAwM3z1dD80fpzYbY7aJ5mYRl//KFPLt+hfpiz8PcBIVroQ+VtDn+doEq+/WeHBj
 gtlch5685eDPjCdE6IkErfLnM5PyrPslWGZ7+P3XdUd9kdRvvEh1yXcWbFkH0KTHvk
 vqAPdaknmN19LDM7NWcWFR0iVybfD4Cd2WSRbSjA=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210601150848epcas5p2d492799f8192dfe4371daaab11ebb1e6~EfdcDbdU51416814168epcas5p2d;
 Tue,  1 Jun 2021 15:08:48 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.7A.09697.08D46B06; Wed,  2 Jun 2021 00:08:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210601150646epcas5p338004eb387e8e9a104b9d2212c694130~Efbq3gRAD1025210252epcas5p3J;
 Tue,  1 Jun 2021 15:06:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210601150646epsmtrp1ff7e9348d66cfbf30d617de10817d5ed~Efbq2M6tW1279312793epsmtrp1P;
 Tue,  1 Jun 2021 15:06:46 +0000 (GMT)
X-AuditID: b6c32a4a-64fff700000025e1-d7-60b64d809d9a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2C.F6.08637.60D46B06; Wed,  2 Jun 2021 00:06:46 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210601150645epsmtip2995a1417067b7e01faad15eefa5a3d40~EfbpcdJu52427724277epsmtip2K;
 Tue,  1 Jun 2021 15:06:45 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/nvme: documentation fix
Date: Tue,  1 Jun 2021 20:32:26 +0530
Message-Id: <20210601150226.5558-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601150226.5558-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7bCmpm6D77YEg6lr2C1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErozZ13kLGtgrene3sDUwHmXtYuTkkBAw
 kXh3ZjVbFyMXh5DAbkaJ/0cWM0I4nxgl5l74zQrhfGOUWD/9HztMy4VJC6Ba9jJKfPn9hx3C
 6WSSePl+AiNIFZuAkcTst2/AbBEBSYnfXaeZQWxmkCXf5up0MXJwCAPVHHscAxJmEVCVOLGp
 H6ycV8BG4uixC8wQy+QlVm84AGZzCthKbFi8Huw8CYFb7BKvfl5mBZkjIeAi0fDCFaJeWOLV
 8S1Qh0pJvOxvA7LZgexqicNFEJ0djBLHLm9ggyixl/j3bBojyBRmAU2J9bv0IcKyElNPrWOC
 OJhPovf3EyaIOK/EjnkwtprEglvfoTbJSMz8cxsaoh4SWy/uhIbbBEaJ5ZMms0xglJuFsGIB
 I+MqRsnUguLc9NRi0wKjvNRyveLE3OLSvHS95PzcTYzgRKHltYPx4YMPeocYmTgYDzFKcDAr
 ifC6521NEOJNSaysSi3Kjy8qzUktPsQozcGiJM674uHkBCGB9MSS1OzU1ILUIpgsEwenVANT
 NrdQbUo7S9XaY1z3vGxPFpdZh60+FVN7qP/IvYORCgmbCya9dhW32B60vvK5wreG0t9SF4J9
 zZmOsSjef+K1smTio1VRLeeVe9UbVLaeiWi2KNRKPf3zut+XLVveM20tWa+6S6nvZ93mY+v9
 v/kKrGconvDMV2ORhV2Nll/vUZdm3sMbtJg5JftWV/y4LCAveLxVZKLIg0TlDbsaysry7i4+
 e0H+19rYQnnmtXwf7WbmllZZsQWE+2Vcabu/2OlQmbnbPH59pT/rV356sSxhDkPPzs+sqob9
 fBOPrD/4w8FhZeqGPbmWPteXxN/LUGHR4OdfPyM/s+ue++K/qyx/XF6for1GKysqnVu1fY0S
 S3FGoqEWc1FxIgANtceFgwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWy7bCSvC6b77YEgzkNshavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bs67wFDewVvbtb2BoYj7J2MXJySAiY
 SFyYtICti5GLQ0hgN6PEk4/v2CASMhK/Tk1lhrCFJVb+e84OUdTOJHHu7nGwBJuAkcTst28Y
 QWwRAUmJ312nmUGKmAWOMkpcbp/M0sXIwSEMVHTscQxIDYuAqsSJTf1g9bwCNhJHj12AWiAv
 sXrDATCbU8BWYsPi9YwgrUJANbt28E9g5FvAyLCKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10v
 OT93EyM4HLU0dzBuX/VB7xAjEwfjIUYJDmYlEV73vK0JQrwpiZVVqUX58UWlOanFhxilOViU
 xHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTBNm72/jCE+rvZqHGN/j/ibzWtV7YrfJrzd8HmT
 wj8R8V3Oc+r3b/qbum93WQmn49IlhzOiGM0TFn8+1B4qpRtZaLqz+EtA1MlLs9m8m2Ma2e8d
 1Qor457Y3bZVn60t7P2sYAexl5HvT82yVXnQcZWvMdBup9SMI5fseReI3wrgv7130zUG5ue/
 FR7ICH95IcO+b8O2V3w/4hLXSGvsUUzdOrMn6eCKTe8lGK9qsuxSs3lTwj+l68auj+oPfmyw
 F2jXO8fz+LeA6LPNxcKuojfmHmc/XxK49eLPcqOHpqzb7n14EKQ1uXXG78MK15juikmlK2r/
 bf+yqXSOPasUj+XmbUdjZ6+9sTn2sfsd/W/BSizFGYmGWsxFxYkA+p6rULYCAAA=
X-CMS-MailID: 20210601150646epcas5p338004eb387e8e9a104b9d2212c694130
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210601150646epcas5p338004eb387e8e9a104b9d2212c694130
References: <20210601150226.5558-1-anaidu.gollu@samsung.com>
 <CGME20210601150646epcas5p338004eb387e8e9a104b9d2212c694130@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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


