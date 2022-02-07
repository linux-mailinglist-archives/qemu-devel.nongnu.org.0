Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8F4ACA70
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 21:28:52 +0100 (CET)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHAd1-0007HK-5i
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 15:28:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZD-0004SA-8t
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nHAZB-0001ug-E7
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 15:24:54 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IgkBF011806; 
 Mon, 7 Feb 2022 20:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=EmYL7wB6OhiNtsvM4E0Ct4EMN15ex1hn7CWdNsPvrsM=;
 b=SIeugqCAVYatNkB1TD7b8JLfxgtkQpbwaA3s4/QzN/WxNDkyQpEhnVhBGnYDV+7ptXkn
 lyDmZULqYPXQ/Bj+31tcgjSv++BKXuROgKJxiNG8sSg53/gyFws7TA/eK8rU41JLufI3
 gkIwjY4IA/gV7ivjtMJ3jntVyDktF9LqNMtLYcKRlHlq2dIMymtNdGEdmvkyFOZvOnYa
 3VOklyZVbvBhA/2LnJBZmGLcZBjkFQXnyxr7Oqov4D2NjyexRvIIjTBMlSsm66d1iYVK
 FIW6zoTPeQHDvCfmmR5+zTIJV5Sk5n1B0rgGUsAA8pdw8q8MD+x3aR27VGREMZKDLjUa Hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e345sh72t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 217KLU1Z136781;
 Mon, 7 Feb 2022 20:24:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3020.oracle.com with ESMTP id 3e1h24vgpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Feb 2022 20:24:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCR2i/SiYKsiTj5m/sKdChPk7h31kbulGBQUrO6MIMQkkTb0WA0GeNFd2928gRgukJ34IvLJU3kTtR3d/mxoY700/uxyRn8cLY0y/Lq9rm/5IijJbIK05XcS5CGHM/QzA3oyY4vYg3+BvDi3XC7Scway+mgv9u+XpfmazTycX3QO9wyDHqCLm2KRhSEqG56A9WMdrxjFDEIiJeYcq3SfjcHSsihI6r/aXQntmclYI5Vk5SFaNnlfPnLWt06OGKjrT1RR+yL71B719Dpeqc/GNk48L51TFafVr29W2rNhHj7Cjsc3HhVhKFWdP9QtV6CWvJEfbnucgxEOrBPcUsSZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmYL7wB6OhiNtsvM4E0Ct4EMN15ex1hn7CWdNsPvrsM=;
 b=I8mPo6LRg00Oc4c9s+6+95hLQJKhWC+L16IKYd2Vk6dAkagHX/dVwqEGSYg0Ge82RLM7zIXnnBi2KbWRNGunzzpKbg3ThBTlXa87NDdbPMrZuJXliJ51MVJiGYzX/2Mb8CMJI8ZFsxuRw5AqZWkTHOpk47gjWsW+RjJdGnIyaJjNnnwhaXL9Nt+J4uYdOe3jHzNprBnbBWR4yGYD6LaiKw0C8FsWfLGi1tLY4B/tfCnTCOsVmN2PrzwEcuc7Mhzj9+i/PBEb0Gnz1dOAM9TWCOt6lf5VWoWzvuyUps1UrZZhhVRYEioV0PHo+8yrhOgqOfvr0zx5Csh+09WnECjrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmYL7wB6OhiNtsvM4E0Ct4EMN15ex1hn7CWdNsPvrsM=;
 b=i0ojgDamt5nkenhr3iuYPsXjHqrdx9LqK2FP+S0kP0PIgtDEKlr9nMv+/qEFvwtMPbfWO+xNBY6MGj5bJHUX2/ivZqKXz4tkPNQWHMZCp8bLOZ9Ie2SnkAVpRevIueduMiXq+W9oQ+j8b6YoCYY/VT7LSHm/zOGt/pB2MATw1c8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN8PR10MB3649.namprd10.prod.outlook.com (2603:10b6:408:b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 20:24:47 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 20:24:47 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFCv2 4/4] i386/pc: Restrict AMD-only enforcing of valid IOVAs
 to new machine type
Date: Mon,  7 Feb 2022 20:24:22 +0000
Message-Id: <20220207202422.31582-5-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220207202422.31582-1-joao.m.martins@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab8b2c5-0306-4bfa-5291-08d9ea77e27f
X-MS-TrafficTypeDiagnostic: BN8PR10MB3649:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3649E332DAFEC7DC9EBBBF03BB2C9@BN8PR10MB3649.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z88q5+zAuBTUpyLXYx1MLp6UzQJSYnTWjTfwb9xHDMk0nnjmXKUsCOislEv1egeg7JPtxCA0jwDam+mDpVG44VRKMyc0yl/fmwdbSijn4uAR/nItaiw+u3xIwZiAcKuH4LXTlKL3L3TMcblu92thzaSzyl+scH/oy30zNCjIpt2CatjleE3YCZgpXVIQLBPDd3GJ9Ae9lpnV/7AOaEeTrO8Kwr2m1JE2rL3Vr/C1mmuGjiYHxRc3BfxBM6QDbLcvxm4FGHnMk4OunjJKXxTJWpGKq7ZZZLGl+J1Sn0vYboBvGy2ivfT7pWXLL4JTep+NSeSzCtXs7hQnmc1bsmTWQUS6odkIglJKRMJq9ptQrItvj8k1PsvNN+SoNXPRoJMOOHJvqXKFxMN0DzZB2+Z+AQnz4gUA0AaC4C2jmKwVItpUnMstuX5+VQ8M/P/HzTvyRN16rFrnM3rJFalVVNLzYaI4ZRXw6HM+O4nYJMLEwpRDvdLRAhnfVyrvefW9rZlvnZ/5mKN2GlM4BhvIukA5NmGMcoqFcHMOCryUv4iFo9ZEdXJPPVZjFJfs0sEzajOcTTCdlYxJsSqdfeHdh/Dhku9gt+vugRx6A/56f75xb1qBWJQd4ZH2x9wij/xjcVtNNsDWWnHVouvRlL41DTHFcu9h/K2wTv9laCqJWGkpY+2eZEIrFPA9gFFVX9Tmd3zSV9ZRDAQaSugtJeczxgY8Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(2906002)(26005)(1076003)(186003)(6916009)(54906003)(2616005)(7416002)(316002)(6486002)(508600001)(36756003)(103116003)(86362001)(52116002)(38100700002)(6666004)(38350700002)(66946007)(4326008)(6512007)(66556008)(83380400001)(5660300002)(8936002)(8676002)(66476007)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmisTC+3e31m0yyxCLfNzDu9ykcGnx/3EEJofT6Wwlx/3l1eeK4m1mZk+0+O?=
 =?us-ascii?Q?lypmYhSeGgsiZ00LUKTmOCbnZTNUbDPXUVS23Bty/PS7AatwV9jeTyn11vdl?=
 =?us-ascii?Q?hI5UgQiadsavoK/NX0NPYx7ZS789IDFbshlD0y6AxN4myMjNEsHIb1wFTkvR?=
 =?us-ascii?Q?IUf0ck00IBNJ2Ppo9Mvpdcxy1qYryAXxQKkpbpTSro+F6vkZcVtWeGRgndej?=
 =?us-ascii?Q?6TVOO8XsAxsrnSK5LF86B0Uc0CI/DMXGKtxVGu/rsDVQT7SgcVpyRkMHE00K?=
 =?us-ascii?Q?1JaBh4/RL+ud4DlGe4bSvoEyyhRQgXMXNfLI1sz2Uz0yS96PDsQa14EuFmdk?=
 =?us-ascii?Q?yRXwdBy05cdaGl8Tm9w2e48+hN83SnOmumTu60zrhHMjEsSs/CgDVuXDeNRm?=
 =?us-ascii?Q?uIifRP7PZQeKIp0b9zos8xCoGrAt155ap3DsZF2ktw3RjT2FsvOyYzBvlpsV?=
 =?us-ascii?Q?nFRUVa1pjtD18ZsgYLAcOY6E5r65jd+Zv5ZrKuRmtwbXKyNBZYWLUQ51tZJV?=
 =?us-ascii?Q?C6xKYDVSPUIdgk+bOXPc9gFD410xNpTgkDDOCrWGNS5qmUCq8YRGeYL+YEuJ?=
 =?us-ascii?Q?ackPVpZuJCJc3lxs7OLCUcQ6RjOuPFaTueTtkB1mfdQVaqUB9RCUHWcUPo6i?=
 =?us-ascii?Q?aywFIqBDa2OoOr6sAGv5s+IzUZtJn5SZlzG+x131XF173tZfb3ujeUQS8RCt?=
 =?us-ascii?Q?sgFM0Br+d5Ph4/WJSrOGDD4QkrV9tG3gm49uG+PGqox0QDTq+n7/kZJJT9Wm?=
 =?us-ascii?Q?c6fkd+kwpWAJ8OavRc7a/YOhZ3qfGOw95XlesmTAX/uV/7BOQE/GljXqeZPJ?=
 =?us-ascii?Q?X3IIhOYbO/VyRvo9UagcyTaNXoUqnbaJgN1KTpBIG3hNweX+UoXvTAC/UCSl?=
 =?us-ascii?Q?LL+Ezyc/F3Y2C+fkc5bllS04QS91LDk0z3u0aaMVzgrnIxKUw95ngxNqP6Vp?=
 =?us-ascii?Q?ptUit078oNUSA2gpjuGsOUyF23inP4z8DxkcvZk1fqyb61AVkf+LZw0ElG72?=
 =?us-ascii?Q?mJs88WEGk4pJWTm8X7Z095CYqTEYCVvuQx41JWueoAfkRL6jh/ozZHfxpk4b?=
 =?us-ascii?Q?Faz2BgTEL825uHEcFOHz3XaRc/8BBfV0s9G32lOWIIuPzDrWcp6OMvI++r6L?=
 =?us-ascii?Q?U50efw9HZKB/63+d0oE1pjL3q2wpTAwjr9xt08TimS/6U5MFVjmwhXDfeivD?=
 =?us-ascii?Q?QBtpGwI0X7JtN7j5b9bda0wMr6k6at7ERTmBQBd5cinFQ7o2mn9pKuYwARft?=
 =?us-ascii?Q?v1vRh0FaLkYYcT6CGuAJtc3wgBeSR8XFtXe6E0WXhx3Egtq5iIOrOGRQ/eSc?=
 =?us-ascii?Q?3E9T4gstrIJAM7BN9evKZPRSPlErK3CNKCFFwiztjqto6pCprCqcA0pHxVgH?=
 =?us-ascii?Q?TxuX1i7J8cWeVaMnAkFWfu0W0J0AsY7mADGjBOlkb/hqkkMqpl5Ex/FIB25A?=
 =?us-ascii?Q?3Xfa0U66FwJ/m/kqp9WvdkTkiCwPKjMjNyzOAnTC2ROqXR1ljAhERJYpGhEN?=
 =?us-ascii?Q?gPKfwBxR3Oh+vTqMZY97cvQQbVGfQrzaZytkc8zAH8FxWw4+MIfGwaK72WA2?=
 =?us-ascii?Q?k9Z0HoqEQmENt4GOx47RROonNJjQh55uWvpCI5sfgvxaozZ1NTnv0z9kJnFp?=
 =?us-ascii?Q?qmI42JOYhl+0R4/To1tzAWyclytacxDYyOaBiwONxF9aBDjhErRt9eSEamoi?=
 =?us-ascii?Q?bOsIqA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab8b2c5-0306-4bfa-5291-08d9ea77e27f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 20:24:47.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwAxm5B4l84+w2o2J9ra9gpEhMCQyl8Yspx8lmIN3+0GawsHGHJfT1uR9tamarzSsqHH3UE7sytXOqS+0UVfAJraokNXbQ46CaajYjCZUno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3649
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070119
X-Proofpoint-GUID: NlnzxHr6CAEzefFaLVhiiW4pOYjOK1e2
X-Proofpoint-ORIG-GUID: NlnzxHr6CAEzefFaLVhiiW4pOYjOK1e2
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The added enforcing is only relevant in the case of AMD where the
range right before the 1TB is restricted and cannot be DMA mapped
by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
or possibly other kinds of IOMMU events in the AMD IOMMU.

Although, there's a case where it may make sense to disable the
IOVA relocation/validation when migrating from a
non-valid-IOVA-aware qemu to one that supports it.

Relocating RAM regions to after the 1Tb hole has consequences for
guest ABI because we are changing the memory mapping, so make
sure that only new machine enforce but not older ones.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c         | 5 +++++
 hw/i386/pc_piix.c    | 2 ++
 hw/i386/pc_q35.c     | 2 ++
 include/hw/i386/pc.h | 1 +
 4 files changed, 10 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f8712eb8427e..e62d446b28c7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -844,6 +844,10 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
     uint32_t eax, vendor[3];
     hwaddr maxphysaddr;
 
+    if (!pcmc->enforce_valid_iova) {
+        return;
+    }
+
     host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
     if (!IS_AMD_VENDOR(vendor)) {
         return;
@@ -1787,6 +1791,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->has_reserved_memory = true;
     pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
+    pcmc->enforce_valid_iova = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d9b344248dac..ccf8b6d9895f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -429,9 +429,11 @@ DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
 
 static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_0_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    pcmc->enforce_valid_iova = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1780f79bc127..1022abf4953d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -373,8 +373,10 @@ DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
 
 static void pc_q35_6_2_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_0_machine_options(m);
     m->alias = NULL;
+    pcmc->enforce_valid_iova = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9c9f4ac74810..10dba9767861 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -117,6 +117,7 @@ struct PCMachineClass {
     bool has_reserved_memory;
     bool enforce_aligned_dimm;
     bool broken_reserved_end;
+    bool enforce_valid_iova;
 
     /* generate legacy CPU hotplug AML */
     bool legacy_cpu_hotplug;
-- 
2.17.2


