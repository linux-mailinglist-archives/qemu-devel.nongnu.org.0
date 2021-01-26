Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448AA3044EF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:20:58 +0100 (CET)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4S1R-0000Bn-BR
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsF-0000qp-2d; Tue, 26 Jan 2021 12:11:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l4RsC-0007Ba-VM; Tue, 26 Jan 2021 12:11:26 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10QH3Xt0126239; Tue, 26 Jan 2021 12:11:06 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36amnnnn3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 12:11:06 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGvkO0004451;
 Tue, 26 Jan 2021 17:11:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 368b2h30cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 17:11:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10QHB2Na36438430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 17:11:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E3B44203F;
 Tue, 26 Jan 2021 17:11:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03D0442042;
 Tue, 26 Jan 2021 17:11:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 26 Jan 2021 17:11:01 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-70-48.uk.ibm.com [9.145.70.48])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DA29622010B;
 Tue, 26 Jan 2021 18:11:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/7] ppc/pnv: Misc cleanups
Date: Tue, 26 Jan 2021 18:10:52 +0100
Message-Id: <20210126171059.307867-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_09:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 mlxlogscore=814 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260088
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Most important changes in this series are a fix for the support for
external BMCs, when a QEMU Aspeed machine is used as a BMC instead of
the simulator, and a cleanup of the LPC model which was handling the
PNOR mapping.

The PNOR mapping is still a problem when using an external BMC and
this would require some kind of framework to do memory ops on a remote
memory region (LPC FW address space). Multi process might be a start
for that using the proxy object. Something to study.

Thanks,

C.

C=C3=A9dric Le Goater (7):
  ppc/pnv: Add trace events for PCI event notification
  ppc/xive: Add firmware bit when dumping the ENDs
  ppc/pnv: Use skiboot addresses to load kernel and ramfs
  ppc/pnv: Simplify pnv_bmc_create()
  ppc/pnv: Discard internal BMC initialization when BMC is external
  ppc/pnv: Remove default disablement of the PNOR contents
  ppc/pnv: Introduce a LPC FW memory region attribute to map the PNOR

 include/hw/ppc/pnv.h       |  1 +
 include/hw/ppc/xive_regs.h |  2 ++
 hw/intc/pnv_xive.c         |  3 +++
 hw/intc/xive.c             |  3 ++-
 hw/pci-host/pnv_phb4.c     |  3 +++
 hw/ppc/pnv.c               | 17 ++++++++++++++---
 hw/ppc/pnv_bmc.c           | 22 +++++++++++++++-------
 hw/ppc/pnv_lpc.c           | 15 ---------------
 hw/intc/trace-events       |  3 +++
 hw/pci-host/trace-events   |  3 +++
 10 files changed, 46 insertions(+), 26 deletions(-)

--=20
2.26.2


