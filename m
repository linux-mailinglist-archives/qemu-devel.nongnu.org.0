Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A0E4CED4D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 20:07:37 +0100 (CET)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQwEC-0006Ea-5e
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 14:07:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQwD2-0005YB-Pa
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:06:24 -0500
Received: from [2a00:1450:4864:20::435] (port=47065
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQwD1-0005vK-0V
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:06:24 -0500
Received: by mail-wr1-x435.google.com with SMTP id x15so20124838wru.13
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=t9zNnRkzBGcbmk7/Wg9qnht21kItzHqWREWBLJ+joN8=;
 b=RE1QxYTsfDh/8FSG0jeZfQbtR8WbR+alu8y8+/ru4vi8K4RXpWyIolI/YBPgHuaTly
 VKYD+IWLL3BpVhEP9iFezAKlQFOV1WrjwkIZ98qzjdGZyn55VpPWMk4rmpuYlMxUFibs
 tQwjZS8xYLuFjiafgxcrBuYdE/B1bIVcW0Brr0eyCXbPlKCwg3u1ganFOsZ/7OElEGqC
 /SkCt6NM1UQUCXXk8TnlZavTrWJRJYvga/F6moSbl2JmS3GM11moGIROHYbP3ePBkj7M
 o22RF7WfPP/3ruo1yhHkWTpgNelLr84z9oXrZg200qjutVDEKWjbFTrIa6/LNy8tF1eH
 SJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t9zNnRkzBGcbmk7/Wg9qnht21kItzHqWREWBLJ+joN8=;
 b=XWTVoj/go5Y1c8TOOXObU34eDYWuaJQ9HeOlfo2GjsMBLv2PCYAupjx6wxSBFFTLJ6
 Yxb7c/KEudeUE6TjbrO8p2MvVSvX+5TUmB/0TGQIdcoj+sE65akmq6xLBdz0xVu8CZxh
 lJG/zEm7quEkO+UuaCvEIX0CB0BN069b/ZCSgxyfbOJ0MG3pLh2qrp93lEAQvSi5WyCY
 z8SPyoMnmJfdVeVlWvZ/Ldn4weCFFTCjaycIITdaHNAcd1PMKCoSl51UYk68zv5d+f83
 6JEVy4Hj6ccNQB5Aja92vUh2Kos6nj3IOm0Ff4URRjEUUU4iHQ5wD74YGFGcvGeDP8i/
 Vo1A==
X-Gm-Message-State: AOAM533jFoepIEdtcLx2OF6l9L6J1htdIxPs6HxppGuy+EHzsKcpICf/
 C9FS9yY1NDWuke7h3JkQQmk=
X-Google-Smtp-Source: ABdhPJwXVNvD3cKizfTyl9WrXVi/0AOiA6SUTFxAcZrV0t9U4+9DMJbNymQ4BmiJ+tMMFZmRZqXNaA==
X-Received: by 2002:a5d:4e02:0:b0:1f1:e6fb:543 with SMTP id
 p2-20020a5d4e02000000b001f1e6fb0543mr3058523wrt.240.1646593580873; 
 Sun, 06 Mar 2022 11:06:20 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6846000000b001f044a8e214sm9402366wrw.107.2022.03.06.11.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 11:06:20 -0800 (PST)
Message-ID: <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
Date: Sun, 6 Mar 2022 20:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PULL 00/33] Abstract ArchCPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/22 19:16, Peter Maydell wrote:
> On Sun, 6 Mar 2022 at 13:03, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
>>
>>    Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/abstract-arch-cpu-20220306
>>
>> for you to fetch changes up to 5bbf37aa89881751828d28e38608db0371874aef:
>>
>>    accel/tcg: Remove pointless CPUArchState casts (2022-03-06 13:15:42 +0100)
>>
>> ----------------------------------------------------------------
>> - Re-org accel/ and softmmu/ to have more target-agnostic objects.
>>
>> - Use CPUArchState as an abstract type, defined by each target
>>    (CPUState is our interface with generic code, CPUArchState is
>>     our interface with target-specific code).
>>
>> ----------------------------------------------------------------
> 
> I get a compile failure on my OSX box:
> 
> In file included from ../../target/i386/hvf/x86.c:24:
> ../../target/i386/hvf/x86_emu.h:27:30: error: declaration of 'struct
> CPUX86State' will not be visible outside of this function
> [-Werror,-Wvisibility]
> bool exec_instruction(struct CPUX86State *env, struct x86_decode *ins);
>                               ^
> ../../target/i386/hvf/x86_emu.h:39:27: error: declaration of 'struct
> CPUX86State' will not be visible outside of this function
> [-Werror,-Wvisibility]
> void write_val_ext(struct CPUX86State *env, target_ulong ptr,
> target_ulong val, int size);
>                            ^
> [ditto for all the other uses of struct CPUX86State]

I see. I only have access to aarch64 Darwin, not x86_64; I was relying
on our CI for that (my GitLab CI is green). I'll work a fix, thanks.

Phil.

