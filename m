Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217873D03A9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:10:04 +0200 (CEST)
Received: from localhost ([::1]:34018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5x06-0003H3-Ks
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5wz2-0002bE-6U
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:08:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5wz0-0006JG-DR
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:08:55 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so412876pjb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8kmqgPWEysybt/AI4sOpcXLaJcF21rQQXTxUVQhtuJk=;
 b=HihCGO4bwm89qcqpWWRJejwtOkiuJwBF0C/xKl/5nM/QXY+7RrDiIdP1yFxCEeps+x
 xTBEvlHUA3F0gSjJ6BDJLSZ9RINpU9GYId9OOPdch4nYTYOFQoOSLz0FGt0HlDZeuSam
 PHcIEzue2lE8iGWknLKec8rTLfI3Ke67+L1r5KgLlfnMua/Zn+dY7zuIurrYK1XkHn3O
 NKAO6kundoGi0KWYPmritwqlaVcRkx4r7LARHY64cu12TaBAJJvUbxFxYcmey8kqpBhC
 sEC9LlWhmmvcFR7tLLgfskCDtCJFCpValbTdHH/GwGBUqF+Id1cR9tLESI3N/4j40+Az
 X88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8kmqgPWEysybt/AI4sOpcXLaJcF21rQQXTxUVQhtuJk=;
 b=PJSw3wCNhRta19GONLWcUNikqK3KPhsuqcJwUx/2X8uIj8PDb1nq7UQlh5qpjkzttm
 72I/NSuflZs6hF6fvPODhoQjvPuIfc0a2cOMlaiCRoNKE0ZOC8WJLVwMqILJq1h16FZq
 6RXwtJY9mBEL2YGqvhPps4WI4qrxzcMlsOFN3HMo1NbJwnvoED5MTvS0rD6JKfhHOLAl
 wL1zBOpCZToTKrYqwHjWzc8OAhACHyLRURLHR1xRPBtIUpEHxSJKjV+3/wfNAM3W9ena
 cKr9dx5tCh/1IVQ6geO9D9kBbS2DNyCFK22zpU6i0NYaSngGgKH1U4P0VK5m59J8VpK8
 xHpQ==
X-Gm-Message-State: AOAM530CGVTLaKPz+YLJWJJko8PJ9eb/g8lJhHNu46bZZzCkrU/B9CU8
 GmYksFh/iE/6w97NG/aFYN9smg==
X-Google-Smtp-Source: ABdhPJyzp4D0Vot3se8I4hTVHJAG2J2veUk+7GEpahrru0mT6Kwh5ACdk8VORR5Vki177CF7ClZ2Sg==
X-Received: by 2002:a17:902:be15:b029:12b:6438:af13 with SMTP id
 r21-20020a170902be15b029012b6438af13mr20283197pls.74.1626815332813; 
 Tue, 20 Jul 2021 14:08:52 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w6sm27746950pgh.56.2021.07.20.14.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 14:08:52 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v6 11/17] hw/core: Introduce
 CPUClass.gdb_adjust_breakpoint
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-12-richard.henderson@linaro.org>
 <CAFEAcA93CkPxmWCnSDaaJ01iTZ2KbabFu_cBKp7O9+BDHHmKfw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e101005-ce67-3179-b446-c9b963b6bda2@linaro.org>
Date: Tue, 20 Jul 2021 11:08:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA93CkPxmWCnSDaaJ01iTZ2KbabFu_cBKp7O9+BDHHmKfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 10:56 AM, Peter Maydell wrote:
> On Tue, 20 Jul 2021 at 20:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This will allow a breakpoint hack to move out of AVR's translator.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> diff --git a/cpu.c b/cpu.c
>> index 83059537d7..91d9e38acb 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -267,8 +267,13 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>>   int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
>>                             CPUBreakpoint **breakpoint)
>>   {
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>       CPUBreakpoint *bp;
>>
>> +    if (cc->gdb_adjust_breakpoint) {
>> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
>> +    }
>> +
>>       bp = g_malloc(sizeof(*bp));
>>
>>       bp->pc = pc;
>> @@ -294,8 +299,13 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
>>   /* Remove a specific breakpoint.  */
>>   int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
>>   {
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>       CPUBreakpoint *bp;
>>
>> +    if (cc->gdb_adjust_breakpoint) {
>> +        pc = cc->gdb_adjust_breakpoint(cpu, pc);
>> +    }
>> +
>>       QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>>           if (bp->pc == pc && bp->flags == flags) {
>>               cpu_breakpoint_remove_by_ref(cpu, bp);
>> --
> 
> So previously for AVR we would have considered the bp at 0x100
> and the one at 0x800100 as distinct (in the sense that the only way
> the gdb remote protocol distinguishes breakpoints is by "what address",
> and these have different addresses). After this change, they won't
> be distinct, because if you set a bp at 0x100 and 0x800100 and then
> try to remove the one at 0x100 we might remove the 0x800100 one,
> because we're storing only the adjusted-address, not the one gdb used.
> 
> This might not matter in practice...

I don't think it will matter.

Currently, if it sets both 0x100 and 0x800100, then we'll record two breakpoints, and with 
either we'll raise EXCP_DEBUG when pc == 0x100.

Afterward, we'll have two CPUBreakpoint structures that both contain 0x100, and when pc == 
0x100 we'll raise EXCP_DEBUG.  If gdb removes the breakpoint at 0x800100, we'll remove one 
of the two CPUBreakpoint.  But we'll still stop at 0x100, as expected.  When it removes 
the breakpoint at 0x100, both CPUBreakpoint structures will be gone.

In principal, gdb could now add a breakpoint at 0x800100 and remove it with 0x100, where 
it could not before.  But I don't expect that to happen.  If we reported any kind of 
status to gdb re the breakpoint insertion or removal (e.g. bp not found), then it might 
matter, but we don't.

Practically, this is working around what I'd call a gdb bug wrt avr.  Which may even have 
been fixed -- I haven't looked.


r~

