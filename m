Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE5E1BC3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 15:07:58 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNGMm-0002sA-DC
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 09:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iNGKG-0001Is-KO
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 09:05:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iNGKF-0000KA-8o
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 09:05:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iNGKF-0000Dl-0r
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 09:05:19 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ND4gtr052163
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 09:05:08 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vtprg9r0d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 09:05:07 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <clg@kaod.org>;
 Wed, 23 Oct 2019 14:05:05 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 23 Oct 2019 14:05:02 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9ND4Smd26607952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2019 13:04:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FCE3AE056;
 Wed, 23 Oct 2019 13:05:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35751AE053;
 Wed, 23 Oct 2019 13:05:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Oct 2019 13:05:01 +0000 (GMT)
Received: from yukon.kaod.org.com (sig-9-145-76-221.uk.ibm.com [9.145.76.221])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6ECF1220170;
 Wed, 23 Oct 2019 15:05:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/2] hw/gpio: Fix property accessors of the AST2600 GPIO 1.8V
 model
Date: Wed, 23 Oct 2019 15:04:53 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19102313-0020-0000-0000-0000037D22F8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102313-0021-0000-0000-000021D36492
Message-Id: <20191023130455.1347-1-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=792 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910230134
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id x9ND4gtr052163
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, rashmica.g@gmail.com,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

The property names of AST2600 GPIO 1.8V model are one character bigger
than the names of the other ASPEED GPIO model. This change increases
the string buffer size by one and parses the property name with a
better pattern.

This fixes the QOM test of the ast2600-evb machine under :

  Apple LLVM version 10.0.0 (clang-1000.10.44.4)
  Target: x86_64-apple-darwin17.7.0
  Thread model: posix
  InstalledDir: /Library/Developer/CommandLineTools/usr/bin

And all tests for the AST2600 EVB machine should now pass !

Thanks,

C.

C=C3=A9dric Le Goater (2):
  hw/gpio: Fix property accessors of the AST2600 GPIO 1.8V model
  aspeed: Add an AST2600 eval board

 include/hw/arm/aspeed.h |  1 +
 hw/arm/aspeed.c         | 23 +++++++++++++++++++++++
 hw/gpio/aspeed_gpio.c   |  8 ++++----
 3 files changed, 28 insertions(+), 4 deletions(-)

--=20
2.21.0


