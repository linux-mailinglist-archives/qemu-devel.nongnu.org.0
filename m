Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF3306021
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:49:07 +0100 (CET)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4n46-0005PR-Ac
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1x-0003wb-5E
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:53 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:52912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1q-0001fI-1y
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:52 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFiprX096315;
 Wed, 27 Jan 2021 15:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=18OcVptvRUaJwx5y3FUJapydoSqVf4sshyjrOkDOrNI=;
 b=FuXFl2XU890IvDTXgFdulLKohDoaLsn/KqOpE8omHO7Qf82vLBXSs0fjqaiYWrYs+wqV
 xTmcckPiBSwja19iExDR0c9H2MEwrKYaDr/VWjMa5+332tmHxlvNDzFLgqq8J5B85qbL
 t2RQhU5PWxPg3dkWCexvmTiH1FJ1vMMdIOTgkSmJ0liO8feBUNjPflJzlqiWjhNLwn99
 RsiDIj6RM2S5VqjOZxuOOAES6SEIuZX8wTJmVctUCIJ1hTVpNwOv8jcIS9qNXCYDUANR
 9AVm41r2Dusxv6NQ1QUrls1Wi2JgTHljLRUtEIbBf/b/Hl92WMLwGrTaAwhq5lvjVWIo 2Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 368brkqt0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFj9e0024983;
 Wed, 27 Jan 2021 15:46:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3030.oracle.com with ESMTP id 368wcpdwp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfRtSpsn8qXm/NmgTOoeTVEaDfZ4Fg14iijYmgZGOwQ0xVLet8sSTF8KomU1seg3aY5MnMJv5mIrt8WVp4yDNAJCoVvWCOeWut/wIMGVRw+K9f1jLbX/+nsU/SDNLDRQkrkIbTQWqJq7HRUlCmu3FN6WWMM3nD7whBiiPDnrJ4Mu0ZejT6GYuhjOjDfmIQSgvSosD1m2B3+MAdRo0sEeSfpDr2BYZmng/wopHbNy/DUDJ4Rx2bOsFpMAS8nygXvca071t+nweTyT3YgZKums+f+p87gYh/66rrt7noGcKIKj2LDt4W8cuT2g4R/dZiW+6oSF8lxq0ezsfJprsq9GnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18OcVptvRUaJwx5y3FUJapydoSqVf4sshyjrOkDOrNI=;
 b=P0l8Xo81IvHLmCWRXmqO3kGpn6Tm77UrDkcWA2zUrr+qvp1QYqoxLmEe0QNuRm5acGNT4cng0MUjc2fycjXadA+8bQH6+NpYuXtwl0sWyL0UpEI4vKZpoSeJFhx18FFwY7CQeDAU4l1DFMh6pZ4y7f51Vig6XktdinvPVeUdUKlwRcNAYFVwoWMfFYgUuTAg0NwhYkQt8ujud314gYQGv++cb3PLgSXUQFJy9RCeQJRGyxOjtreBOh0xnD117jvOvE2fcLiVhejHTjdLRUDkgOMLCGwpiEJpPzdD1wI1His6iYMbywRYr+Ia06cBtQtxYEp20Fp7bVgnFA1+rMMeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18OcVptvRUaJwx5y3FUJapydoSqVf4sshyjrOkDOrNI=;
 b=O8MioGdKdCeZANHq+h2S8YofvcEh5RrJNNgPSEC8RWaNqaee/O0AcXfezGVRMtT+72Ey12k3SLRtCbj4dXfXCunOAhC8Cge+P8WujRhDDs1VvlVC9Qb/NW+Tua1K9ysqTINj4RpBigT4mH4Nt87Uz0+91UDYfi8NTbbY0krmW80=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1693.namprd10.prod.outlook.com
 (2603:10b6:301:a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 27 Jan
 2021 15:46:38 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.015; Wed, 27 Jan 2021
 15:46:38 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] Add support for pvpanic pci device
Date: Wed, 27 Jan 2021 16:59:26 +0200
Message-Id: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 MW4PR03CA0340.namprd03.prod.outlook.com (2603:10b6:303:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 15:46:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c099e73b-334b-4d83-e019-08d8c2dabb6e
X-MS-TrafficTypeDiagnostic: MWHPR10MB1693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB16931A8F176CC6D40E4EFD5E88BB9@MWHPR10MB1693.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmUpIcajes3aKnHItgJUXYc4N+fDKeWgeqiahXcQaNhSSXtfjCmIG8CRJM2tVYMilb/Ngw4lyjrKeLdNcQjx7TS9WF54K9cWx+bFZNWptFQRjD+ClC/cQKNTcRaPWdyErQLb76GyEozg9Vn15an3OehiUOAR2yj96bnV+jiO7GLv91r+essooxuabO+BK8REQZaS0i/DcWT59NyRjTGuJTuRlVhr0I+cltf0/XViA9/XAl5XCEET/Ny9RLLCtOHya5Lvu6s5sQyNn8Wa8vJX61OHGqKpExr6w+Qlg4twBbjxFBigqfeOXzrFnNGtpHoBoV7Hq2dz+hf3XBUqnDNf6GwygNoL1TR3wr4MiaZFS0S6FA7IP8REhmzV/Cz7YzZUwIHrHUjOGSM9WyZM8jXZ7qXg9ZfQAXZiC76suOasaG/YT7AjYxAVLQX2fuJ9bzH2F1jGg/J/j0jaSMky0KQlMiZQjgYQ2VgMUKoVofG0swFQhtZEJMrSjQGmpdtrpE8XS8xw4Jnz8cp+Y1Quz186rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(39860400002)(376002)(83380400001)(86362001)(16526019)(186003)(8936002)(478600001)(6916009)(2616005)(44832011)(6506007)(66476007)(5660300002)(66556008)(6512007)(4326008)(2906002)(316002)(26005)(6666004)(36756003)(8676002)(107886003)(52116002)(66946007)(956004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Vj6484tijFJYw7kdCHYqpiOiZG2dlsLipYCZBR7d/OvG4bGJj4AK0aK7itfe?=
 =?us-ascii?Q?izj5HG+fW4HGBx9FMU1LKlcKuYLWyJYA9TN5NsnKzTJpTHgYoeogesCtqvPx?=
 =?us-ascii?Q?blDbsrDL8z/iae6HV6bqnehni8aiBVxcRas66oW8n8lFf6K2Rfbzw8XideY+?=
 =?us-ascii?Q?HhnmDa4LH7r725QFOGbjobpqYebVLzyieCaJ0sut+9HuJRLcennlEE05Alhm?=
 =?us-ascii?Q?DSbSCr8x+YC7yvhPKOb8ChM0y23X48qNmPaNy0OKtW2w+AqtlEEwnBpHaev6?=
 =?us-ascii?Q?B4J+KE5MHzSLgq9mLTd5OLb+jAiEviL26oDw4A520E7i7WznkiaugMj3pCSJ?=
 =?us-ascii?Q?OKzcliSODSk80T6/Q839C/I1rL8apmBPWoUNI5YcQOP3KajO4tyuX3Awp7qL?=
 =?us-ascii?Q?HiWWgjL1XfNqoDhd28b3lbmhLWnJYIRdLP1bSdoQy6QWpQrre02wCZ9if/sn?=
 =?us-ascii?Q?fumgmt+820s5040I12w+WmCN52shNbEUNtGbiXpXhzfkW1EKN9pN80mji3Ni?=
 =?us-ascii?Q?yxtv0uAmjUNxbJgqBAWRLBdvnyEzuegc7fQ82hap13M6DdqmPY+eCPk4ro0V?=
 =?us-ascii?Q?mNCPFrwjR7b/MLUEJhG8bBe3EdWU+cqZSzYLjt5G3Kmevc1qZn8J9aNjV08l?=
 =?us-ascii?Q?ltrJIy8D0EkNDvMQeuuSxLquXbDLyT/N5J7KjLY1Z7MF47fsYYJxMeQSlwAH?=
 =?us-ascii?Q?GqZosIe5gJ4aIY0IPowbDTuwgRhyPekP2lR4WNJLxHVgqqa2jSa7HTcam4oP?=
 =?us-ascii?Q?2sOctHJgb0S5Okmme/Qw1SGycR22r0B0MnEe0uEsqBs65NK/b49uSIYcaX27?=
 =?us-ascii?Q?iPgZB2QURVvU/l5GfqOl3Xk8Hqm1AbIcG+s1EjGgALKZVzUaT9TjCFcvpjsz?=
 =?us-ascii?Q?LEW837Vvd8anZiUNahNhH8z3uD7P7sOyAfkFNwEhvLIkaiORntARN4XVszFm?=
 =?us-ascii?Q?8FDCLGyp9L6EEiqfVeo8yWv21dg1cizFo0Q3hlkn72s/MuVhhtZFqCAMBVQN?=
 =?us-ascii?Q?XzqcC3tNHf61k7svHrgBPs9RGpwtH1YjRlEBkBdBt61SalsmDFoO0xJXxbzZ?=
 =?us-ascii?Q?WXXm8GJC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c099e73b-334b-4d83-e019-08d8c2dabb6e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:46:37.8808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzDTd7AHcQkqNPNGs9h4XUWLWtQYkajCJv3DIemafOovyTqW0jwWvT3Cbcz/3jWdvAI9QkmyqQu/HdWsPk0nYNsMY6OC3Uv5symzoI/iSP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1693
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270085
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 yvugenfi@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds support for pvpanic pci device.

v3:
- patch 1: made pvpanic isa device available only for PC, compile pvpanic-test
  only when isa device is present
- patch 2: fixed device id to 0x0011, used OBJECT_DECLARE_TYPE,
  PVPANIC_PCI_DEVICE, added VMSTATE_PCI_DEVICE, removed INTERFACE_PCIE_DEVICE
- patch 3: fixed documentation
- patch 4: add a qtest for pvpanic-pci

v4:
- added Rb/Ack on patches
- modify test case to include -action parameter that was recently added and also
  to be on par with the pvpanic ISA device testing

v5:
- added subsystem_vendor_id and subsystem_id needed for MS WHQL tests

v6:
- removed subsystem_vendor_id and subsystem_id as they are filed out by default
  if empty
- do not compile pvpanic-pci-test for ppc64 as we our tests do not support that
  platform

Mihai Carabas (4):
  hw/misc/pvpanic: split-out generic and bus dependent code
  hw/misc/pvpanic: add PCI interface support
  pvpanic : update pvpanic spec document
  tests/qtest: add a test case for pvpanic-pci

 docs/specs/pci-ids.txt         |  1 +
 docs/specs/pvpanic.txt         | 13 +++++-
 hw/i386/Kconfig                |  2 +-
 hw/misc/Kconfig                | 12 +++++-
 hw/misc/meson.build            |  4 +-
 hw/misc/pvpanic-isa.c          | 94 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic-pci.c          | 94 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic.c              | 85 +++-----------------------------------
 include/hw/misc/pvpanic.h      | 24 ++++++++++-
 include/hw/pci/pci.h           |  1 +
 tests/qtest/meson.build        |  3 +-
 tests/qtest/pvpanic-pci-test.c | 94 ++++++++++++++++++++++++++++++++++++++++++
 12 files changed, 341 insertions(+), 86 deletions(-)
 create mode 100644 hw/misc/pvpanic-isa.c
 create mode 100644 hw/misc/pvpanic-pci.c
 create mode 100644 tests/qtest/pvpanic-pci-test.c

-- 
1.8.3.1


