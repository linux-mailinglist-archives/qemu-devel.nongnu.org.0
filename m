Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE05038D88A
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 05:32:12 +0200 (CEST)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkeqZ-0005Gu-Jr
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 23:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkepa-0004Q1-FF
 for qemu-devel@nongnu.org; Sat, 22 May 2021 23:31:10 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lkepX-0004y4-3A
 for qemu-devel@nongnu.org; Sat, 22 May 2021 23:31:10 -0400
Received: by mail-pg1-x52e.google.com with SMTP id f22so16578445pgb.9
 for <qemu-devel@nongnu.org>; Sat, 22 May 2021 20:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pouKaQJKnouPdhDb2jmGwJJ4Z+aYKxUlYbT+nos65Mg=;
 b=2R4K8CAfiGxY+jhuVOiz+l0zOIjHkSWeEVEWDtiqFTm2DmXZsWRr4fX5Kpu1tgBZSl
 AbFYEBAn17W4cPRqSnqubWN2ePm8Ds+qm28hEEMbhZ/aO7kVTVYzbpsQoA5C9h3/dbC+
 94zGTPw1DzLJLQrWNARV2Z2O45YVKNNV8oW3n4hPw0+eqDohIGI/mlOyK0sZSal9ipFY
 dbsl9A5HOUZ+/cBap7b5kwIITG6EdMYZgGbzVReO5I+ZwwBENzj+EJ0w/tZ+S8ECL8OW
 NB1ioLGTuf48PgWOtzEq8mtw5QPHJjRELkcxHumf4uKHl6oDl49Uv9tUtyRlyyB5hkso
 cgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pouKaQJKnouPdhDb2jmGwJJ4Z+aYKxUlYbT+nos65Mg=;
 b=C08XJ3ag6zKlh7m8Qrws6yn61wlCdq5FHWkV0uSzIkUq2ASCgbQHv4sVZFJRydEZTN
 YHLQOtgnFxLXaBfBrRKdOa3OtKMSvlnCjY+1Fzy6XdKzt2GPHyXvnMhmBL8IWmaOVxtX
 5jb1IKYBFAot5yVsmVAaJAM5gkVoGxEGjg+YinBexYkEs2Z/RiCRbF757dBDtylUMppA
 BmvwQaV9W2/JjwB4GP0FJ14PfV5jrnlRvfqFbLlmftOQ+anJi+r4AolGMcsDlMCA7klr
 AAsLrgYEQxlBSG0XjW0XgOs3PD05ZTNhnyULJP4cr3XWd6kcGu8Dd6CgwygUtLMGd4lf
 LldQ==
X-Gm-Message-State: AOAM530VBJ4rguUSP9CUP2zb1xbhAU7LzuXEg66oO9sBn/juEhfR4Zfl
 uBgGnGbNvReF6nENtc+ZEF5nVw==
X-Google-Smtp-Source: ABdhPJyWiDRCpSSkl2hYbbYHdn/RM2XBmCExg/to/UcO8WfQh+cxZaCLNhOYwJpOPtWWraRYQ/ylJQ==
X-Received: by 2002:a62:90:0:b029:2db:90a5:74dc with SMTP id
 138-20020a6200900000b02902db90a574dcmr17790426pfa.27.1621740665468; 
 Sat, 22 May 2021 20:31:05 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id x29sm7974840pgl.49.2021.05.22.20.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 20:31:04 -0700 (PDT)
Message-ID: <8e2d201d-a6a3-72bc-5d0f-5226930f1cbc@ozlabs.ru>
Date: Sun, 23 May 2021 13:31:00 +1000
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
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <77716be-4cf7-d222-d465-13685bf0783a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52e.google.com
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



On 23/05/2021 01:02, BALATON Zoltan wrote:
> On Sat, 22 May 2021, BALATON Zoltan wrote:
>> On Sat, 22 May 2021, Alexey Kardashevskiy wrote:
>>> VOF itself does not prints anything in this patch.
>>
>> However it seems to be needed for linux as the first thing it does 
>> seems to be getting /chosen/stdout and calls exit if it returns 
>> nothing. So I'll need this at least for linux. (I think MorphOS may 
>> also query it to print a banner or some messages but not sure it needs 
>> it, at least it does not abort right away if not found.)
>>
>>>> but to see Linux output do I need a stdout in VOF or it will just 
>>>> open the serial with its own driver and use that?
>>>> So I'm not sure what's the stdout parts in the current vof patch 
>>>> does and if I need that for anything. I'll try to experiment with it 
>>>> some more but fixing the ld and Kconfig seems to be enough to get it 
>>>> work for me.
>>>
>>> So for the client to print something, /chosen/stdout needs to have a 
>>> valid ihandle.
>>> The only way to get a valid ihandle is having a valid phandle which 
>>> vof_client_open() can open.
>>> A valid phandle is a phandle of any node in the device tree. On spapr 
>>> we pick some spapr-vty, open it and store in /chosen/stdout.
>>>
>>> From this point output from the client can be seen via a tracepoint.
> 
> I've got it now. Looking at the original firmware device tree dump:
> 
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/PegasosII_OFW-Dump.txt 
> 
> 
> I see that /chosen/stdout points to "screen" which is an alias to 
> /bootconsole. Just adding an empty /bootconsole node in the device tree 
> and vof_client_open_store() that as /chosen/stdout works and I get 
> output via vof_write traces so this is enough for now to test Linux. 
> Properly connecting a serial backend can thus be postponed.
> 
> So with this the Linux kernel does not abort on the first device tree 
> access but starts to decompress itself then the embedded initrd and 
> crashes at calling setprop:
> 
> [...]
> vof_client_handle: setprop
> 
> Thread 4 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
> (gdb) bt
> #0  0x0000000000000000 in  ()
> #1  0x0000555555a5c2bf in vof_setprop
>      (vof=0x7ffff48e9420, vallen=4, valaddr=<optimized out>, 
> pname=<optimized out>, nodeph=8, fdt=0x7fff8aaff010, ms=0x5555564f8800)
>      at ../hw/ppc/vof.c:308
> #2  0x0000555555a5c2bf in vof_client_handle
>      (nrets=1, rets=0x7ffff48e93f0, nargs=4, args=0x7ffff48e93c0, 
> service=0x7ffff48e9460 "setprop",
>       vof=0x7ffff48e9420, fdt=0x7fff8aaff010, ms=0x5555564f8800) at 
> ../hw/ppc/vof.c:842
> #3  0x0000555555a5c2bf in vof_client_call
>      (ms=0x5555564f8800, vof=vof@entry=0x55555662a3d0, 
> fdt=fdt@entry=0x7fff8aaff010, args_real=args_real@entry=23580472)
>      at ../hw/ppc/vof.c:935
> 
> loooks like it's trying to set /chosen/linux,initrd-start:

It is not horribly clear why it crashed though.

> 
> (gdb) up
> #1  0x0000555555a5c2bf in vof_setprop (vof=0x7ffff48e9420, vallen=4, 
> valaddr=<optimized out>, pname=<optimized out>, nodeph=8,
>      fdt=0x7fff8aaff010, ms=0x5555564f8800) at ../hw/ppc/vof.c:308
> 308            if (!vmc->setprop(ms, nodepath, propname, val, vallen)) {
> (gdb) p nodepath
> $1 = "/chosen\000\060/rPC,750CXE/", '\000' <repeats 234 times>
> (gdb) p propname
> $2 = 
> "linux,initrd-start\000linux,initrd-end\000linux,cmdline-timeout\000bootarg" 
> 
> (gdb) p val
> $3 = <optimized out>
> 
> I think I need the callback for setprop in TYPE_VOF_MACHINE_IF. I can 
> copy spapr_vof_setprop() but some explanation on why that's needed might 
> help. Ciould I just do fdt_setprop in my callback as vof_setprop() would 
> do without a machine callback or is there some special handling needed 
> for these properties?

The short answer is yes, you do not need TYPE_VOF_MACHINE_IF.

The long answer is that we build the FDT on spapr twice:
1. at the reset time and
2. after "ibm,client-arhitecture-support" (early in the boot the spapr 
paravirtual client says what it supports - ISA level, MMU features, etc)

Between 1 and 2 the kernel moves initrd and we do not update the QEMU's 
version of its location, the tree at 2) will have the old values.

So for that reason I have TYPE_VOF_MACHINE_IF. You most definitely do 
not need it.


-- 
Alexey

