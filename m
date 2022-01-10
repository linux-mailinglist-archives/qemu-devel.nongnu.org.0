Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC948A31A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:44:49 +0100 (CET)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73PE-0006tJ-5B
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:44:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N4-0004Sa-VS
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73Mx-0001pL-QQ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:34 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJm3Rv026277; 
 Mon, 10 Jan 2022 22:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=MlWgGjUkGb1O8eD+fA0YPhEcG/wPilzl8AIn+7rHaHEBaMoEkIDTK9T62Oe249Pw+AIU
 CkVZa15dp0KwycmpwU2kDAhz/8VDg4XOLOskK+IMwfZn8maxSB1amoxe3Q0xTjwIyJLM
 stZVphAiXlIc1YnnYBzfHSTWCAb6pMMPA8bVLHVKYetGwARtgt5RPocl42Q5QtGsRKXW
 1Zm5KHaszi5H+0ofmLHHDQg/inB0Ty7Rosx6cJTD8NfstUo618vC6Sjitqgn6jNKmuhP
 wTwvGgD+mpBS6eG2tHkv1oXDhlGNNxNX9QxJTaElWv3vu6ioDENuqn/XIzs9aSIK0+FC BQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgp7nhcjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMaP0J117152;
 Mon, 10 Jan 2022 22:42:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3030.oracle.com with ESMTP id 3df0nd6pc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge43zRwOrJ2YbXuncP8rhD0YNNCbSVjPwalyDW7ot0nLeOZ+km0t/7GFn6AnjES+0spcSwpj6CslbbPkhk7rmbittpwz9wCjetMNRPyexMUGFf4qv4kaT6xjmyJ8Lw7ZAdgtkYONo0rpfZl0SBSdXlK8HIWEY+2lW8h6G3uqENDTExuRdZKCddFPrHf9wna9EHr7kyfUFfRhRxRkutVFhPcxVn4zZWilkqR1gVYngkBRbAPrV/b6EGKyWVxpkJioDhHflswPEJ+vJ6kZqXHotZOVlvB0qE8YRYFeV3RQHN00XT/7NcNnoQziHYHAgqtz+DS8+fZXJB0NOTpe6zM09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=ZTE16ZDqwScGjJ/UfLX04/wxzi4c5qmpAEaoPuICsQ1Awwg3v3O40KcG37zR7CNMMDnKd3ySJ3KGbqIiF95aie6A967PiJr8axfOQ4IpQ2I4zzg3ROnjz5FIHSZzP6u1lM20KMFejmqldgBhq1lH5N17aK6mdRUMJsPBFf3VmjgPEL0GoU+FtrdAxACYU+EZ6trCDGMcNzuoD3KnevGC00lOLnBrCY02RO5MAbA0sNBrzo5HEFlB8T6ENnqzldBQUgbuoRN34CbvXRBkoeeAwtfPJEzE3U95PN4u19aHom1h77FOFfhaLYT//k7fgIPoGb/njsTr1cuT/yrDSP6fJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svbr/JUHR+V6nUWPsWs23gY2WC2ULNMpPwKBALdQLwI=;
 b=leiZhWiR9Ej7BdxN8ANcQH04A9JvJsJyzUyqs5tiaQMs1c2y6uJ7Khed/4Rxjl+alhixD/1rUWp7BDEDdWsmP6TiFyLPA4/9QlmOwKPozW7mIHeP5uED1E77chmrWrjP31J70538rjErg2SJfonfvX4UH8IZBPnCZTRFEX2eN5o=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1598.namprd10.prod.outlook.com (2603:10b6:300:2a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:21 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:21 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 2/9] ACPI ERST: specification for ERST support
Date: Mon, 10 Jan 2022 17:41:57 -0500
Message-Id: <1641854524-11009-3-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd0c1044-90c4-4f4a-42a6-08d9d48a7686
X-MS-TrafficTypeDiagnostic: MWHPR10MB1598:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB15988DF5C935C1DBAF24879E97509@MWHPR10MB1598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SclW9Q5xyp8BoJrwsnRNU6WD5EyKPYIlqsCMfecsbaFlHGWtXzfnekYFnz57V3Yj2baUe9jAPLShPoCN2o8GNf0jgPgTMJSGHPaVS7h16WWe09tlnzjv9q8KkeNteEHRdUoN8vBhjSNHBsHkyAYxGsg2H9DiTU66RqGDh15/gYsO4HaSfYamNrgdriSWYAQ9cF6YlUIGFoP+9b86GxUpQmOxQNzpajAfhN/kqYz85+EQ/8Cz8b5AY7pdrjwV5h/Qsct3OejyqzsvqpKdqRynj5ThJHq/nwWsERvU6iBPsQVmivR3iWTb/HvJKx2QbvQd6iVqqsdWquDOdLJdPMMYDCmqEyDxm/q6jHsbWsH0WAD09NV2KHljVbzml/oU87r0JFecbYKECNOwKyRVCID9FdUL6pV4DvPb/T5+/NpC9aHGUIDcHaMwX4XOyd0UzixNQCNp7NQxpkRUZ8qlCK242wwmIyqj7ISgAw+klt3oYMVFLCQC0oMGoTmjdPBfcoeS/YkDj/gZXkE8qc0l64KOdFVNrj4ZYXQnuxJ/FZ9t7gNSTb9K4NfilBSEqosVuqtgHTDDRsm5ZKFezzVrSd/ailB0dr33T8VQkYiBTlm/ZmIDQdTgMH+JPjaOLbs9Arp4yg2F3hY2P2FMPjOIo1XQGqf079vkEptZB2pfBPAVyDGxUdRo+bheraPkWZ9aaXb4AZ1c7WoDb0uDvMYZywHdjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(66476007)(45080400002)(6916009)(6666004)(66556008)(6486002)(66946007)(52116002)(38100700002)(2906002)(6506007)(186003)(8936002)(316002)(6512007)(508600001)(4326008)(2616005)(83380400001)(36756003)(86362001)(107886003)(5660300002)(26005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lfb5wE6c/lHMsWNuR3UBjRTNtD08RssNZ7oU5zcKdPs/JFid/WLWQAQI2Jp9?=
 =?us-ascii?Q?woCgUnjOd4bAcLW5HfqJzhCnPuk/eflNTNN0/AxxAcdUcvC4eN9ehntLqfh1?=
 =?us-ascii?Q?Cxtk8OrRymKAnA1fHNPe5x3YVTlw+NXBTMXNflfPW5nzi3wXjgY+DTvgzGqZ?=
 =?us-ascii?Q?VVwJ0o0mq2rYiOrfYRaKUcyeSIhMqKYNXuHcPILA/tNI9xz4nZVoQilrwQzq?=
 =?us-ascii?Q?722Fosu8mf5BhtJLV+m7WFQtVtVhUXwuqWU7by+DX4jEw2IiSN+RYEyC6pyZ?=
 =?us-ascii?Q?HioDRgRkxW1R3i9D3Wk6RauJLU/SOZ7USfVpqpKbx00LKkZHuIQL1Y5etAxX?=
 =?us-ascii?Q?1kykn5Lb3qidMqFsH+9af6S+By0Sub5bYWqOhN+izUe98hTAdrXr2isaZV7+?=
 =?us-ascii?Q?taIYzUV+rH+24ECTmrreBzuBCrEsvVPM5I9OcV1vcj0xV35YzRjLWFJC1a3+?=
 =?us-ascii?Q?GsE+Y0UQM9sg7uoHNkmuQ3M8Mq64nCgyGlxA6yrnEqMHXpABppSvNSTcGJQD?=
 =?us-ascii?Q?cCpoSKsZhXIHj2krsIQJTjmNhAa4rxQuZE4cq3sDOYCU+Xu/9W5I+JRZrViP?=
 =?us-ascii?Q?Ik3QKsJXTMnAXhDXRLPE2NfxmA9hGGgx+q0/ul5ojl4JwmTlhQ8RbZ72Z+4u?=
 =?us-ascii?Q?T6IdJz1Dz+Y2vtJ5MmROfjrZMGciMavXvtBi4C/OcsQv7aHVmMrv7oB4rjfp?=
 =?us-ascii?Q?KFtbqEg9v93h3d8k/Tioyw4f+rMN+LJVQp4IFW0NIyxDsfuVO7os9QCAvwbh?=
 =?us-ascii?Q?Sr2z2s5fV74QajqFCAMcFqrqgnaHNEIa6+7y+g41FXY+Qs+s0QwsMNglI72c?=
 =?us-ascii?Q?xBiSs5Bx3kyciFMZx4Mefn9RsrjJWmaSOnXow9A979MdM066BzULwXZAndeA?=
 =?us-ascii?Q?/kV37JhukaVrFrQeIp5rr+P+QyUFfkxs0ob3xxkMxUgUAFu2J/6mKq7s0KYA?=
 =?us-ascii?Q?+KSi2700L6YD+MayUJKLF7yISlxAkssBkTeZTwRSVNxG1GVRR867gI/stlsb?=
 =?us-ascii?Q?tsZ5SnZ0OMtYxJFXRVoWK96kKCbp8RqPsFFh/Yek1AXn0ZbWtiKEFY598La5?=
 =?us-ascii?Q?wTcnYh2ShtQtxwzePKTxssXiwWJMcSe9KS5eIob+KqOzoRUAdQrG8HpedNbe?=
 =?us-ascii?Q?IQfQUKeerB/S73FonTQ8uqTCTzookpyt1NkCWNegqJo1shCJVUm2hkUVjOnC?=
 =?us-ascii?Q?oZaeOWkxhQcvi96OaDasUaT41IvxBHmyBbJSy+QKZRSiZ0VEMnLoH9aEN3bs?=
 =?us-ascii?Q?ngq0U17lLjGag/bF9Qe6OC6yR7iI99Jcg5d344I71jXa7x8K+yWJEq62z9/E?=
 =?us-ascii?Q?JLlEqZmnUBSknEwmUk4fRqURyCthQbR0sSKwxWlLkErzNO5Waloqo7WDfudX?=
 =?us-ascii?Q?Xf/AW9xTLptY3MEpc/T8mndfaBw/rIEwp0KLHlELyOOJ7YW46fOMpg3ejoTq?=
 =?us-ascii?Q?fks6RgrgJGQ1A4crGBUDLDWo16Y0Mh0AzpoWjrM+SsbeBuCjC5shhEa7H9zX?=
 =?us-ascii?Q?DsVWyOPr4Y7FHLv6ow8SmdvdlVWifxkSwMi1JotaxFwofHLW3T0EuuNKqdSv?=
 =?us-ascii?Q?9r6AYap1j9bEkkR8689IJVtzJVoZk+sSg0DmVqVMcBw3EBx47K3OeD6cLh7q?=
 =?us-ascii?Q?6GaKW37Ihi1a9NCUe2nE83il1uQmv7/l7oX4KIJ/Mitn/tj6qx9bsfsoXjqf?=
 =?us-ascii?Q?sYdDvA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0c1044-90c4-4f4a-42a6-08d9d48a7686
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:21.0752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YBk9+BJk7Sxk9wvPCHqGgv1wVhucjacaBhnVmkIxe8qTkoKBaCZFkkiQoWjWrRMS1QrCaDfs0Bbl7rmBm7uRaU+rHLE/JTdeysVtRYnIp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1598
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=501
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: l59AI-2sEl2nGG5A2yBHQbG2YNf1nnEr
X-Proofpoint-ORIG-GUID: l59AI-2sEl2nGG5A2yBHQbG2YNf1nnEr
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


