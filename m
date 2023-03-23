Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F566C6FC3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 18:55:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfP9N-0007Gg-AF; Thu, 23 Mar 2023 13:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfP9F-0007Eu-Ge; Thu, 23 Mar 2023 13:54:51 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfP9B-0003Ab-6S; Thu, 23 Mar 2023 13:54:46 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-17ab3a48158so23516296fac.1; 
 Thu, 23 Mar 2023 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679594083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rUmY+8+NxN3rU9m1IhlleCo7Y63Iu5sY7RsqdUJ7D5Q=;
 b=cxSFv+XNIJhcAi0UzokT472f0w4OhQYl09zLrgaavPk3UjSUg9EUjb0R1mgjreGiba
 Kzk04jReYhIf4oa65yhl8KZSCCJv7XJJMUcDQEyAYbO9i9siFr8NbysuzteinHufwJp0
 2nWkznh1cuNpANun+b4adoJVHTNGGEJRaGq1k47dJxMakSfbtlp7kkkEAiL7XeKJm2EH
 eimjF9c+VY8k5AIx1LNZbSIwbAKnfNJdbdvBbfQ4mDwwQb2HOg3YaWSJfgrhXfjldPgU
 H4Q3uPDpFDThAxu4+20KxKDY4Q+fspktMu71dpKhE7t4vv7rTqcBrhet9DT3L1+8oZWU
 dH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679594083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUmY+8+NxN3rU9m1IhlleCo7Y63Iu5sY7RsqdUJ7D5Q=;
 b=K4gjSRa53gfq5eE/ZOyQOnOfKxR+HiX/ZWbfbnJJkYOtRcHv+VzoFAbnsMfleP2a8D
 k0IYlUP3pBqy51jW25OS1QuDg02mGj1rYCHLBDgGveK9TuHV3sIxB8eQ08B6BAarwFw0
 +zIG7EqdETzNCYYWW98I9wbjLukSV96Mj07IrxIHPMSK3z9YZ7CndMTM8GaHmw4+1YdX
 BtpjopGT7rGtEQ6/AzSifiP6mJK7EtMKqw0LgiaIZ5L4eQZuFOJXVDdw3tYgxNHkcSNb
 YhunRWeElnuldM3XT6QBBbirzfQPQ3kit+Cdpb5ZNbvfYeP8uqu4xm96GVv7CJrOaByB
 5SKw==
X-Gm-Message-State: AAQBX9cn2daF3xSEhI4b0Py0MA5nXp5stGx9CftwILCvPlfu/u5xEvzH
 MtGYz9gsvTRsT+qrbyghbdY=
X-Google-Smtp-Source: AKy350ZwxUdEtJy8pwsVYVFxnmNJn8vGhdKHL9G48JN2xGbhgACEPln9nvfGht0gDb9zaspJkQhxGw==
X-Received: by 2002:a05:6870:c6a8:b0:17a:c838:24d2 with SMTP id
 cv40-20020a056870c6a800b0017ac83824d2mr2281411oab.27.1679594083448; 
 Thu, 23 Mar 2023 10:54:43 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 az15-20020a05687c230f00b0016a37572d17sm6483900oac.2.2023.03.23.10.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 10:54:43 -0700 (PDT)
Message-ID: <fda401e9-608d-a74b-9ff5-aa977d900cd5@gmail.com>
Date: Thu, 23 Mar 2023 14:54:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org
References: <20230323161053.412356-1-danielhb413@gmail.com>
 <20230323161053.412356-2-danielhb413@gmail.com>
 <CAFEAcA89KN5SEi5hFoKKpzVSo=xV3gCn7b2bMBhb5qoQ=U9_mg@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA89KN5SEi5hFoKKpzVSo=xV3gCn7b2bMBhb5qoQ=U9_mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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



On 3/23/23 14:38, Peter Maydell wrote:
> On Thu, 23 Mar 2023 at 16:11, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
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
>> One alternative would be to mark machine->fdt = NULL when exiting
>> arm_load_dtb() when freeing the fdt. Another is to not free the fdt and,
>> instead, update machine->fdt with the new fdt generated. This will
>> enable dumpdtb for all ARM machines that uses arm_load_dtb(), regardless
>> of having 'dtb_filename' or not.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
>> Reported-by: Markus Armbruster <armbru@redhat.com>i
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/arm/boot.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 50e5141116..9418cc3373 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -689,7 +689,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>       qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>>                                          rom_ptr_for_as(as, addr, size));
>>
>> -    g_free(fdt);
>> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
>> +    ms->fdt = fdt;
> 
> With this we're now setting ms->fdt twice for the virt board: we set
> it in create_fdt() in hw/arm/virt.c, and then we set it again here.
> Which is the right place to set it?
> 
> Is the QMP 'dumpdtb' command intended to dump the DTB only for
> board types where the DTB is created at runtime by QEMU? Or
> is it supposed to also work for DTBs that were originally
> provided by the user using the '-dtb' command line? The docs
> don't say. If we want the former, then we should be setting
> ms->fdt in the board code; if the latter, then here is right.

My original intent with this command was to dump the current state of the FDT,
regardless of whether the FDT was loaded via -dtb or at runtime.

Ideally it would also reflect hotplug changes that affects the FDT as well, although
I'm aware of only one board that does that (ppc64 pseries) and we would need some
work done that to update ms->fdt after the hotplug/hotunplug path.

Perhaps a doc path would also be good.


Daniel

> 
> thanks
> -- PMM

