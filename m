Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA5031F9F4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:34:17 +0100 (CET)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5vD-00046Y-RT
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD5sU-00027A-LY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:31:26 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD5sS-0005Hn-UN
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:31:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id v15so8518927wrx.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GCdugJMHYGFQCSOgyXk5mJlIklX/6gY6vEwepK0i8Wo=;
 b=rO+apgd0vYSRRWPaLkQfCkw1UiqJTwYxyvdhxRBw7HeaTnWFwqJ4xheFJZu1tVkRbV
 WKVpKShHjHhAagUX5K+yS5lbvI9g4lPkKK2hcaNTKO9vFuohReGKbxmqcUEw+Pyf0wCU
 UhRf4XWvueziCMzUdNXbRq0sy4ix5/1uG8yVWx3U4lcM+sfKtt9q8HcJIrV42y8LZUlH
 DJg9lwF/uMH1lk5X1riB/uWw+BWAhwzafLitJgTimcXXsbRpnQ2E2OSmlwHA6cV7Jhey
 9aC6KUwC5oFnHNRhDAFbg7b7hr/RbAnLbeAQzuEdoqJVxGt7WKM/36jpiAEc96sFzoL8
 NUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GCdugJMHYGFQCSOgyXk5mJlIklX/6gY6vEwepK0i8Wo=;
 b=Vj46Jrr0/BogWJ84BHks77vaV1ym5euu2t9NbtwaqdxLTgwFkXiEdXFLpfqVWSOw4y
 vp9V1o7JNo0/V8Qv358l75R+pjUi+dPc7vLM0vnnEWojZARPDUMHlw+xoDWAlGy2yTEE
 m2cIqA7rn+qm20ZlJCc342eYQT8kkMDYASOeldcq07Vdbw1S0T9KGl6v6gkcExd0Rr7V
 c9aSgrymUzUG40RUV4VUPeKmNswVmEc4wXAwnhxZE51LkiU2gyNtjz8mTfGQGnwBsTnl
 Z97iGRBlSoZRmNhoLxb2LWhtteIWODGYnJKEtP/P82uc1WIHQ2BV45qyCF8Sic+xPQ9q
 4Nfg==
X-Gm-Message-State: AOAM531eUb2aVE6/1uVGf0C+7HlGuMXua7eDBrSGEvXJkUKo/a71H12O
 Ex+V2OvHfwmmYDLht3BMd2w=
X-Google-Smtp-Source: ABdhPJzKD8StWWA2L38cgV91rQyN8jucabaG89dbzO0d5ycPCR59lH6Xg9P5fSTSDtiEqTs7RH2Ttw==
X-Received: by 2002:a5d:6448:: with SMTP id d8mr9274962wrw.401.1613741482401; 
 Fri, 19 Feb 2021 05:31:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g184sm12077301wmg.24.2021.02.19.05.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 05:31:21 -0800 (PST)
Subject: Re: [PULL 00/19] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
 <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
 <CAEUhbmXeYDkKiNnkffRoE8dZc_=-vByoQfr6gdSSUNubkCaB8Q@mail.gmail.com>
 <CAFEAcA8BwTO7OT91B=d1tZrk9+PMiSLTmKtiv_Yd2BNdb1syRQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2bd4745b-03f2-220c-619f-2298d99038cc@amsat.org>
Date: Fri, 19 Feb 2021 14:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BwTO7OT91B=d1tZrk9+PMiSLTmKtiv_Yd2BNdb1syRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

[+John/Richards/Paolo/Gueunter]

On 2/18/21 3:22 PM, Peter Maydell wrote:
> On Thu, 18 Feb 2021 at 14:07, Bin Meng <bmeng.cn@gmail.com> wrote:
>> On Thu, Feb 18, 2021 at 9:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Fails to compile, 32 bit hosts:
>>>
>>> ../../hw/riscv/virt.c: In function 'virt_machine_init':
>>> ../../hw/riscv/virt.c:621:43: error: comparison is always false due to
>>> limited range of data type [-Werror=type-limits]
>>>          if ((uint64_t)(machine->ram_size) > 10 * GiB) {
>>>                                            ^
>>> ../../hw/riscv/virt.c:623:33: error: large integer implicitly
>>> truncated to unsigned type [-Werror=overflow]
>>>              machine->ram_size = 10 * GiB;
>>>                                  ^~
>>
>> This kind of error is tricky. I wonder whether we should deprecate
>> 32-bit host support though.
> 
> 32-bit host is still not uncommon outside the x86 world...
> 
> The thing that makes this particular check awkward is that
> machine->ram_size is a ram_addr_t, whose size is 64 bits if
> either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
> enabled, so it's effectively only 32-bits on 32-bit-not-x86.
> 
> It might be a good idea if we decided that we would just make
> ram_addr_t 64-bits everywhere, to avoid this kind of "we
> have an unusual config only on some more-obscure hosts" issue.
> (We did that for hwaddr back in commit 4be403c8158e1 in 2012,
> when it was still called target_phys_addr_t.) This change
> would probably be a performance hit for 32-bit-non-x86 hosts;
> it would be interesting to see whether it was measurably
> significant.

You once explained me we have 'hwaddr' (physical address)
of 64-bit because we can 64-bit buses on 32-bit targets.
hwaddr is available in all emulation modes.

ram_addr_t is restricted to system emulation. I understand
it as the limit addressable by a CPU.

Back to your comment, we only have 32-bit ram_addr_t on
system-emulation on 32-bit (non-x86) hosts.

Question I asked yesterday on IRC, do you know if there
is still interest in having system-emulation on 32-bit
hosts?

It is important to keep user-mode emulation on 32-bit hosts,
but I doubt there are many uses of system-emulation on them
(even less non non-x86 archs).

Regards,

Phil.

