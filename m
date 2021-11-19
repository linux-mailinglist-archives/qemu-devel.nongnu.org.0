Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360F457761
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:56:13 +0100 (CET)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo9zY-0000Av-8t
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mo9ve-0005ST-T7
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:52:10 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mo9vc-0001ML-51
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:52:10 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJIUKR4031872; 
 Fri, 19 Nov 2021 19:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=5L9YWuvbQhRg9wrEJe2ycsZyG8p1IOC1GYIOrKrD0m0=;
 b=Je58p+USMzfSpUhl7E3FQJCySELZc8dZXOZivCJyKTntkdvkRgjY95b+InNyMAvSpQwe
 jTNtS3hkjn/kZUlfKne9Am3bYrtKLsJ/UXKsKQgDnI/wSgvd1A+aOy2lV8Vs9lSGThOK
 RHXHafkuyKTCa513C6htKGcan+X6aqqYizLV044Y5FDm05QNHet9xD8cNXPLB5qDMpaq
 HoFvLlnvjpEg6Tw8vf0axbMz9jLGSl6Dm2vC+TgxWYwCTSlfnBpBMyc0qJLhZ3SRZf4u
 GBnafVeONyAQEFKZSUZwYBiY7qHTVth6CpTTFtoA71B4TjQO1wAIovOlUDG15PSSu0jA bg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd4r007t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJJkagU092459;
 Fri, 19 Nov 2021 19:52:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3030.oracle.com with ESMTP id 3ccccty7q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMxSYQNRWhdQwnaPTKhXZn4JiAH6EiayF0cLdp5E3YhEdomvOGCITFe2YFbAGtnaEXbvzp9GMrM/Ec3GCK9D1Yx2z0AbpQL72F0iebesgoQkjp4xbv0SLtGJQLFW8WzX4QydUbEmKTY5t/+bfsxfEIQ7rKYZkBJbFyord0u6ManYCpi9XO78x0OLSom7j82m6iXXaNzH21uGzJ290dVnmIOWUdmrAy3myCtI0yiBnp4E4FTQpHTf/DPslqO6PFo3Z0G1xyQu8uslcG45aF1ZGWeKI2eS3QDBn5vQMWec+N/226/4Onk5WyfIODnwkls31l1ILOpGN/m3rhEI72YZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L9YWuvbQhRg9wrEJe2ycsZyG8p1IOC1GYIOrKrD0m0=;
 b=MgpKwdhXEoXkAKiRDLztnWcZIoScCNJoeLdPKW1DWsPy8M5N8GwdyTd4nXuq1iwgighJE122bJdB+O8S8yTPlOzTi9vgOC/gmenOtpAJTaVR+niIu4qnfvwaBsTYmP2gddlNllon0gHGhjIkT32byO7aXCe/uejWrdyPfr8jptjohcCSQnYIuYdBURY5GINqrxUl601PdEs41JF175YsZ7dJm4EFMeYi/R1YnreaXcvQvHe+Tosn3lBenTcamjngzmW7Q30nAZ2cPIlD+oRGz0v6cRdDnhj1LxxKoz+gbbH0lMZPFz5qe1d1hOPv8h9AW/MjRf5j6nz2QdrSN1W01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5L9YWuvbQhRg9wrEJe2ycsZyG8p1IOC1GYIOrKrD0m0=;
 b=OQMxwVliLT8GYcFsiDp/03Ix288SAjc0YGpVEhGrNdYe2+vtdhpwRHJnMQ4qkfqh78uQn3nNUo2igDzUB8t1FSPUiVKhyOfo8to7Lz21BFvIfR4oAn/j3TpOQiOoUCCiqKyrmszSbJevjO/PwW40VGW8mgeYVEl0uXxZZO14Kow=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SA2PR10MB4603.namprd10.prod.outlook.com (2603:10b6:806:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Fri, 19 Nov
 2021 19:52:02 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6%7]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 19:52:02 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hmp: Support for querying stats
Date: Fri, 19 Nov 2021 13:51:52 -0600
Message-Id: <20211119195153.11815-3-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211119195153.11815-1-mark.kanda@oracle.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
Received: from linux-1.us.oracle.com (137.254.7.175) by
 SJ0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:a03:39f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Fri, 19 Nov 2021 19:52:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccb83386-3bc2-41c6-e05a-08d9ab960e4d
X-MS-TrafficTypeDiagnostic: SA2PR10MB4603:
X-Microsoft-Antispam-PRVS: <SA2PR10MB4603D88BE75E4A3F4B397CFDF99C9@SA2PR10MB4603.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:166;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5WL8DwfayVqbNdokDZ65MPXrx0O2Fgw5dHzsPvJONrldG9k2wbmIG5ZUmhCGgdJy6prls1pD7Q/Z2ncf2EXcrJEw+K9mhc1DdFvzDOkRpC4SixEAN94gRWSFUhLFCGfj9gChIzTSc3ft5pDab3xWOx6qPuHN4QMFYFRcQ3gE5b6/Jle5ZQSIOTiZHClxjBHgqGLU++H170L6QqzNgZNGU7G6lhZS0YayW5cW0mnFQRcNo3o4jvB7BjwXi/j61yx2wMKyM7yQcoep3gAbC2/WDoXCpV4JwGmhj16SbBe8JWB+6jBE2IyhcyFp6eAXXG0LWyt0msXbrephMfOJiMJwPFAg3weaFmmRx0C6Mk9P58b2aVsvLrQV8pG2NEe1mzGO3frQcpPiqzqrhJx9kyw9mNFdflkBChVQRv5rHWHMid4WzjJFRGkuuCHTpWzfvpGU5K2mqWTmNkAlsileuvKOqxp4poAIi4ksMkZKP330NANzfuvwv2ZskuHO9rFGZMYGRUE6w++dRAvq7J4g/66Jo3M8VLtePuvOhDEeivRhO/SbG/Yx2w5srzsY/uDSSzmENIWFSjHotz1u7vgnwkpLgNk4VpDw4iz07QlZgiffbe/IIWyb4MIRjQdg+7p/y0rLBcFEQC2UnjiRggx4IVmxlIfTTNqmGK6i7lTcgl2VOnxwPb2eG0Elbc1vDMSlE85DN3xX01LO3xMLu0pKFWRSEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(8936002)(2906002)(508600001)(86362001)(38100700002)(36756003)(316002)(5660300002)(4326008)(1076003)(6666004)(38350700002)(8676002)(26005)(66476007)(7696005)(52116002)(6916009)(44832011)(6486002)(186003)(66946007)(66556008)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gv1Op/guPcqE9GQrGWhGzKSChfMrWsVUAi/QfkcPzyTwc5Xk4UxhK6YYwjBx?=
 =?us-ascii?Q?m4tFopGrhN91SkIiHCQmRoea+A1wi04VDBxS8ToMPURlo1YaJn0NLQqwS6Xq?=
 =?us-ascii?Q?phxxWiiXdtc+cN8G5VzO9m+42juTDJaGGYPe6wTX2pcYvaq28E0+ICwdcSHJ?=
 =?us-ascii?Q?POpyyOSN61eVrz8cVL/YnGlGaE3XAHsjmOIJTnV0KklFMWEOQ5k7ksVf+HZ7?=
 =?us-ascii?Q?X3cN6RHY7m2etFYMpD36eVtSe2A97fZ8ZWduMMRCVddT1oNlnMHAeipMXZ/l?=
 =?us-ascii?Q?2/41Qoa4ZJMe/WI82IU19oBFeuN6ooG0Z8p8Cd4sbJxH1Nla8PDWcM6EJL10?=
 =?us-ascii?Q?P5YchCEHqsT2GrC2UAoNhXNHhLu59woIzDWn1i7gdgo3JVih86T9krb8J7mE?=
 =?us-ascii?Q?HqDaISf35G+ZiVujbya8wqmArS7R03udwf65+yRE42gxnLn9DmOtLyC7EkFj?=
 =?us-ascii?Q?IhvWJRF4QBRQB8t61B9dX1nQCPX6sVdfZ/WSR0vHq39bQUshlitUmfcIMsWm?=
 =?us-ascii?Q?kCWrrSNKvrgLHaee554k3UvIc0ciuClhqyM72HN6vsqdJveYAp8L0012vXwm?=
 =?us-ascii?Q?X4d83MCWKmc4Dw+R6FmWdChEdmA28nKe+10yyWv1ReFdFQNEF6bZeRZdme1Y?=
 =?us-ascii?Q?KxjN+JoFT/NxOxhnXlZ55d9O6U4USWbuHRl2+TcnpyYU5oyLW2Xmk0MIO3vS?=
 =?us-ascii?Q?Flv7x5xry1wn/oXECUoPednbktFKwsFF0OLSPluEkFbOPtk2e7g3RfJnq3c1?=
 =?us-ascii?Q?2Hg9zJJrxYg2LYVkZDXW+9DeRT1HvABsE6smFy42kQdQ8Yp4XI4HgoWMv/jr?=
 =?us-ascii?Q?T1ZqzyOnRG0mMZDCJt380hW+D7F/Ub1HV+BuVVxQUx75CYawb2ZC2opAxlpc?=
 =?us-ascii?Q?5h9bhG3U/ko6g3k5543B7atDEVT2lwS4xGXKA9MlUuJRbd9zXn8BpqtKCT0u?=
 =?us-ascii?Q?kQB+Qemt9jxlG6FHHiZcFB8l3fGiLoNwlczhlUtnPNdNleQYM7Y4RKnwaZdE?=
 =?us-ascii?Q?m/8ol8O2vY3nhC8BVfojbSK16OephnakHHJXJXO79gj8U8sbDhCAldfooRlN?=
 =?us-ascii?Q?cnIv7FaZb1gZoflr6n2zblRq46ta5XF9zl0qrY6jpKfZznp1NAj3C2I17d/z?=
 =?us-ascii?Q?rW+Hm5yx7YCmp9pJrjt34RdpOQshLP+/FgUWsgD/d6BH2CNihs2AHQkfxDzs?=
 =?us-ascii?Q?D5rz0HZg+IRj9251+gsb54TJiIrGCnQshsCniSb5OCPSJ0QrbwWpfJQIn8oS?=
 =?us-ascii?Q?ymsh5cdTHrlG5y278vswpy8hniVzzgcooGCRJvfywrHmmO3OIXPDvzrHAy8Y?=
 =?us-ascii?Q?LjR+VOzyFeuEoFeYSPFe0cE+aPzyfnohNhFFoKbFfNWsAsiVLKv4wlZhnIar?=
 =?us-ascii?Q?EobqPOOYmlj/51dXo6CmM3TulE9HPAu5OXBKc7FF/qTs8dm5TIzzb2HNOQfv?=
 =?us-ascii?Q?LrL98INhg70cWKh/z7ADGGHXCxw48uwJdbAD1kUJxctS2hGqFkvtbjYZJ38O?=
 =?us-ascii?Q?hMWgmsm6ctZkm/XaUHj0xVn8hdLjVhTm4mqSRIaBzNaHNWybdZe8YsE6vE0V?=
 =?us-ascii?Q?NATxcBtv9eTq6O8cwXpcmVsNiK/oK+qbHkF6TVXWSuz0On5EwvBKGGXj+r8G?=
 =?us-ascii?Q?FBbnpg7mmvLztGrNKucGI0s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb83386-3bc2-41c6-e05a-08d9ab960e4d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:52:02.7236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCZTHghf15FkraswW8eAB0xi28ydX+34nDpFi03EzHX24JAhHRvPrayeHeobqliSCNkdb2vyZkizdlxtkmTvuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4603
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10173
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190106
X-Proofpoint-ORIG-GUID: _oehiRgWcZYuA1h7FoyqIks6UvPfS-CM
X-Proofpoint-GUID: _oehiRgWcZYuA1h7FoyqIks6UvPfS-CM
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leverage the QMP support for querying stats. The interface supports
the same arguments as the QMP interface.

Examples (with fd-based KVM stats):
(qemu) info stats

vcpu_1 (kvm-vcpu):
  guest_mode (instant): 0
  directed_yield_successful (cumulative): 0
...
vcpu_0 (kvm-vcpu):
  guest_mode (instant): 0
...
vm (kvm-vm):
  max_mmu_page_hash_collisions (peak): 0
  max_mmu_rmap_size (peak): 0
...

(qemu) info stats-schemas

kvm-vcpu:
  guest_mode
  directed_yield_successful
...
kvm-vm:
  max_mmu_page_hash_collisions
  max_mmu_rmap_size
...

(qemu) info stats-instances
name            type
----            ----
vcpu_1          kvm-vcpu
vcpu_0          kvm-vcpu
vm              kvm-vm

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 hmp-commands-info.hx  |  40 ++++++++++++++
 include/monitor/hmp.h |   3 +
 monitor/hmp-cmds.c    | 125 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 168 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da800..0d5f025adb 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,43 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name       = "stats",
+        .args_type  = "name:s?,type:s?",
+        .params     = "[name] [type]",
+        .help       = "show statistics; optional name and type",
+        .cmd        = hmp_info_stats,
+    },
+
+SRST
+  ``stats``
+    Show stats
+ERST
+
+    {
+        .name       = "stats-schemas",
+        .args_type  = "type:s?",
+        .params     = "[type]",
+        .help       = "show stats for schema type; optional type",
+        .cmd        = hmp_info_stats_schemas,
+    },
+
+SRST
+  ``stats-schemas``
+    Show stats for schema type
+ERST
+
+
+    {
+        .name       = "stats-instances",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show current stat instances",
+        .cmd        = hmp_info_stats_instances,
+    },
+
+SRST
+  ``stats-instances``
+    Show current stat instances
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d014826a..3670280a6b 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -133,5 +133,8 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
+void hmp_info_stats(Monitor *mon, const QDict *qdict);
+void hmp_info_stats_schemas(Monitor *mon, const QDict *qdict);
+void hmp_info_stats_instances(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c91bf93e9..9752ca6aa8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2165,3 +2165,128 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+void hmp_info_stats(Monitor *mon, const QDict *qdict)
+{
+    StatsList *stats_list, *stats_list_entry;
+    Stats *stats_entry;
+    StatDataList *data_entry;
+    StatData *stat;
+    uint64List *val;
+    const char *name, *type;
+    Error *err = NULL;
+
+    name = qdict_get_try_str(qdict, "name");
+    type = qdict_get_try_str(qdict, "type");
+
+    stats_list = qmp_query_stats(name ? TRUE : FALSE, name,
+                                 type ? TRUE : FALSE, type, &err);
+
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+        return;
+    }
+
+    for (stats_list_entry = stats_list; stats_list_entry;
+         stats_list_entry = stats_list_entry->next) {
+        stats_entry = stats_list_entry->value;
+        monitor_printf(mon, "\n%s (%s):\n", stats_entry->name,
+                       StatSchemaType_str(stats_entry->type));
+
+        for (data_entry = stats_entry->stats; data_entry;
+             data_entry = data_entry->next) {
+            stat = data_entry->value;
+            monitor_printf(mon, "  %s (%s):", stat->name,
+                           StatType_str(stat->type));
+
+            for (val = stat->val; val; val = val->next) {
+                if (stat->unit == STAT_UNIT_SECONDS &&
+                    stat->exponent >= -9 && stat->exponent <= 0 &&
+                    stat->exponent % 3 == 0 && stat->base == 10) {
+                    const char *si_prefix[] = { "", "milli", "micro", "nano" };
+                    monitor_printf(mon, " %lu %s", val->value,
+                                   si_prefix[stat->exponent / -3]);
+                } else if (
+                    stat->unit == STAT_UNIT_BYTES &&
+                    stat->exponent >= 0 && stat->exponent <= 40 &&
+                    stat->exponent % 10 == 0 && stat->base == 2) {
+                    const char *si_prefix[] = {
+                        "", "kilo", "mega", "giga", "tera" };
+                    monitor_printf(mon, " %lu %s", val->value,
+                                   si_prefix[stat->exponent / 10]);
+                } else if (stat->exponent) {
+                    /* Print the base and exponent as "*<base>^<exp>" */
+                    monitor_printf(mon, " %lu*%d^%d", val->value,
+                                   stat->base, stat->exponent);
+                } else {
+                    monitor_printf(mon, " %lu", val->value);
+                }
+
+                /* Don't print "none" unit type */
+                monitor_printf(mon, "%s\n", stat->unit == STAT_UNIT_NONE ?
+                               "" : StatUnit_str(stat->unit));
+            }
+        }
+    }
+    qapi_free_StatsList(stats_list);
+}
+
+void hmp_info_stats_schemas(Monitor *mon, const QDict *qdict)
+{
+    StatsSchemaList *stats_list, *stats_list_entry;
+    StatsSchema *stats_entry;
+    StatSchemaEntryList *data_entry;
+    StatSchemaEntry *stat;
+    const char *type;
+    Error *err = NULL;
+
+    type = qdict_get_try_str(qdict, "type");
+
+    stats_list = qmp_query_stats_schemas(type ? TRUE : FALSE, type, &err);
+
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+        return;
+    }
+
+    for (stats_list_entry = stats_list; stats_list_entry;
+         stats_list_entry = stats_list_entry->next) {
+        stats_entry = stats_list_entry->value;
+        monitor_printf(mon, "\n%s:\n", StatSchemaType_str(stats_entry->type));
+
+        for (data_entry = stats_entry->stats; data_entry;
+             data_entry = data_entry->next) {
+            stat = data_entry->value;
+            monitor_printf(mon, "  %s\n", stat->name);
+        }
+    }
+    qapi_free_StatsSchemaList(stats_list);
+}
+
+void hmp_info_stats_instances(Monitor *mon, const QDict *qdict)
+{
+    StatsInstanceList *stats_list, *stats_list_entry;
+    StatsInstance *stats_entry;
+    Error *err = NULL;
+
+    stats_list = qmp_query_stats_instances(&err);
+
+    if (err) {
+        monitor_printf(mon, "%s\n", error_get_pretty(err));
+        error_free(err);
+        return;
+    }
+
+    monitor_printf(mon, "%-15s %s\n", "name", "type");
+    monitor_printf(mon, "%-15s %s\n", "----", "----");
+
+    for (stats_list_entry = stats_list; stats_list_entry;
+         stats_list_entry = stats_list_entry->next) {
+        stats_entry = stats_list_entry->value;
+        monitor_printf(mon, "%-15s %s\n", stats_entry->name,
+                       StatSchemaType_str(stats_entry->type));
+    }
+    qapi_free_StatsInstanceList(stats_list);
+}
-- 
2.26.2


