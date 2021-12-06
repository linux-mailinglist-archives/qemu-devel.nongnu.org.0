Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868F4695F9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:51:39 +0100 (CET)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDT0-0003rC-FA
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:51:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDM7-0000WA-7r; Mon, 06 Dec 2021 07:44:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDM3-0001ur-Gn; Mon, 06 Dec 2021 07:44:30 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6CG6KE011904; 
 Mon, 6 Dec 2021 12:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=NKHVNUFQLhnPmvdeQBLNW3IPbKTJ2G2yy9lyh2FVjPg=;
 b=TZsMLxa8UzRVfKM7pH1aMigG/c6MZwIZy8vHQUp5xV2loZUtt56JKFrZyY1+APAdu7pN
 tlSRbNfRGlLdrDq90YV11nAJJM1K0rKjxsx7Cap28KLp9TsPRBojClGG4pnr3slRisQF
 WqbwZszkW3yJcLVqxo0rb3+22AiW0YY2mMXN2a/Q+n/AjNCFDJhruEEeBTIHisT2pymc
 BPKUmF4H6NVrBCVeE5aIysc3Qe6d84unbwWtJBnQkOaAi1VidACLwQjB1Cq11Lyz9uXf
 a9R1FBPxcA1G34/ReZO+TOGGGLgnRE9XV5n8kUpxClan4jG885J8ZpoWieni8gj1bB8B vA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csdfj9hdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Ce2M5093218;
 Mon, 6 Dec 2021 12:44:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by aserp3020.oracle.com with ESMTP id 3cr053c6su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMe4176jL1Eh9zMk0vpmS7/3CVFnFae16HGrhGNeqdEReJtNByQMaZC700xPhB3NJqXZ+5g+4M7zkHOB4ddmP5NfUlx1v5Npe7CEWNEDigsM93QrsR6B5tge72QATHmc9DvlwKCHm+4NITCXiO3Pm7nwQN0Yv3R+Aixx+Qas0KkZ7Vhb9SNrYkuwWBi9JkZaPkW1Y6vwKX4Bj9Qsr8I8LfriETnOiWOFXWcQrmc68ixPSISx6baesynKKclII/UofZXHc8KDmPB7g2VSzytAa9lrPR379D9FHEhMzjPFguVFIzg1kGcFLqAC+jqrqeP6YMcC3fIQ291R+yZtaYnpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKHVNUFQLhnPmvdeQBLNW3IPbKTJ2G2yy9lyh2FVjPg=;
 b=AeU3NTjU8fAnOSgOX4He8elWFsYnSfi+sMyOAAcHue/yHbaG+jLLz9tu/rVKefxs1aozGa/0sfMmgke2DQVeppjcIBBxPNm0KPgSo0DS7OvWxIngAFbXBni/B0r63R8reSzhk89uBTA2xz9NflfkBuKCp1YLglPAct2RL+9adZNKsGOd0FgclyZlalUPsSY7prSMFgqcPxliphcirZM28rjjKQe1KhpNpVrkJCLd+5TQnCwac4qWAotZDXZhIO2lAK6mZgxK/moaJGhwvdDHxZARxnvYGSAEW392/dY/17fW6EW9M7+5jbwnW2yPrrthusDl77phm1vAu/l+NiIzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKHVNUFQLhnPmvdeQBLNW3IPbKTJ2G2yy9lyh2FVjPg=;
 b=PJalOLXkzcdG3q038rIaxtUc1XCSBhklAHgMtoP/5nmV1G7H/L3vsMlKt7GE4KfnZ0sSjeyJxMNp9Wrbj+7dy18v+QT4NjZKC7bHlHeHJWc6gZ+iU5y4uaTiJufdNSe51ExUqVvVo+yrHcaXFVTy+KfjjpjfAVr+cDwNj9bbHFk=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5820.namprd10.prod.outlook.com (2603:10b6:510:146::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 12:44:06 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:06 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 0/8] hmp,qmp: Add commands to introspect virtio devices
Date: Mon,  6 Dec 2021 07:43:18 -0500
Message-Id: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::35) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.42) by
 SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19d0c4d5-d1c2-49a3-8fcd-08d9b8b61759
X-MS-TrafficTypeDiagnostic: PH0PR10MB5820:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB582034F78AC06736DA75784FE86D9@PH0PR10MB5820.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lg7XsJS+x32FXhUbCmoYnflkV062Tg0eMrD+ETHajm+JzOOQ46ASDae7AryjI1RtILVVhQh0AUOe6tFYxuX91SGanM04NBHPvzLCDkhJwGkLD0rNbcqz+DeHEailxtMA9mtjQHAdwVIvB7HkW6fYuShC3OusYrJjGXjlvISGmjdh3YM4/FUDLjF6he51IczhlPF011bA6tjCnGJ910+N9v2BmB/o6mTZpa/KXVpReBLCuIA9cL4prkoOMuy2+XlgiMqXwP72NL6PxzQ2vnzRZOjRJ51aftlNd6pgqkOE7GTB6eO20/bqHBk9D82YjRBiKfwbmQuIRKng/We6upUJWq57Tq0GlfdFWN7c1TuOxZcknZZPKyGZU8F9LJS9PKolGu0AKQWEREY/qNgVLbqRnanPDq0bzxoJTgyGggtmFO44NXGF1A4xb3sdyWbvQtgk8R+rQht1OU+hoWyjM7ScdurqA0jyVchGi3A/UzEvNvSOISh2gnkERZekpuuEY82GE4qWo0QpE79jev9NkW6KaZpryBz50fNYBaHyTD2OyBlxJM6ZmhOfdRN9QmCoiUmj2th4dMrfL76KTRpXvOkSBtD+p8J0v4k8r4ZSJiJIn4c4i4VbCNjvh4l5ILNOCpzjdsf81+Ef/lMo3WRW2B2BbhTgSoVNOpYCTMUm2vtmm1jixaY/KUZetcJvVy4oboywP8oCllQDaUEh4totpE5Hbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(6486002)(6916009)(508600001)(7416002)(316002)(36756003)(956004)(8936002)(4326008)(2616005)(38350700002)(38100700002)(7696005)(52116002)(26005)(186003)(6666004)(86362001)(8676002)(66476007)(5660300002)(30864003)(66556008)(2906002)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qdXqs/rGk33SeXrUn0PT5VGlstTuuAM+v1Qlnjds+5PpoGBvplWT3K4ZC+ao?=
 =?us-ascii?Q?R/FNFa59C7w2p7dt08FBCUflYJJ05eQXejLObSdcMZh2Yn8oVyg9R1Gp1duQ?=
 =?us-ascii?Q?VypbYKYkQeBOHKke8H+EQ5rUFx5YXRxe2mIjp3DaCqJH0QvnAM13dDW0c+R4?=
 =?us-ascii?Q?FYbONvV7ONTja0E0eT0zhTL/pjhnl9CE2vFdwrQl30oHsxciS6xXCTHDPKBx?=
 =?us-ascii?Q?0fDmO+qwjVBDhhu4ZpOZoAZMfj9HJRpd4zEBZGpB0pwuFt/Rzmr+yIvtJYRX?=
 =?us-ascii?Q?Ffpsx5wLktqFH/ObSEf1dDI+p0vLayL021M9sjhAJkfXBgyo2aEN3NVWrqyz?=
 =?us-ascii?Q?DHmIJgDvMBTn+Bsuti8fnwL0CjIeimb5Lw+DLPa/4AIR+v8/AxkM/IiPgR7y?=
 =?us-ascii?Q?K7OSPPEgxY/Qzs4/MLlb0bjGxurw2gNpcNcwL0jrhH6DtvJTMVYfP4mqT8o3?=
 =?us-ascii?Q?8eDVaYY93h3QHzVKCTwRdzQpRAtPhhbZzh49Gc4MYpMfE3Xq54pXo/8qHGLi?=
 =?us-ascii?Q?2zn7W+8MRC2ZiKmr2PNfFPnBO5Z6p1j1udT0XCIvBhRx5U2UVqFgDoq2kB3V?=
 =?us-ascii?Q?7dl5W/SFbcB2kz8S7RYqDykWD6KmMXd2dkQHfAKB7aiwzCsx7fgaevlmcyB8?=
 =?us-ascii?Q?4Ly4rWTgxygKXEH/Z8mJmpvwDxjVFPYhM2d8yKDO1uaURM4bsMrTkOR4erxG?=
 =?us-ascii?Q?SSIY/Jk1Famxk0NQ5rjToCvp7YNWvEWK/dhFyJLVGO7aI/K54WnOkOZ5w6NQ?=
 =?us-ascii?Q?bxTSw7GNtHWDfqFRwphOgTLkEEbe8dNk3YDegA7nQOmfN9Q7yhipNv/vSeg9?=
 =?us-ascii?Q?gIjKMTeY3aqtl6U1dxlFBfaVQewvpmFMZYJH/IbAKLfLUZtS5RhUSjUpuRpW?=
 =?us-ascii?Q?F9/OWx6IZfYOUJUxNogUwPMGij//F5P1ExGof36LHd8gikjOd2MlwIFCqna4?=
 =?us-ascii?Q?v+3sduV87K60KcXJArIeCP77TCvnXvizc39XBX2Vz2cqqU45GTtgN7czBPlQ?=
 =?us-ascii?Q?3Tw0bRE/usb26GlC1E064MuZ7A5223p3wIR01w48GIOkZb+Rt5sITXEf5DdM?=
 =?us-ascii?Q?UrMAbwcu3omi+26wD8PpoqIanls//IHUoXNC5kjtXc//HoGYsDl4UIckQsIM?=
 =?us-ascii?Q?fY+8EMGdZv65hQKW3OvkjSC2qLLe9kOEdKDzOAXR9Ez6luEf59yXaV+hcEi5?=
 =?us-ascii?Q?CLXnSfXgl8qmqgppv9NX9v/X35SxAxnBQcBmi+S2GZPXSY4cJ8RWOp13UU0i?=
 =?us-ascii?Q?2RlRTUShDyj7hVeMd3FTjigrAJF6AcN30ki0j3BedVdo4/ftDiP9uv+ua4em?=
 =?us-ascii?Q?9lo2LOYeYuchLNInZ+ej0NsRrZr9YTI99+RaTXlElv2Slm+a/s6xQBl18cbx?=
 =?us-ascii?Q?i8HdZEOa28u54l91IgWd3I01xC1pwhJ1CHTUXHkkDMiBF+iNZlkg75IGWkX3?=
 =?us-ascii?Q?geUMAYhF3YngE+PCbKqlLNpws6FSQ2kkYkjtLhhaNsq53ewaEYazej5rEjxA?=
 =?us-ascii?Q?H2ai39PPfFOdRAhZxnaKO0Dci/HdtJr654ztzlALXbL6FPiKyZar6K148JYp?=
 =?us-ascii?Q?I1g+xYNPnWWgTkbUOvJH7ziOJYKz/prNN1KdNZK2rpDpwl4BaFGOYUlvD3Mm?=
 =?us-ascii?Q?STK0Am0wjeQuqGKwTHeY8oY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d0c4d5-d1c2-49a3-8fcd-08d9b8b61759
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:06.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FLhAiS4xCOHRLzDNJ01zGjdiPP9eJQf3pIOLLT7CJ/lTZDkkWdY7KsKoFlKHy/IL0GOfP0sc7XYWIEJFqy7jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5820
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060078
X-Proofpoint-GUID: mcyxnBv9yrecHayEkoJO04l6JjSLFj-w
X-Proofpoint-ORIG-GUID: mcyxnBv9yrecHayEkoJO04l6JjSLFj-w
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[Jonah: Rebasing previous patchset from Nov. 10 (v9). Original patches
 are by Laurent Vivier from May 2020.

 Rebase from v9 to v10 includes reformatting virtio.json examples and
 command structures for better consistency. Also removed all enums from
 virtio.json and replaced their purpose with string literals.

 Removed @ndescs from VirtioQueueElement, as the number of descriptors
 can be inferred from the length of the @descs chain.

 Lastly, removed the examples in hmp-commands-info.hx to fix 'inconsistent
 literal block quoting' warning from Sphinx.]

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

 hmp-commands-info.hx                        |  70 +++
 hw/9pfs/virtio-9p-device.c                  |   2 +-
 hw/block/vhost-user-blk.c                   |   9 +-
 hw/block/virtio-blk.c                       |  31 +-
 hw/char/virtio-serial-bus.c                 |  14 +-
 hw/display/vhost-user-gpu.c                 |   7 +
 hw/display/virtio-gpu-base.c                |  20 +-
 hw/input/vhost-user-input.c                 |   7 +
 hw/input/virtio-input.c                     |  13 +-
 hw/net/virtio-net.c                         |  58 +-
 hw/scsi/vhost-scsi.c                        |   8 +
 hw/scsi/virtio-scsi.c                       |  20 +-
 hw/virtio/meson.build                       |   2 +
 hw/virtio/vhost-user-fs.c                   |  20 +-
 hw/virtio/vhost-user-i2c.c                  |   7 +-
 hw/virtio/vhost-user-rng.c                  |   9 +-
 hw/virtio/vhost-user-vsock.c                |   2 +-
 hw/virtio/vhost-vsock-common.c              |  22 +-
 hw/virtio/vhost-vsock.c                     |   2 +-
 hw/virtio/vhost.c                           |   4 +-
 hw/virtio/virtio-balloon.c                  |  17 +-
 hw/virtio/virtio-crypto.c                   |  22 +-
 hw/virtio/virtio-iommu.c                    |  17 +-
 hw/virtio/virtio-mem.c                      |  14 +-
 hw/virtio/virtio-pmem.c                     |   3 +-
 hw/virtio/virtio-rng.c                      |   2 +-
 hw/virtio/virtio-stub.c                     |  42 ++
 hw/virtio/virtio.c                          | 683 +++++++++++++++++++++-
 include/hw/virtio/vhost-vsock-common.h      |   2 +-
 include/hw/virtio/vhost.h                   |   3 +
 include/hw/virtio/virtio-gpu.h              |   3 +-
 include/hw/virtio/virtio.h                  |  26 +-
 include/monitor/hmp.h                       |   5 +
 include/standard-headers/linux/virtio_ids.h |   1 +
 monitor/hmp-cmds.c                          | 311 +++++++++++
 qapi/meson.build                            |   1 +
 qapi/qapi-schema.json                       |   1 +
 qapi/virtio.json                            | 839 ++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c                  |   1 +
 39 files changed, 2275 insertions(+), 45 deletions(-)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

-- 
1.8.3.1


