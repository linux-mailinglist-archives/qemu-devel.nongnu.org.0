Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F058D05E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 01:08:04 +0200 (CEST)
Received: from localhost ([::1]:44952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLBqo-0002hd-S7
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 19:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLBk0-0000aJ-Oo; Mon, 08 Aug 2022 19:00:59 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLBjy-0004wm-Jg; Mon, 08 Aug 2022 19:00:56 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id q190so10322520vsb.7;
 Mon, 08 Aug 2022 16:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=tYrhbPSVMEyUgYLb39sWhC6Y4w5M1fTvg/pMZnQuYos=;
 b=Yprf/CakZcuqi+Fnzd/yIXZIZE0IlQNrIL0uwdtdkBzPo9Zj48OTuA3T/Jzk8nsirH
 /QbgVdbm1pCil0AOd5R39ZNy+Av+x1CmF7rfm7Uy1YmyRM+f7WyaCvXNDXn74KCxkUUi
 5+/CZLz+DdWiHZtAwwCgWRieHUOyerC0izidyC8K1XBafoCEyJaXnE05poCFzRR4UNBt
 YtL0z5gZ4L4k7z+STNE40rV9OKtA/b6E9KGOOh1EWsE58aEJyA08ETNfijqHyWL+PEkV
 nxq8EoeIrjzQkohPwgLNrjYrrV++/hclKrKyNaeLam9x+PDPdGVDjUG1Em0fyB4b7qCh
 F0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=tYrhbPSVMEyUgYLb39sWhC6Y4w5M1fTvg/pMZnQuYos=;
 b=Qv3w54ovvkLBIJnCA8zgWdmY5a/WiUXXEaECO4lzQ27fmTXvUx49ZVyI1cnogiol12
 Ha/1VNlCwx+wRAQYd5zz6/M1LXz2FdK6PR3ycdCAu3f7x4rT0gopTbrdu8LF6OoBtdct
 N738q0wNpK/v/URFldIihiCtam9tXswBTUOGkuH50NvUzpoPSbIcYkQJoOfYZUqI1sXX
 z0rU2kl4UD2oJ4QYsMalqOxaZgatTmwU3qjDmw+8LLWNS7xbyS5oYX7zwuVmS/7GkIiL
 TgLeNl1nYpetAHmZtjTXzV3eoJvOadVQOPhjNbNjaq6NItvbYw2mGcgymUA/lEymkNbT
 +5/Q==
X-Gm-Message-State: ACgBeo079DAMiC/9vEaZjQ2zJVvSDjDUuv+hfgxkrs2K5FTuLSPMPMuF
 RQ9S0sRL/hLTmx8DsPh6zqc=
X-Google-Smtp-Source: AA6agR5UbyNOBr3Lk8OIGpJc6liRsDvaS5u9MoKDWfMmPYYNpP2uyFO4YcLWAa3tMZoDVvZD3N/yXw==
X-Received: by 2002:a05:6102:a22:b0:388:4f17:6b9d with SMTP id
 2-20020a0561020a2200b003884f176b9dmr8029536vsb.58.1659999653216; 
 Mon, 08 Aug 2022 16:00:53 -0700 (PDT)
Received: from [192.168.10.102] (201-68-49-100.dsl.telesp.net.br.
 [201.68.49.100]) by smtp.gmail.com with ESMTPSA id
 d22-20020ab03196000000b00385f5f34da7sm10540084uan.16.2022.08.08.16.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 16:00:52 -0700 (PDT)
Message-ID: <b4c6bcea-acc7-fed8-44e1-77bcf1a28c3b@gmail.com>
Date: Mon, 8 Aug 2022 20:00:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 v2 01/20] hw/arm: do not free machine->fdt in
 arm_load_dtb()
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-2-danielhb413@gmail.com> <YvCBwE200sVzMixz@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YvCBwE200sVzMixz@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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



On 8/8/22 00:23, David Gibson wrote:
> On Fri, Aug 05, 2022 at 06:39:29AM -0300, Daniel Henrique Barboza wrote:
>> At this moment, arm_load_dtb() can free machine->fdt when
>> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
>> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
>> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
>> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
>> arm_load_dtb() will make machine->fdt point to an invalid memory region.
>>
>> This is not an issue right now because there's no code that access
>> machine->fdt after arm_load_dtb(), but we're going to add a couple do
>> FDT HMP commands that will rely on machine->fdt being valid.
>>
>> Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
>> machine->fdt. This will allow the FDT of ARM machines that relies on
>> arm_load_dtb() to be accessed later on.
>>
>> Since all ARM machines allocates the FDT only once, we don't need to
>> worry about leaking the existing FDT during a machine reset (which is
>> something that other machines have to look after, e.g. the ppc64 pSeries
>> machine).
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/arm/boot.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index ada2717f76..9f5ceb62d2 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -684,7 +684,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>        */
>>       rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
>>   
>> -    g_free(fdt);
>> +    /*
>> +     * Update the ms->fdt pointer to enable support for 'dumpdtb'
>> +     * and 'info fdt' commands. Use fdt_pack() to shrink the blob
>> +     * size we're going to store.
>> +     */
>> +    fdt_pack(fdt);
>> +    ms->fdt = fdt;
>>   
>>       return size;
> 
> fdt_pack() could change (reduce) the effective size of the dtb blob,
> so returning a 'size' value from above rather than the new value of
> fdt_totalsize(fdt) doesn't see right.
> 
> I believe some of the other patches in the series have similar concerns.

Ok! I'll revisit those patches and be sure to return the updated value
of the fdt.


Thanks,


Daniel

> 

