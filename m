Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18952EA59
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:55:32 +0200 (CEST)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns0I7-00087E-Le
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns09E-00019r-Ej
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns09C-00021s-6b
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:20 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9Uxvs016949;
 Fri, 20 May 2022 10:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=8/JrlTTCiRnMW7r0QYm5OuvyjEsNMYD3TaccbVMlIyM=;
 b=jGLqnnbYZKLzvSQFP5rMF/jAxQueJ2yOfqAFMrNMnu0T/QcSQT0aE63+ppc6XPfaHIha
 MtTw8Q0wnRS+BbV10iO0sGZRK2mVzNoNiJ/txzGpSa+DbvkD5RsrRfKvKWlQ4qG6Zu/7
 g+UJkLMOHRLp1PF8FWiTZdfvZqRv+KuVz6To25sXtyBW1jAnYANe+lNa8mOBfUmhP8ai
 NVhiLBYnSWZBOVyzCyJTBBDto0kNrwWCcJ+tPNJhquGd0UFq0AHj45lcAYhyQPdqPiNk
 OxveG0yeB9H9RGdAFVurZ3CYfJTpsPlzsTnaGpI0dIN0wOgP3aSuorCNU0McdnB0sflR cw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g24ytxr11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:46:06 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24KAj8lU027300; Fri, 20 May 2022 10:46:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g22v66h23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7XusMzP6OSAylGvRYuYs3HDj6rC0fVp7o8VbBz/t7544Ck+4kk5cElM1NSOqoP8YRNt2W/iQdd/PToNDRnOMverjFNjbbF11jGWbj2Asye+bVnphvVmaXBTNgaHjm8eCnGtK08jfagf1JrzGZtwRPovB1pKpUJnitEOwf5zzWp/cQZuOt9x72RWa3JfvlQm/dpcB2SuPlUzl+KYs64CCznMuHcWiLIx+EE2/vOFFDlA5+1EiBjYcmuLZDuImZrPqmywtLQfyBq8fWNp56AB2/oEt5g7440mzJwh/caunl6Bm6AHKqgQMuRVvlVVHelpNQ9rxVzZbPJJLrs1VCKcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/JrlTTCiRnMW7r0QYm5OuvyjEsNMYD3TaccbVMlIyM=;
 b=g6J6LaTW/x1xyQU7/uuscD1Xs4lCPd66LgWbnAvVL4pR82a9S6CYd2yRDXqp/TfPunV3SoCFOGl7UAqoYfQyoBnZzMdMHIgieKNgoHSrhpuyNGmOxKtn1D7ZQNN4UnB4EjZxxyKZPQzq7jPkXeKYiGaSxQNfCWvIR6wbot06PiUxC6Xck0LaZlk3HViP9nEM6imDEuE88fwzd7O8fTDWjC/q1YHiNouserJOuz/ejNsUiNepWfI/mvgaU08XYUn/CkH8lIhaKbWbhv/AMkaZwI/fPm2T5qO0WFWAu6qBn4Dojd0B5eaZITcFMw4H7aF8xZcOHI/2lsCU8eUO3we8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/JrlTTCiRnMW7r0QYm5OuvyjEsNMYD3TaccbVMlIyM=;
 b=jLSkOrenRprCjeSv+7fpG8gmnron3dOoTfj8vOjyIJ0CRm5RVuQ3v8DO2idCTi8ygn0ekF7DzoT+v+ti8u3x9A75XGxGVD+ev7NhZKm181cpLaTDH0zfZEo7f/TCE3M1mzXKji0Cq0J/ZsO3QIQ3gbE4aUzniQrcqdHEe1EXf9A=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1378.namprd10.prod.outlook.com (2603:10b6:404:44::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Fri, 20 May
 2022 10:46:01 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 10:46:01 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 3/5] i386/pc: pass pci_hole64_size to pc_memory_init()
Date: Fri, 20 May 2022 11:45:30 +0100
Message-Id: <20220520104532.9816-4-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220520104532.9816-1-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45a0181c-516e-4edd-f0f0-08da3a4dee07
X-MS-TrafficTypeDiagnostic: BN6PR10MB1378:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB13780BDC6C42FE234326E783BBD39@BN6PR10MB1378.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61QDFkfbH+w/f8nd3W5IA+OVgo41+pRM770nvIhsjHzGNqeLir/UCock1769ng0k796jyK58eKTGWuCjJ3PM7yQXUqDkKMn5GhMI+t8So4LuKbJtZ6ceuYtNLsowTpNBm8wQwEPWdB3UEAgfY6TnGwZvtIZC1uUEyyhi5aQvVNAD3ilMZuqVtMc9J/A17cumvHm9H6tPunr8Yeie/XQwqYRzcHHmxpK+CIEoPdlLiBSo7unGt3r+BHzlHD5+6KQOFu5EyVRgBz61jJiQsCSQ2c4hzNSq5goo85kb12az5roYlOhF84KVtZXX4WtkSC8fqqKyqxRAvE5hhMprl0dtFvE5w4CM/41xww3FPCeCnHsssBM2Z8lrkTGrIRURV5GIDInAgwOsZWPOjXMi2E0VuF3zts7ZiaamTNm/mK2OpSrd5MWsKtMjb9AK/F4Z6DswiUdxXJlAy5Zbq8y++5pzs+VEKFWQg/FnalbSQEs3plRLbgTxutJIgMOln2BtBuSwDsmi2ejNjq8N+ROZtp32EDH/BfHCtvNpBcZAHMps5wePmZEm6anklM3he4AudIZ2nRr6QVEiiQjbUhMUcKSOApKMcZdy6gu9+ES/FAsbHDo50tM2c422k6I2Mpxsi0QOwpdimdY6y8HZXj3Otw/hOcDiVPv/yhl6DqOoFdVx/lwUtWcpGb03ujjFURAaR5b2CsisO2uqDQY/o/yHAeHMeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(8936002)(66946007)(6666004)(7416002)(83380400001)(508600001)(66476007)(54906003)(6916009)(66556008)(6512007)(8676002)(6506007)(4326008)(26005)(52116002)(2616005)(38350700002)(38100700002)(86362001)(316002)(186003)(1076003)(107886003)(103116003)(2906002)(6486002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7qH76cD3Mqtl54ZHRhqNlK83QkQ8ocPI9k55zsMd+RGp2lgzyfQqdrUUQkZ?=
 =?us-ascii?Q?0hYjp0dA6sUkYwLgpTBqTC6/T6yY16K+IWykAlLpbylifRw6+b8j46KiFyft?=
 =?us-ascii?Q?9RyrY3SfH2ncndOvM3VX/YzINeW+7VrGi3bgQ7JDQTsG2FUN1zh+NdNZ/+qy?=
 =?us-ascii?Q?ljmtUar64HxnTcd5GZrxmhRjMco/GLlXYmhdJC1SX1utvr1OJXGWgymkPRAq?=
 =?us-ascii?Q?lgnb7LWybzbu1qUL7QAiGH7OtFeoVaN5T4oLdId7pPzbgk/IxHO032UHDmmr?=
 =?us-ascii?Q?UjFd8Hv/rxR/slaVTq0ctbrq+7Fy8yt/tNqR7AC+yXEoaLmI75q+0maBbNYy?=
 =?us-ascii?Q?Eib0xWoU3oApEhUWCR1+4nOxSIq04wvME7O8VooVIb0WvnQvaAKTa1Yh8m4O?=
 =?us-ascii?Q?C4HPUK3YrNKDFNLx6Z1D5L9khsQJNTusLZXA2ic9LfgMCZ7elWHp6alpJra6?=
 =?us-ascii?Q?Gb9CKWsF+qW50ZYV+R6W9P354c9dS1eU12F5m7SajtuecLZi5CA74evK0jZp?=
 =?us-ascii?Q?omIKHtsGYGG2YxKo1YSXUt3XzgBwhp2cOt5Hd0U1XB8JuBeOZtlk8crsDIQa?=
 =?us-ascii?Q?5zwh/PpQfTgqlDdo5OQQGe1iVVbctkuPlqrGEtWEH7li7gE/E1umvFa2qsnV?=
 =?us-ascii?Q?GIMHKIjKwNqOkO7vHZIps64UixYmUOuq6Ukohax2XtbvrfkZ+nIXj4WjnWG4?=
 =?us-ascii?Q?i+XbfSPDXBbQjYz0zNKJ+V4cZiOXu/3+2/Bc9tIoaQH6pOthjc00B43CVOuP?=
 =?us-ascii?Q?pwnEy62VnyMieAiupjXE/8mjCN8dSd39Zolc9KNy0SrYaeIfUtwJyl2SXxIs?=
 =?us-ascii?Q?76TjcGuaUFEndbtYQd7NhPUBq/3VZuefxXIpFyTV/5MEbVLReo3O9redwQ5w?=
 =?us-ascii?Q?tQ67JP/im/D0pPFDGOkzqZtXOf22tdSTZF0nNhzmMzIV51PMHAeYhW8g1YAc?=
 =?us-ascii?Q?HuLU0egQd9P10dFg6axHubrwvkxwzZtRS4DTqnxn+Hq84S9pZ6AGytJSimO6?=
 =?us-ascii?Q?jZ9o5WiCSwM2lpqUCLTrYTqIpFp5nqtWbRwvTBOeQ9Sz8n5fXrNJF6hBMhI5?=
 =?us-ascii?Q?+KMqP1mMIX8zEmL1yLTo78Ce3y66Bzro5IvZFVirVMZO9eAj7awvb1u7jPhu?=
 =?us-ascii?Q?fhWrkNRaETY2ekh3Q6jSAJ5LR9kt+wpJAoTSoZaJ+ohhxaszauwrwrHbEMG8?=
 =?us-ascii?Q?/Re3lgXMI8mmYdLiKduMkiTtuOeFpZtUP4ROeiAvsADHv+/IlFddLecC/50e?=
 =?us-ascii?Q?QBkLd32skYFUZ/De7H576PMen3iQviKMyqZTaaDKOsDXR5peM7BCEtKYR8pk?=
 =?us-ascii?Q?fDedVaaWcc7uui1nFo8sjSzYTMNs2aEF6ncOdt1uo1YrMfFzvzwUmxpUTzaT?=
 =?us-ascii?Q?byIvei+8z9k7dxmt/xSPvSHIlFWPKID4YdHWa5T9RWMKfGuPl8nTzffNi+mb?=
 =?us-ascii?Q?1gXXLoSg1iebG2DpPeVFlmn9pcNIRmz8/OStoT0t63weC9ugOICigxgTR3Vv?=
 =?us-ascii?Q?FeRWluec/LTvAZPhh4+yVYpZEppgceJAyTaWHnoGqjodB1cZ9O8bF+2krL9y?=
 =?us-ascii?Q?0myDNceUglBP7xIURQNulqs0brvtxrRMqsp0mnpnmgNz9RmkLpMosbiCK72s?=
 =?us-ascii?Q?w0CXy+FHJiyXFOb6u4++VBZSo9RVl1QYmXG2iXnhIGCA3QDieg5nzk3UjsIO?=
 =?us-ascii?Q?7rDM4b0AL8pZzFYUfETE4xYRouc37RWZ1WY5SbjYl1lfWTDeAmQ6h9s2UXNo?=
 =?us-ascii?Q?zBOghzKv83kFe4cOPA4JM2xmNBqYCeg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a0181c-516e-4edd-f0f0-08da3a4dee07
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:46:00.9392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4KVDkbZfVZxiOM7c7EgEs+BlFWWNAHf2J3KGT/evpstrEdQ/y6f2Qi/WgJhXlLQF6UZAVXfrfqnTRbj4AIkboXb31uaIQSJbffMBGiT2/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1378
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-20_03:2022-05-20,
 2022-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200079
X-Proofpoint-GUID: sDhVsyUJHR_USNKH1_FqX6_B1_Y_055D
X-Proofpoint-ORIG-GUID: sDhVsyUJHR_USNKH1_FqX6_B1_Y_055D
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the pre-initialized pci-host qdev and fetch the
pci-hole64-size into pc_memory_init() newly added argument.
piix needs a bit of care given all the !pci_enabled()
and that the pci_hole64_size is private to i440fx.

This is in preparation to determine that host-phys-bits are
enough and for pci-hole64-size to be considered to relocate
ram-above-4g to be at 1T (on AMD platforms).

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c                 | 3 ++-
 hw/i386/pc_piix.c            | 5 ++++-
 hw/i386/pc_q35.c             | 8 +++++++-
 hw/pci-host/i440fx.c         | 7 +++++++
 include/hw/i386/pc.h         | 3 ++-
 include/hw/pci-host/i440fx.h | 1 +
 6 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f7da1d5dd40d..af52d4ff89ef 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -799,7 +799,8 @@ void xen_load_linux(PCMachineState *pcms)
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory)
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size)
 {
     int linux_boot, i;
     MemoryRegion *option_rom_mr;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 12d4a279c793..57bb5b8f2aea 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
+    uint64_t hole64_size;
     DeviceState *i440fx_dev;
 
     /*
@@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
         i440fx_dev = qdev_new(host_type);
+        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
         i440fx_dev = NULL;
+        hole64_size = 0;
     }
 
     pc_guest_info_init(pcms);
@@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
     /* allocate ram and load rom/bios */
     if (!xen_enabled()) {
         pc_memory_init(pcms, system_memory,
-                       rom_memory, &ram_memory);
+                       rom_memory, &ram_memory, hole64_size);
     } else {
         pc_system_flash_cleanup_unused(pcms);
         if (machine->kernel_filename != NULL) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 8d867bdb274a..4d5c2fbd976b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool acpi_pcihp;
     bool keep_pci_slot_hpc;
+    uint64_t pci_hole64_size = 0;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
 
+    if (pcmc->pci_enabled) {
+        pci_hole64_size = q35_host->mch.pci_hole64_size;
+    }
+
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+                   pci_hole64_size);
 
     object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 5c1bab5c58ed..c5cc28250d5c 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
+{
+        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
+
+        return i440fx->pci_hole64_size;
+}
+
 PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     DeviceState *dev,
                     PCII440FXState **pi440fx_state,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ffcac5121ed9..9c847faea2f8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-                    MemoryRegion **ram_memory);
+                    MemoryRegion **ram_memory,
+                    uint64_t pci_hole64_size);
 uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index c4710445e30a..1299d6a2b0e4 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_memory,
                     MemoryRegion *ram_memory);
 
+uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
 
 #endif
-- 
2.17.2


