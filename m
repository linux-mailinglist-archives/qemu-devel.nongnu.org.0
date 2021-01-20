Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FB2FD103
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:04:36 +0100 (CET)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DA3-0000zG-3Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D6l-0007R5-96
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:01:12 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D6d-0002z7-VD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:01:10 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCxxM3191728;
 Wed, 20 Jan 2021 13:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=dHe6bXHiSyKRCJTEaulZOAvVHeVyfmvUqPE22p/+mYM=;
 b=iiUxNiT08SowVmuFfhDTDzFc0oh2hIJd8KpwRgiE87tRYZ4rPsyxqLocxMI6cAW9RBvj
 GtRdMYNfvIGi2v+dTPkaFq8+h4bJJzB6y/ds135iePKk7W4XzR/EMCi34HYgLZWsCM1g
 Jr4UvSylEGY2FnJn3FBE9cFGXeJOtLPeKJyfOQpEtzQnkI8dkdVh1nNq8uCoSYqjctIi
 dRCpQu0+xcpuRJCN5tJIcviMAWHWprBKMzzjlQJgejVqCihuriI75XJ0ONovCnMtjDQ2
 n9w7RjUlulpcyhCJURpDtliQwFsylofb4NhUxtF20oG+3llIRZ8v7iYCHDIHVv96Z9mb 8g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3668qaab9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 13:00:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCZnKU099518;
 Wed, 20 Jan 2021 12:58:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by aserp3020.oracle.com with ESMTP id 3668rdvpq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkY/8E5qIw3KnEplEkBy7G7znqaRv7t1hnQD+dEiprNKZP9dHWF4nJJDx6UZDhlyTCRyHohJbCsBTh5h4EsC1xr2Zru0mAVGeUidApsP59kkdSVfAyh8eRBF5kBPwyH5NbmW9eyxB1SekF6juDGFUViGiqsPvWLGaZpFd3hg798vnvLQ3J0DP52/AsKckid96VhngRc7MDgG91V0JP58nBDrBVRc3s7zfNvSnXn7fnVGgVoGntG90zLc/vBe3EsXs+XlKU3BLnM2+gvCtwLJQDZjtgSfQjHJl4ZAEbuuY4Pi5HL1+la5rFaXl5AtqaId8h1KrCf4eGBa+rr2GIpUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHe6bXHiSyKRCJTEaulZOAvVHeVyfmvUqPE22p/+mYM=;
 b=NZaSfxTS9TAOkHq0Vmlia374kGGV8Qk6Qd4pXbJD/iX72dkIY5mzWOd+KO0qHCt93tTu3FxJhVO5EVF9PeB/UviZ5Jt93EmgYrFUd+ySGrC4vEUhe85JNhJmN4Ll99VbxQ+DAiGEz5O0kG6WtGMleFsM0UW9kiWfdqE7WOX8R6zpyjuayY4jEA13CwlDYzMXUTKrlGj6dLwWjJGMRO5YbRfLxiRZnI6myu3Vpmbm3fYiO/Du8vOhfJYF3jBZ8RUU08QIBrA4izqUTJZIWCLzo1so5RqrZSvaYlFfXdXqCxOrlvTjLjW9gmJ+4LBBpPhvglv3/e1c1GEk7Hz91gbMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHe6bXHiSyKRCJTEaulZOAvVHeVyfmvUqPE22p/+mYM=;
 b=S5rZzkWshzBWCjo/9aacx98Mf1YC/gnxRtTg7ilweAULcrRvvkLjwj8bNO2RBMqcJMyDOMrpRKzeBwdl04t+F5Hc9b3R8pIiCeAfyBeq23DOYkY/uWAAsUyVZhS5UuEIFivGpS9WPbVxgEjzCr30sa7NV/Ufv8VMPmcIUWm8hgg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by CO1PR10MB4739.namprd10.prod.outlook.com
 (2603:10b6:303:96::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 12:58:55 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 12:58:55 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] Add support for pvpanic pci device
Date: Wed, 20 Jan 2021 14:11:49 +0200
Message-Id: <1611144713-21433-1-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SA9PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:806:a7::31) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SA9PR10CA0026.namprd10.prod.outlook.com (2603:10b6:806:a7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 12:58:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73c6b971-8dc9-4e04-780d-08d8bd4324a9
X-MS-TrafficTypeDiagnostic: CO1PR10MB4739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB473929DFD50FCA563BDB22AA88A29@CO1PR10MB4739.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/pw6UlMBj49S7v8S6Kirww6jJjwtT4jMh2ry4b7APFQ+PvLgsk+1YWAMqPqMhPZyq5vT3OY/s5b1V1NexXYbvBtwTZb2iPeTHqcZmUS8mX7xL8U2fa9JNh1rKH6oK+3JOAtHq5yCB78eVOnRA0Uz+4K4BTecAlwCGfxWfHZhts/ijKMgNqbxhxHPgYYvKVuXihFKB+TQ5AxSy9oRrWGlancJUF5iIDFrsKtJIusTSK95DHhoNdQ8A/CilKzhr05z9lraYDgBKP2x8oXcQFkQBfhmVoB5ERLDxPRVY5ttbYQjx9yn7VhQrp8kKj5oGM0oa8AFGyp8lA0+uG01U/gom2RRUKjwLouG5FNVxFHhZE7ZzB77lOwsnHPnTMJX20mQWTd+Y30B2awVg28+oqBoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6916009)(6666004)(52116002)(4326008)(2906002)(66946007)(508600001)(66556008)(66476007)(5660300002)(36756003)(2616005)(86362001)(956004)(8936002)(316002)(6512007)(44832011)(107886003)(8676002)(6506007)(6486002)(83380400001)(186003)(26005)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i16TAUylEbvNWXGfLchSXgPjOql6QNpDEbBEyYgdhneZJImDqKBwcdB0E4tj?=
 =?us-ascii?Q?gxmVMSpgML4neLqMkm4AwPYE5p4/S6GgPP83uhzyc9LadF+y0/Ik9fFu1P9C?=
 =?us-ascii?Q?sFAUxe6x6SJDkRzEDRFKipari3vw2OKY8MEH7Fl4UKdMGnyTgaudN1ftWudG?=
 =?us-ascii?Q?Iv9a7HNW405KNaOk5lpZLNv1sH7PGO5Ykcchc2EYM5nrFWbKILaOWOGS1nY8?=
 =?us-ascii?Q?N5hFX40QQrmPUKiO+e8ll8iKe+GQTgz3xaHgaBwy00utoUfjdm/Bwx8CwUF7?=
 =?us-ascii?Q?yydrptaDEqn69277eb9NUeLO+qGhUg7BHbxWP1pL49VbRz6GmvT/1zjxE4pB?=
 =?us-ascii?Q?DhLOlD1jiZZc2wgErWbKc06HyavusR9girw0zHlkqikHBWO4on6rEPAlYAQq?=
 =?us-ascii?Q?bqeHQNpu8vLAA4j9l31FVcEfxayOwivSH2SD29QGwHXxEiijdiPBA2xf4CR4?=
 =?us-ascii?Q?wFsJVhaeQ7fWRQR9o18u6K63ymi6e2NgV+9YZODe6fvtFoMdHpGEGh4PXT22?=
 =?us-ascii?Q?7c278SPwt4+tK8MRDTLrfEiHBQq52KVvdBp0pETF4a0AQUB9GsPwFECjJnW6?=
 =?us-ascii?Q?+nmJCqdkhffcMND/a6lmhEZg8ESWE/QgIBEwYdggNWdd5nr0C5Nv74xxvl39?=
 =?us-ascii?Q?bRPUwqG4itkJ8QVoR5DmOTBCVnOy7N5F5hWgy1OcFOJBcUKvTSnqy65EGYYS?=
 =?us-ascii?Q?5ClKygsB+FOvMXdD3czrZhNtB4DPZnP3y0zlHfPb17ROy6EE/CDR7pODvL6T?=
 =?us-ascii?Q?xqpj9/LBGUWeDHAyafOMQ3eyqNw6Gl7QR6NUVN0fRF6Fp1jO5RCa+9qWd99h?=
 =?us-ascii?Q?qLy6ifTL0kY4EIcBQ6UJm5yR/yRwB8jsAB/AAKt9Gp5eLSkhTiywFw38wqu2?=
 =?us-ascii?Q?rjQVYkOrLynlGnMnppky4gpGI+PSRwkce7cY4g64dkR/EmYiN938efcRWGYx?=
 =?us-ascii?Q?VL/T1+O1MBKeFKDrPTF+dT5/q/MpQD0ma7EcEJqmBSfK0C2L6tu3/Pg/q4i8?=
 =?us-ascii?Q?jQue?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c6b971-8dc9-4e04-780d-08d8bd4324a9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 12:58:55.0928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UyGP8ulr0pOC3Ld0MiECgV9YXym01RAxmMGg/Ia+KtenB94FJpHg8M7ov3UACzxdcsxvDTDtW/c6Za0t8lSBJRaN6oOF8B6MKLlZCa7jLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4739
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200075
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
 hw/misc/pvpanic-isa.c          | 94 +++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic-pci.c          | 96 ++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic.c              | 85 +++----------------------------------
 include/hw/misc/pvpanic.h      | 24 ++++++++++-
 include/hw/pci/pci.h           |  1 +
 tests/qtest/meson.build        |  3 +-
 tests/qtest/pvpanic-pci-test.c | 94 +++++++++++++++++++++++++++++++++++++++++
 12 files changed, 343 insertions(+), 86 deletions(-)
 create mode 100644 hw/misc/pvpanic-isa.c
 create mode 100644 hw/misc/pvpanic-pci.c
 create mode 100644 tests/qtest/pvpanic-pci-test.c

-- 
1.8.3.1


