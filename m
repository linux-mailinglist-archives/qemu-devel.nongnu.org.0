Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F0FFC2F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 00:23:00 +0100 (CET)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWTsg-0007yE-UT
	for lists+qemu-devel@lfdr.de; Sun, 17 Nov 2019 18:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iWTqX-0006Qt-9z
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 18:20:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iWTqW-0007Py-Ba
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 18:20:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1956
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iWTqW-0007KP-7b
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 18:20:44 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAHNCQ41003570
 for <qemu-devel@nongnu.org>; Sun, 17 Nov 2019 18:20:35 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2way68wfe0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sun, 17 Nov 2019 18:20:35 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Sun, 17 Nov 2019 23:20:33 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 17 Nov 2019 23:20:31 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAHNKVPt57344144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 17 Nov 2019 23:20:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB7054203F;
 Sun, 17 Nov 2019 23:20:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAF1442041;
 Sun, 17 Nov 2019 23:20:30 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.70.126])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 17 Nov 2019 23:20:30 +0000 (GMT)
Subject: [PATCH for-5.0 0/4] ppc: Some more QOM cleanup for XICS
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 18 Nov 2019 00:20:30 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19111723-0012-0000-0000-000003662F4D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111723-0013-0000-0000-000021A1B25B
Message-Id: <157403283036.409804.13586263493813758117.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-17_05:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1034 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911170222
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
Cc: qemu-ppc@nongnu.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series consolidates some more QOM links and pointers that point to
the same object. While here also simplify the XICS interrupt controller
init in the machine code.

--
Greg

---

Greg Kurz (4):
      xics: Link ICS_PROP_XICS property to ICSState::xics pointer
      xics: Link ICP_PROP_XICS property to ICPState::xics pointer
      xics: Link ICP_PROP_CPU property to ICPState::cs pointer
      spapr: Abort if XICS interrupt controller cannot be initialized


 hw/intc/xics.c     |   54 +++++++++++++++-------------------------------------
 hw/ppc/pnv_psi.c   |    3 +--
 hw/ppc/spapr_irq.c |   22 ++++-----------------
 3 files changed, 21 insertions(+), 58 deletions(-)


