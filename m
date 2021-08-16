Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605273EDB36
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:48:21 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfme-0000uY-Dr
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhe-0000nX-7l
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhY-0007y8-Lw
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:09 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGaA9q021054; Mon, 16 Aug 2021 16:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=nUV3Y0uIESmLz7Zkqh1tpA3nnyQpn+3Fz/PyO5rgOHU=;
 b=gnFaoNCCsUe62fPezMnI+Rt7lr7nA8k8wgGq8iB4/NOWWHVWwaDe9BKE9604Z3HXwPpH
 b2yKLuZGZQ0su16qpPTrCkhZ4esTdf34VVnPhwlY10Lw0cb1B+ZC9mn8yEs1pmBeAzX5
 aI24w/M8cxrI6gxEtf1AnkqvvfRFRzfnajAGQEqiR+MPPy2N6Bd3/72EhF9TDwNAPFh8
 mx4Hw/U5KNAyoQlL1ln3lgvTbF4kHiR5//ARa59dYxAp2plMB6eu3hd3E3QVRnXcU6xc
 qcsmoa7Eue8Xw2GA/wPRuwbtNbW6aXP5D471EdXlPA0Ffr/xgASsF6rUxVKANm9tWb6H cA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=nUV3Y0uIESmLz7Zkqh1tpA3nnyQpn+3Fz/PyO5rgOHU=;
 b=Z+RLqUyUj4EekElBmqBRd9A5pbSf5jO5jjT+nkUo8/T0IXnWgPX6BJcf2QZrgovyJ2rp
 dh2zz1cg9JXF1rhkmuqu8UfwpP2iKsjVKFfh0caAZOHIDUMMJIDpKI3rbVOe6Ga5RPDO
 7lG4tQvD8xsohqqr4JoFnBUunMrMpl/P3dCz3yv22oHFbe2EWlTE6lZ5w+dKcHLbnWOj
 rcU6OQF7mmtwjKYcSX7m4Ggc49Ov5iGPt4YKOHWFW+Mwi1Enw3kFpmX6mGnSS5YeDbSs
 ypG/rmGPU7hdx2XhSgdyQMFk4tDqa3DC/bIoPtDazSrq5B7aqi7gelnplBjjSN8IMqD+ gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgmb9k04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeo5w159237;
 Mon, 16 Aug 2021 16:43:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3ae3ve34y4-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8Drh/648U9JmUfzCD4PNHZs6T1SVGjA1jIx2dzW6Wyyj4NLFPulB8Fv33AHvBshQVPIA6sc2qfaawRd/KhXGiYICtVddGnac80sUJpmqsXLcCHaUDTwPZDf3qnYE/xfGPitxY2ji++uDPSxeJSSyNinHifDNaMnI9raHvJejPUhwzeBeyQLC7HCBWE2sVVpmMtzJanTChKYxoGe2VjugRVuSUZRspV0qZjwVr+eFaICBTO2ySzGE7I4GbIcarb+jUOph4ndBZGVjMw1rkL+DXkbKdHOcobi/nQDQ4V4+DEJbehXN+JUNpkXEJVNLHbClwRfhXcJ8xlxNKyqsjAR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUV3Y0uIESmLz7Zkqh1tpA3nnyQpn+3Fz/PyO5rgOHU=;
 b=H0EWHP/YN9CWEsYgTjXoFeAdGcxr1Jk4NIMa02jzon+16U42WOvHPzPMfB+jtTP7StBNGVheCY/HrFu5BAvTQxvKYT8gT7E0OzoINh5pq/DyVoCBkcbpJ78hv8Hvg+HzEXteCvosbwPJ54BoCVb8+tdhvFs9wa6gXIV/T/m2yQYxEl9aelg48buMFw+uvh29mRjcHypGO4n4Cx1PAnTFieW7Iu+ptTnHCzgfBtI96onFy5108DRUlVYY0iSpCYz31eYNuHx8yo7z4Gi0Rj96ZqNFYLUVcsxwLIxhysozH5snTeFS8iAklYFQBgdwW5fWXwtYpqcoWQuMhbFn5/nK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUV3Y0uIESmLz7Zkqh1tpA3nnyQpn+3Fz/PyO5rgOHU=;
 b=O0X69LWGS9s7BWZk7bz27oLtVfqH19qtPrZ02K+R0IwcqquZtzQKCM+PxvAI23MTvz97Mz9vteKZJL33iNpeacjv+0jh+qr1b61keD3GJmfTKDPM/CykRr12yYw6ErVw5UveCzKT9Rq4nAoRr9ncK3tGyfroxsLXlrQUiWX7sP4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:01 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:01 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 11/16] vfio-user: get and set IRQs
Date: Mon, 16 Aug 2021 09:42:44 -0700
Message-Id: <4d292fab645b18b8a20f0f5a83356ae7fc0efa28.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 669b6871-2c9a-4f4b-3d45-08d960d4e94c
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB476527DB7BBCABB2AE8942018CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6lD3zrhA9HFLZRhecQfWEhWwzY92bKIiyI3mtt1U1+VefYwrCNFkYPtY729Uz/1VMbrERKCoRnUnpe8TU1TpfLLRN+dsjGZjLffqs38MUDosLtVU0YMvSS4opCkyPGdzV/txGswoJ0/IQk9MPRCjc0CrpxroiPWMiRbTk2xjrYUrqKMsx2nExN1F2jBZS8JirUX4zSxc2rq4cE/szf9002TX9S1QZcRWByhScRnXOySFBhkZJVeyag+gjU5BdGZS8AQcHC2uHXfd9d47IIriAD45no8i/kQ94fuO7FeKje1jCDBDDBtr/gU8oUBacsX4wXA3IqAtY/kWnlsd/N1VUtyDb5OvqTl2z1Sqvk7aXUrVt30uy0Uuvyx08gdlxTG4y2mvr9sdOOrTFzypSIp5qLmYJEs+peG260H+Z51C40kSe4N67kXkjPArFPi3au5S14SNyBFDVcSvQiHwnJ2xumu/872JSK0B4FHfu7c8RFgCVcSXvnC3l1FiUV/U20RodlitywdsWq1eEJlhfWIRCNKAHFhpCQBkRqQejnSNYMOFqW9/rdaTfj2bTwP80eqwt6lYHPAphkXtZskWkxk4BK21+xYJ1x59WLJdqD2PCdHU2DgVeBtl+R4j3EE6MwW3hGcVXnODLcnQprZ1MubmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LwqJ8yNtBvqrUNMsBupJSH2DZELQkfTqCXSTypPO9fmmpcbMlCSMROMchafr?=
 =?us-ascii?Q?4U/GquNJfAo51Sn/g/GOp9Obx2X4kxFNE0eOtUTtp0fjCAitdGuNx6sIl/x7?=
 =?us-ascii?Q?+AiCi2xvK30Osfnd5zyOrXDWoK2f1Iviq+/Jy84BXdPG6+Ge5watkM6+haxX?=
 =?us-ascii?Q?4qt8S5GFnK2fp9GZZGS45h1OF4/IWYB3fpjcTqlMK6SAWnKmjGNcra1OKLHM?=
 =?us-ascii?Q?1laS7LrkCir+fufySDqoFHBDeylT47uEZMgNC+ncJn8g73iowZImpE7OUfOZ?=
 =?us-ascii?Q?nOJPxVtyCGmuneo9iFMosXxupcexYncZClaKqMa4XcSdlp/SEnVg6rnKz04r?=
 =?us-ascii?Q?6E3uFSZ6WFdzOLvjYXe5lckd6cCgCVArBQqHZow61GBTFG9WmCzPep+BEYQO?=
 =?us-ascii?Q?mB58CqVezyrNQ+yTpgHFgx7G6pBDTiVHbWsLW0PmvGVj8x2Z/s3WrPxKRhiP?=
 =?us-ascii?Q?EEK3KIcdyrcCMaBbBJIpL7g52VseEylpr8y5o4BqZXF+zxw7YgVJwy3N3mGb?=
 =?us-ascii?Q?1Jug83mVhXoZSzrwKpgyEHjoptQO3Kzzf4u8nTskGUlME3hUSGiS/9QVgn6A?=
 =?us-ascii?Q?8pO1z0Sw2W9DRTG+WIMsbVRrVpjC1h7KxVGnzOrhUXPS/jeE4SizFdw0IGD2?=
 =?us-ascii?Q?qg2GjorvobtB+g4ucgUgGMmKlcisn7+bDo8cAb6Xbl2mOWx+jmyo+rEEG8AO?=
 =?us-ascii?Q?HgcZzoWL0jexocbWCCC9I+DFFe/h58wmEGC0maMfeDQ9pXcx+RgQI4MSjkfQ?=
 =?us-ascii?Q?LWUrJ4ZoigNzPl/KMtcxpmgdciZwjKR2t834YNgibLmLyKFTPQvazeZxyTYS?=
 =?us-ascii?Q?KjOIwuzaMPK3Jt059iDi8bRddmCD292t+gPJ1xTv4v++qRdC+UVmKiokUhFv?=
 =?us-ascii?Q?LBP9tIgr2Ua2dBHAQj5oC3khgmfoVuI6OtOQ4f/SHaqTDwYW6Q9SXr07Cj6U?=
 =?us-ascii?Q?m6wkexL/zYuqu4o1v9rQZQVgYr/Tc2a32relBDvgiwLsSkttBs1FUM27ZCXZ?=
 =?us-ascii?Q?kakHEmnZiVFx8289q4Z1esFw2aZ6sTiQfpovYWlLQybpGLA1jo1Jxl4P0lpb?=
 =?us-ascii?Q?yz0nHA7IbZkMo/H8XWUaQN3l5nOmPPV+JKwuTVkvi19Md7ZHa3MHnKeHHpiY?=
 =?us-ascii?Q?JSLQmYZx8kt6UHOgRMbDUo1UeDRNnZqmAy1z4vaZ30lKmOmyqbvwJQ/BMy8m?=
 =?us-ascii?Q?3sFjLw7c2ZCgS6Fq0das/3yCeJn8OO4oQpKTsDhdAtFTkpbMYc0ihgT8ff60?=
 =?us-ascii?Q?jhVnlx8WUGE7muwpshxhZ0R1G/Ayz0nxU2NzsMMOidt//5LHWrX0eow7DArO?=
 =?us-ascii?Q?1EuaNqEnL7ioBIYSPF41t4l32Naai16nthJRxBAN05Ztw0Pic7MOWq96jdFu?=
 =?us-ascii?Q?wzEOabgkRNfsbEsYCdYLRkN8tMxZ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669b6871-2c9a-4f4b-3d45-08d960d4e94c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:01.4695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10fU2+Ux1N7evxwTktAFVlHoFpEYcurBe66Q29AE4pn6+9Ok/CNQIb72ilh0AOfuS2TzfX5JrAp2pY8QS6W+TLpkwUtjrAB6mdlOZpiV+lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-ORIG-GUID: U3V5AmsFVs7sHS8ti7MBGc1sU_s0Q2PV
X-Proofpoint-GUID: U3V5AmsFVs7sHS8ti7MBGc1sU_s0Q2PV
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h |  25 ++++++++++
 hw/vfio/user.h          |   2 +
 hw/vfio/common.c        |  26 ++++++++--
 hw/vfio/pci.c           |  31 ++++++++++--
 hw/vfio/user.c          | 106 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 181 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 56904cf872..5614efa0a4 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -109,6 +109,31 @@ typedef struct {
     uint64_t offset;
 } VFIOUserRegionInfo;
 
+/*
+ * VFIO_USER_DEVICE_GET_IRQ_INFO
+ * imported from struct vfio_irq_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t count;
+} VFIOUserIRQInfo;
+
+/*
+ * VFIO_USER_DEVICE_SET_IRQS
+ * imported from struct vfio_irq_set
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t start;
+    uint32_t count;
+} VFIOUserIRQSet;
+
 /*
  * VFIO_USER_REGION_READ
  * VFIO_USER_REGION_WRITE
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 02f832a173..248ad80943 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -74,6 +74,8 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 int vfio_user_get_info(VFIODevice *vbasedev);
 int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
                               struct vfio_region_info *info, VFIOUserFDs *fds);
+int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *info);
+int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq);
 int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
                           uint32_t count, void *data);
 int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a8b1ea9358..9fe3e05dc6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -71,7 +71,11 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
         .count = 0,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    if (vbasedev->proxy != NULL) {
+        vfio_user_set_irqs(vbasedev, &irq_set);
+    } else {
+        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    }
 }
 
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -84,7 +88,11 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    if (vbasedev->proxy != NULL) {
+        vfio_user_set_irqs(vbasedev, &irq_set);
+    } else {
+        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    }
 }
 
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -97,7 +105,11 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    if (vbasedev->proxy != NULL) {
+        vfio_user_set_irqs(vbasedev, &irq_set);
+    } else {
+        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    }
 }
 
 static inline const char *action_to_str(int action)
@@ -178,8 +190,12 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
     pfd = (int32_t *)&irq_set->data;
     *pfd = fd;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
-        ret = -errno;
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_set_irqs(vbasedev, irq_set);
+    } else {
+        if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
+            ret = -errno;
+        }
     }
     g_free(irq_set);
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ea0df8be65..282de6a30b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -403,7 +403,11 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
         fds[i] = fd;
     }
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    if (vdev->vbasedev.proxy != NULL) {
+        ret = vfio_user_set_irqs(&vdev->vbasedev, irq_set);
+    } else {
+        ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    }
 
     g_free(irq_set);
 
@@ -2675,7 +2679,13 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_get_irq_info(vbasedev, &irq_info);
+    } else {
+        ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    }
+
+
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -2794,8 +2804,16 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (ioctl(vdev->vbasedev.fd,
-              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
+    if (vdev->vbasedev.proxy != NULL) {
+        if (vfio_user_get_irq_info(&vdev->vbasedev, &irq_info) < 0) {
+            return;
+        }
+    } else {
+        if (ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0) {
+            return;
+        }
+    }
+    if (irq_info.count < 1) {
         return;
     }
 
@@ -3557,6 +3575,11 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    vfio_register_err_notifier(vdev);
+    vfio_register_req_notifier(vdev);
+
+    return;
+
 out_deregister:
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 83235b2411..b68ca1279d 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -768,6 +768,112 @@ int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
     return 0;
 }
 
+int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *info)
+{
+    VFIOUserIRQInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
+                          sizeof(msg), 0);
+    msg.argsz = info->argsz;
+    msg.index = info->index;
+
+    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0, 0);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    memcpy(info, &msg.argsz, sizeof(*info));
+    return 0;
+}
+
+static int irq_howmany(int *fdp, int cur, int max)
+{
+    int n = 0;
+
+    if (fdp[cur] != -1) {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] != -1 && n < max_send_fds);
+    } else {
+        do {
+            n++;
+        } while (n < max && fdp[cur + n] == -1 && n < max_send_fds);
+    }
+
+    return n;
+}
+
+int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq)
+{
+    g_autofree VFIOUserIRQSet *msgp = NULL;
+    uint32_t size, nfds, send_fds, sent_fds;
+
+    if (irq->argsz < sizeof(*irq)) {
+        error_printf("vfio_user_set_irqs argsz too small\n");
+        return -EINVAL;
+    }
+
+    /*
+     * Handle simple case
+     */
+    if ((irq->flags & VFIO_IRQ_SET_DATA_EVENTFD) == 0) {
+        size = sizeof(VFIOUserHdr) + irq->argsz;
+        msgp = g_malloc0(size);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS, size, 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start;
+        msgp->count = irq->count;
+
+        vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, 0, 0);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+
+        return 0;
+    }
+
+    /*
+     * Calculate the number of FDs to send
+     * and adjust argsz
+     */
+    nfds = (irq->argsz - sizeof(*irq)) / sizeof(int);
+    irq->argsz = sizeof(*irq);
+    msgp = g_malloc0(sizeof(*msgp));
+    /*
+     * Send in chunks if over max_send_fds
+     */
+    for (sent_fds = 0; nfds > sent_fds; sent_fds += send_fds) {
+        VFIOUserFDs *arg_fds, loop_fds;
+
+        /* must send all valid FDs or all invalid FDs in single msg */
+        send_fds = irq_howmany((int *)irq->data, sent_fds, nfds - sent_fds);
+
+        vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_SET_IRQS,
+                              sizeof(*msgp), 0);
+        msgp->argsz = irq->argsz;
+        msgp->flags = irq->flags;
+        msgp->index = irq->index;
+        msgp->start = irq->start + sent_fds;
+        msgp->count = send_fds;
+
+        loop_fds.send_fds = send_fds;
+        loop_fds.recv_fds = 0;
+        loop_fds.fds = (int *)irq->data + sent_fds;
+        arg_fds = loop_fds.fds[0] != -1 ? &loop_fds : NULL;
+
+        vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, arg_fds, 0, 0);
+        if (msgp->hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->hdr.error_reply;
+        }
+    }
+
+    return 0;
+}
+
 int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
                                  uint32_t count, void *data)
 {
-- 
2.25.1


