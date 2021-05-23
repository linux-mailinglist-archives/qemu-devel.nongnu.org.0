Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A538D892
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 05:42:48 +0200 (CEST)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkf0p-0000LB-6d
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 23:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkf03-0007wM-FD
 for qemu-devel@nongnu.org; Sat, 22 May 2021 23:41:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkf01-0001wD-7g
 for qemu-devel@nongnu.org; Sat, 22 May 2021 23:41:59 -0400
Received: by mail-pj1-x1033.google.com with SMTP id q6so12967129pjj.2
 for <qemu-devel@nongnu.org>; Sat, 22 May 2021 20:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yskZ4qnLobpXmD2qmeuo4nNrHF5izuHuRFcohLP7Llo=;
 b=U+OBl9dcu01cC3jHwG2ra0QkMP7CM8ZPgaLd/k9awCEqF4/8cdZg9KLB1uQ5ET4sHr
 wXrla3eJhqlS5uUl2Z0JmWKTZ0uzrCtCrByIVzUGzYEdAMa7yrpf3jJhgtpBKyHEuVSf
 7VOQSQnN0JYShSpRRCYSWh4hBiMX4750DW8j3sJKcxdRDLlxuNF9iz/FTN460vj26KSI
 3uQTsyTx+XJXdij4c3oZKuKgVbADs8mMcJHZ1i6UCJ4mzTMa9ZE7JpArwpUVLNaPdtui
 3T9ze3r2JoKaWuQBNcgkysevr4NtzT8/zQ/RZ/vWrVuL37cSJ3xktjIvoBnCMaA7njqJ
 YpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yskZ4qnLobpXmD2qmeuo4nNrHF5izuHuRFcohLP7Llo=;
 b=i5es9V1GSh/x8+VPsZmXGvJhiknaXJvhs/ieP9G1BBUPcP5VJ4ALdRqvU6uEs+AIzl
 OrHi1KI9Tj2xsAMYqgjeqr0et7JVX9UjZeX/dbwLMZHqpYDEH4Va+WRgr+CxztZ86d1/
 yuiD8AlgV09tTXyt4AqUBMNYPrqNf5KtCztzjeRjCp309WOzW2kibqY66ev7d9856IN6
 T6Jg2JUaHQL5bxBjk07Qjy5jqVmiLx4SzFAmnakpSeMe02mAiVm6NzI8T6RfSzX++pW4
 p20PS51TDugCfLnTpIfAzsq/g/6STGsNtKrXvKQybQoy3tXk6/iLcEIfLHqjJMLB0OyR
 62UQ==
X-Gm-Message-State: AOAM533kh6G1VusjTm5JJTpX8bg4hbuaJ68zVQSzheqG3A6+6fU3o2Mn
 pfROBHLxJYlZzzoAL5NBorw4MQ==
X-Google-Smtp-Source: ABdhPJwqcoJ0rRtIxS3PGpC3exXZOZOZhDxaZHEAY3Cj+nNAAAiemQLJpfPLIDTFRIEF9pCnoahkMw==
X-Received: by 2002:a17:90a:67c6:: with SMTP id
 g6mr18481069pjm.198.1621741314369; 
 Sat, 22 May 2021 20:41:54 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id s48sm7412370pfw.205.2021.05.22.20.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 20:41:53 -0700 (PDT)
Message-ID: <e7e713d1-2183-ee80-b8e2-e1ba6da9e0f0@ozlabs.ru>
Date: Sun, 23 May 2021 13:41:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <77716be-4cf7-d222-d465-13685bf0783a@eik.bme.hu>
 <50b35f3-a92c-ea97-7096-3c854f636ed@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <50b35f3-a92c-ea97-7096-3c854f636ed@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.837,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23/05/2021 02:46, BALATON Zoltan wrote:
> On Sat, 22 May 2021, BALATON Zoltan wrote:
>> On Sat, 22 May 2021, BALATON Zoltan wrote:
>>> On Sat, 22 May 2021, Alexey Kardashevskiy wrote:
>>>> VOF itself does not prints anything in this patch.
>>>
>>> However it seems to be needed for linux as the first thing it does 
>>> seems to be getting /chosen/stdout and calls exit if it returns 
>>> nothing. So I'll need this at least for linux. (I think MorphOS may 
>>> also query it to print a banner or some messages but not sure it 
>>> needs it, at least it does not abort right away if not found.)
>>>
>>>>> but to see Linux output do I need a stdout in VOF or it will just 
>>>>> open the serial with its own driver and use that?
>>>>> So I'm not sure what's the stdout parts in the current vof patch 
>>>>> does and if I need that for anything. I'll try to experiment with 
>>>>> it some more but fixing the ld and Kconfig seems to be enough to 
>>>>> get it work for me.
>>>>
>>>> So for the client to print something, /chosen/stdout needs to have a 
>>>> valid ihandle.
>>>> The only way to get a valid ihandle is having a valid phandle which 
>>>> vof_client_open() can open.
>>>> A valid phandle is a phandle of any node in the device tree. On 
>>>> spapr we pick some spapr-vty, open it and store in /chosen/stdout.
>>>>
>>>> From this point output from the client can be seen via a tracepoint.
>>
>> I've got it now. Looking at the original firmware device tree dump:
>>
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/PegasosII_OFW-Dump.txt 
>>
>>
>> I see that /chosen/stdout points to "screen" which is an alias to 
>> /bootconsole. Just adding an empty /bootconsole node in the device 
>> tree and vof_client_open_store() that as /chosen/stdout works and I 
>> get output via vof_write traces so this is enough for now to test 
>> Linux. Properly connecting a serial backend can thus be postponed.
> 
> Using /failsafe instead of /bootconsole is even better because Linux 
> then adds console=ttyS0 to the bootargs by default as it knows that's a 
> serial port.

When linux boots so far that it can use whatever is passed in "console=" 
- the client interface is done pretty much and the output happens 
without it.


> 
>> So with this the Linux kernel does not abort on the first device tree 
>> access but starts to decompress itself then the embedded initrd and 
>> crashes at calling setprop:
>>
>> [...]
>> vof_client_handle: setprop
>>
>> Thread 4 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
>> (gdb) bt
>> #0  0x0000000000000000 in  ()
>> #1  0x0000555555a5c2bf in vof_setprop
>>    (vof=0x7ffff48e9420, vallen=4, valaddr=<optimized out>, 
>> pname=<optimized out>, nodeph=8, fdt=0x7fff8aaff010, ms=0x5555564f8800)
>>    at ../hw/ppc/vof.c:308
>> #2  0x0000555555a5c2bf in vof_client_handle
>>    (nrets=1, rets=0x7ffff48e93f0, nargs=4, args=0x7ffff48e93c0, 
>> service=0x7ffff48e9460 "setprop",
>>     vof=0x7ffff48e9420, fdt=0x7fff8aaff010, ms=0x5555564f8800) at 
>> ../hw/ppc/vof.c:842
>> #3  0x0000555555a5c2bf in vof_client_call
>>    (ms=0x5555564f8800, vof=vof@entry=0x55555662a3d0, 
>> fdt=fdt@entry=0x7fff8aaff010, args_real=args_real@entry=23580472)
>>    at ../hw/ppc/vof.c:935
>>
>> loooks like it's trying to set /chosen/linux,initrd-start:
>>
>> (gdb) up
>> #1  0x0000555555a5c2bf in vof_setprop (vof=0x7ffff48e9420, vallen=4, 
>> valaddr=<optimized out>, pname=<optimized out>, nodeph=8,
>>    fdt=0x7fff8aaff010, ms=0x5555564f8800) at ../hw/ppc/vof.c:308
>> 308            if (!vmc->setprop(ms, nodepath, propname, val, vallen)) {
>> (gdb) p nodepath
>> $1 = "/chosen\000\060/rPC,750CXE/", '\000' <repeats 234 times>
>> (gdb) p propname
>> $2 = 
>> "linux,initrd-start\000linux,initrd-end\000linux,cmdline-timeout\000bootarg" 
>>
>> (gdb) p val
>> $3 = <optimized out>
>>
>> I think I need the callback for setprop in TYPE_VOF_MACHINE_IF. I can 
>> copy spapr_vof_setprop() but some explanation on why that's needed 
>> might help. Ciould I just do fdt_setprop in my callback as 
>> vof_setprop() would do without a machine callback or is there some 
>> special handling needed for these properties?
> 
> Just returning true from the setprop callback of the VofMachineIfClass 
> for now to see what it would do and then it gets to all the way of 
> calling quiesce. Unfortunately it then tries to call prom_printf on 
> Pegasos2 as seen here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/powerpc/kernel/prom_init.c?h=v4.14.233#n3261 
> 
> 
> which does not work because I have to shut down vhyp at quiesce 

What is vhyp and why do you have to shut it down?


> otherwise it trips an assert on writing sdr1 (and may also interfere 
> with the guest's usage of syscalls).

Where is that assert?

I am a bit lost here. Nothing in the current VOF should touch any actual 
device, it prints via tracepoints or (with that additional patch) to a 
chardev backend.


> So I need a way to not generate an 
> exception if the guest calls back into OF after quiesce. A hacky 
> solution is to patch out the sc 1 or _prom_entry point to just return 
> after quiesce but maybe a better way is needed such as a switch in 
> vof.bin that it checks before doing a syscall. Other than this problem 
> it seems to work for the most part so maybe making the _prom_entry check 
> some global value that I can set from quiesce to stop it doing syscalls 
> and just return would be the simplest way to avoid this crash in Linux 
> and not need a special version of vof for pegasos2. (MorphOS does not 
> seem to call OF after quiesce which seems safer to do anyway, don't know 
> why Linux does that. It could just print that one line before quiesce 
> and then it would work, unfortunately that's not what they did.)

quiesce is supposed to wait until ongoing DMA is finished (or something 
like that), it was (people say) a request from Apple back then and was 
never really architected.


-- 
Alexey

