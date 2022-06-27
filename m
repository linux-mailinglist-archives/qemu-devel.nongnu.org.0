Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EE855BB58
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:41:13 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sjX-00025i-72
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5sg0-0001Ab-JU; Mon, 27 Jun 2022 13:37:32 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5sfy-0005g5-Lz; Mon, 27 Jun 2022 13:37:32 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 w2-20020a056830110200b00616ce0dfcb2so2608294otq.1; 
 Mon, 27 Jun 2022 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zE64o4BCIT1J+QlUE2vMtQtt/N6X45FRyjcIMr3LCA0=;
 b=ZGL3AzYwPWioDvX79WPHAd1WdM9X2lNLBdg2ToTk5ETsrbjn7gwfIUXKy3a+j8kh1V
 6kKehg2+lfe/+CafXDDocWj4fdwLrTOupJnSakHh3lS2CNBsR2rcZJAMY86AkSseYmDn
 JICg0gZq4VlDn956GiIVDSF++v1JC0e/W9EA58BRPx0gM1XM2vduN3jSP9RSlSV3ayHi
 p5HrwAggCBNlN+WH5R2AxvuWyk26A+PDns+FtFfycfekKL5jT2TfTCN+1BI1eO3eTmWu
 Iy85KzKatdly1AY21q0SFUJ8OZz2TqehAVeD3Nl61K/1NLAdwRYjf+1HCQMNEKwdew/p
 pfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zE64o4BCIT1J+QlUE2vMtQtt/N6X45FRyjcIMr3LCA0=;
 b=HM5XlDk0aXzw9zNUHBQV/6OwbZIYHsEFXPVtw4jRawGAMowZpqrE4i3Ygp94gcbKJO
 oY5aVK9I9Lq45qFuVdGOo6sxzcEVLHQ204cd8Hwragi9aP/LJPwh0N1rn6x4RKtz8UuS
 DNySQKOWAhAyP7PVp0VsKzlGihlbkOUf6hJ2tZibBDNCgvtuinjwvQL6Xz9M2wsGpI/3
 rdcoYyiMwWkFzpwcOr7cpPfvyrKTYw3rF1Y9tbbA1ZvniiFh4AqdiI7dwev9z4FgIuTF
 uTjIH7ldTC/tWRFb8JnxNunsKk9M4N/ydSIl+7Ws9orhqxn0Cs3k8fRGr9uWNjgGUKJY
 4w9A==
X-Gm-Message-State: AJIora8uXZWhp4gfvfL4gbB+CXqnepPHMMSuO37HVEr0lpZfyLRFa4RX
 dAJhDiDpmOMjZJZfiOq2X+lq2YWQVk8=
X-Google-Smtp-Source: AGRyM1uX9kJIdyTGwXtm70nqUjCKfrhP1+wnv/A8Hs9/oUSRpXGpSCcankqssVR4LskdOJhFP7K2NA==
X-Received: by 2002:a05:6830:839:b0:616:9fe3:1a43 with SMTP id
 t25-20020a056830083900b006169fe31a43mr6259911ots.212.1656351449034; 
 Mon, 27 Jun 2022 10:37:29 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a056871068600b000f5eb6b409bsm7829020oao.45.2022.06.27.10.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 10:37:28 -0700 (PDT)
Message-ID: <b884118f-cc96-3d2f-8bd0-0bfc258b72c2@gmail.com>
Date: Mon, 27 Jun 2022 14:37:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220617060703.951747-1-aik@ozlabs.ru>
 <20220617060703.951747-2-aik@ozlabs.ru>
 <806270d7-c630-d436-43fc-bed8fd3ef694@gmail.com>
 <6fca16ae-5df2-0bc3-8a98-0d31594f89a9@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <6fca16ae-5df2-0bc3-8a98-0d31594f89a9@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 6/27/22 01:54, Alexey Kardashevskiy wrote:
> 
> 
> On 6/25/22 06:12, Daniel Henrique Barboza wrote:
>> Alexey,
>>
>> The newer version of this patch is having trouble with Gitlab runners, as
>> you can read in my feedback there.
>>
>> I've tested this one just in case. The same problems happen. E.g. for the
>> cross-armel-system runner:
>>
>>
>> In file included from ../hw/intc/pnv_xive.c:14:
>> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_block_id’:
>> /builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from ‘long long unsigned int’ to ‘long unsigned int’ changes value from ‘4222124650659840’ to ‘0’ [-Werror=overflow]
>>     45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> /builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of macro ‘GETFIELD’
>>     51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
>>        |                                          ^~~~
>> ../hw/intc/pnv_xive_regs.h:77:41: note: in expansion of macro ‘PPC_BITMASK’
>>     77 | #define  PC_TCTXT_CHIPID                PPC_BITMASK(12, 15)
>>        |                                         ^~~~~~~~~~~
>> ../hw/intc/pnv_xive.c:80:24: note: in expansion of macro ‘PC_TCTXT_CHIPID’
>>     80 |         blk = GETFIELD(PC_TCTXT_CHIPID, cfg_val);
>>        |                        ^~~~~~~~~~~~~~~
>> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_vst_addr’:
>> /builds/danielhb/qemu/target/ppc/cpu.h:45:33: error: conversion from ‘long long unsigned int’ to ‘long unsigned int’ changes value from ‘13835058055282163712’ to ‘0’ [-Werror=overflow]
>>     45 | #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> /builds/danielhb/qemu/target/ppc/cpu.h:51:42: note: in definition of macro ‘GETFIELD’
>>     51 |     (((word) & (mask)) >> __builtin_ctzl(mask))
>>        |                                          ^~~~
>> ../hw/intc/pnv_xive_regs.h:230:33: note: in expansion of macro ‘PPC_BITMASK’
>>    230 | #define VSD_MODE                PPC_BITMASK(0, 1)
>>        |                                 ^~~~~~~~~~~
>> ../hw/intc/pnv_xive.c:226:18: note: in expansion of macro ‘VSD_MODE’
>>    226 |     if (GETFIELD(VSD_MODE, vsd) == VSD_MODE_FORWARD) {
>>        |                  ^~~~~~~~
>> ../hw/intc/pnv_xive.c: In function ‘pnv_xive_end_update’:
>>
>>
>> Link:
>>
>> https://gitlab.com/danielhb/qemu/-/jobs/2637716673
>>
>>
>> I don´t know how to deal with that.
>>
>>
>> For the record: if this is too troublesome to fix, I am ok with just consolidating
>> the GETFIELD and SETFIELD inlines we already have, under cpu.h, keeping them exactly
>> as they are today (functions, not macros).
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>
>> On 6/17/22 03:07, Alexey Kardashevskiy wrote:
>>> It keeps repeating, move it to the header. This uses __builtin_ctzl() to
>>> allow using the macros in #define.
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>   include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
>>>   target/ppc/cpu.h                    |  5 +++++
>>>   hw/intc/pnv_xive.c                  | 20 --------------------
>>>   hw/intc/pnv_xive2.c                 | 20 --------------------
>>>   hw/pci-host/pnv_phb4.c              | 16 ----------------
>>>   5 files changed, 5 insertions(+), 72 deletions(-)
>>>
>>> diff --git a/include/hw/pci-host/pnv_phb3_regs.h b/include/hw/pci-host/pnv_phb3_regs.h
>>> index a174ef1f7045..38f8ce9d7406 100644
>>> --- a/include/hw/pci-host/pnv_phb3_regs.h
>>> +++ b/include/hw/pci-host/pnv_phb3_regs.h
>>> @@ -12,22 +12,6 @@
>>>   #include "qemu/host-utils.h"
>>> -/*
>>> - * QEMU version of the GETFIELD/SETFIELD macros
>>> - *
>>> - * These are common with the PnvXive model.
>>> - */
>>> -static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
>>> -{
>>> -    return (word & mask) >> ctz64(mask);
>>> -}
>>> -
>>> -static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
>>> -                                uint64_t value)
>>> -{
>>> -    return (word & ~mask) | ((value << ctz64(mask)) & mask);
>>> -}
>>> -
>>>   /*
>>>    * PBCQ XSCOM registers
>>>    */
>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>> index 6d78078f379d..9a1f1e9999a3 100644
>>> --- a/target/ppc/cpu.h
>>> +++ b/target/ppc/cpu.h
>>> @@ -47,6 +47,11 @@
>>>                                    PPC_BIT32(bs))
>>>   #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
>>> +#define GETFIELD(mask, word)   \
>>> +    (((word) & (mask)) >> __builtin_ctzl(mask))
> 
> 
> Replacing __builtin_ctzl with __builtin_ctzll seems fixing it though, do you have a quick way to test this? Gitlab's CI takes time :)
> https://gitlab.com/aik1/qemu/-/pipelines/573497191 is the current run.


I'll take a look, but apparently it fixed the problem I reported up above.

Also, there's an error in the msys2-64bit runner that I keep seeing from time to
time. It goes away eventually if you keep retrying it:


[301/1664] Generating input-keymap-qcode-to-qnum.c.inc with a custom command (wrapped by meson to capture output)
[302/1664] Generating input-keymap-qcode-to-sun.c.inc with a custom command (wrapped by meson to capture output)
[303/1664] Generating input-keymap-qnum-to-qcode.c.inc with a custom command (wrapped by meson to capture output)
[304/1664] Generating input-keymap-usb-to-qcode.c.inc with a custom command (wrapped by meson to capture output)
FAILED: ui/input-keymap-usb-to-qcode.c.inc
"C:/GitLab-Runner/builds/aik1/qemu/msys64/mingw64/bin/python3.exe" "C:/GitLab-Runner/builds/aik1/qemu/meson/meson.py" "--internal" "exe" "--capture" "ui/input-keymap-usb-to-qcode.c.inc" "--" "C:/GitLab-Runner/builds/aik1/qemu/msys64/mingw64/bin/python3.exe" "../ui/keycodemapdb/tools/keymap-gen" "code-map" "--lang" "glib2" "--varname" "qemu_input_map_usb_to_qcode" "../ui/keycodemapdb/data/keymaps.csv" "usb" "qcode"
[305/1664] Generating input-keymap-win32-to-qcode.c.inc with a custom command (wrapped by meson to capture output)
ninja: build stopped: subcommand failed.
make[1]: Leaving directory '/c/GitLab-Runner/builds/aik1/qemu/build'
make[1]: *** [Makefile:162: run-ninja] Error 1
make: *** [GNUmakefile:11: all] Error 2


It's a strange one because it's an error triggered by an ui/keymap file which you're
not changing.

Richard already created a thread about it in the QEMU ML, so I'll assume that
this has nothing to do with powerpc code.


Thanks,

Daniel


> Thanks,
> 
> 

