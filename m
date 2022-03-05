Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB44CE45C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:03:56 +0100 (CET)
Received: from localhost ([::1]:34820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSCZ-0006Rz-R3
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:03:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9J-00013F-8g; Sat, 05 Mar 2022 06:00:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9H-00030F-PI; Sat, 05 Mar 2022 06:00:33 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 225AUGiR030092; 
 Sat, 5 Mar 2022 11:00:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em07v4hbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:22 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 225B0MN7020882;
 Sat, 5 Mar 2022 11:00:22 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em07v4hay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:22 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225AroF1024154;
 Sat, 5 Mar 2022 11:00:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3ekyg8rqbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 225B0IHo57409948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32E8AAE04D;
 Sat,  5 Mar 2022 11:00:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6252AE045;
 Sat,  5 Mar 2022 11:00:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  5 Mar 2022 11:00:17 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2EDC72203EC;
 Sat,  5 Mar 2022 12:00:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 01/13] Use long endian options for ppc64
Date: Sat,  5 Mar 2022 11:59:58 +0100
Message-Id: <20220305110010.1283654-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F9THEHHzByUx2d4XtPP3TwrfiGy0R5BW
X-Proofpoint-ORIG-GUID: CaUnjFhkLOdWRXylb1UGhXbCQyb1QVg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1034 spamscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203050057
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Miroslav Rezanina <mrezanin@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

GCC options pairs -mlittle/-mlittle-endian and -mbig/-mbig-endian are
equivalent on ppc64 architecture. However, Clang supports only long
version of the options.

Use longer form in configure to properly support both GCC and Clang
compiler. In addition, fix this issue in tcg test configure.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220131091714.4825-1-mrezanin@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 configure              | 4 ++--
 tests/tcg/configure.sh | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index c56ed53ee365..81618708e46a 100755
--- a/configure
+++ b/configure
@@ -630,10 +630,10 @@ case "$cpu" in
   ppc)
     CPU_CFLAGS=3D"-m32" ;;
   ppc64)
-    CPU_CFLAGS=3D"-m64 -mbig" ;;
+    CPU_CFLAGS=3D"-m64 -mbig-endian" ;;
   ppc64le)
     cpu=3D"ppc64"
-    CPU_CFLAGS=3D"-m64 -mlittle" ;;
+    CPU_CFLAGS=3D"-m64 -mlittle-endian" ;;
=20
   s390)
     CPU_CFLAGS=3D"-m31" ;;
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 0663bd19f4ce..ed4b5ccb1f08 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -64,9 +64,9 @@ fi
 : ${cross_cc_ppc=3D"powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc=3D"-m32"}
 : ${cross_cc_ppc64=3D"powerpc64-linux-gnu-gcc"}
-: ${cross_cc_cflags_ppc64=3D"-m64 -mbig"}
+: ${cross_cc_cflags_ppc64=3D"-m64 -mbig-endian"}
 : ${cross_cc_ppc64le=3D"$cross_cc_ppc64"}
-: ${cross_cc_cflags_ppc64le=3D"-m64 -mlittle"}
+: ${cross_cc_cflags_ppc64le=3D"-m64 -mlittle-endian"}
 : ${cross_cc_riscv64=3D"riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x=3D"s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4=3D"sh4-linux-gnu-gcc"}
--=20
2.34.1


