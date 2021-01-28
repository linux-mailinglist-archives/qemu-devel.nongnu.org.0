Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445A8307AFF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:32:54 +0100 (CET)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AE1-0005Eo-Ar
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l5ABM-0004D9-2v; Thu, 28 Jan 2021 11:30:08 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l5ABF-0006sn-HU; Thu, 28 Jan 2021 11:30:07 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SG8d8J060822;
 Thu, 28 Jan 2021 16:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=NQv7w9fHeUtCSlFUOE1b+Rtiq/39rWJui6co38u4p00=;
 b=XwQHGY35MPSRZxP0pEOa9kHDfoU2eix1IQX93bkj0h53Pt/736CRoSiy/vwrkBaqqPQZ
 cEuLV97bhWf4XuW+e+Wiupvwv6mq2T8861iRI1QVwbfrgfAAJrULHlDAl6exb3VFt6S3
 bkfWUnr07JkW9uBEZWMfOrSyDLyK0yYnFzcrnKct/+bnfKsZqyGTcMLZlBiNlABlH/tG
 bCZ7cJaC4o7XqYvzXxkUJukOuUDRLsjasGqEXlpwAYkeBrM8HgSs6lcm4ejg9cdoisR9
 G99p1/Gx5mea/nH9C+50NxtavdH8j1c2T4L0IwdT0aMcywowPGGXrf2v5e0zExcK7Fvv cQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 368brkvx7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 16:29:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SGAHtc132868;
 Thu, 28 Jan 2021 16:27:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by userp3030.oracle.com with ESMTP id 368wr0jc89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 16:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhVxeVs4y9t/UgI+8JTasWgR0qFhhp+2gTyzz4duiDUq3+G7L3xXCDihlJk0hysHprLSyS4+a/wG/TrWR1KDi0jjLV/Kd1zCBeJcDL9//EsBd7W7K92V84MQ0MRhnfvWnctIYoRzXfLBSzVqGIGgf/A4xHRH/GljYDqHpq2/oaFxAv2mI1q68uiSMvUIBcWehxr7AggzFos0qB4eVOlhOKdECz9EZoRfJBvdHz+nbt8elWGgmPgMv8WUnRifOd2a91miYFnTHp5hjXzdrHxT8B+H3Vc8Q0LF9KwGu4pwUzHwEohFWkFujKvdhwn8lbyf5m3MA4Il6JTipMlC/JA6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQv7w9fHeUtCSlFUOE1b+Rtiq/39rWJui6co38u4p00=;
 b=XGaMO0bp7Q91LHEl9F7M4n91+i1Oy5QAzHCobeAHvqBQAbv576dUbEBtBQWpMJ0zq5TGi2rxvLTzNdwfS+sKZ4bpLWysgc2hDYK0cDrur6BwKKfoMTPq6PF/J4QsLiTtmc/92O/Il+NaW7yKThV3yIg6ZsZX7/YVmBu4fZTomXY/dTHttfjKad31AItte5SCATSIOZW+XVaHOZwkSg1ItpbXy1WovHn9YzdXiScl7eQ2ICOzjIXNuSQkYYukqKE5L48Xgtv2nh3rvFJkGuwswDGW9IYQdF8PAgYF+FtF3YS73DAOI7Q8TB9E2xZHpnjerQCyhSNRtQiMXWVNqAoJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQv7w9fHeUtCSlFUOE1b+Rtiq/39rWJui6co38u4p00=;
 b=GESlUR2VsdzMVgkNKxtnpoIK3qlrX51l8GSkVGNFxQ+fl0ar6DIrb6nq5+uH+hViqCsLRDvGFoCK/p5xEh6Z+qyk/IuSmmmZ6TXfMIXfHhojkm9Yp24a4wSVrigre/T4oq4SIUIsztk2DMKd0mz/BeHCyC3Msze2PASNFuOoRkw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM6PR10MB3818.namprd10.prod.outlook.com (2603:10b6:5:1ff::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17; Thu, 28 Jan 2021 16:27:49 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4%5]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 16:27:49 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
In-Reply-To: <20210128161417.3726358-1-philmd@redhat.com>
References: <20210128161417.3726358-1-philmd@redhat.com>
Date: Thu, 28 Jan 2021 16:27:42 +0000
Message-ID: <m2eei5uiv5.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DB8P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::27) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB8P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 16:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8f9f26f-e7f1-44f7-11a2-08d8c3a9a72b
X-MS-TrafficTypeDiagnostic: DM6PR10MB3818:
X-Microsoft-Antispam-PRVS: <DM6PR10MB3818A953CDD34D8A96B47AF3F4BA9@DM6PR10MB3818.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9sskLlENzDXoRDwGwwGyx/ClRvCrqNWsiIt0+0/hkTC+RO6auYXlF/TW/ntveCvqJke9X786GXgQ44ChOBeHKjaIlE+TfKxikDCoFp4Fy66iRVm03vpTO87xrxWSEOIfMs5rIwe4w3ZOVejViZnf6QQ8cmfHh4OSuAs7yktkgdAFFrxWOWt5NMkdf3Sjnu+eElW5C1i247Fbng4zx3c7S0wt8wWN66vCHDyW0uxfipmDT8xkGPSGRggWxOWZQ3LHL+JcZH+1ioh21dzuNlOjrEdygT0zOySk5dH1Y+1gHSElXj9poSxgt+kZMnmbALCZs5SHTSf5Q1yZ8PuBO8/cL9/y0piSYJb8ZoO99GbLK4a3ePDOOCwPiBQpxuJo82ewFcpEJtTGhVG3WxfbLqtTBEQ/wtUx+ACdvClEZWqjw+2mtXcVrDrQHwtYgmUgbmFvVEaTN4E/Otu7AIbp4hUb1FvvVGA4S6pZnHttbJvzwXhqP3dbq2g1LVe1wKZwaMm36AMUpmMNsjQgKVhQQ9/aQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(376002)(366004)(136003)(16526019)(6666004)(52116002)(7696005)(8936002)(86362001)(8886007)(186003)(66476007)(66556008)(66946007)(36756003)(55016002)(2616005)(956004)(26005)(54906003)(44832011)(8676002)(2906002)(4326008)(83380400001)(316002)(5660300002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0hQZHFzYkpHQzNSaVB4cnVuQ1FLV0JsVGVKVzBCSSsySmVsdjZNazF3bld6?=
 =?utf-8?B?MHovZGl5K1pQc3docERWY2NhMXBZSDBzUThXQUkxNGFBa0YvakE1VWpWZE5q?=
 =?utf-8?B?NWdLbUkrTXNsUE5WU1FieHZPTTdza2hySUNRNE1naWpOc25DWmh6Z0lhZlFt?=
 =?utf-8?B?WVV5aWZjQUplZWxOT0UwMGgyTG5ZUUZxY3pjbVRqRTE3bk1BQysyd2YySlFJ?=
 =?utf-8?B?bVVlVnRyTEtBSWZJcEZ1ZUtGdUIrRkFIVW5GTGYzZWM4WC9wUmhNZXJhNlN0?=
 =?utf-8?B?T2RZaUt0TDltRHdQUUZ1aHg5eUhNZ0xNb2J3cVFsMHJlTWtzeDhKWENVMERC?=
 =?utf-8?B?QzZNM2xuYjRCcEljMHUreXh3K3dBaVBoRkZnQzgyd2RiRFFhN3l0N0lNMDVT?=
 =?utf-8?B?am1Yd0lJK3NiM1RNT2gxTmdaZmpPcDI4VG0rL0RKc0RYWUFlRkR0S3hybVlP?=
 =?utf-8?B?U3RnRXBrejlWZXFrNjNDelpTK0dLTmRBamFjei9FMnRia3ZmekNOZTVENk5i?=
 =?utf-8?B?RXUxTTNWSThZQ0NpS3crODBwdzk5VUVXclhSeFVOcm1uQlFaV2tuY3BsaXBX?=
 =?utf-8?B?bXMwUmpOTWNxQ1hOcWplV2FtdmdvaWhPYnhzcjlRaGlsUnZMQ09yVWRXb0d4?=
 =?utf-8?B?MTVTVURqa1FhTVUxZklNQXJKcytJdkVaZllveUF5aVVoYVNVS3g3N2cvNGsz?=
 =?utf-8?B?dUlnalpCK3lDSFZlTzZnR1YvazFjUnlUS2g4Y3p4Y2dLNFNhOFduaC9kQzVY?=
 =?utf-8?B?RFdiU2NYU05pdCt1VHc2VGxkakU5dDN0UUhMd0YrN2lvUEcra1QwWXBXeXZQ?=
 =?utf-8?B?aVcxWXIwVUREL3VaeFRCa09OWC93WmtZamszUGMzb0F0ZklyU1RVSlVNR2ZF?=
 =?utf-8?B?Y0paTDNVcjZxem04TWhjQVJ0bmhIVWpCOHJEREg5ZnpoSjZyZnE2WWcyVFZ5?=
 =?utf-8?B?NnRSbTJGQUNZeU5tNmtxaXg4T3BQV1lvcmw4NGZCTE9ndm55bWdOa2RUN05q?=
 =?utf-8?B?QWdwU0J4SVhvL1l1dVR0QlN6bnRQTm0xN2gxYkJzaHk5a3NWdHRIWFgyR0xt?=
 =?utf-8?B?UFZ1RDlBbUxIRHdzd3RKTS8rdlpycnlxNk9wSE9RSnUwQlVUZlV4ZUMvR3Ro?=
 =?utf-8?B?SWs1S0lFdTNsS29mL2RyclFrVy9Wbk9CazBOaFF4SjIwNkRoMkc4T2NqcGl1?=
 =?utf-8?B?aXhoSmQ4U3VZWkZucS9rN2s0YlQ5UE1ESmhEQi9RYWFscXhaa1FKeVU1d3N0?=
 =?utf-8?B?Nklzb25reVdSZXJNdEJSSSt2WFl4TjZIS0JYRncxK0xFMHVETTM5UWlCU1Zy?=
 =?utf-8?B?Slc0UlIvdkw4U1RBMHhNaEJZNUk1V1U1cGtRcnhrOUxXL0JMbUphSXdMTTZB?=
 =?utf-8?B?dGU4b0UzTVRIa2dlQ1A1VVZUWTZGcVZFTFBNZmhhVzdhNnBvc05vTExBbGhm?=
 =?utf-8?Q?B07+cZZE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f9f26f-e7f1-44f7-11a2-08d8c3a9a72b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 16:27:49.6520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jBs9mrcQGD8aJkYmnPeGiNBwbUqsPkFNW6cmX4Wi63U61KKIYsz4R2NNIbnFbnZ1HQXyL4oxkJOpwMv6dp8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3818
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280081
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=darren.kenny@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-01-28 at 17:14:17 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> Alexander reported an issue in gic_get_current_cpu() using the
> fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
> doing:
>
>   $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=3Dqtest =
-qtest stdio
>   [I 1611849440.651452] OPENED
>   [R +0.242498] readb 0xf03ff000
>   hw/intc/arm_gic.c:63:29: runtime error: member access within null point=
er of type 'CPUState' (aka 'struct CPUState')
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic=
.c:63:29 in
>   AddressSanitizer:DEADLYSIGNAL
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D=3D3719691=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0=
000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
>   =3D=3D3719691=3D=3DThe signal is caused by a READ memory access.
>       #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
>       #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
>       #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
>       #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu=
/memory.c:464:9
>       #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552=
:18
>       #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:=
1426:16
>       #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1=
449:9
>       #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:=
23
>       #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
>       #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875=
:18
>       #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489=
:18
>       #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
>       #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
>       #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5
>
> current_cpu is NULL because QTest accelerator does not use CPU.
>
> Fix by skipping the check and returning the first CPU index when
> QTest accelerator is used, similarly to commit c781a2cc423
> ("hw/i386/vmport: Allow QTest use without crashing").
>
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  hw/intc/arm_gic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index af41e2fb448..c33b1c8c4bc 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -28,6 +28,7 @@
>  #include "qemu/module.h"
>  #include "trace.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/qtest.h"
> =20
>  /* #define DEBUG_GIC */
> =20
> @@ -57,7 +58,7 @@ static const uint8_t gic_id_gicv2[] =3D {
> =20
>  static inline int gic_get_current_cpu(GICState *s)
>  {
> -    if (s->num_cpu > 1) {
> +    if (!qtest_enabled() && s->num_cpu > 1) {
>          return current_cpu->cpu_index;
>      }
>      return 0;
> --=20
> 2.26.2

