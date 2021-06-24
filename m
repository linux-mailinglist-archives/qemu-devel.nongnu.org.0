Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976033B37AB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:17:30 +0200 (CEST)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwVmz-00080Y-4h
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwVlT-0007HS-Et
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:15:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwVlQ-0003s9-WE
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:15:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id j2so8003854wrs.12
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5MSHOOOtmhqT13jMfZD0jUonNaAvjSDa5blAP9i6iG8=;
 b=V+Qinc0Bwa6xDK9NL5Au3s5FN/BB9A1aH8PNVb+QoaLXw/7cMofW0hBLlwdgXFP7VV
 xRneQHHHj3h45ICyw2MO2ThEicEGuJSTXDSf57k2oBq0wEnUVl4moryYeIKDZJXPZqse
 ZShlW/iV/bCs1JHCOB0pwv8RxB5OHBqkyJSyWuEszg8C8iHgBJCCSS0vNb7ysp8Xl9Jj
 ObrQ151OlT3iZswrXGHdLwH1a8ZbieQODstZ9LRugfOrciNjjY/TMJPt2r9vmOTD26Va
 FLj6+sLCA+ZlR1H4VVjoOb9zUvVi9dDsEjpT8cZbpJnX5nD2wMhfLSjqagZLJZ/EMFEW
 Vf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5MSHOOOtmhqT13jMfZD0jUonNaAvjSDa5blAP9i6iG8=;
 b=c7aaGYBKM7iDqFWnE786NJUA8k3/O/zRKIqJrlU52DlxonRNkzGAau3NFxwL+TrqXQ
 8zt9vqX2IO61LM2EPrq7Ed5iMDW9awCeWvFUL68llefdqFQWT8M2qdeFjveKjjx+2Lkh
 thzruNaZG74/fiTKqC98nzjWnKQegzU0S4xgb8hMe3xTu4psB8HadGkxBPp2/Y3T7j7D
 6qWRsyZe8OjNvJM15iYEYL2O8JQ+naTcSgO4f9n2DcJypwsEEVAfaQ85xqlFIWpMcNQc
 jREyxU6tNeuZNFJS3tnVVEwHdO7+mgausb5R0CghxkeHbz2reWu8jl1helFT3agnckIq
 Pw9A==
X-Gm-Message-State: AOAM533rCgWCblNNe53D8ws/T8fkmAG2KQWI5c6n1s236LzQms5/Drdh
 TVwhGcKIBzr2lkuLpuHfymqUYQ==
X-Google-Smtp-Source: ABdhPJwHFqR0Vlg6yAKX1oypFrP+cbj2ceR88AVkBER8N8UYeHyku7u1e8vb9M7tnY9fRgkDtBKCAQ==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr6591772wrw.173.1624565751559; 
 Thu, 24 Jun 2021 13:15:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s18sm4247231wrw.33.2021.06.24.13.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:15:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E96111FF7E;
 Thu, 24 Jun 2021 21:15:49 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org> <87y2b2s2gw.fsf@linaro.org>
 <49027cc2-f89e-cbd6-cfc0-e59ce7dd4b17@crans.org>
 <87y2b2rxju.fsf@linaro.org>
 <9c43ebbe-d0cd-5244-ba86-477e40f0c835@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre IOOSS <erdnaxe@crans.org>
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
Date: Thu, 24 Jun 2021 21:13:55 +0100
In-reply-to: <9c43ebbe-d0cd-5244-ba86-477e40f0c835@crans.org>
Message-ID: <87tulnqaru.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre IOOSS <erdnaxe@crans.org> writes:

> [[PGP Signed Part:Undecided]]
> On 6/22/21 12:37 PM, Alex Benn=C3=A9e wrote:
>> Alexandre IOOSS <erdnaxe@crans.org> writes:
>>=20
>>> [[PGP Signed Part:Undecided]]
>>> On 6/22/21 10:48 AM, Alex Benn=C3=A9e wrote:
>>>> Alexandre Iooss<erdnaxe@crans.org>  writes:
>>>>> [...]
>>>>> +
>>>>> +The execlog tool traces executed instructions with memory access. It=
 can be used
>>>>> +for debugging and security analysis purposes.
>>>> We should probably mention that this will generate a lot of output.
>>>> Running the admittedly memory heavy softmmu memory test:
>>>>     ./aarch64-softmmu/qemu-system-aarch64 -D test.out -d plugin \
>>>>       -plugin contrib/plugins/libexeclog.so  \
>>>>       -cpu max -serial mon:stdio -M virt \
>>>>       -display none -semihosting-config chardev=3Dserial0 \
>>>>       -kernel ./tests/tcg/aarch64-softmmu/memory
>>>> generates a 8.6Gb text file. I suspect once this is merged you might
>>>> want to look at options to target the instrumentation at areas of
>>>> specific interest or abbreviate information.
>>>
>>> Yes! In my downstream version I am triggering the beginning and the
>>> end of trace acquisition by matching two virtual addresses of GPIO
>>> device access. This works in my case because I'm also using the same
>>> GPIO for triggering an oscilloscope, but maybe we would like to
>>> upstream something more generic.
>>>
>>> I'm still thinking about this (maybe for a later patch) but I believe
>>> it would be nice to have the following:
>>>   - If no argument is given to the plugin, log everything.
>>>   - Allow the user to specify either a memory address, an instruction
>>>     virtual address or an opcode that would start the acquisition.
>>>   - Same to stop the acquisition.
>> Sounds reasonable to me.
>>=20
>>> This would look like this to start/stop acquisition using GPIO PA8 on
>>> STM32VLDISCOVERY:
>>>
>>>    ./arm-softmmu/qemu-system-arm -M stm32vldiscovery \
>>>      -kernel ./firmware.elf -d plugin \
>>>      -plugin libexeclog.so,arg=3Dmem:1073809424,arg=3Dmem:1073809424
>> I quite like the formats you can use for -dfilter, for example:
>>    0x1000+0x100,0x2100-0x100,0x3000..0x3100
>> it might even be worth exposing qemu_set_dfilter_ranges as a helper
>> function to plugins to avoid copy and paste.
>
> We could expose "-dfilter", but maybe it is better to reserve it to
> filter the output of the plugin rather than triggering the tracing?

I meant the parsing code for dfilter style expressions, the dfilter
itself ;-)

> I could implement a format similar to dfilter to configure triggering.
> This would enable someone to start logging on any access to a memory
> range.
>
>> So what would your above command trigger? A write to 1073809424
>> would
>> start the trace and the next write to the same address would stop it?
>>=20
>
> Yes exactly. In this case the first access set the GPIO high, and the
> second access set it low.
>
> I don't believe the plugin can access the value stored in memory (i.e.
> differentiating between setting a GPIO output high or low). I don't
> find this problematic in my case, but maybe it could be for someone
> else.

Not currently but in principle it wouldn't be too hard to do. It would
just be extra data to copy into a TCG Arg. We would probably want to
make it optional though.

>
> From the discussion I see the following possible patches:
> 1. Add an argument to trigger the beginning with one address (memory
> or instruction).
> 2. Add an argument to trigger the end with one address (memory or
> instruction).
> 3. Add the support for ranges (in "dfilter" style).
> 4. (maybe) Add the support to trigger on an opcode.
> 5. Add support for "-dfilter" to filter the logging output.
>
> Thanks,
> -- Alexandre
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

