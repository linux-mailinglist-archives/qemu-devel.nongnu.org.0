Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A8181DD0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:28:47 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC4Du-0007QF-LZ
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jC4Cl-00061q-Ik
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:27:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jC4Ck-0004vy-El
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:27:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36474)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jC4Ck-0004vl-7X
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:27:34 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BGLJEM180646
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 12:27:33 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yq0hbr92f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 12:27:32 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Wed, 11 Mar 2020 16:27:30 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 16:27:27 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02BGRQn027263068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 16:27:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8C99AE051;
 Wed, 11 Mar 2020 16:27:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8E80AE04D;
 Wed, 11 Mar 2020 16:27:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 11 Mar 2020 16:27:26 +0000 (GMT)
Received: from bahia.ibmuc.com (sig-9-145-41-106.uk.ibm.com [9.145.41.106])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 184B62200CC;
 Wed, 11 Mar 2020 17:27:26 +0100 (CET)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] 9p patches 2020-03-10
Date: Wed, 11 Mar 2020 17:27:21 +0100
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20031116-0020-0000-0000-000003B2CF24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031116-0021-0000-0000-0000220B1FFE
Message-Id: <20200311162722.1846432-1-groug@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_07:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1034 suspectscore=0 spamscore=0
 mlxlogscore=848 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7f368aed672117980f7f09933e1eb3e1139caa=
e6:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-hmp-20200309' =
into staging (2020-03-09 19:49:53 +0000)

are available in the Git repository at:

  https://github.com/gkurz/qemu.git tags/9p-next-2020-03-10

for you to fetch changes up to 659f1953281bcfa5ac217e42877d7d3c32eeea38:

  9p/proxy: Fix export_flags (2020-03-10 16:12:49 +0100)

----------------------------------------------------------------
Fix the proxy fsdev so that it honours "readonly" and "writeout".

----------------------------------------------------------------
Greg Kurz (1):
      9p/proxy: Fix export_flags

 hw/9pfs/9p-proxy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
--=20
2.21.1


