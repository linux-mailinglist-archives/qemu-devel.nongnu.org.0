Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB56FE177
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:21:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlbE-0000Dj-FB; Wed, 10 May 2023 11:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlb9-0008Qj-J5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:19:23 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwlb6-0005OC-U5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:19:23 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d4so47057355e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731957; x=1686323957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90QlftO5JZdfNoS+trdrZIM27Zj4RgxcxWItyBP0Rf0=;
 b=yT4wrqmjW7rnP1ZdW71tOoZYCn1zNj03WixvLw5qKIDCeRoGrLvCkKQLuCbRAhDn8R
 nJIs0VV1Ss/NiA9o3sxqbAjXgmVKmgi4ttNlaBYx4Bvx8JhcH2dRRto5c1YViiSJdfso
 0jv+BORgDmerxxp5DLTX6epzxxecXObpwnx0VmLre7LgMCYXdo4ybAIFHv0xR0AyYN8E
 NEEJY8SYpjh6G59ln5DkwGBR3nM0Nl10EW2O7YrG8bSy3i1gFR0EITxb8bSogGkR2PcB
 jVRkiSbT2XC1v2yAVbOwggX0mPVRV1B8U62sPOwFrxHGXXnejtZnE8fzdVYY/6nflf45
 b1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731957; x=1686323957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90QlftO5JZdfNoS+trdrZIM27Zj4RgxcxWItyBP0Rf0=;
 b=ISV+DzoKM0ytSz2ERFz8C4ig82yx7UMvn0ceLS29presTFIk3QnWd2OApMLVMXRae1
 jHD4XLi4KY8EbC0Y9/GbXTAjRIYDPw8u+jllhj5p86YMEHNwckerOZoyedOfmnmI645h
 jb89+vPGHn74CVDaxwH/HTjHov/06an2iVwFdL8D/Y4ezYz6GRHhEqab9MTa3cl5EKcM
 s19LJkWAPNSTXBDsZmPRP71LtqYHCvY2niZGC+qUlheKzg891f2oMCtayiTJxR2bg2I4
 51wbFB3pB3VtBLDaoorII6Bm5EPsKfzxgMAkAgQpejpQIQOQluFuLf7iYbuW1NMWzRh9
 G3bQ==
X-Gm-Message-State: AC+VfDzQVjIUIBYtlKbkug+YBXi86f/3n1B1hJTssfh1mGyIWEBOLpA4
 sbNIduwhCE/9DB/EEoO5m/XWwQ==
X-Google-Smtp-Source: ACHHUZ6J7PnKFjzSf+lNY1d+2U3NzRYSixgGL8NGN2eb3V17ydmbi6uewNK3ShYpsZ7pzqRDltAP/w==
X-Received: by 2002:a05:600c:3646:b0:3f4:2215:6d6 with SMTP id
 y6-20020a05600c364600b003f4221506d6mr9715899wmq.33.1683731957327; 
 Wed, 10 May 2023 08:19:17 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c020700b003f42e008c8dsm3484072wmi.44.2023.05.10.08.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:19:16 -0700 (PDT)
Message-ID: <29933f33-46d5-52d4-5ea9-275e5520a537@linaro.org>
Date: Wed, 10 May 2023 17:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/5] disas: Move disas.c into the target-independent
 source set
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: anjo@rev.ng
References: <20230509163326.121090-1-richard.henderson@linaro.org>
 <20230509163326.121090-6-richard.henderson@linaro.org>
 <b62ab9a2-fad5-313f-518c-29626b0d57c3@redhat.com>
 <48f35197-1890-cfce-3535-9a8522f50523@linaro.org>
 <3d4e0154-99bf-da36-0d71-efe99d24ab72@redhat.com>
 <0d880358-4472-ca4e-edce-ada7b397ef94@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0d880358-4472-ca4e-edce-ada7b397ef94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/5/23 10:13, Richard Henderson wrote:
> On 5/10/23 09:10, Thomas Huth wrote:
>> On 10/05/2023 09.46, Richard Henderson wrote:
>>> On 5/10/23 07:53, Thomas Huth wrote:
>>>> On 09/05/2023 18.33, Richard Henderson wrote:
>>>>> From: Thomas Huth <thuth@redhat.com>
>>>>>
>>>>> By using target_words_bigendian() instead of an ifdef,
>>>>> we can build this code once.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> [rth: Type change done in a separate patch]
>>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> ---
>>>> ...
>>>>> diff --git a/disas/meson.build b/disas/meson.build
>>>>> index f40230c58f..2ae44691fa 100644
>>>>> --- a/disas/meson.build
>>>>> +++ b/disas/meson.build
>>>>> @@ -13,4 +13,5 @@ common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: 
>>>>> files('xtensa.c'))
>>>>>   common_ss.add(when: capstone, if_true: [files('capstone.c'), 
>>>>> capstone])
>>>>>   softmmu_ss.add(files('disas-mon.c'))
>>>>> -specific_ss.add(files('disas.c'), capstone)
>>>>> +common_ss.add(files('disas.c'), capstone)
>>>>
>>>> I guess you could drop the "capstone" here now since it is already 
>>>> added to common_ss now three lines earlier.
>>>
>>> I have a memory that it's required to get the include path for 
>>> <capstone.h> for "disas/capstone.h", for use by the target's 
>>> cpu_set_disas_info. Otherwise only common_ss files have access to the 
>>> include path.
>>
>> I only meant to remove it from the new 
>> "common_ss.add(files('disas.c')" line since it is already there in the 
>> "common_ss.add(when: capstone, if_true: [files('capstone.c'), 
>> capstone])" line ... I think you have to keep the 
>> "specific_ss.add(capstone)" line.
> 
> Oh, yes, duplicate within common_ss.  Removed.

What the final patch looks like?


