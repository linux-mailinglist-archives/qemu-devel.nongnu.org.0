Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BAB3D049A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:26:33 +0200 (CEST)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5yC8-0000Ak-CV
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5y9l-0006z8-6m
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:24:05 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5y9i-0005Te-91
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:24:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i94so59751wri.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aNJVMk9/wG0SFyaZdj1N3MH7r5/7pFj2WY68JsBgh60=;
 b=OGpPW/aPuqwED1BbJpq29FM8rB8GAbYV5aGGtKK5uM+k151GXJdc4r3XWx3BSQTgY/
 yVjm2WXnAsuab7wLjORdVnOvicmfSYhSUJ3JieAs8gGm1AMiXvZJA89BENM/igV4ZtMO
 r++kcaLDeeH1Vepi3DR8wBd1y9K6sHsavOzkoGWr53Zm2Af2zJSlF/713oym7Sf4sH53
 iCIaAGphllAX0+k4R9t2KJOAV/Kfl7Cw0Onx81kN5OqW+FSc+d6LDeUqOdYAfujhwUiL
 wqPIgCnbXsjxT6mrspkdx+mhrhhtYszYKyj+4iBMqQZ8+OpwrBIAWvEohnjbIvtCU34I
 5aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aNJVMk9/wG0SFyaZdj1N3MH7r5/7pFj2WY68JsBgh60=;
 b=ATU56nnM7dry6aBhhWVp1MZQMeFyAJjt28QWQn1lF0ZgL01CrYolRIfPbA5IToIE1C
 k9o5Jjx8aDderON51j23MhkgP51/bZjNqoOqZH1cuD5sFQ9jgsw15y3xsM+Ng3wBaeJs
 uLislKTnVE/+qvNaUS9gYFPVRcjnAtO5jrMK2INLrTLZtVNqj4mg9IOVBr0cr9B3Bt1+
 K03tD8wDNA/qaHUlupEp36gYThqoT1Y5KYg7YSkq2EFj2VDNH2RUkwb4MCJPXaPmXCTP
 8q413Bjtg/Ba7dkYMlm+1YFzVumNq8LEnkGeBZ8nnsjkh5kSfLA+pix+xESyLEarXwB4
 UtcA==
X-Gm-Message-State: AOAM530G8aVa2YTmAJ8XHxeAMjofwYP829/BuIqvkVJiqvIPLIw52vT2
 g+Sd0QhfubEJVNz+HJ3ZJvxnxkFiRRAMaA==
X-Google-Smtp-Source: ABdhPJwDZZhxtbkgYqKmGQ8jIEOk3XYwvWD906SDrPsQfLwwB+EwcRh7lDqe+QO52LC2LyUab/Jmdg==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr6926307wrt.152.1626819840296; 
 Tue, 20 Jul 2021 15:24:00 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 139sm3857217wma.32.2021.07.20.15.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 15:23:59 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v6 11/17] hw/core: Introduce
 CPUClass.gdb_adjust_breakpoint
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-12-richard.henderson@linaro.org>
 <CAFEAcA93CkPxmWCnSDaaJ01iTZ2KbabFu_cBKp7O9+BDHHmKfw@mail.gmail.com>
 <6e101005-ce67-3179-b446-c9b963b6bda2@linaro.org>
 <2a1b3fb7-e701-f2a6-0777-caa90a9e3a51@amsat.org>
Message-ID: <7f5d1a72-4a50-b9dc-6300-6d3d7698415b@amsat.org>
Date: Wed, 21 Jul 2021 00:23:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a1b3fb7-e701-f2a6-0777-caa90a9e3a51@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Philippe Mathieu-Daudé wrote:
> On 7/20/21 11:08 PM, Richard Henderson wrote:
>> On 7/20/21 10:56 AM, Peter Maydell wrote:
>>> On Tue, 20 Jul 2021 at 20:54, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> This will allow a breakpoint hack to move out of AVR's translator.
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>
>>>> diff --git a/cpu.c b/cpu.c
>>>> index 83059537d7..91d9e38acb 100644
>>>> --- a/cpu.c
>>>> +++ b/cpu.c
>>>> @@ -267,8 +267,13 @@ static void breakpoint_invalidate(CPUState *cpu,
>>>> target_ulong pc)
>>>>   int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
>>>>                             CPUBreakpoint **breakpoint)
>>>>   {
>>>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>>>       CPUBreakpoint *bp;
>>>>
>>>> +    if (cc->gdb_adjust_breakpoint) {
>>>> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
>>>> +    }
>>>> +
>>>>       bp = g_malloc(sizeof(*bp));
>>>>
>>>>       bp->pc = pc;
>>>> @@ -294,8 +299,13 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr
>>>> pc, int flags,
>>>>   /* Remove a specific breakpoint.  */
>>>>   int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
>>>>   {
>>>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>>>       CPUBreakpoint *bp;
>>>>
>>>> +    if (cc->gdb_adjust_breakpoint) {
>>>> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
>>>> +    }
>>>> +
>>>>       QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>>>>           if (bp->pc == pc && bp->flags == flags) {
>>>>               cpu_breakpoint_remove_by_ref(cpu, bp);
>>>> -- 
>>>
>>> So previously for AVR we would have considered the bp at 0x100
>>> and the one at 0x800100 as distinct (in the sense that the only way
>>> the gdb remote protocol distinguishes breakpoints is by "what address",
>>> and these have different addresses). After this change, they won't
>>> be distinct, because if you set a bp at 0x100 and 0x800100 and then
>>> try to remove the one at 0x100 we might remove the 0x800100 one,
>>> because we're storing only the adjusted-address, not the one gdb used.

Yes. Looks good.

>>>
>>> This might not matter in practice...
>>
>> I don't think it will matter.
>>
>> Currently, if it sets both 0x100 and 0x800100, then we'll record two
>> breakpoints, and with either we'll raise EXCP_DEBUG when pc == 0x100.
>>
>> Afterward, we'll have two CPUBreakpoint structures that both contain
>> 0x100, and when pc == 0x100 we'll raise EXCP_DEBUG.  If gdb removes the
>> breakpoint at 0x800100, we'll remove one of the two CPUBreakpoint.  But
>> we'll still stop at 0x100, as expected.  When it removes the breakpoint
>> at 0x100, both CPUBreakpoint structures will be gone.
>>
>> In principal, gdb could now add a breakpoint at 0x800100 and remove it
>> with 0x100, where it could not before.  But I don't expect that to
>> happen.  If we reported any kind of status to gdb re the breakpoint
>> insertion or removal (e.g. bp not found), then it might matter, but we
>> don't.

IIUC QEMU model is "hardware breakpoint". I don't know how gdb deals
if user add both soft/hard bp. Neither do I know how many soft/hard
bp are "annouced" via gdbstub monitor to gdb (Alex?). Amusingly
gdb-xml/avr-cpu.xml announces itself as a riscv cpu:

<feature name="org.gnu.gdb.riscv.cpu">

Maybe because there is no official XML declaration for AVR?
https://sourceware.org/gdb/current/onlinedocs/gdb/Standard-Target-Features.html#Standard-Target-Features

>> Practically, this is working around what I'd call a gdb bug wrt avr. 
>> Which may even have been fixed -- I haven't looked.

I agree this won't matter much (and this patch makes it cleaner) so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

