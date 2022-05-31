Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A45395FC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 20:14:36 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw6O3-0007FI-6h
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 14:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nw6Ey-0003Nj-H4
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:05:30 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nw6Eu-0003ua-Nl
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:05:10 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MCJvA-1o4Nyl494c-009Nat; Tue, 31 May 2022 20:05:06 +0200
Message-ID: <1ff07914-426c-63d9-c18e-393213c30a72@vivier.eu>
Date: Tue, 31 May 2022 20:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
 <20220527164807.135038-11-richard.henderson@linaro.org>
 <34af03f0-6c53-17a3-b91f-d368fd2ef7c3@vivier.eu>
 <f8f38e0b-e99f-40d7-d4c7-7e2dc047d4c8@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v5 10/17] target/m68k: Implement TRAPcc
In-Reply-To: <f8f38e0b-e99f-40d7-d4c7-7e2dc047d4c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GrcjIbvWFqq5X6YJ/o0hz1dzB8Xej/dq7szb8bBwpnUlt2tzlkY
 VchOeEgBfT/X3FRPvL/kk6U6LXJEW+K5yDlmeGz/94PsK6O9PBpFAzDPkqUDMy+280/3ssj
 DwVHfGrNbCS4ZSH52Bb+WoolxGddVcBYQH9/q7EaFy8mS9xb6BFQubQOvZb5NJCmzM/Ez1k
 eMVsAP+B0bSSiGOV4sFyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bKoLUFZd/cE=:sIkxaPV57DmidD2u6xs3Hn
 gar7ysaGsj+x2k6K+OzMx4GjprO1UrpBHr/e6qtuaW/c/RBaOMoNoqGFn4efF1nbHLl+18o6D
 6tD3OY8txSHAd7I2Pm/1WC7lLDrnH627C3d7InLsDNyIMcUGHlazd7PWU4vBix7QoGd484/pk
 HRWrm85xMDUZiXHu97NYUJ93/Ll0oH1XpJ25UMThUegbHEg7+Ol7n0Lt3t0DPWlOf7Iyy6T5k
 Bdo2YKcETInlCGh1+sslwX/KjMvCyM0/C31ltU/vWyK/lEap3lSib97rIWoPsYIgVvTZzSE2f
 iH5rEGoufmTCe06rReWcwKxbOED8zG9G9b10OTiiwsn3nkgnEvzHQIga+1b4eITCbtxxthDca
 LbG9rBJoG6bs5vaJr5liYNMsrzHvkoR9ksACC3GkHHIVWiVABQcD3R9ZburIVUCO0hFyDI16P
 QQX9U9TiAAuPVMviR4VfnawC6Fe391/bBYPXD3oYgGS0sEJELmWSnvMHK8ptv4y6+A+E9uPD2
 9IJThOzqlkY8DbNPNlTCC0WXVMC2Xk4FFUEZyTkT0n3S6PbsA9zSrV5IWi3DQArWJV7VJIFd/
 pOO1J2TcykXGkM6adBTZECUHyGSU3kFMJBE0S0Efz4mrr00yj1WgBkQrp5LfBFOMtNTowjxOD
 +rNTSD/OzOIDlcMzrjVBZeUd9QPeH+sgLKu4hQASdeNPxxHEfMlX9tmK5I0YT5R1g8aHNkGnl
 Fd2A3Zx9GbuEjXtoE6fAxUgP+AS39vbJWZRRqg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/05/2022 à 16:59, Richard Henderson a écrit :
> On 5/31/22 01:01, Laurent Vivier wrote:
>> Le 27/05/2022 à 18:48, Richard Henderson a écrit :
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/m68k/cpu.h          |  2 ++
>>>   linux-user/m68k/cpu_loop.c |  1 +
>>>   target/m68k/cpu.c          |  1 +
>>>   target/m68k/op_helper.c    |  6 +----
>>>   target/m68k/translate.c    | 49 ++++++++++++++++++++++++++++++++++++++
>>>   5 files changed, 54 insertions(+), 5 deletions(-)
>>>
>> ...
>>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>>> index 399d9232e4..c4fe8abc03 100644
>>> --- a/target/m68k/translate.c
>>> +++ b/target/m68k/translate.c
>> ...
>>> @@ -6050,6 +6098,7 @@ void register_m68k_insns (CPUM68KState *env)
>>>       INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
>>>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>>>       INSN(dbcc,      50c8, f0f8, M68000);
>>> +    INSN(trapcc,    50f8, f0f8, TRAPCC);
>>>       INSN(tpf,       51f8, fff8, CF_ISA_A);
>>>       /* Branch instructions.  */
>>
>> This one breaks Mark's series to support MacOS.
>>
>> I think the new opcode short-circuits Scc one:
>>
>>    ----------------
>>    IN: INITRSRCMGR
>>    0x408011d0:  st 0xa58
>>    Disassembler disagrees with translator over instruction decoding
>>    Please report this to qemu-devel@nongnu.org
>>
>> The following patch seems to fix the problem:
>>
>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>> index d5d73401b7cc..3b0e3d0b58f6 100644
>> --- a/target/m68k/translate.c
>> +++ b/target/m68k/translate.c
>> @@ -6119,9 +6119,9 @@ void register_m68k_insns (CPUM68KState *env)
>>       INSN(addsubq,   5000, f080, M68000);
>>       BASE(addsubq,   5080, f0c0);
>>       INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
>> +    INSN(trapcc,    50f8, f0f8, TRAPCC);
>>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>>       INSN(dbcc,      50c8, f0f8, M68000);
>> -    INSN(trapcc,    50f8, f0f8, TRAPCC);
> 
> Hmm.  That will completely hide trapcc -- you should have seen the new test case fail (and if not, 
> the test case needs fixing).

I ran "make check", thinking the test is run, and saw no failure...
and if I run "make check-tcg", I have:
   make: Nothing to be done for 'check-tcg'.
so what is the command to run the test?

Thanks,
Laurent

