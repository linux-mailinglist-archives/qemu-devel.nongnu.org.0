Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E873ED178
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:59:42 +0200 (CEST)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZPB-0003rW-IO
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFZON-0002xL-Tw; Mon, 16 Aug 2021 05:58:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFZOM-0005lL-Ab; Mon, 16 Aug 2021 05:58:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z9so22632355wrh.10;
 Mon, 16 Aug 2021 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9DGVx9LIytCfpm5AU7V2UwJ/N/eM+C3BK2Evc9Opejk=;
 b=B5lHuo5gFpUBzc3A1kpfbaX2POa8zospYAxTzghqauokzo9Tco+7pMZxqGR3EKg2im
 fOJDxPjZ6yxZ8jad8qcVjiNNqpBiqOQCzlBtnHR6xcaA/D3Vm9ANXFLgHDO9qksLsEpo
 g1d11nyM+nT2as6m1A6jzxV2o2v4pjKpdEWq66nK395w5jWitFiyez8My8I/stYMDlBH
 qmLUQk0ZfS1m8TuhbQV0cRnTr6Bo+0FPtv1vrjjU8mMG65kpEDnJcRNv/zpDY7znT9MD
 hcLbz8N3bZPtecubJXlN51OK99NLrOvs7tsoCNDVx55lrAJarErvP+W41ZIt5zSQ2LML
 U0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9DGVx9LIytCfpm5AU7V2UwJ/N/eM+C3BK2Evc9Opejk=;
 b=GMn4926CI7cotdPIWOlPOJOF08OkURmwwYaWQsSzsJvKPZiVfrxXzr0D4zYPV1jJ20
 ufIjzQGESVRLwSJKWk83BdrBqm+HRO7MRWsqI/jnD7ZzZGFemGXEz837zPCwPWQ+wyq1
 sSk6ePWisqxdwsNTMk6R7mnS4ABViEWyTMzlK2H/KQ8HeX9xuAkTgpxbI2u4dXNknQN7
 b+CcV0P5qH63ly6loF/ag/V8pSRyUesY3nuHxP28jnKmm+wAye+ZN5Mog/0pIWEmhoCC
 Jh71Fcl6/LpSb18JVEyuHgUTYCPEWGunLxfidlCGQ+EBzceBhv9kxouqFFNRUg+L5r16
 7+aw==
X-Gm-Message-State: AOAM532H5iez78OB0QgLvIBLzCCLWTVEM244vN2L6/3P2OjTHNssXmQ2
 DERx7Foavcq9xStD9nA2A/8=
X-Google-Smtp-Source: ABdhPJyHLPLFJxwQADOXekX7NBnQkTIB71trW4ps3aHbbxl+ZBvw3kGfy3FNCzSPO7C/qYZs/aqpfA==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr17945745wrq.204.1629107928210; 
 Mon, 16 Aug 2021 02:58:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b18sm11052671wrr.89.2021.08.16.02.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 02:58:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
 <CAFEAcA8DNSS-0oXCDWeFNkin=mbNePS3CamnCgvvC+89KOWXTw@mail.gmail.com>
 <bad5ee5a-0f13-6d12-5055-4c649f78aa4e@amsat.org>
 <CAFEAcA-iG=a_A+OSXrJhh2+qo09vvSJPH7oF0fft_kg229eAvQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b4f5c6a0-ab08-d73e-8ecf-a025fb8d922a@amsat.org>
Date: Mon, 16 Aug 2021 11:58:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-iG=a_A+OSXrJhh2+qo09vvSJPH7oF0fft_kg229eAvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 11:36 AM, Peter Maydell wrote:
> On Mon, 16 Aug 2021 at 10:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/16/21 11:05 AM, Peter Maydell wrote:
>>> On Sun, 15 Aug 2021 at 17:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> I only wonder if we shouldn't check clock_is_enabled() here.
>>>> Maybe not assert, but at least report a GUEST_ERROR?
>>>
>>> Setting the multiplier on a disabled clock doesn't seem like
>>> an error to me. I would expect a common way for the guest to
>>> program a clock-controller would be "first set the divider
>>> and any other parameters; finally, enable the clock".
>>
>> Eh sorry I meant the other way around :/ It is usually either
>> illegal or undefined behavior on real hw to change a clock scale
>> while it is active. Personally I'd be interested to catch guests
>> doing so. I was thinking of:
>>
>>     if (clock_is_enabled(clk)) {
>>         qemu_log_mask(LOG_GUEST_ERROR,
>>                       "Changing scale of ENABLED clock '%s'\n'",
>>                       CLOCK_PATH(clk));
>>     }
> 
> I think if particular clock-controller hardware has that
> restriction we should be logging guest errors there. (Doing that
> also has the advantage that we can make the error clearer by being
> specific about what guest hardware register/device is being
> mis-programmed.)

OK.

> I don't think we can be certain enough that it's
> always wrong to change the divider on a running clock to put the error
> in the common clock API code.

OK.

> (Among other things, I suspect a warning
> here would be easy to trigger incorrectly when connecting up hard-wired
> clock dividers at startup.)

Yes, probably.

Thanks for the clarifications.

Preferably with a trace-event:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

