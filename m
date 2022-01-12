Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA448BC11
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:56:23 +0100 (CET)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Rw6-0001q7-R2
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdZ-0000hx-VM
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:14 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdX-0005g2-3Y
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:13 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMv7qY005893
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=d+pAfqCHrvgMmOMi76L/ps25UCKxjy/yh/yXJC5ZGFk=;
 b=cQzbFWbRTU/HG2uCYeQdrB+EJP/XnoKRjjdGJORaH//xLpjhZQk2CmYZGq/7F13Uc0as
 374CKKFOxXyP08Kfg/AOGCQf+nm0Km2pc1UB0oaa9ykb9NCA/qjCltTkS3GrbkoocPOx
 k0ahH5mJtxqc4BQpgrISmuABnCmM8o9kL6yhklFeWv24P6Wd7ljiVTmtm+Dcnk91OV3l
 cJGHFYRHmY1mp1XeK0taz9ZfCyKU5UrMarLIpUVTULtjLCYQNP9zFejZW0oly+MYmUfI
 Dwdvxo9YJ8vKOG49d7ChSDpbT+YmAXOta8kjTDtL0JvUJjOTlr7WbOQaL3wPZyu9V5hV CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBA196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrRx9RHThN7qVnluytEq4UyegJVgjHLXeRJs5lJXAAh96Vq/Po/tbx0G55EIpsKCDrFIu0RCKUaMjrz4XJg9z+0x4010G9ZAKfI81u3AK4W+26dsnrS62fLw2//srkcn6kDGc2xEf5j5zoGv7DT0VCpPCP7fV9IpZhK69sdwdivzS5nZlLnbuBjYctmKzbPNjIWpweL1h3lSB5Ya48Ker4rCQY35OBvcTWnLrJpHMfMEYLrAF0s59NVIIZ9NMFNI63Ucv4C9qS0l97/IQ72EXEtDSItcXQVRFjg8/OwwUNAH3/Qef+Qnrn/w5zmgN8waYTntqXfY7Rq0RLhKnoL5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+pAfqCHrvgMmOMi76L/ps25UCKxjy/yh/yXJC5ZGFk=;
 b=EEWJpoNI5g1xgjzd6SF/kBD087FVkQqXAdx+fv2EjgbisrBWOZg6WUpd0RkmoxV5XJOGbXXmdNd/20FKZxKZNl0tq7qyzNhXkd2Omrgp/1E7sE0mNKTraGBuAcvGxQU3HnZJu/0AMtQ+Vet6CzCRP9XN0zBfMuDwNLV+x0vRyfiaoPYalW0kns/tu8hddOmDP+Zipn1NfwDpnquFt/hNFUaJqKSex5wTkh4P5x+6NxNzFx5emCV4hZPWOqv4wTNCm00mp+NED0t7c1fNxuaHkLdBCmvT4fANyEgJ28bgtA1CXOIDshkmuxzJUWoDHGh5s2pX2su97FpNDWw6ggUAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+pAfqCHrvgMmOMi76L/ps25UCKxjy/yh/yXJC5ZGFk=;
 b=JHYYgAd55Z5PY8AQI1EF63gDv5dBk6vYhvRcPtrKuMzbFHzT0lPaZzIq97jqZ+7xTrvRp+rQNZaDhukVYcycCjUg29BwmDjQDlkhbRuYHQsge8QMkMztX7Xcgb1ea1wyW9kdIjOeCfM+OvdbgEJlePaQ0f/RfAyorczgncGv4BU=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:04 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:04 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 05/21] vfio-user: add device IO ops vector
Date: Tue, 11 Jan 2022 16:43:41 -0800
Message-Id: <b901a7b6944c518a636775d1d73bc41f0ab1511c.1641584316.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 988cf4d0-d634-43ef-6258-08d9d563a7e0
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742236FEF65ECEE0C4C4622B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQfjFge942ZJSdXsNqBF4xsJwNTid5vfRh1yGrHwUWXOc7dnl/WozHsnUhPIjl6/QFhC4xKLc3CDz+1HxAy8aS4F6ZTZas0yGYF8+98PGq0N/1e5mAu7CxG7jUJrDRQPxeveizhM5u0k+evlpIVmwljWT1UFFaG2lkpKA29c0yiapOu3Z/9q1pYGz2TJDjSb3sNKYifhDXXj+eP0f/hkkvMPj1yV9P8+J/SYmqFnBGp6lbH9NK0fN8/5Owi1rhgLjfUmX7DnRaolHh2tW1iB7T4cdlBKLlgxNE+ZvYxXxq5Bek5hSk6QvcqtIndw4d8b5nzuSp/tJpdqAdAhANnRiAZuyIYYT8e56L8x0alhOZNVQJmDDwsUYaOFBEsXT3C/SXYWzgNtyN8JAdjD3D9pnMayvZUTHeRg3Iria3KgBjOqTooXTZyMpHB5Fiuy7h8/IVTueyE1uNuWnESQJjiUz/m4CufaL3fmzESaoXRfvlX7CJYx91/9Y/cC5G+pOoZsHhkt9ajiiBm5+Sk/SQG8HsKBYE066CgoTwzj0mSvHmlAY+XuKjPKSZpSm0UMzfhgysvWV5wkHyQHf3xktnu7DJiFr5MJNCh2CHHbfwS+j3eRXRe3w2XE5LWBr8F/M41g2pm4iSXunMEKTdCTkqDebLCBKOjuZheM/a/iHV7dX8o0oMsaNz6zVqr3p/aSoXvw3JwDdtLECZ8xnc53ox0IQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(30864003)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?At/VrmihKYsSIHDosA1Rqs/5lyZS63TwQq+xAfgfO4vzf0oyaO1oua6vbQ60?=
 =?us-ascii?Q?BQKq1RIfeMDQdJJFBcYBbKvzaK6n5Jv75q1KWM4dxwI4vIo9nhivyzStrtTJ?=
 =?us-ascii?Q?5Ob4cvNcGsYJTFzN+oDaiyJMFeKAJ/WQgo5eLgxchA2TX6hy0t/piToye5+R?=
 =?us-ascii?Q?LFwYyJyQ7bclUI6bKjsyxvhIB3bjdoTFXZCL6tTVqL8ZQiY6qSHCbM7mITXp?=
 =?us-ascii?Q?hG/pN+uME5hURpzdrtN7WZSPxs+M4F3+kJD2DsEkFkh79bCu0/zfrycbqyNf?=
 =?us-ascii?Q?5w7l0i90mQuJzS8bF2p8tcDsy3N2MaNz5tV4OACg4VSBRfTQ+maWcuRqCCX2?=
 =?us-ascii?Q?Ce9ADZM5OtHgM+xygcVdid7hiz32HAhgLJBejrCA0W5B9YiZNgUZCpDFXI1a?=
 =?us-ascii?Q?frrDT93aDDz93n12ISqksyK1KrgzuvQD6M+D2bR0gIThIQ81vCRn4WRK1MAu?=
 =?us-ascii?Q?2G/ILx/g5FArAPwhg1efWyFnxoapUV8XaZS5WjMSNxjQHjYaJ9RdRH0s2UQ9?=
 =?us-ascii?Q?+x4W0c+lvlKKfsmqk9fM8k4r4vr+XNwupiltGp+mEg47Brsgzv7KcUcOWU7a?=
 =?us-ascii?Q?hJyrrjACbQrxAatQBbSf+/r/WxQJc/y3XK7yCumPQloRHcu8jFrls7rxd0Wf?=
 =?us-ascii?Q?1dm/Wxmkc6Nfih+2Jcq2omJ0J88I+IsK9BSPWHN4WRD3EpZmkk2kgD5mkvwA?=
 =?us-ascii?Q?jFz7cnP7RO3slysHuZ3CAPzFpfp/GOC+Rj69HgXTWHZIY7Kh/b/ZXKRZ8SmF?=
 =?us-ascii?Q?OHEE0jg63PwKU4sAHRgA4prHNLkl2iU2wgV/kCp3yIUCTN/ItTl3JDAZLUwv?=
 =?us-ascii?Q?FhndeUu72AWPv1Gk5FpQ/aUicbAJplu5kjvTZxATKHlW9u9VsrZIh6JGBnkk?=
 =?us-ascii?Q?0H8QrJIgGFlc0uH8EFlUV4iIy8uy6vG21fjJdg2MZ/qvf6dT32RXKRhLxN3G?=
 =?us-ascii?Q?POJL17cUDfEHQTSFWeGv1TnCYVUZIS5fIpdZmXGREYqm6vTkfCdh+52ogKwu?=
 =?us-ascii?Q?Zz5G5rghJgniwSrb+qxiIyeUjx0p0vpfETBfAcBQlNom6YtnVb/jUcaaUz9a?=
 =?us-ascii?Q?0heUL7FO1M9V3UnTThiEY6atNXeeHB+mmiRx6SOkroB9/4j0l5itKrB6/M7H?=
 =?us-ascii?Q?ZXLONQVpeud7fp4gtJWIxOTM/yBpaYjF02GGktGFIHP8vy0IHU5ojLWF/Gu2?=
 =?us-ascii?Q?l7tteiW5zuikdtiRWbVr2nWT4Hz5KOyU34UyfVwJsvZ6f34xaB6yGyaLMQLb?=
 =?us-ascii?Q?tGg9iJpfil6qQpbBt+UyI8pNkRZUpVXQHfuoYDloEgonN0gezrCk4vpRrDRV?=
 =?us-ascii?Q?Zk/f612Bz1piJGESp1MIMMEnejBamb9nPAs8H+k45VD152QalkYKLm0B2Umb?=
 =?us-ascii?Q?aVPTIuIWVGRfOc6ImELF8TwsmcpCcgCaKbqCnhADv9nZvW8OHdSE6uT5DycO?=
 =?us-ascii?Q?0+8rOvegoHYybLprPP9EpeuTLL9vPt4+Lurw1rK4JFIJ+yAv9TnFlaQ5DZif?=
 =?us-ascii?Q?fOtQk8ekhr8cBrWhDFkeBXMD+tEudynQLipRUW31J5/MmtMDsAX7m2ZGdVt3?=
 =?us-ascii?Q?+fuNSqXD2h0dU4ysfBIvwCcyHmxtDz/EeBOxtu/krokWqng9R80eDqqV/7Tc?=
 =?us-ascii?Q?agYodCoZ2yrSojNo3uabgPO9epvbekO78Lp1JQov93Ii4hqem9vhoIJCiZQ4?=
 =?us-ascii?Q?02PI9g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 988cf4d0-d634-43ef-6258-08d9d563a7e0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:04.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GB1y5Sf6NYCRoqAF6Yzk5nyz6b7cqiF3rYiAisI8VITpwnutwYJIA/x/mCDdltJspC7b8w1hVqGX7YwUShE8BV/xj5JDhnTW88izFMEbPAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: o_rjuED1VDFUzn3dDDBcTtI742xsgJfK
X-Proofpoint-ORIG-GUID: o_rjuED1VDFUzn3dDDBcTtI742xsgJfK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Used for communication with VFIO driver
(prep work for vfio-user, which will communicate over a socket)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/hw/vfio/vfio-common.h |  27 ++++++++
 hw/vfio/common.c              | 107 +++++++++++++++++++++++++++-----
 hw/vfio/pci.c                 | 140 ++++++++++++++++++++++++++----------------
 3 files changed, 206 insertions(+), 68 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 1a032f4..826cd98 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -124,6 +124,7 @@ typedef struct VFIOHostDMAWindow {
 } VFIOHostDMAWindow;
 
 typedef struct VFIODeviceOps VFIODeviceOps;
+typedef struct VFIODevIO VFIODevIO;
 
 typedef struct VFIODevice {
     QLIST_ENTRY(VFIODevice) next;
@@ -139,6 +140,7 @@ typedef struct VFIODevice {
     bool ram_block_discard_allowed;
     bool enable_migration;
     VFIODeviceOps *ops;
+    VFIODevIO *io_ops;
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
@@ -165,6 +167,30 @@ struct VFIODeviceOps {
  * through ioctl() to the kernel VFIO driver, but vfio-user
  * can use a socket to a remote process.
  */
+struct VFIODevIO {
+    int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
+    int (*get_region_info)(VFIODevice *vdev,
+                           struct vfio_region_info *info);
+    int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
+    int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
+    int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                       void *data);
+    int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                        void *data);
+};
+
+#define VDEV_GET_INFO(vdev, info) \
+    ((vdev)->io_ops->get_info((vdev), (info)))
+#define VDEV_GET_REGION_INFO(vdev, info) \
+    ((vdev)->io_ops->get_region_info((vdev), (info)))
+#define VDEV_GET_IRQ_INFO(vdev, irq) \
+    ((vdev)->io_ops->get_irq_info((vdev), (irq)))
+#define VDEV_SET_IRQS(vdev, irqs) \
+    ((vdev)->io_ops->set_irqs((vdev), (irqs)))
+#define VDEV_REGION_READ(vdev, nr, off, size, data) \
+    ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
+#define VDEV_REGION_WRITE(vdev, nr, off, size, data) \
+    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data)))
 
 struct VFIOContIO {
     int (*dma_map)(VFIOContainer *container,
@@ -184,6 +210,7 @@ struct VFIOContIO {
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
 
+extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
 
 #endif /* CONFIG_LINUX */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 30d2c6e..cce38d8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -70,7 +70,7 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
         .count = 0,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -83,7 +83,7 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -96,7 +96,7 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 static inline const char *action_to_str(int action)
@@ -177,9 +177,7 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
     pfd = (int32_t *)&irq_set->data;
     *pfd = fd;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
-        ret = -errno;
-    }
+    ret = VDEV_SET_IRQS(vbasedev, irq_set);
     g_free(irq_set);
 
     if (!ret) {
@@ -214,6 +212,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    int ret;
 
     switch (size) {
     case 1:
@@ -233,13 +232,15 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf);
+    if (ret != size) {
+        const char *err = ret < 0 ? strerror(-ret) : "short write";
+
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
-                     ",%d) failed: %m",
+                     ",%d) failed: %s",
                      __func__, vbasedev->name, region->nr,
-                     addr, data, size);
+                     addr, data, size, err);
     }
-
     trace_vfio_region_write(vbasedev->name, region->nr, addr, data, size);
 
     /*
@@ -265,13 +266,18 @@ uint64_t vfio_region_read(void *opaque,
         uint64_t qword;
     } buf;
     uint64_t data = 0;
+    int ret;
+
+    ret = VDEV_REGION_READ(vbasedev, region->nr, addr, size, &buf);
+    if (ret != size) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
 
-    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
-        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
+        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %s",
                      __func__, vbasedev->name, region->nr,
-                     addr, size);
+                     addr, size, err);
         return (uint64_t)-1;
     }
+
     switch (size) {
     case 1:
         data = buf.byte;
@@ -2418,6 +2424,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int ret;
 
     /* create region cache */
     if (vbasedev->regions == NULL) {
@@ -2436,10 +2443,11 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
+    ret = VDEV_GET_REGION_INFO(vbasedev, *info);
+    if (ret != 0) {
         g_free(*info);
         *info = NULL;
-        return -errno;
+        return ret;
     }
 
     if ((*info)->argsz > argsz) {
@@ -2600,6 +2608,75 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
  * Traditional ioctl() based io_ops
  */
 
+static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_get_region_info(VFIODevice *vbasedev,
+                                   struct vfio_region_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_get_irq_info(VFIODevice *vbasedev,
+                                struct vfio_irq_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, info);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irqs)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irqs);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
+                               uint32_t size, void *data)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pread(vbasedev->fd, data, size, info->offset + off);
+
+    return ret < 0 ? -errno : ret;
+}
+
+static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
+                                uint32_t size, void *data)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pwrite(vbasedev->fd, data, size, info->offset + off);
+
+    return ret < 0 ? -errno : ret;
+}
+
+VFIODevIO vfio_dev_io_ioctl = {
+    .get_info = vfio_io_get_info,
+    .get_region_info = vfio_io_get_region_info,
+    .get_irq_info = vfio_io_get_irq_info,
+    .set_irqs = vfio_io_set_irqs,
+    .region_read = vfio_io_region_read,
+    .region_write = vfio_io_region_write,
+};
+
 static int vfio_io_dma_map(VFIOContainer *container,
                            struct vfio_iommu_type1_dma_map *map)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index cff6cb7..63a42ae 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -43,6 +43,14 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
 
+/* convenience macros for PCI config space */
+#define VDEV_CONFIG_READ(vbasedev, off, size, data) \
+    VDEV_REGION_READ((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
+                     (size), (data))
+#define VDEV_CONFIG_WRITE(vbasedev, off, size, data) \
+    VDEV_REGION_WRITE((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
+                      (size), (data))
+
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
@@ -402,7 +410,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
         fds[i] = fd;
     }
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    ret = VDEV_SET_IRQS(&vdev->vbasedev, irq_set);
 
     g_free(irq_set);
 
@@ -772,14 +780,16 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
 
 static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     struct vfio_region_info *reg_info;
     uint64_t size;
     off_t off = 0;
     ssize_t bytes;
+    int ret;
 
-    if (vfio_get_region_info(&vdev->vbasedev,
-                             VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
-        error_report("vfio: Error getting ROM info: %m");
+    ret = vfio_get_region_info(vbasedev, VFIO_PCI_ROM_REGION_INDEX, &reg_info);
+    if (ret < 0) {
+        error_report("vfio: Error getting ROM info: %s", strerror(-ret));
         return;
     }
 
@@ -804,18 +814,19 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     memset(vdev->rom, 0xff, size);
 
     while (size) {
-        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
-                      size, vdev->rom_offset + off);
+        bytes = VDEV_REGION_READ(vbasedev, VFIO_PCI_ROM_REGION_INDEX, off,
+                                 size, vdev->rom + off);
         if (bytes == 0) {
             break;
         } else if (bytes > 0) {
             off += bytes;
             size -= bytes;
         } else {
-            if (errno == EINTR || errno == EAGAIN) {
+            if (bytes == -EINTR || bytes == -EAGAIN) {
                 continue;
             }
-            error_report("vfio: Error reading device ROM: %m");
+            error_report("vfio: Error reading device ROM: %s",
+                         strerror(-bytes));
             break;
         }
     }
@@ -903,11 +914,10 @@ static const MemoryRegionOps vfio_rom_ops = {
 
 static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t orig, size = cpu_to_le32((uint32_t)PCI_ROM_ADDRESS_MASK);
-    off_t offset = vdev->config_offset + PCI_ROM_ADDRESS;
     DeviceState *dev = DEVICE(vdev);
     char *name;
-    int fd = vdev->vbasedev.fd;
 
     if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
         /* Since pci handles romfile, just print a message and return */
@@ -924,11 +934,12 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
      * Use the same size ROM BAR as the physical device.  The contents
      * will get filled in later when the guest tries to read it.
      */
-    if (pread(fd, &orig, 4, offset) != 4 ||
-        pwrite(fd, &size, 4, offset) != 4 ||
-        pread(fd, &size, 4, offset) != 4 ||
-        pwrite(fd, &orig, 4, offset) != 4) {
-        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+    if (VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4 ||
+        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
+        VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
+        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4) {
+
+        error_report("%s(%s) ROM access failed", __func__, vbasedev->name);
         return;
     }
 
@@ -1108,6 +1119,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1120,12 +1132,13 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
     if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
         ssize_t ret;
 
-        ret = pread(vdev->vbasedev.fd, &phys_val, len,
-                    vdev->config_offset + addr);
+        ret = VDEV_CONFIG_READ(vbasedev, addr, len, &phys_val);
         if (ret != len) {
-            error_report("%s(%s, 0x%x, 0x%x) failed: %m",
-                         __func__, vdev->vbasedev.name, addr, len);
-            return -errno;
+            const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+            error_report("%s(%s, 0x%x, 0x%x) failed: %s",
+                         __func__, vbasedev->name, addr, len, err);
+            return -1;
         }
         phys_val = le32_to_cpu(phys_val);
     }
@@ -1141,15 +1154,19 @@ void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t val_le = cpu_to_le32(val);
+    int ret;
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
 
     /* Write everything to VFIO, let it filter out what we can't write */
-    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
-                != len) {
-        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
-                     __func__, vdev->vbasedev.name, addr, val, len);
+    ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val_le);
+    if (ret != len) {
+        const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %s",
+                     __func__, vbasedev->name, addr, val, len, err);
     }
 
     /* MSI/MSI-X Enabling/Disabling */
@@ -1237,10 +1254,13 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret, entries;
     Error *err = NULL;
 
-    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+    ret = VDEV_CONFIG_READ(&vdev->vbasedev, pos + PCI_CAP_FLAGS,
+                           sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed reading MSI PCI_CAP_FLAGS %s", err);
+        return ret;
     }
     ctrl = le16_to_cpu(ctrl);
 
@@ -1442,33 +1462,39 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
  */
 static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint8_t pos;
     uint16_t ctrl;
     uint32_t table, pba;
-    int fd = vdev->vbasedev.fd;
     VFIOMSIXInfo *msix;
+    int ret;
 
     pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
     if (!pos) {
         return;
     }
 
-    if (pread(fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_FLAGS,
+                           sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX FLAGS %s", err);
     }
 
-    if (pread(fd, &table, sizeof(table),
-              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_TABLE,
+                           sizeof(table), &table);
+    if (ret != sizeof(table)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX TABLE %s", err);
     }
 
-    if (pread(fd, &pba, sizeof(pba),
-              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
-        return;
+    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_PBA, sizeof(pba), &pba);
+    if (ret != sizeof(pba)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX PBA %s", err);
     }
 
     ctrl = le16_to_cpu(ctrl);
@@ -1606,7 +1632,6 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
 static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
-
     uint32_t pci_bar;
     int ret;
 
@@ -1616,10 +1641,12 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     }
 
     /* Determine what type of BAR this is for registration */
-    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
-                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
+    ret = VDEV_CONFIG_READ(&vdev->vbasedev, PCI_BASE_ADDRESS_0 + (4 * nr),
+                           sizeof(pci_bar), &pci_bar);
     if (ret != sizeof(pci_bar)) {
-        error_report("vfio: Failed to read BAR %d (%m)", nr);
+        const char *err =  ret < 0 ? strerror(-ret) : "short read";
+
+        error_report("vfio: Failed to read BAR %d (%s)", nr, err);
         return;
     }
 
@@ -2167,8 +2194,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
 
 static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     Error *err = NULL;
-    int nr;
+    int ret, nr;
 
     vfio_intx_enable(vdev, &err);
     if (err) {
@@ -2176,13 +2204,16 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
     }
 
     for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
-        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
+        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
         uint32_t val = 0;
         uint32_t len = sizeof(val);
 
-        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
-            error_report("%s(%s) reset bar %d failed: %m", __func__,
-                         vdev->vbasedev.name, nr);
+        ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val);
+        if (ret != len) {
+            const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+            error_report("%s(%s) reset bar %d failed: %s", __func__,
+                         vbasedev->name, nr, err);
         }
     }
 
@@ -2631,7 +2662,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -2750,8 +2781,10 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (ioctl(vdev->vbasedev.fd,
-              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
+    if (VDEV_GET_IRQ_INFO(&vdev->vbasedev, &irq_info) < 0) {
+        return;
+    }
+    if (irq_info.count < 1) {
         return;
     }
 
@@ -2829,6 +2862,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vdev->vbasedev.ops = &vfio_pci_ops;
     vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
     vdev->vbasedev.dev = DEVICE(vdev);
+    vdev->vbasedev.io_ops = &vfio_dev_io_ioctl;
 
     tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
-- 
1.8.3.1


