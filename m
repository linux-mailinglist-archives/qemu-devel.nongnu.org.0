Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD9E532EA5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:09:32 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntX6A-0003Db-Vd
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVF-0008FN-5n
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:22 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVC-0003UK-Vq
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:20 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFPMQb001520;
 Tue, 24 May 2022 15:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=B51K62cS6ZkPHiXp68MWw29OqPcqZq+rplOVlnmUwks=;
 b=0GkEne4Csis9M8YWqCnCUkle9wV84pyqcz9Gl0Y6K0lFer3ubwIAqTaVUsgvRmrCR+Js
 WaIemlmZCrpqSmXNmgi1Xk38Rnz5fdobhuU1sn1x/juM0UnuKwrwHPNzPYMfQCXqj8pz
 S3gi1vneAo2XDqJHSj4b4JW8eMRYEwfJehfjdEJtYxevgHm5NfCQbRRqPNE1JHmA93yn
 YFasWKGnohYFxC8tyEQ1ibuusYJ2La0Unc8goGVFuwPTxpqNkuTIN8eex+QrctXP9/wG
 7X+DVLqZT/6A5sEQy91/4GwRk/pf9DB7iNEW9uanwqKzTpf4gzatwtBNvFfKCKpIoH4v eQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pgbpqa4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:14 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFFrjN015045; Tue, 24 May 2022 15:31:14 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph8x15x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfGuVmWrNiE/mQtQBrS6NduVIXltEx3QAdsyGd50XC7rze+wMj8iSOYZjIbKXa7BqYv83gDoxcEHIP/RFhnw03Sku+M5/A2B36gpBmZd+T/ItR1WH/Ry8Ry7QbdTjYzYcgdZktIwAhlQjzYudjNah0CksVnOrRV/7I95PMy7eYsoJaCsYNPGWztBK7zN6P8FgmKU0nYIIBfwjcu7ckWjGEBvzJmKZmLqMh1FtABKwv9iF9xzfaXoBQxV/+pfMBNSZ66C1mdDaP98pevBsY7Vtk8mSXrl4hRmvS0asOH0Nu6AHVwd+I+m36ocuhFnM5xzG15Qv1yO9FjjcnBif1qDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B51K62cS6ZkPHiXp68MWw29OqPcqZq+rplOVlnmUwks=;
 b=ZS7iEFwLEgNzdh2ZXFaJ4APxFnzbAfd5ZvW/t4ejoNBFWlR49KsMPJfrAHaioc8z505xb0ac/qgQQ5g6QOFWKOrKMup2WvSCAF1gURHdZJpObpZLpohs+Rh70AlIHzghvruMguo7mJujLAwbYK6oNRz0xIj7ygcliBPXFsevvBK4oXNYON3nCWip0lmIzyLU9ohege3VQLySGhU6R++3bZfKR4ywFQUHp5mRhwXdJW+CSDFxcTomk28hK4jaPex6LZ/zO1wyvS0tC5zGcT83gSBw82tZrqQwZUYzbXZ/NSBhnYUSdw0mlqVToF5sgbUQF3jCOxAduvdoawaeLG6a+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B51K62cS6ZkPHiXp68MWw29OqPcqZq+rplOVlnmUwks=;
 b=O6QxL8gyAmQKErZ8wMCslfmGBaYxDo3cyWLIWGocQe6WMe9KGxThdpu25eThdxQzQHi5xwGFwKkRV6OQiulKoguBRFCU9bsYdRoyU7PCbfqsFgZFZdqT/f9eQbiFZiIxPQYhms37GkwBvI8hHJBh4KBDUmW/ZrACfdOBnFR0hM4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:11 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 10/14] vfio-user: IOMMU support for remote device
Date: Tue, 24 May 2022 11:30:29 -0400
Message-Id: <94611f75e1b7bda8a85b2cbb2b81f976c2d2e338.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1901279-1c3c-441a-cf2a-08da3d9a6e75
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117C50672410300399181C490D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXLa9iDURxKeQtjh5p5XhOearzL1M7Md8z8yqeILuXX4ZSxPgXJl0z5aC6llnZgM0iIoDwDsUzhSsqb4v5IrozpiQmh03HPq6PHxBS0uDRbXnmM7DaJ8fh213c14nqoi9SJWKyvzYjrHvsmXBzIYAfEOOOSC/KO14EjBtqqKZY7KV5o+595D0cj/ovQx4zVEMLOh8kDDw3ssapwLO05bQT2y7t+1I+Vq34GvCMYWiuBenN27NNDw1o/s+Huyb1xV9GU8TvnvFTzjshK5gIq8Ko9JIhmEB0CwMnWAaJQG4u3i9tDEKqERc3pGdEJrIH8p3+kI1n8UrWObD/PPUes5VsGkDC9NCKgk5KYUocPBw+mCcB7Xj6gCrwLJmaCWz62v+4l0u2SAyFBOKpVc/H+TAWoLuiiI7YsXjN1j1/sJovOISHn8DM+5WXBdTxkPrqVGYQJUFq3tE4BeMkfBKzaKsGdrrxeNI3yldk3wwUWSPL8Roi+c/OisAgpbzXyfrlJ7wJuvRKMk5dmmtc7ieDSJ15ti3PGUnm5Gpj9r54RJjWX1PeABDg+4vFbfukDphkPR9dR18+Jc4hqe+jqYJll+A83WYg30DeEfLlwnwMd9Ge3AIuwVfweYDBqH73fk89gV7TZsYVKPuaR9fDTPitGWm6HGZ9A8t7Psaoi5g+lhvYb4wAxT1S3FcyDcooIa/AGIeb0uBpvAEb0d1/9m5+mEeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW8yWGd3MUhhZEFiejVzUG5ya09Cd0x0WTQwR3VzZmd6UGpJeVg3dWRjN3A0?=
 =?utf-8?B?Q3YyeUVZeWVLNkxwK0hyOThHU251ZXlLUjdPTkpINXhPNnFhNjdEbis0d2RF?=
 =?utf-8?B?Qkd5WjZ1MWdYQk5yY01JbjMyMzc5dDFhc2gxN0srUm43Zm92c3VQdnd5UmFN?=
 =?utf-8?B?YmJpemtWQWUwZHNNOUlOeGVGK0x3Q2E4bXc0eWNvbTJ1NG9ob3Z5VUxCWTFQ?=
 =?utf-8?B?eHFNeEVVSVp6Si9wcDRqVUxTMzhmVEUwVWZ6S09pWXRBbzR5RHFDSXAvYlNj?=
 =?utf-8?B?NDcyR1pUSDdnMEpicUtkMUsrOW9FbU1XLy9rQWd5ZWMybmVxQktLSFkwcWhK?=
 =?utf-8?B?SGFWWTFyYnh5MzJyYkViTk9lYkJqMTg5c2dYelBBRWg3b09CdFFoZkZvZ004?=
 =?utf-8?B?d0NZeGlCcTFJdGN0K2ZWRnVlOWpPNUNiZHJNejBUelFURlg5VmFBRTRERS9K?=
 =?utf-8?B?SldjQjV0OG95SXVQQ0t2Wk5WbW9IalVpZU5GSDhHK3N2c0ZXN0pxVHNpME9V?=
 =?utf-8?B?NmVTcHNZN1NuYmcwbG45RVY0ME1TNWhIZHdramtIMVZDMHcycVIyYUovN1ps?=
 =?utf-8?B?dC9UL2J6WVkwMTVMSDBWbXlLYWVBNlV2SjFoWGFrcXpUS2doa0VkN0dsQThy?=
 =?utf-8?B?ckdzRW8zTzF2aVYwNGRZM25ZcnpabFRTVms3QTlPVzFWckI3WW5SZk5PcmRM?=
 =?utf-8?B?ZG14S3FCalRUVHViMmJUdDZkQ0VYcEtsN1FjMEJvc3UvbEhHcG5ETGlNVGVw?=
 =?utf-8?B?OWJldldrWlUxd3QrSUNaS2oxMDMrVkRzclJxOFV5cGR6K2NsUm1Nb0pGTjdi?=
 =?utf-8?B?dmJTMEhFeE1RSDhOZkJiSEV2YXZHdXpkVlZOM0tnUll0QkxWNG5ad0NzK0s0?=
 =?utf-8?B?VENqd2VIOWhnZnVoZUE2QnpoL242WitBanFLYUFqVCtUYnNpOHMzdEg5NjMr?=
 =?utf-8?B?bkNBUFZYR0t5d2dGQi9CekUvQU9XVmpKaHlXZVAra1hLTVNrM2VXc09GUWg0?=
 =?utf-8?B?NXFSQzNLeTBudE80eU1WNTFFZm4zd2JYU2dzMzV6amlUSDhETVZrV0xyTE85?=
 =?utf-8?B?TGJ1UVNFUFVvY2RBMitLZUhIejRQSDVRaUpUYmZKelFWTUpxZTFSN2ErVUNN?=
 =?utf-8?B?MEJCcFlFWkNVbnZQdFlvY09uU2VOZmNJTGNveHMya2h6cnRGc0JjeWwyazda?=
 =?utf-8?B?WlZoQzhhK3VXZ3pCaGpaR2t4N0VEZ3cyTm9OYzFuSkYxaDVmK2tTVS90ZDl2?=
 =?utf-8?B?TjR5Uk1nNCtYTExSY1ZmaGdVL1AvdkYxWTVaTkNpcjJBMEdYUHo5WS80aHRL?=
 =?utf-8?B?elBweFRjY0ROTEZSLzRFQjZVV2tPUXdMcCsrT1I1RlNFdklPU1BoSUpEZmRU?=
 =?utf-8?B?a2xqMDZwdStpaVJKZkVPUW4yMHk4ZE1rRURIZklsQy9XU2NmU3pzZG9UVnh0?=
 =?utf-8?B?Nmt5R0hWakFPSFNlNXpXZUI2SjhjOVZvdW5OV3hVZWRERW9oaVdvcUZyR3NT?=
 =?utf-8?B?SGtxTjliZHNINkJOTUlTNDhadCtJbUxCQ0xQRGhvS2JvNE51eUxwWEhkYWU1?=
 =?utf-8?B?TUZZcDVKaFNjVmhsVUg4d3FzclJrZUdzQk9SVkxQNlg4QzU4NG95cFZESzVL?=
 =?utf-8?B?cG54QTB5YnM2UmpVUlBiUkgvOGl0Q2QxY1FuNFMyaFJaSHdGbmxVOHVMTTlv?=
 =?utf-8?B?LytCTnhVdE5BQkFtOWI1YkF5NEdta2Rycit2Nnk2UmhTS1RpVHZPWjEwSU96?=
 =?utf-8?B?anVnTTdwd2J2NEFHNkNFbnpYeFVjeFRKYlJ4SWdxSUFVZDVmSWl3MS9HZXdz?=
 =?utf-8?B?VmFiMHgzWlk2Vmg4NU5DOEkwb01TSVJyWml3TmZQSGk2RnMvVkRqalNPYzVl?=
 =?utf-8?B?aVNTNCtrSmEzcFNQcVBPaGV0dXVUT2hFeXBHelFTUjlDTllrMHhxYU45T3g5?=
 =?utf-8?B?Mk00Wk1hNjljWUxoVGdSR01YQytpemN0Wjk2ZDB6TTQ1bndBdE5JN3YrMmdt?=
 =?utf-8?B?a3dEcDNSMXh1SUtrbVY5dTJwRkppNDlIU21kQWg3M3NaWEpvaXEwamcvWWg2?=
 =?utf-8?B?SjVtYWs2L3F2NGxJdU81RWtlN0ZzbFpsMXAvY3hiWG4wSzdibHY1RTVEMTVZ?=
 =?utf-8?B?M3VmZVlHWCtCbnFYNzBsSUl5dFlDY2ZRdW5icWxKdFM4N2ZGcnlxbG1YY09z?=
 =?utf-8?B?YUtBV1EyWUV6eWdQKzAxV0JFSFJUdGZMN0x5Nm9QN093eDI4UG5kZjR5RW1X?=
 =?utf-8?B?aWJiUjcrY0N1ZVMreFRYWnJGMGZuaTBZeldIV09rZVBSYTVudGlHL3FkbW1k?=
 =?utf-8?B?ejRYR1cwUyt5SGxEbFZ0V0VlMk1ZYklLb0s1dzRMTG51NTBiaFEzUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1901279-1c3c-441a-cf2a-08da3d9a6e75
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:11.6787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7kTMmZM3VcXD1KdmogID+krkzitz/DoUZv4hozo5gESTSvU5/Bmg8nzv6NiBldEvo8TPRMK9dtzcjy5vmCMIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: 5HBA81X-xCiw6vzHp-rgVqApoLSgbUjr
X-Proofpoint-GUID: 5HBA81X-xCiw6vzHp-rgVqApoLSgbUjr
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/iommu.h |  40 ++++++++++++
 hw/remote/iommu.c         | 131 ++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c       |  13 +++-
 MAINTAINERS               |   2 +
 hw/remote/meson.build     |   1 +
 5 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..33b68a8f4b
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,40 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+
+#ifndef INT2VOIDP
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+#endif
+
+typedef struct RemoteIommuElem {
+    MemoryRegion *mr;
+
+    AddressSpace as;
+} RemoteIommuElem;
+
+#define TYPE_REMOTE_IOMMU "x-remote-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteIommu, REMOTE_IOMMU)
+
+struct RemoteIommu {
+    Object parent;
+
+    GHashTable *elem_by_devfn;
+
+    QemuMutex lock;
+};
+
+void remote_iommu_setup(PCIBus *pci_bus);
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..fd723d91f3
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,131 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+/**
+ * IOMMU for TYPE_REMOTE_MACHINE - manages DMA address space isolation
+ *     for remote machine. It is used by TYPE_VFIO_USER_SERVER.
+ *
+ * - Each TYPE_VFIO_USER_SERVER instance handles one PCIDevice on a PCIBus.
+ *   There is one RemoteIommu per PCIBus, so the RemoteIommu tracks multiple
+ *   PCIDevices by maintaining a ->elem_by_devfn mapping.
+ *
+ * - memory_region_init_iommu() is not used because vfio-user MemoryRegions
+ *   will be added to the elem->mr container instead. This is more natural
+ *   than implementing the IOMMUMemoryRegionClass APIs since vfio-user
+ *   provides something that is close to a full-fledged MemoryRegion and
+ *   not like an IOMMU mapping.
+ *
+ * - When a device is hot unplugged, the elem->mr reference is dropped so
+ *   all vfio-user MemoryRegions associated with this vfio-user server are
+ *   destroyed.
+ */
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    RemoteIommu *iommu = opaque;
+    RemoteIommuElem *elem = NULL;
+
+    qemu_mutex_lock(&iommu->lock);
+
+    elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
+
+    if (!elem) {
+        elem = g_malloc0(sizeof(RemoteIommuElem));
+        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
+    }
+
+    if (!elem->mr) {
+        elem->mr = MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
+        memory_region_set_size(elem->mr, UINT64_MAX);
+        address_space_init(&elem->as, elem->mr, NULL);
+    }
+
+    qemu_mutex_unlock(&iommu->lock);
+
+    return &elem->as;
+}
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev)
+{
+    AddressSpace *as = pci_device_iommu_address_space(pci_dev);
+    RemoteIommuElem *elem = NULL;
+
+    if (as == &address_space_memory) {
+        return;
+    }
+
+    elem = container_of(as, RemoteIommuElem, as);
+
+    address_space_destroy(&elem->as);
+
+    object_unref(elem->mr);
+
+    elem->mr = NULL;
+}
+
+static void remote_iommu_init(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    iommu->elem_by_devfn = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
+    qemu_mutex_init(&iommu->lock);
+}
+
+static void remote_iommu_finalize(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    qemu_mutex_destroy(&iommu->lock);
+
+    g_hash_table_destroy(iommu->elem_by_devfn);
+
+    iommu->elem_by_devfn = NULL;
+}
+
+void remote_iommu_setup(PCIBus *pci_bus)
+{
+    RemoteIommu *iommu = NULL;
+
+    g_assert(pci_bus);
+
+    iommu = REMOTE_IOMMU(object_new(TYPE_REMOTE_IOMMU));
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, iommu);
+
+    object_property_add_child(OBJECT(pci_bus), "remote-iommu", OBJECT(iommu));
+
+    object_unref(OBJECT(iommu));
+}
+
+static const TypeInfo remote_iommu_info = {
+    .name = TYPE_REMOTE_IOMMU,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteIommu),
+    .instance_init = remote_iommu_init,
+    .instance_finalize = remote_iommu_finalize,
+};
+
+static void remote_iommu_register_types(void)
+{
+    type_register_static(&remote_iommu_info);
+}
+
+type_init(remote_iommu_register_types)
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 4d008ed721..cbb2add291 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
@@ -99,6 +100,16 @@ static void remote_machine_instance_init(Object *obj)
     s->auto_shutdown = true;
 }
 
+static void remote_machine_dev_unplug_cb(HotplugHandler *hotplug_dev,
+                                         DeviceState *dev, Error **errp)
+{
+    qdev_unrealize(dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        remote_iommu_unplug_dev(PCI_DEVICE(dev));
+    }
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -107,7 +118,7 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
 
-    hc->unplug = qdev_simple_device_unplug_cb;
+    hc->unplug = remote_machine_dev_unplug_cb;
 
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
diff --git a/MAINTAINERS b/MAINTAINERS
index 8121671228..9d8695b68d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3604,6 +3604,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 0eb5a0f375..ab25c04906 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
-- 
2.20.1


