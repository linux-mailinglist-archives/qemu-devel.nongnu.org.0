Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC066D36CB
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 11:59:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piuT2-0005Zg-66; Sun, 02 Apr 2023 05:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1piuT0-0005ZY-4r
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 05:57:42 -0400
Received: from mail-sgaapc01olkn20817.outbound.protection.outlook.com
 ([2a01:111:f400:feab::817]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1piuSy-0001fC-05
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 05:57:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYZ8gX/FLhEqD0YECJ34VNm7LiB+JL3BQUXWwzAivYgl7gPhSffeIxXh7WbQKLtPA4yIZtl88jzjt/v8h8GR2BRvhKwUDobdA6/do00ao4dS6b3yBKKdSHI40U6y5MRbAnUUAJKM594/424B2eEJbPAN9gMiKc3WxjYedwYJ4zGeRP94Z3qlsphCyoP7y94obfRfQXy4q/XG+3iD7gq20gK83m4UFT2etvHGtSoJEOFDNXdGWUE5bvjaLPN74xyhwUqY38uXAeS+kCvEZf54ORnVgiqsrNGAHHRbZHlymd87DVhC1lUVuvoLYcFS3na6AjbkRBrdzCKbSOaj74gnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvDi78l0xnIiI4j1eYf0iSwAdbn6tYVR0MQu3rJLL2k=;
 b=BoAUrGcvdKJj3CcA8hozNLMmEX4pU33aJGrcoQrPhpxCBkMe9KY8mLSp1PgYuKdivXdchW9hp5gxYu7o4GWWlqtXcDrwomVk4BFFo32ZzJ5JRzm9ezED7CjDUPa+ap4uEJcEpmI5VzsSBQT/EGpIXj20dEbPErpzk2IsULhkbAPNYiZEyetPravbc2A+XB/M/8M/uvQ/nglUhokcja4yvhGngmp3DZB1+L6CqRuIzwl6nvJ7P1fV+LS9s3EbyN1QRLCpLTccKzo9zUC490XHTkfvjxkNoNpQFeg6ZzN3tBkPqLvak8rVabXXQBFjNSWRukA7BU7rCuoxfYoYZ4L5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TYZPR06MB4635.apcprd06.prod.outlook.com (2603:1096:400:126::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Sun, 2 Apr
 2023 09:57:32 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6254.029; Sun, 2 Apr 2023
 09:57:32 +0000
Message-ID: <TYZPR06MB5418EC5B3EB13310002E025F9D8D9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Date: Sun, 2 Apr 2023 18:57:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/4] util: Add thread-safe qemu_strerror() function
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Yohei Kojima <y-koj@outlook.jp>
References: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
From: Yohei Kojima <y-koj@outlook.jp>
In-Reply-To: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [R00EFJFO4LaFB2NyThyibKGr3ah/bLXqLrulfx2f5f+xf8spinJG4BLnASEvwYBjoVUian5B65c=]
X-ClientProxiedBy: TYWP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::17) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <260f15bf-cab6-f10d-f4e3-12c015856af0@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TYZPR06MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: ece7caa4-a152-4290-bb62-08db3360ad9e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PauYKpb4VSqn0qDLQNmacAQV0MeRu9OGp8Zad5hK4FrSiBaeM5qR7N4d6KBPElGb9tB4TaQOPhjpMcCPjvVpXOIMQ8VqexDLhtjOlRccsDPvuQuwOIqkQbap/GNtIgVA4Ns83b4a+dFsu31wlZA0f87ps7MhcHoDgzfjfdsHgOz+yqNVbzRWFdzl7xeaR/gU+EDiepulIaFSsPM1ZOLABdK9dAcHrlEwMwEl+v90NqcUbYeSBAS39I2C9p36BXAsNEWZS9v3ySBK5D3hssQo6WNO+A+R0770qAf5o/n1IMbos0ll0nWac7aWWWsZrshV8MkMdri9AyVFV+g1/15LcgvIJniuoOf4BE78uN2Y7a9TWVbRncmXUw3fqOYAcdswTEtLp3SsGeFGCLY+dlPtO9u5mhRIl23RxYMv1mxJSvBsf4zTQ+04Mvo136zJ5FI9R5BDpImOB6DGm/7WTuDT8Ry1dSz5SLrsGbgMvCr8XgYWgXj7P8JgxPQUSfTszh7PQioudTKdVmT40blA+50ARXFPobhcMcZd7ADk4RDZkBa+ZEdnheHwu8ckVI07YEmyd/HXqnKln8VStA58x9ROiAC5Cx/KtfiHcQ/nFtnzMIVMQiBtTQla4rT3yashXEFJRhORad3+kyWumJEK1umSPQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2FZRFRxM3RJWFppd3AxRnFGblNLQWN5REhpMWQza25UL2pSQWowTEtrNXRZ?=
 =?utf-8?B?RW9seTdCRTY5KzlFTnVabHVOSHZ6NVJraXl1MlV5bUdkNFN2NmZGZkgvVmlk?=
 =?utf-8?B?N2NtVlcycVZmNmE4QXRnUTdJWHRvNjlualJ5N0dzQUJ4K3k2ZUM4OFFLNExX?=
 =?utf-8?B?Q2dRWkhkUVpKcFdnczBvbDd2M1hPYzNkWEp6NE82ZXlPRnBJM2d5QXFGWFVX?=
 =?utf-8?B?OTNZV0ZCWnNLa0UyazFNZytzSmdLU3BOYzBjMFVObHExSEMzZ0tJTmlHZk1I?=
 =?utf-8?B?R1dTS3UzcStCMlB6T0VIL0FOVjZBZ3ovZ3JyZnVyNDF5bzlBdHhQODVEWm1M?=
 =?utf-8?B?T1hQVnVoVGNERXhVeFVvRVhXRHpvUVdvRzFmL0dyLzg4aUNvbEQ4M2ZuTWRJ?=
 =?utf-8?B?U1hTakFIZjBMQ1FnOU52Qm0zRklKZ1JYa21RQWlEWU94aVVuU0pGSFN5bjZB?=
 =?utf-8?B?cnpYbVphRWpiVm9oTURha01FaDVobWlSRkVzbDVMSGw0bk5QbmdoS3l4SXZO?=
 =?utf-8?B?ZWNkNVNWc0o3YVFoZjdZUGNvUjl2c0k2bHNibzExcTR1bWd5SkR5ZzJPb2hh?=
 =?utf-8?B?eW8xMHo5blkzcE5RMGNwdUdJdUpWZFdCQndNMTkvb2dhZVpONHFnMVZURGpM?=
 =?utf-8?B?TG8wZlpMaDBRdVB4aUFUYWgyTHp0ekZmYWxMV1hOY1U5bTQzSDBFelFJVXc4?=
 =?utf-8?B?Yy9FQlhxU0dSUVg0Zms1UUV5ck1ZY0ZZNzZhR25ORmFLZmF5VWlZNm1nc0dK?=
 =?utf-8?B?M0JEa3l3WkR3cVIvRFI5bWZ3STZGemNSTXNjT1VDeWg5eUhCMExpRHRJbVk0?=
 =?utf-8?B?VUxhSGQwMEpFV2hKZFAzMjArNFByZ05pbkQ1RUpTVVFLTHJRWGk0MGk0KzhX?=
 =?utf-8?B?WUUxUFRTQm51ZUhXb3hxb1RQT1Q2aUd0TUM0UlZ3cUNaZmlPU2RUbkRNL1pP?=
 =?utf-8?B?M2FaNzczcFdmOCtYNkxsRVhQM2M1LzJoOHBpZ0xPd3dDc1NCZkVlRDhEOENp?=
 =?utf-8?B?MXhDRW00WHdmZFBXb3N4MHByaWNZQlFuVHExSzVmTkZvcm5mNlpTY1VDV3dV?=
 =?utf-8?B?V3F6UVZLTmxOd0tWVFAvaDNyQlhPcE9iRUxJNXloZnY3OVlVSG42bjRVdXh5?=
 =?utf-8?B?eEY2NExaYzFoVExsR2ZQRENUS1JkcjFJaWpaYjl4TEk3YVcyc1RFVDNaNGZU?=
 =?utf-8?B?TVVLbTN2OHRUYVBRNStUUzFsVFJRRXNENXNldi82RGx0RlBQS1BvMmFZbVRw?=
 =?utf-8?B?Umk5QzErWmF2S3poTkxLYmpZRGE1MXJ5bG9DOU1KbFc5NDFiRVVrZEJQdFFJ?=
 =?utf-8?B?bzdwVEhwVHRMaG41SVBrUXp2RTFmUTRXQjdHcmlEU1dnUERWZGZrMy9jemhk?=
 =?utf-8?B?eXR2bXRCSml4eGd5QThvTHBkY0hCb0p1UkJRS2RYYVNWbkpPZkdwcXdDbDZa?=
 =?utf-8?B?OFo2Uk02NzRLejcxMVFsaFR4NW14bE93OVFvOUNrdm5FZWU1Q3Z0amhUZUR1?=
 =?utf-8?B?N25JVXhjSSthVDcwQTNQcjRlNXJYLy9CMW1TZ2VVcDN3ZmQyYjQvdnhROEpz?=
 =?utf-8?B?TDRLcFBYSjA0VkdnS1NEOWU3aHo0c2RjYWkydVdBZnZHd016NzcyMDhWaXZh?=
 =?utf-8?B?S25rVkZpWUlsd3JaRnFzSzZvcUVqY3JXY2hxcEZodHpxdmFPb2xNZG8yZG83?=
 =?utf-8?B?NFdyWkZGeEV3Yzk2WWdFak8yWHl2bkFwVk44bzU5UUNCUVgybFZHdmlRPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ece7caa4-a152-4290-bb62-08db3360ad9e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 09:57:32.7285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4635
Received-SPF: pass client-ip=2a01:111:f400:feab::817;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I explain why I did not add "Fixes:" line while it is advised to add
in the previous review. It is because this patch series solves the
issue partially, not completely. There are many more files that
includes `strerror()` call, but changing all of them will result in
the huge patch series that is hard to merge.

In short, fixes line is not added to avoid closing and reopening the
partially fixed issue. The patch series is incomplete because the
complete patch series will be very large.

On 2023/03/31 2:07, Yohei Kojima wrote:
> This patch series adds qemu_strerror() function, which is thread-safe
> version of the libc strerror(). The first patch introduces the
> qemu_strerror() function, and the second patch replaces strerror()
> function in linux-user/* with qemu_strerror() function.
> 
> The difference between this patch series are:
>   1. Add the following patches
>     accel: replace strerror() function to the thread safe qemu_strerror()
>     target/i386: replace strerror() function to the thread safe
>   2. Add `#include "qemu/cutils.h"` line to linux-user/elfload.c
>   3. Fix qemu_strerror() to follow the QEMU coding style
> 
> The following lines are same to the cover letter in the previous
> version.
> 
> Because it involves thread safety, qemu_strerror() should be tested
> carefully. But before adding tests, I want to ask (1) will this patch be
> acceptable to QEMU project after adding tests, (2) where and how
> qemu_strerror() should be tested.
> 
> (1) means that: is my approach too complicated to solve potential
> thread-unsafe implementation of strerror()? Although strerror() is not
> guaranteed to be thread-safe, glibc implements thread-safe strerror().
> We have to consider the balance between maintenance costs and potential
> risks.
> 
> (2) means that: is tests/unit/test-cutils.c a good place for tests?
> Because the behavior of qemu_strerror() is changed by the feature test
> macros, the tests should be run with different test macros, hopefully
> in different OSs.
> 
> Note that strerror_r() function called by qemu_strerror() has
> different return types between architectures because of the historical
> reason. qemu_strerror() handles both the newer POSIX strerror() and the
> older POSIX strerror().
> 
> All tests except for skipped ones are passed in my environment (x86_64
> linux).
> 
> Yohei Kojima (4):
>   util: Add thread-safe qemu_strerror() function
>   linux-user: replace strerror() function to the thread safe
>     qemu_strerror()
>   accel: replace strerror() function to the thread safe qemu_strerror()
>   target/i386: replace strerror() function to the thread safe
>     qemu_strerror()
> 
>  accel/kvm/kvm-all.c               | 32 +++++++++++---------
>  accel/tcg/cputlb.c                |  3 +-
>  accel/tcg/perf.c                  |  7 +++--
>  include/qemu/cutils.h             | 20 +++++++++++++
>  linux-user/elfload.c              |  6 ++--
>  linux-user/main.c                 |  5 ++--
>  linux-user/syscall.c              |  2 +-
>  target/i386/kvm/kvm.c             | 49 ++++++++++++++++---------------
>  target/i386/kvm/xen-emu.c         |  7 +++--
>  target/i386/nvmm/nvmm-accel-ops.c |  2 +-
>  target/i386/sev.c                 |  5 ++--
>  target/i386/whpx/whpx-accel-ops.c |  2 +-
>  util/cutils.c                     | 49 +++++++++++++++++++++++++++++++
>  13 files changed, 136 insertions(+), 53 deletions(-)
> 

