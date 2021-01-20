Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92F2FCF18
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:23:03 +0100 (CET)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BZm-0004an-HR
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BXv-0002xH-Ts
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:21:08 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BXt-0002Gi-63
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:21:07 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBGKSF004906;
 Wed, 20 Jan 2021 11:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=NYOXBhR1Z0mlxAGMm674p3Hrq3mMh+bWGbulPFeQNp8=;
 b=Y0jvZ7wHYqXATh5RbhcSMM/X4M6vtz2OM0SuhlLZJjqv0vdwh20RrWxcv3IXRdnjfumT
 z3sGYpfpY7hqH7bY/MTHfGCyDRQEVjuauOcIq/iLuEbtJBE6DWlKcqboW8MMV5Jj4mAi
 9h4UleO/myp2OzMpOfqJ9C2fL9j0SH8pBFXn1kRgzcu/raNuU/U/K2KJbXb+QQvcY7xX
 WvXcuXhb/TyLTZDAOaATHFEHWP3yhhttN2yMtWo/9ZUZRmSFAesPw1wffSaTQ+MnbrcG
 Oaq6lICHDlDyGZIAKn2oDTeC/4E90A7Wa1bCx3TrfE7xZyK6nfMzTraigdfAJnwELEom 6Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 3668qa9yy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:21:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBEl79010918;
 Wed, 20 Jan 2021 11:19:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3020.oracle.com with ESMTP id 3668qw0cqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7swlwZmgQTjktfrtgCZ0mHydUSDwUWm5HYzNJFw8K3+ThjmMj8UCXL/n+yvxFF3J290aiwYL2rTDJ3el863zH28GJzDHNbcyymMjx/Q77f2m6oIz9q7wTJxFpBRnlcMhd1sUkdMwqN60aRY6maUvnv6WU0ICU3rZsxCDofd+gfLt4CWyKQbzg2/mxLWowLaB5Q2qARZbWOhPBZ/Gcc+ue9k2OLY2aA5u4hvtvngPjFAsUXWTBtMyoNFWA7ggbp3KBF4ulcb1rF5++20f35YuX8Qn+FBkpev/udKrP1invuCMbwxUZWNPzxPICZ2xctMtHxmIKMQt6Mxr1tSLhA/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYOXBhR1Z0mlxAGMm674p3Hrq3mMh+bWGbulPFeQNp8=;
 b=OQfkX+wRtHfuwh0mp0toMoz1aft4s4Sux5h3CuSK15R2KRr7KVh+nIh78yd43CUNy9E5neOReye4tXvHR2GfrV2iOV60ZXvIr0VG7ihBzz+hwwXYsmBn3+e4x45RhjqHDs//7lPsLbUGlx3cxvzZgPwjaTT5xRIxp5VDCpfU/Gbn62EgPmSyZRHlPMFjsuqd/Qqd84VqX+ZMDZu2DMXSsvfhDwzwBW3MqDe0A/UXrZSo/VtHgAb36TC1ZmV16AIOi1LUfwkwMlWeL6Ox1JMdkB7yPEgiN7EFaGYAPLmR+oc4n91qugtsXq9IKitjMmQueueaEiKTmlsTvjsJG5NxRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYOXBhR1Z0mlxAGMm674p3Hrq3mMh+bWGbulPFeQNp8=;
 b=vkVF5d+VkXe+95yvOvQMDNybw0pXhAwTQT5rLiaY0HyXF7mzKYaZrm3jTg40nRqXstLA/Xv0FIb7edjELJ/UB9Y7pOMeRvXIcFTjq922vE3A4C5DGjoVGIXzX04ypT1q9pXVIIyhrcXAHQ1PwIMfs+8vi8AzAXZzC+jNAlF2Osw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1342.namprd10.prod.outlook.com
 (2603:10b6:300:1f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 11:18:59 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 11:18:59 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] Add support for pvpanic pci device
Date: Wed, 20 Jan 2021 12:31:53 +0200
Message-Id: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SN6PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:805:ca::39) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SN6PR16CA0062.namprd16.prod.outlook.com (2603:10b6:805:ca::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 11:18:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67088c46-90e3-4079-3f1d-08d8bd352ebe
X-MS-TrafficTypeDiagnostic: MWHPR10MB1342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB13428FF5390DB3D08EE7474388A29@MWHPR10MB1342.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOM3U7kGnl7w9Ea/B/Wh7tr/LH7BIx7CMmHgIvs/1QAwUVHmzvFrbHGsuvPX8XZrX+G/4WpOCCrgDOHWR6jVfQY7v5ViIETwmlePap2q5qRoUoicwmaSxY/vJwo+zhq7DYC+i7UKKDWuGWVfjOUhjYqLpj5E4HTd8wBFqBJGjtpivUUHmnb1V6a46lOTQbHwXG9072OiEXTzFB0INHNk2eW+PMGE4+rqMdGY3lBbFy4rdFOVLMhrOE1fTSVH3HTEK+uYxCCu+y88IyCptlpacb9tKRTQx7jEalpXCC4J1kNpzRgtiCX+q/70GcqYgaWL91f8xpm9a+TEpYyyQbodpXGxi1SDiAfDlDCcbtzJXZnmG6sygkdNLU15W7dJLsFwKC1Kd9uaQkPLHn+AhzamDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(366004)(136003)(376002)(6486002)(16526019)(6666004)(8676002)(36756003)(2906002)(86362001)(83380400001)(107886003)(6506007)(6916009)(316002)(8936002)(5660300002)(956004)(52116002)(66946007)(44832011)(478600001)(2616005)(6512007)(66556008)(4326008)(186003)(66476007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mGY/jYwe5iQqQVnEa5ly99FznjfXj04Eom4LgCZSZU/duAdlOF7k5Y3H9xIl?=
 =?us-ascii?Q?F5T38QaDvUcLwheRFy9lndLguXQkvE55idUF4d3qAODrnayNg6m1K320S4bR?=
 =?us-ascii?Q?0V+tJluzsh9n1kjhpBdwWZSxtUPZk6iXTUspy726q6H7GC//Dxup0RTpSy9R?=
 =?us-ascii?Q?3iBEouej7R9couLqTCaDs6vaa+/+aI3N9ik90UXGbcthvskV1xzIK/MBtPEY?=
 =?us-ascii?Q?p1VNqtDDsCS98wV2XZJR7XjSU9U6myjOvbBM9CrtzpsMM/hnulT+pqJ6cJ2D?=
 =?us-ascii?Q?2vxD6w+TlrxdZ1Hymu5ogKElZrCgYP8Ra3mLQCvXCRQQr1ZXTWDygZy6Vw13?=
 =?us-ascii?Q?8a8MzcSaXGkxWeZQI1IUWDuwUz3B6L8w5GX501E9nGwC1q5rB1S7LSDVlSrv?=
 =?us-ascii?Q?lxJVESEVdgyxmc6Nl6Mpj6e83w/1dS63tz1XbwihLrocLCMp1a/xoX5HHcZV?=
 =?us-ascii?Q?20UIyThDCokIYZB62qD6lOmKSAHgPplE6DPYBvza24zfTsEURLjBWqTg97BW?=
 =?us-ascii?Q?oIlryPLOl+xCgidHDxxpGTRlVVgyOy2q6auLqZ1FhkxjuRBW92omV3Vl3226?=
 =?us-ascii?Q?NQOpfIF1WmXxOsBwXJc/PJO9fX3fCHWhDSSrevkVoMOxXerr1/9ufH+JMlpH?=
 =?us-ascii?Q?iju38F7Ji3rStlNcwUTlcO/khPGuON2atQ3YygT/Y8R5aDobV4qblZ387HPk?=
 =?us-ascii?Q?CEkFo0kxBCJ3Z47F3xvQxXja8RjTcwDezJaqdDBh3P+UhhsYN1A6sFe8Q5r0?=
 =?us-ascii?Q?RtwEvMgmFh4GLeji40pgcv/H784XEIOrPDGsiILnmbqiaqYUBObytpqPaxDq?=
 =?us-ascii?Q?LaZ+hQ5gYSqFA2+3BvSjDbkgWkpwIX8YYjx2OIHxD6pdPpncsYqJeoWuTFNJ?=
 =?us-ascii?Q?INgoDWD57AvK3boBzUAnEE/uesdjaKdysyNCEcoytzR54jiFJeEAKl8Lxy/G?=
 =?us-ascii?Q?MnV6BOj+QnDZi44zJ/Ev0LQ9l2YSzSu3z54dkeBVBGIIk9U8jmmQhC7PSPwg?=
 =?us-ascii?Q?d5gV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67088c46-90e3-4079-3f1d-08d8bd352ebe
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 11:18:59.0220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7cdLaEnquWvX/ih3JM0ECUUuuvwgJUh2XeoRldrWiVrSZ4Cy7d9hFpQTPzQ95lEJMNbymuc3a7iWhZ9iYQWFl++rr2hTIRJJ70RZjCpLB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1342
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200066
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
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
 kraxel@redhat.com
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


