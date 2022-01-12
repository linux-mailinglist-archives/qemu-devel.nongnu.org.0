Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBED48BC14
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:56:57 +0100 (CET)
Received: from localhost ([::1]:36660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Rwe-0002fG-Nr
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:56:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdZ-0000hR-7z
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdW-0005g8-8y
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:12 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMee0e019911
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=O46CeKAoCwJci9BkKVpel/pOtz6Zsoy2rmFNOW/ZxLY=;
 b=riA9Wu3WU5Dot4M4kxELPZWpcti/E+8UWZl/PEeUZJex48WZJYz+aRvLuzdZ3vmwQtH6
 E9CmPFV/Zi3pKtd9C4TVXyAQ3uhznH4/1eY8Up90Dj71qwWNTabVJj64Ha8KGnOK3bDP
 D5FlmjIPS7tqqCWRc97sW6NmSnyiTS+g3kj6dAuj0p+W4p0xn8YJ+DoltGPafOThFWxc
 ASTUSDRzGsDiLsTfiXZIoy/6fS194/SVK95pA9CVekGWnHR+Rz0mweSfYFdR3CAZIcHv
 VnvFR3tpaSI6I09kgkdcY95f5arBzNTVLSG1ZkiXetOkkHL4diXPkXD3BryWJSLkkjpM dw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4sh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KATb069271
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3030.oracle.com with ESMTP id 3deyqy1gju-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVG84PDqmTrpkjgSFrLNs7pDH7qJN52urAWd5cQmTPNi559gZjjdmI+LazZau4hkDT/nce1EyLC6RdHywyrRxf/SxR2fRP7nKvEurG3AAzWXNQHOUkQ4okYYNHIGft966v7Q1o1aFSeUL+M8A9gwyAWStujvkvDZLbjb7gCxFQULkpNEhghP4CsDXyWvPTXCEuQXs1IhVGeRUFxavPs2JFSoaViL3ZgvLIpI9IagKhWWUx5MSR8kX7QI7FuXvEEMSn+H4W7hqH9refVtF8cj0DlMzwjg4ToWThEkF710gWHxiG3YgZoeUJewdOuszifCWzsMEBrjsAaG3ImSxaFlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O46CeKAoCwJci9BkKVpel/pOtz6Zsoy2rmFNOW/ZxLY=;
 b=RXb9bZkpWxQN/L1Qp0tZvqz0K0qahP0wxqrtdWzS7HduTdXCLOELm9cSHSVWQ8qzUFeVO6x5RUE9ow2zuZS13Y4FSrBDFC9JjlNtAKrqJ1YV27BtdvC7n6GSwwazkpTtT7T8y8Kkqm50owmkuoe5kC0DobEubKAsxqjEEZfVDI+xLZhlx2GRCgCl3PpOUUzUcJ0xbh9NN/tkgASSh2NUFJcCYUgKmqJDuczPv2PFUMeOcSJs0fcK/BJkgvngYQU763N58bSMnWoSH6YVveef4Gr8flFVrqawilsJZ40isM2oO9ZN9FeZITQO+RfqhNmK30FZLlzwNslqtNxh3UOmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O46CeKAoCwJci9BkKVpel/pOtz6Zsoy2rmFNOW/ZxLY=;
 b=jC3DhQf8gRXQxnC9v+aa5gyA5z4DPqlDzofwULTsBtaTEArTA9Er76pLptxBw/WNm5Ih0yFHPP9aDPx+nrgHcAUoQu04BJqACYwUahw5nhJ275x33WY+54DqYNW3WHXlJ2xJrnfXvSV506/3DuEmoLA54lWUnS8zIdWhbATsJHo=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 12 Jan
 2022 00:37:04 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:04 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 04/21] vfio-user: add region cache
Date: Tue, 11 Jan 2022 16:43:40 -0800
Message-Id: <719c102ca37546208637f479054da1ebf00957d5.1641584316.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc45464d-63f6-4a3b-b5a0-08d9d563a7b0
X-MS-TrafficTypeDiagnostic: PH7PR10MB5813:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5813F2C3967027A0E4E95A10B6529@PH7PR10MB5813.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:407;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kj/qiXd1Et0bsznz/ilhYdt35AZmb+vg3W/EKIQghXnkNdq70rSlZPtCfANydlkI7/F9DoyrMqSm0PCgaraBpouSvNZLJgO5J0uBgkAIubod4rNhbMwDQDNUFCp2/okOo2R4e5et6+Gr0zuzzBIGTlXfcPRufvqPbIh4E1Js2zc6paCJEQpc+qvxXyZXPGBIVePcJXmrgXvWd+e8VDkvzDLjH7YOe4quCKxRYO1ZMJVni80lhFIcL9xW2A9PqEC3Ianrcq1Q+Ze+Ha6aupXBKR6O8hC4mMZ+8jhM3l0A4Wqw+u848libmdZ6TrrpTXfrhhba7NjdMdPhp7d2sbePkyJlHYzbpwz1+0KPK+TJmWiXTQPbf2oauE/El+VPnq2OpWTMAeF35e+gUbFCLtlQz4aBnhJAszbcOs93v1gHJjvNG0UeuVeMuj594mu2bX+tw0jnWgzgWBmBJBHcmUjq4oMj0PGOKaD5erYuWSQgCxy6Hz2CwcL3McX7jJcc8pQ2gqS/0O83dPBlfE0UpF01L2f6BjY/sX8Kq8zOgAZ86zIhUFeC03zR5joLQXlxTMzjRRa1+RpkeYhaXYOk0W8xq9snMAZxK8bqRaY3oJ6zpMgKL6N+LXUKS0j0p7zDrBpaXKGh70QzyesENmf3BEdeuO0kVsbCSJdNjPP4K66iDN86PMF/bwIOdke7c8jnlJdv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6506007)(8936002)(26005)(6512007)(36756003)(186003)(8676002)(52116002)(6666004)(86362001)(6916009)(6486002)(316002)(508600001)(2616005)(83380400001)(66946007)(5660300002)(38100700002)(66556008)(38350700002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s5diFKyxW5mE9A+4lEB/RzgEGfko3x42wUtL44VWnYcnjqRy4UxFKW6b8oBT?=
 =?us-ascii?Q?n54jz3gN08pZ0Vs13o1KeYcUKIuPOakppbpLw5nJeK5im6TxY3K/gwIeoFBr?=
 =?us-ascii?Q?qNa+Z4Bk6lkiNC2U7c4gnbIkPWWxGLuvQh6/lQyiB/z73/khyJHPXGF7ugS4?=
 =?us-ascii?Q?ba5cODZJtGoWiTkm/ukIIS+1rKKnWx7qOFD1t5OIRpbqs5EPbiW40YBXcuKt?=
 =?us-ascii?Q?ROT04RUQA62kAAiIqzcerX63TcrBczaLfHTBq3+LxiLai4j/YZnkRF+wiyuv?=
 =?us-ascii?Q?5TxLlbSvPKkJhkrW6O0eyk9aIh6ryECXr/2lRXj/St05HByhr/0CwErcWxEr?=
 =?us-ascii?Q?V2rhD3/hYBDKsSBCBOmbpl9rUTNJi5u4SlGlHD7kKYJvNtj5SyFe253dsfwj?=
 =?us-ascii?Q?e8gqFB5JhyBOfISM75bxNZhNRqmxUZl+DASjVkhY8s81hlUQJr8cCSKo29u0?=
 =?us-ascii?Q?M9yISchAellGY+C/O23DD5v1iiEYef47BHV171n1TDG7iCvIuhphid8Qj9LI?=
 =?us-ascii?Q?703SYNlawzG2G7HluTftXcqiR6+u9DKuRiCxSnOGP9Xkt8d4Pj8KFe41vfXc?=
 =?us-ascii?Q?AO1jnOgAbqzJflIIXlGrBiTJtdRnX4EohiSdLXV2DbJrUIstHvTLkZZ7bgdp?=
 =?us-ascii?Q?z4rgJK3RtDQYBnX+ZZIQDXQapF8EEhQMum6gnRpzuA7WhkV0x3LJdxCeQ2Pk?=
 =?us-ascii?Q?Yi7gJtBH3m5gq/92UB7Zx+o1/uld8oySs3KSeCvplNHdiseP4niN/HiyWgaP?=
 =?us-ascii?Q?CjHamSZdVyak+diVMIccYKVePbw1Is4ChaRmxEb+dfvvM9KaxGBaLuImWASd?=
 =?us-ascii?Q?2EgDLUsPC+THZpdZsKKAQkxOov3u/alAxiy7klMlUr24Cp7a4GbfA5QdPLQP?=
 =?us-ascii?Q?RkpETwVv1+C48JaRCelyoWQxj5mTdVKoMlflwB7xdg97lYmTUJCmFRUtSNN2?=
 =?us-ascii?Q?4zm6PQkzysIZXlCj4N3GOM16eb2p98+1wcdY7LdNBDq8JABbY0oVp+pVt2YU?=
 =?us-ascii?Q?4hyaOd2qmG3JnBwDZoywEvhKv35zGo+IvWOnqAxFZz0JTroXtcUMXGTpd9AK?=
 =?us-ascii?Q?6Zt6qs1mc338fXIKp7u3E5Ck5g1GHLS2FARs9tolM3awVVppnJ8Ub1SgeObl?=
 =?us-ascii?Q?CRRRB+hnO+B7IkgVR4kDkkjv57zUhndqZqIhF6I3Nh/cnGkeFZMqHy5LLdF0?=
 =?us-ascii?Q?J+9ILkSeVbwXiVYavF9G1uIIWWf78TKmJfwLlYIjjl+pS2TXFjZh2jFFUVBd?=
 =?us-ascii?Q?5DrcIOums5JdS8HZtmdDfAkiXGwJZpEoSOYrYNCiLuitcIddIY5auB1QwnU+?=
 =?us-ascii?Q?fqkLfPlTNbTq7D0ierLCJcS2oQAYH9aPJ4/bgURtcUCqPuBfh1kvbPdqOTwe?=
 =?us-ascii?Q?S1pxOk/td7lw9SZhW7STidITVqHEV/YbqHUWIS/jKvqiEogpA66Pb/0pOeao?=
 =?us-ascii?Q?Iu3CFDgC74m2r3d90h61axSfw/DaCNhkvJXpo2mD2W8VkkAIxKGCgrhvkWyf?=
 =?us-ascii?Q?oy32xJAYdHtsOKpHGwICuy5pnw2ChZKgt4KWr33WWQstACfXIMJb2iNpEBaP?=
 =?us-ascii?Q?egG/rsjdQjrf4aTXMBrR7AXP8wntxXxVJe9cu7jSpkdPnb2IbKQ8Ui5nWO/l?=
 =?us-ascii?Q?j+ShNmMfpn5Z9J1LZiBydWlCEp3P+eW3+c5z1kQX/hToXQaf6m8qO0hW1ZQK?=
 =?us-ascii?Q?zA+J3Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc45464d-63f6-4a3b-b5a0-08d9d563a7b0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:04.2427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICl74sWA1Yw4PFZkty8tIFazdrTjhusy0bVMpGLcJKZcaqHFL3R76psBSkSoAOZw05nqr0M9gHem/JWjakhVEBBzoC4nz2vdEMikfWHsJDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: 5pyOGxKwyPgi-OeWA56_jf9yV3-WnDqc
X-Proofpoint-ORIG-GUID: 5pyOGxKwyPgi-OeWA56_jf9yV3-WnDqc
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

cache VFIO_DEVICE_GET_REGION_INFO results to reduce
memory alloc/free cycles and as prep work for vfio-user

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/ccw.c                 |  5 -----
 hw/vfio/common.c              | 41 +++++++++++++++++++++++++++++++++++------
 hw/vfio/pci-quirks.c          | 19 ++++++-------------
 hw/vfio/pci.c                 |  6 ------
 5 files changed, 43 insertions(+), 30 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2761a62..1a032f4 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -145,6 +145,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    struct vfio_region_info **regions;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -258,6 +259,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info);
 int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
                              uint32_t subtype, struct vfio_region_info **info);
+void vfio_get_all_regions(VFIODevice *vbasedev);
 bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type);
 struct vfio_info_cap_header *
 vfio_get_region_info_cap(struct vfio_region_info *info, uint16_t id);
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 0354737..06b588c 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -517,7 +517,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
 
     vcdev->io_region_offset = info->offset;
     vcdev->io_region = g_malloc0(info->size);
-    g_free(info);
 
     /* check for the optional async command region */
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -530,7 +529,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->async_cmd_region_offset = info->offset;
         vcdev->async_cmd_region = g_malloc0(info->size);
-        g_free(info);
     }
 
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -543,7 +541,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->schib_region_offset = info->offset;
         vcdev->schib_region = g_malloc(info->size);
-        g_free(info);
     }
 
     ret = vfio_get_dev_region_info(vdev, VFIO_REGION_TYPE_CCW,
@@ -557,7 +554,6 @@ static void vfio_ccw_get_region(VFIOCCWDevice *vcdev, Error **errp)
         }
         vcdev->crw_region_offset = info->offset;
         vcdev->crw_region = g_malloc(info->size);
-        g_free(info);
     }
 
     return;
@@ -567,7 +563,6 @@ out_err:
     g_free(vcdev->schib_region);
     g_free(vcdev->async_cmd_region);
     g_free(vcdev->io_region);
-    g_free(info);
     return;
 }
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index dbf23c0..30d2c6e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1568,8 +1568,6 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
         }
     }
 
-    g_free(info);
-
     trace_vfio_region_setup(vbasedev->name, index, name,
                             region->flags, region->fd_offset, region->size);
     return 0;
@@ -2325,6 +2323,16 @@ void vfio_put_group(VFIOGroup *group)
     }
 }
 
+void vfio_get_all_regions(VFIODevice *vbasedev)
+{
+    struct vfio_region_info *info;
+    int i;
+
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        vfio_get_region_info(vbasedev, i, &info);
+    }
+}
+
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp)
 {
@@ -2380,12 +2388,23 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
 
+    vfio_get_all_regions(vbasedev);
     vbasedev->reset_works = !!(dev_info.flags & VFIO_DEVICE_FLAGS_RESET);
     return 0;
 }
 
 void vfio_put_base_device(VFIODevice *vbasedev)
 {
+    if (vbasedev->regions != NULL) {
+        int i;
+
+        for (i = 0; i < vbasedev->num_regions; i++) {
+            g_free(vbasedev->regions[i]);
+        }
+        g_free(vbasedev->regions);
+        vbasedev->regions = NULL;
+    }
+
     if (!vbasedev->group) {
         return;
     }
@@ -2400,6 +2419,17 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 {
     size_t argsz = sizeof(struct vfio_region_info);
 
+    /* create region cache */
+    if (vbasedev->regions == NULL) {
+        vbasedev->regions = g_new0(struct vfio_region_info *,
+                                   vbasedev->num_regions);
+    }
+    /* check cache */
+    if (vbasedev->regions[index] != NULL) {
+        *info = vbasedev->regions[index];
+        return 0;
+    }
+
     *info = g_malloc0(argsz);
 
     (*info)->index = index;
@@ -2419,6 +2449,9 @@ retry:
         goto retry;
     }
 
+    /* fill cache */
+    vbasedev->regions[index] = *info;
+
     return 0;
 }
 
@@ -2437,7 +2470,6 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
 
         hdr = vfio_get_region_info_cap(*info, VFIO_REGION_INFO_CAP_TYPE);
         if (!hdr) {
-            g_free(*info);
             continue;
         }
 
@@ -2449,8 +2481,6 @@ int vfio_get_dev_region_info(VFIODevice *vbasedev, uint32_t type,
         if (cap_type->type == type && cap_type->subtype == subtype) {
             return 0;
         }
-
-        g_free(*info);
     }
 
     *info = NULL;
@@ -2466,7 +2496,6 @@ bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
         if (vfio_get_region_info_cap(info, cap_type)) {
             ret = true;
         }
-        g_free(info);
     }
 
     return ret;
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 0cf69a8..223bd02 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1601,16 +1601,14 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
 
     hdr = vfio_get_region_info_cap(nv2reg, VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     cap = (void *) hdr;
 
     p = mmap(NULL, nv2reg->size, PROT_READ | PROT_WRITE,
              MAP_SHARED, vdev->vbasedev.fd, nv2reg->offset);
     if (p == MAP_FAILED) {
-        ret = -errno;
-        goto free_exit;
+        return -errno;
     }
 
     quirk = vfio_quirk_alloc(1);
@@ -1623,7 +1621,7 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
                         (void *) (uintptr_t) cap->tgt);
     trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev.name, cap->tgt,
                                           nv2reg->size);
-free_exit:
+
     g_free(nv2reg);
 
     return ret;
@@ -1651,16 +1649,14 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
     hdr = vfio_get_region_info_cap(atsdreg,
                                    VFIO_REGION_INFO_CAP_NVLINK2_SSATGT);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     captgt = (void *) hdr;
 
     hdr = vfio_get_region_info_cap(atsdreg,
                                    VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD);
     if (!hdr) {
-        ret = -ENODEV;
-        goto free_exit;
+        return -ENODEV;
     }
     capspeed = (void *) hdr;
 
@@ -1669,8 +1665,7 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
         p = mmap(NULL, atsdreg->size, PROT_READ | PROT_WRITE,
                  MAP_SHARED, vdev->vbasedev.fd, atsdreg->offset);
         if (p == MAP_FAILED) {
-            ret = -errno;
-            goto free_exit;
+            return -errno;
         }
 
         quirk = vfio_quirk_alloc(1);
@@ -1690,8 +1685,6 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev, Error **errp)
                         (void *) (uintptr_t) capspeed->link_speed);
     trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev.name,
                                               capspeed->link_speed);
-free_exit:
-    g_free(atsdreg);
 
     return ret;
 }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d00a162..cff6cb7 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -790,8 +790,6 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     vdev->rom_size = size = reg_info->size;
     vdev->rom_offset = reg_info->offset;
 
-    g_free(reg_info);
-
     if (!vdev->rom_size) {
         vdev->rom_read_failed = true;
         error_report("vfio-pci: Cannot read device rom at "
@@ -2518,7 +2516,6 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
         error_setg(errp, "unexpected VGA info, flags 0x%lx, size 0x%lx",
                    (unsigned long)reg_info->flags,
                    (unsigned long)reg_info->size);
-        g_free(reg_info);
         return -EINVAL;
     }
 
@@ -2623,8 +2620,6 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
     }
     vdev->config_offset = reg_info->offset;
 
-    g_free(reg_info);
-
     if (vdev->features & VFIO_FEATURE_ENABLE_VGA) {
         ret = vfio_populate_vga(vdev, errp);
         if (ret) {
@@ -3032,7 +3027,6 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
 
         ret = vfio_pci_igd_opregion_init(vdev, opregion, errp);
-        g_free(opregion);
         if (ret) {
             goto out_teardown;
         }
-- 
1.8.3.1


