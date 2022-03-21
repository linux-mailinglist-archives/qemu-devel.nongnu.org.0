Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679034E2A58
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:21:10 +0100 (CET)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIuD-00069v-GB
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:21:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWIns-0008Ud-1r
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInp-0002R4-Ix
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:35 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LCw9ln022265; 
 Mon, 21 Mar 2022 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=sY8w2P2t4x8VdRK7Lv2C+ZZz462dHOfHvSBQcFRHxhY=;
 b=zwmd2QBkgebUwtAYohuM81dGXw3urpcJhMpoYllj1v2z7zThoKKtZh7/gnehpf+MtA62
 YGjhoajleLTyUGH6FStyo35aTRGLH7A5qtbh5OlnyuJ2CHDfAGhUO0iIE0K9XGRQJNk+
 RO29ErLLtU8dl1NsBQX5DG3RCN9/rYZo/cbXyhfO4rFfyTtKzGHP6i7BN7qTr4e4HF4E
 ORF44fR+xpgwQ+MgMyKmnoefl1AufcvgROen1Ye14KAVgBz3066W69y38YfKx1C/FSKY
 fBnSjhmhwcAKVBouZNxKB9hqhBbPku7V+TvF5Mu8TcFZdgmNSAF+adZk92PleyetMlN0 pA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5kckd1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22LE5cUb051515;
 Mon, 21 Mar 2022 14:14:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by userp3020.oracle.com with ESMTP id 3exawgse9r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kthslV34ZuKKLHDvWprllxyTafaiHEyKaLp5qovffO5LuzBGHTnmMFZ7jb/6YgU9jgZLgyRZNEDV2TUkj4Di6GpSHsQVoVxPP0f+hFNK9mXxGEuSOb3mcQwvOc9bn+vPPWTfV7rrnwpc8mxebeahjGpOvC1eHozNflYSGpznu3GtDSVZh11tIB1hc0zg9EzB1busPaAZtfVtxla/SqED9YtQE7NC9ahVQ41Q2MKfKc5F4yy/yNrLXUCy5AhmfMT7jMJlIysVIBpi5YISCI13rT9VjmubQOiql6B0Ob/YUbvu4lriMfliEsWGgUddT+k9y+BQPH1nyDyHca4eFTbAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY8w2P2t4x8VdRK7Lv2C+ZZz462dHOfHvSBQcFRHxhY=;
 b=myVCct7fqcPPkX+cstfglXyCAjhhcVlkdrA7p95uJQL8gg1g4cK5eKzf76bG2pqkKuqpABDyF5exxcfU7jN6dFYrSxeiSyCSBM2fhzIcyeFCQ6nj/fwvmo1BhY2b2PRNrS0Zt8oJcTYgK7ulB9FkK1yo4FdawhX+8VfGCm3sgGO/5ArDTRkJx8stSWZLIyzVVbFEpE/B+AM9YA+jIFcYNkZC7TVvKwYrgw3WcvEh3mrZXk/Kof5BP3+M9CnSgPvjVRHi0gCYU4BkIcRbZATnkvsNcqlAmQwhRaE1t/YmgbH7R4TVqd7vRueLsWPvfM2MoIKKLw51dDdBlq/sjF6M5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sY8w2P2t4x8VdRK7Lv2C+ZZz462dHOfHvSBQcFRHxhY=;
 b=RbevLrh65k+SGl6heu9/pVNZfUl/63N1yEpb/rFxtXojroXbX+HhOk3nmotP/aa4dBCuv1DrQMYMMBeml1u/I49/aTM5lyP32RzQZd3TlXRJ6tZcbi+PDKd64GO5dsXo5eEv5x6RNR5JCQ4tlb8s7XKNsqGxViAm1cEH8Y1YbMg=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BN6PR1001MB2258.namprd10.prod.outlook.com (2603:10b6:405:2f::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 14:14:18 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Mon, 21 Mar 2022
 14:14:17 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] accel: Introduce AccelOpsClass::destroy_vcpu_thread()
Date: Mon, 21 Mar 2022 09:14:05 -0500
Message-Id: <20220321141409.3112932-2-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220321141409.3112932-1-mark.kanda@oracle.com>
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:5:333::29) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f0a7474-c24a-48f4-060a-08da0b45161e
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2258:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2258B3BBD7643AD1F3A0B175F9169@BN6PR1001MB2258.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbeU4/DRcuh2tw3qPeDCINIXcoN6W+3pnveyfcUfkQUJ1f3q/J9BTQXL+ml2iTyR+PgVggopxB0IpzPQ36an3YUKHnim4/uLgJvUOC5PLWRUtj6hSm9pY1u1IoVhrhSRmxaYy7fq2lAI7SIkODbVmXg9s8HM1DLuSB1b6xsUheqlzVGWpmGdaLcKRgtmh3YQG4oLjjWmmhT3LUgiyx9J3NwLRTWHtUSAuRB/WvpRUHcUCFRDJtP82vO+3Cb7l1WI06rwvoZEdqmKrax72DK+K+76TDHO0AFCAyl/n8BS1eZU6xlgQS2FutiycClcoQAUgQd+8R6EbHVbFSJ3rPJhRlbEOoJGPgP/dSZaIs6BTZ+zQVh20Duk/mBpqxjr93jJ9LQfR4Rvt3D0K1imtsDU8J9t0fgMz1uj4vy6Q+nD/+Z6m9kdPVNcaK+VKHssoZ5wcm2x8SlX5/TpKFKUDUQdcgPjQAW389cfmRqWsYZ3CBiRILV1kycQnBxb6Ans2eoT+oD0yfv6w90kQQzXGPMsOZh0NVTrAGD+4QrdkebllSxlLtqe6EuZq5KlnwmYMmAKNSVJiPUNCAnE5Vvis4rRe1pPMEBpzU8/FZCzWVHniKY00dxUYSWY1vsLRU4h64J2auuq9ELpYMKbejwDHAN/oAbFryZTYFo8Ybit72viQytDfB4MlRPgTcE0oDRLT+85s3wdTwfumUNUmCtVDi2G0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(36756003)(2616005)(2906002)(6506007)(508600001)(6666004)(66476007)(316002)(186003)(66556008)(66946007)(83380400001)(6916009)(44832011)(26005)(1076003)(8676002)(4326008)(6512007)(86362001)(52116002)(6486002)(5660300002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2Z5VWNwWUVyT09QUERLNXJFMDdQUEhqdVMxdEJ4KzJlY2FFd3A2RHZLZWFi?=
 =?utf-8?B?dVVSaE9nbHk4MFlKcDE3QzhOOWplR0RYaTBpSnlHWjhyelN5ZVc5YU5pUnl4?=
 =?utf-8?B?OElqU3h3dmN2WGdwcWFLTFpHdUwvSXd5M2hmaUNJOGJLOTJsQXJoamhpTW8z?=
 =?utf-8?B?emxjdjBlQWx5WjFqMmJ5eWU3SUpIaUhFMytpNkYraVo5YkZkL255ZENaSzV5?=
 =?utf-8?B?alRiUXJ1QUdHUUpJeUFkVFNSSTJ1cHZEeDRhSHZOYUdqeFlaaWNwbGZsV09W?=
 =?utf-8?B?S1hwenA2M2dCVUVvN016OU1vYWIyUXlBT01RNjlKY3ZXb2U3TkljbkVrTzdJ?=
 =?utf-8?B?L254Y2szQ3ZXem1rRG8wK3pCeXJkSE42akh0c1BndzcwWTk5RkU3dUFvU050?=
 =?utf-8?B?eG4zN0V6NVRhQ25QMUNoSzlRbTR4MUhOQ1JhK0g3OWQ2Uk92bkxKeUt6T3k3?=
 =?utf-8?B?SmJHYjMxMm0zNnU0KzgyeG03RlZtV2FTVUIxOWl1dXNUVm9lRXpWZWJIWVlN?=
 =?utf-8?B?VElPZUxxcVFlNGNzd0lVWSsxMlV5UUlENUtNaCtUMlQ3c0ZvN1M2aUh0U3BF?=
 =?utf-8?B?M2ZHWmdDcmZ3QnRzRjZvM1ZLVEpQQ0o1Rk9sc3Z6YXFWNi95dEVoaWQ2bDQ5?=
 =?utf-8?B?SjlaejhSSkRhbEZZUUlkYkNsRkdjdTF1RElZdktzRHp6SVZTbVBHREF2WG5w?=
 =?utf-8?B?THRzZTZsMFZLbExHcUVJOXFZOXV6eHlKV2RzRDdpU3UvdFZKdFFKdnlBTFpI?=
 =?utf-8?B?RmtFWjc1aE5FQ2dHb243bUJ3akZrQ2NSZG51SGdIODFtL3EzK016dDJSOFhH?=
 =?utf-8?B?cnVyU0NvNFJ3VGF1d0duNDRwbFZkUXR2RTNPSkU4WGJJT3Nydk4xSS9PN1lU?=
 =?utf-8?B?eFhQM2FXcDZqOUV1alExR3lXQWtCR284VWluWTlOeFpDRktaUkIvU3hzRXRt?=
 =?utf-8?B?N0R2VHRxZjhERlRaTTlPZW9oSEhwUnl2d2pOb2pXaXNIaTBiM09La1VvK3VF?=
 =?utf-8?B?bmpqNWd4d2JuWXNoTUllbXE1VmlxZkRHT2JNWjNzeEVSMzRPYVpZNGFlUkpX?=
 =?utf-8?B?Y3FOOW5KUWN1N0lMbGhXVDVKbmw2bk1VdzU1dHViaDczUG1lczRRUU9vd3E3?=
 =?utf-8?B?RnJ0Nk9kdXJFZ3E1alZhdFJHaTQvcnBWL21oMUZrTmovMTJRZmdWVWdsdTRw?=
 =?utf-8?B?clo2aEtnK3dWeGlIc094RFgxR25EbXR3a1hET1BNRjBKS0hxT3RwMWE5NExW?=
 =?utf-8?B?ZzMxcDVlR1VLOXY4b3R6eXBaamg4NFFPVXJUUzM2cE44RVA0K1BKc2psZUY2?=
 =?utf-8?B?SHNqOVpOZ1dlLzFoSU5tQTFZcUV5dTd4OUd3dC83Y3ZsWmtKUkFnK1FOaXF5?=
 =?utf-8?B?MnlURXQvT09OSzd5b1crbWUrcWxZQ2gxKytDUjhQbVB3bjRFQ2R4b09FN2k0?=
 =?utf-8?B?V3RuNHBzYWpJY1lpdFVsK3JwR08xSjNTcmRXcWxxbHVpbFp0OThid2hsc0JP?=
 =?utf-8?B?L3daL0JONE1lYy9Rc0IvQjFWbnk2OFZwUHBZSnJidEF2TW9WRWEvWkxXTnpr?=
 =?utf-8?B?R2Q4ZTYycnFPVitrb1NuL2FKZldpZjZoM1lPbEd6RnFpN0NHTncrSHByb1h2?=
 =?utf-8?B?YjJYY1BsR25OdDJDMUhZM0JyVjlGL1lnaFFtQkEvRTM0ekpJVnplOUJ5aW1C?=
 =?utf-8?B?OU5lNWVGMnUzQlhYd3RuMVpuU3YrdmE4VVJadHVHUWpmdEdxK1pTL3hHcUhC?=
 =?utf-8?B?NnAzeENRVFFvYmVBM2ZVOTluMFZ1WEtJVFpQL0RJZFIybTNjVlZwQm1sYkxR?=
 =?utf-8?B?TEpvUVZ3cU14SzJUM0ZaODlhTHNTL3NMaHFULzNuTHVDc2lFZU1uK09SSDlK?=
 =?utf-8?B?WFJyNnlHemk4MTRWT1BzbEpiYU04YmRGQXpzaWI2WXk5bkdHSWlzT3h2LzFz?=
 =?utf-8?B?UWNWMVBJUEZwUGxlcFEvUWRyTzBWWm5JSU51TjMxVG1tRXViaHFScEtZMktX?=
 =?utf-8?B?dVIxL1JzcmxnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0a7474-c24a-48f4-060a-08da0b45161e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:14:17.9311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZZ3jNk3xgTHN3W9Qin+moXENrZLJqFZSiPWrr9Gv6P5ALjMTKNYPh513+A1bb+whPikH/8U0rTVq7D2AXBRdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2258
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10292
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210091
X-Proofpoint-GUID: hXcTJZ42F9FNFRZBLHkRa3n7N3i4EBsk
X-Proofpoint-ORIG-GUID: hXcTJZ42F9FNFRZBLHkRa3n7N3i4EBsk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add destroy_vcpu_thread() to AccelOps as a method for vcpu thread cleanup.
This will be used in subsequent patches.

Suggested-by: Philippe Mathieu-Daudé  <f4bug@amsat.org>
Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 1 +
 softmmu/cpus.c             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 6013c9444c..e296b27b82 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,7 @@ struct AccelOpsClass {
     bool (*cpus_are_resettable)(void);
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
+    void (*destroy_vcpu_thread)(CPUState *cpu);
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7b75bb66d5..622f8b4608 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -609,6 +609,9 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_unlock_iothread();
     qemu_thread_join(cpu->thread);
     qemu_mutex_lock_iothread();
+    if (cpus_accel->destroy_vcpu_thread) {
+        cpus_accel->destroy_vcpu_thread(cpu);
+    }
 }
 
 void cpus_register_accel(const AccelOpsClass *ops)
-- 
2.27.0


