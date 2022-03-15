Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9DE4D94BC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:42:50 +0100 (CET)
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0tN-0005tD-TU
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:42:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0og-0002Ae-Oi; Tue, 15 Mar 2022 02:38:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34912
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0od-0007px-IV; Tue, 15 Mar 2022 02:37:57 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F4mO5a005391; 
 Tue, 15 Mar 2022 06:37:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3etm3g1tr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:46 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22F6VAu3030375;
 Tue, 15 Mar 2022 06:37:46 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3etm3g1tq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6XC9m006783;
 Tue, 15 Mar 2022 06:37:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3erk58mybd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22F6bfSF24707436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:37:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB305AE0A5;
 Tue, 15 Mar 2022 06:37:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9E9BAE07F;
 Tue, 15 Mar 2022 06:37:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EC353220383;
 Tue, 15 Mar 2022 07:37:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 02/20] qtest/meson.build: check CONFIG_TCG for boot-serial-test
 in qtests_ppc
Date: Tue, 15 Mar 2022 07:37:18 +0100
Message-Id: <20220315063736.592808-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
References: <20220315063736.592808-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oe3H931_wAG5Mdg0fpd1d_5BLN82ai0O
X-Proofpoint-ORIG-GUID: G8zsd2HomFrBznnbkh_7fXf5K8NcQLs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 clxscore=1034
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

'boot-serial-test' does not work with a QEMU built with --disable-tcg in
a IBM POWER9 host. The reason is that without TCG QEMU will default to
KVM acceleration, but then the KVM module in IBM POWER hosts aren't able
to handle other CPUs.

The result is that the test will break with a KVM error when trying to
ruin the ppce500 test:

$ QTEST_QEMU_BINARY=3D./qemu-system-ppc64 ./tests/qtest/boot-serial-test
/ppc64/boot-serial/ppce500: qemu-system-ppc64: -accel tcg: invalid accele=
rator tcg
error: kvm run failed Invalid argument
NIP 0000000000f00000   LR 0000000000000000 CTR 0000000000000000 XER 00000=
00000000000 CPU#0
MSR 0000000000000000 HID0 0000000000000000  HF 24020002 iidx 1 didx 1
TB 00000000 00000000 DECR 0
(...)
** (./tests/qtest/boot-serial-test:1935760): ERROR **: 07:44:03.010: Fail=
ed to find expected string. Please check '/tmp/qtest-boot-serial-sJ78sqg'

Fix it by checking CONFIG_TCG before compiling boot-serial-test.

Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220303153517.168943-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 7b74d3116a9c..d25f82bb5ac0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -161,7 +161,8 @@ qtests_ppc =3D \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'=
] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +=
                     \
   (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) + =
                     \
-  ['boot-order-test', 'boot-serial-test']
+  (config_all_devices.has_key('CONFIG_TCG') ? ['boot-serial-test'] : [])=
 +                   \
+  ['boot-order-test']
=20
 qtests_ppc64 =3D \
   qtests_ppc + \
--=20
2.34.1


