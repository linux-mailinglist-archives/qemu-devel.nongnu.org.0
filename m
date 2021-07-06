Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E23BDBE5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:06:20 +0200 (CEST)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oWZ-0003Ay-AV
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJr-00016y-Sd
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJp-000859-P8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:11 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBfd003755; Tue, 6 Jul 2021 16:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=gSQK3TDCc8tH9uAJIpMOgjWelDt8bBTWoq5/mKAXMJA=;
 b=WrljamtJzKHxcyXDwy5GTsZk40v4f/ZIx335Akqjnak68n0Ova5S0owaX/mrlWVytb9v
 y04+mrbnvYa8Ac8AY4x0TRFzA9uZg8XtVSk970IhauM4zneyVA2/orX+tbrOqXjLRwJl
 ceEpfQUzKw0TqcZVr7mwo+tb88paGRcXm5WydsRuHBwPNbkLP7pmEbM0vqBLTG6q7v0B
 Ed/SiVh35p72HLu9OQ4rUzcfGep59mjcjBK3N7QO8J8TPx1yDGEzBFDtTzYivjLn52Wh
 Os/2oxlAkP6mohcXbWYEJK+D7tx4NrppO2pMYzhwo13y6rEsW4LsZ2zbr+Kwtrw2IWbb /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoIq7012594;
 Tue, 6 Jul 2021 16:53:06 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
 by aserp3020.oracle.com with ESMTP id 39jfq8vjh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gT6zp8sbLc4tu682dIGRnGZ4xENKvbbm6X/Wrg4svNAHMivQnYl6jacam8gWbBLbmAr7TNIYSJAT134dQ90QkKCeRtvWI08+r+337Zh+4CmnlipiVo15k1V3lL1IsPq3CkSpvKQ0QcLYIj1pn/xVInpKgRtK1cn02mhkvrMgwfEU/7EdQg+vC1AhTKUT2FcKuF+gZokUPfxS36UaP9LDZT/QQflRl+vpsT2zCXb3Xc07TUV8oAoUcQ0Rrs5Y6qB95inbuE3E20HV3ckv+cG6zpT5xosP2G0fiY8dsmehqRnAnzyl3Nen3laVgHMjQuQwwxgR6YQ7xDzAXymBm3Affw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSQK3TDCc8tH9uAJIpMOgjWelDt8bBTWoq5/mKAXMJA=;
 b=D7vaL2Fem4Gl6heKzvn23hnTMeQ458ksiQrafOls4MTIoy+8931tYUIagl92FPBPnNyipGui+bx54jjSBBTPZY0eI8tG40sCRsmIrJxS0V7z/MR69JMrytP/YEEtFZ4RNettzsfnbNK8DgElrvfjFJlK2zPPjsE6L6BqBx6Xd4b7VKayu63Fbaa3+ASL7ejXzG1H1Grj5YHEkUWM1zl15K096flJaueCeY8zNrwAcfm574QXL76i1tGazq4DbAzw/wOpReB4qRCt58LT/6tBBEEhcCh5m4mveC+4uzmysXG6VfDzqdsb9GHTHtmpRJ0KjOAWqQUTYX95JORXXphtpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSQK3TDCc8tH9uAJIpMOgjWelDt8bBTWoq5/mKAXMJA=;
 b=ON7aqYgRCSpfjNUaL0NBvYzPGcRheMu38KpULeI9O8tXHYyGAgaTwjRpa6+cblDEkaQ11x5aT3vkUIBsylhzzG5kqAKy5ETfl1167QU0oUqkRmh+KjA0ztP2lPiiMaWHBXkMngzo4R6P3TBkAoqgSEf+G5w0FJALkhw8ft/vNaY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:53:04 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:04 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 15/25] vfio-pci: refactor for cpr
Date: Tue,  6 Jul 2021 09:45:46 -0700
Message-Id: <1625589956-81651-16-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:53:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86499a2b-b967-476f-aca9-08d9409e8584
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB298242D5B42D3854794144CBF91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h6fQRIHfPagYlPTxJ6n4E+pyg/hGjqXitwVBa5q2Mps7p8Z7KQKtHJxe3AtyxvZmhvjaSRovJcJfHH6eL3utkz7xVeCKj56WIEKjqgvY3lRp+lhfd9RZdXoEuasaXZo61JWzdTXn2vWDX3b43kPyuDQ6l0g7tApS+SJPLzEHz2kw38yspazk32A70qYN5HVmq1SmKIfGBlh/m4cyr5fJ5ERVm8bBzo7a/DKEl5fruxqzmvPCu998/WcY5TwuRq4MgZNLJMUPQ+A7q8yc0/dsAS3yAquZ5+LtukooFqFbrjGOItazmmqItEFWHviHPIXdad1609MoPID9g/D1vhtQKuu3vpVgoLxfj0ai04UkGRBBWBn9H7W7scCou1LJLeSLxrCeCJtabOX1p8UkR1JwZdPTwwMloA4zdbCa6dYCWkCqye4CO9pM1vp4uvIA1uoCu0q+y6zRwcWdTdaqSU0kk6C0Vby3BPOUjibmJx/LbKqGLVNakdhmlaEMkO5wPu7zpXjFJtNNUb6fGy8dxBRiCh103tC7dB6DMvF6pqEhzek0JFniPRSWd0NB8LzsolhiHVZBtd+EIqG8Usdaw6nmaAzATYmzzr/26IXkba0r6yXOXBAGwi+mEp9pBeLhb7GAQiJRxWimgIOvijFCC3IZaLwax8vBN0K8QinJQTw6SXv5e+HSwEiEVo5zJ+ip406Q+1Siuxuwh8lWn08sltVXRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nLJSo4H8LRAueC3qWCVkdwCy9LdVKYK65LONeq5G/sDcsLqAAZybyiI07JOA?=
 =?us-ascii?Q?g8YAFGUsIG/TFu+PJLq0YiW6CaFbhawk/hBzBKjv0ZuQ6BkT7eB5VOJZ8IwU?=
 =?us-ascii?Q?WU6nscCvCfjYnCKmaCy/h82pP0aGyYJx6+aQspjqOWsMI6fcbQz7AzSDf4bm?=
 =?us-ascii?Q?xXNGT/X0tjW9yBNKBPwTyhwElkAYUXTImKbvSAjtORbiipelfIZpnPbbTTvM?=
 =?us-ascii?Q?bp4L2Sd6T/XsBsTyDvc4oUYr9W4WCte4EooWO8UV4oulJ6aHkHXF8PcFU21Z?=
 =?us-ascii?Q?WVvr+DCU2b3p3qIE1hmRLMaBkAPN9+fNORUtpilqTIb08e2BS+98wu0gEtj4?=
 =?us-ascii?Q?RQqT/Lu55Ry6lxLolhRZG3TvJf5pwCls1mONjBGZNX7lGOYhS7J4xcr5fsqP?=
 =?us-ascii?Q?d0Fst6JPzEj+nxNIZVKnLMge/P8y9Daqu+BKPfIt47cETHpQjO4By6j+4HSg?=
 =?us-ascii?Q?U5wEJIAfasWw+DVnvHIHccj6UPRLddA4TZubGwWaEgQ6UVhRT6uQ+hzFvgNI?=
 =?us-ascii?Q?/1eW3/lSVnR9Q0OyQM/IiCoByPcJImWtsAwx9AQrXmIQc3xwdBGLWV7aR+ts?=
 =?us-ascii?Q?JKWN8Ok4BwRNk/ZlLEr3hzAG4XrTZeipGiz6elEBnYp+rlKvg5E4Q0/rWFTc?=
 =?us-ascii?Q?GL6OTvTebMsPr5kS2MRxAqooY3wQIN7nWxDmggzbVrSk20BQnrre97JKCosx?=
 =?us-ascii?Q?YMXHaBdQ8KE8rZLNHm3bJIVbBJlguRH04vXUPw4LGzNUnHVBYLBJL98TFMV1?=
 =?us-ascii?Q?+x/K3qLSrDbx88UuktBWI6xxCEvaddiXs0QMt2ovBSUO7j38saiJwpcVk51q?=
 =?us-ascii?Q?05Sn4lfciW8aQ4/YUHoPL1wc55+TnAb1TfFV29ARFGpX3OidWQ2pv1kPfCHr?=
 =?us-ascii?Q?hicnsHAOc4UGINm8131+xOETxAWGZdnbnFDM2zBcMKW8zI2RD1EquBH6uJJE?=
 =?us-ascii?Q?DhscLI8pDY5jIQyJ16wLAs7BYNxFuAYdaPXAqApxFTMpXcOxiW10A5ZfnW2v?=
 =?us-ascii?Q?vOrriKBMEG26L97xHPcAi/gJQoPu9P7Wvs1bKwkmF951qlFWIK+I86qCILvR?=
 =?us-ascii?Q?iI6eKCP74WOIrPdrzn3+upXEKpPRIYGw3078HPiTaL3fYklfrHGZbYtZlTL+?=
 =?us-ascii?Q?YVLFSo7aYYJh+xDoaGfjaqxs7uHlRVNgEC3ugizDpHmfIyYjE4bfD0qWuj8t?=
 =?us-ascii?Q?/UWFXFSfAXlxHhENJMyIAla8bXThF6rz2G7nPVNOHkqTbmdHMky/W5poKwmu?=
 =?us-ascii?Q?tasKDO1ONxOXEtH4HXQ7qY8t+aoM409hc3eu3+TMnnidm0Hh6KK3FNT3zcFG?=
 =?us-ascii?Q?A1cuFa4VvkaVfYr6x8ZhUwW/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86499a2b-b967-476f-aca9-08d9409e8584
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:03.9740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWmP6TL9kjnbGpNYwnaQ/aQuGx6x8qiGlT+LWH9c3v7q3QpXQsvGNi11ykOrkVr+kmqrU9YJ98TsCwJi0k3N5/+nUDwknF3vGvvszTC864c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: DoByVO6AI8LP-p1JPJCieyCSX3lo7__V
X-Proofpoint-GUID: DoByVO6AI8LP-p1JPJCieyCSX3lo7__V
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export vfio_address_spaces and vfio_listener_skipped_section.
Add optional eventfd arg to vfio_add_kvm_msi_virq.
Refactor vector use into a helper vfio_vector_init.
All for use by cpr in a subsequent patch.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              |  4 ++--
 hw/vfio/pci.c                 | 41 ++++++++++++++++++++++++++++++-----------
 include/hw/vfio/vfio-common.h |  3 +++
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654f..9220e64 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -42,7 +42,7 @@
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
-static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
+VFIOAddressSpaceList vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
 
 #ifdef CONFIG_KVM
@@ -534,7 +534,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     return -1;
 }
 
-static bool vfio_listener_skipped_section(MemoryRegionSection *section)
+bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5c65aa0..bc656e9 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -410,8 +410,19 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
     return ret;
 }
 
+/* Create new or reuse existing eventfd */
+static int vfio_event_notifier_init(EventNotifier *e, int eventfd)
+{
+    if (eventfd < 0) {
+        return event_notifier_init(e, 0);
+    }
+
+    event_notifier_init_fd(e, eventfd);
+    return 0;
+}
+
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
-                                  int vector_n, bool msix)
+                                  int vector_n, bool msix, int eventfd)
 {
     int virq;
 
@@ -419,7 +430,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    if (vfio_event_notifier_init(&vector->kvm_interrupt, eventfd)) {
         return;
     }
 
@@ -455,6 +466,20 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
     kvm_irqchip_commit_routes(kvm_state);
 }
 
+static void vfio_vector_init(VFIOPCIDevice *vdev, int nr, int eventfd)
+{
+    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
+    PCIDevice *pdev = &vdev->pdev;
+
+    vector->vdev = vdev;
+    vector->virq = -1;
+    if (vfio_event_notifier_init(&vector->interrupt, eventfd)) {
+        error_report("vfio: Error: event_notifier_init failed");
+    }
+    vector->use = true;
+    msix_vector_use(pdev, nr);
+}
+
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
@@ -467,13 +492,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     vector = &vdev->msi_vectors[nr];
 
     if (!vector->use) {
-        vector->vdev = vdev;
-        vector->virq = -1;
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
-        }
-        vector->use = true;
-        msix_vector_use(pdev, nr);
+        vfio_vector_init(vdev, nr, -1);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -491,7 +510,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         }
     } else {
         if (msg) {
-            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
         }
     }
 
@@ -641,7 +660,7 @@ retry:
          * Attempt to enable route through KVM irqchip,
          * default to userspace handling if unavailable.
          */
-        vfio_add_kvm_msi_virq(vdev, vector, i, false);
+        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
     }
 
     /* Set interrupt type prior to possible interrupts */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162..00acb85 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -204,6 +204,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
+typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
+extern VFIOAddressSpaceList vfio_address_spaces;
 
 bool vfio_mig_active(void);
 int64_t vfio_mig_bytes_transferred(void);
@@ -222,6 +224,7 @@ struct vfio_info_cap_header *
 vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
+bool vfio_listener_skipped_section(MemoryRegionSection *section);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1


