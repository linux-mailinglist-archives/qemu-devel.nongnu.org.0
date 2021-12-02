Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060E466A31
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:12:09 +0100 (CET)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrV0-0000h7-U4
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSW-0006p0-8g
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:32 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrST-0006M7-AY
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:32 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2J2Ytl020374; 
 Thu, 2 Dec 2021 19:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=BhC6IvSLnX70e5iwtntIJrbg7SBxoRNxhgcequGTvD5wj9iSs1a5iPyNjtxThnq/EHTM
 ZwkpvUeThMQyfnBkLfQi11XIj/qBTNpPpl7FuclBXMO1swcl03cCCOwgDq5PBhTQlS26
 9TDTLVOxeUG5t0uDb/t+9hPe/FDW1HUmymI+5ndcJH9jDaFrTK9CloTIKJPIChRFplTf
 jSO7guzmknIq3AnBmW5tYwc1gqDoWfKXovRiLpFDQGf1o4pNHndbHtO74SrnUcbZIbtL
 bR//muQROV1b4fMv73nJZxM6UPvlKOZSU+xTvMGJ6Wg9bt1BcanBJEzvRNZ9KLozOhs9 eQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp9r5a8qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IppBU051304;
 Thu, 2 Dec 2021 19:09:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3020.oracle.com with ESMTP id 3cnhvh76f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+E2DkRJ8J1N9Q+PTf7sH1UTy3HYhFHJbVkqz/8I6ydrcNkbf2JADPPT18l1+PR1lCa9mM+MSDBbrR1tUbtSkxLR3Xy12BCeujflWUDCUPRq5s/WVuNWm6WU7S1SKi1/Trxwv1Go6ixCK1/d2EjcGOXrVgCmWqQhiLoHsC0i7+gcj4yOxHsK5MZpBYopgxG6oRGg+VQ2N5k8xcvjISssz4qOHzEJ+Hdy5RXXcy8MjXKb2BWIbM3K7hSCYqm64wr8hcBtN6naC9ENSF1+/AlT7aAsgzRyXbswbNK4DAbRfxCiiRfFVMPKLxoovasJC846vOTwsH4Gv72XZU+UT8+Uag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=ih6+UJIM0mT74lykGiMkRuAex5uEoa5nHe69Fxui0GzH9cN9oMoFZ0+49Te8hs5lyqqiRbiGtfkEzibZ/yDbaCVJQKc57GZbFvQD6L+hGknJjCxWnev+xswskhO/BwQQKOAAXBJrlSJ0yBPAavuDFbg/S1JkQyxt0S5havr8XgJGWHNZt2cxJVZ6X++uUb9YXD0Ptsb/PEqVhiysIqqBG3nYUyYIAvTT39rVQhGvKd/esO8+lons9nUElSI749TMncCfC9LaDwHFEpgRlmbRVijbk+MAEiLh1/UTALypaqJLA/6u7B0wWjO3+EosnTDGvENBKSidwZuTxz7Dh5CrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=MZa7i9bVdW0lnskUq6e320gM7THSDjAhuRe3WJWXAoaeeWXqB5Uv2hKVd0YgCLQzgmaG17NJxFot0gAM/S6PYST5+nHpg34Y5IhNE0ijNs8+o7kSOOz2XGxqQn9wlAxUCUPEXXfQyZiPcQJ/b1HJbuI93YZiruYhoJI0GEwQaio=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1693.namprd10.prod.outlook.com (2603:10b6:301:a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 2 Dec
 2021 19:09:20 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:20 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 02/10] ACPI ERST: specification for ERST support
Date: Thu,  2 Dec 2021 14:08:54 -0500
Message-Id: <1638472142-14396-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 19:09:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56be0025-1da6-4e87-7d01-08d9b5c73e6a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1693:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1693FBB7CA152EDEF57FEF6E97699@MWHPR10MB1693.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ljKcTr+7AQLuV64TEu918xWI2fnyAtKUbBgh1WXvCXVpubEEGLqfQkDKp//xETdU22HKcdhW1PImEFcPcm303wMr4HguncpcrAzpB5aPJh6AEGidqOrAtN1ofgyvhMEWIlDTnlqr7w7rBxgq0Fw5kE0SeV7CRlg4LuCx8pzPD5o9yKyQwGmBN83qtvqD60BPbd1F25fNra6U4iXCG2T+2w9ecxVfmo2v5lbG07+1vbeiidgXXdgldKkQS/Z1CE+7elPMX6ijiUIPIk9E8Uc+o+gOO1Cw1OzFWGFE59t45A4//D4wiRgrEQ+SdkcS3GY4YPjgs7daiYXYzq3vow3Sks+cNimPJKC4jogAxNXrqTdv9lwPlQ1ZVAJ+Z856UxzwU6vcSnINyHHlJaO5+x0r+fEsTCLtwiC+AShw2AMoY/PA2C7huyomamoGZyiKTZf0i1jGe1fHmtflcgbNIUE7H+kPC1vMLpoTeUMGecivtd/vvtqht3JqtS9R8MwnfRwIMtM7xTyeUi7q/q/UVo+XQfRPoyLV9SqMi+pWuVM9cHZd6kp4P7m32klR3CCuFLd4aqAlxOwUy62/d87egvSP56kwlG2G8tpOKpgP/NQ4dvLwt7/kDI3SX8zpZLsIFTjMZbpkFPTV6Qy98v6ANd6XLmKmSfHb61RmTh68GvxOoFgsikrKtz8i3LO8rcww8mBlvBZ33tvHXElh83tULGNag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52116002)(7696005)(186003)(4326008)(8676002)(2906002)(6666004)(86362001)(38350700002)(38100700002)(36756003)(508600001)(5660300002)(45080400002)(6486002)(26005)(8936002)(6916009)(107886003)(956004)(66556008)(316002)(66946007)(83380400001)(66476007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhssNvVeg5+r+9Qb/jEb6dc7pcREYR/IJtE0hTE5r3qZ93CL44HKMEigHUy6?=
 =?us-ascii?Q?TFKCXoT6Nb+8qXp86iZdML+08n9d0gnzrTG1NFFlmaNlhykCEw5kRjTnwF7z?=
 =?us-ascii?Q?YVCweFDL1DCtMSmcUr1NXEEUNnNF6rhK3XT0gEQV+ZzsM5rt54g94ttyjisn?=
 =?us-ascii?Q?vuMwDg97I2MW2HTfgOw4V0+vOfJlV2QM6BH0li21RHrON/8ak2eW913CJ3V2?=
 =?us-ascii?Q?asYXXLSM/ienwsyXnFL5PU3asADst6dmcNSJi/+Hjj0pIXDxmGQauRmlDQZ6?=
 =?us-ascii?Q?xE6B9OEmVKX0DfuLbwbCY99NIgej0gel00YCHY1j/NeZ0joVDtrsJILR/Fuu?=
 =?us-ascii?Q?ZtjMwFlkLL3nYqztZOoIEqzWe0YRrif9ZeZ+r5Pxt79kwm2U68PrCXxRwq5c?=
 =?us-ascii?Q?IQlm5Ytrb8cpUfKX1PyClkQuEgJHOj33PrJxdbjDFtA0yqqHlC6uhsrnimYD?=
 =?us-ascii?Q?NOqYN2DP/doWdARHychZ3I5V9C4ujSJCY8yyAtYOF5MWpYde90HmfD2Davu3?=
 =?us-ascii?Q?EWHsDTo9CCIi72njmrShdlFSoEhJuUyp1xHrzYDUlyWlIoLAh7UJ8KGHUZ1v?=
 =?us-ascii?Q?EBTJcLoV6Lmo9ZG+PA6SbX1Qw9/ur8GOQX4cxKefia7R07p56egqcVUeUwTB?=
 =?us-ascii?Q?wvfQ1eTfjo+RNgfvnZwGNKDD3VHCI8p2b6s9hNLqbQPxrfd+7Ol6CYet0hH4?=
 =?us-ascii?Q?Hi6BUgD47kpbJKxb8Cu6pNN1v8sRC3h0LkIDmPPY3f+1PnGt1xE3+ueeI8ry?=
 =?us-ascii?Q?bbC8uaJARU+QensfVO69Y6dLJlTVbMNqfi+8pfwybC3iQzrLlaxPLQe3tHh0?=
 =?us-ascii?Q?TtvDKOr/m4uypO00mfCXm7u+gcHUVYXJbfwhwKLS8QKvFGwJR/rijoB5h3Uu?=
 =?us-ascii?Q?dZ37gdhhmOU1GX8cVJkU0U9uLb43ALhGxY7BzYpq49SQO31tvgUit88m+XbV?=
 =?us-ascii?Q?4sVzd6ZBFmrvIHPfm6q4qZVZqTEacq/cHDjgqKqNxl9JYkOzhHxaU9WwUwOq?=
 =?us-ascii?Q?bx+yRi92lVOVjbUGJjg0+fHzRAqJod8lqY2v0aO4cPeszyQgwAD+QygnFOt1?=
 =?us-ascii?Q?Poy0c5pcuns1r9tCHZPeMmNZWXnvOsOCOmICqj8ed57KttwVGTVMV5PEZTCL?=
 =?us-ascii?Q?w7abeWV4hz9BPco+k7A88a4Jzm2lB+3iqG32agzfLs2C7F3eNSokJabXiFFs?=
 =?us-ascii?Q?vExh9E+QiLbKkd2qviG7Q/6fB8x8tIAsdmpUyFfc448BYkZDAYooMHhZxvUp?=
 =?us-ascii?Q?nHM/1b+zwKnK4hVGb7wm6YwHX2m/SWUqwCvbxdhPEbWGBzs+5QP4ND2F3nJJ?=
 =?us-ascii?Q?eKdzuzo7U1Xh6COJoa4+lsCRCgRwtpkSh/sAKQ1CZCTk2orLAc8b/wZgdIwZ?=
 =?us-ascii?Q?+obKtMTnafiBQksA74SZEaEb0Hy3HROVkY9K5c5GOsBdvc4ivUU0P4BUpz+x?=
 =?us-ascii?Q?cjoecFCM9fKOUOQ6/j562vJn8XSBkKxIW7/fRh8vcgIHRyVMZonywlNC6dwm?=
 =?us-ascii?Q?Gh5k12971gtuDw+pKzAG256gSck0Pgs1Bboj123p5XH4kKlAa8P4Hl30DKWr?=
 =?us-ascii?Q?8J+1mBlUEBgj0aK2s4wiu2Fkxya4dBreWEduSHC6oyXK6nj/2XXtG4IHAQ9i?=
 =?us-ascii?Q?RDO5fmMSgmgLJi3ugO4tVr0cs1TzaEIA9ALlCkWc0pzQgvAQ81BbDF3x4ytY?=
 =?us-ascii?Q?YTbHKg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56be0025-1da6-4e87-7d01-08d9b5c73e6a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:20.1639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOKE2/TF+bQR6BtL1FISRK/VKnM0ea4epmIrw+UqZE280vu/Wx5UDBVgVUPGLIyN9EnTjOCcLzo692ISE6L6xH2PnFhhRQhQxhv672moJK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1693
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=500 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: 1SqUAxoU8sLLPfH34-4bh-cTE3j0z9Ow
X-Proofpoint-GUID: 1SqUAxoU8sLLPfH34-4bh-cTE3j0z9Ow
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Information on the implementation of the ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
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


