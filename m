Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852D37FC8B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:31:08 +0200 (CEST)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhFAx-0001SK-38
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhF8T-0008JL-19; Thu, 13 May 2021 13:28:33 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:48081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhF8P-0003gC-NU; Thu, 13 May 2021 13:28:32 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MybX9-1lHlcU01SH-00yysG; Thu, 13 May 2021 19:27:39 +0200
Subject: Re: [PATCH] target/avr: Ignore unimplemented WDR opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Fred Konrad <konrad@adacore.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210502190900.604292-1-f4bug@amsat.org>
 <36dd1481-d89e-5f1c-5715-9275df83b722@adacore.com>
 <e37dded2-7ed3-3878-7540-d693d8a45abb@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <84914648-70cc-0221-e7fe-3f0d74ec3dbe@vivier.eu>
Date: Thu, 13 May 2021 19:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e37dded2-7ed3-3878-7540-d693d8a45abb@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ry401a9UUNyDp1PU4mqT7S4GsE3i7P+QLnpNbldBusgteDB5oRg
 ELRHDNrQRCIATATFOqM5Az1VTrmpQnXF/P60OmQOyrvSNV77Q5IX/Kxmyhx+Ba9yWUwkdHc
 QuzxNdmxI0L1+hWYJOQmfTN6v+yT8aTSBYwHyg8veoTA6RLF491C8Sfmh3VG8ErZUKhfznt
 WFjWDODm4m3SK394Kma2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kSFfvjukpTo=:fyW+lOpNrCNoDl5jc/rQd/
 ohs8AM4AbtmEWLlzOCDIH9WiwgBpqhSEEG3qpIHBILrYTGdV80GgsHN17kVdCqP/yOK2waHaY
 pB60RJ3p8IfH0BrvU2xTGQt83M83/OG46ZXUO1rf3KErR9u5PSzTTw7ziDip8wMJBK21fJuvI
 TZhY2DG3ahRao5nhjPZCq3oue7fnokjRPm8wcNJjhJ4MQSPLPeQAKCftzBHMk+zNU9DfbTRRj
 p3fp74xM9kAmxqL11m9nD9oUYtWaNkOJtVNdHEsB6pNMpYUpL5OFDtzv4WB/tRcGh7YdBoFkm
 Y5MqQO8WCWNJO8ysValSO961rQJPCHgyMiPlzwelx9VNE1U05ve2qWfFjVgXDmUhS3OcnZVwe
 OQwCB2cwMpNUaaZC43G6eYjORfPVW606tTjIPD2XmQjEIKV7sO6V5jYNVO0y9foOwdw9PyUBt
 RfbfJvqQS0LFd7bRwyQ6AqOUfhwCo0z7WWaEUT7EPR1ybmpnkcGBV0KQMklvg3fqSH7xzWlOa
 7Ftu1RMg3DN0skyuk62Q38=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/05/2021 à 19:04, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial@

Applied to my trivial-patches branch.

Thanks,
Laurent

> On 5/5/21 3:35 PM, Fred Konrad wrote:
>> Le 5/2/21 à 9:09 PM, Philippe Mathieu-Daudé a écrit :
>>> Running the WDR opcode triggers a segfault:
>>>
>>>    $ cat > foo.S << EOF
>>>    > __start:
>>>    >     wdr
>>>    > EOF
>>>    $ avr-gcc -nostdlib -nostartfiles -mmcu=avr6 foo.S -o foo.elf
>>>    $ qemu-system-avr -serial mon:stdio -nographic -no-reboot \
>>>      -M mega -bios foo.elf -d in_asm --singlestep
>>>    IN:
>>>    0x00000000:  WDR
>>>    Segmentation fault (core dumped)
>>>
>>>    (gdb) bt
>>>       #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0)
>>> at ../gdbstub.c:718
>>>       #1  0x00005555add0b2dd in gdb_get_cpu_process
>>> (cpu=0x5555af5a4af0) at ../gdbstub.c:743
>>>       #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0)
>>> at ../gdbstub.c:2742
>>>       #3  0x00005555adc99b96 in cpu_handle_guest_debug
>>> (cpu=0x5555af5a4af0) at ../softmmu/cpus.c:306
>>>       #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0)
>>> at ../accel/tcg/tcg-accel-ops-rr.c:224
>>>       #5  0x00005555adefaf12 in qemu_thread_start
>>> (args=0x5555af5d9870) at ../util/qemu-thread-posix.c:521
>>>       #6  0x00007f692d940ea5 in start_thread () from
>>> /lib64/libpthread.so.0
>>>       #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6
>>>
>>> Since the watchdog peripheral is not implemented, simply
>>> log the opcode as unimplemented and keep going.
>>>
>>> Reported-by: Fred Konrad <konrad@adacore.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   target/avr/helper.c | 6 +-----
>>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/target/avr/helper.c b/target/avr/helper.c
>>> index 35e10195940..981c29da453 100644
>>> --- a/target/avr/helper.c
>>> +++ b/target/avr/helper.c
>>> @@ -188,11 +188,7 @@ void helper_break(CPUAVRState *env)
>>>     void helper_wdr(CPUAVRState *env)
>>>   {
>>> -    CPUState *cs = env_cpu(env);
>>> -
>>> -    /* WD is not implemented yet, placeholder */
>>> -    cs->exception_index = EXCP_DEBUG;
>>> -    cpu_loop_exit(cs);
>>> +    qemu_log_mask(LOG_UNIMP, "WDG reset (not implemented)\n");
>>>   }
>>
>> Seems ok to me, at least better than having a segfault.
>>
>> Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
>>
>>>     /*
>>>
>>
> 


