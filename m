Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B1628F1C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujB2-0001V2-8M; Mon, 14 Nov 2022 18:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ouifG-000361-4d
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:55 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ouZv1-00081u-SU
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:54:38 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221114135426euoutp01b44f6da96788c5b9fe44c24efc7f8507~nd-Ggn8xm1806518065euoutp01z
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 13:54:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221114135426euoutp01b44f6da96788c5b9fe44c24efc7f8507~nd-Ggn8xm1806518065euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668434066;
 bh=WGCzzVtP5qdB5iZIleZb21Kph54VqPVDCcgbd2+W4p0=;
 h=From:To:CC:Subject:Date:References:From;
 b=N98FrfwBVP+53DJvlN1BbGM37row8qEzvzaN3rjboAbVYo0g3x3Gm47kk8fCm8RZH
 sD4X6XZ/mBOrzKw4CxaGq3fvpf461Iulebg9Ce5JWZzX1OZacT2vGY95TMdneHc5Z+
 OUtE3C8CWV0CaTnl3qyN3YcBDaxUCLOgt/HKpHeA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221114135426eucas1p2525c4fb6b37bc504c494bfbcb8d10758~nd-GV1OH_2884528845eucas1p2K;
 Mon, 14 Nov 2022 13:54:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0B.28.10112.29842736; Mon, 14
 Nov 2022 13:54:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0~nd-F_WyOh2263122631eucas1p2k;
 Mon, 14 Nov 2022 13:54:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221114135426eusmtrp29de2f42ec3652ecad90519de25129ea8~nd-F9zePx0116501165eusmtrp2z;
 Mon, 14 Nov 2022 13:54:26 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-29-637248925ce8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F5.D3.08916.19842736; Mon, 14
 Nov 2022 13:54:25 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221114135425eusmtip2012c3eb434f6d01972e003f0ab18616f~nd-FxgvCr1823218232eusmtip2I;
 Mon, 14 Nov 2022 13:54:25 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Nov 2022 13:54:24 +0000
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v2 0/3] Add OCP extended log to nvme QEMU
Date: Mon, 14 Nov 2022 14:50:40 +0100
Message-ID: <20221114135043.2958100-1-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7djPc7qTPIqSDX7OFraY9a6dzeJ47w4W
 ByaPJ9c2MwUwRnHZpKTmZJalFunbJXBlNCyYylbwlbdi9pe7LA2ML7i6GDk4JARMJHZN4+5i
 5OIQEljBKPHu70VWCOcLo8TU921MEM5nRonrZ24ydjFygnV0nH0OZgsJLGeUuNYqAVfU/WcH
 I4SzmVFi6+I3YFVsAjoS59/cYQaxRQR8JFbMXssEYjMLaEnc+HwErEZYwFKi5eV1VhCbRUBV
 4tbUW+wgNq+ArcTh3TdYIDbLS7Rdn84IcjezgKbE+l36ECWCEidnPmGBGCkv0bx1NjNEuaLE
 ljnfWSHsWom1x86wg9wmITCRQ+LtghtQCReJVz/nsUPYwhKvjm+BsmUk/u+czwRhZ0vsnLIL
 amiBxKyTU9kgYWct0XcmByLsKPHszztWiDCfxI23ghDn8ElM2jadGSLMK9HRJgRRrSaxo2kr
 4wRG5VkIv8xC8sssJL8sYGRexSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZgOTv87/mUH
 4/JXH/UOMTJxMB5ilOBgVhLhnSeTnyzEm5JYWZValB9fVJqTWnyIUZqDRUmcl22GVrKQQHpi
 SWp2ampBahFMlomDU6qBaYN+QsmqFo/KP5EuM1lua32V12ZU4d6T8vzAaZPyk/pNXZPVWMSS
 tk8X6H7HeoFtb3+YaN/XtTtqw59+P/D+VOJc6WiOjyfv9GZ8fvBUcJGf+ZFdq9muM0v3NNiX
 LloZOb/nj/HeSc9CtnHeTGB+8f/zfYkbX7w+nIn5VZYYsNP9ioSP3V2rXF/vN/X79t22LrU/
 v6hy2fM3X/+3O/VLOdh/4Q6deak17nTxHNbfh3773OdxzD33+VW445w/B2P2i7YnXRHku7Vq
 d8WFRq/MCbwbL9yc5XZhj+St6f5rI1geOUbxCCQ6Vb6dvyzu7764M/+qfuk+klea8O1gqOqh
 RMMdp6+bbT7G0LOx8uGWh2pKLMUZiYZazEXFiQC2olnudgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsVy+t/xe7oTPYqSDf6ft7SY9a6dzeJ47w4W
 ByaPJ9c2MwUwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehlNCyYylbwlbdi9pe7LA2ML7i6GDk5JARMJDrOPmcEsYUEljJKHL0qDhGXkfh05SM7
 hC0s8edaF1sXIxdQzUdGib9Lm6CczYwSDafmglWxCehInH9zhxnEFhHwkVgxey0TiM0soCVx
 4/MRsA3CApYSLS+vs4LYLAKqErem3gLr5RWwlTi8+wYLxDZ5ibbr04HqOYB6NSXW79KHKBGU
 ODnzCQvESHmJ5q2zmSHKFSW2zPnOCmHXSry6v5txAqPQLITuWUi6ZyHpXsDIvIpRJLW0ODc9
 t9hQrzgxt7g0L10vOT93EyMwArYd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4Z0nk58sxJuSWFmV
 WpQfX1Sak1p8iNEU6JuJzFKiyfnAGMwriTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5N
 LUgtgulj4uCUamDyYH3RwWx1hmtX5CEXhkol8dNLpvL7z33574FMf4qZ7NUpETcPLBDjeDlf
 Jd35i6bp7hcH3f1DF/L+uS+ZlCbFfXjzrm3NbJI9RkcXZ2iFvtqyVTVySeNL61U7H188tlLJ
 9Edx2Rt/7/nRCXcSt12PPzR7ydZjgRtZdqdOb1t5qlTeSLhAIOnbgvmn5n54G7jI5q0Dg17Z
 o9jtElVh740lF738tb/rgvKbWxZ3/gUvkMx81Vrw+HVEwCnR3ScaVKos5gUun7tFKH/r4ocN
 562mflII8W8+o/jy9CGVnn1nz7y1123a+k0p3GHdMZbyS5ECkYu57NYERS9s4UtIOyK5bpvF
 kn7LBV5PtOwrGWs+KrEUZyQaajEXFScCAH8a294JAwAA
X-CMS-MailID: 20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0
X-Msg-Generator: CA
X-RootMTR: 20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0
References: <CGME20221114135426eucas1p271a54e44af5a53a45a7393ed34585ee0@eucas1p2.samsung.com>
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
X-Mailman-Approved-At: Mon, 14 Nov 2022 18:47:40 -0500
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

V1 changes:
1. I moved the ocp parameter from the namespace to the subsystem as it is
   defined there in the OCP specification
2. I now accumulate statistics from all namespaces and report them back on
   the extended log as per the spec.
3. I removed the default case in the switch in nvme_vendor_specific_log as
   it does not have any special function.

Joel Granados (3):
  nvme: Move adjustment of data_units{read,written}
  nvme: Add ocp to the subsys
  nvme: Add physical writes/reads from OCP log

 hw/nvme/ctrl.c       | 70 ++++++++++++++++++++++++++++++++++++++++----
 hw/nvme/nvme.h       |  1 +
 hw/nvme/subsys.c     |  4 +--
 include/block/nvme.h | 36 +++++++++++++++++++++++
 4 files changed, 103 insertions(+), 8 deletions(-)

-- 
2.30.2


