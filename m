Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BFE5AD3D2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:26:10 +0200 (CEST)
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVC74-00088Z-Ua
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVBNj-0005b6-QI; Mon, 05 Sep 2022 08:39:17 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVBNh-00067X-Sy; Mon, 05 Sep 2022 08:39:15 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 6-20020a9d0106000000b0063963134d04so6082642otu.3; 
 Mon, 05 Sep 2022 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3IzEDAFIXEEsyRpUhJwNWq7B++X6NxyLCPDvvPFTzWI=;
 b=kYusV5RKJ4ocIbXKzNm1D7lFg5oyBBwI7odV+kQ12tpV6YvW+r/PpfHt5y/0LyfujO
 CZpp15imvbQddf/fQvprn+Rmf6KGtO30VsNlQT3hTb3I5LDGE+r3oHo9DrXAH+yfgIP0
 PLDdrqJHDGElFLBH5qHhDd+PPDn2LMu8B0evSWOXqh02OVroPWyj57XchMonX/imo3kD
 S5MARRgvuP24KThLZobeuh3aAvtQH26cSsMimHWMeXhtbeb4S3oV/wp1BMyn4QtrMqMj
 UBfcMlUXHoU9F7zplZtJ25kqhiu5lLzxqoKSFc7d/teFS1OzPQ/Z3QpSOKxK1Yam//UM
 9AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3IzEDAFIXEEsyRpUhJwNWq7B++X6NxyLCPDvvPFTzWI=;
 b=P75wtDK892ycPcxR2AbWYZpqPyWciOOz386bZAGvOtxEccsOZ7rIHzpHS2ti/s7RzC
 UoVkV759bVSxS/z5rLbczl1xXqPj5skK+aiuJKhZ0K3T8F+lBXs12KNXxS6GPxmfOhLd
 PR1ycvnOSYgV6CD0DjHra4qGcBa4+DKi5k0ipfhupE0+wORn/Y2u9UnP75QiOZDIW6C7
 Zu4r3M4L7tm1cgIE65AFirwFOCMHHODzcR9Dnd6tFts/oSQ5MIQN8VdM84fDalzBwt3Y
 VYmP5Q7sAKzXSKzP2LVBUvUmjMgRzvIMt0k9thaQo5SuPMvyebz2dXjbuWFwmvgtuUI+
 i5cg==
X-Gm-Message-State: ACgBeo1pWlUcoy/uDyAjxom2jgq/ex04G48sU1mbmel3aXkAhz7+jvCy
 r1Ko7ur81eggWQaN8wQiRNY=
X-Google-Smtp-Source: AA6agR6h0xYLQKJOwzxG7zq01syc7h7j6it+Ju71J1gCMFqB35Ls8BuFG7kKaQaRFcqA1N+34drAVQ==
X-Received: by 2002:a05:6830:4112:b0:637:45ba:72d6 with SMTP id
 w18-20020a056830411200b0063745ba72d6mr18376019ott.309.1662381552274; 
 Mon, 05 Sep 2022 05:39:12 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 d4-20020a9d72c4000000b0063b34c35575sm4618803otk.42.2022.09.05.05.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 05:39:11 -0700 (PDT)
Message-ID: <6f3c5db0-8d1a-941e-1024-f06ec69030d5@gmail.com>
Date: Mon, 5 Sep 2022 09:39:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v6 06/14] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
References: <20220904233456.209027-1-danielhb413@gmail.com>
 <20220904233456.209027-7-danielhb413@gmail.com>
 <fbf6b3f-4fa3-928a-8ef9-83af7e2e835@eik.bme.hu>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <fbf6b3f-4fa3-928a-8ef9-83af7e2e835@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
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



On 9/5/22 04:15, BALATON Zoltan wrote:
> On Sun, 4 Sep 2022, Daniel Henrique Barboza wrote:
>> This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
>> machine.
>>
>> Setting machine->fdt requires a MachineState pointer to be used inside
>> sam460ex_load_device_tree(). Let's change the function to receive this
>> pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
>> directly from the 'machine' pointer.
>>
>> Cc: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> but could you please do the same at least for bamboo and virtex too to keep these consistent? (and to simplify them a little.)


I'll wait for more reviews in the other patches then I'll repost with these
changes in bamboo and virtex.


Thanks,

Daniel


> 
> Regards,
> BALATON Zoltan
> 
>> ---
>> hw/ppc/sam460ex.c | 21 +++++++++++----------
>> 1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 850bb3b817..5d09d3c6ab 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -131,13 +131,12 @@ static int sam460ex_load_uboot(void)
>>     return 0;
>> }
>>
>> -static int sam460ex_load_device_tree(hwaddr addr,
>> -                                     uint32_t ramsize,
>> +static int sam460ex_load_device_tree(MachineState *machine,
>> +                                     hwaddr addr,
>>                                      hwaddr initrd_base,
>> -                                     hwaddr initrd_size,
>> -                                     const char *kernel_cmdline)
>> +                                     hwaddr initrd_size)
>> {
>> -    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
>> +    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(machine->ram_size) };
>>     char *filename;
>>     int fdt_size;
>>     void *fdt;
>> @@ -171,7 +170,8 @@ static int sam460ex_load_device_tree(hwaddr addr,
>>     qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>>                           (initrd_base + initrd_size));
>>
>> -    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
>> +    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>> +                            machine->kernel_cmdline);
>>
>>     /* Copy data from the host device tree into the guest. Since the guest can
>>      * directly access the timebase without host involvement, we must expose
>> @@ -208,7 +208,9 @@ static int sam460ex_load_device_tree(hwaddr addr,
>>                               EBC_FREQ);
>>
>>     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
>> -    g_free(fdt);
>> +
>> +    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
>> +    machine->fdt = fdt;
>>
>>     return fdt_size;
>> }
>> @@ -496,9 +498,8 @@ static void sam460ex_init(MachineState *machine)
>>     if (machine->kernel_filename) {
>>         int dt_size;
>>
>> -        dt_size = sam460ex_load_device_tree(FDT_ADDR, machine->ram_size,
>> -                                    RAMDISK_ADDR, initrd_size,
>> -                                    machine->kernel_cmdline);
>> +        dt_size = sam460ex_load_device_tree(machine, FDT_ADDR,
>> +                                            RAMDISK_ADDR, initrd_size);
>>
>>         boot_info->dt_base = FDT_ADDR;
>>         boot_info->dt_size = dt_size;
>>

