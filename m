Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015C449FF0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:46:11 +0100 (CET)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFH8-0000KK-GB
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:46:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAf-0005fz-0j
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046e-0E
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:28 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A902t72010230
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=grDeY9SvJL8oyUlVLsUMebxo55ztUepyWzmJ963DcBg=;
 b=XBLElUFSyf0LiwM3rREMBaPLZzkxmxH05VCwTny4oz3j6rJkwg2q/vti2C8G/FjPytpq
 PYMFDTOQSYOZIeoiEhdY384LfbUSEd/2Et81Dtmx7dLQI0k7P/TK34cTU0IRgsZSI6Ya
 z91EyZLlkfmYFPW5bUV4nDQCDpA0LDPb9iCeXsLEGVNboXIkL7cRf3xjKm+xLCRCscV6
 yPn/jF9dIYm/ZGIINalhGBDLmXG1eaeO18Cw2jDPDW9qzSBrCI2tjQcFSy9sgsizw3dA
 OYK2mxoCCZYmyvRIKQuKd8vHMctg8fmQUPPNvHaRNOxdEDl3oS4nSy9fsTKOZcePFWo9 tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6usnfjka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90Zxm4132637
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3030.oracle.com with ESMTP id 3c5frd6sqb-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAYnwAKTu25YgUUOCGdU7w9wycifyXQlmVk2JSSZbCstEaLfglQO7o7qP6cWtbiAQ8JJ5lbLyEXrhEO6DtGjwpNw601daEwibQiFNc9YDieCWfyCccNDVERjsnlSF9YX+43Ou7ujK4abA+0TM8+R6xVzNyEGQ4vj1SN+F3V/n2jOWcbR0ljlqcE0Kb6lveFVAI5K+2u8/MQXxuYbAP0CRUGyqidJPlSsiJafFolaReT9JD67YyEqnCcEyrJ32Upkiqj1Fimd6tnwZgxd2VCFM8gbe5IltFmfQNtK3UmP6o0X5ulz1pugGm88DsqrMfHU2pxGPOTJgH84TFCp98cPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grDeY9SvJL8oyUlVLsUMebxo55ztUepyWzmJ963DcBg=;
 b=BIo0/Rzl69Hcv7HPjbWGt/nvjdtQk9oiLcdlK4u4HV47GGRDStkzCtCBXbt2A5RNAr0vwhsdx5Kte+71nnrUHN4Q6Fw2n9IrUegV6Ct+u1VpRT0jgGNacy9NokfMeXPbB2IXOdMEwzZkA0KGitLKQnS3eQlFbQHSHmnpdQmyl3rvK+tQ2AB6kGjWGakW/oxhK6E0neL+N2tQhMoKrZR4a2LZ/VCD2JjzKFMLr005UzVneeirbaYZH9klHlTCDLZDoqx0fE/ujCy2Rut6zC7cl1kLPsRrEjub/9v3Ga77u2Omf+6EyUgEZLuS4lcrf8x+Zq58zeI5z1G5p7py9tXqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grDeY9SvJL8oyUlVLsUMebxo55ztUepyWzmJ963DcBg=;
 b=uQbTLqT/JVc5DFP7rLiUK29uwPrx+CM+iw4KtZ9K9WFucFNF0JQL+OWjDKFQTtk5h2eFO0J6fnoXfwqWCjqEaCv8WWCk13fb07bg905XxaXw2jqdk+BwWufXmYlyDUHNZXH0hwpzIg1IiQv+Yd9Y/oGHSi9NMsl4fFo+suk+Ls0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:14 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:14 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 09/19] vfio-user: define socket send functions
Date: Mon,  8 Nov 2021 16:46:37 -0800
Message-Id: <5fb1f506cb2d66258da979e4d1a9ac717442675f.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c14819-32ee-430e-c0ec-08d9a31959b6
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40686DFBFCD5B7276E2A43D2B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7x+ZS/WM3BSt+Rh0LNS2aQa4V63z9Wi5RKhYNurdwFU2cuOMOq6Y3Err2JmEpq54PTTZj2nlCG0TrPPw1d9fB0FoajhuBbBdsS0WdGf9QFPzuU/Mb4GwvhSzB91y6d7dXaNxHuGYRc+5G7DAbU7ZCMOI8wVWlXAIITxn7/1xIE2FBLnZiANv4uHYk7lJB6WUyrTak6/us80tvCg2aEqCiZqyAu1W99AN8kOnPhoQl85TAoqMgWOW2U+aWK+z1PjkbaS7gPeB1hcARgogEKsA3qE4vuHJHcZoNKTwDQ/snBWxct3qvv6E12K33l9uL7jGJP+TXU9WpYr+ttLHcTmn/9xfvXxG2tHoa0G3rsCEXpo6TN9UlwEUqFlQ68Ll7TG2TNOBKi98vEoTPBVkFJpQ7l/jJIMV8t1m4VpDvL4+fGWilavnSn7Xt7Y4LkpUQouRWJhV9HCAD8FGuK8ckB85iu0GOPfZu7JVnemMtaFqHcyKTNAQPWCEKPRsdNBfcR+H06QLloRupupUoWKBx4RHXQLo1d2rSk7kbndvhjulxKi5g2TwwHeribuHv7Q9lXvQzwA3xB2CZUmpgxR6/gZHpctx3xvkUw/006FRl8Dy4/zQweL8ONNYE+TXsRGskJp7RR+n6JzYmo7o9znHTRrR01FxcEZ2bJeWED59+WNXEzO771jZ3gAZKLduTBG1TzropdahAMwDGJme0MsrlT5GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(30864003)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zSDKkDW5AoIVUogOrOy27fo+Yn95lfkaEub9cwPDKOm1D+b+ZrrqquUytqa7?=
 =?us-ascii?Q?fy0s2enjc7PHrZm0zC+GTs3Uas5pvtAxV7HpjbhDoslngpHQqyvd40AHWYrG?=
 =?us-ascii?Q?GJkmcK6rLEN1Qx0+xjJ7k0xr5ZbaRQUeVV+Bl/MB+xA7WMzZ0VHm+0o42t2F?=
 =?us-ascii?Q?mZsBVdDozXNUrCxCWIClCDoR7Wmqm7SvfwMdjdjrTyaHChfbQfu723B7LXAX?=
 =?us-ascii?Q?dfY4gqQ1YOaqtBZYDEdr7KCwL0UlxTDpuBrJgwfFXDO/SeSaRfbqMXaFbuxX?=
 =?us-ascii?Q?GmG4syihhW5CgbKBRhQ4LrzWY9si/eSfPgfikdz+xaWDNX0lbduk4F1LLjDv?=
 =?us-ascii?Q?nVaVv4dISnzo96FldX7OIZw9IdUjXLjgbXG7Zc5fdi2kbnTNlS4i5pJL/BGD?=
 =?us-ascii?Q?psxHTPVZmt2lb0c5A12iFOA6ndMnPcUt3TUZLmX0H0HSa4Z2PY6yq4lx2ZJt?=
 =?us-ascii?Q?JpCje1g8jYK4GsHYkIvNH9E7jRVWnVHm3hUlDNADRc5pUPVSqeh+1VslK2gC?=
 =?us-ascii?Q?3y8kc3TS5RyNvuNMeFzKNg/BcomF0Q+J7S3oC28DJR5nadAQ3QSdlSLogtVb?=
 =?us-ascii?Q?dCWiMduv6kEyekOjbwO7gQO2gJdpMBYWL2cBm9cJVx9k3NAog06LPckbfe7H?=
 =?us-ascii?Q?8JUfwpL1UKyD1YBiKKdTqhg/G/lQggjQOeShHTN9yM14XwOXDK4WXu+yMbCP?=
 =?us-ascii?Q?ISnelksO3GnCEkuPmeEUPntZPtprvyB5flIK4L0zJXucs5Hjjhuy8rriBPks?=
 =?us-ascii?Q?UGFz6kY4/q2S3/DFzDbMRZclx/dyOa41RTQ1HgjYqIfa0YeCLdgyl46ZC7FY?=
 =?us-ascii?Q?SJoyB3XHkR/ig/MBf70iS8exHKJMiSIaicj7Vx0i2URLVI6zfgB9wJb655Gq?=
 =?us-ascii?Q?31ARpYIeg6d3MRX04gEgs+j+ym7OURgLci/mX5vKUe0PwxDU7UGLL/CxHr+P?=
 =?us-ascii?Q?3W5njvPNJoWD45K4lTL8ITgb0NMkqZnWVAAiFbkvPg/+IxY8tZeeo3LbV/wf?=
 =?us-ascii?Q?HNEROqUHTqPrkPTib+JIlHy9m+z3nYoxMQK8wis45hYMVoDwdkzHh7fwjlTY?=
 =?us-ascii?Q?hSQ1iS3oKk2FNHL6tGZjlVSYFlml08THQZwl3oodM4kIBRYrqKw2aHtSJUyW?=
 =?us-ascii?Q?EHS1X5F5E+woBLl+89I3FFyUFH7kowu5rR1WtEzuJMeDEGnZXTkurRy15rym?=
 =?us-ascii?Q?bWGBImtHC+sdHsr/lJ2rGKMdKWIpzwO6qj+sL4HlWfVjVyu+Ozh5jFAPlylH?=
 =?us-ascii?Q?fSw/iQEvWeZpLL6ocl9FRAbifeCwoWcA4kCHspK/PVfE1tetiyyY0ZT7+bXJ?=
 =?us-ascii?Q?MEpsT7PUFWvDJDPX2urzYGsBaENNZxLx7Bz9HG/yIKhvve80vfe/uVuxLtRc?=
 =?us-ascii?Q?B7jF9FSjD5hrn4WXFr/fuQJAo5LxhJ/AoVn48r+fEq/yA7Vpmhud4LURQqrj?=
 =?us-ascii?Q?QqZ8m5Ksx06gtK3213q6gom2xu2xPbgTkkmP/03fB4J1Wh3VVl5d/w6ddSJF?=
 =?us-ascii?Q?02OmphhPPKlf8IBGw7xH/fh8oO43KK65RHq4oUdd9e8rEqk7qR0bSWdYa4de?=
 =?us-ascii?Q?lQs/fBTbZR1QuAdT7opG5+4sCR4sf6MJ6S4IQ8PNjGLCSj+p8N4SL1GwzgOP?=
 =?us-ascii?Q?efCDgDMwiA2+CNysvYWxQESAp93kwChNvDF0U+ztP1qvPpGL4HEck9GHM8tr?=
 =?us-ascii?Q?L4q77A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c14819-32ee-430e-c0ec-08d9a31959b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:12.5190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcLTFS/GEoZugHw54F9AFvJGae47BHPNMFWxiVY9hx3FVSeYMBbHFMC1ghulRaxgzdyWCFxjQk+iFYT4Lzrt3vdc3KAnjFKpFPWTYNQBKMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-ORIG-GUID: ixwBJF7iFl9CvCS9vCZS5x1HUdve5Fto
X-Proofpoint-GUID: ixwBJF7iFl9CvCS9vCZS5x1HUdve5Fto
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also negotiate version with remote server

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user-protocol.h |  23 +++
 hw/vfio/user.h          |   1 +
 hw/vfio/pci.c           |  11 ++
 hw/vfio/user.c          | 411 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 446 insertions(+)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 27062cb..14b762d 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -52,6 +52,29 @@ enum vfio_user_command {
 #define VFIO_USER_ERROR         0x20
 
 
+/*
+ * VFIO_USER_VERSION
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint16_t major;
+    uint16_t minor;
+    char capabilities[];
+} VFIOUserVersion;
+
+#define VFIO_USER_MAJOR_VER     0
+#define VFIO_USER_MINOR_VER     0
+
+#define VFIO_USER_CAP           "capabilities"
+
+/* "capabilities" members */
+#define VFIO_USER_CAP_MAX_FDS   "max_msg_fds"
+#define VFIO_USER_CAP_MAX_XFER  "max_data_xfer_size"
+#define VFIO_USER_CAP_MIGR      "migration"
+
+/* "migration" member */
+#define VFIO_USER_CAP_PGSIZE    "pgsize"
+
 #define VFIO_USER_DEF_MAX_FDS   8
 #define VFIO_USER_MAX_MAX_FDS   16
 
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index bd3717f..7ef3c95 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -81,5 +81,6 @@ void vfio_user_disconnect(VFIOProxy *proxy);
 void vfio_user_set_handler(VFIODevice *vbasedev,
                            void (*handler)(void *opaque, VFIOUserMsg *msg),
                            void *reqarg);
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index db45179..1bd0f6c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3512,6 +3512,12 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
 
+    vfio_user_validate_version(vbasedev, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
@@ -3520,6 +3526,11 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->ops = &vfio_user_pci_ops;
     vbasedev->valid_ops = &vfio_pci_valid_ops;
 
+    return;
+
+error:
+    vfio_user_disconnect(proxy);
+    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
 
 static void vfio_user_instance_finalize(Object *obj)
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index f662ae0..edf1816 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -23,12 +23,20 @@
 #include "io/channel-socket.h"
 #include "io/channel-util.h"
 #include "sysemu/iothread.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qnull.h"
+#include "qapi/qmp/qstring.h"
+#include "qapi/qmp/qnum.h"
 #include "user.h"
 
 static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
+static uint64_t max_send_fds = VFIO_USER_DEF_MAX_FDS;
+static int wait_time = 1000;   /* wait 1 sec for replies */
 static IOThread *vfio_user_iothread;
 
 static void vfio_user_shutdown(VFIOProxy *proxy);
+static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg);
 static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                      VFIOUserFDs *fds);
 static VFIOUserFDs *vfio_user_getfds(int numfds);
@@ -36,9 +44,16 @@ static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
 
 static void vfio_user_recv(void *opaque);
 static int vfio_user_recv_one(VFIOProxy *proxy);
+static void vfio_user_send(void *opaque);
+static int vfio_user_send_one(VFIOProxy *proxy, VFIOUserMsg *msg);
 static void vfio_user_cb(void *opaque);
 
 static void vfio_user_request(void *opaque);
+static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
+static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                VFIOUserFDs *fds, int rsize, bool nobql);
+static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
+                                  uint32_t size, uint32_t flags);
 
 
 static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
@@ -57,6 +72,32 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
     qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
 }
 
+static int vfio_user_send_qio(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    VFIOUserFDs *fds =  msg->fds;
+    struct iovec iov = {
+        .iov_base = msg->hdr,
+        .iov_len = msg->hdr->size,
+    };
+    size_t numfds = 0;
+    int ret, *fdp = NULL;
+    Error *local_err = NULL;
+
+    if (fds != NULL && fds->send_fds != 0) {
+        numfds = fds->send_fds;
+        fdp = fds->fds;
+    }
+
+    ret = qio_channel_writev_full(proxy->ioc, &iov, 1, fdp, numfds, &local_err);
+
+    if (ret == -1) {
+        vfio_user_set_error(msg->hdr, EIO);
+        vfio_user_shutdown(proxy);
+        error_report_err(local_err);
+    }
+    return ret;
+}
+
 static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                      VFIOUserFDs *fds)
 {
@@ -310,6 +351,53 @@ err:
     return -1;
 }
 
+/*
+ * Send messages from outgoing queue when the socket buffer has space.
+ * If we deplete 'outgoing', remove ourselves from the poll list.
+ */
+static void vfio_user_send(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+    VFIOUserMsg *msg;
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        while (!QTAILQ_EMPTY(&proxy->outgoing)) {
+            msg = QTAILQ_FIRST(&proxy->outgoing);
+            if (vfio_user_send_one(proxy, msg) < 0) {
+                return;
+            }
+        }
+        qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
+                                       vfio_user_recv, NULL, proxy);
+    }
+}
+
+/*
+ * Send a single message.
+ *
+ * Sent async messages are freed, others are moved to pending queue.
+ */
+static int vfio_user_send_one(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    int ret;
+
+    ret = vfio_user_send_qio(proxy, msg);
+    if (ret < 0) {
+        return ret;
+    }
+
+    QTAILQ_REMOVE(&proxy->outgoing, msg, next);
+    if (msg->type == VFIO_MSG_ASYNC) {
+        vfio_user_recycle(proxy, msg);
+    } else {
+        QTAILQ_INSERT_TAIL(&proxy->pending, msg, next);
+    }
+
+    return 0;
+}
+
 static void vfio_user_cb(void *opaque)
 {
     VFIOProxy *proxy = opaque;
@@ -370,6 +458,129 @@ static void vfio_user_request(void *opaque)
     }
 }
 
+/*
+ * Messages are queued onto the proxy's outgoing list.
+ *
+ * It handles 3 types of messages:
+ *
+ * async messages - replies and posted writes
+ *
+ * There will be no reply from the server, so message
+ * buffers are freed after they're sent.
+ *
+ * nowait messages - map/unmap during address space transactions
+ *
+ * These are also sent async, but a reply is expected so that
+ * vfio_wait_reqs() can wait for the youngest nowait request.
+ * They transition from the outgoing list to the pending list
+ * when sent, and are freed when the reply is received.
+ *
+ * wait messages - all other requests
+ *
+ * The reply to these messages is waited for by their caller.
+ * They also transition from outgoing to pending when sent, but
+ * the message buffer is returned to the caller with the reply
+ * contents.  The caller is responsible for freeing these messages.
+ *
+ * As an optimization, if the outgoing list and the socket send
+ * buffer are empty, the message is sent inline instead of being
+ * added to the outgoing list.  The rest of the transitions are
+ * unchanged.
+ *
+ * returns 0 if the message was sent or queued
+ * returns -1 on send error
+ */
+static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    int ret;
+
+    /*
+     * Unsent outgoing msgs - add to tail
+     */
+    if (!QTAILQ_EMPTY(&proxy->outgoing)) {
+        QTAILQ_INSERT_TAIL(&proxy->outgoing, msg, next);
+        return 0;
+    }
+
+    /*
+     * Try inline - if blocked, queue it and kick send poller
+     */
+    if (proxy->flags & VFIO_PROXY_FORCE_QUEUED) {
+        ret = QIO_CHANNEL_ERR_BLOCK;
+    } else {
+        ret = vfio_user_send_qio(proxy, msg);
+    }
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        QTAILQ_INSERT_HEAD(&proxy->outgoing, msg, next);
+        qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
+                                       vfio_user_recv, vfio_user_send,
+                                       proxy);
+        return 0;
+    }
+    if (ret == -1) {
+        return ret;
+    }
+
+    /*
+     * Sent - free async, add others to pending
+     */
+    if (msg->type == VFIO_MSG_ASYNC) {
+        vfio_user_recycle(proxy, msg);
+    } else {
+        QTAILQ_INSERT_TAIL(&proxy->pending, msg, next);
+    }
+
+    return 0;
+}
+
+static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                VFIOUserFDs *fds, int rsize, bool nobql)
+{
+    VFIOUserMsg *msg;
+    bool iolock = false;
+    int ret;
+
+    if (hdr->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_wait on async message\n");
+        return;
+    }
+
+    /*
+     * We may block later, so use a per-proxy lock and drop
+     * BQL while we sleep unless 'nobql' says not to.
+     */
+    qemu_mutex_lock(&proxy->lock);
+    if (!nobql) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+    }
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = rsize ? rsize : hdr->size;
+    msg->type = VFIO_MSG_WAIT;
+
+    ret = vfio_user_send_queued(proxy, msg);
+
+    if (ret == 0) {
+        while (!msg->complete) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+                vfio_user_set_error(hdr, ETIMEDOUT);
+                break;
+            }
+        }
+    }
+    vfio_user_recycle(proxy, msg);
+
+    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -494,3 +705,203 @@ void vfio_user_disconnect(VFIOProxy *proxy)
     g_free(proxy->sockname);
     g_free(proxy);
 }
+
+static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
+                                  uint32_t size, uint32_t flags)
+{
+    static uint16_t next_id;
+
+    hdr->id = qatomic_fetch_inc(&next_id);
+    hdr->command = cmd;
+    hdr->size = size;
+    hdr->flags = (flags & ~VFIO_USER_TYPE) | VFIO_USER_REQUEST;
+    hdr->error_reply = 0;
+}
+
+struct cap_entry {
+    const char *name;
+    int (*check)(QObject *qobj, Error **errp);
+};
+
+static int caps_parse(QDict *qdict, struct cap_entry caps[], Error **errp)
+{
+    QObject *qobj;
+    struct cap_entry *p;
+
+    for (p = caps; p->name != NULL; p++) {
+        qobj = qdict_get(qdict, p->name);
+        if (qobj != NULL) {
+            if (p->check(qobj, errp)) {
+                return -1;
+            }
+            qdict_del(qdict, p->name);
+        }
+    }
+
+    /* warning, for now */
+    if (qdict_size(qdict) != 0) {
+        error_printf("spurious capabilities\n");
+    }
+    return 0;
+}
+
+static int check_pgsize(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+    uint64_t pgsize;
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &pgsize)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_PGSIZE);
+        return -1;
+    }
+    return pgsize == 4096 ? 0 : -1;
+}
+
+static struct cap_entry caps_migr[] = {
+    { VFIO_USER_CAP_PGSIZE, check_pgsize },
+    { NULL }
+};
+
+static int check_max_fds(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &max_send_fds) ||
+        max_send_fds > VFIO_USER_MAX_MAX_FDS) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return 0;
+}
+
+static int check_max_xfer(QObject *qobj, Error **errp)
+{
+    QNum *qn = qobject_to(QNum, qobj);
+
+    if (qn == NULL || !qnum_get_try_uint(qn, &max_xfer_size) ||
+        max_xfer_size > VFIO_USER_MAX_MAX_XFER) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_XFER);
+        return -1;
+    }
+    return 0;
+}
+
+static int check_migr(QObject *qobj, Error **errp)
+{
+    QDict *qdict = qobject_to(QDict, qobj);
+
+    if (qdict == NULL || caps_parse(qdict, caps_migr, errp)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return 0;
+}
+
+static struct cap_entry caps_cap[] = {
+    { VFIO_USER_CAP_MAX_FDS, check_max_fds },
+    { VFIO_USER_CAP_MAX_XFER, check_max_xfer },
+    { VFIO_USER_CAP_MIGR, check_migr },
+    { NULL }
+};
+
+static int check_cap(QObject *qobj, Error **errp)
+{
+   QDict *qdict = qobject_to(QDict, qobj);
+
+    if (qdict == NULL || caps_parse(qdict, caps_cap, errp)) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP);
+        return -1;
+    }
+    return 0;
+}
+
+static struct cap_entry ver_0_0[] = {
+    { VFIO_USER_CAP, check_cap },
+    { NULL }
+};
+
+static int caps_check(int minor, const char *caps, Error **errp)
+{
+    QObject *qobj;
+    QDict *qdict;
+    int ret;
+
+    qobj = qobject_from_json(caps, NULL);
+    if (qobj == NULL) {
+        error_setg(errp, "malformed capabilities %s", caps);
+        return -1;
+    }
+    qdict = qobject_to(QDict, qobj);
+    if (qdict == NULL) {
+        error_setg(errp, "capabilities %s not an object", caps);
+        qobject_unref(qobj);
+        return -1;
+    }
+    ret = caps_parse(qdict, ver_0_0, errp);
+
+    qobject_unref(qobj);
+    return ret;
+}
+
+static GString *caps_json(void)
+{
+    QDict *dict = qdict_new();
+    QDict *capdict = qdict_new();
+    QDict *migdict = qdict_new();
+    GString *str;
+
+    qdict_put_int(migdict, VFIO_USER_CAP_PGSIZE, 4096);
+    qdict_put_obj(capdict, VFIO_USER_CAP_MIGR, QOBJECT(migdict));
+
+    qdict_put_int(capdict, VFIO_USER_CAP_MAX_FDS, VFIO_USER_MAX_MAX_FDS);
+    qdict_put_int(capdict, VFIO_USER_CAP_MAX_XFER, VFIO_USER_DEF_MAX_XFER);
+
+    qdict_put_obj(dict, VFIO_USER_CAP, QOBJECT(capdict));
+
+    str = qobject_to_json(QOBJECT(dict));
+    qobject_unref(dict);
+    return str;
+}
+
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
+{
+    g_autofree VFIOUserVersion *msgp;
+    GString *caps;
+    char *reply;
+    int size, caplen;
+
+    caps = caps_json();
+    caplen = caps->len + 1;
+    size = sizeof(*msgp) + caplen;
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_VERSION, size, 0);
+    msgp->major = VFIO_USER_MAJOR_VER;
+    msgp->minor = VFIO_USER_MINOR_VER;
+    memcpy(&msgp->capabilities, caps->str, caplen);
+    g_string_free(caps, true);
+
+    vfio_user_send_wait(vbasedev->proxy, &msgp->hdr, NULL, 0, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        error_setg_errno(errp, msgp->hdr.error_reply, "version reply");
+        return -1;
+    }
+
+    if (msgp->major != VFIO_USER_MAJOR_VER ||
+        msgp->minor > VFIO_USER_MINOR_VER) {
+        error_setg(errp, "incompatible server version");
+        return -1;
+    }
+
+    reply = msgp->capabilities;
+    if (reply[msgp->hdr.size - sizeof(*msgp) - 1] != '\0') {
+        error_setg(errp, "corrupt version reply");
+        return -1;
+    }
+
+    if (caps_check(msgp->minor, reply, errp) != 0) {
+        return -1;
+    }
+
+    return 0;
+}
-- 
1.8.3.1


