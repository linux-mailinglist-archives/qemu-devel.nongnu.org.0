Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ADF6A1A52
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 11:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVVJh-0002GP-Qg; Fri, 24 Feb 2023 05:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVJf-0002Fx-Sa
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 05:28:39 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVJe-0000Lc-7a
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 05:28:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l25so12999084wrb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 02:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yKAAdpm6bQTRP12zOuVjb/jL0qipq6fVznSYvUBB3U4=;
 b=BdBO8HrdXX86VZP+YM+Y8F7KavLir80t5yj0J0jotkNSqIc76Fl5it1OOKQn2bCk+o
 wIAVLzDCU8TiS/dUuJoQZSpuVw8ery7BZ5Tv9KUWUR7wc55/5Qyyda2dtqWgbqH6rvHa
 Zod33ys61QtZz+XutCGVuDegIb3juhhsujXIVvnulHLR+Zhl3Yzf2xxPSmLHAV72Rh3g
 aQ5WXIYrUhw3/xVZ6cICme8PNGOVBgQH/H5xc0/017PJVJxrA6a2ygW2a4h4IZKTB1oY
 8LDJCvcHccDs0s+FKWU0wBKseFBPqvWs8m6OL7BP863idt8VtfJEX7bKl8RCTeAoVtG/
 1yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yKAAdpm6bQTRP12zOuVjb/jL0qipq6fVznSYvUBB3U4=;
 b=hO34OBNR/mtHXUvhZ8Xw4TGoaOjMQzHyrP+xd4XIVh6SF+u7XWm7cnlcLqQoYji+sd
 ScGMDs4QMpaGk+kG4OcJjXsyWypz7IZJhI92sHHr/xoqnMLA9ooM8Jr14HDpP+aO1xJU
 l9NjVAYjHyJphAtqcf3FhXu5MTwh5keS1CWj/GB08AJKDVUIGGJn3LhUe+Ww04VkHBFN
 05d7n+VAUw8DwE9/aIUivrAo8tE6OevboUePSKDZkS3VPXFS6lE7STrJ04IfeShb+ySW
 Qh6C0TDvAe0k+PXo7Yt3yAobqmjeha1vNh1y5yn06kISZUw/OkEgJmQ31C4Ax7Cl4Sg4
 0r1A==
X-Gm-Message-State: AO0yUKUEfqZ3vq3gQO+7WKrwz072NfH91pFeb97IbubRL9VnMTQ+pivB
 uYFtFLcOPVSFrgGyoX1x/KoDiA==
X-Google-Smtp-Source: AK7set/2RsOd2juOjPoFKmhoEUK+FtRrZC1NUCiNq+is/gwrkzCTm96JRD0tKnuVr6J/hczCrGg0CQ==
X-Received: by 2002:a5d:4b46:0:b0:2c7:6a6c:c72a with SMTP id
 w6-20020a5d4b46000000b002c76a6cc72amr580082wrs.48.1677234516372; 
 Fri, 24 Feb 2023 02:28:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d51cb000000b002c5804b6afasm9554057wrv.67.2023.02.24.02.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 02:28:35 -0800 (PST)
Message-ID: <ff0a967d-7eca-82ec-40a3-1d9b476d025b@linaro.org>
Date: Fri, 24 Feb 2023 11:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
 <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
 <ada81122-40a3-3905-8241-3a31b3b59997@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ada81122-40a3-3905-8241-3a31b3b59997@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24/2/23 00:27, Richard Henderson wrote:
> On 2/23/23 13:22, Philippe Mathieu-Daudé wrote:
>> On 24/2/23 00:01, Richard Henderson wrote:
>>> On 2/22/23 01:01, Alex Bennée wrote:
>>>> This is a mandatory feature for Armv8.1 architectures but we don't
>>>> state the feature clearly in our emulation list. While checking verify
>>>> our cortex-a76 model matches up with the current TRM by breaking out
>>>> the long form isar into a more modern readable FIELD_DP code.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>   docs/system/arm/emulation.rst |  1 +
>>>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>>>   target/arm/cpu_tcg.c          |  2 +-
>>>>   3 files changed, 28 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/docs/system/arm/emulation.rst 
>>>> b/docs/system/arm/emulation.rst
>>>> index 2062d71261..2c4fde5eef 100644
>>>> --- a/docs/system/arm/emulation.rst
>>>> +++ b/docs/system/arm/emulation.rst
>>>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>>>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>>>   - FEAT_BTI (Branch Target Identification)
>>>> +- FEAT_CRC32 (CRC32 instruction)
>>>>   - FEAT_CSV2 (Cache speculation variant 2)
>>>>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>>>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>>> index 4066950da1..12e1a532ab 100644
>>>> --- a/target/arm/cpu64.c
>>>> +++ b/target/arm/cpu64.c
>>>> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>>>>   static void aarch64_a76_initfn(Object *obj)
>>>>   {
>>>>       ARMCPU *cpu = ARM_CPU(obj);
>>>> +    uint64_t t;
>>>> +    uint32_t u;
>>>>       cpu->dtb_compatible = "arm,cortex-a76";
>>>>       set_feature(&cpu->env, ARM_FEATURE_V8);
>>>> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>>>>       cpu->ctr = 0x8444C004;
>>>>       cpu->dcz_blocksize = 4;
>>>>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>>>> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
>>>> +
>>>> +    /* per r4p1 of the Cryptographic Extension TRM */
>>>> +    t = cpu->isar.id_aa64isar0;
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
>>
>> Maybe:
>>
>>          assert(t == 0x0000100010211120ull);
> 
> But why bother to break it out then?

To keep everybody happy :) For example Alex can grep which cores
implement FEAT_CRC32...

