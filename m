Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1B51E38C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:31:10 +0200 (CEST)
Received: from localhost ([::1]:41586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnADt-0007jM-Hz
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABX-0004zP-Sk
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABV-0002UF-N8
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:43 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246KnA03019339;
 Sat, 7 May 2022 02:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=69YEct9NkzSmmwluj2AMY+/oi6wa/ElLTTi9OwAWgq4=;
 b=LZ3N/2WCwjaKzoYNCgHaZOyF0/xI7x/tjf1z//kcvPVxWadT2saZW2Jw9Vg7uDulb7YU
 0LUQqlWf5v+RehEQ703BIUD4+Ms9Bwi74dKx8CuoNRtlQf8ce/cYjyNiqAX4vgmh020y
 Kcxf3+M2jMh768c38OfJRmJcJ6KwUbxJK5B1QRCa/HyQ7/QAX4ql4PeqWmyZ9ZPNmUc/
 kBiTFl+2GmRcRDcRuM54bSzLat8HeGs/+Hoc95/CCMI2xbghOwIsvGDmJwWIRR+b21j5
 TVv43SKIZ3AQsaW4qNjOPfyQaNJhAo6A+zcB4JCgm0DOoNFPR10Hugis0Z7uaXGssYX3 LA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwntfkhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:38 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472BGk7002863; Sat, 7 May 2022 02:28:37 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf76gu6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr4R9SjvA21O42hCZQpxAx0BXZzIPjVX22yhgn2ACqtcyWHOK0ZmrnVcATJ96jBOAEvQeeR/4qdnPl0te5qUBYsHUIyT3DFhUz+86FVLXGFp/MthLJ8yYUWX2ZY0y8Za90BXLW6m03IrHSIjNLLCG49E4aXldjicPlWZbmxSVoKFaEJrYQdx6ahDlCqJGEjGygKsF5URSQJJ5+hi0mWhx3Ytn5sJG6tJd1DkoPjLnIodvFaiJUkV0pyHumFqOpyrLyWnnLh8aAGTTOl9eXItVMJVfqpWRpiey2Gv14BMkWf0b3rCCbyaJSgtyuqTZTA176c2tTyUXSCHkp0mMSrEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69YEct9NkzSmmwluj2AMY+/oi6wa/ElLTTi9OwAWgq4=;
 b=lzTrsirf6tOUWRQy0JBBa+ft6RAAMjHq7Cx9hY/XEgS+27YCxiHo1G6zQDWj/A0x05miNKAr+DqgHpVoNpQQmM4IS8y3A0axZZv/eT/FqDL3nCO1EYEA2RMPhW6pZWxN7ikAALwTtn9Dav4lDpP9EMgLFByLiFwK2dHHfYsMUfTNLlkS0VV7EUVVQjoUEgyO5PXr1lI/s0tpyCSsgMLM9b1or3jmltxburOXumoruR1/x6T00nkwFLPey7yuT6OgdK0fCr2UJgKUJ8tlN4pYh9rscdNgkyJ9mIXul1jC4O4z51lDGGrZFKHjvASqv2gCaCzFyhdvpTLsbcJziZlETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69YEct9NkzSmmwluj2AMY+/oi6wa/ElLTTi9OwAWgq4=;
 b=R6B9ie86VMFTv5ek3lLIkjbWQVUIfZStGw5+OOCPg1htXyQ/qrL1rpvD96m3j2h2ji2PsyHiG4ZqaGAUbtCd2Va6BPMm49ZcoQm7fAYqqYouq5HAd7FGLwf5ZWJp6XHY5vrdlqIlv3qXMtWniGtGFN180Z+NKegSqeNnZUiBJsM=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:34 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:34 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 6/7] vhost-vdpa: change name and polarity for
 vhost_vdpa_one_time_request()
Date: Fri,  6 May 2022 19:28:17 -0700
Message-Id: <1651890498-24478-7-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d1b57e8-eadf-4c0a-c796-08da2fd14906
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB13701273147DB5CC45C56CFEB1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1m8A/A64Rt3GC9VHTWkXLqAogDRhqrKrsE5/ucM9zR1ZcGxvdNHduKae2G4E7T09ERTgqcy/OWzzx/bF4hOUwbMaCxBVkTWmADmUWk8YjJFclpTLr+LIst97wmYZVqhLPI7yEH8OimLiVpY8YBqSo2CsUWpp8JyHYEh02FT2M//Mpv0EqltpI94k7xMh4oCRgSyMzjvp26BUpqSC0NM+s/3TccVI3jI0u95eyfRndWK2CQOcMvg0Q3wNYDVmTioQh9FciGJaULfM+Q7CoGWdt/VScubGs3P6LHw3pdbYSiaSBgrGkeuwvih91E/ofY256oDF/lasbF1IHI7OJ055zdZhYV8avkUXtEnoxIa5y9iErGzCDR53K2cuNAhPIuRfijwYMlZayRrzWjkxAUu1OmCOkzOp57MWGVhzpvo8OeoOdbByw/6PR6rJJksPeJMmqAT7XM7cP01erH2KIP9cnbzuFwomcn0GwuiorOTWZy+ZNb2z0cyPSaKvzTcVZuJk0Kjn6oyKcKyVEpIv8AEwIQxiXMviLxqugHHCG6e7eqyU+LAZABmYZSXczy6rPhX3sWT/QEoy70zgqZSncDHLYJcKQzdRTtMk0AYo1OQZ7j9hD5SPzmYg7gESIZffk73PwP2ucVbAIFSyAhQ/2jE4ZkNFhyQbohVdDxuDDV5m72JCiTL2Rau7co3ZgNEEqnUPJl8Sbdf72ToWuSYx+72HrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52116002)(6666004)(508600001)(5660300002)(6506007)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+IbC1RxmjWWaEpLsTkB0D6co1WY8slVtr4JTdnweF7Amf8I/yOm3dizv6pU1?=
 =?us-ascii?Q?a7NAs8rfCkYeG7T22BOyOWTJoHC0docTzAN+uKmCS/ZC5WilbfitJrzQaDo/?=
 =?us-ascii?Q?1iiNdOeS/+HIrVtLV0hyKnsROj92piVBza7uBVMufgvw1gdNCswH53UtIhQn?=
 =?us-ascii?Q?g/cxP2HPoiIhm10ZEnK0zBgCuGUZtPwlWblAL5B8+ZIJGaB2sfefLALa9R+N?=
 =?us-ascii?Q?/OsGBax/UAikjG+FIjCCdDhW9COIAwQD0daEButOht3sw+f41fmSkPfZ3qL/?=
 =?us-ascii?Q?u47jsVCCF6O0UkbTnVkEpDqXekgLEikHIMpvcNQP0BG1E2/kLPFlQKcuXyzB?=
 =?us-ascii?Q?aYN06Gl8XwmFNr/du8jLzyNVqkWFqC6XN6vUX8Ik/SFDkDlfijLrBkNSKbjU?=
 =?us-ascii?Q?8gIE9d8SKfoXoDaAuUXybfiLAzh1whtl/0myJAZK+4A99q2rU2pHyDEUdIF4?=
 =?us-ascii?Q?9utwqG30CnU8D6OTDCQok/IBOqyOkfiHcmfogj8AS8kvr4TV8tDkFlj+rm0O?=
 =?us-ascii?Q?qxNTOZ0J1CvyBqb4tlqak73lgFedZBCTpxeg+FIswR+5YoV95c3I7SsH1njk?=
 =?us-ascii?Q?+/7HTxFO48HIh/NzQqukmDimKkN7LGEwOSNi+6XrfMbZDaO8OR30Mx9GYDS0?=
 =?us-ascii?Q?x6PkkpCDUv8y5FB8+7UxzT3jBi2tr1ClPFxafTUBr3iVwlzaKcsZLKg0y2q+?=
 =?us-ascii?Q?AywzFDOonPiU1gbHfvWF6b2XQ22hZ8xe8QEfTqFA2Mg0n4yv38FRTdHhvUa8?=
 =?us-ascii?Q?O62KurBQIonOcaG6buam9d5HVW6CVXdrfl7YllpgVRIqEmSLo7XIS8l0blSc?=
 =?us-ascii?Q?6LweS4Y73FiazjGtN/wC3bjiuCl8mHX3gyfqcVBbx301J2aoie/gwYROHhRd?=
 =?us-ascii?Q?OYyfzjVRHzHTFewXtVjul9s5vpbBWGIyHWk0v/GGCGnqoN0HGd8KQ0ovmNNq?=
 =?us-ascii?Q?I+6Cfo2tkkabsj9YAJl/dhfvfq3zZ4MntxPD1G7Yc/oBhXZgYwhYjs1rYh9f?=
 =?us-ascii?Q?TqV77HnRaiNLFKe0EcH/kCVfCQur/ltlspO8GeK7NCF7G/c7QJN8v3En0iAF?=
 =?us-ascii?Q?EfsmI1t5uuwQ5Fxa0m8SFeknl+d0ZklsM4BbIb/LX+GkNk/xuqRL6SAH+Zl9?=
 =?us-ascii?Q?DGJ9fC8cszM1LZe6aMXTJA7DgA8cnbEfEaj9YaMeRyMbA7lJll17x+lBm56H?=
 =?us-ascii?Q?Yr7MLu3OZi4Qtcm6qgvtxklV5l6k5KX7Ai3klTtoopwkOOlD2Tvw2RNaqhv4?=
 =?us-ascii?Q?JlNICf3v1NOKnMWunbpgsmuNF48UzNc88neQdsE3+8s+UxxhoEE7bD2zZz9I?=
 =?us-ascii?Q?GXxpuXyrsLGGBBj7Y3cdPnKYPqxP733mZlSnb0ZOMH0TpvOCzx47A8J7Xka3?=
 =?us-ascii?Q?+V4xReINAKcjyuMktaa/3KJOylRx6gqct7011UyEEabuPB6Vc8x5+XL0ZMC7?=
 =?us-ascii?Q?NHVu4VxWDS040XK35t7QEWvo55wnhCpoVKnKhVp2ebTo9JCcH+NoxzPnjJLe?=
 =?us-ascii?Q?R7NduRHIBqii5azuGJHO9VPl/NG+9+SIlfsaiNggVFUQm8Nv8Dttzj1kGCxe?=
 =?us-ascii?Q?onBZ0WLz90R4Va/f+vIzXo0NWhKRxSJCC6kuWNn01Fe4KJWx+pYCy4RYFWk/?=
 =?us-ascii?Q?qFBHxzH8ZjjjeiOil9y5ziBv8rtqqC6jodooTyQFwlX47wBnDBVqNY8nGR9H?=
 =?us-ascii?Q?HZK7zs5NbLKnifu/uiBbQJiQ3aMXCZtF5B4pk84hh8GAxUWR8/prmKs+D3IS?=
 =?us-ascii?Q?sM49gxN0oJHnHpk3ARJTfKi05/UMLDE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1b57e8-eadf-4c0a-c796-08da2fd14906
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:34.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duviMxb5jufJhOO/R5isikzs1Fk9KLsb7fNekUSwP5stm9Nt88CkS1KpchjvO/S2hAZeCAr4VOv8PGHVxDIWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-ORIG-GUID: LbyYw0oVr-98hkFmKpomz3UwKRQs4moz
X-Proofpoint-GUID: LbyYw0oVr-98hkFmKpomz3UwKRQs4moz
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The name vhost_vdpa_one_time_request() was confusing. No
matter whatever it returns, its typical occurrence had
always been at requests that only need to be applied once.
And the name didn't suggest what it actually checks for.
Change it to vhost_vdpa_first_dev() with polarity flipped
for better readibility of code. That way it is able to
reflect what the check is really about.

This call is applicable to request which performs operation
only once, before queues are set up, and usually at the beginning
of the caller function. Document the requirement for it in place.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 6e3dbd9..33dcaa1 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -366,11 +366,18 @@ static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
                                     v->iova_range.last);
 }
 
-static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
+/*
+ * The use of this function is for requests that only need to be
+ * applied once. Typically such request occurs at the beginning
+ * of operation, and before setting up queues. It should not be
+ * used for request that performs operation until all queues are
+ * set, which would need to check dev->vq_index_end instead.
+ */
+static bool vhost_vdpa_first_dev(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
 
-    return v->index != 0;
+    return v->index == 0;
 }
 
 static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
@@ -451,7 +458,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 
     vhost_vdpa_get_iova_range(v);
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -594,7 +601,7 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
 static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
                                     struct vhost_memory *mem)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -623,7 +630,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     struct vhost_vdpa *v = dev->opaque;
     int ret;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -665,7 +672,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 
     features &= f;
 
-    if (!vhost_vdpa_one_time_request(dev)) {
+    if (vhost_vdpa_first_dev(dev)) {
         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
         if (r) {
             return -EFAULT;
@@ -1118,7 +1125,7 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
     struct vhost_vdpa *v = dev->opaque;
-    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
+    if (v->shadow_vqs_enabled || !vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -1240,7 +1247,7 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
 
 static int vhost_vdpa_set_owner(struct vhost_dev *dev)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
-- 
1.8.3.1


