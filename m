Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F367322C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIP4b-00042p-Jk; Thu, 19 Jan 2023 02:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIP4Z-000427-15
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:10:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIP4W-0001lR-C0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:10:54 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so550078wms.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mfGrruK8nilb3QcyxSk4e6VXknYwMjLnsxyzt8RpGAA=;
 b=EY6ya9rCvFE0fQSmFJHIGrbwHx24ASXtPxXhCRQ8VEDu5Y3UUu+cewc3kkDEWhi0nv
 +nDPE+vnnw8Y2DjcQjVYT3guyquYdW7vis6FxGCORG1bZc2FQm+l8tX+rdHCYf0/t1dI
 /AqK5sfpGPjvtEXqykf3C8SJfiWIw5NL/GR+GfsvhxrodslZ2k7L3ZOVnfvfiNTClJwE
 mM5CW23OsSGDJoy2+kzbyB+EwVlOHUq8Vo59oSL4aC5P6Drz91iaUs3ucG75U4NTfHl7
 p80yxotTHZ53aE5LIYdjwdIQpvys5jdLSyrNT04v7qW8bjmCBMi5noQnCRVK1MmsBRC/
 CKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mfGrruK8nilb3QcyxSk4e6VXknYwMjLnsxyzt8RpGAA=;
 b=votxfWHh0nDZf/QaagvAtanMAqiRhsFg0Rsu9ZwmVpNG/dKWKoP5DAoJyQI+k2pv45
 gdxsT4vJxjCqLWJkaefAQv2jeYhzijQn/BgumABr1bkNUA8Tq+UcKf0R10MqClngs2N4
 asYzYy6TnomtDKOKvlCEVC/HyEXtgy6L5W0vduiQz4Gkqu5JSeGSL/IZ1Kiu0M/R7Y7v
 50jeGW1EI/1TDLXHcDErnUL1nqJP7TMhUObS31qI+HqzHy1IDZ4AdGOScrJkatL0sbQy
 MYCaEBn41z6PKDA+K+tNDgfjGuRtfE7ZaUdL48KeNaoskqIMWkgtHG8UY9UaVgxuUTTM
 jIGQ==
X-Gm-Message-State: AFqh2ko3XODBzR8wu/rv+UK9UIZ61NVRcuP0ODIOEoCPeL8rsDR2/y0z
 jscQb/AiGfwQCN8BLM/fraG5Ow==
X-Google-Smtp-Source: AMrXdXsfg1qktCF/uCLKdG3s++8+XGVPWdyZlMaZGxeM37iCrcDByoN2/cBPx4DnzdiaZg05MtVGIw==
X-Received: by 2002:a05:600c:1695:b0:3db:12b:5103 with SMTP id
 k21-20020a05600c169500b003db012b5103mr9597988wmn.5.1674112250400; 
 Wed, 18 Jan 2023 23:10:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c314a00b003db0659c454sm4902782wmo.32.2023.01.18.23.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:10:50 -0800 (PST)
Message-ID: <48021cf0-914a-d186-4464-0ae65d7501e6@linaro.org>
Date: Thu, 19 Jan 2023 08:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
 <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org> <871qnrcz31.fsf@suse.de>
 <040a9b0e-0e86-311a-a045-00a7c16ab819@linaro.org>
In-Reply-To: <040a9b0e-0e86-311a-a045-00a7c16ab819@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/1/23 08:05, Philippe Mathieu-Daudé wrote:
> On 18/1/23 22:28, Fabiano Rosas wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>>> These are the already reviewed patches from the first half of my
>>>> previous series:
>>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>>
>>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>>> that are still being hashed out in the other series.
>>>>
>>>> For the build _with_ TCG, this should behave the same as master.
>>>>
>>>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>>>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
>>>
>>> $ git am
>>> 20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
>>> Applying: target/arm: Introduce aarch64_set_svcr
>>> $ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
>>> Applying: target/arm: rename handle_semihosting to 
>>> tcg_handle_semihosting
>>> Applying: target/arm: wrap psci call with tcg_enabled
>>> Applying: target/arm: wrap call to aarch64_sve_change_el in 
>>> tcg_enabled()
>>> Applying: target/arm: Move PC alignment check
>>> Applying: target/arm: Move cpregs code out of cpu.h
>>> Applying: target/arm: Move define_debug_regs() to cpregs.c
>>> error: target/arm/cpregs.c: does not exist in index
>>> Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c
>>>
>>> I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of
>>> https://github.com/stefanberger/qemu-tpm into staging"), what am I 
>>> missing?
>>
>> How did you fetch the series? You are missing patch 06. Maybe it is too
>> big for the method you used?
> 
> Actually the tool warned about patch 6 missing, but I didn't notice:
> 
> $ b4 am 20230118193518.26433-1-farosas@suse.de
> Grabbing thread from 
> lore.kernel.org/all/20230118193518.26433-1-farosas%40suse.de/t.mbox.gz
> Analyzing 20 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
...
>    ✓ [PATCH 5/20] target/arm: Move cpregs code out of cpu.h
>      ✓ Signed: DKIM/suse.de
>    ERROR: missing [6/20]!
>    ✓ [PATCH 7/20] target/arm: Move define_debug_regs() to cpregs.c
>      ✓ Signed: DKIM/suse.de
...
> ---
> Total patches: 19
> ---
> WARNING: Thread incomplete!
> 
> Indeed patch 6 is missing:
> https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/

I could find it here:
https://marc.info/?l=qemu-arm&m=167407090423121


