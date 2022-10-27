Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0B60F405
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:50:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzUn-0004Se-73; Thu, 27 Oct 2022 05:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onzUb-0003nE-IU; Thu, 27 Oct 2022 05:48:05 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onzUZ-0001fm-OZ; Thu, 27 Oct 2022 05:48:05 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 z11-20020a05683020cb00b00661a95cf920so533567otq.5; 
 Thu, 27 Oct 2022 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qaLyX4Tol28atTxMT01lJBgptr6EdUWjZb/+XvECrDE=;
 b=BL6j/zEZdzR944K4/BcUIwmF4fs1ukmFer0T+y075i6KJ6+rZ4RI0sY7y7V7Z///P+
 KTzcnK0dzQB7NNp62yVogx17cLbOCftZiPxdZOnCx+U55yhNYzYbZIX9fhyS1uEkz7Fu
 U1KSva6OeFV7WyxwJ2IN9euvq+XKmwjdFr7bFsgqqTEw5nS9PubOJ7CLvHxpvZOYz93l
 KNReEQC6RZsuhjKA69ofxPGJhROx3EIg+nFkLr1KQ3/GZ28mqAyJ+lO6BO5w1zhd4JoT
 qw9z9igVFcC+4ut8hse17XV5b6ft+zgtTAMCpxRuL/jf5tEzs/kwIAExuY0nfU3qIVwV
 8I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qaLyX4Tol28atTxMT01lJBgptr6EdUWjZb/+XvECrDE=;
 b=kl2FWL8tPOQjJUCNCxh1LjovUMgrwzIrSWSDdqWEQ56NlEfOWP7dJ4lQlyFMaTjelQ
 XSAeWMR5eQl1/JCxpKmbJljF6LduR34O/vEIXdW0ZlxkR4uszB19YMhkobV/MwCHXax5
 srX4BT7O8G3G39JEAbjVqARI0vizZPdzDbxq8ubFs1Lb1ENjI3w2sL+6jD9B0tH6rsaa
 AbZ4IMWtBL6nqz7AO07cfSXZh6mw/PAmvw3uoe11R+Z2dDLFCXwtEvowgteCm11GZwTj
 fLNPzSRhdLuCDJ0qA8+/uss8FGR2OmY/uMHk4Zo/syhbYDIExlePAqcnT0XFsUtnDizz
 AsNA==
X-Gm-Message-State: ACrzQf0i6USzDkVUig1ap/bHriOpKBZAf9aRro6XAGc4T9LfAB+bywqj
 hrFkyu7Bfwy+kkNPgJeVsts=
X-Google-Smtp-Source: AMsMyM7hLK1OaRBktcK/AfKZA2NLlPJ3CZWUyllCnoEV7JhuEu6mLuIumkZSR4r6uYQ0198qGXd7LA==
X-Received: by 2002:a05:6830:2693:b0:661:e5be:54d with SMTP id
 l19-20020a056830269300b00661e5be054dmr25017993otu.365.1666864081657; 
 Thu, 27 Oct 2022 02:48:01 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a9d70d7000000b00661c0747545sm302698otj.44.2022.10.27.02.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 02:48:01 -0700 (PDT)
Message-ID: <de35a684-6fe4-e5f2-3f6b-ca42d4ccbe22@gmail.com>
Date: Thu, 27 Oct 2022 06:47:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20220901114127.53914-1-shentey@gmail.com>
 <E2820A94-3E30-46DB-9F83-8157C9A6FE1B@gmail.com>
 <25b0a116-7098-c285-cb20-af05dd03768b@amsat.org>
 <1D5930DC-EA4A-411F-BA3A-AA7FB0315368@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <1D5930DC-EA4A-411F-BA3A-AA7FB0315368@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 10/27/22 05:21, Bernhard Beschow wrote:
> Am 16. September 2022 14:36:05 UTC schrieb "Philippe Mathieu-Daudé" <f4bug@amsat.org>:
>> On 12/9/22 21:50, Bernhard Beschow wrote:
>>> Am 1. September 2022 11:41:14 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>
>>>> Testing done:
>>>>
>>>> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel morphos-3.17/boot.img`
>>>>
>>>>    Boots successfully and it is possible to open games and tools.
>>>>
>>>>
>>>>
>>>> * I was unable to test the fuloong2e board even before this series since it seems to be unfinished [1].
>>>>
>>>>    A buildroot-baked kernel [2] booted but doesn't find its root partition, though the issues could be in the buildroot receipt I created.
>>>>
>>>>
>>>>
>>>> [1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>>>
>>>> [2] https://github.com/shentok/buildroot/commits/fuloong2e
>>>>
>>>
>>> Copying from v2 (just found it in my spam folder :/):
>>> Series:
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Review seems complete, thanks to all who participated! Now we just need someone to queue this series.
>>>
>>> Best regards,
>>> Bernhard
>>
>> Excellent cleanup! Series queued to mips-next.
> 
> Hi Phil,
> 
> would you mind doing a pull request in time for 7.2?

I believe Phil was having problems with his amsat.org email. It's
better to CC him using his work email philmd@linaro.org (just added
it).

Phil, since this has pegasos2 changes I can queue it up via ppc-next
if you like. I'll toss a PR tomorrow.



Daniel



> 
> Thanks,
> Bernhard
> 
> 

