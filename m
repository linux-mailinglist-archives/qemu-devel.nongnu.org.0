Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABAF513D95
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 23:28:39 +0200 (CEST)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkBgk-0000tk-Af
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 17:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nkBTQ-0000qI-6k
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 17:14:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nkBTO-0005tZ-3P
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 17:14:51 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SIoxZv032179;
 Thu, 28 Apr 2022 21:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=gIbs7dclG9pZb1wnfXL2e7MOOwRXNDf7onpte9PZWuY=;
 b=DFN+mYNd4FbFa/9g8PdCovrpH9UbyXH3zMYnLzSOllvLlxaEMjq7XmT6rB91h/C2/F4z
 YDPg1ONLvmgXJh7kq+RR7ku3uxQgBmgiOw01B9WbxcuVrDu+AhMpcYplte8FKnZpJmPL
 6l3/vq4rBMTPIqzRxDN/g+/4Gza0S1uag255rtCuoLgjtHCd/TdbKCE2llSaR3++Wzp7
 EvYX9Bn7gxVEgeOJ8UFtExnvCdPNFbrX/qY1x+cYB+TOBzhUcZMdMeRwhNgWjkKux8UC
 kXxIWqU1/gkwKCJAq4FVm2o2YjxeR3oTuWA4t1VNjhx1IL3vOt7XuP6zF1ywQ8WMdrw2 bA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb104nkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 21:14:43 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23SL6Bwt024990; Thu, 28 Apr 2022 21:14:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w78cg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 21:14:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBcEv74qQfhU24mmqEBy7wmlwZxlGpXtVy212+4TZJnrtV2r8U7qsxJM8fwbiEScmkP/fbjBxuIWl6nHe6IJrV26jJDiGZGkvuuiHGxJp2ftSSNuv+rUtIgh8CVbyL06QgYlONlgnPLuYztvS1M9u23eptoFyYK6lC26kEi4D/xAwIkY5d5xcR4wP9mI/BjJ4+GxtiFL1iFYQJ2ojNhtIMD2VU6kMZR0ifNMD/nmf7wRfERWyFdzr0ZSznOjUvdhfg4ScqOIk67YoO8FSeJ9DN5v45pcHjCsoy+xOESmvF65RAR4z+08RVbOMJxjTBv2jSlE3RGQlaLlXMaXO361xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIbs7dclG9pZb1wnfXL2e7MOOwRXNDf7onpte9PZWuY=;
 b=ARdR+Ibq9Gbr3S+pWXgOwIqK0/eVJ96UJfCB9YOeMO4o+lU697paG2Q14HSdZ2cdAAgCq+lh6QLUTHldwic6vNZ1DAVrQ9fVi2+lvEAiTmz3qvWDxy741+E/9L0wK28j9nEL8VcxopkLQWreWo1KUEsnKH1CknZL+gNPXkaQj3oBPArlB857BUhy+hKQIiXYDlUY3eKgGfXW1hUWj+yfPLUYqMNYkUuMPMzuX4uDzMx4t7OWE/37G9L8RqBDEjEK/+60X/eYdZHmisvjT47xURP0IoFO5hQC5mLFoI7ArGSo+YIMzW7Xjjq86O827spd1mR3o/HuSd6qzga+/ptcFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIbs7dclG9pZb1wnfXL2e7MOOwRXNDf7onpte9PZWuY=;
 b=LjG7mM3rkfJE4qq9fcA9y3rs/2NxZekXD/IcdFvjArjRV/L+13ncf+4asPAoVlESbls7vi2WFUYsy77UUk/xYmy5Q6dUAiHxYGvc5TYNpdwS3CmXdeWha399AGPSxSDnOKUlw2NECn6Z19Mv8ambERwTtAkXBQCo8asUeXFO2MM=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB3260.namprd10.prod.outlook.com (2603:10b6:5:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 21:14:40 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 21:14:40 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 07/10] vfio/iommufd: Add HWPT_GET_DIRTY_IOVA support
Date: Thu, 28 Apr 2022 22:13:48 +0100
Message-Id: <20220428211351.3897-8-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220428211351.3897-1-joao.m.martins@oracle.com>
References: <20220428211351.3897-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c8427f1-9b29-4219-5f2f-08da295c1b0d
X-MS-TrafficTypeDiagnostic: DM6PR10MB3260:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3260F1DE7B3D7EC75BEFF4E5BBFD9@DM6PR10MB3260.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WPv8RUEQUGGtkZv+n5FEfUKHHhZKgnNcThHeD+oPUF7dGtNCLRucypwgUjvoiq/3qDBZMU8woN+QUR2ydwzZvNH3B4pHUhD16m9NowCC1OcYy7hhAvoXptWur51KYIdeYWQbtvKaCSiPcILUPR6C3IpyxYwwl7rt4cay03hgu+IgXWzFfTN5ktpQ1/NHgHRDyeugYagqVpE+bqwYzwiWylmZiCLkJUGUGPepJ/57X/TYQY/lfHjqA8SDUiPegTjysr9YfNqnoL7nfQyD+6wdXxwr0dePyc9wkBMPoMDWY5v25U4fk2RgCf4aKsgt/XtYagiYlFBvZr8JEvo1K6Ex7kTCboRShQxO4ZFbVbcLiD4YgVXsCZUj31xHcgcboqrqce9vWwzwuV+aHNjADieAjWA8I2pIr45bjS40v515leoZ6IcVHKu0nmoFcDiTD04CKA3hp1hIi/nEgEJyNSGUlKfGlpxAu4D1+nz5bAZR9Ov/gVAiKpIR1OHFnZ41hU6wb7QEqcGyCjagsm717iB9K1W8+Guhh2Wb047yQrNXVxzsHayER9PNC2BTXCH4Ypu9oaOGfMeqhYAhHUh4Mu0FYgx/oMERiZ12518NeRUZhODEErAfuxKrVh884hI0M1uKcED8KinhLx1ppJwHEQ5Akz8OuY2RRSMCGPnJRZPZPVA9EHQjKGIMApDR9921DVQVeF58sd6abgoT/dqnvxqc2m51madUf/+fnVq7wA8XXV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(66476007)(66556008)(2616005)(1076003)(186003)(54906003)(103116003)(6506007)(36756003)(6512007)(26005)(52116002)(316002)(8676002)(66946007)(83380400001)(6916009)(8936002)(7416002)(4326008)(508600001)(2906002)(38350700002)(38100700002)(86362001)(6486002)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TS/ZIE3GwgzarnD9Y/N04s2kPmt8jAIX+4O1r6u5T+tf+RKXM9hiDicJwZEr?=
 =?us-ascii?Q?XE04iMeJp2sHos//pNqfmvtaoUjNdVzwxUyAz0zFZo5t8v4B9G+Zz7R/T5Zc?=
 =?us-ascii?Q?/+Z1zcBSRqncuhUe9ul670MQdGPx+0Negb4DH5qeSV/ivpIMf1trhQOwn8+G?=
 =?us-ascii?Q?iXTZQziiVUwFcdCCg7PGbfQj0BRvZRi2q77cUoDe1LoGpgm8Jl8QnbsyFVgY?=
 =?us-ascii?Q?zcNpPCyBEBDsbOXBbVHf7M+2mzRuscSl2bcMba0tSuDUkwyvgFUqmEGZBays?=
 =?us-ascii?Q?USMtLVL7aNAHdQ6ceZm7ywLM982aSxnYLmgenAB9vTBeo2aRGdRQF4mePbR4?=
 =?us-ascii?Q?EW/Bh8kETpZkavkpkhm0mEMbwbiuS/fHq+h2LVnryJuDqOxJtOC7BuVcOTac?=
 =?us-ascii?Q?CY+6i3KE9/lpKtDLZlZa4NfdGOkqNk7amjqWs3MXVGV8fm2dN24AOnPCWHtg?=
 =?us-ascii?Q?sO4cuGyZP6QgZaMvoIx6yJRQIKrYZz2YcXfqrnF5MVTFLfoFpxAUc7DgIKl4?=
 =?us-ascii?Q?Uf2G/VUDFBQmgfVoKkFEDvn8YRFgU68gnNDE1gqEMcQMS/sK5xlfOCUKW9Wb?=
 =?us-ascii?Q?cwYovxXPF6DQkv2Syad2/+1UpmLa4+8hvcaiBxGD5/FL5OvuUMH+05IkdJSc?=
 =?us-ascii?Q?KWBCvQiJIr4GATsUo1nr4gN8nkMg2OCowed1Fjviac4W1UsC2253zCVatd1W?=
 =?us-ascii?Q?FcvvFdFHyZ9NrAwUIPIf1vU3p+xNi3HBwrlVeKNFWJAsVFt58B8GtQGK0ept?=
 =?us-ascii?Q?HNAPsmqIMGUZsbE2juqDfxbBVep3lpvVLfgOAXfvw7BH7ZFqsEvyak7I6qoe?=
 =?us-ascii?Q?Ipw83Ir6lvWlbV868lWpMFMGPRPkIW8qTdXWpZJ1SUaNAM2Tv2MFBt+naj04?=
 =?us-ascii?Q?sH8lu/CHNAJXHO6v6zSr6WpJCoyyNwp3WtrlocslQTXIIdQ5PUrS/0W8oMvx?=
 =?us-ascii?Q?zKx6w2RVMfrpPu7YKR1twqVPro7p2Np8HCWdoC25d6DrEaCyXMwFeXadaLcy?=
 =?us-ascii?Q?yispH49OtVf/4iYIrfV4wonhKn4Gcxehiiqe2e6kTKAZPwL/UlBXFZIIVgWX?=
 =?us-ascii?Q?lyqmPP4WGWzIVrnaKCv1TOezBBPegTZZnIu2nelD23+4x4AePzLeWnBsWOnL?=
 =?us-ascii?Q?my/Id1Z+X2g1mUaAWRhXLucOBUtrg4y6Hcr7DrdWMRUywm6G7UIbBldJDYYl?=
 =?us-ascii?Q?SMDsXBv1GW3iEzuoM4d9i17IQrx0GX9TEUAOK8SM7MKlx+3b0ID4TpFWhjrq?=
 =?us-ascii?Q?TLhoFKfVPvlyP1HiHY4ihXzNsgNXWJ6X56gjIZRhGCLNykk3m7IFRTVfEwE1?=
 =?us-ascii?Q?CIiUkbx7YaZE0tX5+U0DTOmRekNg5RDuSVlauaeh2sYvTuY/H0kNzzYimCiA?=
 =?us-ascii?Q?ee6vh2u+Bx8YG78TN5QnxnKnXjnBTG4oeEQA9ftE/uggEEfTYZaOEArZABJP?=
 =?us-ascii?Q?3nhNdxqQCX5ayvXpBv9HxsgqAq47SQo4B/2Ema4/1LlPnDodOpglAGdPp5Ym?=
 =?us-ascii?Q?L7HWYnJCluVYi9GvDw9xEOVEq6jDGNNssGEARYAi4HHbumCgcm9xYuWdQq5/?=
 =?us-ascii?Q?u7eIydv/X7OvefWN+vsWU9ZQied9nC6Ono/lsEc3l+VZ10kCU8BK++lxSUaD?=
 =?us-ascii?Q?vz28v8MTXPI5OILzLNHORU8G9jvmJSLEv+5gAWKY4hDCV+uYBxD91DpeDHq+?=
 =?us-ascii?Q?kN7HwkgGeZhoKMsQev/2ginYFus8vw/K6qRXFd8jWFZj4iCimwbY//tCCh4T?=
 =?us-ascii?Q?AXbuTU/dOdbWRQ6+HcNAE1L0KGuCTCk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8427f1-9b29-4219-5f2f-08da295c1b0d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 21:14:39.8793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVaRzN237/MAvKiXBqaaIuAWnnyho2luUvOdOj9btbgh/D6uB/6AQN4biSW5OUMWnkWisFdYfc3ocT0NaEJFCXTVR4QfAzqknlJFp+2aGHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3260
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-28_04:2022-04-28,
 2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280125
X-Proofpoint-ORIG-GUID: HpwfBjl7JPPE7v8uDJuOQR4IaYC7PlhQ
X-Proofpoint-GUID: HpwfBjl7JPPE7v8uDJuOQR4IaYC7PlhQ
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
Cc: "John G . Johnson" <john.g.johnson@oracle.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, Joao Martins <joao.m.martins@oracle.com>,
 Eric Blake <eblake@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yishai Hadas <yishaih@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ioctl(iommufd, IOMMU_HWPT_GET_DIRTY_IOVA, arg) is the UAPI
that fetches the bitmap that tells what was dirty in an IOVA
range.

A single bitmap is allocated and used across all the hw_pagetables
sharing an IOAS which is then used in log_sync() to set Qemu
global bitmaps.

There's no point of even attempting to fetch these bitmaps,
should the iommu tracker fail to start in a previous call
to HWPT_SET_DIRTY.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/iommufd/iommufd.c         | 24 ++++++++++++++++++++
 hw/iommufd/trace-events      |  1 +
 hw/vfio/iommufd.c            | 44 ++++++++++++++++++++++++++++++++++++
 include/hw/iommufd/iommufd.h |  2 ++
 4 files changed, 71 insertions(+)

diff --git a/hw/iommufd/iommufd.c b/hw/iommufd/iommufd.c
index e5aff5deaf14..bc870b5e9b2f 100644
--- a/hw/iommufd/iommufd.c
+++ b/hw/iommufd/iommufd.c
@@ -219,6 +219,30 @@ int iommufd_set_dirty_tracking(int iommufd, uint32_t hwpt_id, bool start)
     return !ret ? 0 : -errno;
 }
 
+int iommufd_get_dirty_iova(int iommufd, uint32_t hwpt_id, uint64_t iova,
+                           ram_addr_t size, uint64_t page_size, uint64_t *data)
+{
+    int ret;
+    struct iommu_hwpt_get_dirty_iova get_dirty_iova = {
+        .size = sizeof(get_dirty_iova),
+        .hwpt_id = hwpt_id,
+        .bitmap = {
+            .iova = iova, .length = size,
+            .page_size = page_size, .data = (__u64 *)data,
+        },
+    };
+
+    ret = ioctl(iommufd, IOMMU_HWPT_GET_DIRTY_IOVA, &get_dirty_iova);
+    trace_iommufd_get_dirty_iova(iommufd, hwpt_id, iova, size, page_size, ret);
+    if (ret) {
+        error_report("IOMMU_HWPT_GET_DIRTY_IOVA (iova: 0x%"PRIx64
+                     " size: 0x%"PRIx64") failed: %s", iova,
+                     size, strerror(errno));
+    }
+
+    return !ret ? 0 : -errno;
+}
+
 static void iommufd_register_types(void)
 {
     qemu_mutex_init(&iommufd_lock);
diff --git a/hw/iommufd/trace-events b/hw/iommufd/trace-events
index d3c2b5a0ab95..9fe2cc60c6fe 100644
--- a/hw/iommufd/trace-events
+++ b/hw/iommufd/trace-events
@@ -10,3 +10,4 @@ iommufd_unmap_dma(int iommufd, uint32_t ioas, uint64_t iova, uint64_t size, int
 iommufd_map_dma(int iommufd, uint32_t ioas, uint64_t iova, uint64_t size, void *vaddr, bool readonly, int ret) " iommufd=%d ioas=%d iova=0x%"PRIx64" size=0x%"PRIx64" addr=%p readonly=%d (%d)"
 iommufd_copy_dma(int iommufd, uint32_t src_ioas, uint32_t dst_ioas, uint64_t iova, uint64_t size, bool readonly, int ret) " iommufd=%d src_ioas=%d dst_ioas=%d iova=0x%"PRIx64" size=0x%"PRIx64" readonly=%d (%d)"
 iommufd_set_dirty(int iommufd, uint32_t hwpt_id, bool start, int ret) " iommufd=%d hwpt=%d enable=%d (%d)"
+iommufd_get_dirty_iova(int iommufd, uint32_t hwpt_id, uint64_t iova, uint64_t size, uint64_t page_size, int ret) " iommufd=%d hwpt=%d iova=0x%"PRIx64" size=0x%"PRIx64" page_size=0x%"PRIx64" (%d)"
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index 8146407feedd..6c12239a40ab 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -33,6 +33,7 @@
 #include "hw/qdev-core.h"
 #include "sysemu/reset.h"
 #include "qemu/cutils.h"
+#include "exec/ram_addr.h"
 #include "migration/migration.h"
 
 static bool iommufd_check_extension(VFIOContainer *bcontainer,
@@ -102,6 +103,48 @@ static void iommufd_set_dirty_page_tracking(VFIOContainer *bcontainer,
     bcontainer->dirty_pages_supported = start;
 }
 
+static int iommufd_get_dirty_bitmap(VFIOContainer *bcontainer, uint64_t iova,
+                                    uint64_t size, ram_addr_t ram_addr)
+{
+    VFIOIOMMUFDContainer *container = container_of(bcontainer,
+                                                   VFIOIOMMUFDContainer, obj);
+    int ret;
+    VFIOIOASHwpt *hwpt;
+    unsigned long *data, page_size, bitmap_size, pages;
+
+    if (!bcontainer->dirty_pages_supported) {
+        return 0;
+    }
+
+    page_size = qemu_real_host_page_size;
+    pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size;
+    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
+                                         BITS_PER_BYTE;
+    data = g_try_malloc0(bitmap_size);
+    if (!data) {
+        ret = -ENOMEM;
+        goto err_out;
+    }
+
+    QLIST_FOREACH(hwpt, &container->hwpt_list, next) {
+        ret = iommufd_get_dirty_iova(container->iommufd, hwpt->hwpt_id,
+                                     iova, size, page_size, data);
+        if (ret) {
+            goto err_out;
+        }
+    }
+
+    cpu_physical_memory_set_dirty_lebitmap(data, ram_addr, pages);
+
+    trace_vfio_get_dirty_bitmap(container->iommufd, iova, size, bitmap_size,
+                                ram_addr);
+
+err_out:
+    g_free(data);
+
+    return ret;
+}
+
 static int vfio_get_devicefd(const char *sysfs_path, Error **errp)
 {
     long int vfio_id = -1, ret = -ENOTTY;
@@ -611,6 +654,7 @@ static void vfio_iommufd_class_init(ObjectClass *klass,
     vccs->reset = vfio_iommufd_container_reset;
     vccs->devices_all_dirty_tracking = vfio_iommufd_devices_all_dirty_tracking;
     vccs->set_dirty_page_tracking = iommufd_set_dirty_page_tracking;
+    vccs->get_dirty_bitmap = iommufd_get_dirty_bitmap;
 }
 
 static const TypeInfo vfio_iommufd_info = {
diff --git a/include/hw/iommufd/iommufd.h b/include/hw/iommufd/iommufd.h
index 61fd83771099..9b467e57723b 100644
--- a/include/hw/iommufd/iommufd.h
+++ b/include/hw/iommufd/iommufd.h
@@ -34,5 +34,7 @@ int iommufd_map_dma(int iommufd, uint32_t ioas, hwaddr iova,
 int iommufd_copy_dma(int iommufd, uint32_t src_ioas, uint32_t dst_ioas,
                      hwaddr iova, ram_addr_t size, bool readonly);
 int iommufd_set_dirty_tracking(int iommufd, uint32_t hwpt_id, bool start);
+int iommufd_get_dirty_iova(int iommufd, uint32_t hwpt_id, uint64_t iova,
+                           ram_addr_t size, uint64_t page_size, uint64_t *data);
 bool iommufd_supported(void);
 #endif /* HW_IOMMUFD_IOMMUFD_H */
-- 
2.17.2


