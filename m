Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E24EBB37
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:56:14 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZSFZ-000712-IP
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:56:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRto-0007g6-Iw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtm-0005NG-7d
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:44 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U3JZIA019606; 
 Wed, 30 Mar 2022 06:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=S5AxDfsrdedpyw2JBAWFuCmoEymXZ8OoPSmPcK922pY=;
 b=ja6CCAUEe8FQqY84o4d7DeKowJEHwnBnJ9Pd2zpvRmLPBSMvXPHQbcF6W/evopTTx8wo
 Wm6Isisp1TdkPMlAco6WIWMd+KdWZAr514cbxsIMW/kuBUNnOOmfao2EztsBqR2ctH+3
 8mWmU0oq9SaeJAzrT/hmVAyzogTxVoJ8oB9ZADOUEiOQ4rTHKXaNQfCNMgPKXXEyO4vN
 C6gfoneqJZHWWeyQlxT6/SaJ6Wo3UehfRI12UWvV0bl73ZhItCaTEowY/bDnD4/o+FSe
 WEDLlM6KD32blbiCBTgW4Rc3WqT567HTYopNWjGxCBGey/LFuBCDc8q9sg12q5f3EJuR LQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1se0gjjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6IC5H013067;
 Wed, 30 Mar 2022 06:33:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by userp3020.oracle.com with ESMTP id 3f1v9fk5ts-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7Q+BRFmNE9ipwx1yIFWphz4vEE57HG3UwmnaHLBDeIvCGdzMERgtGFZ6rn3PPu0H1ohjONKIHfKzj7V/kgXYq3t3KIUKfwrmx4LzSezTXi6oRzZhv4/4qCmXLgPzugQKXk1KYZHGggXzXCFymWiLT6Jj3dh+8Dfu6N8hit9v33PVQ8lqws7fRDYPH239/ag61eMjNxobECzY+zd7KhHyNMb+DYqYI0980SrLlGpNQt8W29e0TM64lS/OFjRHwJ7zA22g+G5kUJ+0N9aT2sY3zEz3YDqjgnXOGLKfjkyJZCpbx3amWxdDczbcswyg1myjwwdA1t1Zbi9ieCpZJhlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5AxDfsrdedpyw2JBAWFuCmoEymXZ8OoPSmPcK922pY=;
 b=h9cSWGZJvu+hu9UHY733iHeUweT5/gl73dNLwGW+NBdB8diDXTN6IJKtJAQylQ34xjJb1C+roOv4k1A0dwPy7pIRNc9oTXxgVUMHaZCm7DnESxN7g0N+TYu7swK/cI1WhbKlvUN8uGVtpALjtpjGozho0+WYrB112twfxqbG6hBk0x/CWzaCY6NIvIS5vDAyf9ZGNXyFgNIH7SvtWGpHw6UdXjNC7BZkz7tv4KBgo+vyZqRg8guO8Ayyur/AF8UMJCS5QV6wr7yC3mDmxcnNzSW/awsGBVfhvamysWZGG7hq3dpY7MB0KgLWzs/GzML15YCFj7+YwAaOLN3vCbl9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5AxDfsrdedpyw2JBAWFuCmoEymXZ8OoPSmPcK922pY=;
 b=kDGt7TThdj3IGvZtQ4XaDI76C7rzK3cRTu3FfuSGlUXtbgQ0Swgr5VRUeL47Wwlv/GHn59actSxONkWANSEh311JRLEtsGcZJt6lMHvMMQOWFFsF+t4T/JdmCdbFNTUawMxwo+Yx66eBkhf3SF7hnrvZEapifXpymSdS1lEqCSY=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BY5PR10MB4067.namprd10.prod.outlook.com (2603:10b6:a03:1b4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:29 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:29 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Date: Tue, 29 Mar 2022 23:33:11 -0700
Message-Id: <1648621997-22416-2-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbbc5084-058f-4ed0-fc2d-08da121733f3
X-MS-TrafficTypeDiagnostic: BY5PR10MB4067:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4067517CA615631F2B30AFDFB11F9@BY5PR10MB4067.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nkudZ+iJOzxhXKD5UaMlgcYOiZg5Q0xWEGO+DsYxlbOglhr5QzoAQnKH4wRAR76pPAXq87UGuPU2cS/g9xmYnqUiNGYbeqMr3qOGpvapvf+7CjAG9jA8V4feJzt92UrMPVlmQunof3Ziy8qB8yvE+C5QmESR1yeFHnPZzZDJy2EUKgqn4V3rr+e0kJDYAYGfyAMOCH2oGiL561+dY4qTaeT8fJ/zOZ/axE0RBIwzs2j1F3iPh1DBFVKTUNMp3G51rpvNzdDS+WTWzizEymp7NWPU6PD+ZrT3TF6ILaqKsvJrYhNyDaBB1zfqpxGv5yTnkYJyojclc0s9PL/iwwVPenQ+Kpdf/+6FuouUSFGGNEWAOhV+VE4InljxsSZzFtSU6DsF0k07w1cROppS762KqfVrVejBnHuZAJmC7PicJK0w+ibTeVfrrmQx7mJJU+FakpWWv/XWWC0MW4jaiWiS7AJCVoPgzxqGt7Vp9sxLd8ufURNgW3hbR7AgjEbahHuTslEOjSXmmnAL1fC6SB1z8VeBCzG1SDx28Ubu+kReIh35ANKBc64zdqjXeewz/sP8zNKJdCTmLscR+lqTHPa7W1XQo+Ohx5swbmktISefdmHgAIpkRZ9zuxV83nGNvtsOvPF96ZbVEP/B7Uc0JMElbjOBb+eurv6GZr/8/zZyM3hueMAMvtJWlM47W/S3VGAQ8z4c7iSN1ES6abJHHC68bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(86362001)(36756003)(26005)(107886003)(6916009)(52116002)(186003)(2906002)(2616005)(8936002)(6512007)(6506007)(6666004)(5660300002)(83380400001)(8676002)(4326008)(38350700002)(38100700002)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AnE8KURg6lzsJFa1PwS9dnV4ys2Fp9MwtcnAPkVRh4BeGJ0ZPP+xgHPkQNLp?=
 =?us-ascii?Q?C5VDuOk7lFybz3r4oFNqE9n1wtwIFAZVVC8CV7P2SnAi7pvmE+JRfQArNG2O?=
 =?us-ascii?Q?t/HIh0ySoUuADTFDJ/k3vCypNSghuJ5tCImfqGPohc829+89rKvkV17EXZGU?=
 =?us-ascii?Q?J9GuAUrMDFCz75fchFjMY4zexErbN8TIMRJhoIQBzUsvOB9IolaZ2UF/iXmD?=
 =?us-ascii?Q?3CqWnxZdkUUH0ZRr/sZTQl9ifWi31RokOInaSgJH4Hkli7qZa1xNFLEfSHRQ?=
 =?us-ascii?Q?KAc8UH4HzVYNwJYCb2V7hGNGYb+wAQ3pKXBd0btFf9K632Oo1Sp/hFRHFdCd?=
 =?us-ascii?Q?JZ0LMB5FvXN6GRg9fO7fPOFxIdfwhM8HyJr0kSJ1sLHyAqe0gVLsuSXIgtOZ?=
 =?us-ascii?Q?b6bmrgiH4Ucf49PjLlsIWqbE4aQ83dMkxe25T8nVmdZbTJxUBCFJqIaMuHnP?=
 =?us-ascii?Q?TdUr/pUrsoEYW9GAgZL/mKtcoVD0xQT6d+HnPTIoizldqAwQZ6B0wuaeARIg?=
 =?us-ascii?Q?oRvquMDpFBbvssZLsOf+5Mk1w4kb8SOUmkBCMTO4L5uNNwmnX3FgGnGjGCo8?=
 =?us-ascii?Q?xuiKJsAhcWyS/8QcKWtMPMhgMV+Ps69w9/y5EXJJ4nUrkbX27S2Ti95wq4Go?=
 =?us-ascii?Q?HpFtRghL18HF2fhEGWVP12npyRBVfRo3qbSJr032B4XIYLpcGOTLSBjmAn+M?=
 =?us-ascii?Q?gyPpnlde2C6GWwyQM0qs3sDxVkoW5TC0PVm58JufJFYluJPD7p05L/1wMlM8?=
 =?us-ascii?Q?mtdmpwJs4TvpdWVizl6mO4KTIbvZf5BlWMrm1XobOfuN81jez23KIM80Ajce?=
 =?us-ascii?Q?UjHUHdqYrPDSeGqfrLHD8d2FtEfb3zyH3mf/vy5lZjgTEIFPdhUP7Z7AJbtS?=
 =?us-ascii?Q?H5Z2uA8ddBVrTxefy16Xs+kmPgn6Hv45Xdl86TLqpAwHW7EfWQJEe4LH5sA2?=
 =?us-ascii?Q?kgkvs5oAQGBTZLs2zcdSYsodvJL5uaOylBJ5eZ3jIGsJVzLRXCh7z2/hFpHg?=
 =?us-ascii?Q?KwjYSWTxGWGga98I76PirUBHNNc8yrpfpmK7HphQZAiGfRTioGJGfc2IJSEt?=
 =?us-ascii?Q?Mq8RxA0750n096yMx04dknTNb32OvW4agWHVuAWY5+L0VyntUUZz+RRBq1L/?=
 =?us-ascii?Q?x0XWeZ0F9P7C5CmL5DmyXgG9lQ5sWfICY0uWhXNfeJUCjJmnM1sjChAbrCSZ?=
 =?us-ascii?Q?52goPcYikRhPbY5VUo9AGPy0nQEm8DyL5kM0kPNo3Ls+rVUxX+0uJeqTz91p?=
 =?us-ascii?Q?bHCCTvDuxNUAt54egKQrAA7K1UxgH/HxgB1YmQE2AE9tfrklspzxuA3wUXLc?=
 =?us-ascii?Q?noV0sSpszrWnVCVm7rogRNsdl/Z85bRR0SGOMdI12oNBqFQq5aecHvlkkt4X?=
 =?us-ascii?Q?9xhc00PIW/7uA/O+myDyfIRXrIR+OojW7Bw2aD896kJL6XuDuZSm9DilDCZU?=
 =?us-ascii?Q?WPsqqjrRWzAMC02R3NKQ4p/jhX0MZmVxbAaCaQowaAheX05Qr2YqoDnS7Urq?=
 =?us-ascii?Q?GfuPNQsfWjMX1BWTlO6BoE93GnKsMHKGC2IGsrC+cW+70PB9FatXoSKOiFwx?=
 =?us-ascii?Q?KNFUwnkfoUgafyPEhEX7tFfqb2lvvFCJ273N6z87DQgV0TO/44FZtVOVaCOB?=
 =?us-ascii?Q?RWSDf4Wo9LzarUnuC+P2MqiRY1/BL598MAiw+Tc+1mPbkPiMv+0ZV5dr1N0E?=
 =?us-ascii?Q?eRH0YSmnLuu3nsGYnGTan+IHN/cBokASDqxPPZ78yHzWlR9J7rZHwxh5DFHg?=
 =?us-ascii?Q?KqH1OMnEBCFsqVpi61G0DYSL+d5oG40=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbc5084-058f-4ed0-fc2d-08da121733f3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:29.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF0MmgXrhe/AlPiMab0qGy+8iXhbL9UrzhsboAei1cfPTK1P0ectjcFASK/IKijMcUShobGfoMBBNDw4xWGP5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4067
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300030
X-Proofpoint-ORIG-GUID: FNHcDJw8IvVmXA_QacuM1AFiNoeMg8es
X-Proofpoint-GUID: FNHcDJw8IvVmXA_QacuM1AFiNoeMg8es
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, jasowang@redhat.com,
 eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With MQ enabled vdpa device and non-MQ supporting guest e.g.
booting vdpa with mq=on over OVMF of single vqp, below assert
failure is seen:

../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.

0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
   at ../hw/virtio/virtio-pci.c:974
8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:361
10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
   at ../softmmu/memory.c:492
15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
   at ../softmmu/memory.c:1504
17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
   at ../softmmu/physmem.c:2914
20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6

The cause for the assert failure is due to that the vhost_dev index
for the ctrl vq was not aligned with actual one in use by the guest.
Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
if guest doesn't support multiqueue, the guest vq layout would shrink
to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
This results in ctrl_vq taking a different vhost_dev group index than
the default. We can map vq to the correct vhost_dev group by checking
if MQ is supported by guest and successfully negotiated. Since the
MQ feature is only present along with CTRL_VQ, we make sure the index
2 is only meant for the control vq while MQ is not supported by guest.

Be noted if QEMU or guest doesn't support control vq, there's no bother
exposing vhost_dev and guest notifier for the control vq. Since
vhost_net_start/stop implies DRIVER_OK is set in device status, feature
negotiation should be completed when reaching virtio_net_vhost_status().

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/net/virtio-net.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72..484b215 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
-    int cvq = n->max_ncs - n->max_queue_pairs;
+    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+              n->max_ncs - n->max_queue_pairs : 0;
 
     if (!get_vhost_net(nc->peer)) {
         return;
@@ -3170,8 +3171,14 @@ static NetClientInfo net_virtio_info = {
 static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3179,8 +3186,14 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
                                            bool mask)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
                              vdev, idx, mask);
 }
-- 
1.8.3.1


