Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C007CDD8A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 10:44:40 +0200 (CEST)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHOdD-0005qP-5H
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 04:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iHOaX-0003gp-Tb
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iHOaV-0003zs-Gs
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:41:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2012
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iHOa4-0003mf-8j
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:41:51 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x978d8EF029800
 for <qemu-devel@nongnu.org>; Mon, 7 Oct 2019 04:41:14 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vg1h9913x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 04:41:14 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <clg@kaod.org>;
 Mon, 7 Oct 2019 09:41:12 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 7 Oct 2019 09:41:10 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x978f9QW54722738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Oct 2019 08:41:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4628FA4054;
 Mon,  7 Oct 2019 08:41:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F6A3A4062;
 Mon,  7 Oct 2019 08:41:09 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Oct 2019 08:41:09 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-169-184.de.ibm.com
 [9.145.169.184])
 by smtp.tls.ibm.com (Postfix) with ESMTP id 6CC1E22006B;
 Mon,  7 Oct 2019 10:41:08 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/9] ppc/pnv: XIVE cleanup and fixes
Date: Mon,  7 Oct 2019 10:40:53 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19100708-0012-0000-0000-00000354C27F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100708-0013-0000-0000-0000218FD254
Message-Id: <20191007084102.29776-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-07_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=364 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910070090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id x978d8EF029800
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Here is a short series adding the cleanups and fixes of the bigger
series "ppc/pnv: add XIVE support for KVM guests". There is still some
rework to be done on the XivePresenter before it can be resent.

These are valuable changes which can come first and which should not
impact the work yet to come. Comments have been addressed. They were
mostly on the changelog.

Thanks,

C.

C=C3=A9dric Le Goater (9):
  ppc/pnv: Improve trigger data definition
  ppc/pnv: Use address_space_stq_be() when triggering an interrupt from
    PSI
  ppc/xive: Record the IPB in the associated NVT
  ppc/xive: Introduce helpers for the NVT id
  ppc/pnv: Remove pnv_xive_vst_size() routine
  ppc/pnv: Dump the XIVE NVT table
  ppc/pnv: Quiesce some XIVE errors
  ppc/xive: Introduce OS CAM line helpers
  ppc/xive: Check V bit in TM_PULL_POOL_CTX

 include/hw/ppc/xive.h      |   5 --
 include/hw/ppc/xive_regs.h |  50 ++++++++++-
 hw/intc/pnv_xive.c         | 166 +++++++++++++++++++++----------------
 hw/intc/xive.c             |  61 ++++++++++++--
 hw/ppc/pnv_psi.c           |  15 +++-
 5 files changed, 206 insertions(+), 91 deletions(-)

--=20
2.21.0


