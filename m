Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930E306709
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:12:18 +0100 (CET)
Received: from localhost ([::1]:33918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4t2v-0004an-6Z
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4t0x-0003av-UC; Wed, 27 Jan 2021 17:10:15 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4t0w-0006Hs-45; Wed, 27 Jan 2021 17:10:15 -0500
Received: by mail-wr1-x430.google.com with SMTP id q7so3462782wre.13;
 Wed, 27 Jan 2021 14:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vy1Nf4PodWV+2JODGG7IeRZfWJk43JfzCSwvbK9HNqE=;
 b=KQ8y6wa/OsOP7+n4Ev3SUkqRZUk9qytm03SeUmCJk1yhPgcclvV3SkSnP94eJBCNRw
 u+qS0G4KU7gws+zaUtu2MHTKkneNaQGr8esQbcf1xjvfA9EAR8eEDyU2lKAdwKaXJS1r
 HfCH+DGwS/mXihtEY5Fsf9J1T+lhJtJSH0pSxKuCkFEqlBxUVhAw+XNzuO73yJnEgfvo
 YGSMakUI7CEg8OHo5bX65U+hDDfV/IVpIg0cOFYCSfdQAwVEDMiexfvdyiVDVD8lR5p6
 24rZ2o5qmNiFqwa6vesMA0+X22rMFfDN3fkzsA0xkSk1e3w1yuRExz1W/Kc4EjVPfBLN
 67pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vy1Nf4PodWV+2JODGG7IeRZfWJk43JfzCSwvbK9HNqE=;
 b=T2dy/RU1nQO7qVfDvFAKkwAaeoH2gjGlxDO37xkfVqZdaMWFjXQCYQWhLUXx6PnW+P
 c5znTC1mNWWmZcmMfMY+m369k4oMTmhrrsHMLrgREmkX6IWSj53Pjl7L9GCH54mtMTZQ
 BRFWGbnP2QReL61q9EVJaCiD9rvtIjjQA+5dUVy7Mk79LZYcMTI9UB+3IsTYINU0eSZt
 Fsqtr9gm+FACH5/LNlsGsGjhEBoJ/+Sp/9VYl3Edju3Tl2i0LOXEcmMv7/+PZ0NZI1Y6
 LKYyIJyOgyZD5Q+r2xkvjuGnW/YaALJFxuiMoAcXbv7eHf2AV6Uz9idjPRrT8jSoMgCg
 tzOA==
X-Gm-Message-State: AOAM533dCf21hXrWMjI0zaPXkr6vexwpneJv4Tz/Sq+INOd+au0fyJ/j
 q3KNaWdMhLGSRAadtdxPMR3g0oE02ys=
X-Google-Smtp-Source: ABdhPJyZzIRqUtlxO/7sn+JD23O4V29kSdXg6YC9nwq6oy/U5c0DAxUYp2GvPlVRIzbvxp2sg82ziQ==
X-Received: by 2002:adf:c14d:: with SMTP id w13mr12924457wre.383.1611785411650; 
 Wed, 27 Jan 2021 14:10:11 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o12sm4459553wrx.82.2021.01.27.14.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 14:10:10 -0800 (PST)
Subject: Re: [PATCH 16/25] hw/arm/stellaris: Convert SSYS to QOM device
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-17-peter.maydell@linaro.org>
 <eaebe605-7ec3-ca26-9003-4619680bb43b@amsat.org>
 <CAFEAcA_qaJeR0TgX0CJuS_mUxezGQy-KtF44c7P8gG6JADe+wQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9a64e598-91e8-7547-3b5c-ad2a8c8496e3@amsat.org>
Date: Wed, 27 Jan 2021 23:10:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_qaJeR0TgX0CJuS_mUxezGQy-KtF44c7P8gG6JADe+wQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 12:48 PM, Peter Maydell wrote:
> On Thu, 21 Jan 2021 at 22:13, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 1/21/21 8:06 PM, Peter Maydell wrote:
>>> Convert the SSYS code in the Stellaris boards (which encapsulates the
>>> system registers) to a proper QOM device.  This will provide us with
>>> somewhere to put the output Clock whose frequency depends on the
>>> setting of the PLL configuration registers.
>>>
>>> This is a migration compatibility break for lm3s811evb, lm3s6965evb.
>>>
>>> We use 3-phase reset here because the Clock will need to propagate
>>> its value in the hold phase.
>>>
>>> For the moment we reset the device during the board creation so that
>>> the system_clock_scale global gets set; this will be removed in a
>>> subsequent commit.
> 
>>> +
>>> +struct ssys_state {
>>> +    SysBusDevice parent_obj;
>>> +
>>>      MemoryRegion iomem;
>>>      uint32_t pborctl;
>>>      uint32_t ldopctl;
>>> @@ -371,11 +376,18 @@ typedef struct {
>>>      uint32_t dcgc[3];
>>>      uint32_t clkvclr;
>>>      uint32_t ldoarst;
>>> +    qemu_irq irq;
>>> +    /* Properties (all read-only registers) */
>>>      uint32_t user0;
>>>      uint32_t user1;
>>> -    qemu_irq irq;
>>> -    stellaris_board_info *board;
>>> -} ssys_state;
>>> +    uint32_t did0;
>>> +    uint32_t did1;
>>> +    uint32_t dc0;
>>> +    uint32_t dc1;
>>> +    uint32_t dc2;
>>> +    uint32_t dc3;
>>> +    uint32_t dc4;
>>
>> Shouldn't these be class properties?
> 
> Could you elaborate on what you think the code ought to look like?

I am thinking something similar how Igor asked me to implement
RaspiMachineClass::board_rev in hw/arm/raspi.c, as the did/dc registers
are read-only. Anyhow this is 1/ probably not necessary and 2/ out of
the scope of this series, this patch is already complex enough, and
the work is done.

> I just used the usual thing of defining uint32 qdev properties so we
> can set these values when we create the device, as a replacement
> for the existing code which either reaches directly into the
> state struct to set the user0/user1 values or sets the
> stellaris_board_info pointer in the state struct.

No problem.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

