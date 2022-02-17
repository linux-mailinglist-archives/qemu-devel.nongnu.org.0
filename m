Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625E4B9AB5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:15:13 +0100 (CET)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbwU-0006Tm-8u
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:15:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXr-0003o2-Vr
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXn-0004SD-OV
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4RB16010826; 
 Thu, 17 Feb 2022 07:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=jOT7JJjri4FHQW3sGPwSTX3h3CnfOVvFwSWkWE05Q4w=;
 b=VCKr8oybAHXrSHbM1USZme4FhbPdxIo/Y5uqfOi/PDOnUF+9b3ryzuvDFYP/RUfav1YH
 rBmtCBqh7t8giqCWEfv+rYdZ7fBn3Asa3f+wNlCO2Mzyrl/djg2YoejOcX80FeTG1/1z
 Z33fKBO3agjfq8iUJk4MtVOS4Psd9QpSckYxutsPT7RvnOD7PBPiR3ewCkIYn8JVTCJF
 iULxXhsElMyZvH4Un1hP6XFsXzifeBskIdW93Bt1dcaq7YBZWTvtP0sO8LxJVsi4Pv4S
 wkU4Bz4yc+Rg8AT2opd0ZP+qjLeuWzv/lz6DFilY5UP54fcuint5cexDDbZ/UtI2jUmS oQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmt34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gCOv030200;
 Thu, 17 Feb 2022 07:49:36 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by aserp3020.oracle.com with ESMTP id 3e8nvtf6bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7s9XFjstnx3Sfu2Mcw6seFGvQXjRzuhNyNC0hMB4GpCIYK6vWLuudJfmAiT2YVct1l6YDA0qFEKa/ZVrikUS4HRHptKNNPnU6Fii84U+JAMv5jGBGA3Ef7TY/udsOBxNJDvT3covNObCPxEtQe7DynbWiwlYV73XV8lp31zv9ijS7BvCCDWv7jpmmznsgRkReEhWnfznvEOmcM+fNwfcUy6I2BfUQAhhlqM04OqsKljScZ1ixXW+cBbqzOg5sPSEbheOczkXqzaA38GH06x0XNUldSGI32yjMJ2rvFUQru9VqVLNFiZpmdnjT5mm8cwkcXW/4dNi5uDh0vp71KSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOT7JJjri4FHQW3sGPwSTX3h3CnfOVvFwSWkWE05Q4w=;
 b=lqliUS5EKWGXLz0dZbX+Qtcosv1D1UO2LZ7Y/E0vaXWYHNka4GmYsUm0pTv51bGMelFgm3Hfm+8/4Felye8Tck9dM2xpSNmS3CANCciGYrwbxngetuzHXgAr3HG9lG5RFd/0m8GsE+Khrdtq6f82kUYv7+lwQ5B/Nv/AlizB2Va2+hX2LjKgU4lgqFJvQe6YMB5OC2i8tgLHxW5b+3MqpHmTfOTK589uSsUFm9t0kNxE8OO0cChjrHF2vjSL/K+KIoHXfaV3xahzmQ5j8vTcGXlrqePOk2spOhmR+jna3brgJtMPSehIu45W8LmMupTQBs8Jkg8qYdVcLXppsc/zgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOT7JJjri4FHQW3sGPwSTX3h3CnfOVvFwSWkWE05Q4w=;
 b=HWujNLxgy2JRBqd4Ezba4ly0arh7cN6/o9mJKXSPyNri9vPlciyL6jKjeG8vxYC+QNbVrEd+lRDdzC+2vbYzTXKPp0ddIqM1n9LSNJizEPgMzQDgoXb9OTgwq4uooQ2dUqnlS93w/0nHkI7WLiPHi9Zq37kCdlrgO6QhxbCMCUE=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:34 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:34 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/19] vfio-user: run vfio-user context
Date: Thu, 17 Feb 2022 02:48:57 -0500
Message-Id: <1735f90d6a5784a93cad5e46ebc6bb1a40ba1f5f.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d389e9ab-7d97-4feb-eb1f-08d9f1ea09c2
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32112323DF5C1A822662CD6090369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3f46QYOgSOR96dy/QksB4nYs9hEW7znvzgd8NxiLbRKjhX89hg1R1ZM6lbHWD3dNP8SvDqM6EXs8yqiB7IagUNTmCk0GVzE/EAuEC3iDhyJktNnWvBodtpxLQ0EQs2QYmjhf1XWVmEhKSwz17pfo0sf4QMYeXjJB2Ezyo4XYy65+2TA72ptVujAWf88N08dLa12kgvoZAD83tNgF11YaanUEAOURZtsWl24Fu+76paazQQipWK6/OxRVfGmUbVRmuE0Qk2kJJYOkMk8Ilsq4YlN8rwm5o8IWy62Kej+AI47MAiXr9Uy227/a0LByS8rn3/yNPwDyoa+8N4ayhCZ3/Gi/rtLKKFT9a2Vhs8Rs5n4MENAgBKSunZcvC07XB4Rkd74eeRWr9cCkwvmk43CW2f83mec1E64kfUtPlGB1yHX6UPpwxhPWcN/YNCMn/mja5mSaIkgv/vSVepM6R57xT/AG0YwSYuNhXrm7OjMd6FzTzm3RuzkM0IPiPnwZ37AK0UtqjFrm+kmvTMxmUJiDLFx4mmnisvOAwHKBcm35shsLVzGOh/QoOTlwt5NYT2txuE85zTfkn2uxmnXn61UTQFIHprhYDq206PplLxJAe768zhDPNQaoDh0u8wYHxjWBip2T9aLR36eT7hS09iP9AlACGx+LeydVL3zDdtLXDDI27khmh19V3MncdpQV7Iw3rphrBmx0L9S2O9wQoI6B1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGcXJiGTaq6Gsc5iGYGdFhiBuUN5b402E/NHQHWDNiH+KH0Fv+yJY9MVL+rh?=
 =?us-ascii?Q?NWz6HpCUaEHibg+9QQ87yeeYecYPOGivsglpgyEGXbAH8nt57y+4qvFLvklJ?=
 =?us-ascii?Q?1gjhvVaqfBuNi/oWlzufIbtvOpDUbC+ydBVRnWaqxYkgIjR4rip3bIIQpwno?=
 =?us-ascii?Q?WWw3WLDtZYdAtM7YgYzFezuPpyjeA8WA4J5Jtt4+QwTFCtYug4WJBy2sXs8A?=
 =?us-ascii?Q?km29b6uW6IdiHEcbXVaeGIe0qn4DRVjMTuhPg6A7fWFY7OhNmUr8NgIwwk6L?=
 =?us-ascii?Q?Q9LKYhsqGsbiYDgq6Y7qk8WIo+93UAg+K5Wu8YRmv1gHFUDY8j1pnlXxccp1?=
 =?us-ascii?Q?5usPnUds//jvX+vOuBQ1v9Hm4VIu4tqwmZNipUPAbe3tt4d91QcZ/2dhDZZ4?=
 =?us-ascii?Q?Ff18A8cFJ2ltZreUGBL3NTK6/vifFyt1j9xfO0wwisLHghMQSOEhR+WMxhr7?=
 =?us-ascii?Q?m5Bs7s18+OOXfJag4cvax31wIxb1LbfSSEHsSaxFB0PLtRO5VmB8ss9oJJxs?=
 =?us-ascii?Q?gS4Oqs3xCxhT3FbSBD43c8/kQMYbaJrpeBXRWMdIKezrnPIJ8pL0pifPFDjC?=
 =?us-ascii?Q?d0FiXN8ocvBLxBBxsP763rXPNxcz4a8X8DwiFy01ySHsQ/6r4xPSMdBYNvhJ?=
 =?us-ascii?Q?FdpZK8ZEI+MOkrr0HJTn3rcs9wqqQZolZgTRiZVBXvkgc2toc3HaeoeSYhRa?=
 =?us-ascii?Q?eePJU0PBi8wLmspUE8vVWdJzzZ1M3y2EcJjbLoav6/dRTtzUpLX0H73yfSxD?=
 =?us-ascii?Q?xz3isFElvMbIg/02ptnHQ+ewwNfMSwOLNIamZD82uVH806alEzABTfAZ15e/?=
 =?us-ascii?Q?t4IGmtYg2hNSjgvMPz8CbMZnFXsPsO7a7W+MmSs2rCATQn0qvcucDU8arqIz?=
 =?us-ascii?Q?upadUyGwyYLUoTHdWkytLUzzMKtesZ9yrUPT4km7Mq65kTRFN4wuRL51dC3h?=
 =?us-ascii?Q?xzCvs6khFMH78BGLzMDGwr1yEWg6SRk5Qdac4vKrIWMWiHePx3zmHBCu9hNw?=
 =?us-ascii?Q?g6YNxk5ufMxP1OY12zUa4m1bMpd3uAyg4Y5VSn3KWxEus3rCSTxN+bzycVdk?=
 =?us-ascii?Q?8YZu5XK7vVDbeCa7oWiopSVLPZQA9Uzkrcw1piBd24boylgtWU+CqIm7F8BV?=
 =?us-ascii?Q?yDub5kHXKTipExzqg7LEgt+Kb7AQ8UjlS1g2zeiJ1z2J0teQdGLD05Wm7FCg?=
 =?us-ascii?Q?Pf8GeIYvrSwaOEtbmESxcqKFxwcPDnybBeKBzFk3WWWLSslTvJy7WDYHFwQm?=
 =?us-ascii?Q?5RB90auUiBFvz55AX3Qi3Iai9ebwXZeOLVZ3bC0phYta3m2VW7wIoCWTxkwb?=
 =?us-ascii?Q?soe5P4VwOtteM3H+1TuMEOQOj7GRr8HC2WTKMnudQzwAAjWvCmXBSD5KWkKx?=
 =?us-ascii?Q?5tfifDNg0DevsFgjSO4TQJhucTNNNkMLy82PIEVLyTflb7O+9XjrqIdFHPOX?=
 =?us-ascii?Q?TjqZkOLrXNxhxUrAcmQBOsopaCxRZfXI9aLn85N959q7O2tv6anTsL6Mwbst?=
 =?us-ascii?Q?NQUa5ThJc2EfUsAK9lDKZnPjN8zk6LfBe1aXhWKr6z7wIt5zovLnbqyAHv5B?=
 =?us-ascii?Q?nCjw2Z2Wf7PzhfchdVkBjy1FhKMly7LKSJSuFdwws6mRnWplmRvEd3opum+p?=
 =?us-ascii?Q?WiBmUzMfofMSZNOrHMD92C4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d389e9ab-7d97-4feb-eb1f-08d9f1ea09c2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:33.9139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSaM+c7j6+HtEUHEPiakoMNeER9uwfuWcXeyl+bbS8blq+EYsTZ9T94l7GBUT4+DSohKfmoAiwsX+k8mGXLHZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: pNEOXWsSu-9iwNUhKvqaZRk8SDTUz3rA
X-Proofpoint-GUID: pNEOXWsSu-9iwNUhKvqaZRk8SDTUz3rA
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/misc.json            | 23 ++++++++++
 hw/remote/vfio-user-obj.c | 96 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index e8054f415b..9d7f12ab04 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,26 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @VFU_CLIENT_HANGUP:
+#
+# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+# communication channel
+#
+# @id: ID of the TYPE_VFIO_USER_SERVER object
+#
+# @device: ID of attached PCI device
+#
+# Since: 6.3
+#
+# Example:
+#
+# <- { "event": "VFU_CLIENT_HANGUP",
+#      "data": { "id": "vfu1",
+#                "device": "lsi1" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'VFU_CLIENT_HANGUP',
+  'data': { 'id': 'str', 'device': 'str' } }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 9c76913545..384ec4612d 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,6 +27,9 @@
  *
  * device - id of a device on the server, a required option. PCI devices
  *          alone are supported presently.
+ *
+ * notes - x-vfio-user-server could block IO and monitor during the
+ *         initialization phase.
  */
 
 #include "qemu/osdep.h"
@@ -41,11 +44,14 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "qemu/timer.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -95,6 +101,8 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     Error *unplug_blocker;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -146,6 +154,69 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    const char *id = NULL;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                id = object_get_canonical_path_component(OBJECT(o));
+                qapi_event_send_vfu_client_hangup(id, o->device);
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                break;
+            } else {
+                VFU_OBJECT_ERROR(o, "vfu: Failed to run device %s - %s",
+                                 o->device, strerror(errno));
+                break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    GPollFD pfds[1];
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+
+    pfds[0].fd = o->vfu_poll_fd;
+    pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        /**
+         * vfu_object_attach_ctx can block QEMU's main loop
+         * during attach - the monitor and other IO
+         * could be unresponsive during this time.
+         */
+        (void)qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
+        goto retry_attach;
+    } else if (ret < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to attach device %s to context - %s",
+                         o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -184,7 +255,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -221,6 +293,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(errp, "vfu: Failed to get poll fd %s", o->device);
+        goto fail;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
+
     return;
 
 fail:
@@ -251,6 +338,8 @@ static void vfu_object_init(Object *obj)
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
         return;
     }
+
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -264,6 +353,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_poll_fd != -1) {
+        qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+        o->vfu_poll_fd = -1;
+    }
+
     if (o->vfu_ctx) {
         vfu_destroy_ctx(o->vfu_ctx);
     }
-- 
2.20.1


