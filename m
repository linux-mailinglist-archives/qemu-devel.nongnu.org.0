Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E24E2A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:17:02 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWIqD-0002KO-BB
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:17:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInr-0008UY-EA
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWInn-0002RD-Lp
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:14:34 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LCw9cl022268; 
 Mon, 21 Mar 2022 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=f/RJeG7YDeefbdr8Jvp4o9drOY/QWN6DZHyL1ATOhbE=;
 b=PaCtwWi/vn0uj4I9d5r3WQzLji0L6O7RTiAwBysByBA6VADCTWdIPhFlZHLrm3HLWE65
 rP3VKDkUx7qyWWMY4LSYFfOcCvBDUWK4WFxN7+4s/bE/A/iZs96ajIeE3BklaB3lXMWe
 c9Tzib8e6+R9WY2KFtxDnQ18pLku2+CkqQmyH3dT0Ivf6XNfHmOO0diPWTOi4NhVrMSD
 uMvPC0QrTY4HCtNBas5fFi9wCZ2BfntSS4p6hNm+m8luT9hydqH3yfnBdo+hAS7W+EQA
 +6JbiEsNkPlk0T91GixDdCskzROMzpgz6oPh9l9mAYoGnkpxKq7RgCAiMQoGpZwWvYbb GA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5kckd1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22LE5cUa051515;
 Mon, 21 Mar 2022 14:14:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by userp3020.oracle.com with ESMTP id 3exawgse9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 14:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dxa9rRBTjbO9oCbflYfsbhfB+SMUZGrie5VFvn8+JVw73JCFPelNngOxi8E3cv7ea6s9FnIuqbRnB8umxP79qQS2EVS2O8Zz4oQfSL/Q/AA/KoSIfVH7bxuSAKfcAvysZMcYpzyjPDG41Zz+VDBlXTMqqfzHdVm+xgizrQMwA1Y0BtORwVoZ4f0o9/PrsnbmMOUPqFc3DbviQSktslQcyMb0BNxuk9RmJWjx9G4zCePWdwMBQ8iM57xDnIlAoQLqgmtYskaH6MtXY5AyL3O+mw3KW/m/KB464F0n8CvXh2mSalLp2GaIb5YFJsvF/SQzGkJRIuKGt9gvbFKNOC+EGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/RJeG7YDeefbdr8Jvp4o9drOY/QWN6DZHyL1ATOhbE=;
 b=iRZcwDWUn3oybtE/GItzOwakW3hREyyUu9ezfyHgZRPhEyA2eVv1QFxVQMmGXs5E0QR9N1gMdtaTYMweMwdK2amXNDEjApVOTEksyFtliWrH3l9gVOl6bDaR6e2/MPsycWMryRX1dt6mCL+d3I/+GnYJyuGrOTvTAMHdF3uvUhVJHvCEDNGMe0nKUvRh0n5LcfOb1Ji3sz++2vYvM2XYvIz6XrLKkEhO4s5BpOrvc6QLPuA5a+2VTY2xkgqI0KmueHmiDw8exgfSWQh8GKBCKS2f7Nbs7w8OGjT5sOWxW3U02zBhsMV5khoD/SfQDVuWZj1yK2v1IWeeyzPYYhp2xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/RJeG7YDeefbdr8Jvp4o9drOY/QWN6DZHyL1ATOhbE=;
 b=gxVbbLRZ+3UI6lYoMN+OjClhY34kD0Hxc2SdnDlhI1WmQHJueQ/kWIZYn98gkRarNRLskBd8ci/m3Vtu4RFLNIjMgc559/PZ8pPVXfi+vcy7/mVgEPrFjNKkFED0Nr+BXCIZ3W2jgJ9POPB/ObLUbOxln/QIbRxYVS+tZ7F+OKk=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BN6PR1001MB2258.namprd10.prod.outlook.com (2603:10b6:405:2f::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 14:14:17 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Mon, 21 Mar 2022
 14:14:17 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] vCPU hotunplug related memory leaks
Date: Mon, 21 Mar 2022 09:14:04 -0500
Message-Id: <20220321141409.3112932-1-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:5:333::29) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09183cc7-8fe4-4299-9a92-08da0b4515ab
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2258:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2258E64C648913AE1A09DC5AF9169@BN6PR1001MB2258.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNY7EzgpdmmZWWSBgykdYPDVqJbPKdI7CLhnlBY0yo0BjIMP33co0K7DP2coP07yGsUlWPIhrWTvF57fMgMqDr7lOTKVbRRJGu3ErtyXbxWCQ95euMJfuPrUVVZOa9xv38OWL2hEsUmSU1T6NKfDt2UxNtu3o7Re/BVQMhnjQyAtnKHPZiKmujGfT4MbXj7WRGmKaMrLAqdvA7B0AfAkwYQSoFmkbQwoszBhErxV1np/GOjNnYt4/Vc1e1goD7leDh756owSPNKL96xRgeX6LytrmEzPNdh/J/ZIdzFbxbZBgZm1T3BAjEKsGd82Y0GwpeU1BosiI1xug+TadfK1FP7CQBYMrKEa4ICuATsqLPNoXe8C0aitMOvQcmZczy7tUFfTiHTE7MhKYHpcAzoBx4KK/uTgki3erTt8UUxLyLKyX4+YTthU/JHSSSZavjXduXvx7YWMaw2r++hIGE+cO+uNDSLb09QsUHsAWYuu0dEEaLIcWnaldjCTmh9G74POx6tnJ8bWQhRhX6+ucwS+kJ8xHgQn2RHqpNrXVhUAmGT/o1Vg/0lg7sEFa2F1c5Wc3BLcLbTC/hZkUQdOnTekan5qzMxCxUopg8PFO5OsmBvjff8L+Ruf0+//tK+LETMAld8mt+OKrORnZISbBqdk2jJ279R59zF6uMemGF7U3+ya0XW9KQRY32HP2eXkcYzDLM8z21VFE3JXO4gDmIQuZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(36756003)(2616005)(2906002)(6506007)(508600001)(6666004)(66476007)(316002)(186003)(66556008)(66946007)(6916009)(44832011)(26005)(1076003)(8676002)(4326008)(6512007)(86362001)(52116002)(6486002)(5660300002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2pUbkFBNXZtckZNMVRCOENQTUVnSnRIc3AzTzB6emJHbk1PcTJPUnJCWVc4?=
 =?utf-8?B?WFNiQTI1dlBjNHFMRk1pbEdOSVZWTlJJbEpRVkF0NUoyMHAzS1RYcWxvWUF1?=
 =?utf-8?B?RXJMeUJqV2k4Umt4eXZVallUQUZpN20vRDd3UWtvRTNQWjJ6cGVYYm91YlVS?=
 =?utf-8?B?QXRVUThWUTlzVDdaTUIrMnVPd3Noc3RJSHc5bGZQWUFTS1l2MmZLaWNRckNN?=
 =?utf-8?B?UGEvN1k2dUVkUzl1SHF0UUVsbWNFKzlaUU9heTg5RElJWEMwQytxck41MHEz?=
 =?utf-8?B?aGhQcG02Umg0dTI0UFpqYlFkeDNTOVJZMDlLc3NCVkhOUy9WZFQ1aThmS1BM?=
 =?utf-8?B?UzljUjVwTDRRK01ZYkNOY1Zna2pwcXZmQ0hac0RhOStIT2tGMGpmMkxFVzN6?=
 =?utf-8?B?UW5TRlJmR3krYlE5UkdZd0dWY2ErQ3FkUkhoa01HZ0xRR1FPM1l4eFdUUy9o?=
 =?utf-8?B?OEFqTXgxbUt1MWdkRGc4MVp1ampJRm05ZDhQaW5uOU15WHJWYnZEdDdqSTJQ?=
 =?utf-8?B?RkFuK01uRjJEZVVqSmQ0VzZCU1lPc1E1a0w2NWRFWGxscklmYTZUYkRFa01N?=
 =?utf-8?B?SlB3ajhxZDRYT1JFZ2xYTXAxc2xxU004RGMyeEJaT1RSV2pjbmV6Tnp4ZjJx?=
 =?utf-8?B?YXU2Qit6SnZ0TUxGeTRJUVNsYkFHUUlLV2tNbFlPbVVtMndWN0s5UC9xNnBO?=
 =?utf-8?B?dTBjRTBDZE91SXIvOFMySkNlRW9xdmswVmV3UXRLZnJJVnZKc25EVWJPUHlJ?=
 =?utf-8?B?ZEp3WXZyZG5Zc3VMTzNrM3F0bUthTTNKcjVveG85dUdpMHhYT2Z0ZHlWSTcw?=
 =?utf-8?B?SHZvRmc1S3Ywc2lvRUNOUDRtQlhvK3lFd09MaXBzaXFwYzdHZnZPRC85NWFK?=
 =?utf-8?B?ZHc3VU90a0w1MS9TVCttbk5zbzBxRHlMdzYrSDlMUE9IUWtjcjRYSlB0cWow?=
 =?utf-8?B?amE1TE1UVkF0RHhWR0pCWVVwM1A5WkdZYUFwbmRUVnJpOWdzSWVmVXNKeFdI?=
 =?utf-8?B?Zy9PREM2NU5ENXFDaEYvSTA5eklZenZkRWx3U3NTQmttRFJPNmd4QjhUZi9S?=
 =?utf-8?B?dDV4aFNZK1JpRGZtN3hVemY3bmh0M1M2c3NsbktqYlp5UGl3ejlNNFcrWFNI?=
 =?utf-8?B?Y2lzNm9pSjBVVUtwaHhvU05NdlRqTXoxOTZPS0NOUnVYUTBHZW5FakVmckE4?=
 =?utf-8?B?NWt3TUl1cUdXM0xoT2k4UmdtbzcvOE9yb21jaE1tc0NCVlhiTmNaalZZOXBq?=
 =?utf-8?B?a3kxaFk1Ni9KNkNMczNDTlN5b0M1Wm8vWHp3d1lTWnBQNWcvY0ptR1dGLzNS?=
 =?utf-8?B?YkhqMU40NW10ZWdsU2tvUnVsdk5xeFRrR2g3ejY1WkxOenVPcFBKdGNaSDJq?=
 =?utf-8?B?aTJiVFJjSVhuMXBOYXJxT1NhcmRnYUhtdk1oL2k0Q3Y4MzFOSVhmZnJCaDdP?=
 =?utf-8?B?aENHVEdzU3VqWWV5cDN1UmZTdnFPZk94dzdWM3dDeVpacmJJWklrV01wZjFK?=
 =?utf-8?B?dFJXdXptdzJWU3E4R2JqSVB4MnIvazFWeVlMNDloTmZ2MFpkOGRwT3ZYWUI3?=
 =?utf-8?B?ZlpEbmt3NXM4YW1OczRhRlp4UDV0L1hxS1RsbEJ1N1ZmU2hBbGRSNWw5c3NQ?=
 =?utf-8?B?NHZIYSt3TWI3QnI2QzljU1JPVTgyRkJJZHR1V0RtYXF4b2w1MFhYMGY2eTBL?=
 =?utf-8?B?bnQ3aFpmOHBSVFZ5N0ZwVXdZdGpMSFlXNTFpcDQ5bk8yOTN1T3VGQmRhbXF0?=
 =?utf-8?B?ZmpOc1JKcGxWb1k0cUZqeHI2enBNWkdNVWVpTVp2ZkJBVGJzODRDQWVGbFFw?=
 =?utf-8?B?cUV2THZlbkpXYUE5MjJQZUsvelZWK0NaOG5ES21Bd0VyODdLTzJuNVU3WXBx?=
 =?utf-8?B?Sm9GK2RKUWhaNUt0bUJmWFFMQXFGYmVQSU02cnI5YjNzRmsvNmdjNUl5ZWNS?=
 =?utf-8?B?clJHcm1hRU1jb1R5Ty9LWFcrbS9aWXo5eE00aCtzZjJ5c3hQczUvWnh5cU9L?=
 =?utf-8?B?M2U2S042UnhBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09183cc7-8fe4-4299-9a92-08da0b4515ab
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 14:14:17.2125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eziNAN0wTDYIcPI0C3B+ldYs5EwHHdzQVOSlLhsOs0nRkOQLX4t+MCoxxP6PpMO0qHqIHV7G5rCDQ0EH310EBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2258
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10292
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=778 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210091
X-Proofpoint-GUID: 5_UQ5XJrjmYBFOXA8WU7ujWC1SaU04Mo
X-Proofpoint-ORIG-GUID: 5_UQ5XJrjmYBFOXA8WU7ujWC1SaU04Mo
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

This series addresses a few vCPU hotunplug related leaks (found with Valgrind).

v3:
- patch 4: create cpu_address_space_destroy() to free cpu_ases (Phillipe)
- patch 5: create <kvm, hvf>_destroy_vcpu_thread() to free xsave_buf (Phillipe)

v2: Create AccelOpsClass::destroy_vcpu_thread() for vcpu thread related cleanup
(Philippe)

Mark Kanda (5):
  accel: Introduce AccelOpsClass::destroy_vcpu_thread()
  softmmu/cpus: Free cpu->thread in generic_destroy_vcpu_thread()
  softmmu/cpus: Free cpu->halt_cond in generic_destroy_vcpu_thread()
  cpu: Free cpu->cpu_ases in cpu_address_space_destroy()
  i386/cpu: Free env->xsave_buf in KVM and HVF destory_vcpu_thread
    routines

 accel/accel-common.c              |  7 +++++++
 accel/hvf/hvf-accel-ops.c         | 10 ++++++++++
 accel/kvm/kvm-accel-ops.c         | 10 ++++++++++
 accel/qtest/qtest.c               |  1 +
 accel/tcg/tcg-accel-ops.c         |  1 +
 accel/xen/xen-all.c               |  1 +
 cpu.c                             |  1 +
 include/exec/cpu-common.h         |  7 +++++++
 include/sysemu/accel-ops.h        |  3 +++
 softmmu/cpus.c                    |  3 +++
 softmmu/physmem.c                 |  5 +++++
 target/i386/hax/hax-accel-ops.c   |  1 +
 target/i386/nvmm/nvmm-accel-ops.c |  1 +
 target/i386/whpx/whpx-accel-ops.c |  1 +
 14 files changed, 52 insertions(+)

-- 
2.27.0


