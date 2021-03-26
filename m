Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C23E34A126
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:48:08 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfKJ-0005rE-AB
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHr-0003Yd-AI; Fri, 26 Mar 2021 01:45:35 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:35364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHm-0004EM-Fo; Fri, 26 Mar 2021 01:45:35 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5iMUT164902;
 Fri, 26 Mar 2021 05:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=zGRRMfIHZbgrQm9YJE1RREplBXoXmYnQ8wXownCZOiA=;
 b=Lb2F44VbhiOZlgW1aKOv3XMGuBLY26sYN5e8S95WZzlX/qfpCyhv6k9B3zVwbu8nNa+b
 ZQPZYvaCqMWyS0d4GlY0pVxvgbaaG6gAnE6rF/BmjBlqhqEbXz1z3894gY4113Z3Zrry
 uvChEYyOdvSW87N/67LZ+OXtk27I1XsBtF2R6ih9g37Lva6lT8CCC5G6OJwBmgc3B3pr
 h+n0DKWxO0y7JhogpWb6+LbGIUjkS0iEcPW5gaX5kPC1+TGbAFmJW6eXLfSj0GAkbg6b
 t3AsvW26YR6rGlw6i10/BP/v5Jp0JwwRcnZRYdH6MgdkwkGXdKQwBBU02075+Gugzxmt VA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37h13hrvnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5jJES138174;
 Fri, 26 Mar 2021 05:45:23 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by aserp3030.oracle.com with ESMTP id 37h140yy68-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvDbH/UB7vj5lNXCMVps+GDgWON+tN7bMoccvOWQftaUKPTPyJXeverbPSdDToTsUkb0jUO6Zfy1aWb9mb0FlrWnxT5I9AN1v9hTDc5V7jelanAWr9kBl3r3YLl7uI2WlikU7Inp7zpKwU3Dhu2jcBx7VX7rKmWdKzzrPyHJBe2e/Cx8HVj5AuMxS31aGvRx8+QQq9ufR/8ushP5MU9CH4XDRWgplIDRcUaqdZusHTuQG7u3vj87jvu5hjp5yyqyFsYM5hlnyymiPCoVnMmWbJ07WhsqnbN4j/j84757bwGwEl+YYXVXjWdJO4+UUur+DJWwqV3NzyUB0b+Crwgdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGRRMfIHZbgrQm9YJE1RREplBXoXmYnQ8wXownCZOiA=;
 b=FIm5Wm4J7vRYUxTz7aVqA6Qh0zcJrKWCpYO2N3WmmWQBOJ1BkfBrcOOiC+iENlP3+eEW66/B+mBEkFmegeKpRq4CgnoRED1/Cn09nPA+g0eZ/D80pGBIjVhx2RXu4uvhQ0LAcuFVE7oOoJPJB60xI+1kZtlyggu9Gfy8enmWlKYbOHHEcwT02X9O7giQym356e24Ya/gBFyv7ASdFDYuM0IRPWsBCqsRB6y5SWk36CvYgaWe+q+WSyE6d2VRtm/BnX1SbdrF6oQrRWH6hoKBvAi1niWd7neHcqgoJkLc3/Ac1hdPdIeOJbJhFHro8WsVX9D8MfRmYU6ZZgLHL2Bz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGRRMfIHZbgrQm9YJE1RREplBXoXmYnQ8wXownCZOiA=;
 b=zF4zVZjkaZDikOzsNRDrRV2JqtNgjsR3/G4K6OBhBa7eyrcYIxyzOYjawle7ZekIV3PNpZ75xg9cI3mYnpR1YTT6vIzwz/OIZi/d5dnhafUmEm004nIHwdQkwfd1lzBdBoi1FZ/waiCp4ddm+luefcDc1ZULl6fQqe3N0gMDA7o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB3068.namprd10.prod.outlook.com (2603:10b6:5:6a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26; Fri, 26 Mar 2021 05:45:08 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7%6]) with mapi id 15.20.3846.054; Fri, 26 Mar 2021
 05:45:08 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 4/6] virtio-scsi-pci: implement device event interface for
 kick/call
Date: Thu, 25 Mar 2021 22:44:31 -0700
Message-Id: <20210326054433.11762-5-dongli.zhang@oracle.com>
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
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 05:45:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 326416d9-6773-4864-4349-08d8f01a5027
X-MS-TrafficTypeDiagnostic: DM6PR10MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3068490419410E8FC05A9D3AF0619@DM6PR10MB3068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:241;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgLuEUCUc2/zb0ZEM3IZ3GRyU7W09d1gLAA4u3Ho0Kbmi6uH79QkJCTLY9Dpxn7/yqjvHWa+0SbZy/7pUhLE5XRjtLYQzNkwgvEp4/OtI8vK6POyA4QXRqJPddyAEXBiEFOjBcNqjmRDjlaGd6wtUluXqbEDDu0P3u7H5PjNtB/9Xv+j0BbmqLWQ8nynRcqAXDeyvz4IZjzEBfxJ9wK9RadwdzB6shi1/QOvbdTaUUP+1+G1Y2kml0CKXUGh2APyWMtYloe/ENwMXh96TiSFUSNbeh3WibuMbeWp9ltoJqlC92w03HxcVFIb8LDB1bdO22nQnHXUg+r8nYP88czQTCD4eD4rN2MUWv7QQ2HCey5FXERkaEUkFAOwwF6mfyKX4Lqi1Kz7VpT87b4XkQjOQRiXWN2GZuEm1bw3iMsLIMeo7HZA2obcj8MktfLAeruG5BW8usnoAA84XyddKptJ6vms2q4BJI30fkMdPlvmtzJtPS7aEeuww+nZsLopjeT7QrhMeQsZ7Q0wqe81ioBMdgejpFOzy1I9xWMUy+JpfOp3VR4QzgH80qWr1PmbyUVaWn8Qayx7AMOEikkR5OM8oh9BnwTKc2e4BPUQfc7NBLvgKedZVjRFa9Rqt3RkDxvsW5VdDlLy5OXH/qviPUSU5IVUtceXu1LSvq5suDnXEhPsIJkeGHu4AyRWazLPgwu4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(26005)(8936002)(956004)(8676002)(36756003)(44832011)(6666004)(16526019)(2616005)(83380400001)(7416002)(6506007)(186003)(6486002)(478600001)(5660300002)(52116002)(69590400012)(66556008)(38100700001)(1076003)(4326008)(66476007)(6512007)(66946007)(316002)(107886003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gMen1FSWDiazDACRyzA0pkVlcgrVa+DMMl1n/5qSxhZQrvBfm2izYXfiTAk/?=
 =?us-ascii?Q?woHWpxLBcEMlRJEFM7XDS8ROukjQmmzHVV79hkiCWMTHTpuMWPvYgs9nEkNA?=
 =?us-ascii?Q?zGIRjc35puyqSHONbYuxjo3xdPpOHP+Ljm2DdnkfAEq5Pq7I1PAdZGYjoz+Y?=
 =?us-ascii?Q?Km7UZUW2pucNEHsoSp9xVwDywMM3srCS3kwGywLDdZsR9wEDmFNJYnG5Zu+4?=
 =?us-ascii?Q?ebfhJ5rzk3qBYBZHlBj+FjIIQIACE756CPhJDLB8bWYqrAh7uwPe7Gt13P7i?=
 =?us-ascii?Q?BffQVt5xiUvhQCmYjG0N4ED9yXxr040vQoS2NLGkho/zZHKEoVBnHoVyHhj0?=
 =?us-ascii?Q?fpaiJBpq4k2jZgD6Bu9IZ0dF5Q7Gx36CZsQzMNp2+MM3FxpEjOEt2FgF+PVF?=
 =?us-ascii?Q?pUqRpv/jIOAJns5H8W+zs95Icqvrz3VRViiKGzSMQh7SJ60acuddoNM/9YHu?=
 =?us-ascii?Q?Rm400Kc1DDI72SGdTh1sYHRtavpeIU8/dAHYlIgrhraSik0Qh4HMYsmgQbcv?=
 =?us-ascii?Q?nUS7+CSsfpXDHw+laS3lMO5horQLERTquctshIRRZxAX4STl+BeLjAOZX2Cx?=
 =?us-ascii?Q?1MJVaa9mqpqlchlR7b/jRvxO0elJfYFT1J1lZBEkQUd3TXWSmxrgCGOnjnJF?=
 =?us-ascii?Q?KvDN8RVniqhyraTcU184vGo8mmNdF7d9J/LSxapJ5Ppw3eo11pM0Aeno5yfk?=
 =?us-ascii?Q?wrWWDrBBN1DnfbMKhGSoZ/2pA4g608KQMrfgJeZMYW7q0aRNJOtyP+zhqOTQ?=
 =?us-ascii?Q?3zC5lYWuswcIiM5GT5uVELcC6nTQJNcFfvjj7LnuvKGGWDgQGMsiV6NWFn4H?=
 =?us-ascii?Q?zuv4z/q2cpzbUSMX5ztylqYbv9oWTlCvecvEHLg63DhaoV0nDkdunp50XPwB?=
 =?us-ascii?Q?+anmgl7Vc6FyHYYhvyHse9VQTWFh0De2/TbHpbTbKEu56D8/54rFide3XN87?=
 =?us-ascii?Q?XjjIFmPVd9FXi/oR6iHiIM13wXStirFFAs/8ePLR4HG8QIz3m7BqNi1rh0G6?=
 =?us-ascii?Q?cJcpzmGU6WY4EXQPFSaDq45imhUzGY1cg4NpvysQqiQd/otJHt0V0uwe5nFC?=
 =?us-ascii?Q?SJYRi0criL8+LrAVn3EsuGR6OyrP/QWIL1Yd69kao6uzrUfCPoCIjNniWu4i?=
 =?us-ascii?Q?kDuDWkLQdEKTXZW9QgnlKwaetfICT3P/G3g1D28M3/wdAWpgDwZL5mRdeVjx?=
 =?us-ascii?Q?Y+u21OJsuv5hF9H1gNoc63Lt+k6wLRr8dbaHIZG8fV6lR/QZsuob/AQxLREJ?=
 =?us-ascii?Q?qRdeJQMGuIAooAbXR+ITxhQcaIjjcrPjNRM5ZpGymKgcBqQ1a1BqXHPAWc7K?=
 =?us-ascii?Q?EWfg8AaOYomjYl9lOzsY1jae?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326416d9-6773-4864-4349-08d8f01a5027
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 05:45:07.9010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sH7/BpMYxii+aRyUOJSBhf6bU8+hrzrgerK0Tya7fs5n75PHJ1/W/W69SlxvP5RUz0LLHaOYo1oUVigtgZr0pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260041
X-Proofpoint-GUID: XeFow2WbMaiuEFAvPKiDDj_vNZoNazAc
X-Proofpoint-ORIG-GUID: XeFow2WbMaiuEFAvPKiDDj_vNZoNazAc
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260041
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is to implement the device event interface for virtio-scsi-pci.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/scsi/virtio-scsi.c           |  9 +++++++++
 hw/virtio/virtio-scsi-pci.c     | 10 ++++++++++
 include/hw/virtio/virtio-scsi.h |  3 +++
 3 files changed, 22 insertions(+)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 6d80730287..f437ed1a81 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -962,6 +962,15 @@ static struct SCSIBusInfo virtio_scsi_scsi_info = {
     .load_request = virtio_scsi_load_request,
 };
 
+void virtio_scsi_device_event(DeviceState *dev, int event, int queue,
+                              Error **errp)
+{
+    VirtIOSCSI *s = VIRTIO_SCSI(dev);
+    bool irqfd = s->dataplane_started && !s->dataplane_fenced;
+
+    virtio_device_event(dev, event, queue, irqfd, errp);
+}
+
 void virtio_scsi_common_realize(DeviceState *dev,
                                 VirtIOHandleOutput ctrl,
                                 VirtIOHandleOutput evt,
diff --git a/hw/virtio/virtio-scsi-pci.c b/hw/virtio/virtio-scsi-pci.c
index 97fab74236..d5db743692 100644
--- a/hw/virtio/virtio-scsi-pci.c
+++ b/hw/virtio/virtio-scsi-pci.c
@@ -43,6 +43,15 @@ static Property virtio_scsi_pci_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void virtio_scsi_pci_event(DeviceState *dev, int event, int queue,
+                                  Error **errp)
+{
+    VirtIOSCSIPCI *vscsi = VIRTIO_SCSI_PCI(dev);
+    DeviceState *vdev = DEVICE(&vscsi->vdev);
+
+    virtio_scsi_device_event(vdev, event, queue, errp);
+}
+
 static void virtio_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOSCSIPCI *dev = VIRTIO_SCSI_PCI(vpci_dev);
@@ -82,6 +91,7 @@ static void virtio_scsi_pci_class_init(ObjectClass *klass, void *data)
     k->realize = virtio_scsi_pci_realize;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     device_class_set_props(dc, virtio_scsi_pci_properties);
+    dc->event = virtio_scsi_pci_event;
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_SCSI;
     pcidev_k->revision = 0x00;
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 543681bc18..d1fff0eeac 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -163,4 +163,7 @@ void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp);
 int virtio_scsi_dataplane_start(VirtIODevice *s);
 void virtio_scsi_dataplane_stop(VirtIODevice *s);
 
+void virtio_scsi_device_event(DeviceState *dev, int event, int queue,
+                              Error **errp);
+
 #endif /* QEMU_VIRTIO_SCSI_H */
-- 
2.17.1


