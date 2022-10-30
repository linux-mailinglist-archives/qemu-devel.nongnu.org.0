Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF310612BD5
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 18:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opBzt-0004ml-Ea; Sun, 30 Oct 2022 13:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opBzr-0004jU-Gi
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:21:19 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opBzp-0007en-SG
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:21:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so9485485wme.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 10:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+/VzpaejVQjJ/cUgfTKDuXhax0Mx0pmWIFZIIZVvCqU=;
 b=ON/uJE9QsUPhfyApLHAb56olepmaEXvtjdx6NwuqHXs017w63Ng/FrzXPfSHJbJIpp
 LtMhFDq3cjGkTAkZqZTYTFOP+VKYDGKQehVqJbkS0VTPAs7zMvTUHHwebHTG83nqccSl
 gEomn9tunqB5ZRWVVjtIdNvLAVhfs9rsJ39QkGbQJGZjw2OIR+h2F7TvGP/pEND/WoLJ
 OauOisQ0Ha5t7BOPJRMH06wmhfJaoYe+SR3shxK1c0dRiOSl6PWNyE9jS9k+f8oZAvWt
 IwHDAmloVkZxzAoTwThpgnOh+Tq82qQ3bePo1hTiDeLhPCTuJBTzTGYJbgj5H85a0g6k
 bmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+/VzpaejVQjJ/cUgfTKDuXhax0Mx0pmWIFZIIZVvCqU=;
 b=g6NB8f/spTJbOrruLeKYnh9FqGP/vhYpvLJAr+ZgE7diyVXGYhwaFiJYM1w3XDnDZ8
 iRbS1VCa01Fd2vYd//5Fxoa6oGRUf+x/7IJgsGq2cK65RJioVloHVVQAeuy0Okh+1HYd
 ORVHNB8Jze8uzaTpbnb/NOWO+bwjfgRh4lJ8X2y7NT3wBFieOUhm593KyMVbqOo+zyWE
 s1A390ovDi3mEkqskqWbvaC03jr10ppECCqkmjJv0DgDaY2iOfuYaEy1btYvlTTvOLrb
 SfQxJLYqatVx/LhRaD5nAY9Q4JzmVWmb9EVooo17wvqVMQDzY87m1z30VHW7zANscc7R
 RM9g==
X-Gm-Message-State: ACrzQf1lbKzPG0pxtK5HiDBkmYGOawA6XwmZrp6Afds44Wxj3siBO+7b
 v3jbpxPtpAe9oDUPCEyfFyfing==
X-Google-Smtp-Source: AMsMyM7oAL5OrPuhgGzkeq4HwTAjP3slArT40Y3je0AlUpg3Awe5frhZX12w3S7lOZVNFu41nE8j/A==
X-Received: by 2002:a05:600c:204c:b0:3cf:5bfd:82aa with SMTP id
 p12-20020a05600c204c00b003cf5bfd82aamr5692620wmg.118.1667150475206; 
 Sun, 30 Oct 2022 10:21:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003bfaba19a8fsm4979086wms.35.2022.10.30.10.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 10:21:14 -0700 (PDT)
Message-ID: <9ff5d8fe-f138-b1fc-3b7d-88fc46235c02@linaro.org>
Date: Sun, 30 Oct 2022 18:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] tcg/sparc: Remove support for sparc32plus
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-2-richard.henderson@linaro.org>
 <CAFEAcA-7q2fat9grNuTVcvzozTiCUBaPSSwqHLe02Dos7zFing@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-7q2fat9grNuTVcvzozTiCUBaPSSwqHLe02Dos7zFing@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/10/22 16:45, Peter Maydell wrote:
> On Mon, 17 Oct 2022 at 07:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Since 9b9c37c36439, we have only supported sparc64 cpus.
>> Debian and Gentoo now only support 64-bit sparc64 userland,
>> so it is time to drop the 32-bit sparc64 userland: sparc32plus.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc/tcg-target.h     |  11 ---
>>   tcg/tcg.c                  |  75 +----------------
>>   tcg/sparc/tcg-target.c.inc | 166 +++++++------------------------------
>>   3 files changed, 33 insertions(+), 219 deletions(-)
>>
>> diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
>> index c050763049..8655acdbe5 100644
>> --- a/tcg/sparc/tcg-target.h
>> +++ b/tcg/sparc/tcg-target.h
>> @@ -25,8 +25,6 @@
>>   #ifndef SPARC_TCG_TARGET_H
>>   #define SPARC_TCG_TARGET_H
>>
>> -#define TCG_TARGET_REG_BITS 64
> 
> Why do we delete this?

We get the default definition from include/tcg/tcg.h:

   58 /* Default target word size to pointer size.  */
   59 #ifndef TCG_TARGET_REG_BITS
   60 # if UINTPTR_MAX == UINT32_MAX
   61 #  define TCG_TARGET_REG_BITS 32
   62 # elif UINTPTR_MAX == UINT64_MAX
   63 #  define TCG_TARGET_REG_BITS 64


