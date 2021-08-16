Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0243EDB34
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:48:11 +0200 (CEST)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfmU-0000hm-QE
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhb-0000gj-Oa
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhX-0007w9-M1
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:07 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGbX1d029459; Mon, 16 Aug 2021 16:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=W4lpY0dj94sm3O/uZtUx8TQVK8x1Yaa9DO9CP6I9Zno=;
 b=rOEfmXBrKFRL2uR+LtmrtLsqJkAwmzNRbcvS2rx5TEtmWq2Lim3XXel0H6ViWxxNoGRU
 7u5mFIRYaf5B+ky/iqMLQBZGmJL1qc3nkR0Nbrz4+guwt5D/N1F9caXGQ8fyliar4VzK
 i356gjkgeVCZOc0+xeEBb0w5XLa8DN+pptfOxuzdrDSdcSBE72mWkC3ukTfIdUGwQIrA
 UVGera3pmfm2ZQTCEMY4zpE0qGIZKO8aBxTQ0lz+VN9DNBm/nUsbnCSgrunQdHPWtrRc
 OemD7sxe2qRpNXrnpcX0D6ptxtKdeJEaOk28E+OhsrrEWAJCeycy5mW3hmuNocUQb6jl ng== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=W4lpY0dj94sm3O/uZtUx8TQVK8x1Yaa9DO9CP6I9Zno=;
 b=fg4ekc9a9Kxh50Z/WWI55wQwZBP67v7OWLkuEbFOzKlZfEtRyM6DTiSidoJ7zvrAZL8H
 7IUSxRq+zP4rez+gZXmWruyVmhMXUxkkG9VqoO+moyzQH/XSldjEJ1YWOxVqU/2W9Gnd
 rbYIqScdQ6ldp65JpTQyPSHEs4hK2if0pGeiuzBXy5JOVr/HhOTVZesKhUT0Ly9puolR
 3kBgOJO1FogNBDUK27uvP8AbpR11K/MQVc2lJKWUrHQXRJehk/c1eKkr99UInt2chvkF
 XuQ0lZDSqmdhh1DdaWCJkM8p8ZcWKecjYhQul9cM5EKIoFk15IaKVlfYm0ny1Lut1yOJ fg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af3kxtg0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeo5s159237;
 Mon, 16 Aug 2021 16:43:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3ae3ve34y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DopNxm+FCOJnSi6HRPFSdqVLFseRKDt3CoIC17kjXkx5MHOW7AJWk6OPukeqiwZNTv8sYaPazOXmcWcn/dXAgX5BrtaOMfWy3bX+0uxKnSD6GleCHqPhmovhrK6AabtvLUDQkBNDKBBVNSnw1J1fW3HCimXWscEgpj30tgZ2KIf1HuXT/BP/JnEFPCO3OJGIls6rreIEkiKMPgyVaOs1CCgj5BAeEB6bs7ofEs6Samzr59TY7mjSi8YthRpHZOLv7albjZqZage0SLGvHdjo6th/LKN8osDtuztA534vFtHgCr3p/0NtU8V4o0tIcqooherZMHnAkYytyVATwrHgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4lpY0dj94sm3O/uZtUx8TQVK8x1Yaa9DO9CP6I9Zno=;
 b=NNd8Du8MyoAc0a+zPXlb+9aYvY8TTGac+hq98uxlTI/E3mB1yl3+XWGdr5RKzMtE6AW22V7iecx3Y984YTljR06pL5JWm47NEQiq0XWQcmsaow3D/egR0cCcfPlIvtlYY0i+kcMLwALKOnOXVh86nMhaQeyIxYCC61X3ldL+sDjaigqvUsNSIQoRDcQOdMPVgFUmQigTpcmDUKszcoZeAkJXxyI+UrNCZykofY7m8VK6GjijBb4ZP8MqJovn65gqhU5VS4Jrdw7FVxFF6j66tux90jlHIuk4aCcfPfRqKo7aJsVKAHSc4SsTnHhVXytfL4Vi1zN9OCP9//FMjdGJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4lpY0dj94sm3O/uZtUx8TQVK8x1Yaa9DO9CP6I9Zno=;
 b=OlY3CYU2w5h+KxDhg06fp/DV1p0vV4PNTg37fXLsWfSh/ue4aEn8Mb5RVOHKF0tTOzXZW+Hgm2rjQ2W4fpLm6ldgZ3SD84oYpcJM0QBCKzvVgpKupOOHHDZ4m5oakPgQdYozbTWSQHTUekJ2aFbiJWi1Wf+8xtDeXdEAcLrvTs4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:42:59 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:59 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 07/16] vfio-user: get device info
Date: Mon, 16 Aug 2021 09:42:40 -0700
Message-Id: <d2c6a72f9b0b207bcb2c7fe49abe45854d4e017b.1629131628.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 16 Aug 2021 16:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 620908f6-de42-4fed-f59c-08d960d4e7f4
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB476504B227E992D299ACC7A18CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VrleL+Y+SkdABFTZqjAgI8vXtgjWZRbBS/nYW29S3oo8+sal4gyLT53wrmIV1QAkbs54VOGxNqRenbkpBkC3zyGe1mjOd6puTgP1MgO+U6hSzv5qQkPWEUbEjJc6MKxIuRtznnl+4XS66f0x0grHGNfb3/cDRcYv0zrbzKgu6zBqjevk729jmRviBU4yOb5lin0HoiDjEw1kpNrhLnSfiIkeOxrebNP/GZYKJYkgf7x0gfeaYetVLyRY44q7vEDIfbSm7L4wlHKL1a4ChYzwfATBVYTk5IgBaYJSjFK7G555SLqBWMlnf1Lh9xesx8ZtYCdMRBpqxM8F03KCBO5vmf95/XNapmhb/47EV9Ne7leI/M2Sqp9cTKrOOf+LNrNbSfAvbjcqaXQSgkwYAIgBLBM/gpQKtpO5iRLR9OhsTJYmLGptI0dLpfrcQsqjQGTJUeqdxu8k6iQDOHS7TIHiP4Evs3HXeOI7AXQsWn3PKdMjS5eNd1l0+DbrlL/ypdXwSXlQaT9QE1lRINVcDBLoF4F4taX2VRSNtPQoYcHtVxlu1U9y1L4th8cb60aaCUNkpiW8Zi9h5EBmvkey+LtuLLuoke3JJHIx4z4xe5W95xH4xMCPtPxbh79WX4e0tVN9cDVD+i4exeoWQmwfNoVIrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+1mzodtN4htY4PE4CWwzi8JmQTXuWGaI1qeuTskF8g2XI9NeTTeDe3TiR8Sq?=
 =?us-ascii?Q?koUO/ttbwAqI5lhJeM80hvFsmzcKNBkamHkCVP+40nn8Yvwat9SsNcz40MVe?=
 =?us-ascii?Q?20g7RdDj91CKhzdIHwCcW8De8nYSEtTS8oW5IgnCDFnfbUtolXMXAfL0rKgt?=
 =?us-ascii?Q?hk/tgLjT+SWmIAB8S7a1F0U3EENUGm1B9Qfmo8V/SOjdEi6nxc+Maow0VDpr?=
 =?us-ascii?Q?euKCaKV95SaWXWJimuy5r3EmbRbnYZnfAABBxfhNKlbuAp7IVV47JWx03KRG?=
 =?us-ascii?Q?RvG8P20UjNNKoT1zI442I1eM+7I6Bd5miymDmRmI1KxCoJkPkC/9M2z9WsUl?=
 =?us-ascii?Q?vnjbcbW/DAEWmN4LwHNtsUwEceBB+bT2ZmvegoXa3S5h7FEed4rIFYmqIl20?=
 =?us-ascii?Q?DKxgf6kj4olZoDFqpUv2IFS1MgV+EBcHr7dnCBSvsE5gkbkWQg2CHtTJDPJ/?=
 =?us-ascii?Q?cJaYWPg6JqP3eWoe6zSfFXCm4kE19kP8HLTRA7TmXgcCex/jl/yZ82PXjEW6?=
 =?us-ascii?Q?+Ey8aEnUxmiJycSOi0FVeU0GihFjYuImsrGGKHYon995DmiPzxnQCHGAfjiN?=
 =?us-ascii?Q?79xIViACRTRY3NGm3JMU7OsV2WkOIQrcpTAOlNl4QST9Zbw1cQNdZ2K5Erv+?=
 =?us-ascii?Q?NbcfgI3G0KT+XzkdVfW3K6vVipAZzJ5uJEG0X6pbL+tlMREv2vOS/SWXlUH+?=
 =?us-ascii?Q?zLBeScwx26iSya8s6o16aI+A5SW64wrU2d1uUQm3Z5FuNS6uoAjfya3PB7W0?=
 =?us-ascii?Q?T3fi+FSWN1QGaYPKr6aOOu5O3EGRCAEOvXGQ4ssoWqNK4q4zetTwFarhiw7Q?=
 =?us-ascii?Q?povWh7Mrd5tOAgCR63Ft3AqYDk8Izc6b0fmOBzZP0bFK1l2KetMSC5vVEAUX?=
 =?us-ascii?Q?G0k1xYHVeyQVfLkKVWW8QOA3aA9qA6V7VsDM8vk333zzCDFuPyXza+sXImwp?=
 =?us-ascii?Q?x+EuM6aOSgbboESg4J/m+fbX3ZyvhaRjBncw6wsuju+enp+NO1KfhbB2bsOs?=
 =?us-ascii?Q?upwITkxJy07CHZM2zdVNUA/mL82tjgiGo+YCO2HlfDCLi871tKWUI08J0lt1?=
 =?us-ascii?Q?WtPPlF1GA2t5LxGQCIk5Iy77Y/sPT4iEhZSuQZeYemN6EjvMDumY6V+K/W/t?=
 =?us-ascii?Q?30ztsS44EYBts+cOdnHSd/jgTjNm6M0GBWmcO/+mhqLApvD48UFVzGGLLzuK?=
 =?us-ascii?Q?Vd78EBj3kYats2uNYXxXCIUhn7EdvEqokG5xowl2LS83fVu6Wxgf5NdJwnxd?=
 =?us-ascii?Q?S+aPjdInw232xOEj48DoP1bNIn7A28eV97df7KAp725XG23HFMS0Sjvm8xbd?=
 =?us-ascii?Q?gsQLuclSNkFPuFplmoxVKpz10X+kEqyl9mUE/QgrDNeMkhF2dQIr5b8PS7Cx?=
 =?us-ascii?Q?IRYJmcaFGcUWgcA5xD/8ScUsRdrL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620908f6-de42-4fed-f59c-08d960d4e7f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:59.2008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx4DGMYG9ilVo/+o0PKhIyy09Eqhl7GeBJOmj/Th4vHWNavBgMpnFypqoVsi2JQ0nu1qh6XeYl8Sw1KWc0D2eum+szpu7tEwKr6w6DFmygk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: ZhRxo4LBAlc5gDS3M7WOofluhnF4Cmqk
X-Proofpoint-ORIG-GUID: ZhRxo4LBAlc5gDS3M7WOofluhnF4Cmqk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
 hw/vfio/user-protocol.h | 13 +++++++++++++
 hw/vfio/user.h          |  1 +
 hw/vfio/pci.c           | 13 +++++++++++++
 hw/vfio/user.c          | 20 ++++++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 14b762d1ad..13e44ebf1c 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -82,4 +82,17 @@ typedef struct {
 #define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
 
 
+/*
+ * VFIO_USER_DEVICE_GET_INFO
+ * imported from struct_device_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t num_regions;
+    uint32_t num_irqs;
+    uint32_t cap_offset;
+} VFIOUserDeviceInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index cab957ba7a..82044e7e78 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -71,5 +71,6 @@ void vfio_user_set_reqhandler(VFIODevice *vbasdev,
                                              void *reqarg);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
+int vfio_user_get_info(VFIODevice *vbasedev);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index eae33e746f..63aa2441f0 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3369,6 +3369,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    int ret;
     Error *err = NULL;
 
     /*
@@ -3410,6 +3411,18 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->no_mmap = false;
     vbasedev->ops = &vfio_user_pci_ops;
 
+    ret = vfio_user_get_info(&vdev->vbasedev);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        goto error;
+    }
+
+    vfio_populate_device(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
 error:
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index e89464a571..b584b8e0f2 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -714,3 +714,23 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
 
     return 0;
 }
+
+int vfio_user_get_info(VFIODevice *vbasedev)
+{
+    VFIOUserDeviceInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
+    msg.argsz = sizeof(struct vfio_device_info);
+
+    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0, 0);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    vbasedev->num_irqs = msg.num_irqs;
+    vbasedev->num_regions = msg.num_regions;
+    vbasedev->flags = msg.flags;
+    vbasedev->reset_works = !!(msg.flags & VFIO_DEVICE_FLAGS_RESET);
+    return 0;
+}
-- 
2.25.1


