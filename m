Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333F151C603
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:22:54 +0200 (CEST)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfBk-00088f-MV
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0l-00063M-A0
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0e-0002C2-VT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FpOfj029440
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ocdII6lbRdQ8YqAiUNKiuNn0ZsUcAik4BZfUSdlSYA0=;
 b=RQ3fCTDbcPvZE4ZXTxkPdJpg6Wkwdg2lAsjTf2OcXvg/8JWa3kn0TkeMvXyfTtwCbn4K
 QHrVgok70mU79jIXIdNUUnVK8iQQIa+Q34l7ABZK44tX8jSYLnErd/eyP1KnojPkrzWy
 t4Pw9KC/I8xZPzsPxNuT/WoRTUNToEBD3ahmt3YjEpq7or7BHqFBXnGUCGtnSimhecY1
 kYjz3YqMti+rISxC3jtSZVGHBVheCqAbPVX2i9R3jxupQ8y7FSNVA9qeLV2SMIRc9Poe
 B2b139Ia9pANfjntPmRxaNyhAnLAbqj5f+t83U49M9TriYmbUF/pZTj+I+JbO/Wmm61w ig== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0m376-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:23 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1PHZ001942
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a7amqq-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gmj4r5N0LWd2pYjqwpa9tCRl3PYzIPo2/JCymRW18tYdoTcLxrG9bDlXztZCBC/CfZF95v95RPX7sPvm4K1Gy3V1qJXijKRkk3NOL5UuUjeV9FfSeIGeZiY/P5VwtqZ0g/WzdbUGpoq4F+Ou3xUQsQIeE8NySz94zRWWw+b8yolWUnaCeRq6+JBfnUcK3rnI1L8qXN3/QDM7GneN9r37pZJCblsWxOHo8Dn0NxdndRzruWXrpi9Q8y45nmzunmjFz5S4JetUWuIkHkkeRKjW7qpu+HD1ir0FYSiFto1/v3KthYShyJhjeUrruvMEfF3DIRR2Ohz+Au6yWGtlBtw0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocdII6lbRdQ8YqAiUNKiuNn0ZsUcAik4BZfUSdlSYA0=;
 b=NdWJLFIekv6nZc4q28ImwjTuNvLN24ZGFISCRdv5rR4mixzPVv99E1vTfkm51lFJoDDYDNvwDBCA8sevaLivxFRJ4x/54w/s9XXT022ZksUZVcnvdbg6LWnPCBCKK2sCmGzJM3yxwjtY3vp5LfjIiHKiUP6sC8p1u0VVfTbdMFOnQcMRPesXS0AmYmIITpgLac4uAI2BI17VK+6efMz6g1ywsS1P8HBmoZeTG7mvqyEI/Zsh6QLNSaovHTTFQZjSQTfW7eNzJTs0g6EEHunGm76OsOJgksARqAujsIVZ2VOTOHoAyb+X4sh1c6XtJKe61u2fOj/AkjEn3mvcGdir7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocdII6lbRdQ8YqAiUNKiuNn0ZsUcAik4BZfUSdlSYA0=;
 b=V0bfpadRH3w6U9l9h9vtPx2aGbm633JX1CqCVnRsWU+y3vp4tpcGNzmgNSY7+O9tG6jsJg26mDfq9EX7LE6/Tq5dHrqDDBguttN1hlbXbdHcgmD+xtAFXF97QIOeHpIq4Z/JvxXKIWoDC/x2oc9GsZ1+u89gnrLxdL4h39SiczQ=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:20 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:20 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 09/23] vfio-user: define socket send functions
Date: Thu,  5 May 2022 10:19:52 -0700
Message-Id: <455feebdac7fc42700bf5a870493007f7f354cfa.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 744c22e8-dbd5-4005-1d5b-08da2eba4505
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1867275C4021554A95C37900B6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fR2vlzMMzaB96CzsAtJkeKXiKFvLM2EIZW5n3XlIHz0OrP6fh+NrhjAkS60VyTAEAMC6Djhru6xCgDVgMk2K0wvsqwNYy9heZFgVyTphgq3iEAjUyZabaiWbof9UFecQabN0v1So57TEQgYT07NBY85Hxg7dX9cGReE6uM5Cwhot2fPz3gKQIiHZYGEOY+P6vBzVlNiox/up0FesjSYRgGTUjyfQITp0h+mzDUDhl3Qd7dlQL6qOFmunuqKZd+XjwllXSeKzi6M9TDB8ImJj8Zfd1qLzfzmqb9x9XDvH6ItBAgs2ePFNYJ1aIq3v+Bi98xFtUYkuMEnBZ4dRw4otXXNiomT2YYHdV/nSfrbmmNnvZ+O/KFOmmQu3qrT2M8Njj3mSIfBV3LvwejMJKTfg2FllUR7s1PSoo2abQU+ELbI2n+ZAtj57M7i6PSBgxH6iUmHbAhpje7jbjvgsrenYf/4QGLcys8C1csx5i6EmcVb4nQQVPYIf7vQSzYPMkNzY2nWBqHd/e/4qzRlzAsJDRqdMy/JTsNf4TylfBCYGi9WxEHB4ew9SGMx9ypCQzNERiiS2LTA4vaqeIqF1fcI0Rn9R9NiBfZEmLa2RE4xSrjDR5L0eisclHxXEwgq+ayWzPqlyi4HY4Bx49hIat6cNRx6+UKWZ/3T//QLQ0BSJO9i7c+Yx0RlR/qHKm+km/rSvjqq9khCSuuw8YaoADhHgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(30864003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CKt/aH1qfuUSJy39DwtVDGfiQYApu8yr72q6YTP6KwfFcYACrQieRl+Lps4v?=
 =?us-ascii?Q?MNkMmEWUwZN/WX5223Zws8YnrPaxvdJxN9gKEr8CR2DymYxe1Wbqgd94f8av?=
 =?us-ascii?Q?7rqIGShhKW7wuyIRa3ilGTOpcPvZ1rNCSRiAE7YVwBjxSf3Y22emLOULrhD7?=
 =?us-ascii?Q?hBLCno1tp92NJ68C7wG6QD3Pm1RElfOTQ04VoweJVoOKPBdTRK3J9zfF3oIL?=
 =?us-ascii?Q?TVFJDMG3DoF3vmoD0pdMk4xYC2TxaZlcF/ikZ9J+kWWUGkXj+vc13sJOGwoK?=
 =?us-ascii?Q?Iq/fROLz26SJ2QFGQ95xdgCtPlIGoOIeSWGnMJjygDTTIv+n1LvC7wGUNayV?=
 =?us-ascii?Q?L4U7uex5+MY04n3UU/51SdDril1aSuASebhzD2bB5zoTRwCeorMQI5TNjKAQ?=
 =?us-ascii?Q?UJgkYD3SZfEJLZoXyORDnOwTpek8VkAoUS04mSSVAeg0sGDEtltz8Ebn75uH?=
 =?us-ascii?Q?0XVVUDEscIQnoUflV0SQF2hZdLPZNDa1qb6bUoZK90LBZTIAMurIpv2mFX35?=
 =?us-ascii?Q?aO1rRWF76DdCx4+BZpxvX6ogSP7MWOCqlsyRASohFeF0jrLh6J82UwjdUMd0?=
 =?us-ascii?Q?Vl7lyQgR2yhKfyjuuOiaSs84M5gxFmfoFbQqTDOJeDhj8DihPG1T7Aiw6Up4?=
 =?us-ascii?Q?cVbG36uz9it2pc7Z8AoNOvtS6Nfptvcdn0D6VXlvUnmOj8wr6Es9mQ4fmkOU?=
 =?us-ascii?Q?Gd7jauSy6P4G3F4e0BS2QOILjQf0hDUNAq5kjZnsiZ1ArIhtA4PrPYdmadey?=
 =?us-ascii?Q?pRoM9c1AjNUdWbV5HNEcYjngP2Dw+aUnKAI2wg3XgWhuNZdwGYumcIryKgLo?=
 =?us-ascii?Q?uq6cJSb0zYYLo095Cd+3lYLD656Pk/GtTNmygCj1DNEeBLE8QcZ6zoebb24m?=
 =?us-ascii?Q?P3mYha9d7tAn7QwTvvwNKWJN0VsNCUOB4v8XL4ocKo0tHwpflgEJaX4cYea5?=
 =?us-ascii?Q?MeiKmX+0ztoqbgAc64714A5x0mIu+bFbFOrr4iRVAhREAQOnx5kGTekBS8KF?=
 =?us-ascii?Q?aRX8CbFZ1qifhR9qfC14Vsdh9D9LZs70/a5pDGX46NMnbZGNeB2JbyRKMSlw?=
 =?us-ascii?Q?9HYSzA01Gxly+kEHIa7/yq+29GJ7suMs//C2RIZcySBMuISZxRdkmUBSp7v/?=
 =?us-ascii?Q?rn0Ix+Hk+3/lnLbd9DXXnARpKGxUjUbZi+I9yVoturstgvMiYmXHhrEQifpq?=
 =?us-ascii?Q?HSY83YyGEvc1lnolIDRpEiWyoE1qu/2eRzTgXCocRcdieOag3oxg836SmvR2?=
 =?us-ascii?Q?BQImqxZQGLexF+rFCh1FgOFnHtU7zGkKUs7lhNr8Ylp926OlLs/4nBaXtyvh?=
 =?us-ascii?Q?tCStHx+m1C00sb0hp9hWBAI2V/Rsr5cFLeSL/gzmyuxZuhfWX7gJUdtHJM5i?=
 =?us-ascii?Q?83m3p9eWqsqFxKEMma1fh8APAIx0MUhAhQE4QxdqrVK8t2GZ42Noe+wM48+h?=
 =?us-ascii?Q?lQV0w69t3JAX6lb8XpNmly4JjLTHVwPzQfJAngCl6o3loYV4Kni9+Ha/x+2/?=
 =?us-ascii?Q?EbTHH9EdnK0a+v3WvaUl+luvL29H7JVOxkxxJAfCIXUs0e2elU1hqDYnBf9N?=
 =?us-ascii?Q?xBj9VWAVUML3M7U8EjSQWK5PiFpy/mD/wudY2027tekVscwrI0l1PsPi+xAX?=
 =?us-ascii?Q?0QPVSYfn/TB5zflVnrLcNECeJ+zCFLJG7YZyNIjQUbv5fLjOhgHri+aa8KKf?=
 =?us-ascii?Q?SySJjmDyvin9ACkOumw+x/4DAUc2VJfolSfgh2OekTo/N/7xe489IFxcqsSW?=
 =?us-ascii?Q?akiH4MAG5EfF2gGZ0YJOSG2he+F1z28=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744c22e8-dbd5-4005-1d5b-08da2eba4505
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:18.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyKnHszmX2scXSzCtt1VFKgFA9YSmEunqC2zuHFt+zcK4asX1YkURJc9CKGvDOMOYFlnq7hiZmDVLfgSkz0mB7DPsuoWBzEQOcWrP4VbyRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: 3Tw7pKPrialgvM10X0qVZztIgYhr4Zw3
X-Proofpoint-GUID: 3Tw7pKPrialgvM10X0qVZztIgYhr4Zw3
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Also negotiate protocol version with remote server

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/pci.h           |   1 +
 hw/vfio/user-protocol.h |  41 +++++
 hw/vfio/user.h          |   2 +
 hw/vfio/pci.c           |  16 ++
 hw/vfio/user.c          | 414 +++++++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 473 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 59e636c..ec9f345 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -193,6 +193,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
 struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
+    bool send_queued;   /* all sends are queued */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index d23877c..a0889f6 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -51,4 +51,45 @@ enum vfio_user_command {
 #define VFIO_USER_NO_REPLY      0x10
 #define VFIO_USER_ERROR         0x20
 
+
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
+/*
+ * Max FDs mainly comes into play when a device supports multiple interrupts
+ * where each ones uses an eventfd to inject it into the guest.
+ * It is clamped by the the number of FDs the qio channel supports in a
+ * single message.
+ */
+#define VFIO_USER_DEF_MAX_FDS   8
+#define VFIO_USER_MAX_MAX_FDS   16
+
+/*
+ * Max transfer limits the amount of data in region and DMA messages.
+ * Region R/W will be very small (limited by how much a single instruction
+ * can process) so just use a reasonable limit here.
+ */
+#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
+#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 68a1080..00d21bf 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -76,11 +76,13 @@ typedef struct VFIOProxy {
 
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_FORCE_QUEUED  0x4
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
 void vfio_user_set_handler(VFIODevice *vbasedev,
                            void (*handler)(void *opaque, VFIOUserMsg *msg),
                            void *reqarg);
+int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7ef11c0..7e5b910 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3440,12 +3440,27 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->proxy = proxy;
     vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
+    if (udev->send_queued) {
+        proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
+    }
+
+    vfio_user_validate_version(vbasedev, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->ops = &vfio_user_pci_ops;
 
+    return;
+
+error:
+    vfio_user_disconnect(proxy);
+    error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
 
 static void vfio_user_instance_finalize(Object *obj)
@@ -3462,6 +3477,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 16b37cb..dc3f1a6 100644
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
 
-static uint64_t max_xfer_size;
+static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
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
 {
@@ -56,6 +71,32 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
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
@@ -388,6 +429,53 @@ err:
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
@@ -448,6 +536,130 @@ static void vfio_user_request(void *opaque)
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
+                QTAILQ_REMOVE(&proxy->pending, msg, next);
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
 
@@ -572,3 +784,203 @@ void vfio_user_disconnect(VFIOProxy *proxy)
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
+    if (qdict == NULL) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP_MAX_FDS);
+        return -1;
+    }
+    return caps_parse(qdict, caps_migr, errp);
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
+    if (qdict == NULL) {
+        error_setg(errp, "malformed %s", VFIO_USER_CAP);
+        return -1;
+    }
+    return caps_parse(qdict, caps_cap, errp);
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


