Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002A04B0AA7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:32:59 +0100 (CET)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6l1-0008SD-0H
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bp-0000cN-7O; Thu, 10 Feb 2022 05:23:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bm-0000up-Gi; Thu, 10 Feb 2022 05:23:28 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A8WDAH013360; 
 Thu, 10 Feb 2022 10:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=dGSfCYH+VYBX/QzCjdnWhzqW7H0CrTTINipkr/xichA=;
 b=l5gY+OJ4BCZm8A39Sfn4aK3CXpY+l0Gt6cejmt4zBM1gF0Z92NTRAFqmKkRNMFgFgK++
 H5va1XnbsioQ0YFGxqHql8ibPbrygaoRfFZ2K3J1aymY1Zj5vcRpU9H7T9oNk1kAD44Y
 S4rQqv1GRkRRNK+ma7SQABLi0tCT0hfeHjwcwBzy8ueT2zLwRXyLibsI8zMkXCJuJKYb
 PRzpy/OyE3PIsGA+xOsYwHwIlLTnqQ9RodOFNcoIez8y+O0zSiNOqVPN9+W7e5k+5jee
 FC1XZB/sx7aeNko2JQ2eIkObPKou/F+Kkgq8xF2kx4UGvX3oWLLxgG6pnF6ariN7BQRc 9Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e368u0q6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AABeuX191948;
 Thu, 10 Feb 2022 10:23:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3020.oracle.com with ESMTP id 3e1h29x6y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:23:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibtv1MimYBNz01K1XIs+ozFFhOtACUzbfPrta7/GGdUFG471dMnVkzGFXvXXbYvHH8pD7xEMoOV84iNA8MduSptieO5FTNPQHmnl3xTbZMuEvzcLszDRXQkOQrWPvpe5RpaH8dgliRjsqdRqAM0fKHJjf8/My7D9MJ0tk7t/jpd4P8gjsIqOjF0UPk4b2xa9DXF1sWhQbwhJZA5g/OU08WyXDVYI8lJCMaOJjm1ubex+GREqvgHsO+BURe9v4UmxRyHyjpO8GjIj20xZpIJIySjISoUbH7Oqw1VXN4SlSwKwG9mXYjfdZ+NWl1CUpWoqutRMZvhWI6NfojLlm57Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGSfCYH+VYBX/QzCjdnWhzqW7H0CrTTINipkr/xichA=;
 b=AqbLtn107pAcBLKfWA57ZPxGRQG1aTBkl+Ujkq2ipYS1Y0a0mnY37AGfdd2nVCNaT7uk+TwFTBUbRbJOgErm19yJLkkiL/Ii/jAJnMEejxx4xlwkfjhcULgioUEfxZT0g1TYSSofelN0eqy91gAa3KyyLR3r7oirzn9WhmdKv7scItkS5bhExpKV4aVm9eqjRtFqMT45ix9SNjEUfsjp2YkH7+6MTA4LRzHNoj++XvkFRHjjfGQI2Mhw2sv/+JVg73Cg4N8ORpa/dCd5cn90DbWC4Qx5VYTzQzpIStopc6Ij1H7w8TebOZSqW9iBx7IlqUxGApOLiqhhWs0T41lONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGSfCYH+VYBX/QzCjdnWhzqW7H0CrTTINipkr/xichA=;
 b=DRhATZrgUa5BTMJyo+e8iSmeIrb0Pqpz6UdJVO/CtAO1DCxDkY8MxYv0oqENhkZASZxiS+mlbcHLR/Vso31n++9BZBHgytrHMR1MzUWWSH9rvP8p4SjsDuvzTzU8430PDI35zX8cQsRnkMbTWfvOcpfnqccNLsp7kIcSXW1tWsI=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB3513.namprd10.prod.outlook.com (2603:10b6:5:17b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 10:23:08 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:23:08 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Thu, 10 Feb 2022 05:21:58 -0500
Message-Id: <1644488520-21604-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a92304-7eef-4870-035e-08d9ec7f54e7
X-MS-TrafficTypeDiagnostic: DM6PR10MB3513:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB35130FDAE9BBA61491A7353AE82F9@DM6PR10MB3513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NtOSeIoxY68MhGWAZ6Znrr7f7h25jkw/OYdVv7xg/z2W7lDxKMoGbCt+xktIiy8aHWbQmU8p8ambFzc6bojPK46dIkuXUd/TrNXx6ysg4wk9DKC2QAYCc8XP1H/eRukgPRCallhVWt/Tsnz04nSKO6XpRj6eSl1vewXQ+lX3+m3Dbgf+Dgr5pZBzD47B1CKRiTJ4r8o9ZkngOLWyaQfteoG35OyRoodi/7sqQRprJnIZEThA3HEvkwD9F9TCLtjRnVYCuzHeRQtfGBhMFcdNKlnjsTHRx7W/+HWzQxPVucmsJlglWScuXf4vKSifkjGifLVcD5efgeNPAeOoK3CWXSscWfW5jkrN2aUlKBJB30Vnq5WyRHJrqqNF5ovAIWYTC82oMch2xjlhLnat5qTNqMHUyy8I6xqEUcUWGQgnZT2jHgXCDZbjpp8FXSQm+DAVHh3hnM8CqSDRuTPQOREcVnXKgserBU/EN8wDbQ5wHUPRwEFWiUrDIHidZdreJNXhn46UPu6VIO6d3lIWLFuQV+9ITubsvUZgGJA+ccGLuhcob3HfviT1/5rd0tAimij22J1iyBw/2NfWW66kY+K17cVQyvsH9AjOXB9VDW+5vsxyViME36cD7uSPb3kDtJKiml/igaYsdsngNv8g0HXNFmvsMs7j6GrjnS+puklfLPuV/FRYPS6EVaouFGuWkjPA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(6666004)(508600001)(30864003)(44832011)(86362001)(8936002)(8676002)(66476007)(66556008)(66946007)(6486002)(7416002)(5660300002)(316002)(6506007)(38350700002)(2616005)(36756003)(38100700002)(6512007)(52116002)(186003)(6916009)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MsJlkTQZfApvBa5W4bNkaVoRt3PWGaaamJLbZhylEpNY8AGUW+L+yBG78S76?=
 =?us-ascii?Q?d7+UgbTAAvgVwZhqRn810pkrH+NwzQl0aH3Fn4r7SiSV5C2pyABjlAm+LrHj?=
 =?us-ascii?Q?WuQiSbxUHDxfnSVDq8fvI2Iu7uocrddC5te+6b0/kQwotNnQGKMYsAvxeiSW?=
 =?us-ascii?Q?SkqHy7PdqALbzgklknvm15t0cJl+4RkLRTNjGA02pUNYPOM2v5CRjW7GDu9Q?=
 =?us-ascii?Q?165Gu58neMVr4OxMe82+4ewcHFqgXTQE5cbEWuL/9U7OcollomQJJ10r+rLz?=
 =?us-ascii?Q?tgpKtO/PT14PU4W4eiUUNGjM++xHrDjmf+OCa235sTho1GVTfZf0pba5xe2C?=
 =?us-ascii?Q?xv4jJ9dhLhMfo5zdNVDrsOpAzZO9WAVM+uPIrE3OV86odOZYmw/LPPp1LuFT?=
 =?us-ascii?Q?WGfebvyZZJRaxUsF9J7XNRX9dHQe0lfXFt1JZxbPuPCDcuuThZUT78bzD42/?=
 =?us-ascii?Q?vcvoC9E4+fkCoLGa1XD6dZcyx0UssSQD0c0mT2YJCoj/TZJcXjwXq1qTuqjC?=
 =?us-ascii?Q?JjKZQC7KYYPjVwTzMrlLslKilBiEEr0k06f/l6PEiw/14wbeD3ZXz73Cv2FB?=
 =?us-ascii?Q?giKPDXbpy/H73YVlQoPjOP5p6+sYj7BrZsDT3K7wj+umpwQUzLvCJsnwga/D?=
 =?us-ascii?Q?8sPzX/KXW5lb5+o0rnj6DEVpKIXKERsJr6U8qsLrNBEZIOiI8PcR6v/FLpFE?=
 =?us-ascii?Q?fUrIWD9FA3f3inwpxoYRydSS1PdPhtvZ4/XLWXy8kyGTVBSsHBYp5kHdYInh?=
 =?us-ascii?Q?7Kq5mVNaS4iIOibf+ONXNF+CSZyoxdQtVd4QqmXfzQ9cHd2yNg+eUBMGLptW?=
 =?us-ascii?Q?CxB/FSkZL2eEUFXdKSyVwm7gyU6MrIMjI9V8w87ArpjePEGW/xRB+AEP10ak?=
 =?us-ascii?Q?lYtDBJzK1Grl5+uzHCoEeTCnt/k5ojDsF6pv9eBTKtjhJ+Tjza6M7NOTfDrn?=
 =?us-ascii?Q?vwG5C4b5WLOax9X2P4umF8ib7jMZ3Hm+xzqA0j2THoX9YIw8S+qm582RCpRj?=
 =?us-ascii?Q?Iob0aTM00mvvlTIHcjoeKmirqdxIDVNGZPpqjuqRhYaGMmMJTHcqd7N7MRqh?=
 =?us-ascii?Q?W5KRejTMYSJpea5JjxZyWClRAvK4dSRsqF279t3CUv8aBq+0mTxkOPdF1um4?=
 =?us-ascii?Q?kD/N/14yp0Yr7fOfI6zj3P+YLWQUe4504oB4vOFUSnanOL9Ff6WazmNzd55j?=
 =?us-ascii?Q?91t3g1JHg9V5i0q+IduCXznRcUoJpm9spRSjOs8kJrkSIh0NUWjoP2uFkuD/?=
 =?us-ascii?Q?NBqa7Pet37MCxW9KGhp5GkRsCU5rFd41lI1/dVUu5G0ebr5Qj3uf8wp7phQr?=
 =?us-ascii?Q?pFdr7kVtPhUCgzQGx+QPVpXfd6gEmhRWIcek/ajrsWpJLPK9YlqqRK1TI1mx?=
 =?us-ascii?Q?Oy7bUUb/t5m9AESeaLm5j/pQO+iYFPJj98TjSLSBNlZg6HIHneeJFMmMKgmR?=
 =?us-ascii?Q?DuDQkbNUCH2DctbrDIECi+SpHk83q9MwVpq4P4oaMJ86XIxv790fhNAK59DH?=
 =?us-ascii?Q?Ig2sVHyOR/knKchNPcavW1Feqj6ZKfh0KadPCu3B6AVHDHj8+zjZ1MAKfvbP?=
 =?us-ascii?Q?I8WTjtqLyS0a7mL1xrp0AwbiU5lOlR0FHPzodzCTnlO94ply5ZZCwJq8e4y5?=
 =?us-ascii?Q?iC0I4XH5G75kvMkG5jy2t0k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a92304-7eef-4870-035e-08d9ec7f54e7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:23:08.0638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbpA1F5+jgxGar98Ql1lJstw3h8efpx9stcdusSb7pSWmstVPYGU7B2QJsn3f/909TUd3V/m7nE5/JlIGWK9qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-ORIG-GUID: -DmHoiEWd5VdLFlLgqoE1M5CH_MsKM9Z
X-Proofpoint-GUID: -DmHoiEWd5VdLFlLgqoE1M5CH_MsKM9Z
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

From: Laurent Vivier <lvivier@redhat.com>

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++++++
 qapi/virtio.json        | 252 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 0b432e8..13e5f93 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 41823cd..c81210b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4313,6 +4313,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
+    status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
+    status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        /* check if vq index exists for vhost as well  */
+        if (queue >= hdev->vq_index && queue < hdev->vq_index + hdev->nvqs) {
+            status->has_last_avail_idx = true;
+
+            int vhost_vq_index =
+                hdev->vhost_ops->vhost_get_vq_index(hdev, queue);
+            struct vhost_vring_state state = {
+                .index = vhost_vq_index,
+            };
+
+            status->last_avail_idx =
+                hdev->vhost_ops->vhost_get_vring_base(hdev, &state);
+        }
+    } else {
+        status->has_shadow_avail_idx = true;
+        status->has_last_avail_idx = true;
+        status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+        status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 474a8bd..44cc05c 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -404,3 +404,255 @@
   'data': { 'transports': [ 'str' ],
             '*dev-features': [ 'str' ],
             '*unknown-dev-features': 'uint64' } }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# the VirtQueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc (descriptor area)
+#
+# @vring-avail: VirtQueue vring.avail (driver area)
+#
+# @vring-used: VirtQueue vring.used (device area)
+#
+# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
+#                  vhost_get_vring_base (if vhost active)
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid flag
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': { 'name': 'str',
+            'queue-index': 'uint16',
+            'inuse': 'uint32',
+            'vring-num': 'uint32',
+            'vring-num-default': 'uint32',
+            'vring-align': 'uint32',
+            'vring-desc': 'uint64',
+            'vring-avail': 'uint64',
+            'vring-used': 'uint64',
+            '*last-avail-idx': 'uint16',
+            '*shadow-avail-idx': 'uint16',
+            'used-idx': 'uint16',
+            'signalled-used': 'uint16',
+            'signalled-used-valid': 'bool' } }
+
+##
+# @x-query-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice's VirtQueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device and
+#        the VirtIODevice VirtQueue index (queue) does not exist for
+#        the corresponding vhost device vhost_virtqueue. Also,
+#        shadow_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device.
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get VirtQueueStatus for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5217370112,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5217372160,
+#            "queue-index": 1,
+#            "last-avail-idx": 0,
+#            "vring-used": 5217372480,
+#            "used-idx": 0,
+#            "name": "vhost-vsock",
+#            "vring-num": 128 }
+#    }
+#
+# 2. Get VirtQueueStatus for virtio-serial (no vhost)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                     "queue": 20 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5182074880,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5182076928,
+#            "queue-index": 20,
+#            "last-avail-idx": 0,
+#            "vring-used": 5182077248,
+#            "used-idx": 0,
+#            "name": "virtio-serial",
+#            "shadow-avail-idx": 0,
+#            "vring-num": 128 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus',
+  'features': [ 'unstable' ] }
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device's vhost_virtqueue, including most
+# members of the vhost_dev vhost_virtqueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this vhost_virtqueue
+#
+# @kick: vhost_virtqueue kick
+#
+# @call: vhost_virtqueue call
+#
+# @desc: vhost_virtqueue desc
+#
+# @avail: vhost_virtqueue avail
+#
+# @used: vhost_virtqueue used
+#
+# @num: vhost_virtqueue num
+#
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area phys. addr.)
+#
+# @desc-size: vhost_virtqueue desc_size
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area phys. addr.)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area phys. addr.)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+  'data': { 'name': 'str',
+            'kick': 'int',
+            'call': 'int',
+            'desc': 'uint64',
+            'avail': 'uint64',
+            'used': 'uint64',
+            'num': 'int',
+            'desc-phys': 'uint64',
+            'desc-size': 'uint32',
+            'avail-phys': 'uint64',
+            'avail-size': 'uint32',
+            'used-phys': 'uint64',
+            'used-size': 'uint32' } }
+
+##
+# @x-query-virtio-vhost-queue-status:
+#
+# Return information of a given vhost device's vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5216124928,
+#            "used-phys": 5216127040,
+#            "avail-size": 2054,
+#            "desc-size": 16384,
+#            "used-size": 8198,
+#            "desc": 140141447430144,
+#            "num": 1024,
+#            "name": "virtio-crypto",
+#            "call": 0,
+#            "avail": 140141447446528,
+#            "desc-phys": 5216108544,
+#            "used": 140141447448640,
+#            "kick": 0 }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5182261248,
+#            "used-phys": 5182261568,
+#            "avail-size": 262,
+#            "desc-size": 2048,
+#            "used-size": 1030,
+#            "desc": 140141413580800,
+#            "num": 128,
+#            "name": "vhost-vsock",
+#            "call": 0,
+#            "avail": 140141413582848,
+#            "desc-phys": 5182259200,
+#            "used": 140141413583168,
+#            "kick": 0 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1


