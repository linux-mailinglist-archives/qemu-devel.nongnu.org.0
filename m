Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D40475D29
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:16:38 +0100 (CET)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWxJ-0006qd-Ow
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMw-0001Bm-LU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:39:02 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMu-0000WT-Dc
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:39:02 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEYwDE008125; 
 Wed, 15 Dec 2021 15:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=qY40UZbBhL7F6PMz9e0T38FGJ6bPGZLxI+tlKjRmfcoEXg4s9kRFpeEYgffL/Y/+e0vQ
 qhhgI87w4gQ12L86Uo6I0dgT+nsNWdgiyQXuqpRN1cS8kQFN32WH/ilMrh8ohvW4Ciqf
 egd0yj+IHu6W+9EH/CvIZcPBdfkvS9gDvC8t6zqWOFVEcn35HO+6kyh3zRdG/GACsPgC
 zQ/j3ptGCwh/z2+SgVM47Ixc+EyAOReBDPPxz8sIAwNMkWCyxUJs+c310XGiBraqKQm5
 pAIQ9zjkQyueJmDzJCCOp1mCEMYWmtUOUwRqU1xsrMFn5PY3UX4V1Ya4Ox58lh+ywOkz kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx2nff7bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUWh5094224;
 Wed, 15 Dec 2021 15:38:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0x2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cm0rY0gS1uBwi78W4Rv8GnbL6AHkYnbuPB7QGBHugsHMMLh3IeOqz/WNRwVwsFX5YX5cpE6VOmxdGXKaQTwAAW3sBi2tTBpjK8dRjSDp1vDG6f1pfIia0epbpFDZzmoBRC7dzmh0Z79h7HytdwUCRRA9wXmH980qezPO7GgFWewk5IukMZWolb9DThAlRY1oIEly2pgxQXnAxO4tzceL0KlsHmWovAwWSCKkpXNfPRCT3mw4S3l5Dt3NlpbrDDCXE7FN89fpulMEhmeTY2mUvOwKPtb158b/6zKH5ErAXB26xChGca/3UnJ4MBJYo4TyjmdqaibApF8XJMJGYQAXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=CFZrWT9GiCp4c3Lp9+BdEhzWBNVFQvmy2HYRaY4pn69PWCN6/ndojDjuIzRsqtluQ6Ikch1NppW/aXuLVIoZ2ezjmTWfw3ENLhmND0iE/wF2ZM5JbcrYOCOSAeIZQvb4N4Z9cHUiycgxYQP8hMDVFuxDzuuDZEl+yRs8dDPmLU+P81ZrvoJrpYXCmvVxj5jRTS74Ogl6j5pxYdNLbJSSJ1S1CYvf6W9kgykeAMkSMR+wNAcU3v5cvjK6MSXCIuv/4Gxy66IYmD/4gUk9CN1Y229hW4+alln3Zi0A2o7Y42iIZkmCzAJgJnG5O0TigSqcdmItAsbjpJ1KbBR5M7ATfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=LShTSX4W/3hiMKqdgL83rb66hekN1w78GYab0I5mI3AyI7Q599guqRLbUtOtWnAgAfi2Q35EpigFZGPLQM90q+l0/ye1yWcfNhnW5G3ced69b6QPrvfaffO4UhcvsZfWH2ztA7BI9ozUe4qnlHq8fOmS4cXzuNu/zOB/xneS2Aw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5474.namprd10.prod.outlook.com (2603:10b6:5:35e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:38:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:32 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 02/10] ACPI ERST: specification for ERST support
Date: Wed, 15 Dec 2021 10:38:07 -0500
Message-Id: <1639582695-7328-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05816870-803f-4251-d960-08d9bfe0f348
X-MS-TrafficTypeDiagnostic: CO6PR10MB5474:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB547465C359449758565C554597769@CO6PR10MB5474.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lgfv5z5WiniMe96cn1EmcsJsZ9J7iZfo3vAUmsIr6d3H66esW+03z6p8YYOhocmVQy6nT88rc55Um8EUKhDvzYNo3NcfRS37+A0vjqBIiMIEP1G/89jf8pE/Cn9tCmdPoBqdNfGINYMuYAE668g5dON8dfb5H0vaUocWm+zInnRIE3k5jbQTpgMysc3orIgTLIWKH49tjAhHu1HBQO+imYe1VpWOUxm3L5KEyR+USL+m4ujLCwmGIVIYT1fw0ZKdT3HaRMJBvn1NJjRK5D6SOOLDXR51hu1FmKdzDa2Ffd6O9YYUnZaNo6ZU+LVs8yV/lCPjIOX0Wm0fNYk4rHMYcbU6czcVh4EzYo35T2Mnm30t4HrbZj+DD6Q0yri8hYD6XRJ7/V/mOKckUacXNNC0rvVeug/PTdVLsKOvQd5TbZD7uVbNbWCI6Nx1/H3UP7108icF2iXdFgjUsUrrrQ5gp33CX0jdNWRHbJBuCvPx7tEml0vvGTXYUFYMX7Cv0sL7Pdq56l0fUIq9HviJvIfV06FGziD0NM5kcZnE9O/HzUlSAqp9QCq2kFFZCL03wPReLxEOlZci07HI8EuiHwk8c1IrXEWOVY8naULX8dD3w9rd6p/brPpQC0T9JJ8eJ6GFM6YR8iNBe1qsIW/8WrvtDCWP4ebRfl31grKA58EP3QjYOAifBCzsRAZ4+BwR0cRJn6Wg1LZy3mh8jbQTIuT/1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(45080400002)(5660300002)(508600001)(316002)(8936002)(38100700002)(8676002)(6506007)(38350700002)(2906002)(36756003)(107886003)(6486002)(26005)(6666004)(4326008)(66946007)(66476007)(2616005)(186003)(6512007)(86362001)(66556008)(6916009)(52116002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ezqt8kP3960OMVs/bk4ozFH/Nyg6tOydtEZSk0TTSZ/1RFxOeoc/03HoukPp?=
 =?us-ascii?Q?TekvOLJvk7tePUMHQqLvQqwe/pIFP7SaYwmkXKr0xFpRiWgDHeYCTnw7DXuF?=
 =?us-ascii?Q?b7zY082N1aG3k1cmwoZ2yGAViTkaOhnNYzJn1Cb18uL4lpjKnUDaCnX2XBmq?=
 =?us-ascii?Q?yRV6UGeF6p0NZJZr1Q0f6y2f/fyOkNy9eXhxrlUc/+dN0rfTyEf5hrdVgwEQ?=
 =?us-ascii?Q?/G7mx7zPM98PQci0iYhUAVvfJJ6T+WLgCJPW1g4oxiYT27xu2UBj02XDOUOV?=
 =?us-ascii?Q?FVOpybVYwCHOsjkSTnuu++enXl9B0voAzBazBgf43Xx3WLwSXokh57/uh8i6?=
 =?us-ascii?Q?enm5ahRKvXM9gS6F83jbwlH4hBDHFc2nVDat6w1n8MGiQegqnDPjNnj5VFlE?=
 =?us-ascii?Q?iqryqVAXqIlj80pn0f0Pyrhtd2qQYyQgvqZp/oKrx60O1gHyyASr9UwH9zQu?=
 =?us-ascii?Q?T3BvfKz8vLve/phqsCr9YmJWYoVbPLJMkiiPuL0Tu9NrOlRNYJLltDhR/dje?=
 =?us-ascii?Q?LRJ+IoS+c5hZz8XbB/gTyjgK/FphQS4dVJCsUWWTPTSQba+y8G0fF3x8w6Ag?=
 =?us-ascii?Q?NjVCGIU6QKbMYRw7LY5r7+Y0kyqo2c0gylY5E7i8riKcekCQjjlwCP3ctlG7?=
 =?us-ascii?Q?TpGAlxVCEfBabT8z6PUyB4A1Ta2NBYX5tUZasMxd7RzpA0UFIkf8H1CQNwPe?=
 =?us-ascii?Q?Fs3/Lt1dY0SqyOMGhypz+B9pq8/JBxFG9qlvFqBND2WHDb8UjPYGHsXPANqb?=
 =?us-ascii?Q?AneSvf4VlLz9ijGGE9+HWgjsYUUEEDKCEMk9g4zeS0GuM4GhHkUfQZArZcN+?=
 =?us-ascii?Q?jts9wNUyxi6qL72fdmuRgS2xAf2ASK07kTdtkWf50HQiE60VnqyEme2+UEvY?=
 =?us-ascii?Q?bvPsS27JetBMuPYvlHcWWGNAEL14PNNSqHG3m7Q1VesXHaJRCd+GPsnTBFPw?=
 =?us-ascii?Q?WQHT7qqMmIamAMFilS5QuskrsXzRv3UJacMEr89uaUkb8Ii/kRV5sD0nJ4Ct?=
 =?us-ascii?Q?sbGx4++b4lcRIJclYaCabW01wEyxAc4d7mmcPmqWZsMTJ5UXIjJFdZ5AJKuM?=
 =?us-ascii?Q?6ouOZpkQ8z+z7Ve3/oZFz4m1gCyynjpcH3QTglI0dHTNt+qmh7vXzEMMYYBC?=
 =?us-ascii?Q?PXQEXfz/qaY2ZfSIEH+dGIJTTcsxx5c/J8zbYgXrt2O8lZyoIy2eqXbCV/or?=
 =?us-ascii?Q?FNvq2JShvTYYfgaomj5EQ//f181QYZWqVQPENLIfTzeVG6nJ8/UEDtFNtFWv?=
 =?us-ascii?Q?hQU0LKL3aIfitMN5wKxwHA7k1d/EGpxt711X1gr+oEHsfy3RQ8vXXusjT1Uj?=
 =?us-ascii?Q?B3QexAd+VRQW3oasdVvJCmJwxYemALDI4bTMoRfC9H4j+bOSfI+m8sEdhY6Z?=
 =?us-ascii?Q?7HDyG5DyE6TV1SgS/WwjnYSRqJ9omxejbyD4edKBoIYf+bJEs6jcVpLMoBRn?=
 =?us-ascii?Q?rUyUuMJnwBD+3rmYLRgUXmeHqz8PIC7/J7W6Eir2e+7e60SCPN9vCNelZGo4?=
 =?us-ascii?Q?uHCdzX6+QZKNVQgEspzqrR091g19UnG1OGcI/ZaiGfYfUtpT9jMrtgfcmxGP?=
 =?us-ascii?Q?bD8yrfCnqDl7fcO3/YXnkGjgu+fFYl5/3MloknuymWZQ89Uin+WoeLFGGSn7?=
 =?us-ascii?Q?OcvhjoLW23/B666BFU2QKOzSjJNu3FAIReJGlvEQ1NnW8Y3jvEOrx3yDlmdL?=
 =?us-ascii?Q?tXZRZA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05816870-803f-4251-d960-08d9bfe0f348
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:32.6259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcNdOzuWDpQtog5932BH0IV/apa4J6xVGcFrOc8qWmyInTgHj0WCC8+kVh2ai08RZWNip5k9eGqNSVfWVnDzJehpVOj/Wy7Kp4nbSZIhvp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5474
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=449 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: alxwI3VD4rK-hhdB_n5PcITFmw8JdsDC
X-Proofpoint-GUID: alxwI3VD4rK-hhdB_n5PcITFmw8JdsDC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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


