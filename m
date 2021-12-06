Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5294469603
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:53:43 +0100 (CET)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDV0-0007Xi-Qd
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:53:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMB-0000XI-Lz; Mon, 06 Dec 2021 07:44:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDM6-0001wO-9e; Mon, 06 Dec 2021 07:44:34 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6CCqZY012705; 
 Mon, 6 Dec 2021 12:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=R/+cK31eegqPIBAakeDUO/azvVEn3rKHttf+DjWWvoM=;
 b=tAB+rUQ4bmCdF1PJwJmDoYIhPPjmhXbUrIk1hpWvM4f3Qb+WdW0XstdOZ1qM9xE/4itu
 8CL/r53AsK+Bg3i9SpB9mweFM3pLPzxcM9AJ88dI+Pb5OiK0LpygMzFC7GYvgXi23yL3
 hg5V0vsqpCIUzPQGfZgtsJKKXWywcJpp6mS0scWzlXCnkL+ocxoigrLvfuNfhK7FyjTT
 5WmvLk9Dgb2y7ibpMskI585pktWKyIto9OhNIgARVAiJjj5B+YqEu8Sm49028+TG77Un
 HGFzdnwZVq+us2Z5LJ2h2c7jV8cWuHWpwc4RPZO689Hj7VEcXU4w/H7XKg2D4Q/Wj/Mn sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csdfj9hdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Cf9Rw139616;
 Mon, 6 Dec 2021 12:44:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3030.oracle.com with ESMTP id 3csc4rqj15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nW88DO8snhZEcdt3dPQzrqJnog/86gFq3XTETPupoMeVAg25ce1htIrjkYcAQ2dGjLA3CgjLo+doB1DvFH7KQXRRWKtovRAGT3QLch4tIwZnhyEHqK8Oww1CdiPmN4TuAXDpuIIclc+p8hT5eId86wsGlDXhUARRZgG3WJvI4RGnicOOWp4xYAsAjbRuGSpWOHpC/fY8L13wCwTw7Qyk8qKuh/i67jkPtA+6fHFL7LwOV/C62+n036zS70fOY39u6V98xi4esvWAReuFrl+yuWirvJjYI7rpI67/ay6+7CNflG9JYl7m6DzLjqI2p+QawiEF/SYP8PEodsKuO/DgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/+cK31eegqPIBAakeDUO/azvVEn3rKHttf+DjWWvoM=;
 b=jn81fZPTSjkg5izn+tSY6mGfiuuMWSzG97sCgY2HeFQuDSouNUJ/im8GVD3AqEfeSuDl0HXB+CdNx0pZkyj/X+rMVe6n7RfxhKQ/Q3fSIdYSdCCjp/zP9mfClhFOaT9S8Sh4U8JiBGyy3mw+Ul3FUQtfmHna4zQJqIMOTAACQSA9tw8PL7/UG7K+IedAqa4nPA5My1G7kwBoAGDLHeAM+c6o/a9EoJ/qkby2RnPYU3TLP3TYkD6+9EjR3chOgWoV20KwH+FKR3M5tugegS4S/dg7EZib2jUbbmA1jmz3ToA9tOzBwG2w2cu5xliwJuM61vxalQ29LbB9M7vBlPv2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/+cK31eegqPIBAakeDUO/azvVEn3rKHttf+DjWWvoM=;
 b=e/gTWPiF1fzq7Yp+v5IAfajPBHRT25HI4Bt7U55G+VtXotXuADeAuDBzOUsD35nZlXIxIw2PxWZdRy9XennV/lE812xJ5coT7PWlDDYxEcysIvJGR6r3CxdEnPokeHJmyo1xe+W2GreGW9/wx2fn57lZYuCOCJz4GuNPTogNFo4=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5820.namprd10.prod.outlook.com (2603:10b6:510:146::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 12:44:09 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:09 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 1/8] virtio: drop name parameter for virtio_init()
Date: Mon,  6 Dec 2021 07:43:19 -0500
Message-Id: <1638794606-19631-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::35) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.42) by
 SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36801ac0-9278-44bf-61c6-08d9b8b6190a
X-MS-TrafficTypeDiagnostic: PH0PR10MB5820:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5820D9A74F441112B09A8C66E86D9@PH0PR10MB5820.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOEyr6bM0TNcbLDeSlh9BwAp2aEcL79oAgLOghvOAfPFAWd9TkB6/pUqEcZe+x4fqt2eG1UrFwL+wQ96/oK9mbeyWflpUQe+kjXNBtFW5Wc7wNtEuLsdeeEYsKS0vSbSATtG+xOEpXHYyPxXTLblw1JIADzW2TaC56Xzn4C6Xy/yRVvIOPo5+3zoe5KUH09oBCvDGOpQfOGGUWJb/h3HLnWwDLTHGvEHT9DdsS/4rMmlsJPov32Rh/XSIrTwtBPR3mrEEAqPh89U0ip87Az0K5GGU9c8tJFiXjoir3R4S2oD2Wmr1mE1ftGg+4M3OlEs3GLCihdUCj7/t1TzNA022XtBg0/hg7bjpOBtvMhi7m9ckooVGkrEpPCG+1KLlhXe15hRrQbR39PPeYsROx7QH9Y/tngnbyGLNGEqOkm3W6+YkdWscFWF8cUkd0/yUkrpKb0eHOdMRePTN9L1irYh+rWLoQihEGqyYalkhmVNrWJrrArujzQqhb78DjJg6qubcv1e6UisRlJWsjV+NkE0MAV/uxhVRMzC1N1Tqd5zqDrfrLzte58acRU1/5AMapAOdVHT9Rde5VN5CeiLbfw1aoANRSJUjAzhtNt4ayQPWYcjzlTNRgDfVhuMW5MJVm1b8n9OqlLtq6UHBdwMIb+1HiSMUB+K4wiJ02AXhmcb4I4yIhcikb1HF81Lw6zvXDEsL5CxBV3VzSaYfvXw9YwcWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(6486002)(6916009)(508600001)(7416002)(316002)(36756003)(956004)(8936002)(4326008)(2616005)(38350700002)(38100700002)(7696005)(52116002)(26005)(186003)(6666004)(86362001)(8676002)(66476007)(5660300002)(30864003)(66556008)(2906002)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E2fN303si/k3JNEs6GN0e8kjVrjpCyN9R5x8DTvr4rWeX2f8u2uuRkCtEl2+?=
 =?us-ascii?Q?LQCh7VQzoW92uys+gcGyo/b2PQ7kAyY6iPwOicNsjIbmlmn8vE2X+XIb5OUr?=
 =?us-ascii?Q?IOMCA88SkRXdgKw2Fm85hm5ssPo17iVpdplVvQeiNU1E+qGuoytkxqb3YTwY?=
 =?us-ascii?Q?emw+Ums7PPdAlA0bKEIW/feXwkCfsJt7Q5nIuMIvU6pvy1LhQtMpqh/gSO5N?=
 =?us-ascii?Q?HW7Y0fSPEP/It8BQxQFR6vnwetTdWLjD31hnOaj6Zgb9zTvL216haBMQwnXx?=
 =?us-ascii?Q?2xI+29IbEo/uzo7iV+tiXKMqZf21VmsC37f8M9vkvSiFNiDUIrfmAlUXYzkk?=
 =?us-ascii?Q?Cp1aZ4ccGHy8Np0RFH2CUVkfjLeAaDRoU+DWhs3f+0qlDrKW9xutEKWKE7Bf?=
 =?us-ascii?Q?cp+i88U4D8xhDaJ74Kl899EpIiBd6OScM4OLVCFvK527eF2pvOboZYXGPD6/?=
 =?us-ascii?Q?yIv7z+OcwBwrdcEtgBlN2X6VUuxUvvMS7jqoXYjdviE3H3n/ZYEfOqWb/puZ?=
 =?us-ascii?Q?oNsNPWvwLqds9MIweAd7JbLYCgv74y0S0eVo0q4c9bXjLujQ4xPb6ib0DdyL?=
 =?us-ascii?Q?KYjU6XIORuB2VNsZoLAzU/G7cDyysM0xlVFGOe/7yONvpBnqLUYTLGiPPhB3?=
 =?us-ascii?Q?LDbeJoW93SIbJJjD8thw84gDHWGnxooMEeqBUJ1273uoy4nXiYbSDDA/4Uqm?=
 =?us-ascii?Q?3wimrcH6BEo83n/bqkf1zQ4xXvOnlymhPi7YD4+Jnw8zjURmhFtj+pi8Q9xo?=
 =?us-ascii?Q?un3AzVaMUD/71G36XeARg4TPbJ1vb+I8yJ+3d2OA+GtyDmwkzbxaNGriQys7?=
 =?us-ascii?Q?qtUUzSWXFbBKUO3vaDpru6S4Cm48wa7AGYKi0KLjiu+fTm9f449MBt1Rel5v?=
 =?us-ascii?Q?81zCfyDB1y0dOMVrRYnssHQGEZrO7r7XPRtzpFlUNGxO1FtTF68Hzs6SYAfm?=
 =?us-ascii?Q?KOjkzsEaD/GvrXM0HyzJP18EKqGQVNRzz+o0bQLUM3uaa45kbsgVIBQqDrZQ?=
 =?us-ascii?Q?frVsRcDLVblsxEupP4iOah/7vU95MqEMvgUGts9dXl49tnQsB1KnhPr5ch+s?=
 =?us-ascii?Q?kLiHnc3p/fkLUN1R9XzKmM1JmlrB4YK9kpjxO1VCmDTAXk+uflcLvBvRQveX?=
 =?us-ascii?Q?osB8ntYEI9T+M9AoY+4Dw29I3vfcDfBspS3Dx05ATKXZvXYbZB6ou+7vHti6?=
 =?us-ascii?Q?RmdJqv0nuMLo5lkUX6TfAcKkmuq7iExkShpdLUmszH5tAH9cjE2wkAZI2dXu?=
 =?us-ascii?Q?mYjkfbsfDXzn7+Gkwqdr9v3oL3iXKTMKvAKThzlJhmgw7gTa6HEzNcBnSjaw?=
 =?us-ascii?Q?9aiVKhcPM4MSXAW0NAHhYJOJM/e+TgKybQS8nJ2uFjCIjsR+geagMo/3ZGzj?=
 =?us-ascii?Q?1+klydkMZVVYzxABsLSUNeLgOxfyTtBoob9mmJdSOfzp9N5msWS6eJlZV+uV?=
 =?us-ascii?Q?8bfxDlGM/ziucRAbvrm+wTpBqAf9UHOHGxp+JAnf+lkGhnUtCDy/6/LLmBrj?=
 =?us-ascii?Q?YXLe38Ab7xcE4R8awJpyyTfF2UgMRMFY08BDo0O6LlJb3y4h5u4LC9g53YgY?=
 =?us-ascii?Q?ed9VbWQ1LkVJYPrrq7Oc/t94/bRX9bkiHJ+a9Yp6kIv0RLDLDqqirwLu/eRv?=
 =?us-ascii?Q?AZe2QLi2sNVtMV+QyuLbMoU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36801ac0-9278-44bf-61c6-08d9b8b6190a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:09.5525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoTiXEkgqZrfPEMOmGoIIGrkjIPCF1+OnnpFLb6oT9JpXSV32dJpFTqtmyvlcxwFMYsWD95BIwvWVt34Ql5Iyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5820
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060078
X-Proofpoint-GUID: Q4hiu--XC2AT2gbF-DKLsMIbgyUq9GUj
X-Proofpoint-ORIG-GUID: Q4hiu--XC2AT2gbF-DKLsMIbgyUq9GUj
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

This patch drops the name parameter for the virtio_init function.

The pair between the numeric device ID and the string device ID
(name) of a virtio device already exists, but not in a way that
lets us map between them.

This patch lets us do this and removes the need for the name
parameter in the virtio_init function.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/9pfs/virtio-9p-device.c                  |  2 +-
 hw/block/vhost-user-blk.c                   |  2 +-
 hw/block/virtio-blk.c                       |  2 +-
 hw/char/virtio-serial-bus.c                 |  3 +-
 hw/display/virtio-gpu-base.c                |  2 +-
 hw/input/virtio-input.c                     |  3 +-
 hw/net/virtio-net.c                         |  2 +-
 hw/scsi/virtio-scsi.c                       |  3 +-
 hw/virtio/vhost-user-fs.c                   |  3 +-
 hw/virtio/vhost-user-i2c.c                  |  7 +----
 hw/virtio/vhost-user-rng.c                  |  2 +-
 hw/virtio/vhost-user-vsock.c                |  2 +-
 hw/virtio/vhost-vsock-common.c              |  5 ++--
 hw/virtio/vhost-vsock.c                     |  2 +-
 hw/virtio/virtio-balloon.c                  |  3 +-
 hw/virtio/virtio-crypto.c                   |  2 +-
 hw/virtio/virtio-iommu.c                    |  3 +-
 hw/virtio/virtio-mem.c                      |  3 +-
 hw/virtio/virtio-pmem.c                     |  3 +-
 hw/virtio/virtio-rng.c                      |  2 +-
 hw/virtio/virtio.c                          | 44 +++++++++++++++++++++++++++--
 include/hw/virtio/vhost-vsock-common.h      |  2 +-
 include/hw/virtio/virtio-gpu.h              |  3 +-
 include/hw/virtio/virtio.h                  |  4 +--
 include/standard-headers/linux/virtio_ids.h |  1 +
 25 files changed, 67 insertions(+), 43 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b..5f522e6 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
     }
 
     v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
-    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
+    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
     v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
 }
 
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ba13cb8..f61f8c1 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -490,7 +490,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
+    virtio_init(vdev, VIRTIO_ID_BLOCK,
                 sizeof(struct virtio_blk_config));
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7..505e574 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1213,7 +1213,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     virtio_blk_set_config_size(s, s->host_features);
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
     s->rq = NULL;
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index f01ec21..9f19fd0 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1044,8 +1044,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
                             VIRTIO_CONSOLE_F_EMERG_WRITE)) {
         config_size = offsetof(struct virtio_console_config, emerg_wr);
     }
-    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
-                config_size);
+    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
 
     /* Spawn a new virtio-serial bus on which the ports will ride as devices */
     qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c8da480..5411a7b 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -170,7 +170,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     }
 
     g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
-    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
+    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
                 sizeof(struct virtio_gpu_config));
 
     if (virtio_gpu_virgl_enabled(g->conf)) {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 54bcb46..5b5398b 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState *dev, Error **errp)
     vinput->cfg_size += 8;
     assert(vinput->cfg_size <= sizeof(virtio_input_config));
 
-    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
-                vinput->cfg_size);
+    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
     vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
     vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f2014d5..b275acf 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3383,7 +3383,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     virtio_net_set_config_size(n, n->host_features);
-    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
+    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
 
     /*
      * We set a lower limit on RX queue size to what it always was.
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 51fd095..ce71939 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -972,8 +972,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
     VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
     int i;
 
-    virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
-                sizeof(VirtIOSCSIConfig));
+    virtio_init(vdev, VIRTIO_ID_SCSI, sizeof(VirtIOSCSIConfig));
 
     if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
         s->conf.num_queues = 1;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957..b875640 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
-                sizeof(struct virtio_fs_config));
+    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
 
     /* Hiprio queue */
     fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632..58fd729 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -14,11 +14,6 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
-/* Remove this once the header is updated in Linux kernel */
-#ifndef VIRTIO_ID_I2C_ADAPTER
-#define VIRTIO_ID_I2C_ADAPTER                34
-#endif
-
 static void vu_i2c_start(VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -220,7 +215,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
 
     i2c->vhost_dev.nvqs = 1;
     i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 209ee5b..08bccba 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
     if (!rng->req_vq) {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 52bd682..0f8ff99 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f37712..6146d25 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -220,12 +220,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    virtio_init(vdev, name, VIRTIO_ID_VSOCK,
-                sizeof(struct virtio_vsock_config));
+    virtio_init(vdev, VIRTIO_ID_VSOCK, sizeof(struct virtio_vsock_config));
 
     /* Receive and transmit queues belong to vhost */
     vvc->recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 478c0c9..3d4ede9 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 9a4f491..236542f 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -888,8 +888,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
     int ret;
 
-    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
-                virtio_balloon_config_size(s));
+    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
 
     ret = qemu_add_balloon_handler(virtio_balloon_to_target,
                                    virtio_balloon_stat, s);
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb..cca5237 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->config_size);
+    virtio_init(vdev, VIRTIO_ID_CRYPTO, vcrypto->config_size);
     vcrypto->curr_queues = 1;
     vcrypto->vqs = g_malloc0(sizeof(VirtIOCryptoQueue) * vcrypto->max_queues);
     for (i = 0; i < vcrypto->max_queues; i++) {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e..92c5eb7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -973,8 +973,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
-    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
-                sizeof(struct virtio_iommu_config));
+    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
 
     memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a5781..e217520 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -769,8 +769,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
                         vmem->block_size;
     vmem->bitmap = bitmap_new(vmem->bitmap_size);
 
-    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
-                sizeof(struct virtio_mem_config));
+    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
     vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
 
     host_memory_backend_set_mapped(vmem->memdev, true);
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index d1aeb90..8cbbd78 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
     }
 
     host_memory_backend_set_mapped(pmem->memdev, true);
-    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
-                sizeof(struct virtio_pmem_config));
+    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
     pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
 }
 
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index cc8e9f7..7e12fc0 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     vrng->vq = virtio_add_queue(vdev, 8, handle_input);
     vrng->quota_remaining = vrng->conf.max_bytes;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ea7c079..36eebd9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -133,6 +133,45 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+const char *virtio_device_names[] = {
+    [VIRTIO_ID_NET] = "virtio-net",
+    [VIRTIO_ID_BLOCK] = "virtio-blk",
+    [VIRTIO_ID_CONSOLE] = "virtio-serial",
+    [VIRTIO_ID_RNG] = "virtio-rng",
+    [VIRTIO_ID_BALLOON] = "virtio-balloon",
+    [VIRTIO_ID_IOMEM] = "virtio-iomem",
+    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
+    [VIRTIO_ID_SCSI] = "virtio-scsi",
+    [VIRTIO_ID_9P] = "virtio-9p",
+    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
+    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
+    [VIRTIO_ID_CAIF] = "virtio-caif",
+    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
+    [VIRTIO_ID_GPU] = "virtio-gpu",
+    [VIRTIO_ID_CLOCK] = "virtio-clk",
+    [VIRTIO_ID_INPUT] = "virtio-input",
+    [VIRTIO_ID_VSOCK] = "vhost-vsock",
+    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
+    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
+    [VIRTIO_ID_PSTORE] = "virtio-pstore",
+    [VIRTIO_ID_IOMMU] = "virtio-iommu",
+    [VIRTIO_ID_MEM] = "virtio-mem",
+    [VIRTIO_ID_SOUND] = "virtio-sound",
+    [VIRTIO_ID_FS] = "virtio-user-fs",
+    [VIRTIO_ID_PMEM] = "virtio-pmem",
+    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
+    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
+    [VIRTIO_ID_BT] = "virtio-bluetooth"
+};
+
+static const char *virtio_id_to_name(uint16_t device_id)
+{
+    assert(device_id < G_N_ELEMENTS(virtio_device_names));
+    const char *name = virtio_device_names[device_id];
+    assert(name != NULL);
+    return name;
+}
+
 /* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
@@ -3227,8 +3266,7 @@ void virtio_instance_init_common(Object *proxy_obj, void *data,
     qdev_alias_all_properties(vdev, proxy_obj);
 }
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                 uint16_t device_id, size_t config_size)
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
@@ -3257,7 +3295,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
         vdev->vq[i].host_notifier_enabled = false;
     }
 
-    vdev->name = name;
+    vdev->name = virtio_id_to_name(device_id);
     vdev->config_len = config_size;
     if (vdev->config_len) {
         vdev->config = g_malloc0(config_size);
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index d8b565b..076b7ab 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
 int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
+void vhost_vsock_common_realize(VirtIODevice *vdev);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
                                          Error **errp);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index acfba7c..ac487d2 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -22,6 +22,7 @@
 #include "sysemu/vhost-user-backend.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
@@ -37,8 +38,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
-#define VIRTIO_ID_GPU 16
-
 struct virtio_gpu_simple_resource {
     uint32_t resource_id;
     uint32_t width;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cf..81e5694 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -165,8 +165,8 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                         uint16_t device_id, size_t config_size);
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
+
 void virtio_cleanup(VirtIODevice *vdev);
 
 void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index 4fe842c..0d2af08 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -55,6 +55,7 @@
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_I2C_ADAPTER           34 /* virtio I2C adapter */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
1.8.3.1


