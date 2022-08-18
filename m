Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D29459899D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 19:05:49 +0200 (CEST)
Received: from localhost ([::1]:38954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOixo-0001a3-98
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 13:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1oOisc-0007L5-FZ; Thu, 18 Aug 2022 13:00:26 -0400
Received: from mail-os0jpn01olkn20812.outbound.protection.outlook.com
 ([2a01:111:f403:700c::812]:56128
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dramforever@live.com>)
 id 1oOisY-0006u7-Hz; Thu, 18 Aug 2022 13:00:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilXSWBk9Ri5DEpXqlmuQp1ttOgYR9A0FIZABuFVv8Fa7LFJG9xq1SPR2SsS+RymMCdG5jkmH6HyKgfr3pW7XIq9+I+F+hb0AJiLXkkd7PtViNzrBq4HD2nKWTuEfrzaltTzHKytKwqJ2SDhOCqUHf0b5joGDNwMCaOueDeQLCZ4/mo3ocF68QcGXr4fvvr82j3+vggDJptfCtMctmcS3MJnO05joidAdqXkFkBxCCx4YDzbiMnJI0F3FEWKh5goP6fHFdBPduhViLJzmQjAHG3b6C8yW74dzG2UTCuGQB6GicAjAgkW9DXUSRgrQQLd50QE3AVrchbpUPBvXep/V1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLVR5hzd5k41rfG/2+dXSb5puRBAKhvk3xadD31Uuu8=;
 b=GsSI1sppzg8rdOjtsbfs5m6L8ehnVhGO+Q8icFC62CjFNBpbEN+sXSS1SmfPIQwVPLVMnAjPCIK7H27qVj1L8TTeMYApOHUiM2pHqw4yOWVCcRMfStSp3wWXVyOyQqMRnL7IroxtugKJyb6fTFLTF9X6AnszRrMd633CjdS1FVbeX20X4rKb6geWa1OS/pOfOL+5kYJiP07gRZHBOQP3KAEeXHRk6HSPA347taVoZZWsH+dixZTbtGhLO7qI4hyUgv5cL7Cql/w6D6oaZQvyGB96gET/0y1iFa2syaVEu9GKB7MaS1CXa9ST6XOO0RC1Oe5Tn/zlapu3D8ZLFFGUIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLVR5hzd5k41rfG/2+dXSb5puRBAKhvk3xadD31Uuu8=;
 b=aVdkDuxJybGBZxV2+u/gCxrf9EgM5DtWpIoT4m3F6oNWG2OaivTmlr+38EPAS38wt1eeMNWfBNjG5ww9IBZWE/QsOTH5E82acliQPPnt5kpkJ8kESVDQUXIunQ/usbwI8TSpgk5e7cZ0B5RiBv3RWilAb6jc1SfZQt/px0yj/+ec1HfUzbC3hrCZv0TPj3n28wCJs/zyejKAhY/RIfZU8i9l6kQ35FxceMOjEnJ8NpRLR3OmYtnu8+JXa93pxBkXOrsZoutjlTiaGDz6hpN1j3uqxxERbiud+7+iSSOey/uFkvui0+bMx9gSpPEbEIhhbI+SnGZITzsKHgoc4fCluw==
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:df::12)
 by OSZP286MB0837.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 16:55:11 +0000
Received: from TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36]) by TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ed1f:7f05:2a4a:5d36%5]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 16:55:11 +0000
Content-Type: multipart/alternative;
 boundary="------------BAeEjHHz0OkeH7Y9SUUMpXb7"
Message-ID: <TYYP286MB1439C85770DC0C4AA39550BAC66D9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Date: Fri, 19 Aug 2022 00:55:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
From: Vivian Wang <dramforever@live.com>
Subject: Re: [PATCH v5 0/4] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220817150506.592862-1-iii@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20220817150506.592862-1-iii@linux.ibm.com>
X-TMN: [p8Fiinf25wN7GdrtH8ksWbXR0X26it5a]
X-ClientProxiedBy: SGBP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::15)
 To TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:df::12)
X-Microsoft-Original-Message-ID: <1dfdc506-1a3a-3224-f9c9-384da7ae287c@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f2ba764-a8ef-4a16-6d85-08da813a69ce
X-MS-TrafficTypeDiagnostic: OSZP286MB0837:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LSYQdj0hsKXvaoiEULw5mje0eX/CLKGBFMEcVeyhCxJSd3K8PVOhdQd07tdysg2wH7WefRKCksExy54sfLzUZOQlN30zIuRhW6VjHKEm19JN/xcAnVoLC9YvuJjWvli/0/21B6CIVXU1s/BuqZy7+LWCUthFPlramIuusaShhd/i1MXE0OMsLLvAgrC2WlTE8V8S7IY5JtB5dsxu6oZesdfjFBXKUl350dgdwkfVJKrgngbueB0GaZ9L9D7ctBgmbVuIPXZOFLuIwhC7m+6flTOL+3Kwx8SMGbjZP0dgJMm2AYIuCoOzZxEeYOTzfC+U41er5QKwRo1E6NKb41pw4s1bmzD3+ICdQXXD8MNx204WkDIZxib9GWqrYMwQT8ryfsNfPv+NFBwaIjNhgASyn6SDXVbDs5tPy0tdxZcZuphj4xfZHR4Z4cKC8uYYEwr1Ru+4QzuqCP/WyGFVfwN4KW9GNcbmeDc5sbEe6aHh6qEMM6GmisQSkDLsW3XaYbd1sUAsD5hH8uFas7pNPJe70DcNnqHg721YLC1cypNAcF/A5TSkPfTkqtZMVHmHkiAjNA6+2O1wi6V6Szp3LBCreN/hQw9OZ1SXyOzuyqVLszr3JfXrSs0yf0Tyh7o0KlkaOd/c488sEYhid2KASRhNBp0+ZJyRfstktDo0qo4HUl1VpTXkkrGnfrKG5rivBa5
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXMxRmYrQVNBcnVibTFDQjdjcWZKL0NuV09haTZyVWxSZ3RzamM0RnJjR0pJ?=
 =?utf-8?B?cVZkY0VFM0VwQWhKUzN3Z0ZjeG5Rd3NLUGtvWU9FVzA3VlZtWG0zV2xXSUlY?=
 =?utf-8?B?VTFPejRVUktubG83UmVNZWU1THYydHB1cHN0c0hVZnE5VW5KeWJIdmwzVzJp?=
 =?utf-8?B?ZzJjbm5GNXhYZ3pEMHJVcXlaRVI2SHRBb0UvUDFOMFR3WjJsUzgyOG53bnBV?=
 =?utf-8?B?NmgzeHZoMExNYkhkb29jVXZJRjFXUVVvdmx0R2NZTEVjRzlaWXFXNHlucTRJ?=
 =?utf-8?B?QitscjJUV1RXWGNVckdGSTg0OXBVRXo0eHZGUG15OEVkUENQOS9yVFhqdzIr?=
 =?utf-8?B?L1lSWVJLdm9DeXhkc0U5NEticWUvL2VtbDNvYmJwNDQxd0tvNlVyeURhbHZY?=
 =?utf-8?B?ZXN4TXUxK1FrTDExdm1zWk1SSENtY2lER1kvYzRHeFlkYnhCcTVaZEhTd2sz?=
 =?utf-8?B?elpnS0lxd1NNd1Nxc3lBSEZ2bEREWFNNSEtTUXVPcVlEZEQycWJ3UHI2RExW?=
 =?utf-8?B?a3JNcGhqZ3BieUZDSktUU05odzgzYjJrbVc3YUJ3em9NOXFkVUIrc3Q4RXpF?=
 =?utf-8?B?aEdiVTBESGl4WlRxTUZKcUxrbWtGYTFXeUxqc1VES25neFg5MmE3cjNYZFkz?=
 =?utf-8?B?d2Y0d1Q0ZTY0WE9YMTNqZXhRcXE5L3c0SkhYQlRxVHhFREhKK3hRSEUvSDN1?=
 =?utf-8?B?TG5FK3VxbWNaNUlPZ0p5bnZZd1RxVjNuUmV1dUNSM3JJZ1F5bk5paVkwUnpN?=
 =?utf-8?B?dFRyOGJFbFRYR2gvN2t0MmVIV0tDOE9OR2tobUhIdW9XWFBianlwSWllVm9o?=
 =?utf-8?B?NWNOZHVFZnE2dWljV2dnTW81NVhjVjVkT3BxZ0FvM1htcE9JY2xQWWQzZjFi?=
 =?utf-8?B?WkN6VWNaaVRDNzhPTXZraDhldHdqVVJQQ2tBTjFzYWVtL2hwNVdJOExuckVa?=
 =?utf-8?B?QWVMQlE0ckRlQWVUVmw0VFdNak84aUdZdUxzNUxDeS9Cc1UzSkp2VUg5aGNF?=
 =?utf-8?B?THYyRk9nYlEvd0ZHRlpGVnF4WFJpWGJPS0dSUGJPV2NZRkVtRjVqSzFES0JX?=
 =?utf-8?B?Vmpob3FBbmd1amJKejgzYTViamFDeU9oNUhERHF0RDhPU2xBZzV0VUdmQXpj?=
 =?utf-8?B?b2RVWThQakRzWnd0U0I3Nnl3TU8wQnpVMjNNdE5LUGtNTWNjKzNaRWwweXhF?=
 =?utf-8?B?UzA0M3dFRllvUkc2SnJJVVlsUGF1ejlVeXNZS2pPL1NKTW9zcmltOFkvVXlY?=
 =?utf-8?B?cG52QmQ2L3c3VGd3MjlYdzhSZm5rcEc4eGFhRjNmeW91MmxhRVBiZkpIYVNh?=
 =?utf-8?B?c1Z5bEc0aUduc2pRTlkvVzRyUEFWY3ZSRUdUY3o2VkduUTZjeDljS3BWT2Fw?=
 =?utf-8?B?bXFxV1MycDZJNld5WGJzT1lNT1ZFcUZmM0tQM2habTRPejA2Nk11UUk4OGxT?=
 =?utf-8?B?SEhRd0FaTXhBMnorL1hOcTB1bEhFdG1ucGlCY2JFZ3VVZisxNkdMcElHUXV2?=
 =?utf-8?B?NUtDUWVnTysydi9xaVZVanNtY2lWbnNmanVWMEI3a3MyYjBCaHgzV3NTMkt5?=
 =?utf-8?B?TFFVbHp0M21FSExxMEJPaUdGMm9ZSk96SDJzS2RxbDRPMzB2c3puZVZtNkNR?=
 =?utf-8?B?d1VrRFFlZHl6d0d6VjRYQzRIUkc4czBodlM2c0dyNGFEOHhPVFkyYU5yejNm?=
 =?utf-8?B?QzR1bWxLRzJFdkVnWmpUS2ovU3VLMndEM1pXeGsydTllLzBvczc4bmJRPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2ba764-a8ef-4a16-6d85-08da813a69ce
X-MS-Exchange-CrossTenant-AuthSource: TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 16:55:11.2380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB0837
Received-SPF: pass client-ip=2a01:111:f403:700c::812;
 envelope-from=dramforever@live.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_MUA_MOZILLA=2.309,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--------------BAeEjHHz0OkeH7Y9SUUMpXb7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/17/22 23:05, Ilya Leoshkevich wrote:
> Hi,
>
> I noticed that when we get a SEGV due to jumping to non-readable
> memory, sometimes si_addr and program counter in siginfo_t are slightly
> off. I tracked this down to the assumption that translators stop before
> the end of a page, while in reality they may stop right after it.

Hi,

Could this be related to issue 1155 [1]? On RISC-V, I'm getting
incorrect [m|s]tval/[m|s]epc combinations for page faults in system
emulation and incorrect si_addr and program counter on SIGSEGV in user
emulation. Since it seems to only affect instructions that cross page
boundaries, and RISC-V also has variable length instructions, it seems
that I've run into the same problem as what is fixed here.

Could this fix be extended be extended to targets/riscv?

dram

[1]: https://gitlab.com/qemu-project/qemu/-/issues/1155

> Patch 1 fixes an invalidation issue, which may prevent SEGV from
> happening altogether.
> Patches 2-3 fix the main issue on x86_64 and s390x. Many other
> architectures have fixed-size instructions and are not affected.
> Patch 4 adds tests.
>
> Note: this series depends on [1].
>
> Best regards,
> Ilya
>
> v1: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00822.html
> v1 -> v2: Fix individual translators instead of translator_loop
>           (Peter).
>
> v2: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01079.html
> v2 -> v3: Peek at the next instruction on s390x (Richard).
>           Undo more on i386 (Richard).
>           Check PAGE_EXEC, not PAGE_READ (Peter, Richard).
>
> v3: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01306.html
> v3 -> v4: Improve the commit message in patch 1 to better reflect what
>           exactly is being fixed there.
>           Factor out the is_same_page() patch (Richard).
>           Do not touch the common code in the i386 fix (Richard).
>
> v4: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01747.html
> v4 -> v5: Drop patch 2.
>           Use a different fix for the invalidation issue based on
>           discussion with Richard [2].
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02472.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02556.html
>
> Ilya Leoshkevich (4):
>   linux-user: Clear tb_jmp_cache on mprotect()
>   target/s390x: Make translator stop before the end of a page
>   target/i386: Make translator stop before the end of a page
>   tests/tcg: Test siginfo_t contents when jumping to non-readable pages
>
>  linux-user/mmap.c                |  14 +++
>  target/i386/tcg/translate.c      |  25 +++++-
>  target/s390x/tcg/translate.c     |  15 +++-
>  tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
>  tests/tcg/s390x/Makefile.target  |   1 +
>  tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
>  tests/tcg/x86_64/Makefile.target |   3 +-
>  tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
>  8 files changed, 427 insertions(+), 6 deletions(-)
>  create mode 100644 tests/tcg/multiarch/noexec.h
>  create mode 100644 tests/tcg/s390x/noexec.c
>  create mode 100644 tests/tcg/x86_64/noexec.c
>
--------------BAeEjHHz0OkeH7Y9SUUMpXb7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/17/22 23:05, Ilya Leoshkevich
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220817150506.592862-1-iii@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Hi,

I noticed that when we get a SEGV due to jumping to non-readable
memory, sometimes si_addr and program counter in siginfo_t are slightly
off. I tracked this down to the assumption that translators stop before
the end of a page, while in reality they may stop right after it.
</pre>
    </blockquote>
    <p>Hi,<br>
    </p>
    <p>Could this be related to issue 1155 [1]? On RISC-V, I'm getting
      incorrect [m|s]tval/[m|s]epc combinations for page faults in
      system emulation and incorrect si_addr and program counter on
      SIGSEGV in user emulation. Since it seems to only affect
      instructions that cross page boundaries, and RISC-V also has
      variable length instructions, it seems that I've run into the same
      problem as what is fixed here.</p>
    <p>Could this fix be extended be extended to targets/riscv?</p>
    <p>dram<br>
    </p>
    <pre>[1]: <a class="moz-txt-link-freetext" href="https://gitlab.com/qemu-project/qemu/-/issues/1155">https://gitlab.com/qemu-project/qemu/-/issues/1155</a></pre>
    <blockquote type="cite" cite="mid:20220817150506.592862-1-iii@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Patch 1 fixes an invalidation issue, which may prevent SEGV from
happening altogether.
Patches 2-3 fix the main issue on x86_64 and s390x. Many other
architectures have fixed-size instructions and are not affected.
Patch 4 adds tests.

Note: this series depends on [1].

Best regards,
Ilya

v1: <a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00822.html">https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00822.html</a>
v1 -&gt; v2: Fix individual translators instead of translator_loop
          (Peter).

v2: <a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01079.html">https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01079.html</a>
v2 -&gt; v3: Peek at the next instruction on s390x (Richard).
          Undo more on i386 (Richard).
          Check PAGE_EXEC, not PAGE_READ (Peter, Richard).

v3: <a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01306.html">https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01306.html</a>
v3 -&gt; v4: Improve the commit message in patch 1 to better reflect what
          exactly is being fixed there.
          Factor out the is_same_page() patch (Richard).
          Do not touch the common code in the i386 fix (Richard).

v4: <a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01747.html">https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01747.html</a>
v4 -&gt; v5: Drop patch 2.
          Use a different fix for the invalidation issue based on
          discussion with Richard [2].

[1] <a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02472.html">https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02472.html</a>
[2] <a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02556.html">https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02556.html</a>

Ilya Leoshkevich (4):
  linux-user: Clear tb_jmp_cache on mprotect()
  target/s390x: Make translator stop before the end of a page
  target/i386: Make translator stop before the end of a page
  tests/tcg: Test siginfo_t contents when jumping to non-readable pages

 linux-user/mmap.c                |  14 +++
 target/i386/tcg/translate.c      |  25 +++++-
 target/s390x/tcg/translate.c     |  15 +++-
 tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   3 +-
 tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
 8 files changed, 427 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/multiarch/noexec.h
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c

</pre>
    </blockquote>
  </body>
</html>

--------------BAeEjHHz0OkeH7Y9SUUMpXb7--

