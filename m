Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82D75A3077
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:36:43 +0200 (CEST)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRg4I-0002AO-5n
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRg1y-0000Rz-Mx; Fri, 26 Aug 2022 16:34:22 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:38670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRg1s-0008Mm-Cf; Fri, 26 Aug 2022 16:34:14 -0400
Received: by mail-oi1-x236.google.com with SMTP id w197so3346984oie.5;
 Fri, 26 Aug 2022 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=bUsLurWNcAoJYg4ncf95hZ6MU8eqlB7fhihh6m21AmY=;
 b=nONTx5TCqq4VV+y5Ff7UYZHBEheBmKtVYIVzS6gkx87NkFzBrDq2GCi44EKVzSUVK8
 d+STrbNycylnzsPs2S6KOUHmJaBge1tRKPmyHh7NCQ8dkM7BF88fyQJrdATbPBsKiZzw
 Gev6m1xnJId4+yiulKs0WppiM9WT0ccO+MnCgjTnxSV2/KcvzQ2g3s/z4YZAZYsohmJY
 bPuzNvpiDWEau+Cu/XZw6QxmTMFBB7agDQ0u1Bu8UyfVZ4zxUrdGbBQ8qLPyI/zFuOf3
 Obhfxtx/NM0B0kQq0GyNqu06d+3sNZDatkfeUDDyBVO5yIKszEobrap8e5s8KoaOiV72
 SHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=bUsLurWNcAoJYg4ncf95hZ6MU8eqlB7fhihh6m21AmY=;
 b=0rXrLF6Ob5MvYWTDyBePprwxwURk1c+HKD181/oSQY6wP0OUaQskpoCJTueNwdCIfo
 hYK5c1i8V6bHUomY6Fm4k4TFwMQaAdtVjvu1cxE0aK08Vz5bs4wlRYlMgCzwkUWsO0SC
 vdtBt7WGEYUmtorXWzD/d6Xs9kbro5brAPyCmGNvPiMQmTN4Ch1FkAFzZUv7lQD792j7
 400YHwGRDsKyenWjMEm8nFWDBavEjVN4AgfHE6MYRKzZ2XGWLPxUBsJAmtF4JU6I7W8/
 25C5eUlNfmQxPlgu86zwGXBhz0A9ZKvmdvKwIppBQkgMzH/UIsqcV1AWemwALj41jCG6
 hXtA==
X-Gm-Message-State: ACgBeo1h2SM6lWWVr10geLpN3VOfKRdYZIL8kpJ9HMwJs2yIuHnXV77n
 ZaT3tFM2F/ldKLqVFYbLsBM=
X-Google-Smtp-Source: AA6agR62zGHvsZ3y+cBXBKYmbuhkLJHfs5M2sXEh2/SYqIeowlJfXHRnWQvu+a0GSgRvTHxnHeciwQ==
X-Received: by 2002:a05:6808:1156:b0:344:fd6a:f7f8 with SMTP id
 u22-20020a056808115600b00344fd6af7f8mr2341034oiu.291.1661546050722; 
 Fri, 26 Aug 2022 13:34:10 -0700 (PDT)
Received: from [192.168.10.102] ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a9d30d2000000b006370abdc976sm1517603otg.58.2022.08.26.13.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:34:10 -0700 (PDT)
Message-ID: <7658755f-d8e4-3abe-39c5-17c2503b0eb8@gmail.com>
Date: Fri, 26 Aug 2022 17:34:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 06/21] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, alistair.francis@wdc.com
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-7-danielhb413@gmail.com>
 <32f11c71-b8c4-1af0-2c39-166dc6f013ac@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <32f11c71-b8c4-1af0-2c39-166dc6f013ac@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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



On 8/26/22 15:56, BALATON Zoltan wrote:
> On Fri, 26 Aug 2022, Daniel Henrique Barboza wrote:
>> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
>> the sam460ex machine.
> 
> This only works when booting with -kernel not when the firmware is used which creates its own DT. (The same is true for pegasos2 but there VOF is the default as the firmware is not free like for sam460ex.) After reading the other comments I wonder if this info fdt command is really useful or would it be easier to boot some simple Linux guest and inspect the device tree from there. The dumpdtb command might be simple enough and a bit more useful for debugging before the guest boots but that alone could be enough as external tools can be used to decode the binary dump. The info fdt might be too complex and an overkill if it might not even work or give correct results. But I don't mind either way and not against adding it just noted the possible shortcoming here.

As an counter example of what you said, there's no guarantee that the FDT is
fully exposed in the guest sysfs. This is the case of the /chosen/rng-seed
property that was added recently in the pSeries machine - the property exists
in the FDT, the guest is aware of it, but the guest doesn't show it in under
/proc/device-tree. In fact, I think I mentioned in the cover letter of the first
version that this situation was the motivation of this work.

But you're right when you questioned how useful these QMP/HMP commands might be
for sam460ex. The utility of both commands relies on how the machine handles the
FDT internally and what you're trying to check.


> 
> (In case you do another iteration I wouldn't mind if the comment could be shortened to one line instead of 4 but it's not critical. Something like:
> 
> /* Set machine->fdt for dumpdtb and info fdt QMP/HMP commands */


Changed in my local tree.


Thanks,

Daniel

> 
> would be enough and use less space. The current one is unnecessarily verbose for a simple line.)
> 
> Regards,
> BALATON Zoltan
> 
>> Cc: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>> hw/ppc/sam460ex.c | 8 +++++++-
>> 1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 0357ee077f..413a425d37 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -138,6 +138,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
>>                                      hwaddr initrd_size,
>>                                      const char *kernel_cmdline)
>> {
>> +    MachineState *machine = MACHINE(qdev_get_machine());
>>     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
>>     char *filename;
>>     int fdt_size;
>> @@ -209,7 +210,12 @@ static int sam460ex_load_device_tree(hwaddr addr,
>>                               EBC_FREQ);
>>
>>     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
>> -    g_free(fdt);
>> +
>> +    /*
>> +     * Update the machine->fdt pointer to enable support for
>> +     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
>> +     */
>> +    machine->fdt = fdt;
>>
>>     return fdt_size;
>> }
>>

