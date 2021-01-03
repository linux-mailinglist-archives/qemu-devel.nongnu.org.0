Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9040A2E8CFA
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 16:48:17 +0100 (CET)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw5c8-00027C-4T
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 10:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw5Zj-0001C6-I3
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 10:45:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw5Zf-0005lu-Bh
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 10:45:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id c5so28423658wrp.6
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 07:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JTGnPlKwAjwMdMd3VpM3baFeLVB9w4XTscza+bDFFjk=;
 b=aGl7Z7o7SP6YxQEtDghYzLpdUw+UHI1hTErkjZ9CC836W/OY9Es0LuyUAganRw1feK
 A1NeOVV28u+0UrludrFiYhpiE89xrE76/wTi8pipYKyd2+rXD0GGCST8UhIcXRjWGHsP
 wYgGo2+lwYE4Rc+O6WDcqTaLXP7M+9BzpEHLWJXDDYIVqL4ZDBvcb/pevMeWaNN2y09q
 2iT/75exWgXGZZy3kmQjMghWjulSdMAaLo/DIvzNzzE03dPstR4ny6tXHQYWS/AMjNBc
 L5f/DKW9EsC+VuYaDDpjMYG3/Jl0BwCxP1jxp4wyUruhX9STYuw1sWeVvKX6yAuY8FVk
 CCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JTGnPlKwAjwMdMd3VpM3baFeLVB9w4XTscza+bDFFjk=;
 b=NzwLsddp4YTZUm5cY1PUmaib8VvZOSW4nO2x94yVGXGgpS/EKy1JX89Ehu5PiqZfVK
 00VJ1F8PHQBO9+9JAjWI7fKzJSNKK0gpOBP90ddYTMkt6uqYSRPMjyK5lE4PG3Qdwm7c
 Sx92cnuTPNqs7Fi7HGPSj/R5o7MisGIcuCyzUqKTfwjYuj6t+9K0dF7df09E7juvfgxU
 h9VllKjhpLaCw75mrEogofyxgYBAuRpiC7JRe+qoj+F9JtYNeQ0voTy+/X61UY9YZNhz
 J7CmxmogmghATDWH1tgr9R2j6No+X7rPgvfu0dZ0BiODbMDzYRt73JPrCaHoYBNheKTC
 k+Vg==
X-Gm-Message-State: AOAM53300iZhB3/FxKovai+h9QnIzTK8nWiYg49MU5JAICU4T5X7E4Ef
 lPZ/xpH7dL5Ivqsaf45SQ5QZXPvo2Mw=
X-Google-Smtp-Source: ABdhPJyzSOB2A30ti1+2ULKjZvIR1u5qyDbypdYvn+8hJPgz9ctdiG+jodS72+XSZ+XnI58n9i1x8g==
X-Received: by 2002:a05:6000:368:: with SMTP id
 f8mr76367308wrf.150.1609688740916; 
 Sun, 03 Jan 2021 07:45:40 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id k18sm93826283wrd.45.2021.01.03.07.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 07:45:40 -0800 (PST)
Subject: Re: [PATCH 00/24] vt82c686b clean ups and vt8231 emulation - all in
 one
To: BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <cover.1609584215.git.balaton@eik.bme.hu>
 <6f66caae-64fb-6325-9950-8ff52f1b13eb@amsat.org>
 <43d1085-572e-4bc4-c28-66478848e83f@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3a8f9b76-6e26-f483-3252-e1fd7f0c888d@amsat.org>
Date: Sun, 3 Jan 2021 16:45:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <43d1085-572e-4bc4-c28-66478848e83f@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/21 3:27 PM, BALATON Zoltan via wrote:
> On Sun, 3 Jan 2021, Philippe Mathieu-Daudé wrote:
>> On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
>>> Hello,
>>>
>>> This is an all in one series containing all the patches from my
>>> previous part I and part II vt82c686b clean up series plus the end of
>>> it to finally add vt8231 emulation that will be used by subsequent
>>> ppc/pegasos2 emulation. I consider this finished for now and good
>>> enough to get in also cleaning up and improving fuloong2e emulation a
>>> bit but previous disclaimer is still valid: It does not aim to fix all
>>> existing bugs or make the model perfectly emulate the real chip just
>>> reach the level where we can have working emulation to boot guests
>>> which can then be improved later. (E.g. I think state saving was
>>> broken before and it remains broken after because I don't know all the
>>> details how to add vmstate for all kinds of data structures and this
>>> could be addressed separately when fixing the already broken state
>>> saving if someone wants to test and fix it.) With this it boots at
>>> least MorphOS on pegasos2 and works with the pmon_2e.bin for fuloong2e
>>> which needs more fixes for Linux that are currently under review. More
>>> testing is welcome.
>>>
>>> It still needs the Bonito BONITO_PCICONF_REG_MASK fix for fuloong2e
>>> because it no longer maps SMBus but due to the Bonito bug guest cannot
>>> write register 0xd2 to map it. With that fix pmon_2e.bin from here:
>>> http://www.anheng.com.cn/loongson/pmon/ works for me with this
>>> command: qemu-system-mips64el -M fuloong2e -net none -bios pmon_2e.bin
>>>
>>> After rolling this for two years now I hope it can finally be merged
>>> and eventually also get pegasos2 emulation that will need this.
>>>
>>> Regards,
>>> BALATON Zoltan
>>>
>>> BALATON Zoltan (24):
>>>   vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
>>>   vt82c686: Remove unnecessary _DEVICE suffix from type macros
>>>   vt82c686b: Rename VT82C686B to VT82C686B_ISA
>>>   vt82c686: Remove vt82c686b_[am]c97_init() functions
>>>   vt82c686: Split off via-[am]c97 into separate file in hw/audio
>>>   audio/via-ac97: Simplify code and set user_creatable to false
>>>   vt82c686: Remove legacy vt82c686b_isa_init() function
>>>   vt82c686: Remove legacy vt82c686b_pm_init() function
>>>   vt82c686: Convert debug printf to trace points
>>>   vt82c686: Remove unneeded includes and defines
>>>   vt82c686: Use shorter name for local variable holding object state
>>>   vt82c686: Rename superio config related parts
>>
>> As the first half of this series is reviewed, I'm queuing it
>> (patches 1-12) via mips-next.
> 
> Thanks, You may want to fix the single vt82c686b: in the above commit
> title that was a typo, just for consistency.

Fixed (along with your git author email, instead of the list).

> Will this pull include the
> Bonito BONITO_PCICONF_REG_MASK fix or some replacement for that? That
> would be needed to get the rest of this series starting with 15/24
> working. Up to that it's just clean up which should be OK.

I checked the Bonito(32) ASIC and Bonito64 (FPGA) manuals, and
for (vendor_id = 0xdf53, device_id = 0x00d5) our implementation
is correct. I am waiting for further news from Jiaxun who asked
someone at Loongson for a manual of their Bonito variant.

I expect a different PCI device_id, so we can add it with your
change.

> I can repost
> the remaining patches rebased once it's merged in master or if you tell
> me which branch should I use.

IMHO no need (at least not worthwhile until mips/next is merged).

Regards,

Phil.

