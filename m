Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358BE59A2FC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:54:39 +0200 (CEST)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP6Cc-0007jr-CH
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1oP5ec-0001Ti-C2
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:19:33 -0400
Received: from mail-tycjpn01olkn2080f.outbound.protection.outlook.com
 ([2a01:111:f403:7010::80f]:50404
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1oP5eZ-0004H9-3j
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:19:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaYt66BI1EI7PPhPWpVVnWhXoyTeTWh9z5WfQ+2BU9INZvI2ollzBXnk8qsCN5WG67a/QXBGX1ZMT+alrwXZjdtF3VJgZe/LXXoRUAAyoihfsb/G7pwH1/6yb8kInUeU2qqeWsCqaOHKZXnoI8UOzFdDhGikRjHr28XooXO0iv/4HXksn0f8bhfLE4P9WpGVYy1huJ52OyArn6rB+cxu6uhwMsqWz5KINmNj6n3gJa3OeXr+kZDSeHkE9+XRiLY8KfN14pZebC4WDjh+LwXVs3rkqw5f0Tssy5cZl/0wWFvekz+VQ38Pyksbt+pe6j1BL0E79SFXkyVl/DFz49N+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IReQzsEj+WzrROuY9fjQNBeUROso4xWEiJ9xLy+PWIU=;
 b=CCRmiXMdvBlyURQpTH8gQu/12o44aCDPopPRANher4Enh+lOPORixKr6GkPySfIuXUKWqyff5eS47o9j4Q/u39tB+dMWHxwbRhV5rBSCOMPft5TS0mg4m575FWiLrbEa/X1P9rGB2G6ehXlaE9tZSUBf7NIhct6QdNQi28C4W4F4GEr8agvQVmNigPOS39DQCd8u5ZhyQLAMg0GuN1KEbiGAokEcT4ApzNH2uIGr792fmjy2E0Stjq3VwWxWDQoAL5uzwtZ5inXnzfRsxwCR4mb7W7jPBzx5MhuSUdLdt+hZl3kaD0RAudcHggXjBoTF4E1ktV1VK8El5RV938hRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IReQzsEj+WzrROuY9fjQNBeUROso4xWEiJ9xLy+PWIU=;
 b=LI2pjJsgmopNk8tO2amj9Cs7slHs5jWUcEyOhfKauMl58P+zJwwRAe/K9c1qwJ6sCz+d+qzHTBUgomkiaRKPmwsp3+ddfCqZwiFnUT/ozXfw7RQblnl+UEnMZOouiyyvGcgIg2YnedSyuvOxUKz9Gxq4Fjq1hccAYCQrQiQ1vVaf5MyIg/yflEa9/9jm9SlCjZIim1lZWoJ68VLmFe5QjVujz5KXgZKvQk6r95swqvqRPRm3+vhrflF8CtzQxR3qmICU8dZyKwrJWgNi1W0n1nLUz9UBpzYCGBCCznQ5rz2X1jyqMPftLgpeXzufrvdh/dGJVnu7/zxFKoQE8ukgCQ==
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:df::12)
 by TYYP286MB1100.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 17:14:18 +0000
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36]) by TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36%7]) with mapi id 15.20.5525.023; Fri, 19 Aug 2022
 17:14:18 +0000
Message-ID: <TYYP286MB143934B9795ED813B85FEE50C66C9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Date: Sat, 20 Aug 2022 01:14:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH v6 00/21] linux-user: Fix siginfo_t contents when jumping
 to non-readable pages
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, alistair.francis@wdc.com,
 alex.bennee@linaro.org
References: <20220819032615.884847-1-richard.henderson@linaro.org>
Content-Language: en-US
From: Vivian Wang <dramforever@live.com>
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TMN: [OmaXhk288bVPvRHTpuIY/DWv2tdrEVa5]
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:df::12)
X-Microsoft-Original-Message-ID: <169b8b20-e9df-062c-9952-6c1446fe8f5e@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5494a62-db1b-401a-d52c-08da82063f58
X-MS-TrafficTypeDiagnostic: TYYP286MB1100:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ewo27tT3f8005rcLL8fg87MwXdc4B0DMV/ybPLaISeK0+3qzba6NJgJCcOTPLECNb/rBJc1sRqGHJPTUYAxZ0ZYsQf8n3bb4sT8NmmrGxwv4bdjkKBYegqYiNpSWEM4yWjEAYMEw+NSdII6b8G2YU/viMcJoynxlusTNqL6azPdnU5Ah/YiV7zNnLn3ieKPWDbDrs9fHrsT6L5rxEOvkLtN5T2YK29m0oB2WxzwQ0g31CIKaNkVT3N1lvHUr32rzoUXpMSirvYbCoJ5zJflUctzm7Kv0KNbHMqC7LitkW+ZSJvAmDTMT8j/uXEz2WMf5NIaSnvgsyrPcVd/J3cUm8AGB/1ri1UWlCYjSV3rFuYGHW+Et4EuEv3MHlw1KyFZWLiuxcGuNxhLuY5gDnDEIdGsv8fjBu7RVKB9i8NzIT2A5l4z/Ir/RqMLSkPQYHIk30RCrOFzEW7XNJmq13T7fTUFPdF2aLP6AmiKh+2NG2H1auM/9SGp3H9kUcxUKrl25cBtuC77tDXgOvWwpIX0GtQ/HZEFRP9brZGj2nBrMET2trr6tV7lAtoi/gJaJEbNkXxhnqYsY1JI/HGVNxbgHTs6X713JfznQ5O21M1Pq95TXxTGeoajZsSuAK7PXmEx4D6f9/n+j8vReMCpLAIaWqpFPHoZNyjtUg4vhrCHcTKmD5PjavvyUNngsLklNk3vI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nkg2aSt0eE1xNzJmcUFJelZOc2pDWittVkdpeTJwM2xNZXZ2QWUrc0JUbFQ5?=
 =?utf-8?B?ejBMV29KK2VIdDQ3ZHozRzJhSW5nMmMzYnMwYXZvNUNOK3lkYTFzbi9EdDly?=
 =?utf-8?B?ZEtjQWFPWUJVYzZ2eklCNk1sRVI5TWpSakxMNFg4Z0MyemZiYm81YVNxRzd1?=
 =?utf-8?B?QTNQMGQ2bVpHQm5YVkxnWHpPNHU4d1FKN2lTcTlwZXVndG1QV1gxbUdMOGFD?=
 =?utf-8?B?cSs3R3U3UUdWQjhEekphZi94cGxZVWtYZDVVYUZTcnlQd1I3YmZzRWFmRnVT?=
 =?utf-8?B?RW9OakZHL2VLY2QrZWtjYU5nR1BMMjliMTg0VUIyb2NCOTc5ak1XSTBibHRi?=
 =?utf-8?B?ZlRXS1BIMTA0QytuSmFkQnJkNVQxTVB0MjZSY2hqK0lTTzI0b0tnQzg3Ry85?=
 =?utf-8?B?eUhqWmh1c2ZwZXJBMk93YjdSUG5PWUIyMzY2dHFzd2JOR21WN2FrNkhHa1Bk?=
 =?utf-8?B?YVBkZXZNMjFObUw2aTBXS3ZjT3Ixa1Z4YmdLV2wrZHFMN2VDUmdVNzZGdzNu?=
 =?utf-8?B?d3VBTHhzd2pzTjJVZnZkNkE4RkJ3M0ZDM0liQTFHVnpMMnJxZ05RZGJzYlA3?=
 =?utf-8?B?V1hJWnpUZ2ZWcUZyQ01kRkpobzl5ZFZVdFc4Rk0xaXBaSVBNTVJod3hOU2hi?=
 =?utf-8?B?Y1pPWGd3WkRIaUhGU0VCMkRrNHUvdEV5eVpYTm5LRStUM1BrZ1JKaTNhOXJB?=
 =?utf-8?B?WmNKU3dJUXhFMWVobUNHdWpIRGxrUzNWUTJIY3ViSWNmSHE3Y1ZmRG0zQjV2?=
 =?utf-8?B?STZWVzgyU2xpbnNhY0o0OERCOVcrcGJObXVReGY4TDJOOUhudzh4MERQSWQ4?=
 =?utf-8?B?bHBYQnpsNXB2ODVoN2x0dE90SmRTcXRIWFUrVmhQclRlUXp3T0luYWg0VDJM?=
 =?utf-8?B?SXhoQzcvdURnTGF0UFdqS0FYZldyVDY3MXdyRDJ1aEtvSk5ES0Nsb1JPSUlN?=
 =?utf-8?B?SS81RjQ4cXpUVEtHODA3TFpIWWNXVDFRSDlPUHNlMktMZnZCMVZBTjJlTkN5?=
 =?utf-8?B?TnRCUEV0RWFCcUNSSlBaUUFLWW81UWZrck5oTU4ralVYSnZkSlZOWnAvdWNH?=
 =?utf-8?B?WDF0OWhlL3NndTc2YnB4WlFLd0VFOHRRbkN1aS9jSUY4QTJqazZtVXVpclVj?=
 =?utf-8?B?dm5qOXV3YVdLcHBua09QbkFvQVU5MzExNy9xQk9FVHMzcm1vbmxpK2MveUVh?=
 =?utf-8?B?dlBqNldwcTdUNmhIbklocEhpVGxVT3VrNjVTbkRJSHZzSkRKOWlpT0NJYWtM?=
 =?utf-8?B?WEFpR3p6YVJIOEhpR3dHRjlucUNwY255bVRYS1VSVlhzTFhZeHE2Tnd3R3B5?=
 =?utf-8?B?NVBRbitxK1RtM0J6cG1ocFIwR0VBS3dsTTZjWlVDUzcrVHVWS3h6SEI0bmJa?=
 =?utf-8?B?S0FwTy96NStKb0hVY1J3eU9CSDJ6SkZyQXJuOFFpK0xxQUhGMFhPczV0SjBB?=
 =?utf-8?B?cW1MeUhVckRQcjY4Z3JZV3kycWZqYUs0Z3pUNE83UlVlbEVMRmxGWHorQ05T?=
 =?utf-8?B?RGxmb00xOGJFWFNPaXpYa1UzSGZKaWFQUjhJQkwyNHJHYXdIQlJ3a25tYXdq?=
 =?utf-8?B?RVpWa0tEOXpPSkppdDJlUW1qanNJNWtnTzQ3N0VVc09ZbnZyUmpyVzFwMEdw?=
 =?utf-8?B?OE9PUlg0bnlVeElQbC84dlFsTEdQeGYzMnE2U1VWWHpZbGIvTVN1NFVXa3FE?=
 =?utf-8?B?M2VNYTMxWHpjd25jVDV6YThSSkZhb2pwS1NneVBoVlN5bERpUERMU3BRPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b5494a62-db1b-401a-d52c-08da82063f58
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 17:14:18.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1100
Received-SPF: pass client-ip=2a01:111:f403:7010::80f;
 envelope-from=dramforever@live.com;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/19/22 11:25, Richard Henderson wrote:
> Hi Ilya,
>
> After adding support for riscv (similar to s390x, in that we can
> find the total insn length from the first couple of bits, so, easy),
> I find that the test case doesn't work without all of the other
> changes for PROT_EXEC, including the translator_ld changes.
>
> Other changes from your v5:
>   - mprotect invalidates tbs.  The test case is riscv, with a
>     4-byte insn at offset 0xffe, which was chained to from the
>     insn at offset 0xffa.  The fact that the 0xffe tb was not
>     invalidated meant that we chained to it and re-executed
>     without revalidating page protections.
>
>   - rewrote the test framework to be agnostic of page size, which
>     reduces some of the repetition.  I ran into trouble with the
>     riscv linker, which relaxed the segment such that .align+.org
>     wasn't actually honored.  This new form doesn't require the
>     test bytes to be aligned in the binary.
>
>
> r~
I've confirmed that this fixes #1155

Tested-by: Vivian Wang <dramforever@live.com>

> Ilya Leoshkevich (4):
>   linux-user: Clear translations and tb_jmp_cache on mprotect()
>   accel/tcg: Introduce is_same_page()
>   target/s390x: Make translator stop before the end of a page
>   target/i386: Make translator stop before the end of a page
>
> Richard Henderson (17):
>   linux-user/arm: Mark the commpage executable
>   linux-user/hppa: Allocate page zero as a commpage
>   linux-user/x86_64: Allocate vsyscall page as a commpage
>   linux-user: Honor PT_GNU_STACK
>   tests/tcg/i386: Move smc_code2 to an executable section
>   accel/tcg: Properly implement get_page_addr_code for user-only
>   accel/tcg: Unlock mmap_lock after longjmp
>   accel/tcg: Make tb_htable_lookup static
>   accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
>   accel/tcg: Use probe_access_internal for softmmu
>     get_page_addr_code_hostp
>   accel/tcg: Add nofault parameter to get_page_addr_code_hostp
>   accel/tcg: Raise PROT_EXEC exception early
>   accel/tcg: Remove translator_ldsw
>   accel/tcg: Add pc and host_pc params to gen_intermediate_code
>   accel/tcg: Add fast path for translator_ld*
>   target/riscv: Add MAX_INSN_LEN and insn_len
>   target/riscv: Make translator stop before the end of a page
>
>  include/elf.h                     |   1 +
>  include/exec/cpu-common.h         |   1 +
>  include/exec/exec-all.h           |  87 ++++++------------
>  include/exec/translator.h         |  96 +++++++++++++-------
>  linux-user/arm/target_cpu.h       |   4 +-
>  linux-user/qemu.h                 |   1 +
>  accel/tcg/cpu-exec.c              | 134 ++++++++++++++--------------
>  accel/tcg/cputlb.c                |  93 ++++++--------------
>  accel/tcg/plugin-gen.c            |   4 +-
>  accel/tcg/translate-all.c         |  29 +++---
>  accel/tcg/translator.c            | 136 +++++++++++++++++++++-------
>  accel/tcg/user-exec.c             |  18 +++-
>  linux-user/elfload.c              |  82 +++++++++++++++--
>  linux-user/mmap.c                 |   8 ++
>  softmmu/physmem.c                 |  12 +++
>  target/alpha/translate.c          |   5 +-
>  target/arm/translate.c            |   5 +-
>  target/avr/translate.c            |   5 +-
>  target/cris/translate.c           |   5 +-
>  target/hexagon/translate.c        |   6 +-
>  target/hppa/translate.c           |   5 +-
>  target/i386/tcg/translate.c       |  32 ++++++-
>  target/loongarch/translate.c      |   6 +-
>  target/m68k/translate.c           |   5 +-
>  target/microblaze/translate.c     |   5 +-
>  target/mips/tcg/translate.c       |   5 +-
>  target/nios2/translate.c          |   5 +-
>  target/openrisc/translate.c       |   6 +-
>  target/ppc/translate.c            |   5 +-
>  target/riscv/translate.c          |  32 +++++--
>  target/rx/translate.c             |   5 +-
>  target/s390x/tcg/translate.c      |  20 +++--
>  target/sh4/translate.c            |   5 +-
>  target/sparc/translate.c          |   5 +-
>  target/tricore/translate.c        |   6 +-
>  target/xtensa/translate.c         |   6 +-
>  tests/tcg/i386/test-i386.c        |   2 +-
>  tests/tcg/riscv64/noexec.c        |  79 +++++++++++++++++
>  tests/tcg/s390x/noexec.c          | 106 ++++++++++++++++++++++
>  tests/tcg/x86_64/noexec.c         |  75 ++++++++++++++++
>  tests/tcg/multiarch/noexec.c.inc  | 141 ++++++++++++++++++++++++++++++
>  tests/tcg/riscv64/Makefile.target |   1 +
>  tests/tcg/s390x/Makefile.target   |   1 +
>  tests/tcg/x86_64/Makefile.target  |   3 +-
>  44 files changed, 951 insertions(+), 342 deletions(-)
>  create mode 100644 tests/tcg/riscv64/noexec.c
>  create mode 100644 tests/tcg/s390x/noexec.c
>  create mode 100644 tests/tcg/x86_64/noexec.c
>  create mode 100644 tests/tcg/multiarch/noexec.c.inc
>

