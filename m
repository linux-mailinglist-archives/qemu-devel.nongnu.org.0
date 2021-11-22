Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD37459493
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 19:16:23 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpDra-0006Uv-1m
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 13:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpDpu-0005Vg-J8
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:14:38 -0500
Received: from [2a00:1450:4864:20::32a] (port=35776
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpDps-0005My-IP
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 13:14:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so17622721wme.0
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 10:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yXeG9GNhttoFVxymAHI/IVlUht39In7WngPnjuTEAh4=;
 b=MOmFyZcEmzX+wsiUTDwC5KSeBm5qqWIMghtNDTHnJddWYFITJffsAsQKShEzJ8OVKJ
 7d59OllATH32Tgml0PRYgd0rQOejatfPww2DZe1KOehfsvmD83Sa6sWHy1sWsKlTHYcZ
 umTHUY/yYVxynlMHoavlTRnEGJcwu1YPFu1ivh4bWzNPU/xRIY89kquQ7yOLUtanN91/
 JE4pZe18paGxJKSMT1hBsqD03jCohgNQnXKonHPjbNhbyTfDf4kPEssUFYhYlslE7ATV
 offVTHj50rXMnyxBoHTgpicOGW0soy1Pt93oNuy9kNeWPEQYXXjzBSlZvTFEhJpuodeF
 na1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yXeG9GNhttoFVxymAHI/IVlUht39In7WngPnjuTEAh4=;
 b=pCRIJTxx1v1RLugfOeBTft3tjFlEKQ4hxOLN7bZBru1tm/8EIzIfBIHP5ees6qQHbC
 JeHcPafxR+yHjcaKqTbv7WSXgGCwXO75QnNZfY60nZT417hONM/v910Af6UFvbB6HiuW
 A0czUDqsTB5kI14MS5CyZ6911hxfctQnaFUKQaW8mYABU+1r0kGA4AZ6ShbZ+Qt6vc0G
 THVwI3bQQVpJyhTNcOeSXtTkmRvmKIPr01GyLurqhFMl76qU6hQB1+vojVEeEpkgdAnE
 EO9w/uBIwXY7uullRfyFK6nMzyNFlNkuhKoKhYI1W60alxYmL20P9JgpOmH584toqDLp
 UTyg==
X-Gm-Message-State: AOAM532frNQYWUa9luVi9jGEloDhGWU1rwzCrU8MxNlVH0HvTJDs022q
 12bMjPRDjQPMHI4wKrDhmHygSx3huk0ftWExWrg=
X-Google-Smtp-Source: ABdhPJwdPVbRHD6IoAFv3Y0fa66GwWZNt2KhQyNaR5cdX9LIchrJQ67bVtEXpvj1KevsHk5EQ//zjA==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr32185276wmd.32.1637604874831; 
 Mon, 22 Nov 2021 10:14:34 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id f8sm21770230wmf.2.2021.11.22.10.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 10:14:34 -0800 (PST)
Subject: Re: [PULL 0/1] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211122134342.660953-1-peter.maydell@linaro.org>
 <CAFEAcA_f6pYLNigkEpYWAEJCEsySqJOARH+e8OmftAFj+iCCeg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a26d3fd2-0124-64be-595b-e39a5347d840@linaro.org>
Date: Mon, 22 Nov 2021 19:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_f6pYLNigkEpYWAEJCEsySqJOARH+e8OmftAFj+iCCeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 11/22/21 7:06 PM, Peter Maydell wrote:
> On Mon, 22 Nov 2021 at 13:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Just one patch for rc2, a revert.
>>
>> -- PMM
>>
>> The following changes since commit 49aaac3548bc5a4632a14de939d5312b28dc1ba2:
>>
>>    Merge tag 'linux-user-for-6.2-pull-request' of git://github.com/vivier/qemu into staging (2021-11-22 10:33:13 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211122
>>
>> for you to fetch changes up to 4825eaae4fdd56fba0febdfbdd7bf9684ae3ee0d:
>>
>>    Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2" (2021-11-22 13:41:48 +0000)
>>
>> ----------------------------------------------------------------
>> target-arm queue:
>>   * revert SMCCC/PSCI change, as it regresses some usecases for some boards
> 
> Since this hasn't been applied yet I'll reroll it to add Eric's
> "don't bump the ITS version fields" patch. (But if you get here
> first that's fine too.)

Gitlab has been dreadfully slow this evening, but it's applied now.


r~


