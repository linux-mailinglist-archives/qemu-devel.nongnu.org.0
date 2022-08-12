Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D953E591717
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 00:04:53 +0200 (CEST)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMclw-00084r-K6
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 18:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMckg-0006Vh-Ei; Fri, 12 Aug 2022 18:03:34 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:37803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMcke-00084k-Kv; Fri, 12 Aug 2022 18:03:34 -0400
Received: by mail-ua1-x929.google.com with SMTP id 38so803869uau.4;
 Fri, 12 Aug 2022 15:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kM9vEiKOIgNnWwn/LCRDisQyrRsPNNHjB+s+Dk18WAk=;
 b=HEnChPUEWm99Dg7LdYrDEdQUkxoc5g5kYbnVIKALoCsHtebPYJ4jh5DpY16lxYGfpi
 cdHsISNwu2866wmpq2lQBjt1Sss+ekR90oO2pNQk3k4XfCtgucGWmH19Fi4KklrrsCm0
 EbHn4R8oPyoDW+OAr0z9bkEC99G9JQfXyLorW92SEGslrL/SCuAw2GOrXBhNSWeHAMAk
 /jXzz0xAjMw1x9UlN1zJ2RNjnY9618NghdKfTajKvUCG9bds23GWS+7JGSwEnPEUvGsL
 4FAd9jvsDfYX9vwaz4mXGprCfesVgEE4tIkbK3Xax/LXH2RKdM0qFLkQqvKGlAM1BNe7
 eToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kM9vEiKOIgNnWwn/LCRDisQyrRsPNNHjB+s+Dk18WAk=;
 b=ix2719DQfRbibO1nGiJA4L0xGRRaSGMDP21kqmlQS8a4AAOesy2C5Mp7CefYgYYtFK
 YvjSFR1gr0biO23zIJR/ZOqkjlB5rJapA0OlR5l2ikVfXhQl+5+ecF4g3kyn5SUgpNdl
 r+ZvGnDR3pWkT6pYe54NMaL2IkiObEQRKhNtxo4aq/8yexpBnB2fHJO2bPOQFuxyWT3K
 FmgfuFPkxXI6my8f35ZEDVfdQrYAtcjkcRZbvzBN33AzNPFsYOm62AXNkAaPFMds5Yl7
 tF/l4pVZ2IrYz4rIpUtWw3IwX42ufNf4Tx+Q3ezz5rsLxOjQ+X7wB+2IUBICe+HB4GT5
 mF/g==
X-Gm-Message-State: ACgBeo1n3gxv25N+U/gx5ehUX/kH9Zd3el1nwfsTZsHjuaITj6KA/vms
 Xza2XdxuzI6jxZEZVNoP8mw=
X-Google-Smtp-Source: AA6agR5vgVewyE/qqbgO4/eo3j2PBQwhK8AuVrgAucSL70YigD/DjX85XLWzJ2thjVMalk7TZ7U7FA==
X-Received: by 2002:ab0:3da5:0:b0:382:7933:fdcc with SMTP id
 l37-20020ab03da5000000b003827933fdccmr2817471uac.88.1660341810867; 
 Fri, 12 Aug 2022 15:03:30 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 m23-20020a056102053700b00388510a234dsm2004831vsa.4.2022.08.12.15.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 15:03:30 -0700 (PDT)
Message-ID: <2414971c-5e65-96f2-26ee-6d0a35823bdd@gmail.com>
Date: Fri, 12 Aug 2022 19:03:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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

David,

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

After some thought I think executing fdt_pack() like I'm doing here is not
a good idea. The first problem is that I'm not returning the updated size,
as you've said.

But I can't just amend a 'return fdt_totalsize(fdt);' either. I'm packing the
FDT **after** the machine store it in the guest physical memory. If I return
the packed size, but the machine isn't packing the FDT before a
cpu_physical_memory_write(), I'll be under-reporting the FDT size written.

Machines such as e500 (patch 4) uses this returned value to put more stuff in
the guest memory. In that case, returning a smaller size that what was actually
written can cause the machine to overwrite the FDT by accident. In fact, only
a handful of machines (ppc/pseries, ppc/pvn, riscv, oepenrisc) is doing a
fdt_pack() before a cpu_physical_memory_write(). So this change would be
potentially harmful to a lot of people.

One alternative would be to do a fdt_pack() before the machine writes the
FDT in the guest memory, but that is too intrusive to do because I can't say
if each of these machines will be OK with that. I have a hunch that it would
be OK, but a hunch isn't going to cut it.

I'll just drop the fdt_pack() for each of these patches. If the machine code
is already packing it, fine. If not, that's fine too. Each maintainer can
assess whether packing the FDT is worth it or not.


Thanks,


Daniel


> 
> I believe some of the other patches in the series have similar concerns.
> 

