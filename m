Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FCE6386EE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:02:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyVWS-0002NA-7K; Fri, 25 Nov 2022 05:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1oyVWN-0002MH-03
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:01:23 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1oyVWJ-0004N7-FX
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:01:22 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221125095152euoutp0114731a444608db30bf196d6b3f2445ac~qyxcsPtlK0721107211euoutp017
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:51:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221125095152euoutp0114731a444608db30bf196d6b3f2445ac~qyxcsPtlK0721107211euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669369912;
 bh=n72PiHRe8MzdBeQFjK5DLhsTPUgfy4q4zB0YaXkE+bo=;
 h=From:To:CC:Subject:Date:References:From;
 b=pdx/gYx4Mr0gg/ysjQ8+KTzfE/Az/NuVuSoMRQk3CxTfCOOQCu6ENibroxCBi5dQ7
 KU8kYiRLiQrPkfuBrtTGxlAA5d6v8v3OAj5gPeuMKSCOU1EiYNUYPN9sJaNWQ6E4T9
 LPF2IRSfNTJlgeZquBWMWpgaonyfHFqm2dA6DQcA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221125095151eucas1p28e9cf68d7aee9db655e0b6aae6c44820~qyxcbHr2v0873808738eucas1p2W;
 Fri, 25 Nov 2022 09:51:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 15.B8.10112.73090836; Fri, 25
 Nov 2022 09:51:51 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221125095151eucas1p19784fd6ca83c7c3721fdc06e02abc260~qyxcCXXhz2022020220eucas1p1q;
 Fri, 25 Nov 2022 09:51:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221125095151eusmtrp269e23d97e571ff9c4a18d8fd0b619ed9~qyxcB39ky2978629786eusmtrp2R;
 Fri, 25 Nov 2022 09:51:51 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-e9-638090371e14
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C3.92.08916.73090836; Fri, 25
 Nov 2022 09:51:51 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221125095151eusmtip2d4268fda8719473cde03232f0305fc1d~qyxb4jd0F1181311813eusmtip2t;
 Fri, 25 Nov 2022 09:51:51 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Nov 2022 09:51:50 +0000
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v4 0/2] Add OCP extended log to nvme QEMU
Date: Fri, 25 Nov 2022 10:48:06 +0100
Message-ID: <20221125094808.1856024-1-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djP87rmExqSDfY8t7SY9a6dzeJ47w4W
 ByaPJ9c2MwUwRnHZpKTmZJalFunbJXBlbP53jrXgo3jF2ZZP7A2MC4S6GDk5JARMJP43P2Lu
 YuTiEBJYwSgx8fpWNgjnC6PE9+e3mCCcz4wSh47uYoJp+biyGSqxnFFiyd0uhKp/O5ewQDib
 GSU2zdjGDNLCJqAjcf7NHTBbRMBHYsXstWCjmAW0JG58PsIIYgsLWEr8X7qHDcRmEVCV+D/r
 IiuIzStgK3GjfwobxGp5ibbr04HqOYB6NSXW79KHKBGUODnzCQvESHmJ5q2zmSHKFSW2zPnO
 CmHXSpzaAvGOhMBUDontz2+zQyRcJF59P8wIYQtLvDq+BSouI/F/53yol7Mldk7ZBTW0QGLW
 yalsIDdICFhL9J3JgQg7SiyePJ0ZIswnceOtIMQ5fBKTtsGEeSU62qDBriaxo2kr4wRG5VkI
 v8xC8sssJL8sYGRexSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZgSTv87/mUH4/JXH/UO
 MTJxMB5ilOBgVhLhFbFrSBbiTUmsrEotyo8vKs1JLT7EKM3BoiTOyzZDK1lIID2xJDU7NbUg
 tQgmy8TBKdXA5K4QvaSq8YPxjL1di0p3/p/z9O5y5t0XX1+TLXPWPZCwaK3x+wvCsjOWpd1Z
 EfVgX/X0vH0MUd6z9u5ZPaXGoPlk+qI90W5n+/X/7412+MKouiIlZ9KNhNnWV580Pj45SVhP
 um/TxL+sQrLLjx5gzWH893zJQqVS361Pd7+etMrx85+uglMbPlZbJE88uD5p88GrG5Z/1tB9
 8/6lJEfwRx9JcVmZjqBNckuKFWoEH6h0yz/5UxC1wCwq61xTEJe89D/GK/3VLftlDLSXqa5v
 lQx8ZTxRd/e7X7IViyotZ0z5tT/rsdmj9yW7peSO/Ig+deCG+t0pjdeXtQcLHLKRir+5/HZD
 OlPqad1NH17KqMYqsRRnJBpqMRcVJwIAvRLYa3gDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsVy+t/xe7rmExqSDR73KVjMetfOZnG8dweL
 A5PHk2ubmQIYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstS
 i/TtEvQyNv87x1rwUbzibMsn9gbGBUJdjJwcEgImEh9XNjN1MXJxCAksZZSY1vqLBSIhI/Hp
 ykd2CFtY4s+1LjYQW0jgI6PE/09mEA2bGSVObLgN1sAmoCNx/s0dZhBbRMBHYsXstUwgNrOA
 lsSNz0cYQWxhAUuJ/0v3gA1iEVCV+D/rIiuIzStgK3GjfwobxDJ5ibbr04HqOYB6NSXW79KH
 KBGUODnzCQvESHmJ5q2zmSHKFSW2zPnOCmHXSnz++4xxAqPQLITuWUi6ZyHpXsDIvIpRJLW0
 ODc9t9hQrzgxt7g0L10vOT93EyMwArYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4RWxa0gW4k1J
 rKxKLcqPLyrNSS0+xGgK9M1EZinR5HxgDOaVxBuaGZgamphZGphamhkrifN6FnQkCgmkJ5ak
 ZqemFqQWwfQxcXBKNTCZy7IfreFlTV/5uC1/0fXNiyINSt9vN2cJinq7/uqEsk8Fx5w7p8o7
 fT2garTp2SInr9LMW1mqebLNMid+zHdLOsLXq5BZVO/7b/KRHSGhiS9Xla1nmGO1/5Zo3ByB
 l/sUdkx5VHH9bl2kDVuwH8v7Y+uL3tnxsJbFN2oej0qT0F+pIFYhOqV1jpr4rW0LohKDZ52f
 dbPhz96ZMz6x/hXpybM/eT7YJ8Y23sRH9WLqP1dlXeV47x/ST7y+tDib3nhvn/LohUVP4Na5
 wntnmx6/m2C9sbF07awv3ken567oWstzN0dBcVXTEXaRFZ2CPNd/rZ4b6MW9+GpFUPq3jS8v
 qT7mjj0X/26luUwEk7ISS3FGoqEWc1FxIgBoN2yyCQMAAA==
X-CMS-MailID: 20221125095151eucas1p19784fd6ca83c7c3721fdc06e02abc260
X-Msg-Generator: CA
X-RootMTR: 20221125095151eucas1p19784fd6ca83c7c3721fdc06e02abc260
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221125095151eucas1p19784fd6ca83c7c3721fdc06e02abc260
References: <CGME20221125095151eucas1p19784fd6ca83c7c3721fdc06e02abc260@eucas1p1.samsung.com>
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

V4 changes:
1. Fixed cpu_to_le64 instead of cpu_to_le32
2. Variable naming : uuid -> guid
3. Changed how the guid value appears in the code:
   Used to be:
        smart_l.log_page_uuid[0] = 0xA4F2BFEA2810AFC5;
        smart_l.log_page_uuid[1] = 0xAFD514C97C6F4F9C;

   Now is:
        static const uint8_t guid[16] = {
            0xC5, 0xAF, 0x10, 0x28, 0xEA, 0xBF, 0xF2, 0xA4,
            0x9C, 0x4F, 0x6F, 0x7C, 0xC9, 0x14, 0xD5, 0xAF
        };

   This is different from what @klaus suggested because I want to keep it
   consistent to what nvme-cli currently implements. I think here we can
   either change both nvme-cli and this patch or leave the order of the
   bytes as they are here. This all depends on how you interpret the Spec
   (which is ambiguous)

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
 hw/nvme/ctrl.c               | 73 +++++++++++++++++++++++++++++++++---
 hw/nvme/nvme.h               |  1 +
 include/block/nvme.h         | 36 ++++++++++++++++++
 4 files changed, 111 insertions(+), 6 deletions(-)

-- 
2.30.2


