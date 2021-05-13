Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00237FC80
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:27:10 +0200 (CEST)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF77-0004QX-Hs
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEkx-0001e3-Nf; Thu, 13 May 2021 13:04:15 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhEkv-0006W7-UC; Thu, 13 May 2021 13:04:15 -0400
Received: by mail-ej1-x633.google.com with SMTP id w3so40867371ejc.4;
 Thu, 13 May 2021 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j5RHZ9DrXt8/gDGNIrKUTqrxlNQ7eGxzhteGedTkRY8=;
 b=VXrzrFPJ2dvavSD/u62vVs7+eQNp92qPMpKbvLsFWR6EJWGqSL/TAeo/EmJNPhSbJk
 830QpHLz+wFRN+nHnhGzAXAmSeVsxUCV+phpqRSo2JtH3YFaTbTXkd+/OOcDpexQTzDX
 tG68nyJvU748V41qQNIFb0YwaKUNKa0MukDo1eG9P3nhJFH6yX2Bz1V50YujkctaCfIE
 KUjhZAQDDI93WLVw5etyLzejj75vQ6z8Mb6jH1IlXMTBO2tVfabH8L8F5Kt7kM3lr4IQ
 3HtN1nni/F3QnZl9pv2Ln8wRlNl4X4hf1Sl7HVCP7yaPd+tX867Hq1T63oKdyEN7zulX
 VMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j5RHZ9DrXt8/gDGNIrKUTqrxlNQ7eGxzhteGedTkRY8=;
 b=rh3TcV2/2VvH2HCZ4x18vka2STqRLouNx9Vib8QO/4ZmBswxu+mUpYbqf6aJPCoFVC
 1oml3uYEiVbUAWf8fVWGCfYOBYiQCsWsH+iEgDZ8qpXV5FAZHzjo6o9fow4TyPZfsxtT
 SKVrTRz5sKwScLNUnSVgy69idVh5gYEmt6yDP4ShKL99fshtCBd7Ekd2q9DmrAO0Iic9
 lN34xFYF+eq+imwzRVqaAaEMGxM9DVQ3NSJjvmCi8XJHDvMZCS4QK1SA2+RonT73YfdY
 oOSc7meaMDkpJrUumBmfmZDU7VFrSWSEfZp6J29tw0oJVojL0Dn7p0IGRMD+n9CpyJy8
 aUjA==
X-Gm-Message-State: AOAM5314IhlQajOCsdyBn20nZOJG8gSIhL+WrnpMe0raCzfKD07K671W
 pMZn68EZD/4BFlMMyabm/84=
X-Google-Smtp-Source: ABdhPJwXjKte0RQUmGkcr2IfffSXDNsTLbPgAP7xYPsJg91iEcEjJdHnsluU6JpBrdaks6X23uYBaA==
X-Received: by 2002:a17:907:a044:: with SMTP id
 gz4mr45035112ejc.55.1620925451783; 
 Thu, 13 May 2021 10:04:11 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k9sm2244440eje.102.2021.05.13.10.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:04:11 -0700 (PDT)
Subject: Re: [PATCH] target/avr: Ignore unimplemented WDR opcode
To: Fred Konrad <konrad@adacore.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210502190900.604292-1-f4bug@amsat.org>
 <36dd1481-d89e-5f1c-5715-9275df83b722@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e37dded2-7ed3-3878-7540-d693d8a45abb@amsat.org>
Date: Thu, 13 May 2021 19:04:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <36dd1481-d89e-5f1c-5715-9275df83b722@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 5/5/21 3:35 PM, Fred Konrad wrote:
> Le 5/2/21 à 9:09 PM, Philippe Mathieu-Daudé a écrit :
>> Running the WDR opcode triggers a segfault:
>>
>>    $ cat > foo.S << EOF
>>    > __start:
>>    >     wdr
>>    > EOF
>>    $ avr-gcc -nostdlib -nostartfiles -mmcu=avr6 foo.S -o foo.elf
>>    $ qemu-system-avr -serial mon:stdio -nographic -no-reboot \
>>      -M mega -bios foo.elf -d in_asm --singlestep
>>    IN:
>>    0x00000000:  WDR
>>    Segmentation fault (core dumped)
>>
>>    (gdb) bt
>>       #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0)
>> at ../gdbstub.c:718
>>       #1  0x00005555add0b2dd in gdb_get_cpu_process
>> (cpu=0x5555af5a4af0) at ../gdbstub.c:743
>>       #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0)
>> at ../gdbstub.c:2742
>>       #3  0x00005555adc99b96 in cpu_handle_guest_debug
>> (cpu=0x5555af5a4af0) at ../softmmu/cpus.c:306
>>       #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0)
>> at ../accel/tcg/tcg-accel-ops-rr.c:224
>>       #5  0x00005555adefaf12 in qemu_thread_start
>> (args=0x5555af5d9870) at ../util/qemu-thread-posix.c:521
>>       #6  0x00007f692d940ea5 in start_thread () from
>> /lib64/libpthread.so.0
>>       #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6
>>
>> Since the watchdog peripheral is not implemented, simply
>> log the opcode as unimplemented and keep going.
>>
>> Reported-by: Fred Konrad <konrad@adacore.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/avr/helper.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/target/avr/helper.c b/target/avr/helper.c
>> index 35e10195940..981c29da453 100644
>> --- a/target/avr/helper.c
>> +++ b/target/avr/helper.c
>> @@ -188,11 +188,7 @@ void helper_break(CPUAVRState *env)
>>     void helper_wdr(CPUAVRState *env)
>>   {
>> -    CPUState *cs = env_cpu(env);
>> -
>> -    /* WD is not implemented yet, placeholder */
>> -    cs->exception_index = EXCP_DEBUG;
>> -    cpu_loop_exit(cs);
>> +    qemu_log_mask(LOG_UNIMP, "WDG reset (not implemented)\n");
>>   }
> 
> Seems ok to me, at least better than having a segfault.
> 
> Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
> 
>>     /*
>>
> 

