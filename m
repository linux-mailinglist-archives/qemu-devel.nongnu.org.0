Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46125610566
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 00:13:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooB64-00035Z-1k; Thu, 27 Oct 2022 18:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooB60-00033u-5l
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 18:11:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooB5y-0003ub-4Q
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 18:11:27 -0400
Received: by mail-wm1-x32a.google.com with SMTP id y10so1945828wma.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 15:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F211f8O4Kly9T9Al1W6ZdgsuSY0Bk+zV2+Vsioa11s8=;
 b=Qgi6DAVUemunRogSZZKW60VWrV6uILYsluoF5QKzTktuOpsxdVafdtzvvgM8bsCqbB
 kZd81G0N/yuybusvIoQfuoVTnwuUR2A+SZlJhb7aC9ytcYL8cCA0e5JfKuLehzDKsAQW
 BP0z69hhag6m4fE2c57t38/PMe2GT89Ke7FhdJY6+50a/uAtIgMuvgfm4ItKWe3ova1a
 MKUKhsu4JZxxEuFJ1CN28lPXvztuAfe+7ZfNX4f/g6XSqu9NHfpjoDSX/S5kfIYAIRgw
 yW3PFbhE/eeHR3Ycj1OPCxMJaPFuSlk8jA5bP8LRz7sfEdfJeSNd2ZGsfBSM+U4CVwcV
 vOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F211f8O4Kly9T9Al1W6ZdgsuSY0Bk+zV2+Vsioa11s8=;
 b=ga/8ptHU0fdcqlUhR8/a4dZlUyK/a4qz/9U/dWte5QoRpMZ6whVWBAXLkXA/3VdDsL
 QziVGD6RfcaE0c3lutDsbAsge0Xug/JaEnQDpIlBDpbKP+MTYJRqJYhPgEjvgJh/5ScZ
 X1HRdMhjUl6SsThvNCI+vJ6G4tZTYCdiPSAiDOFbr+Pbyu2zouG3y9Gb4rYbNKNUR96E
 fr7Snoefr3lsKLoRXPzvQ6a42qofE/Vth+ChBs5AA/V757rSnasno6MXBGB5rVj/CUTi
 7qEudEahxQl++Yk7GFIofq5o08fDFsB21LQDZUOEKFh8z9Et0PcMaDS25S2PtWJz48S+
 8ciw==
X-Gm-Message-State: ACrzQf3rs5ZLCEXIDwZxwPjb8w3K6taerkWq2/2bTApwUQ+znVRNh+Wz
 apYIdCJLd0tfiqlI5jVnNB1pOQ==
X-Google-Smtp-Source: AMsMyM6sgJNOvQB0kgm60dURTHgjEvXHiF1UD90Lle/NHtgQxUaBaiou+CfTdnq3gT9frGOT53UvzQ==
X-Received: by 2002:a1c:7405:0:b0:3cf:5d41:be8b with SMTP id
 p5-20020a1c7405000000b003cf5d41be8bmr304215wmc.1.1666908684347; 
 Thu, 27 Oct 2022 15:11:24 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c4fd500b003c43dc42b4dsm6404789wmq.16.2022.10.27.15.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 15:11:23 -0700 (PDT)
Message-ID: <38e64cb2-4409-dc5b-16a1-53e91c0f3dc1@linaro.org>
Date: Fri, 28 Oct 2022 00:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220901114127.53914-1-shentey@gmail.com>
 <E2820A94-3E30-46DB-9F83-8157C9A6FE1B@gmail.com>
 <25b0a116-7098-c285-cb20-af05dd03768b@amsat.org>
 <1D5930DC-EA4A-411F-BA3A-AA7FB0315368@gmail.com>
 <de35a684-6fe4-e5f2-3f6b-ca42d4ccbe22@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <de35a684-6fe4-e5f2-3f6b-ca42d4ccbe22@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Hi Daniel, Bernhard,

On 27/10/22 11:47, Daniel Henrique Barboza wrote:
> On 10/27/22 05:21, Bernhard Beschow wrote:
>> Am 16. September 2022 14:36:05 UTC schrieb "Philippe Mathieu-Daudé" 
>> <f4bug@amsat.org>:
>>> On 12/9/22 21:50, Bernhard Beschow wrote:
>>>> Am 1. September 2022 11:41:14 UTC schrieb Bernhard Beschow 
>>>> <shentey@gmail.com>:
>>>
>>>>> Testing done:
>>>>>
>>>>> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device 
>>>>> ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso 
>>>>> -kernel morphos-3.17/boot.img`
>>>>>
>>>>>    Boots successfully and it is possible to open games and tools.
>>>>>
>>>>>
>>>>>
>>>>> * I was unable to test the fuloong2e board even before this series 
>>>>> since it seems to be unfinished [1].
>>>>>
>>>>>    A buildroot-baked kernel [2] booted but doesn't find its root 
>>>>> partition, though the issues could be in the buildroot receipt I 
>>>>> created.
>>>>>
>>>>>
>>>>>
>>>>> [1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>>>>
>>>>> [2] https://github.com/shentok/buildroot/commits/fuloong2e
>>>>>
>>>>
>>>> Copying from v2 (just found it in my spam folder :/):
>>>> Series:
>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>
>>>> Review seems complete, thanks to all who participated! Now we just 
>>>> need someone to queue this series.
>>>>
>>>> Best regards,
>>>> Bernhard
>>>
>>> Excellent cleanup! Series queued to mips-next.
>>
>> Hi Phil,
>>
>> would you mind doing a pull request in time for 7.2?
> 
> I believe Phil was having problems with his amsat.org email. It's
> better to CC him using his work email philmd@linaro.org (just added
> it).
> 
> Phil, since this has pegasos2 changes I can queue it up via ppc-next
> if you like. I'll toss a PR tomorrow.

This series is already queued. I apologize for the loooong delay, I am
trying to run my usual tests but various fileservers I was using to
fetch MIPS binaries disappeared over the last year, so I have to pull
these files from offline backups. The PR will be in time for 7.2
however :)

Regards,

Phil.

