Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D26343A9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxY3F-00034h-5p; Tue, 22 Nov 2022 13:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxY38-000341-2y
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:31:14 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxY36-0001iz-E8
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:31:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bs21so26039974wrb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RFvEcX49lgbF61KeKABPVYcz+x/UrN0CN8oY4ZQ10d8=;
 b=AeFINr7rsqT48Th6U3dGawM2xQxqnXx5gz2NtYZDZUWoc3ipfPYUKGrskyFNjWuk+S
 GhrK+8ks0iFY/3Mz9sXyw2UvnzD+wlBKmmqC0HWMbBb4c1Dl2VcbQOTJ+yMbKJNM781J
 aHS/fzHCsdiOMBCLGts2TOmkOZl4hQRfge+zPzyGrLBMVIEgWyO+EuqvWqhS0fQENxgR
 IRFpWWGhoOvAhfsbXx8ymgBvAMto9TPre/ZELXYxt4VdWgghQH4fyR5Bvt7QCAeVkoH1
 0CCBolHIJHmH6fjafhUV8VY33MQ28qq038U2ucCXHczvVzaaDEOukZyHpO69fSPCrqMt
 0yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RFvEcX49lgbF61KeKABPVYcz+x/UrN0CN8oY4ZQ10d8=;
 b=SxgP9547b/I4GBTtzfXQZC9VlKJJIDKN8INExLo6agxaiU7CliLAeZTskcrHI+nyXj
 XtmIt0isF5b9vEbGmw0Z+tZ71HOYepbNO/SMLR3TEOyi12oACnMijjil3EIxeI1USIio
 W9raojHoV6TKLx/+7jVMX+zH9A6AlShx0RzTWPcV9E0tYnxRcJ/CYXJsofl4NQnEzjfm
 vMD/L/X0HCrGQlcRFAfedIZHN4Y3tBIzBgMIcm+TxTp/MO2F2cmHQ3qp9acoyiK41c/k
 A/s1rO7Pw77hGCnfkFz28LBo5Hrp/2v4w3O6hnczczkzBf8aZWHmFQ8CO/hqdgVwqDX9
 Fbqw==
X-Gm-Message-State: ANoB5pnDfx3s2mDgoHz0zjhb801HYgyGVpURftCUNpBSrbph59C3w8au
 dInFEmTvFUEIAe12wSsT6lY3dw==
X-Google-Smtp-Source: AA0mqf5TJBBG2/euaSrkLxQDvAY2/l+sSmW/6MRLSFCTh8rN38eVQM0ZpySOPAnupONPx5oZcdPl6A==
X-Received: by 2002:a5d:4452:0:b0:241:d75c:469c with SMTP id
 x18-20020a5d4452000000b00241d75c469cmr6526738wrr.689.1669141869970; 
 Tue, 22 Nov 2022 10:31:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a1ccc02000000b003cf6e1df4a8sm17744939wmb.15.2022.11.22.10.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 10:31:09 -0800 (PST)
Message-ID: <7e7fc434-b82e-4007-ef5c-bf81beccc4a5@linaro.org>
Date: Tue, 22 Nov 2022 19:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 15/29] include/qemu/int128: Add vector type to
 Int128Alias
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-16-richard.henderson@linaro.org>
 <7927a474-d542-c84d-5cb7-7ddd5d19d7f4@linaro.org>
In-Reply-To: <7927a474-d542-c84d-5cb7-7ddd5d19d7f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/11/22 19:21, Philippe Mathieu-Daudé wrote:
> On 18/11/22 10:47, Richard Henderson wrote:
>> Adding a vector type will make it easier to handle i386
>> have_atomic16 via AVX.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/qemu/int128.h | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
>> index f62a46b48c..f29f90e6f4 100644
>> --- a/include/qemu/int128.h
>> +++ b/include/qemu/int128.h
>> @@ -479,16 +479,16 @@ static inline void bswap128s(Int128 *s)
>>   /*
>>    * When compiler supports a 128-bit type, define a combination of
>>    * a possible structure and the native types.  Ease parameter passing
>> - * via use of the transparent union extension.
>> + * via use of the transparent union extension.  Provide a vector type
>> + * for use in atomicity on some hosts.
>>    */
>> -#ifdef CONFIG_INT128
>>   typedef union {
>>       Int128 s;
>> +    uint64_t v __attribute__((vector_size(16)));
>> +#ifdef CONFIG_INT128
>>       __int128_t i;
>>       __uint128_t u;
>> -} Int128Alias __attribute__((transparent_union));
>> -#else
>> -typedef Int128 Int128Alias;
>>   #endif /* CONFIG_INT128 */
>> +} Int128Alias __attribute__((transparent_union));
>>   #endif /* INT128_H */
> 
> This triggers a warning with GCC:

Ah no, looking closer, even configured as ''--cc=gcc-12 --host-cc=gcc-12
--cxx=/bin/false', Clang got selected for ObjC, and this warning comes
from it:

Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
In file included from ../../ui/cocoa.m:36:
In file included from include/sysemu/sysemu.h:5:
In file included from include/qemu/timer.h:4:
In file included from include/qemu/bitops.h:16:
In file included from include/qemu/host-utils.h:35:

> include/qemu/int128.h:487:14: warning: alignment of field 'v' (128 bits) 
> does not match the alignment of the first field in transparent union; 
> transparent_union attribute ignored [-Wignored-attributes]
>      uint64_t v __attribute__((vector_size(16)));
>               ^
> include/qemu/int128.h:486:12: note: alignment of first field is 64 bits
>      Int128 s;
>             ^
> Meson:
> 
> Project version: 7.1.91
> C compiler for the host machine: gcc-12 (gcc 12.2.0 "gcc-12 (Homebrew 
> GCC 12.2.0) 12.2.0")
> C linker for the host machine: gcc-12 ld64 819.6
> Host machine cpu family: aarch64
> Host machine cpu: arm64

Objective-C compiler for the host machine: clang (clang 14.0.0)
Objective-C linker for the host machine: clang ld64 819.6

Regards,

Phil.

