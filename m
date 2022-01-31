Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527054A4675
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:58:54 +0100 (CET)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVKf-0003nn-CZ
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ2-0006BI-57; Mon, 31 Jan 2022 06:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00053s-9O; Mon, 31 Jan 2022 06:09:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VAW5JZ002768; 
 Mon, 31 Jan 2022 11:08:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxe3prns4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:27 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VB7074032403;
 Mon, 31 Jan 2022 11:08:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxe3prnre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2BoR006677;
 Mon, 31 Jan 2022 11:08:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3dvw79afw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VB8Mqv44892422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28B1CAE058;
 Mon, 31 Jan 2022 11:08:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9625AE051;
 Mon, 31 Jan 2022 11:08:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id ED4692201C1;
 Mon, 31 Jan 2022 12:08:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 09/41] spapr.c: check bus != NULL in spapr_get_fw_dev_path()
Date: Mon, 31 Jan 2022 12:07:39 +0100
Message-Id: <20220131110811.619053-10-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n-yBrLazQJAcKC2nYP3CF8vfDdPxoXVq
X-Proofpoint-ORIG-GUID: C48WjND4Nw9L4sxJays9Y3hzF0-72ya_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1034
 priorityscore=1501 mlxlogscore=588 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

spapr_get_fw_dev_path() is an impl of
FWPathProviderClass::get_dev_path(). This interface is used by
hw/core/qdev-fw.c via fw_path_provider_try_get_dev_path() in two
functions:

- static char *qdev_get_fw_dev_path_from_handler(), which is used only in
qdev_get_fw_dev_path_helper() and it's guarded by "if (dev &&
dev->parent_bus)";

- char *qdev_get_own_fw_dev_path_from_handler(), which is used in
softmmu/bootdevice.c in get_boot_device_path() like this:

    if (dev) {
        d =3D qdev_get_own_fw_dev_path_from_handler(dev->parent_bus, dev)=
;

This means that, when called via softmmu/bootdevice.c, there's no check
of 'dev->parent_bus' being not NULL. The result is that the "BusState
*bus" arg of spapr_get_fw_dev_path() can potentially be NULL and if, at
the same time, "SCSIDevice *d" is not NULL, we'll hit this line:

    void *spapr =3D CAST(void, bus->parent, "spapr-vscsi");

And we'll SIGINT because 'bus' is NULL and we're accessing bus->parent.

Adding a simple 'bus !=3D NULL' check to guard the instances where we
access 'bus->parent' can avoid this altogether.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220121213852.30243-1-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 72f5dce751ee..3d6ec309dd21 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3053,7 +3053,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *=
p, BusState *bus,
     VHostSCSICommon *vsc =3D CAST(VHostSCSICommon, dev, TYPE_VHOST_SCSI_=
COMMON);
     PCIDevice *pcidev =3D CAST(PCIDevice, dev, TYPE_PCI_DEVICE);
=20
-    if (d) {
+    if (d && bus) {
         void *spapr =3D CAST(void, bus->parent, "spapr-vscsi");
         VirtIOSCSI *virtio =3D CAST(VirtIOSCSI, bus->parent, TYPE_VIRTIO=
_SCSI);
         USBDevice *usb =3D CAST(USBDevice, bus->parent, TYPE_USB_DEVICE)=
;
--=20
2.34.1


