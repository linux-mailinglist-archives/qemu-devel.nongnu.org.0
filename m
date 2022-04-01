Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EDF4EEE31
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:32:54 +0200 (CEST)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHOX-0003PE-NC
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:32:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGf-0002R5-PX; Fri, 01 Apr 2022 09:24:45 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGd-0007BN-6C; Fri, 01 Apr 2022 09:24:45 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231CuGxj017615; 
 Fri, 1 Apr 2022 13:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=gtNC7dTAVpKcvgL2/NO+grKJvQaTp42d/uMDMszSbBc=;
 b=U3oXx7mKB9N3Gl56sAJ7qY6beml0T552epceLkmf2Z5vaYPecxk9C5nO3VehlTlBziPw
 SY55133zXJcRCvZvwwBw69NNYTFUTX5QHUUil152LK/ZSkl04D0ZOhOZD2qo9tPFbEIS
 gpRJusjvfqkNOrba6Bov6qpWCxcC/aNwXPUq4rj2440TBqgkdP3EF3PlC7+N/Atj1ztV
 xJ7GNCKXA3d9NftP454jsW+sGEJtkC2FDPq2PE/ZtSkmUYjcRfuxWKTIH4SZ2sbT8e6j
 b2McvWVS0g3Yyj74sYP1tzwg7xDVhbdQ5ifeyXyDSNhfFb/bfwTQdfMWY1m5169/97Uh GQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1ucty9wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DGTp2011819; Fri, 1 Apr 2022 13:24:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s992m95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOjFiUOXzchmyzQoWMXVlCLY5U4d08Mz6m3rjTgGBg4BvCBu57zLiBUU6rLxfhOI780yAp5BFU5Bjh1wjj82u6oS8G1ucx/kCHsb9nYnZSlPxR9VNRHA7xwvWuKOT/P1bFNxOa+bB0MfOT+DZsY/koGvDnPfdRYPf2tO09cd3xOhE4Uga0bAzASnKmsmZE7axrVpY0tvrNLo2vAKnmivJ3dEwG9sH/R0jvd7SlhN/lVuRI1PSOIDubIaKX/e6+vG2pGGbNNSlve7F1cNTcr5ULScwBExduQpgZ3KdjvJxddzIH2N888/xtdIiFIT+Q8pxl+3sA9y1s5AdRVgTtKdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtNC7dTAVpKcvgL2/NO+grKJvQaTp42d/uMDMszSbBc=;
 b=A9fNqQnsPsKIKmvRROBvMLK2j/5lqeyHjTnLq2U/NzP0RiZOCMHuFIUpHOwcd5Du3hNZoXFQDcI9v06eRBwk6/4Ge3zPRCCXz+R6LmadkhbEAx2nW3VgjbhtuLCH7jc36fdN3ot7/qXKjRr17oGrF/q2PQggj6Mz6lCAJbPkQl9HB1B80flqDwl4MErZCrXz+v4LNigBocFP3RjPNOJNtBOJ8DKE9ULJ9vH+ymsCDRWuHxrvyFKKwllDMSzmhOki0zPSaVTDFjLhYK6jarE9VhPlVtXJhIJIVm656UM0trJ/im6b9GacfBw8fSoGkPSFPlDad2wPwPk1UdZeIpo0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtNC7dTAVpKcvgL2/NO+grKJvQaTp42d/uMDMszSbBc=;
 b=iY9XBA/dL+/hs/3ba2lAKh2WBIlcalaDwKD5+D9jlRjbiWJan8LXHah79FYoBzCDWIQMg5Uk+gVf/ShmbHKOiO/4MhCQ53nFwZkbVLHKz0u8AtCHtCYA5UwVF/bF98YRnGHmvzOCiu8rs5wns7M+21ZoChrn9BBk3/+XY8BfoqI=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by MN2PR10MB4302.namprd10.prod.outlook.com (2603:10b6:208:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 13:24:09 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:09 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Fri,  1 Apr 2022 09:23:17 -0400
Message-Id: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8f3a441-04e6-422e-6dc0-08da13e2e723
X-MS-TrafficTypeDiagnostic: MN2PR10MB4302:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB43025B83A79D6E363C18EA17E8E09@MN2PR10MB4302.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdQ7JSi7W3+/mSG2EOmBxWCNUSjDRBTbWJ2V1wLXkBQsStbrMWiw1zA8iRcvxNmcTjEfQuq3Uy3lkvJ0zq4JteoBz5OrWYTzNCDC6UBl6S5pyXSH8IcILXQ+FThxjMU3v35BNpcTCVEwfi1tclad7zbNcdXy2uITdkZvF5hDzdpNymKPt3c+2aG4SrB5P4P/BiKZHoSjR9FswNBaLmi9Lyz27s3gTBvpqrQVhAS6Y3k9uV3YPh6wazMFf3cTOefozgYlFqhVJogUsn8CMe1FuAMUcP/PVxQ1yrFWoaNJw4Afmze/pjzEFQMhcLmbI4yKP1/saEwnH/pyrclYZkdFF1l9dGBAXqHMkMRCJFBnvr6VTaXx39+rFnaa2MLAR0Srfmed9Cid8uWaPU1t2Kcj563oq3FNPe7fqtBQauvVZtqUu5I6814FdeAC4EjWUg0FlokgypD3vbsEBctQjZNCgKGOPSLqWJMt38RZtOfTIF9Gz69ejjq06AEvBJCGY8UADtvjGUwytdCfixrv9YIu24oE2hLUCaPdsEVW6CfAJ6sV6RpkqF4bZ5hFV9M95TNj5/YkZYYwqsGwVllG7IRLB1xN5dGoyWd+nEOdAhokQ2Y9yhx/OstQbTxtv8DplOVjlr3TUBzz0b7YxsOS7+VL3e2JzQAEjKZqEjeBlirTZGIZbCeZDkLxttdfMKLPi9pPa09XQaz787UkeB4HDNv/Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(4326008)(508600001)(66556008)(66476007)(2906002)(8676002)(6916009)(86362001)(36756003)(66946007)(38350700002)(38100700002)(6486002)(5660300002)(7416002)(30864003)(6506007)(52116002)(8936002)(44832011)(6512007)(6666004)(26005)(186003)(83380400001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y7lx47MmGovw9/a6jeBsUqzAGzDXAuEQ6dfOdc/UPxq8ykW22RbmJ7iju1bI?=
 =?us-ascii?Q?g+DUz8wiz1JSNkulQO5jydRIgULS6D8Y0p2yVdDngQZYwplqBDCP+Qf/mSjU?=
 =?us-ascii?Q?XMJRVrNtNXw9Kr6eh4V4jxeI5tJr+jhsxpATTaZ+LyS2wS3sybeKheThqvAT?=
 =?us-ascii?Q?V0YOfAsN/fBW1KIyvd1HXoAhLCyuJAzTGtG948I+at34zCpTshlQfUnpfc0n?=
 =?us-ascii?Q?m0I02GeGNutwpsTK47DJw4pV45UjLaKQGVo6U56mKllx3QD/UHNEhyx7eDBV?=
 =?us-ascii?Q?q6utnqze3GOc1Wa+o4sKqtTqJx1XM0XMu9cNFEhXLHESE/hjkgi0e8Kj9WEn?=
 =?us-ascii?Q?zXa1Tl9DU7f1bed4JQ83Q5TDqIlH9tCuZPfF4Vsdahdqgo71KmqgxogMgDFb?=
 =?us-ascii?Q?jxn/sZUGkGaeFbZ6xeZ1zNYlTjgWG5XcIBVtdqYl1HT4lsLPhp8vF2QUu0iz?=
 =?us-ascii?Q?1fgcmhAXXlFpEvN0jkSWq2ogbVMH9U8dKTOAlyfO0UyfZTZF3pgEzf8bBcK4?=
 =?us-ascii?Q?gOf3gp/+MX9rYuUNc51rXVod6h3H3OYMvsIKM2AeI6L8cfnz5tvShJDB3UpJ?=
 =?us-ascii?Q?czSdZaXN8RDdfOd9KyVmJmHwHLKZhY1Ml0DEi2agLEV4/zfrDl6aaEXir9CK?=
 =?us-ascii?Q?//K+q4+hb2DypRY3VpDmYJX3R8n6/R5cfGYfzrqCRIpUBavcube6VzMu4JVL?=
 =?us-ascii?Q?xNrHrZGuwXrdaX7dZcU0OQ4qPzATGYKYcSfGVHORi543lt4ULXyDX3OiaXS9?=
 =?us-ascii?Q?j6WOYKaJ8we57BPvS5kYORGQdCrw3Xyx5zg44N9hzPUOGA3tFgWxPV+05Koc?=
 =?us-ascii?Q?WPf77f8vo+SDOb4+LTsGohnX7SHwrreacebJEqut1bwkG16r3CYeOc+DZhLF?=
 =?us-ascii?Q?cxKz8LfV0bhazK0/oTMEOEQpHFNrf2iqTrB9hndUia3PHOoneh0ie9G3xeNW?=
 =?us-ascii?Q?vlk4o2BlYR5m2nsQ2TW4knztX0kUkmh1ECJjRevkB8SvRAwXdAUGClEEJYEt?=
 =?us-ascii?Q?FgGXZGOGhqyzH//kXMl8rBBA4XOl9X3DzukoWe71AC+or+XWvZ1x9DJCpZfo?=
 =?us-ascii?Q?wRl9uaXDU8LRpuH8VFXzU2vMqQj92lPJd5z64/x8SD789ohfAZV+ZvvilSUh?=
 =?us-ascii?Q?jYd65faRfTeIyBxSwemdJetxq8LQfhiWY5c6nDbwXEzqAVzdMiTkdxwtcizn?=
 =?us-ascii?Q?igVgGYXSFDUVJuxDeA3nNBW+hRsrA8pn2jgD4znWxRcAGP9ToS7JvDzBaEOA?=
 =?us-ascii?Q?/1DNmtQffkbBVwVsULj2z1V+Hi6/WwB2Iwp3CWEG7cHLy9lxi1o9H0yDsC6P?=
 =?us-ascii?Q?3D9dwdpmW9E9Y7SOXUBBt0I71bWGp8G8X6XDEL9xmgy3sNkQJRnfGcF7RrjK?=
 =?us-ascii?Q?J2TdeCO5UMPB45UsnFexzUx874ZU1iE1oNmF2WQWSpRL5hAdK87ZWMqvdeJl?=
 =?us-ascii?Q?71oa2rs0MyV7n3UgAPWPK3jNvmJMeNVMOZMGbLNdOTOFiHC6ox8/Az6SRuot?=
 =?us-ascii?Q?pGEKbTVW2okRJfBUTPtqmGieTMZAP1PhJI0zHjV/qu4zeMUglH5T7Uk8/t9G?=
 =?us-ascii?Q?YqvkbTGFwHOt/UJ028EAg/2qEY3JZllFVr3mZsYjYQMDdpZ71dSQ0eaIbGbw?=
 =?us-ascii?Q?jTx9o9TFCYRHB07NvWJ3LfINzEr+FOtGyQTTD6zPxm4Edrqhd8o4LVnGV4rj?=
 =?us-ascii?Q?5gCwSFeTtdGQrGvDuAhh2qR3mswPgAcsV5sSYDA6ChovSdD7qsWu2HvOzeTs?=
 =?us-ascii?Q?m8RaGAIx2k+QTEdieUsMa4IaSdGT1w0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f3a441-04e6-422e-6dc0-08da13e2e723
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:08.9147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaH8LlE6Cx9N3XMQRl+MaqLq26eVkXXO15LAApETx5CMU/0fiOG5KpyZaVKheV0JY/bGjmysBXz5Wk2BHbOrMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4302
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010062
X-Proofpoint-ORIG-GUID: tPw1a3HLpzoMnGhooBQFS8mDXcUDlcug
X-Proofpoint-GUID: tPw1a3HLpzoMnGhooBQFS8mDXcUDlcug
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing from previous patchset from Feb. 10 (v13). Original patches
 are by Laurent Vivier from May 2020.

 Rebase from v13 to v14 includes moving the definition of 'gpu_map' to
 virtio-gpu.c, adding a new virtio-gpu feature, creating a feature mapping
 for vhost-user-i2c, and fixing a casting error for cross-Win64 builds
 in VirtVhostQueueStatus.]

1. List available virtio devices in the machine

HMP Form:

    info virtio

    Example:

        (qemu) info virtio
        /machine/peripheral/vsock0/virtio-backend [vhost-vsock]
        /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
        /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
        /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
        /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]

QMP Form:

    { 'command': 'x-query-virtio',
      'returns': ['VirtioInfo'],
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio" }
        <- { "return": [
               {
                   "path": "/machine/peripheral/vsock0/virtio-backend",
                   "name": "vhost-vsock"
               },
               {
                   "path": "/machine/peripheral/crypto0/virtio-backend",
                   "name": "virtio-crypto"
               },
               {
                   "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                   "name": "virtio-scsi"
               },
               {
                   "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                   "name": "virtio-net"
               },
               {
                   "path": "/machine/peripheral-anon/device[0]/virtio-backend",
                   "name": "virtio-serial"
               }
             ]
           }

2. Display status of a given virtio device

HMP Form:

    info virtio-status <path>

    Example:

        (qemu) info virtio-status /machine/peripheral/vsock0/virtio-backend
        /machine/peripheral/vsock0/virtio-backend:
            device_name:             vhost-vsock (vhost)
            device_id:               19
            vhost_started:           true
            bus_name:                (null)
            broken:                  false
            disabled:                false
            disable_legacy_check:    false
            started:                 true
            use_started:             true
            start_on_kick:           false
            use_guest_notifier_mask: true
            vm_running:              true
            num_vqs:                 3
            queue_sel:               2
            isr:                     0
            endianness:              little
            status: ACKNOWLEDGE, DRIVER, FEATURES_OK, DRIVER_OK
            Guest features:   EVENT_IDX, INDIRECT_DESC, VERSION_1
            Host features:    PROTOCOL_FEATURES, EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT,
                              NOTIFY_ON_EMPTY
            Backend features:
            VHost:
                nvqs:           2
                vq_index:       0
                max_queues:     0
                n_mem_sections: 4
                n_tmp_sections: 4
                backend_cap:    0
                log_enabled:    false
                log_size:       0
                Features:          EVENT_IDX, INDIRECT_DESC, VERSION_1, ANY_LAYOUT, NOTIFY_ON_EMPTY
                                   LOG_ALL
                Acked features:    EVENT_IDX, INDIRECT_DESC, VERSION_1
                Backend features:
                Protocol features:

QMP Form:

    { 'command': 'x-query-virtio-status',
      'data': { 'path': 'str' },
      'returns': 'VirtioStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-status",
             "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend" }
           }
        <- { "return": {
                   "device-endian": "little",
                   "bus-name": "",
                   "disable-legacy-check": false,
                   "name": "vhost-vsock",
                   "started": true,
                   "device-id": 19,
                   "vhost-dev": {
                      "n-tmp-sections": 4,
                      "n-mem-sections": 4,
                      "max-queues": 0,
                      "backend-cap": 0,
                      "log-size": 0,
                      "backend-features": {
                         "transports": [],
                         "dev-features": []
                      },
                      "nvqs": 2,
                      "protocol-features": {
                         "protocols": []
                      },
                      "vq-index": 0,
                      "log-enabled": false,
                      "acked-features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                         "dev-features": []
                      },
                      "features": {
                         "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
                                        "NOTIFY_ON_EMPTY"],
                         "dev-features": ["LOG_ALL"]
                      }
                   },
                   "backend-features": {
                      "transports": [],
                      "dev-features": []
                   },
                   "start-on-kick": false,
                   "isr": 0,
                   "broken": false,
                   "status": {
                      "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
                   },
                   "num-vqs": 3,
                   "guest-features": {
                      "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
                      "dev-features": []
                   },
                   "host-features": {
                      "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
                                     "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
                      "dev-features": []
                   },
                   "use-guest-notifier-mask": true,
                   "vm-running": true,
                   "queue-sel": 2,
                   "disabled": false,
                   "vhost-started": true,
                   "use-started": true
             }
           }

3. Display status of a given virtio queue

HMP Form:

    info virtio-queue-status <path> <queue>

    Example:

        (qemu) info virtio-queue-status /machine/peripheral-anon/device[1]/virtio-backend 2
        /machine/peripheral-anon/device[1]/virtio-backend:
            device_name:          virtio-net
            queue_index:          2
            inuse:                0
            used_idx:             27
            signalled_used:       27
            signalled_used_valid: true
            VRing:
                num:          64
                num_default:  64
                align:        4096
                desc:         0x00000001342b5000
                avail:        0x00000001342b5400
                used:         0x00000001342b54c0

QMP Form:

    { 'command': 'x-query-virtio-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                   "signalled-used": 27,
                   "inuse": 0,
                   "vring-align": 4096,
                   "vring-desc": 5170221056,
                   "signalled-used-valid": true,
                   "vring-num-default": 64,
                   "vring-avail": 5170222080,
                   "queue-index": 2,
                   "vring-used": 5170222272,
                   "used-idx": 27,
                   "name": "virtio-net",
                   "vring-num": 64 }
           }

4. Display status of a given vhost queue

HMP Form:

    info virtio-vhost-queue-status <path> <queue>

    Example:

        (qemu) info virtio-vhost-queue-status /machine/peripheral-anon/device[1]/virtio-backend 1
        /machine/peripheral-anon/device[1]/virtio-backend:
            device_name:          virtio-net (vhost)
            kick:                 0
            call:                 0
            VRing:
                num:         256
                desc:        0x00007f31c032c000
                desc_phys:   0x00000001340c6000
                desc_size:   4096
                avail:       0x00007f31c032d000
                avail_phys:  0x00000001340c7000
                avail_size:  518
                used:        0x00007f31c032d240
                used_phys:   0x00000001340c7240
                used_size:   2054

QMP Form:

    { 'command': 'x-query-virtio-vhost-queue-status',
      'data': { 'path': 'str', 'queue': 'uint16' },
      'returns': 'VirtVhostQueueStatus',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-vhost-queue-status",
             "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
                            "queue": 1 }
           }
        <- { "return": {
                   "avail-phys": 5168197632,
                   "used-phys": 5168198208,
                   "avail-size": 518,
                   "desc-size": 4096,
                   "used-size": 2054,
                   "desc": 139851654676480,
                   "num": 256,
                   "name": "virtio-net",
                   "call": 0,
                   "avail": 139851654680576,
                   "desc-phys": 5168193536,
                   "used": 139851654681152,
                   "kick": 0 }
           }

5. Display an element of a given virtio queue

HMP Form:

    info virtio-queue-element <path> <queue> [index]

    Example:

        Dump the information of the head element of the third queue of virtio-scsi:

        (qemu) info virtio-queue-element /machine/peripheral-anon/device[2]/virtio-backend 2
        /machine/peripheral-anon/device[2]/virtio-backend:
            device_name: virtio-scsi
            index:       125
            desc:
               descs:   addr 0xa4f90f1d0653b5fc len 1862028160 (used, avail, next)
            avail:
               flags: 0
               idx:   2936
               ring:  125
            used:
               flags: 0
               idx:   2936

QMP Form:

    { 'command': 'x-query-virtio-queue-element',
      'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
      'returns': 'VirtioQueueElement',
      'features': [ 'unstable' ] }

    Example:

        -> { "execute": "x-query-virtio-queue-element",
             "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
                            "queue": 2 }
           }
        <- { "return": {
                   "index": 125,
                   "name": "virtio-scsi",
                   "descs": [
                      { "flags": ["used", "avail", "next"],
                        "len": 1862028160,
                        "addr": 11887549308755752444 }
                   ],
                   "avail": {
                      "idx": 2936,
                      "flags": 0,
                      "ring": 125
                   },
                   "used": {
                      "idx": 2936,
                      "flags": 0
                   }
             }
           }

v14: move definition of 'gpu_map' to virtio-gpu.c
     add new 'context-init' virtio-gpu feature
     created new feature map 'i2c_map' for vhost-user-i2c
     fixed casting error for cross-Win64 builds

v13: minor text edit in qapi/virtio.json

v12: minor reformatting for monitor/hmp-cmds.c
     use PRI types in virtio hmp monitor printfs

v11: minor reformatting in virtio.json
     added synchronicity check when querying virtio devices

v10: rebased for upstream (Qemu 7.0)
     reformat virtio.json for better consistency
     removed all enums from virtio.json; replaced with string literals
     removed @ndescs from VirtioQueueElement
     removed examples in hmp-commands-info.hx (to fix 'inconsistent
     literal block quoting' error from Sphinx)

v9: rebased for upstream (Qemu 6.3)
    change QMP command prefixes from 'x-debug-virtio' to
    'x-query-virtio'
    add 'unstable' feature to all 'x-query-virtio' prefixed
    QMP commands
    fix odd indentation for qapi/virtio.json
    device features support for virtio-mem
    move HMP sub-commands under 'virtio' top level to 'info'
    top level

v8: add assert in virtio_id_to_name() to make sure we're
    not returning NULL
    minor documentation additions to qapi/virtio.json
    add virtio introspection support for vhost-user-rng

v7: rebased for upstream (Qemu 6.2)
    add ability to map between numberic device ID and
    string device ID (name) for virtio devices
    add get_vhost() callback function for VirtIODevices
    expose more fields of VirtIODevice
    expose fields of vhost devices
    decode vhost user protocol features
    decode VirtIODevice configuration statuses
    vhost support for displaying virtio queue statuses
    vhost support for displaying vhost queue statuses
    expose driver and device areas when introspecting a
    virtio queue element
    changed patch attribution

v6: rebased for upstream (Qemu 6.1)
    add all virtio/vhost types in same order as
    include/standard-headers/linux/virtio_ids.h
    use QAPI_LIST_PREPEND in qmp_x_debug_query_virtio rather than open
    coding

v5: rebased for upstream
    add device name, used index, and relative indicies to virtio queue-status
    HMP command
    add device name to virtio queue-status QMP command
    add new virtio device features

v4: re-send series as v3 didn't reach qemu-devel

v3: use qapi_free_VirtioInfoList() on the head of the list, not on the tail.
    Prefix the QMP commands with 'x-debug-'

v2: introduce VirtioType enum
    use an enum for the endianness
    change field names to stick to naming convertions (s/_/-/)
    add a patch to decode feature bits
    don't check if the queue is empty to allow display of old elements
    use enum for desc flags
    manage indirect desc
    decode device features in the HMP command

Jonah Palmer (2):
  virtio: drop name parameter for virtio_init()
  virtio: add vhost support for virtio devices

Laurent Vivier (6):
  qmp: add QMP command x-query-virtio
  qmp: add QMP command x-query-virtio-status
  qmp: decode feature & status bits in virtio-status
  qmp: add QMP commands for virtio/vhost queue-status
  qmp: add QMP command x-query-virtio-queue-element
  hmp: add virtio commands

 hmp-commands-info.hx                   |  70 ++
 hw/9pfs/virtio-9p-device.c             |   2 +-
 hw/block/vhost-user-blk.c              |   9 +-
 hw/block/virtio-blk.c                  |  31 +-
 hw/char/virtio-serial-bus.c            |  14 +-
 hw/display/vhost-user-gpu.c            |   7 +
 hw/display/virtio-gpu-base.c           |   2 +-
 hw/display/virtio-gpu.c                |  18 +
 hw/input/vhost-user-input.c            |   7 +
 hw/input/virtio-input.c                |  13 +-
 hw/net/virtio-net.c                    |  58 +-
 hw/scsi/vhost-scsi.c                   |   8 +
 hw/scsi/virtio-scsi.c                  |  20 +-
 hw/virtio/meson.build                  |   2 +
 hw/virtio/vhost-user-fs.c              |  20 +-
 hw/virtio/vhost-user-i2c.c             |  21 +-
 hw/virtio/vhost-user-rng.c             |   9 +-
 hw/virtio/vhost-user-vsock.c           |   2 +-
 hw/virtio/vhost-vsock-common.c         |  22 +-
 hw/virtio/vhost-vsock.c                |   2 +-
 hw/virtio/vhost.c                      |   4 +-
 hw/virtio/virtio-balloon.c             |  17 +-
 hw/virtio/virtio-crypto.c              |  22 +-
 hw/virtio/virtio-iommu.c               |  17 +-
 hw/virtio/virtio-mem.c                 |  14 +-
 hw/virtio/virtio-pmem.c                |   3 +-
 hw/virtio/virtio-rng.c                 |   2 +-
 hw/virtio/virtio-stub.c                |  42 ++
 hw/virtio/virtio.c                     | 747 +++++++++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h |   2 +-
 include/hw/virtio/vhost.h              |   3 +
 include/hw/virtio/virtio-gpu.h         |   3 +-
 include/hw/virtio/virtio.h             |  27 +-
 include/monitor/hmp.h                  |   5 +
 monitor/hmp-cmds.c                     | 311 +++++++++
 qapi/meson.build                       |   1 +
 qapi/qapi-schema.json                  |   1 +
 qapi/virtio.json                       | 841 +++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c             |   1 +
 39 files changed, 2356 insertions(+), 44 deletions(-)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
2.35.1


