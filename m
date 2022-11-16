Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B962C638
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovM3q-0002xP-7b; Wed, 16 Nov 2022 12:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovM3f-0002wa-Aa
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:18:43 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovM3c-0001z2-Az
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:18:43 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116171835euoutp01e752824e3616b05731dcaf3c9d9f19e4~oID6YgMnK1366013660euoutp01U
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 17:18:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116171835euoutp01e752824e3616b05731dcaf3c9d9f19e4~oID6YgMnK1366013660euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668619115;
 bh=G66lbY7SX4vFDMzE1YBxyY+ytfwFgIGmqtwnDv8HqKs=;
 h=From:To:CC:Subject:Date:References:From;
 b=CrFVMSRX/KcxyRKSuGugL4RmmEwblI6JF07LBas/9Tjy4sLeKA6vBxAAFkDvxfsAD
 d3J9Q2KzxgLlEj/D6FyKoX+ItIAzbDN0c7d6k+7k7XLNWO4jGMEGzhdv6vVB0jhbZm
 SrQV3YqJW1My7Tb2753f2KsmxqF5+Ys9LGoRyv4c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221116171834eucas1p21bf92ab78d36da8b28ea920661ae141b~oID6I_jiI2765527655eucas1p2U;
 Wed, 16 Nov 2022 17:18:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 01.1F.09561.A6B15736; Wed, 16
 Nov 2022 17:18:34 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221116171834eucas1p10f3bc2aefd85b60cf4d7b2c7d0b31fd2~oID5do3vi0514605146eucas1p1z;
 Wed, 16 Nov 2022 17:18:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221116171834eusmtrp208b1387d88e5e1c61f6ee1471cb87bbc~oID5dIoS50130801308eusmtrp2j;
 Wed, 16 Nov 2022 17:18:34 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-22-63751b6a9c33
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.3F.09026.A6B15736; Wed, 16
 Nov 2022 17:18:34 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221116171834eusmtip2c95170041658a75f322123f302f5b6c7~oID5T85961174711747eusmtip2F;
 Wed, 16 Nov 2022 17:18:34 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Nov 2022 17:18:33 +0000
From: Joel Granados <j.granados@samsung.com>
To: <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>, <k.jensen@samsung.com>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v3 0/2] Add OCP extended log to nvme QEMU
Date: Wed, 16 Nov 2022 18:14:53 +0100
Message-ID: <20221116171455.3401086-1-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djPc7pZ0qXJBpPuGFnMetfOZnG8dweL
 A5PHk2ubmQIYo7hsUlJzMstSi/TtErgydq/fylpwV7Bi/rzdjA2MD3m7GDk5JARMJP5MXcfS
 xcjFISSwglHi5OYbTBDOF0aJW8caoTKfGSWWPX/PDtPyd00TVNVyRol5V/cwwlUd3LgdqmUz
 o8Typ1sZQVrYBHQkzr+5wwxiiwj4SFx8PZUFxGYW0JK48fkIWI2wgKXEot6PYHEWAVWJaZsm
 gdXzCthKLPs2mRVitbxE2/XpQPUcQL2aEut36UOUCEqcnPkEaqS8RPPW2cwQ5YoSW+Z8h2qt
 lXjwpocZ5DYJgV4OiefTzjNBJFwkfn08C2ULS7w6vgXqTRmJ/zvnQ8WzJXZO2QU1tEBi1smp
 bCA3SAhYS/SdyYEIO0q03P/ADBHmk7jxVhDiHD6JSdumQ4V5JTrahCCq1SR2NG1lnMCoPAvh
 l1lIfpmF5JcFjMyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAlPC6X/HP+1gnPvqo94h
 RiYOxkOMEhzMSiK8+ZNLkoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzss3QShYSSE8sSc1OTS1I
 LYLJMnFwSjUwZcxbLWeVV/31omfYDYPvIvx+KzLOTxddcHdSTlzQNalyu4Wz42LDyiyuP7s9
 2cmeweRi8YRTyaoMDVd+1DfpP3s9fdmiL/2COmZuC24yzC9Ozt/+MHuGxDq7QreJ1Xtcblut
 8F08/5SZ6Ix6t1RGxWPxDleuvr03X++3yfL+p6laS5lVF72Q1ZJnYWTeoHrz0Tmx5JiQeKaX
 WUduPrdXkLoh775cs/BIUqrqjlBGpkMbxM9cMJ6itcrsfOqRqEfKzBdWZJzdVfhEiaU/iH+z
 wIfIf5KTOGXqrlx8UWTtJv449DHD7YJJfC31M+5pHNWR2Z4usL9z67uX6jfcZqiuehKaKzKh
 YYfUz6yzl+b7KbEUZyQaajEXFScCABY/sHV4AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsVy+t/xe7pZ0qXJBkv+sVnMetfOZnG8dweL
 A5PHk2ubmQIYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstS
 i/TtEvQydq/fylpwV7Bi/rzdjA2MD3m7GDk5JARMJP6uaWLqYuTiEBJYyijxfOUKRoiEjMSn
 Kx/ZIWxhiT/Xutggij4yStxc/R/K2cwoMW9tLxNIFZuAjsT5N3eYQWwRAR+Ji6+nsoDYzAJa
 Ejc+HwGbKixgKbGo9yNYnEVAVWLapklg9bwCthLLvk1mhdgmL9F2fTpQPQdQr6bE+l36ECWC
 EidnPoEaKS/RvHU2M0S5osSWOd+hWmslNr1ezzSBUWgWQvcsJN2zkHQvYGRexSiSWlqcm55b
 bKRXnJhbXJqXrpecn7uJERgD24793LKDceWrj3qHGJk4GA8xSnAwK4nw5k8uSRbiTUmsrEot
 yo8vKs1JLT7EaAr0zURmKdHkfGAU5pXEG5oZmBqamFkamFqaGSuJ83oWdCQKCaQnlqRmp6YW
 pBbB9DFxcEo1MBlXZtjqLzrSUXNk31b+eQ/8Xhunz1H5LKZw71ep6q7yxammwg8iJCtv1f+e
 uraie7vLl9l9moufqB5at2T5ydZNKVN37ZlZ4MFzS0060vhH/Y0XMX63utt+Sl+7pZj8If34
 96VaBirWT9lMbqZOWH5dL+qk64kU9bBfMf5OgfGaZXYcX+4tUJVxlmXosWpdWtT/rMv2j6QG
 m26C6ZzHZ5KOf3tUprKW50HkYXUO3X+X05VVAvVPTU6+2bJc/vBrz9RU849nm630rGY9aA3+
 LeI0K5nNLVqj8t+CFv10Yxs57fl2HrsTFcJEX3aIhy24s8xod8GLlJmt+gdCJf7c5jk3V7Qn
 +9JPk6dPTyQkKLEUZyQaajEXFScCABCpYeIKAwAA
X-CMS-MailID: 20221116171834eucas1p10f3bc2aefd85b60cf4d7b2c7d0b31fd2
X-Msg-Generator: CA
X-RootMTR: 20221116171834eucas1p10f3bc2aefd85b60cf4d7b2c7d0b31fd2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221116171834eucas1p10f3bc2aefd85b60cf4d7b2c7d0b31fd2
References: <CGME20221116171834eucas1p10f3bc2aefd85b60cf4d7b2c7d0b31fd2@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The motivation and description are contained in the last patch in this set.
Will copy paste it here for convenience:

    In order to evaluate write amplification factor (WAF) within the storage
    stack it is important to know the number of bytes written to the
    controller. The existing SMART log value of Data Units Written is too
    coarse (given in units of 500 Kb) and so we add the SMART health
    information extended from the OCP specification (given in units of bytes).

    To accommodate different vendor specific specifications like OCP, we add a
    multiplexing function (nvme_vendor_specific_log) which will route to the
    different log functions based on arguments and log ids. We only return the
    OCP extended smart log when the command is 0xC0 and ocp has been turned on
    in the args.

    Though we add the whole nvme smart log extended structure, we only populate
    the physical_media_units_{read,written}, log_page_version and
    log_page_uuid.

V3 changes:
1. Corrected a bunch of checkpatch issues. Since I changed the first patch
   I did not include the reviewed-by.
2. Included some documentation in nvme.rst for the ocp argument
3. Squashed the ocp arg changes into the main patch.
4. Fixed several comments and an open parenthesis
5. Hex values are now in lower case.
6. Change the reserved format to rsvd<BYTEOFFSET>
7. Made sure that NvmeCtrl is the first arg in all the functions.
8. Fixed comment on commit of main patch

V2 changes:
1. I moved the ocp parameter from the namespace to the subsystem as it is
   defined there in the OCP specification
2. I now accumulate statistics from all namespaces and report them back on
   the extended log as per the spec.
3. I removed the default case in the switch in nvme_vendor_specific_log as
   it does not have any special function.

Joel Granados (2):
  nvme: Move adjustment of data_units{read,written}
  nvme: Add physical writes/reads from OCP log

 docs/system/devices/nvme.rst |  7 ++++
 hw/nvme/ctrl.c               | 69 ++++++++++++++++++++++++++++++++----
 hw/nvme/nvme.h               |  1 +
 include/block/nvme.h         | 36 +++++++++++++++++++
 4 files changed, 107 insertions(+), 6 deletions(-)

-- 
2.30.2


