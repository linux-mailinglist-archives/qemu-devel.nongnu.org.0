Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB172F8564
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:28:58 +0100 (CET)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0UmH-0001CT-9C
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Ugm-0005uC-A4
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:23:18 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Ugi-0002pe-CC
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:23:16 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJG7Ul114910;
 Fri, 15 Jan 2021 19:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=lE/N/EgAAFvsPfBUwY70BWLsikKKhYJTk7gku7gNxVo=;
 b=Uz3OkLITbuFbumtk/D79lNwhsFnLptalRqjuFx1xgkbNpvsIoyBDujAvp4QgCXkSP+CV
 dp03CISjxWs2cY/uahr9YVEOsCk72BwGuKnPWI/dVJmLViOxikUpK8MaVzIp9LItvlFk
 79QzUKLpaJvOOXmgE6p6nyLedtFc3N+XTofRs4UotpMCOA92C4iqGGFSzxMxaU2z2kxM
 GHlEOIkd6/tPoG3lVMyRVM0BW+sUoAwFgEVvLcDJ78FIuJwFWHC8GHm6JntF5DscvQFh
 ZeSk6PzsjyrUpgt2IJkr+S0CdJyzADp3NugY4KYt3tHu1zGw4YEgNBWLi5Vdb+NWVO35 sQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 360kvkec6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:23:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJL472051968;
 Fri, 15 Jan 2021 19:21:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 360keqayr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:21:08 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10FJL68q001531;
 Fri, 15 Jan 2021 19:21:07 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 11:21:06 -0800
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] pvpanic : update pvpanic spec document
Date: Fri, 15 Jan 2021 20:34:05 +0200
Message-Id: <1610735646-13313-4-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150116
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add pvpanic PCI device support details in docs/specs/pvpanic.txt.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 docs/specs/pvpanic.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index a90fbca..974aafd 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,7 +1,7 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
+pvpanic device is a simulated device, through which a guest panic
 event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
@@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
+PCI device.
+
 ISA Interface
 -------------
 
@@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
        the host should record it or report it, but should not affect
        the execution of the guest.
 
+PCI Interface
+-------------
+
+The PCI interface is similar to the ISA interface except that it uses an MMIO
+address space provided by its BAR0, 1 byte long. Any machine with a PCI device
+can enable a pvpanic device by adding '-device pvpanic-pci' to the command
+line.
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1


