Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B139A4D94D6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:48:52 +0100 (CET)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0zD-0003tU-Gs
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:48:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0og-0002Af-Pb; Tue, 15 Mar 2022 02:38:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0oe-0007q7-OU; Tue, 15 Mar 2022 02:37:58 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F5mOci001889; 
 Tue, 15 Mar 2022 06:37:53 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etmyr8ube-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6XD0f000702;
 Tue, 15 Mar 2022 06:37:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk58wuna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22F6bodS31588684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:37:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3689C11C0CD;
 Tue, 15 Mar 2022 06:37:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2FFC11C440;
 Tue, 15 Mar 2022 06:37:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BADF122008A;
 Tue, 15 Mar 2022 07:37:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/20] ppc fixes for 7.0
Date: Tue, 15 Mar 2022 07:37:16 +0100
Message-Id: <20220315063736.592808-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fd-a7oxVmgzjqDnWW3G6BCZDqTtkXveZ
X-Proofpoint-ORIG-GUID: fd-a7oxVmgzjqDnWW3G6BCZDqTtkXveZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1034 phishscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=849 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1416688c53be6535be755b44c15fb2eb9defd20f:

  Merge remote-tracking branch 'remotes/mcayland/tags/q800-updates-for-7.0-=
20220309' into staging (2022-03-10 13:16:37 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20220314

for you to fetch changes up to 9c10d86fee11d96274ea6f7cda12d2471abe3c47:

  ppc/pnv: Remove user-created PHB{3,4,5} devices (2022-03-14 15:57:17 +010=
0)

----------------------------------------------------------------
ppc-7.0 queue :

* Removal of user-created PHB devices
* Avocado fixes for --disable-tcg
* Instruction and Radix MMU fixes

----------------------------------------------------------------
C=C3=A9dric Le Goater (2):
      ppc/xive2: Make type Xive2EndSource not user creatable
      ppc/pnv: Remove user-created PHB{3,4,5} devices

Daniel Henrique Barboza (14):
      qtest/meson.build: check CONFIG_TCG for prom-env-test in qtests_ppc
      qtest/meson.build: check CONFIG_TCG for boot-serial-test in qtests_ppc
      avocado/boot_linux_console.py: check for tcg in test_ppc_powernv8/9
      avocado/boot_linux_console.py: check tcg accel in test_ppc64_e500
      avocado/replay_kernel.py: make tcg-icount check in run_vm()
      avocado/boot_linux_console.py: check TCG accel in test_ppc_g3beige()
      avocado/boot_linux_console.py: check TCG accel in test_ppc_mac99()
      avocado/ppc_405.py: remove test_ppc_taihu()
      avocado/ppc_405.py: check TCG accel in test_ppc_ref405ep()
      avocado/ppc_74xx.py: check TCG accel for all tests
      avocado/ppc_bamboo.py: check TCG accel in test_ppc_bamboo()
      avocado/ppc_mpc8544ds.py: check TCG accel in test_ppc_mpc8544ds()
      avocado/ppc_prep_40p.py: check TCG accel in all tests
      avocado/ppc_virtex_ml507.py: check TCG accel in test_ppc_virtex_ml507=
()

Frederic Barrat (2):
      ppc/pnv: Introduce a pnv-phb5 device to match root port
      ppc/pnv: Always create the PHB5 PEC devices

Leandro Lupori (1):
      target/ppc: fix ISI fault cause for Radix MMU

Matheus Ferst (1):
      target/ppc: fix xxspltw for big endian hosts

 include/hw/pci-host/pnv_phb4.h      |  5 +++
 include/hw/ppc/pnv.h                |  1 -
 hw/intc/xive2.c                     |  1 +
 hw/pci-host/pnv_phb3.c              | 33 ++----------------
 hw/pci-host/pnv_phb4.c              | 69 ++++++---------------------------=
----
 hw/pci-host/pnv_phb4_pec.c          | 16 ++++-----
 hw/ppc/pnv.c                        | 29 ++--------------
 target/ppc/mmu-radix64.c            |  3 +-
 tests/tcg/ppc64le/xxspltw.c         | 46 +++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc |  2 +-
 tests/avocado/boot_linux_console.py | 17 +++++++++
 tests/avocado/ppc_405.py            | 10 ++----
 tests/avocado/ppc_74xx.py           | 13 +++++++
 tests/avocado/ppc_bamboo.py         |  2 ++
 tests/avocado/ppc_mpc8544ds.py      |  2 ++
 tests/avocado/ppc_prep_40p.py       |  6 ++++
 tests/avocado/ppc_virtex_ml507.py   |  2 ++
 tests/avocado/replay_kernel.py      |  4 +++
 tests/qtest/meson.build             |  4 ++-
 tests/tcg/ppc64/Makefile.target     |  1 +
 tests/tcg/ppc64le/Makefile.target   |  1 +
 21 files changed, 131 insertions(+), 136 deletions(-)
 create mode 100644 tests/tcg/ppc64le/xxspltw.c

