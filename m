Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A456CBB20
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 11:36:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph5iv-0001rd-20; Tue, 28 Mar 2023 05:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ph5it-0001rH-43; Tue, 28 Mar 2023 05:34:35 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ph5ir-0000gZ-Ce; Tue, 28 Mar 2023 05:34:34 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-17786581fe1so12044994fac.10; 
 Tue, 28 Mar 2023 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679996071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M9UTbfuV4KIr39wHK1mQkt25e/f5WxE4YQdfYqU8CTE=;
 b=SjInGqOm30IxMry9aBVlVtgFFy9ynNQHzIG8IAsAS7lq6nIpiMAb7G3pzYroHL7R9j
 nTBIfv1SBhzVy/eky4c/G6VyT2SgbIUGUJ9jVotXOhQUOElzAL3pPX2t44THZBG9Uwbg
 Z8ffujoesHG+ApR20ZoAtKbtH+/VT/1DZ57rx+J599HxXQr3ZgDCVcpSYO3fIFLDlN0B
 Bb4UrFAd0J8xrZ0diYjkhGTBvtFcI4pm4HopBOG/KNbekHH8P0WTHG5nDokO62yE8o2h
 f2+yABiGseJ0b/FPqHQYkBJ8yQ5p/bYJ2K7tTpzTdLsByXjmDQsXw6ckpFo0QramCLD3
 kdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679996071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9UTbfuV4KIr39wHK1mQkt25e/f5WxE4YQdfYqU8CTE=;
 b=a7ZmpsQmcBhL9h/v9QATH3wCvjiMe8F43vOKoXtOhnPWxpxw/XSTBpphhx1gU+QHk1
 I3ilj5IQVTfOj0cEzvWSoelgZnhMRIX57PVMCo8EK/gJVkfXZ/Hhs4w5JQmHkUR6T2XE
 u/NnyFf9P/DyxgkHLbUhek2DijJ0J60Em2b0WdixRAQABVOe7PSjXXHcws9PDVCWRt48
 IbbBjUXTzSL6u9v/IqwEJwPQX9GD6lo4DRDgodC29vnOTSoDty0c9KKjWwA9NoDohZ1E
 72L9dEwxUDkmD7iWKZIGrOhKTr4Wir+CseEoqdIIvQxrMFxcj3MXevJZPyh6mtu5gxy2
 2Qnw==
X-Gm-Message-State: AO0yUKW7KCw1jnVbSkhtBuGTujas+HfrvYUz6TvECrbnJ1X0qGO45OGm
 fFc9jyrOcNWM+N4KmSkXPJk=
X-Google-Smtp-Source: AKy350YWdYGbkI3U//YX4Kq0oG8/8wMvjG33gfpho7MKLOZZBwNdgmUl63cn1Ip51ilSS1IuVmwlYQ==
X-Received: by 2002:a05:6870:b622:b0:177:badc:6777 with SMTP id
 cm34-20020a056870b62200b00177badc6777mr9454086oab.44.1679996071379; 
 Tue, 28 Mar 2023 02:34:31 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056830160d00b0069fa35f05aesm6870779otr.28.2023.03.28.02.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 02:34:31 -0700 (PDT)
Message-ID: <49e58c51-fca4-6b6f-db4a-27e4cfefacd4@gmail.com>
Date: Tue, 28 Mar 2023 06:34:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20230323204414.423412-1-danielhb413@gmail.com>
 <20230323204414.423412-2-danielhb413@gmail.com> <87zg7x2wca.fsf@pond.sub.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87zg7x2wca.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/28/23 04:01, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> At this moment, arm_load_dtb() can free machine->fdt when
>> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
>> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
>> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
>> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
>> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>>
>> After the command 'dumpdtb' were introduced a couple of releases ago,
>> running it with any ARM machine that uses arm_load_dtb() will crash
>> QEMU.
>>
>> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
>> of freeing 'fdt', assign it back to ms->fdt.
>>
>> Note that all current callers (sbsa-ref.c, virt.c, xlnx-versal-virt.c)
>> are assigning ms->fdt before arm_load_dtb() is called, regardless of
>> whether the user is inputting an external FDT via '-dtb'. To avoid
>> leaking the board FDT if '-dtb' is used (since we're assigning ms->fdt
>> in the end), free ms->fdt before load_device_tree().
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
>> Reported-by: Markus Armbruster <armbru@redhat.com>i
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/arm/boot.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 50e5141116..de18c0a969 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -549,6 +549,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>               goto fail;
>>           }
>>   
>> +        /*
>> +         * If we're here we won't be using the ms->fdt from the board.
>> +         * We'll assign a new ms->fdt at the end, so free it now to
>> +         * avoid leaking the board FDT.
>> +         */
>> +        g_free(ms->fdt);
>> +
> 
> "We will" is not true: we will not if we goto fail.  Leaves ms->fdt
> dangling, doesn't it?

We can postpone this g_free() to execute after "if (!fdt) {}" to be sure that we're
not freeing ms->fdt right before 'goto fail'.

> 
>>           fdt = load_device_tree(filename, &size);
>>           if (!fdt) {
>>               fprintf(stderr, "Couldn't open dtb file %s\n", filename);
>                 g_free(filename);
>                 goto fail;
>             }
>             g_free(filename);
>         } else {
>             fdt = binfo->get_dtb(binfo, &size);
>             if (!fdt) {
>                 fprintf(stderr, "Board was unable to create a dtb blob\n");
>                 goto fail;
>             }
> 
> If we succeed, we'll assign @fdt to ms->fdt (next hunk).  Won't this
> leak old ms->fdt?


For all callers binfo->get_dtb() is returning ms->fdt, i.e. this line:

              fdt = binfo->get_dtb(binfo, &size);

Is equal to this:

              fdt = ms->fdt;

And this is why we can't unconditionally do a g_free(ms->fdt).


I believe we can improve the ARM boot code to not create ms->fdt at init(),
leaving it unassigned, and make get_dtb() return the machine FDT on a common
"void *" pointer. That would spare us from having go g_free(ms->fdt) to avoid
leaks and we would assign ms->fdt at the end of arm_load_dtb() normally. I made
a quick attempt at that but the ARM init() code is a little tricker than I've
anticipated. I might have a crack at it later.


Thanks,

Daniel


> 
>         }
> 
>> @@ -689,7 +696,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>       qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>                                          rom_ptr_for_as(as, addr, size));
>>   
>> -    g_free(fdt);
>> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
>> +    ms->fdt = fdt;
>>   
>>       return size;
> 

