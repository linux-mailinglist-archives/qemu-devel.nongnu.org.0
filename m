Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BA484A5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 15:56:09 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcs7E-0003GU-8N
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 09:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33080)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hcrye-0004Pr-Q5
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 09:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hcrya-0000sA-TY
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 09:47:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39702
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hcryY-0000pE-Sc
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 09:47:10 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HDbTUE113990
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 09:47:08 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t6bj89m1w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 09:47:08 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Mon, 17 Jun 2019 14:47:06 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 14:47:04 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5HDktEo35717558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 13:46:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5400A405B;
 Mon, 17 Jun 2019 13:47:03 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86C51A4057;
 Mon, 17 Jun 2019 13:47:03 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.14.35])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jun 2019 13:47:03 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 17 Jun 2019 15:47:03 +0200
In-Reply-To: <156077918969.433243.1416211899441569578.stgit@bahia.lan>
References: <156077918969.433243.1416211899441569578.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061713-0012-0000-0000-00000329DB04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061713-0013-0000-0000-00002162F2F0
Message-Id: <156077922319.433243.609897156640506891.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=929 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170126
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 6/6] xics/kvm: Add proper rollback to
 xics_kvm_init()
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
Cc: qemu-ppc@nongnu.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make xics_kvm_disconnect() able to undo the changes of a partial execution
of xics_kvm_connect() and use it to perform rollback.

Note that kvmppc_define_rtas_kernel_token(0) never fails, no matter the
RTAS call has been defined or not.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/xics_kvm.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 4bfbe1a84092..51433b19b076 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -421,10 +421,7 @@ int xics_kvm_connect(SpaprMachineState *spapr, Error **errp)
 
 fail:
     error_propagate(errp, local_err);
-    kvmppc_define_rtas_kernel_token(0, "ibm,set-xive");
-    kvmppc_define_rtas_kernel_token(0, "ibm,get-xive");
-    kvmppc_define_rtas_kernel_token(0, "ibm,int-on");
-    kvmppc_define_rtas_kernel_token(0, "ibm,int-off");
+    xics_kvm_disconnect(spapr, NULL);
     return -1;
 }
 
@@ -448,8 +445,10 @@ void xics_kvm_disconnect(SpaprMachineState *spapr, Error **errp)
      * removed from the list of devices of the VM. The VCPU presenters
      * are also detached from the device.
      */
-    close(kernel_xics_fd);
-    kernel_xics_fd = -1;
+    if (kernel_xics_fd != -1) {
+        close(kernel_xics_fd);
+        kernel_xics_fd = -1;
+    }
 
     kvmppc_define_rtas_kernel_token(0, "ibm,set-xive");
     kvmppc_define_rtas_kernel_token(0, "ibm,get-xive");


