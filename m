Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3DF3B8910
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:16:35 +0200 (CEST)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfhK-00031n-By
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ6-0006vD-NS
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:04 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ2-0005kc-9d
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:04 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6T05005964; Wed, 30 Jun 2021 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ggeqCo9toM/losbgAVSrqqlAcxFnvdTRMu+611m9pwI=;
 b=pNKaKbqtcsow6ZSr1/GN4LLHYhzWsopxS0g+ul1rpgTPX4kQXOle5kgHVnxacQnfxka1
 kDFq9QJAZAoFkMvsNJk5NqFCP9mOJH7BxeZXP4Xp72TGxnIjbI1w6jTEFBMuyyjmWem0
 LDAmSjbstvfs2DiKUCIDntBEzf/z5q9nZ4KO3p0mBWhQYFwWCwZjMsxmkWl1w34YZc9C
 6+2usvQhVcYsB53WlZKPE42WcMYbChO1KNAtObrP4EWxeGYwTzLzMdI7F50Dl5nV+fG2
 /JjELvtMjAjybPgl/nrqIVw0V9fgkr5wi5f2qinlbH9RMpHui4+ldNIssFxiT2ok0d8g bg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gb2t26wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UJ0CFH101369;
 Wed, 30 Jun 2021 19:07:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by aserp3030.oracle.com with ESMTP id 39dt9hqny5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4oW0lLfN3tqef1dimZYs3I2lzdSXyWWX8+YPXeeJ3lIg7VTjVHgVPNuKRMdVyuGGqTvRDX9SG6bsC1Qgr5DpnBeaOV2hi4ORy5uq6GZRhHHxRrBguwLdPwQDrhBZy2Pc3etCaYGUbyyV+oFp3tsgy4CLzqORnjm0POd1myZ6BfiVW34Bri39I5FxPMOFDOD2R85CwaLNknGzWFCy9z6akDYM+mkyEb7wYdo52ua2gykyz1R48XtN42ya1+lYEWDkmj91S7auwM7RXD9YUgxSL9Z0dOGK9PxwajEEnH0ZWpDCirJ/CQEMOgRczVjNjCvCwvXM8/eIC/BebsMtO8iJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggeqCo9toM/losbgAVSrqqlAcxFnvdTRMu+611m9pwI=;
 b=UJPQPtj9I8oeiMi/iQAj6dFHdnsd5vYYUKE9EE8DLXGaKYV2XDLmineZBT0Zb3VXBFzda/zgjWCbNIaBjJWJPcbjQ59GMqsG6bgbWnhNFQ33QSqFfE0vRldLs/By1rutYdtr/7EOrYPN5KiPWqHbwVvsdOJz46LkFv4t9SwmP3oMFmIN6/3ol9CXgu5zapTdf3M69enSPWwqCKmHK3FmFBIJkMQiL50z9u/lOI2k0DVrEf5eOnMwt/uizZG98f27565tVR/MqPm+XVITaH1We5g6prA/w0EP4hq6ZPkERFLw5Yh1rfHatCQPCgn2jRWS0NYV3/VEu2vCincc+MSgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggeqCo9toM/losbgAVSrqqlAcxFnvdTRMu+611m9pwI=;
 b=upDemyqk1JSKaw732bl24yZImIjpcSLK+oguIeo6PJfptXkSpzNJmcTR2zDcp1MNkCiwOTKoNNYBVSW+JOMapre+v1654HSKsQDbpGyGpkRSwnDaZyTxmuyraXQodrs1+nK3fyiPCDNFbsELLgZtme0C0ZBk303yOwKcCVhW5bY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 30 Jun
 2021 19:07:54 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:07:54 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support
Date: Wed, 30 Jun 2021 15:07:13 -0400
Message-Id: <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:07:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 076908a8-875d-4a38-5f5f-08d93bfa5d53
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB544127F92AB8CF15FF4E398797019@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ou0z9YuR8Iq5OHOJQ9JrjlP4XChto1al47aacj3zyp3UOiJHn+Uj41FTD4tjkbswlZDMchCoUq4eLJSVoT1g1XvH+5Gt52SCwadiCryEWO33nbK2o+21UYnjVfooUW0CJB138wwHNiY7biB9gXnFj/O+awYvDv4LK02NOw4VFixlUyEXibUHFcjWCn5CKyUtduIyWcRTECQUuyX59EcGivrBmGp6J4s/hLqrSvLA6CLrhP/GWKAS6Y34hpzsxTxWHZ8B1tOie0BdZEDnFfB8xgpO/0df324RTbegBl4+FgcAnEqgX3pZzp5ZiAMeQZC+2Wn63ou2YOtss8XzxQNkkQ7bHYNPPvlzZM5KbwuoDBqRX2w2TMG+Y7SUmTFY/Nc1iPyGsb/mBu/Ww3ePoRhPxfzafV28zFzUeCPBnsosSTwgPYS0duWm0pzCiT9hgLmNqEpKvB3bST9WV2Um+eO85U0+sMSKmd2Wj0GrG3n27Xmmi6sXBcxQ6lrGTvucpWbxTiLYyAOotfo3GD6IrZ6sfnnCiPgUCltFGr9th6tDSIdDDylZTFq2C9WyJ7re4oTIs3z8q5EGrhTnpM3ohmE3UonAfjE9Z2yEldMBwpFADkZ3xDfks3B8UvtxWpRmPMK5dkHMF3SCSRbULnOYocWxnLew8xDIw7f+GpyKyvLX+CKmL38OIHjFbP7sBlQGIiOvhhhB904colMSDNd0p3Zg+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(8936002)(107886003)(38350700002)(38100700002)(26005)(36756003)(186003)(8676002)(5660300002)(2616005)(956004)(16526019)(4326008)(86362001)(66946007)(7696005)(52116002)(316002)(66556008)(6666004)(45080400002)(66476007)(83380400001)(6916009)(478600001)(2906002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ySSG2PvsDZCExa0ZkCXf/xNFHoedHIe1I1mdyvfEAk4ag9cvwvo/PHXyZFyU?=
 =?us-ascii?Q?7vUmGomLEBvZ0nqtP1bfsjXalNTC4kfv5EsNerS9O2taaR4zsNY5R61kAUII?=
 =?us-ascii?Q?SyZvS4kngNydWB7Gk5CmpyQ5xGvHrq6q7kWAvFxMlcfo5+alA2N2yNBeQXAL?=
 =?us-ascii?Q?MxGFLtMBmoDmI743dSJUTjZmowK1P0eYf5TnPREStRr4BBSnBL+8NJ9q3PbI?=
 =?us-ascii?Q?dSVzPVE6Bnmq2lady51iLHEJCTmckeIIfXDynOlAiLFXlNacdwFFinAvnAMv?=
 =?us-ascii?Q?tigAVOHqGz9wZL7Vs+tlX6tWaVQTG7WyT+A3NSMmOYBAbANsWUQqqa83qg20?=
 =?us-ascii?Q?8IfrNxdq/H4HuA+quvz8iWLQFCirqWDqhrybgzjfEZY8M00YASfM4R5/Pl1k?=
 =?us-ascii?Q?xehDyZA0sjFoFqrI1hT75X0QlAoJb0YpJg9c7R8Hb53uExZFhnwoGDm44/p8?=
 =?us-ascii?Q?T0B+7Vwe2PaGZPVyo/AZMaSOFVeo1mbjgOCLraf4fAcSYBOAJk3prTPQ/hII?=
 =?us-ascii?Q?lkIliOtaKek6eOf1uPFfjQKseefAji3LiHbNgANxJxLvJ9JRA7MYkKAsitNQ?=
 =?us-ascii?Q?r6KuB0jU/AL8luBO0eb8ByEvVhgDVrNLNtDzuHhWKeF/gteHzOIEhQWCqmGT?=
 =?us-ascii?Q?QoECD/Eh7lV8/Zvf1LpDZPAMccRuV7AgJsLgKDDf87v9FoWmRmdGE9P+A/ey?=
 =?us-ascii?Q?/7nvewl8qG13lpxKG3utzKIHCwot29TOB8AgqR1oKIrPmsqw4swURGlqMeS0?=
 =?us-ascii?Q?jTKm7PNUJ3anV9DsuF9hPKzm8KB56G7eXGIf4Uf6dj8Ln57aGCYHpd8E8Gd1?=
 =?us-ascii?Q?uKFUI0tyaRw9NIHYguj5W7y72QEQm/CdzbrcIaCrn5lVFJXlsgFvxeK2Ag89?=
 =?us-ascii?Q?lK1bn4v6Af2ZmSJdPH76g2NyjIinEP5PuUd6KK45J1tAGuIBbLMf9f5hSJ10?=
 =?us-ascii?Q?fEGv8VpC1ny37ZIXqtAmH7T0g7QiA8QLzYki3MSO/iZ2ROOY7XyzSswoRH3z?=
 =?us-ascii?Q?mogQs1ZfZEnbROZAe83VXSYfituH+aSHKrXKXFH+FrrYcdAC8qiSV5X5iaEc?=
 =?us-ascii?Q?roq/LV4V/4IqYH0FAIj/Uglac5sllyW15MDWCx4+uGWSTO9cdBYVk1cTtJY/?=
 =?us-ascii?Q?QwXEf5llWQ9wozdg12Ym3BKPjJGnB7Qr4r8Q+yohtFE/gXFva3wfI3opqIou?=
 =?us-ascii?Q?SmbdOMJbdHqtW0zAS9tRKtVLAowMw/5pcqp+93m6CPqSU9upLJxozhA+dISv?=
 =?us-ascii?Q?+lq61RFQ8d+7zivWv5XmC0sOcEJkOk+YUKXynVeEObn5aVvBteqMytZDgJPe?=
 =?us-ascii?Q?VWJH4oNvHrLLubuFMr+JY3NM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076908a8-875d-4a38-5f5f-08d93bfa5d53
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:07:54.4518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuLYPdXKf416qH9vxDc3Ah7HOpbUq15ztNK3y2cwVatXQ6hwV/mZ476vbCQ9KlcZn0q6eQbYCVnZ9sAXoKDy7ZqffI7/RudcL4EGx/MHW18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=916 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
X-Proofpoint-GUID: gRvJ9D5FEw5qsVewCkvxF5uCdBtJZCoe
X-Proofpoint-ORIG-GUID: gRvJ9D5FEw5qsVewCkvxF5uCdBtJZCoe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Information on the implementation of the ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 docs/specs/acpi_erst.txt

diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
new file mode 100644
index 0000000..79f8eb9
--- /dev/null
+++ b/docs/specs/acpi_erst.txt
@@ -0,0 +1,152 @@
+ACPI ERST DEVICE
+================
+
+The ACPI ERST device is utilized to support the ACPI Error Record
+Serialization Table, ERST, functionality. The functionality is
+designed for storing error records in persistent storage for
+future reference/debugging.
+
+The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
+(APEI)", and specifically subsection "Error Serialization", outlines
+a method for storing error records into persistent storage.
+
+The format of error records is described in the UEFI specification[2],
+in Appendix N "Common Platform Error Record".
+
+While the ACPI specification allows for an NVRAM "mode" (see
+GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
+directly exposed for direct access by the OS/guest, this implements
+the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
+by most BIOS (since flash memory requires programming operations
+in order to update its contents). Furthermore, as of the time of this
+writing, Linux does not support the non-NVRAM "mode".
+
+
+Background/Motivation
+---------------------
+Linux uses the persistent storage filesystem, pstore, to record
+information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
+independent of, and runs before, kdump.  In certain scenarios (ie.
+hosts/guests with root filesystems on NFS/iSCSI where networking
+software and/or hardware fails), pstore may contain the only
+information available for post-mortem debugging.
+
+Two common storage backends for the pstore filesystem are ACPI ERST
+and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
+all guests. With QEMU supporting ACPI ERST, it becomes a viable
+pstore storage backend for virtual machines (as it is now for
+bare metal machines).
+
+Enabling support for ACPI ERST facilitates a consistent method to
+capture kernel panic information in a wide range of guests: from
+resource-constrained microvms to very large guests, and in
+particular, in direct-boot environments (which would lack UEFI
+run-time services).
+
+Note that Microsoft Windows also utilizes the ACPI ERST for certain
+crash information, if available.
+
+
+Invocation
+----------
+
+To utilize ACPI ERST, a memory-backend-file object and acpi-erst
+device must be created, for example:
+
+ qemu ...
+ -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,
+  size=0x10000,share=on
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
+   ERST back store are written to the file immediately as well. Without
+   it, updates the the backing file are unpredictable and may not
+   properly persist (eg. if qemu should crash).
+
+The ACPI ERST device is a simple PCI device, and requires this one
+parameter:
+
+ - memdev: Is the object id of the memory-backend-file.
+
+
+PCI Interface
+-------------
+
+The ERST device is a PCI device with two BARs, one for accessing
+the programming registers, and the other for accessing the
+record exchange buffer.
+
+BAR0 contains the programming interface consisting of just two
+64-bit registers. The two registers are an ACTION (cmd) and a
+VALUE (data). All ERST actions/operations/side effects happen
+on the write to the ACTION, by design. Thus any data needed
+by the action must be placed into VALUE prior to writing
+ACTION. Reading the VALUE simply returns the register contents,
+which can be updated by a previous ACTION. This behavior is
+encoded in the ACPI ERST table generated by QEMU.
+
+BAR1 contains the record exchange buffer, and the size of this
+buffer sets the maximum record size. This record exchange
+buffer size is 8KiB.
+
+Backing File
+------------
+
+The ACPI ERST persistent storage is contained within a single backing
+file. The size and location of the backing file is specified upon
+QEMU startup of the ACPI ERST device.
+
+Records are stored in the backing file in a simple fashion.
+The backing file is essentially divided into fixed size
+"slots", ERST_RECORD_SIZE in length, with each "slot"
+storing a single record. No attempt at optimizing storage
+through compression, compaction, etc is attempted.
+NOTE that any change to this value will make any pre-
+existing backing files, not of the same ERST_RECORD_SIZE,
+unusable to the guest.
+
+Below is an example layout of the backing store file.
+The size of the file is a multiple of ERST_RECORD_SIZE,
+and contains N number of "slots" to store records. The
+example below shows two records (in CPER format) in the
+backing file, while the remaining slots are empty/
+available.
+
+ Slot   Record
+        +--------------------------------------------+
+    0   | empty/available                            |
+        +--------------------------------------------+
+    1   | CPER                                       |
+        +--------------------------------------------+
+    2   | CPER                                       |
+        +--------------------------------------------+
+  ...   |                                            |
+        +--------------------------------------------+
+    N   | empty/available                            |
+        +--------------------------------------------+
+        <-------------- ERST_RECORD_SIZE ------------>
+
+Not all slots need to be occupied, and they need not be
+occupied in a contiguous fashion. The ability to clear/erase
+specific records allows for the formation of unoccupied
+slots.
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
-- 
1.8.3.1


