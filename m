Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85C6507FE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7AMy-0004qV-Iw; Mon, 19 Dec 2022 02:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7AMk-0004oG-6O
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:15:15 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7AMi-0000y4-6L
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:15:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so8149764wmh.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 23:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pBIKGHudOlBXWPzszlFxQuep2B+paSFGEv/g3MgMxX8=;
 b=ZQsNvtsrwdNGqEa2fccXzXriqCkZ/vtkQcHFzjJuas6Omv/tohjgcRQ4AeOz4U7+IS
 BFHQuViGH6FFq9sKdcyBCNSshg5weZ+qDFxmaLGQWlleR+1WzQBhX3gXtM7otsj5x8xA
 EHIqRxYufAmZUbF3wflKqIqUT/tHdRTDzFb0AJ52sMIynZbflLtu/6BAtqo4jO/UiySC
 kxXF+EDNSw6K7yn7xS7PfLfSU+IX+OE/Vl6XoAhWRJmKtzd04UDgRfbok4jrNieKgoem
 jteXfcIez2b8dR/mfZnMUYaEDEACM1/dFXMfIoKW5nTPgUDIcNtYXuqBuk/F7IC45mFN
 LUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pBIKGHudOlBXWPzszlFxQuep2B+paSFGEv/g3MgMxX8=;
 b=6zK0MDBbz2N7gzcYHc3otKmkztkcRt+tqhSlLCyBfVonlm0mbz2T+kXP7WEOCdoFI3
 zJzO4JXqRUMp9GcgkKR1MEdw462tuKsj4BHSXbaSAi2w//xjl4hSngHs0YbWywf+Az6P
 hKwaqgLb1rpx70EUkjrHSQaCCE6FkHGB2oBdQ/TWt8dlBumDHN72lmRvZim9tkZTxq4T
 ZbANDku5z79/W4vOJsiSGcy6OUIOo5aM9DLj3SO/4DGnfJaZ/xAx3PWn5pZJKTOt6CQU
 3guHRISR3XbckASIA+tM5JOzYefv6HtkQNh+KWSpjz5MwHItUVPDEb0ISExkL9U5hm2l
 Bbtg==
X-Gm-Message-State: ANoB5pkkbi/G2+xg1LozGAhmUvgtzQRzABfHjh6KfZJUE5cjNze2uWrB
 Psc7U0N8QdGkupL/5lcJQRREJg==
X-Google-Smtp-Source: AA0mqf6ZDutiES0x7uukS35oFjtwmdl9GMdUOhsac/6DEjrscuKgpw9ZbDSdSbof4yMYbhS/X2P4ZA==
X-Received: by 2002:a05:600c:a56:b0:3d1:d396:1adc with SMTP id
 c22-20020a05600c0a5600b003d1d3961adcmr42372345wmq.14.1671434110426; 
 Sun, 18 Dec 2022 23:15:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003d237d60318sm12083669wms.2.2022.12.18.23.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 23:15:09 -0800 (PST)
Message-ID: <145bf162-f53b-cf46-baf3-11e7d8ff2d8c@linaro.org>
Date: Mon, 19 Dec 2022 08:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/7] hw/misc: Allwinner AXP-209 Emulation
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
 <df665471-7426-f313-aece-75b8638e0da4@linaro.org>
 <CABtshVQNAseuzxHS7htyxEtoZDEGVG0fdf0ERdAZJgcxe=znQQ@mail.gmail.com>
 <de6f6dfd-e6e1-39fd-1c4f-d30249451cd1@linaro.org>
 <CABtshVROYFnbsaS1Z9aeuDjJJgNxHrHw6uVyypcppc6MK1Ng0g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABtshVROYFnbsaS1Z9aeuDjJJgNxHrHw6uVyypcppc6MK1Ng0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 23:39, Strahinja Jankovic wrote:
> Hi,
> 
> On Sun, Dec 18, 2022 at 11:23 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 18/12/22 23:12, Strahinja Jankovic wrote:
>>> Hi,
>>>
>>> On Sun, Dec 18, 2022 at 11:07 PM Philippe Mathieu-Daudé
>>> <philmd@linaro.org> wrote:
>>>>
>>>> On 18/12/22 22:19, Strahinja Jankovic wrote:
>>>>> This patch adds minimal support for AXP-209 PMU.
>>>>> Most important is chip ID since U-Boot SPL expects version 0x1. Besides
>>>>> the chip ID register, reset values for two more registers used by A10
>>>>> U-Boot SPL are covered.
>>>>>
>>>>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>>>>> ---
>>>>>     hw/arm/Kconfig              |   1 +
>>>>>     hw/misc/Kconfig             |   4 +
>>>>>     hw/misc/allwinner-axp-209.c | 238 ++++++++++++++++++++++++++++++++++++
>>>>>     hw/misc/meson.build         |   1 +
>>>>>     hw/misc/trace-events        |   5 +
>>>>>     5 files changed, 249 insertions(+)
>>>>>     create mode 100644 hw/misc/allwinner-axp-209.c


>>>>> +config ALLWINNER_AXP_209
>>>>
>>>> This controller is not specific to AllWinner. It can be plugged on any
>>>> i2c bus. Please rename it AXP209_PMU. Otherwise LGTM!
>>>
>>> Do you mean only in Kconfig, or everywhere (file name, function names,
>>> etc.)? Thanks.
>>
>> Keeping the file / functions names with 'allwinner' would give the false
>> idea this is AllWinner specific; rather confusing isn't it? Besides it
>> is not part of the SoC, this is an external component sitting on the
>> bus. So "everywhere".
> 
> I was expecting that answer, but I wanted to check :)
> When I started writing code for AXP209 it was indeed without allwinner
> prefix, but then checkpatch.pl complained about missing lines in
> MAINTAINERS. At that time it was easier to add the prefix (and get a
> match in MAINTAINERS) than to investigate if I should update the
> MAINTAINERS file or ignore the checkpatch.pl complaint.
> 
> I will update everything related to AXP209 so it does not have the
> Allwinner prefix.

Add a new AXP209 MAINTAINERS's section with your name :) Or add the new
file to the Allwinner-a10 section and add your name as designated
reviewer or co-maintainer :)

