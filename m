Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667D627CD8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 14:27:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTmoq-0001Rh-HY
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 08:27:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmorel@linux.ibm.com>) id 1hTmmV-00087M-5B
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:25:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmorel@linux.ibm.com>) id 1hTmmU-0002Qu-4y
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:25:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55746
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pmorel@linux.ibm.com>)
	id 1hTmmT-0002Pu-PB
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:25:10 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4NC9FnS026803
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 08:25:07 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2snsa0pg5v-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 08:25:06 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <pmorel@linux.ibm.com>;
	Thu, 23 May 2019 13:25:04 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 23 May 2019 13:25:02 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4NCP0Pb45809720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 23 May 2019 12:25:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2BB5A4062;
	Thu, 23 May 2019 12:25:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56BACA4054;
	Thu, 23 May 2019 12:25:00 +0000 (GMT)
Received: from morel-ThinkPad-W530.boeblingen.de.ibm.com (unknown
	[9.152.222.40])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2019 12:25:00 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: cohuck@redhat.com
Date: Thu, 23 May 2019 14:24:55 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19052312-0008-0000-0000-000002E9A675
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052312-0009-0000-0000-000022566519
Message-Id: <1558614300-24574-1-git-send-email-pmorel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-23_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=468 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905230087
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v2 0/5] Retrieving zPCI specific info from QEMU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pasic@linux.vnet.ibm.com, mst@redhat.com, qemu-s390x@nongnu.org,
	david@redhat.com, walling@linux.ibm.com, qemu-devel@nongnu.org,
	borntraeger@de.ibm.com, alex.williamson@redhat.com,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement the QEMU part to retrieve ZPCI specific
information from the host.
The Linux part has been posted on a separate patch on the LKML.
  
Subject: [PATCH 0/4] Retrieving zPCI specific info with VFIO
Message-Id: <1557476555-20256-1-git-send-email-pmorel@linux.ibm.com>
  
We use the PCI VFIO interface to retrieve ZPCI specific information
from the host with a ZPCI specific device region.
 
The retrieval is done only once per function and function group
during the plugging of the device.
The guest's requests are filled with shadow values we keep for
the duration of the device remains plugged.

Still there are some values we need to virtualize, like
the UID and FID of the zPCI function, and we currently
only allow the refresh bit for the zPCI group flags.

Note that we export the CLP specific definitions in a dedicated
file for clarity.


Pierre Morel (5):
  vfio: vfio_iommu_type1: linux header place holder
  s390: PCI: Creation a header dedicated to PCI CLP
  s390: vfio_pci: Use a PCI Group structure
  s390: vfio_pci: Use a PCI Function structure
  s390: vfio_pci: Get zPCI function info from host

 hw/s390x/s390-pci-bus.c         | 144 +++++++++++++++++++++++++--
 hw/s390x/s390-pci-bus.h         |  15 ++-
 hw/s390x/s390-pci-clp.h         | 211 ++++++++++++++++++++++++++++++++++++++++
 hw/s390x/s390-pci-inst.c        |  28 +++---
 hw/s390x/s390-pci-inst.h        | 196 -------------------------------------
 linux-headers/linux/vfio.h      |  14 ++-
 linux-headers/linux/vfio_zdev.h |  34 +++++++
 7 files changed, 422 insertions(+), 220 deletions(-)
 create mode 100644 hw/s390x/s390-pci-clp.h
 create mode 100644 linux-headers/linux/vfio_zdev.h

-- 
2.7.4


