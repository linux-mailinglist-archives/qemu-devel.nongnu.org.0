Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62B3322F0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:25:44 +0100 (CET)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZYd-0008B9-Tf
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVE-0006Sr-Vj; Tue, 09 Mar 2021 05:22:13 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:58262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJZVB-00027Q-H0; Tue, 09 Mar 2021 05:22:12 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129AJNnW177928;
 Tue, 9 Mar 2021 10:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=y/vM4CRvXGH+73nZ87JEj4spvUrwBEeg5m0WJqwfRHk=;
 b=gxxFjHnz01dcg8+FFKQx3A/IynMl8SYxoGPaLRwdzObeywQwkB9lRMsupCxLVrstrADW
 3Z1wVWjzESvU0QaCiIe+iYVUwixjfXiOrD56Co9TLGs2jJWlT0TaHifaD1pOV+dLiRLM
 itRmHgL+a3UMTZ5bgi5/ybLuATGq1GkmMp4lRMWlGz0VBcxEslDcmhk2unui+OJY11TK
 JFc7XaxzLDwixiPDRk/3S+0/8V8AuCkeXiyzfS+1JU8XCZxzIDBIPVe7P7cNDQsOXanY
 h39SL67TZ3NtkwcsQPnv02vioZwn46AgsS9XYVZZ3/wBYurGadFts07BSFuS9Hr6fItJ 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 3742cn6rdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129ALUa4158580;
 Tue, 9 Mar 2021 10:22:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by aserp3020.oracle.com with ESMTP id 374kmy995w-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:22:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4ZNsyKB+n4BdLG5GB2zrSrxevF3fT56VFJ7hwuaP9W+ERpkMTE56nY2IQWFTHkJ+y3Xp0LFbcJKjg3MI1HqvSJZPd2SW5QZL2UPU0Vd7Gw1DN89YL0JIhHf/VHSavGV9ha+dfhHDAjPB6HyyntCjXINP6Z5r5Xz9Ps/X3icTW9vY28KJmOD+86KjGH8t7PSC3pCVW44+iS74tS4xAND2nXiIGtiqxGUo3+SC66hYlOw3J0B5sVxHLyZYeV/+aKxhW2gQpGEihNdE4j1tGnBCi9Pj5BOXcshczawmgJl3cuzPbCtlhs+BcWinB3LMuy08vd3+kYicCJtDF6aqfz3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/vM4CRvXGH+73nZ87JEj4spvUrwBEeg5m0WJqwfRHk=;
 b=kXVX/9djN77ZScsqwiul5NPUcAl7RX2ozdTB3mD7ZuCjLzgQXW7wb6/Z+BaPsFCuRqazNeYTCj/qyXMpybJB6RXWHq8NalwJXAeQcEnJkgdfj8tmkj5wASlvbqKBPh5IPuQ/iNINff7ZTPXc9KQzDjhYKiBZJ+kJvfQSEUgDuLSIDYkaMs5svd2SaAnCyWjYNJmfr097VlU9doJw3qz6jNrqYrZOCaxkfBUVsKRT5HS2LYASdWfpmlEs9HEHBN5jbP3qvBVJETGYfChmXabTOgIfIpb4EZDIFJ4hrSDcrg7GGQewBId5JvoQltnPAk31BbHTpoyLs3DEwzajdyACqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/vM4CRvXGH+73nZ87JEj4spvUrwBEeg5m0WJqwfRHk=;
 b=CpcVe6SknC5XBz7R3TLRsPJQeeM4q/IxZnGNDSrfTTLGid3a6OLMbKbnkxBx0Cr2nKAPuerjfBSi4tN5zmDW8MxVIvT2/odidotWP7QrCvSeq9DCjd4wnw847tS8ThRZ5CaXUOcqHlQH6Bj4lgVEYfqcETR+a+4sXu4lqoVnwv8=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 10:22:05 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 10:22:05 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] block/vdi: Don't assume that blocks are larger than
 VdiHeader
Date: Tue,  9 Mar 2021 10:21:55 +0000
Message-Id: <20210309102157.365356-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309102157.365356-1-david.edmondson@oracle.com>
References: <20210309102157.365356-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 10:22:03 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 3d98f9e3;
 Tue, 9 Mar 2021 10:21:57 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b11762c-eff5-4aac-a933-08d8e2e52f7d
X-MS-TrafficTypeDiagnostic: DS7PR10MB5184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB5184A2889B01DD17AF80DD1388929@DS7PR10MB5184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBd1UBTeLf/g6MT1yAIdlHrSaatRsmKnoiZj6uTcHo2hzDXwhWjguX+B4r86rSC7WM3cbElmdjL5+007GLiR+il424mnD7OQu7L/YFBaLdZ+IfVauDDxTkYrKqLqCp6J9q5qGuijcJGBDdhZBWqOr8xFcfQhRqvt91A0Wt99PGZZaRjNXDwnfTkP4uxI1VTeEtWip0c0scmug5rkO7NPA+E9z31swWbnyuwHJB0hMwzSTYFIjP5wVuH1amPT6YfYOSVxCgbaGVEwTLBI8xW/ofIX99LnDnwUPGnT2AwDSqMTlC4KRyvoh27Qlb1eZ3thL53uGjfw2Npi00heLzzNakEJYYEwYWCS3MrMDPCcHOgK9FXI6hF8Zq17WIUVt0Z6UPA8w3x6tWrObt2QlOz5F0/Umx1xn7jt3psaueJcHcwdlddoSnPa/VAswXLxx31XdWg0Nm3+iPW9TrHw/NLAP7Zy2T/UvhK/BLrA3BHBxjnID16CA975UIJ6wffl658qFOsrb9XE1doHJbdWysuO9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(39860400002)(346002)(366004)(136003)(2616005)(66946007)(478600001)(107886003)(86362001)(1076003)(6916009)(66556008)(54906003)(66476007)(8936002)(8676002)(186003)(5660300002)(316002)(44832011)(52116002)(2906002)(4326008)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5qmntLQfTkxd4pwTgXlpEpUYabE375Ev5MMgJiIl2wp4HVJRdWeUG9QdjolL?=
 =?us-ascii?Q?+JqtMq46ifr60ImdSC7TFN9Mr2xiO1J7z8HaAjmDm2gFGW0yeb60PSRc+ISe?=
 =?us-ascii?Q?dgLPJo9v9KzGrimAFiNTgstrCsx0PcpmElbZUIrOSI5WDHHss4+cr3bXSCVO?=
 =?us-ascii?Q?6intXRSkwQBXfYR1vddWU3fcxqvwZ5ji1vlM5vcG3Rwl9y/mF8sE2sqihtyB?=
 =?us-ascii?Q?YBIf9U7vDLo1uT/cFMi/sd7V+chhBRRGt2Biayl/wg8YXPT2HLHiYoj/QgZD?=
 =?us-ascii?Q?tWwFyZxw0iyUo6sPruheiiT4z/XxDF/HvDsmqPgeF64mYICC4xHDETLX4YuM?=
 =?us-ascii?Q?7XwGMhn0vQ35NesnnI8m6NeIG/HmrNRMkWt6MgtdM2Nh/X+XdGYg9/ugFCmY?=
 =?us-ascii?Q?qR7CHomGbdYRp5/jIR9qG4spC1EBSglPH1oA1Zpki9uMOX9UxSpm3MpJ38B0?=
 =?us-ascii?Q?SOjEjBiH91asPvG+qxTus8q5BQdkEGwdDZzHUjlEEQUnNJ6f0fKbIzA4lgqW?=
 =?us-ascii?Q?cDKXAczidoxLgUFPmy1PyIlFTxs/INs5cHVPNX4HRPXNpl/B+Pxz06Dv3Df2?=
 =?us-ascii?Q?3fqMknacp7LvgYkJz5xgqhw26mSulTNDqGoWN6NcGHC879BISoyYuXRw8RE8?=
 =?us-ascii?Q?vE2e9ASPYqIN3OPjzVs53wcgyHm31E3c6+CvbaLUQClAghDqryeKJp97nbzt?=
 =?us-ascii?Q?f8SL1PHV65YBoeLwq/1anBlqfpSbYs0/eiKtebk1e2+MhZIK+h64snOR2Tww?=
 =?us-ascii?Q?JX6N5l7Z8+14/f3XV7DOUDV9Tex+mANeP3TkvuOhCaOTImlnhTkGGhFHTAn7?=
 =?us-ascii?Q?cjJEfKWGNbgN9023V1FSvnFQSI4pDWbo6CYc6W8Z0TrwwT8lz2Xeg4Rx0/99?=
 =?us-ascii?Q?4WM5tvjELg9qMz4JmbDenkOKgu4M5+fW3mRFh8ef/m67sZ9nNVlV2+RPTXFy?=
 =?us-ascii?Q?ajO1eaT0FzQl1sFK17xxS2XwJu3sWijGdPPHeknpyibFeFuA93A++iSzyQSn?=
 =?us-ascii?Q?SACR+I/RF+hqpRWRiUme5jtFQpdQ0MEZ/q/5GrpVWBpgwb0VJeyV6dVGeS1f?=
 =?us-ascii?Q?zuF5vpjYUrEdHBxQV9BWMLIcUo75/3XfLOAbG4Jw1F7iluXJcS0tuxIqOh6e?=
 =?us-ascii?Q?0Q3IIXKD/xIZsYw/uv3VD2iEAsUvHEPvgD7so0sZvaVbCdPHyuRCnoJlGmVu?=
 =?us-ascii?Q?1e6rHDz3geXOug/zIpKkdd7sRs7pU5/PBhUBLwEBIZjSTuUHWy/IqMbWYc9g?=
 =?us-ascii?Q?JR/J/Yzl4yTfeUejQ66qFeypu0jwFjj7YXNHACuIlGSuW5BfS+Mgs3iKUkaG?=
 =?us-ascii?Q?GehGHQoyTa9tFJuoN1+KbCPAR8dWZ+H4ns5lUXqd+O+N7g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b11762c-eff5-4aac-a933-08d8e2e52f7d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 10:22:04.8285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9a0prXYHpORs3JSNt/vLEaf1iwppyE/uo3Ejf5Ezo9j14sXt1HFpUP/3CrhvYG8y0JTEpC+27NWsCaqBSC09uDY32fVr5I9eKYPzxHNEBt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090049
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given that the block size is read from the header of the VDI file, a
wide variety of sizes might be seen. Rather than re-using a block
sized memory region when writing the VDI header, allocate an
appropriately sized buffer.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/vdi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 2a6dc26124..548f8a057b 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -696,18 +696,20 @@ nonallocating_write:
 
     if (block) {
         /* One or more new blocks were allocated. */
-        VdiHeader *header = (VdiHeader *) block;
+        VdiHeader *header;
         uint8_t *base;
         uint64_t offset;
         uint32_t n_sectors;
 
+        g_free(block);
+        header = g_malloc(sizeof(*header));
+
         logout("now writing modified header\n");
         assert(VDI_IS_ALLOCATED(bmap_first));
         *header = s->header;
         vdi_header_to_le(header);
-        ret = bdrv_pwrite(bs->file, 0, block, sizeof(VdiHeader));
-        g_free(block);
-        block = NULL;
+        ret = bdrv_pwrite(bs->file, 0, header, sizeof(*header));
+        g_free(header);
 
         if (ret < 0) {
             return ret;
-- 
2.30.1


