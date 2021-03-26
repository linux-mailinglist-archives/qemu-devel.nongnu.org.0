Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016334A127
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:49:50 +0100 (CET)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfLx-0008Rc-Aq
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHr-0003YT-6P; Fri, 26 Mar 2021 01:45:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:35078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHk-0004DL-H1; Fri, 26 Mar 2021 01:45:31 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5i6iM146298;
 Fri, 26 Mar 2021 05:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=SGOhVftNZ3loAeAiEr0UwV9tBb0hpZnIvHuaMM4XLSw=;
 b=vn+dt9UAtxFfzMJZs0/8bTBRwx5OxD0pDtBBi7fozKUOb2jiPbRFNRELvYDbRGR/wTe6
 dK314/ChGPrbKIu5zEQTKOiIE6SuxwoOL6KMLxq92GDJmyT/KhOgDR0uhk897kF70GUl
 6A740JKj/siAy8uXyuHsLqqlFg5Pcl0FVwHi8Cno5mEg0zCfyPbOEw1j2xYqo1lzWJ4m
 jffNZv9O/OKwCQL/zwE8AohmC8BActikQuOWBQ+EHfar6HfRKFHH88pWaT8S16umz/m+
 iRGhJ4dSy1F4fWY09ST6aDnewf7QmPlkQLV8iXBmPBPTVibcibPVHdQnyMku2TnzVxhm Dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 37h13e8vv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5jJEQ138174;
 Fri, 26 Mar 2021 05:45:23 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by aserp3030.oracle.com with ESMTP id 37h140yy68-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvSLwUD/FhRMwU/SuUd1LsOMhhQgvVswrJcZAarKdjhR5HE6Lhvs1yiYmOw9Ew6CIZQrRlklqFos6f1I+/3nwx3rOVucCzxIB1qAPkZAwbgiqM8VEu1X8IGPdYTz4hfIwV0RKJwa5f9obx5UafqXWvjIA2i4zOirh4jNMZBFhHBYJWajf1wvGGqNP3QEtNjiGYLVYSkZPqrrNWmP120Hs/OwOlwW4Ttgk2497OyZYUFGkpiOLBf15FMh3wrDWGZT/P8BBW+bGFNCXxjwFM4HFoA9X6tYTEPmo6kwo21cEoTHaWDUY47n/7j6hhhRt5MGOC+DKymDasXPdFLeo0TMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGOhVftNZ3loAeAiEr0UwV9tBb0hpZnIvHuaMM4XLSw=;
 b=C/yaDPHbASKxFnIqrK51Skqw0WALekWTCCm1eKM84E8oQ6zYF5A9YHggeZg1Em8EtJRtSjMRyip/01EcNsD2LDiHkeuRwdmjw9zWHDnGz5zm5KdilOh2++f8LmGkpIT/tzW4ra2x9CfbFFp24fPDoyugwWl+Wn3vgEDo+/CKFdNJSzsIhurrjJR9wMDmlP/lQgYbua8c9/rQFi9mYdo3U95j8zRuldLAb2oOD6AAL8S6PoauPNpDiiMEEPgAu0+ZNfKHDJCSGYY2H8ZdONpbhKNHUJsbhh3pyS2oG2PlmJUE3epktVki/pTrnZtRUnOLubwNjkGamacIACzZtLJ2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGOhVftNZ3loAeAiEr0UwV9tBb0hpZnIvHuaMM4XLSw=;
 b=xYWJS5CyZFpLpqpd0M2q16l0ltsckMgNcPo07IJDLfmY6iw8QnPvLczZ9XVv6R8YwBqk0i9b5rErAR/KO2FBeVJBqdY0Ujp2NN2DVSptvumvRPoWGthKXBp4ZVZ2zqyAZLKI/XRRkSU+B0eK+vosITo3+NkqGOPd19msVj/hky4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB3068.namprd10.prod.outlook.com (2603:10b6:5:6a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26; Fri, 26 Mar 2021 05:45:06 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7%6]) with mapi id 15.20.3846.054; Fri, 26 Mar 2021
 05:45:06 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/6] virtio-blk-pci: implement device event interface for
 kick/call
Date: Thu, 25 Mar 2021 22:44:30 -0700
Message-Id: <20210326054433.11762-4-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326054433.11762-1-dongli.zhang@oracle.com>
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To DM6PR10MB2668.namprd10.prod.outlook.com
 (2603:10b6:5:b2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR02CA0053.namprd02.prod.outlook.com (2603:10b6:a03:54::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 05:45:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a986a158-89a5-4043-a829-08d8f01a4f66
X-MS-TrafficTypeDiagnostic: DM6PR10MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB306852F2199FD2E72A5A2079F0619@DM6PR10MB3068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJ6aTVm2FIgz5dGSNS3UouecdmBOoM/Qi+oQtZ3EVv2RuGyuOTDGpuYyE43YojlDX8qdDuTJhxbnNaViMVKd5lDSP/u1CeFtcV3OV3IgHfkHDuKh8zpd1VAF3eOSi2pc5igTL5EWcyED5mERBxgwsI7ptuzW3w8WAt+hhhPBifimOkj4s1JFL1an+t/qnt5ahTFyztihx//91FsXHlGJ/vcSmRP394Z5/SZvHrNHMvTEjrhsA9r1JdOx8sFyc4zOzYs5iQchS5x4W3eYZX7VohUQ13TsXlgc7IftzNmPH+A/dk0hWyXpyprq53iLM41yHvwg2zWWjeTHZivNRoZRVbre92HtkQbOMSfLARc3IpiS158kbqkjJt5KZ/CUHhp0pdP468NUfUDSkP1PTC2DLBLclODXwOxheCEeZkhsLXHW7mA5XdeFi0vued6/zkiBKTA5B+MMpk4t2w+9XGraLPH6ZMVUg5jR9RCXcUOevUGpuP9bVW0FU6XnOLpFDOSRMRHPVA3eEB8sTL5E2CGvZLrFYuLDkxcZPzoFzZ/aCgfnk5I4Xqe+1zvi1RJbqxNqAj3tHszbU/3fQQC0RlawxN8RzneSE1lx7G9JYO3wohXGYHX2X84A4qMSGPz3T9WjI7enunc6kMpAykeTpwOP5z2cB6w/n/sESHi6LY0t3wNyhiN/3SdFBMljFk50QEIT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(26005)(8936002)(956004)(8676002)(36756003)(44832011)(6666004)(16526019)(2616005)(83380400001)(7416002)(6506007)(186003)(6486002)(478600001)(5660300002)(52116002)(69590400012)(66556008)(38100700001)(1076003)(4326008)(66476007)(6512007)(66946007)(316002)(107886003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dAGcrILfy6Nc5D6bK9kfzHgbniqlII8Nx7Gdu4wMsSKw2UuminHGKpuIdmNz?=
 =?us-ascii?Q?r0hg84kkrUzbFUik1/u4iDVMfhos/EhULK+0d7RTFYFJorr5zvXLLjUthjc8?=
 =?us-ascii?Q?2MdC9A0NR/SJ1wRQo1whUNJnJ4FKl3ZlLjH92CnlhmfhIDogihbKluPc56yG?=
 =?us-ascii?Q?ZOlzzq89+fVsjAlgfH5UUYZTNgEok7S5/sc75Jv4MwWcoR25tBoKmxYTmblF?=
 =?us-ascii?Q?Rmr6/aMVhC6Z5A2tROksMIJdU1N2mN9eW+BQT2ImPv7pLtKALlqOpwwMtjvC?=
 =?us-ascii?Q?pU0D2t4MV9FXeijG0mviRrspeq0MDJGQ89qXtBHN0DfG2Pj4CNXgexvvxkGO?=
 =?us-ascii?Q?ej1q5ezuoEqxRbIISt6w5/eMotkOAyQWHqXMTu9eNSupDJJ3pXWcyiVJq6gj?=
 =?us-ascii?Q?VtqRcwq4A/XcN+DT91b9XGOiTl3My2+ONi5AeceI4UkCmMU2Fq9rehv/Txcy?=
 =?us-ascii?Q?tsCTsZ4VKMUhmP/Dw2sMoZNwitq3tsBSfGxUCziJB7bwuLkE7OOKoo4C/iOP?=
 =?us-ascii?Q?LdJbDGYY89H7qdx10We75N9oKD/W/cGo/alOIERl4FbSkk5rp6+N14q38bkt?=
 =?us-ascii?Q?b9ZnySa70UZgrX/L0TKQAdc+jsInQYMeEWQ7O2KJQCbHdAr2EpHAZuOW4pMI?=
 =?us-ascii?Q?qGFgfyHLIjJRS3OdtqcKSM9DdgZ56L4iJWlvzfuKBVo+fPMpNegQ1o4EiRD2?=
 =?us-ascii?Q?GxVmtPhg7JHtmTPxh3n3/cWD1edz6jHWmIfBABsDCJAhIkharEE5FuJdXEH5?=
 =?us-ascii?Q?vH7aR63b0c+w2TwhcqQPiy/aGMahTEMIp5SdY+Xld563cIX3GpFNMT70jafT?=
 =?us-ascii?Q?J/f6adiGhYrAJK2YqMdhyiep8KKep0G4Uw+5ns7pvKkZGCpCruzZPjp73ZaT?=
 =?us-ascii?Q?3eh2Czm7oM8ESGHQftGWWn2sHx4KLwAM9JbqVr1wq0gggX4+VhNOOm1NyNyE?=
 =?us-ascii?Q?/wkg8hJKDegfT9P32NF543fSwE1TMDuE57ZmuHs3Ur/75+M38T4Uc8XqJdcM?=
 =?us-ascii?Q?GYIP1cI9QGfwbMzmrq2JxtckRgdKNIRLCPeMUsONNR1LOG0RaY+EXqD1WkD9?=
 =?us-ascii?Q?zse67trm8cENancFy5QEXwbBoOdh4wMQYsN+yyduTtueebHho8DEM5R1ENTu?=
 =?us-ascii?Q?oRCi+UC0PzaUH1GxbUR2NTRbXq7mWjRqUO+VYadjFe/yj9WrsfQzprBSTgzb?=
 =?us-ascii?Q?qG/it1tzZx0JzFQl78FevJi4pdpJDeKVxXUVq7/kB6RC4FObK8YhVwIh6rhF?=
 =?us-ascii?Q?qZZi6+MikQWs1cug78Eda0m1ZNNRCilwG3Y9xx231QIXPLjZ5oCkW27g7qIJ?=
 =?us-ascii?Q?zwmnpr30yBJIituKmkYeKO8c?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a986a158-89a5-4043-a829-08d8f01a4f66
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 05:45:06.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vFxNWfvNZTzz6jk8AUtz8I9rFlIsV/mRJmNS//IU6Bk805+GzOg883w5/NM22UVQ1aneFAVHRMEq+aqOLnGFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260041
X-Proofpoint-ORIG-GUID: PVedBoFQArs7i7SZtAo31SKDIyp4QIJ_
X-Proofpoint-GUID: PVedBoFQArs7i7SZtAo31SKDIyp4QIJ_
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260041
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=dongli.zhang@oracle.com; helo=userp2120.oracle.com
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com, armbru@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is to implement the device event interface for virtio-blk-pci.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/block/virtio-blk.c          |  9 +++++++++
 hw/virtio/virtio-blk-pci.c     | 10 ++++++++++
 include/hw/virtio/virtio-blk.h |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index d28979efb8..2b3583a913 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1118,6 +1118,15 @@ static int virtio_blk_load_device(VirtIODevice *vdev, QEMUFile *f,
     return 0;
 }
 
+void virtio_blk_device_event(DeviceState *dev, int event, int queue,
+                             Error **errp)
+{
+    VirtIOBlock *s = VIRTIO_BLK(dev);
+    bool irqfd = s->dataplane_started && !s->dataplane_disabled;
+
+    virtio_device_event(dev, event, queue, irqfd, errp);
+}
+
 static void virtio_resize_cb(void *opaque)
 {
     VirtIODevice *vdev = opaque;
diff --git a/hw/virtio/virtio-blk-pci.c b/hw/virtio/virtio-blk-pci.c
index 9d5795810c..f1fc72e7f1 100644
--- a/hw/virtio/virtio-blk-pci.c
+++ b/hw/virtio/virtio-blk-pci.c
@@ -47,6 +47,15 @@ static Property virtio_blk_pci_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void virtio_blk_pci_event(DeviceState *dev, int event, int queue,
+                                 Error **errp)
+{
+    VirtIOBlkPCI *vblk = VIRTIO_BLK_PCI(dev);
+    DeviceState *vdev = DEVICE(&vblk->vdev);
+
+    virtio_blk_device_event(vdev, event, queue, errp);
+}
+
 static void virtio_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOBlkPCI *dev = VIRTIO_BLK_PCI(vpci_dev);
@@ -72,6 +81,7 @@ static void virtio_blk_pci_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     device_class_set_props(dc, virtio_blk_pci_properties);
+    dc->event = virtio_blk_pci_event;
     k->realize = virtio_blk_pci_realize;
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BLOCK;
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 29655a406d..500be01dff 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -92,5 +92,7 @@ typedef struct MultiReqBuffer {
 
 bool virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh);
+void virtio_blk_device_event(DeviceState *dev, int event, int queue,
+                             Error **errp);
 
 #endif
-- 
2.17.1


