Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B049CFCE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:37:06 +0100 (CET)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClI9-0005Hx-Bi
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:37:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAG-000638-SR
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAE-00032L-JU
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:56 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFosRv022417; 
 Wed, 26 Jan 2022 16:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=Px6iohd6/GeVl2wZmwUBx/P/pj3AzHmJvCc5TQ97mKDBP35JhDNdIyfJ9qJYmRRX77CO
 IEPMDZ4NqybpJVS8lRD5Ow3aafXG6yGrUGGd7UYBEZz2IBvQpnHzSZoVTedgkBymMXox
 GW0QW0AQ4dj8DXQsbqxe6mgLfTwWgSpMbhq48o1T5W0XBu87R/OUxRuYh8kUOTqd+KvT
 uXOGl12b0KMP7iO0uxkSBnffvm+YNJRWpyaeHuskgf2m6PaZCkUoYFn0QDtMiMo2vprS
 uOpVlTR1bhcFQ45EjY9RO+YlTZcoMNapiBX7KVHS7MSnbjy0PDWo473AojrYwRcuvyPA +A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjf3qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGB3UP148885;
 Wed, 26 Jan 2022 16:28:51 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3030.oracle.com with ESMTP id 3dr721gta6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9opWwT5/cV9pr2mfa6MqCUfWOPAwANkkRNxekuFO4LXovRn0m5fTNlgIrOHY/C7E0y1i7t4rMKje0HJZLK4H3px8KRa1FuXLDKMdiS84UcLX+Ft7DcbYQLnv/H2vPtKdAlQQnLlfsF8xJc9ZW/p6dXRPSpOxGfSWKhl6QxXblqUgVrD/AJTz80kAt9XYFFAtC22KxoRkgRejR6dEB+OasG0BwOKEbMr4fVvw+gnsbMCsq4AJ5+XqpspUntQILHBS1moexbVfVM5nZLUJNWYH241ZB2aZdx0HHruxc/m9quF4wLD2v+hHkw8mbS+zT0gRx1+aGUVnXNm4ex2FTOKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=BklnvDSMmtFPisRH8EjB2cYBunBj6nH+mpqckrPWoZ53P99C96VM5VuJAKnmTm7JRFe3gHMuao+CJyxMbRLyM6NzK+MU6/Xf+hOGdOlP1Jdeuq1HtL4DVQctsYGfNiJ3FVliaQ6NtyJS+O/suIpIDw8yJfkECoawel+DNBe6crbrB7liBGkxEuMT8CFVHYb+2Px9uVIHn3GOyWv0O0cW5ItbPvjupV41lGN9AAzzkgmX5oYn5TGX5Req7OMczAGqmkyy2NipgKEjJmvPjwCJ+QHZN77SQxL0w5AK91a8NIQJxU7a52GFObWA3IWn1saj8S2IJv9DjynL07UwKoU8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=JO8jmKQvn9KWvaWH4CUlp1VewrU7EzeLPmLqEU1OimRHJesd6T+42+Xo4S/U+jo8hHTZvZ0HrOsNYJZKgr4ufD3Xy4HT1tAt33YApj3alK5YGov12eobu9lyxhaqnY5F3iX3pqD1eE8tFkM/oU04Cqk/oXfVzR44AnimelWPycs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BN6PR10MB1571.namprd10.prod.outlook.com (2603:10b6:404:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:48 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:48 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 02/10] ACPI ERST: specification for ERST support
Date: Wed, 26 Jan 2022 11:28:26 -0500
Message-Id: <1643214514-2839-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b767afe7-d1f7-451e-8fc9-08d9e0e8ee5b
X-MS-TrafficTypeDiagnostic: BN6PR10MB1571:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB157167A54165B28F2F1FB62597209@BN6PR10MB1571.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBAFuHyX6t0eQN9h6vJfUBqnWevsrj8Gqyqdqn9yM6JZP7Vohu1F97bb+gBJWSe0s8Iu6vikwUR55PuAauwR84a8caUk4C7JeYI7XPXpPq44WYSmau3UX5t852VnWdNtjor7LldamlJtzxq7RGnLefagws2PqAHIyv/Ju0Kmd3vQFR44XbfvZhIsAYEw9TzkN4foIJlRPOrirAVhNSSF6C2QGzZNUKzQygIt0XP5tC+yg2KJK4yKGVnNgtBa0Il1C1JCsQR/L2Gh/9QP8+bNntXpA9tfKDOkONay+NzV6xnGYp19flTxJJRyKZDnrjjN82iRQfx35U1TRdCjHQe6KmKXgZq5WOcmPgU9jz6aSsLjuZP3DpqllleNRCQ4GiwrsyCnyyWojUWLXxmEM5hiVdaI/H755zZ57ps4OJ167Z7u7u1OmRyfRmsUuToXD+yeiAsPyBLiQ1hUurcOjG9vkUjcjnbOejfZ1Feznr75epAO7k964VeklqDC+RXrh6FBYRB5MMS17rsuIOck9UjcNts9DYpHnGoxXlM6r8aDvBx3I/XIyaVdhO5j3tOoKcCkomnhCWP7FW8OsDfsPp1b9K5dAcZZJ6xrtigKSsOn/Yc8z1wLz8tcNmEze0hXufnV+Ld353sS0slwRmmQlTeoecMHuT/8/0nGVhK6dGDRo+LVxtSjRnKWcsRtAIt/S09Ta0ZSDdgSAwPsRTx0qOoLbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(66946007)(2616005)(6486002)(36756003)(2906002)(52116002)(6506007)(45080400002)(508600001)(5660300002)(6666004)(66556008)(4326008)(8676002)(8936002)(6916009)(26005)(107886003)(316002)(66476007)(83380400001)(186003)(38100700002)(38350700002)(86362001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T/6EAqoLe1Wd50jD2IdfjBtQoqxrUvoT4EdW0gKBmW1ET/v5KeDlJ7mRiNCS?=
 =?us-ascii?Q?NLe2vYQQwBM9zjk5swc6x68qM/Aaim1n7fF9VEFHTlYpfnI2Z2CVjVCTqJlB?=
 =?us-ascii?Q?FvVUkAcvrMHCy0Ih65on2f9/CpQtHGIWXHPAo3aY/VAjXdN2aUxouAQgNs7X?=
 =?us-ascii?Q?osqkKCRVFiPMsN2XATmVBHPo0C5BnAgUW8MoH7yDx7WPQlQSJt0MRca8YFlx?=
 =?us-ascii?Q?gv3iy5IKrpOg7NtJX1YMgRia+xNH2+Y8inEFDU4baODhgAG39xAx1QL3rJOu?=
 =?us-ascii?Q?zxssJpb/cIlgRZpXNyt2TygYcc0sIBdOX40iDh8/aUv1FgoOOOrHygsTgAE2?=
 =?us-ascii?Q?mgKCvnHgD3V3zUbCep7ul5vJWQrqs+NCQ2FpZEwCYSJ8Qt25I+xdvOUUYkEB?=
 =?us-ascii?Q?q0rdjZvW+H9uaduhUCO74BZZAp38XH+9jThL7O9ipbQNy6RdQb2Qil8sT/wr?=
 =?us-ascii?Q?VR/jQg3245ACbUNsmt9v2K420gZuMDUA2LuaVG9EDc+K4YWDU/5gBAKOdDMw?=
 =?us-ascii?Q?u1VX/FdXJCsBs3ho4WTk9JVD19ecNOxG1VxaHFudqiyBtqyQ4OmFmStAcGp0?=
 =?us-ascii?Q?nkzq4PGe+2BoHAkGKh4QjDdjFN0L/bg1savlHpwpGff0+gFhscpA97Yv6NNl?=
 =?us-ascii?Q?NjKLxPwDMYp36hAWUJ4zOruU4NcqCqJ/WpBf/Au0Rt0F/72IIJjt4R5PUgkv?=
 =?us-ascii?Q?OuXUi3bBJYXZqOd2EU0XxJF+hh/R+BLJxMenE00DBL/q3v3JhykfkRryw9YD?=
 =?us-ascii?Q?nHrrDnG4TEHQKL8zcqaaU4nGIqfcsnvb00vzDuFJtzFg7yDPssIAY+8PvBue?=
 =?us-ascii?Q?ASV0k+MzZ4VCfhScLucSH0B3rAcLY7aKBQTUw81uZmORSQKBTE5E2GwkOkqo?=
 =?us-ascii?Q?EKFvr7Y1fELBfs8PFITAin5EtfBbuJpjcWhiClGHMk23qZoJzZiuLxUOb/hk?=
 =?us-ascii?Q?QSOjZ0zJOmXIphXUBWSQOTDPwtmSqorRhe7K8ySj02xBw8jHstZM32wLR+cl?=
 =?us-ascii?Q?IEwASlM7HE7ekn/OOKgP+kjv2FI9T7iOxU03JBr15PBf9uobxuxSjmIwilbE?=
 =?us-ascii?Q?2c+10sGDZEKkK7FcVjzo2KQ2cZ1rHkafoIMS/slytFy50UsR+R6ZwaqUKX4g?=
 =?us-ascii?Q?+Oh0KOSLdEhcVDirFSlGrWPzbWhpYKOh32o15MmSdP6aUkzEJj2KbucYBSdW?=
 =?us-ascii?Q?OcQgHHaDl2PzB1b7JRcF1QjxaqQtDxAYHbOsc4bcC7gnNLaz3kEoKVirSUaN?=
 =?us-ascii?Q?qOYx34aU3Z20ZQnavK/+2NiRRuhxt46VYNcfrp+7HP8jI9KsuT5mBPBf29d+?=
 =?us-ascii?Q?EQ4YNoAQ+o4THyBjmYXHeZG9+E3/UTCYufzU08QSf9rIzZucasCU8/ze5Xk0?=
 =?us-ascii?Q?YPtSev1qVcRBly9N4Qe9dWIolKrsxrxqQcnneUr5SplRLxbFm5ON7nW3MABo?=
 =?us-ascii?Q?KA6N+782lSuAgKhAubdMtKKalDMQaUEAyhnX8eVep+KRKWTPOePSB8dyNo9l?=
 =?us-ascii?Q?6bD34YpyuMCGqVbB1605BQL2p6c3rmOGXCpFcCJZ1GCQKeceeGpcSPHECph4?=
 =?us-ascii?Q?vgOVeQc1BHoq+oVKAe1FN0mmwARJiv7/hfCEzAIQNHFEOAn6UyW/L1ALAy64?=
 =?us-ascii?Q?J2buKaRca67pKQdh2EMACIMXxsc8udgpvVpxo1Q5orc4gYK6ta3/1SYiA0KL?=
 =?us-ascii?Q?lJE+eg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b767afe7-d1f7-451e-8fc9-08d9e0e8ee5b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:48.7210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 331/tnzqseRxRoSkAzfBVXdIdZjlJczxY54a6sLy65Iz+pgjTq+VEAjf525+0Dz7k/O2t0sclaBMVbExBzHgZLoI0AmR4k/BxvhFs3yK4zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1571
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=363
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260102
X-Proofpoint-GUID: gChkKXEV9kQJG77s1WBRDx90izFqhYKD
X-Proofpoint-ORIG-GUID: gChkKXEV9kQJG77s1WBRDx90izFqhYKD
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


