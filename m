Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D0E42FBB7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:09:55 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSaY-0003nJ-2X
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUW-0003uh-1V
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUS-0007iH-W1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:39 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIeUA1024918; 
 Fri, 15 Oct 2021 19:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=dC681MLFBirDfMmJE2l7FpL058tXQk8lhHMW0vSUFBBrtIxn55ahos1t53CsaD5qrWww
 e5GFaXJTrXRvpwZ7iUSI03cyfAzr647h9zuaT3bAV6NwLxwHaV2ODH1yQQgNEO1URLjK
 c0tbtXSWKxqcpm14m/NpzCaZJsvuJLanR4BdxY2fMFY5AH18q1eNbtg4blYVnZ2jKrBS
 9GaE10mgpaDJ17PkXW9LWoYsQ61r7wMrvRxBMns604FgOmC55jG7xtXhlo32OloLSsE9
 xK1XRZLQjI3wZnw05V8o/gU4SgLkms8kmravAf+oMwyNhqFc0GuozeFQf8d0wMfSvpU+ Ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqbgfseqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ0aMn082428;
 Fri, 15 Oct 2021 19:03:30 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by aserp3030.oracle.com with ESMTP id 3bkyxxapvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTl3GEqMY/iEfxrwneu5zS+rBTfbli162o/PjtlW3Z3kpyk2H+abRLFJSUbrGDniaBA0WmbbiNCZzx/zg+w5gOlkYjxDhEsQDZaM88MMKEuk1GTmWsCBjIvwtIkstIt5AghnNXGeQrSB+wopSijvCSNJUmaYtuLc/5rfbm/idSOdqGy4JmVwFoozaIBYy9ShrDTtC/qZ5CvsRULx8IVmygza9EbIVFOBQVi5bucFYIe5GIOI+EzW1C5v9XZjrKP1Y+0h3VVEBhzKjC7hKyp3WiHI5aRrPQRbYzpnd2HiZQ3g4la1pkFFpF497fYlEXkReFZWLujx2D+yM6+S2ZcViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=Oh/49gYoUw5uajIq6PAH6DD90mYoHamPMoqRgRZ/9tAZ84sJB9MKRwHjI1MWOgFZobSEf9U4x6Wzdm39nBMN37GxM8UlKlzwSjVdTUSrtRka5eupOlHRv12HO2nXi4js1/wppUZZFJ5P4gPAmb5JXhhLsmpKwSBbltvn9bbAqv24G/egwIkIPFi1+7donNpZd3h8kALxjvXDzdVD2DF+i53Boi2glN+Ht7Pz7GXhryKTUTgTrJrmkngxbYCfYsnCSJ97+W4aCJ2XoroDl7uBkklJQjLvBR+oAuEo6GM6ni/1ftF8upkX5USc0FbizWtbSF0WuiZ7dej7IaLJHGbJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=ELmNm/AWpQklFyQD2LAYDxmMeBrAkg8MdJtGWYgdkBw1mHKw7CRvzTXM9B+1P1YO3uFgXLD+KjtcxNtmT2p8Nj6WZMNh9Ju4cDOytamxrDwtAY1CnnshbT51fDO0VPkpEKPiFpa9rLnQmASAE4Frkwl9KAP8NBJikQmIU2MTmUU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 19:03:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:28 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/10] ACPI ERST: specification for ERST support
Date: Fri, 15 Oct 2021 15:02:52 -0400
Message-Id: <1634324580-27120-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11fec5ac-0759-4fab-0e10-08d9900e78f1
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54417E12BC69E488164084E197B99@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVy3eVMDkDcyNR0YD+MjUMn1DlzMy5Du/xwicW82cV8jJl7mPI28NzrjqakI5DEAbWLnJ1LWQEhH1KyFlKuXwwsn8ZqqUEdplhOvkq95zm38h19Dofz0xQNP0t3tdp8vw03jGbZxed1M8Sf+mUBT4lO/qnVYLok9/1a71O5oa7JlAGSmNnkKpQY3CASahLjLVVD1Lu5lrHc2UP4URbhF7ur5UDHmfNSyYWEa3cbDK5u9ycU7bwL+2QJmPGABQzIN9ExdufCRAv3/IGSLjsPVc5VIUbA2X5vGjzTDgoGq9VaepW4WNszXAcRbH1kNGBiSsrT3/QD2+IkkG8ZI2BrmQZEJPLcmhrLIjLQf0UeAwtkDbmsZGOuCNMruyI6bAhvlC97BysLp+ZcL03wI0o7iN1SdQwqetr38dmzYSigut1HCiK3OXqYbp5H5iDm8UCSja2Dq71di8hlgrEtOJ2vYul077XH9djsvNMCPym5COmLJ4JUvG6h09pLAI1CmlCMNubvoGz2nDOFWRSx6PaAKvk0IaptrR4PKBXN2ue9EbmEbmi43xjt9fqWN/ilpmPtl4uQfFGRUawV9KNjzumCLHibJjh5xhHOg0symjr8wRP8bJS5CAZmWME7uUHt3uV8sHoV9X4ecBWi8XGwXAp4UyB3PYwERjZBbI81wpydQi5jI093rZwCI/MDCmOBrnDsntwg8hQvLpZb96T9paw7dNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(186003)(66476007)(66556008)(66946007)(8936002)(83380400001)(2616005)(86362001)(6666004)(2906002)(956004)(508600001)(5660300002)(7696005)(6916009)(4326008)(52116002)(8676002)(45080400002)(38100700002)(316002)(6486002)(107886003)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6oZSkSPqYHl1MIJKlasjokzeYtaiCuLM4iyvY3hMFKJ2dj4Hj4+1bqHh147L?=
 =?us-ascii?Q?ul3KY2szhz2A4L+1CY9IhnWvl0EsE54iSwVultCWd3vujOSMXn2aEUPmX0sn?=
 =?us-ascii?Q?hYyBOcaXWMc+MYSnJDbnuZulcr0lKRtMT84I3CcioWj6GyRe80Oy3s9So1yT?=
 =?us-ascii?Q?znYckAo7tSGPvtPm4Xv4m2rovpdgR3A1KyCy5QyIEUfgaUrXjAfnsmw3aF9V?=
 =?us-ascii?Q?w7JYPj0pvjdvHZ9DeaS7yKdo/K6Ewz2h/7OWeGdOzURbkklapYj90n/QJ0w7?=
 =?us-ascii?Q?f3V0C8odaYzySOYNhJZ2tKxu9HE4xe3qqUgOtqrZakDd/dgDjPuE9WXeHJPL?=
 =?us-ascii?Q?wdWa+ox8mmSZphQl0QV/fHRMMCWLpPBYkQEV2MapbOSHAzgintEsrvnzGpBT?=
 =?us-ascii?Q?dez91PsJszQNtEC2Ji8qRggp+ePJDy+GXnVm+hx183J78sfBU41k3OgIzmQz?=
 =?us-ascii?Q?cgQfRAyGjCjhY+GFI0IX9NnvAtk17I4IsjBPNQX95Koyl91iPnd8dIi8+Qji?=
 =?us-ascii?Q?Fyk+L4OtbRt4fAQcaGKB+B9djVuBxGsBLIZfoY9kysDTSJ69zMa80x59bWcd?=
 =?us-ascii?Q?olMkGTtdL7ZvhFr6lL1NGSM0QDreR0AHGgqananiWso8/aujwTNOcr6BSEE1?=
 =?us-ascii?Q?luxLsXDZ7MSmDtrqx5CS40I+troRIIhy3czg+uGZYM+cVus2YKdoCmPTaxWr?=
 =?us-ascii?Q?gBNBFaxHCJfVJDDH3Wi7eYojVXO/L18yQGUBr3Wl4hInWBwAbom4yrpggpcx?=
 =?us-ascii?Q?2A2Gyz3rV/UliWale1Zv0mInzAyh7rpv7y8MI70Yd0pebcCfam9atw1pclFi?=
 =?us-ascii?Q?qTnG+QrjVa90/9jjPgPnkRi5n+ijB98dc9RAFQxmbbuICcdb8gDkSmmXXZ3V?=
 =?us-ascii?Q?5QI6MuPKGGSpnuCKZKZto83XTTo/EIfty57FYnSMDMhTLn3WYjqreHvdy6iZ?=
 =?us-ascii?Q?zhqAUU9LVCEP2C1h9JSjJaTxM0AT8lTAT3lokfvfPgkrkkL/73Cm3+RnOupM?=
 =?us-ascii?Q?hLGtnYfVncu/MpD9otvh6T99DkuaBhFKQSCjFrLq8EN3SERjIQik9C5SIz//?=
 =?us-ascii?Q?45LzP2+cjR1FXclX4CoSl1yVe0SRM4w1Lw142725B0JWChYzMiC7FFrJP+n3?=
 =?us-ascii?Q?egeYY/k7vBqHJmLHsa+VnhkEmz0ZbduEvNF9/BbQFzH/xZIs1diHrujEHAYQ?=
 =?us-ascii?Q?H8MsViV5Wv+keeIoe1xNCPHVsKe0Sup6Y3fxBpsh0wwEd++241MjUzUE7yns?=
 =?us-ascii?Q?ADYfBkYp1A6c7rQ8cwGdT1IyUYdzq/+3HYbU8Ns8AenmiPoSP6kyejDGaFfA?=
 =?us-ascii?Q?8t0h/StR6AV71Ule6Qg9RWyf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fec5ac-0759-4fab-0e10-08d9900e78f1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:28.4622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQoOLPQWDWy6+WWKX9wplcAFI9PPAEwzVwBBj8gIjHO2Y5Yq3PLV2rOk0pYR3017Q+5HKH14feVUwZlGQ80mXPvY1QxXPN+2+ItScNKPaVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=394 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150116
X-Proofpoint-ORIG-GUID: iXnPYNKfZ1CZslGbaxIxjdVw1K5ltdxi
X-Proofpoint-GUID: iXnPYNKfZ1CZslGbaxIxjdVw1K5ltdxi
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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


