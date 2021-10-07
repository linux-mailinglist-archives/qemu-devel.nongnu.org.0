Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A18425990
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:33:07 +0200 (CEST)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXGU-0003B0-7J
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz1-0001fW-DN
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:03 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWyy-0001TT-BF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:03 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4MFu009673; 
 Thu, 7 Oct 2021 17:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=zmxtWD/4Gwj/+yqhLepKDph3lerrj1eGXDRU1+vvzMo=;
 b=AGZBdYf15F5aSQ73UZeVsP9mGbtclTIrvBrzsiZ9MIb4kKSME4crryd2e6w8xZn08FpX
 aPvtZECSS4fMZ8clXRnDwDgGwaU/Z1wfNQAo9aOALJiQqjnjISnwDWbbfnqgHj0tubMU
 UeFVZvl0J5zL75dpq/r31bbsMZwpqNTL3rDwuseS5zhYHJon/Oh5B7TFAjNVJtAvQpvI
 aUqV54nUbDkRGybUb50ZTQXc0RckmyV6O5Y5EAZqXTzs9AvKvi0kXrpUhnihE+JgmLi1
 QA1gJOuGD0NuXR8jQpFvilwjAcVvEO6AA8z2dzyMPPTrWY1bmGt9TyGHZUD8OR/qtNbX mA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bhxbs38j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HASk6072645;
 Thu, 7 Oct 2021 17:14:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by aserp3020.oracle.com with ESMTP id 3bev91a0wx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLeXThzzOgFQqya3wfKRpPon6kzCJTd/tJazYHVEGDKpmnGgOVovgWBjnIJKD1KI0+yy63j+5L9RJgPs5/UvbEKivInu1DgzasYLCSOC/8xL2e1Jd244qnVFb2vGXdOzfvlyRcDVugWWVwXyO4dbFn1vRk5BY1Oex8LgQa4ztPbOIuGaeS0jhqGj0ctXpks/dYmsbsjuLn4Rd6DfDIR+YMRZRV9NQxIk/bKp8E0VxPATvGYJFY+d07vh6ZFm/CQljBC3g/8wU0waKGLOWSGgrM0g+ZwnBdqspm87aINxo3Qg9KrhQN/5jNMxs7ZMEsMO1qyS0NHMSYEyV0+kjh700g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmxtWD/4Gwj/+yqhLepKDph3lerrj1eGXDRU1+vvzMo=;
 b=T+nkPDblBZHZDFWsk+4+npvNrhWNrCW9632Gw6TpnS5F2HPUXmQas458Xj3N1f8bHxac801mEZLmfyAbVsWXEeMedz43P+ax1XHRU94rOK0Lp1/McMalFTxDKDIGWfelAHhSQD1w1lWEv6HopAU1Fa3P7J/mRqRsT89I13E714HhBc8WCLKLHlH+KSgEnFWkSWd1mJsBDtZ27fhy+Pr/WvvLnZ4AvVjUhy3Ak0m5EOOJxhw5r7hZaVUM8BNfjpGANvfoYDwQxmJBgTWt/y6u2AHBANTDZKT7LNwf3EuIMpFcj6AWLgLtSCPchkgfDd0F4HEE6BvAbWh7DRCmkJzSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmxtWD/4Gwj/+yqhLepKDph3lerrj1eGXDRU1+vvzMo=;
 b=BvmNssyuJFXADpO6XUva9fpLMA50AlTKakaV6xODnv6iGp1qNLsn4RCQMR/darcSxtpCHhC2IBtXekH2czmE0uAouGU4uEj1qf0sPKGH9EsI4yj3ef5aTvamSM6n+xkv2OQ/PpltThpd3v3wl+2cyZZEC4BQQUTdhzQvnKakZfs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:14:53 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:14:53 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/10] ACPI ERST: specification for ERST support
Date: Thu,  7 Oct 2021 13:14:27 -0400
Message-Id: <1633626876-12115-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:14:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee728842-025d-4b86-057f-08d989b5fa92
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB55241AD4A9CE4607F3F92F3397B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnV5a6MytuBJKPfsOlz09MZuhNMisIr4laYu7LKMtaiDZkTm+ea06+5JhPPYjTAdrsrsbG5OooO7g6Yq0JNuRSAYQaVr2mcvggIfuZQFGQiNApclk2MjFnn1P2Ff4It4FyAIH85XMixXw09C9kIZ3bdMpnpAjOBG6tM53/Qt7RNVeVHGOqBfVibepBzJLUGegnsTqpTj2eG9kE/bUoTv2ih6fVl42nK/OJik4W4xRIEnctPanydJGhxGSa0pPvQLGUmfImAeEFkXLXoa3jAJiUiiINrTKLjEJzDjfUT7n3nrY8SaT/TShnh25PMfO7qO4rAHi9W/7fppGMLWVXhPR0clr/c4quOqZWuELGAaTx5qU9A5O/x+egHn4FUTG0FMQDxpKiebN0Flf894LsVr949cuYln9mHD5nJ4l3bvc82jS4osZwSMIZWWV+rYWM4bDDa+KCSIfsKInlKwks57W9gwknbgIqGnM+ZuFEiFvb9NhKkyQZS9OwmliDl072Z19j8x8I+aWQoy8SkpyrvmWOvT4SArHBdOLVFPcCY7NjyAiZQDeYkH6gGy6meijMsutiKZHf6aYqcHDFBbWYX3TJ3MWTigew6H0WLvKumnQmPzZ/te/A/Xo3KwTHn1TSYpAavUMAS6grLbJimCbOAgKPLqi83D2ny7FpWyoU+zvHVRgLkQTHIKYrmnoHzIUrOXsemai0a0Bip9agwc9B9QvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(83380400001)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(45080400002)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aYKh1E7tPI3/jk1YmML0z27q+EEhSvnEOmMX84Be9aiBmEx/sz2bw8STwWtY?=
 =?us-ascii?Q?4g9EMhdZpU8qbnMnpGDPnS2VpbKa9O9nnhyD2ezc9mh8m+5boIQliG5J6NHD?=
 =?us-ascii?Q?c0kU3rO4gQHkThmCY9kXVerumadnWyzGXf93HFxvcT2bC8/lGvOWJL0mfPg7?=
 =?us-ascii?Q?YvpzsJYOB1fUR1a9k7MNJ9IYjNo5+MD0br70qKfskPR+nL/VJ1F//BQBGo7I?=
 =?us-ascii?Q?j7DpkkZHykhtErX97qeGQZ1tQc6w9xZqsw4m5nnkr4nKePRjm1qi9do22X9E?=
 =?us-ascii?Q?NMnaOielyr2GiEOCDdySqASr59Ol0KC7itxcOGh79ypCJppjU6keu9ks9W0E?=
 =?us-ascii?Q?VWhRAoDypgaJ+L+X3Ay9RC3BnKpCSER/isVmFD9LCQI4AH2hqGTwEGQarK+7?=
 =?us-ascii?Q?Z46pv8rE2etbwdE7PWQdgxvXyeYykn2oqvt3nYLjYyOdt9bEM5hFoawChtRd?=
 =?us-ascii?Q?Ba2OABuJPxkc8SLErdi9CZ5iyRHnKAnqtrSeAZhtWoISTWKZfb8YWE87iB9z?=
 =?us-ascii?Q?8UA0aQCCfRsU5emqGjofLnSdxOSq4thXQG+mlREzGn3z5I2T921OpKEcQzq9?=
 =?us-ascii?Q?ogGP3OvrzyVDayb+ZEeBGkEAuz8Hgz4X9yX1vhl2yne3ZKVRzoEBUFQ1gkDY?=
 =?us-ascii?Q?0PsExgG2rqDGnF6hZyOZmjin0Ro2fPlaqvm9/TrcFWn1h+B0w5s4Fztp18BJ?=
 =?us-ascii?Q?ZwgOFlAamus0pPV8nUFIhC1o+jmBS1e9H5MMf/6mtlfSv3A0wzCM8a9tzaYK?=
 =?us-ascii?Q?t2XsD4XBcqNWOJcF/buxnIhwY6p9REQiBZYv0gtip3JAMQf+ipfeMvc8tSaI?=
 =?us-ascii?Q?wJTZ0O3+mdTpFuJJjrUpdWKdhvvSFsju3ZV5jj6OTlsUBbfb49fCKq1c2Ogk?=
 =?us-ascii?Q?NIIHZEmdt34tqUJTtYdeeeSAMshKe+9L0hc9QesmMWr1W1uhRk1Gsy1giH7K?=
 =?us-ascii?Q?meslb3vXyacyy2iZRWBCmT6JJJs+hCeenaJvxFP2tExoxBjWZPErJLCnMMu/?=
 =?us-ascii?Q?c+BTSLRCgj4V+dL5pWkECX4OXcWI4Tsca3MDqOpetMtx1RIII1IcCfplmbwH?=
 =?us-ascii?Q?eZ6Vi0dwhYWycfyVirt52QEdB78uwhbAfyKsGpBdHYgD3gluLgSvW153Yc4i?=
 =?us-ascii?Q?INjnpjgBQsT1K3gZ6bkYV/87HTKxk0a6xi8rfq6dTM++PqhvboiBuT8Lnyn4?=
 =?us-ascii?Q?LBeL5yu+UkLGL179JbQDi1/VEHcVSNvfT2zLDdqj7WNvVsNkPNC7JOy3zZB9?=
 =?us-ascii?Q?54smEpmGphV7AHcmxkn+D6Y6j6jRCSCGiaF7AOdETDMOaACWcswuzlUewSui?=
 =?us-ascii?Q?KA/drO2nAE3R5pnzODvac+os?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee728842-025d-4b86-057f-08d989b5fa92
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:14:53.7088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkqCUknYBoshfgdYcl8CJInGDr/JrOCPRNC9Aso+QaPC51Sz7gneXpI9QCuTrIIaa4YJYGMmaYZoBrG1oiQW8dguC7AZ/Wvg5MiOT+cxc3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=429 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110070112
X-Proofpoint-GUID: y7bPIKsEtRA6xYL1hkKG8xYKXzX-qoR6
X-Proofpoint-ORIG-GUID: y7bPIKsEtRA6xYL1hkKG8xYKXzX-qoR6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Information on the implementation of the ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 docs/specs/acpi_erst.rst | 200 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100644 docs/specs/acpi_erst.rst

diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
new file mode 100644
index 0000000..a8a9d22
--- /dev/null
+++ b/docs/specs/acpi_erst.rst
@@ -0,0 +1,200 @@
+ACPI ERST DEVICE
+================
+
+The ACPI ERST device is utilized to support the ACPI Error Record
+Serialization Table, ERST, functionality. This feature is designed for
+storing error records in persistent storage for future reference
+and/or debugging.
+
+The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
+(APEI)", and specifically subsection "Error Serialization", outlines a
+method for storing error records into persistent storage.
+
+The format of error records is described in the UEFI specification[2],
+in Appendix N "Common Platform Error Record".
+
+While the ACPI specification allows for an NVRAM "mode" (see
+GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
+directly exposed for direct access by the OS/guest, this device
+implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
+implemented by most BIOS (since flash memory requires programming
+operations in order to update its contents). Furthermore, as of the
+time of this writing, Linux only supports the non-NVRAM "mode".
+
+
+Background/Motivation
+---------------------
+
+Linux uses the persistent storage filesystem, pstore, to record
+information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
+independent of, and runs before, kdump.  In certain scenarios (ie.
+hosts/guests with root filesystems on NFS/iSCSI where networking
+software and/or hardware fails, and thus kdump fails), pstore may
+contain information available for post-mortem debugging.
+
+Two common storage backends for the pstore filesystem are ACPI ERST
+and UEFI. Most BIOS implement ACPI ERST. UEFI is not utilized in all
+guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
+storage backend for virtual machines (as it is now for bare metal
+machines).
+
+Enabling support for ACPI ERST facilitates a consistent method to
+capture kernel panic information in a wide range of guests: from
+resource-constrained microvms to very large guests, and in particular,
+in direct-boot environments (which would lack UEFI run-time services).
+
+Note that Microsoft Windows also utilizes the ACPI ERST for certain
+crash information, if available[3].
+
+
+Configuration|Usage
+-------------------
+
+To use ACPI ERST, a memory-backend-file object and acpi-erst device
+can be created, for example:
+
+ qemu ...
+ -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
+ -device acpi-erst,memdev=erstnvram
+
+For proper operation, the ACPI ERST device needs a memory-backend-file
+object with the following parameters:
+
+ - id: The id of the memory-backend-file object is used to associate
+   this memory with the acpi-erst device.
+ - size: The size of the ACPI ERST backing storage. This parameter is
+   required.
+ - mem-path: The location of the ACPI ERST backing storage file. This
+   parameter is also required.
+ - share: The share=on parameter is required so that updates to the
+   ERST backing store are written to the file.
+
+and ERST device:
+
+ - memdev: Is the object id of the memory-backend-file.
+ - record_size: Specifies the size of the records (or slots) in the
+   backend storage. Must be a power of two value greater than or
+   equal to 4096 (PAGE_SIZE).
+
+
+PCI Interface
+-------------
+
+The ERST device is a PCI device with two BARs, one for accessing the
+programming registers, and the other for accessing the record exchange
+buffer.
+
+BAR0 contains the programming interface consisting of ACTION and VALUE
+64-bit registers.  All ERST actions/operations/side effects happen on
+the write to the ACTION, by design. Any data needed by the action must
+be placed into VALUE prior to writing ACTION.  Reading the VALUE
+simply returns the register contents, which can be updated by a
+previous ACTION.
+
+BAR1 contains the 8KiB record exchange buffer, which is the
+implemented maximum record size.
+
+
+Backend Storage Format
+----------------------
+
+The backend storage is divided into fixed size "slots", 8KiB in
+length, with each slot storing a single record.  Not all slots need to
+be occupied, and they need not be occupied in a contiguous fashion.
+The ability to clear/erase specific records allows for the formation
+of unoccupied slots.
+
+Slot 0 contains a backend storage header that identifies the contents
+as ERST and also facilitates efficient access to the records.
+Depending upon the size of the backend storage, additional slots will
+be designated to be a part of the slot 0 header. For example, at 8KiB,
+the slot 0 header can accomodate 1021 records. Thus a storage size
+of 8MiB (8KiB * 1024) requires an additional slot for use by the
+header. In this scenario, slot 0 and slot 1 form the backend storage
+header, and records can be stored starting at slot 2.
+
+Below is an example layout of the backend storage format (for storage
+size less than 8MiB). The size of the storage is a multiple of 8KiB,
+and contains N number of slots to store records. The example below
+shows two records (in CPER format) in the backend storage, while the
+remaining slots are empty/available.
+
+::
+
+ Slot   Record
+        <------------------ 8KiB -------------------->
+        +--------------------------------------------+
+    0   | storage header                             |
+        +--------------------------------------------+
+    1   | empty/available                            |
+        +--------------------------------------------+
+    2   | CPER                                       |
+        +--------------------------------------------+
+    3   | CPER                                       |
+        +--------------------------------------------+
+  ...   |                                            |
+        +--------------------------------------------+
+    N   | empty/available                            |
+        +--------------------------------------------+
+
+The storage header consists of some basic information and an array
+of CPER record_id's to efficiently access records in the backend
+storage.
+
+All fields in the header are stored in little endian format.
+
+::
+
+  +--------------------------------------------+
+  | magic                                      | 0x0000
+  +--------------------------------------------+
+  | record_offset        | record_size         | 0x0008
+  +--------------------------------------------+
+  | record_count         | reserved | version  | 0x0010
+  +--------------------------------------------+
+  | record_id[0]                               | 0x0018
+  +--------------------------------------------+
+  | record_id[1]                               | 0x0020
+  +--------------------------------------------+
+  | record_id[...]                             |
+  +--------------------------------------------+
+  | record_id[N]                               | 0x1FF8
+  +--------------------------------------------+
+
+The 'magic' field contains the value 0x524F545354535245.
+
+The 'record_size' field contains the value 0x2000, 8KiB.
+
+The 'record_offset' field points to the first record_id in the array,
+0x0018.
+
+The 'version' field contains 0x0100, the first version.
+
+The 'record_count' field contains the number of valid records in the
+backend storage.
+
+The 'record_id' array fields are the 64-bit record identifiers of the
+CPER record in the corresponding slot. Stated differently, the
+location of a CPER record_id in the record_id[] array provides the
+slot index for the corresponding record in the backend storage.
+
+Note that, for example, with a backend storage less than 8MiB, slot 0
+contains the header, so the record_id[0] will never contain a valid
+CPER record_id. Instead slot 1 is the first available slot and thus
+record_id_[1] may contain a CPER.
+
+A 'record_id' of all 0s or all 1s indicates an invalid record (ie. the
+slot is available).
+
+
+References
+----------
+
+[1] "Advanced Configuration and Power Interface Specification",
+    version 4.0, June 2009.
+
+[2] "Unified Extensible Firmware Interface Specification",
+    version 2.1, October 2008.
+
+[3] "Windows Hardware Error Architecture", specfically
+    "Error Record Persistence Mechanism".
-- 
1.8.3.1


