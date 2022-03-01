Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A14C940D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:14:28 +0100 (CET)
Received: from localhost ([::1]:41474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP7x5-0004cG-5z
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nP7tz-0003BY-4b
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:11:15 -0500
Received: from [2a00:1450:4864:20::435] (port=39734
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nP7tx-0001W1-Ex
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:11:14 -0500
Received: by mail-wr1-x435.google.com with SMTP id ay10so4207085wrb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 11:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=amUuim5Nt0rWbX9SIA/etaGr09Z+diRBs0PUmKjlek8=;
 b=h0E/S8cw+U9pZT8uGKILhvyf8RTIZZMdYBQuDzjLCrnSopnTCxj48PnhtzxIGKdUpD
 lX0w/UtUFiGbxd2wWDyr2BWzyPGNi1ivmV9ppP/BZPxYaVlD8braZZluPcGgcDYrkDrF
 rnQPrE3O+zJ8lKjO6GUtXVnA7MO+KKK5e8BrT0JEWdUDKW+dSI2Ne8dcLvhlRV0chtex
 KiSt/rSFc7B+LeYmE7yICiBPN5/vhbKiczujM3js9nq6GUbt6j34lJbqgfKBuu1Q1uSQ
 t+qhM8J3eViTpEJrl6KO6WYKdxA4ThGjIk98Yjs5mQ68CanJRdsPN9FwVXUnRmFMyneK
 v0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=amUuim5Nt0rWbX9SIA/etaGr09Z+diRBs0PUmKjlek8=;
 b=NMcSnQxZMUtV8cttoWqgymRP7VQHaKfef7v4dlhhWLRATLKfKoh0Se4xwqPRFl+VdB
 K3AG268IIrtthgtnMvMbPmj73POAlTBTiQqBpFCcB0VYThEBL2pDTHT0koevbmxuEIJT
 F+bf4qSpVS9stohw4Tdyqxt6XHszBNEw5Xyf0+UPtO7pIV85Fe3kkDUQTfyNiriJoHxk
 GVWyt4ZwIt12l/1FP+UuK+AKG47HQOemwqVwgL1Yvxq+pa9rFWjsrkOXklW38t31Q0+8
 JcwZuCneJnk3PTpodzHkSEXdnSkP5zhLBwJQvDgJF+NBxocAMSKHG469nre/hplQiXB2
 Csmg==
X-Gm-Message-State: AOAM531J9055by2+RXqGask8Ndr00rXkUzx7nGe+QQRD4OqK+sfnUF93
 G4+5JBbzFwIxS4tIxGq9+Nk=
X-Google-Smtp-Source: ABdhPJzgBC00GFy/mMdeO4zeEPMWrP6OoV+eIcUjsxPqmDNYH7wLI9DwBS0YGyWaV2hX+73o5NUnWg==
X-Received: by 2002:a5d:44c7:0:b0:1ed:e11c:9b73 with SMTP id
 z7-20020a5d44c7000000b001ede11c9b73mr20194689wrr.574.1646161871830; 
 Tue, 01 Mar 2022 11:11:11 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b00381753c67a8sm3742844wmq.26.2022.03.01.11.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 11:11:11 -0800 (PST)
Message-ID: <b6934751-f513-d9b9-ae2e-106a736b3f57@gmail.com>
Date: Tue, 1 Mar 2022 21:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <20220301061131-mutt-send-email-mst@kernel.org>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220301061131-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, shentey@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/1/22 13:19, Michael S. Tsirkin wrote:
> On Tue, Mar 01, 2022 at 09:43:54AM +0100, Igor Mammedov wrote:
>> On Mon, 28 Feb 2022 22:17:32 +0200
>> Liav Albani <liavalb@gmail.com> wrote:
>>
>>> This can allow the guest OS to determine more easily if i8042 controller
>>> is present in the system or not, so it doesn't need to do probing of the
>>> controller, but just initialize it immediately, before enumerating the
>>> ACPI AML namespace.
>>>
>>> This change only applies to the x86/q35 machine type, as it uses FACP
>>> ACPI table with revision higher than 1, which should implement at least
>>> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
>>> flags register according to the ACPI 2.0 specification.
>>>
>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>>> ---
>>>   hw/acpi/aml-build.c         | 11 ++++++++++-
>>>   hw/i386/acpi-build.c        |  9 +++++++++
>>>   hw/i386/acpi-microvm.c      |  9 +++++++++
>> commit message says it's q35 specific, so wy it touched microvm anc piix4?
>>
This affect only q35 machine type for now, but what happens if the 
MicroVM ACPI FACP table is updated to use a revision that supports IA-PC 
boot flags?
>>>   include/hw/acpi/acpi-defs.h |  1 +
>>>   4 files changed, 29 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>> index 8966e16320..2085905b83 100644
>>> --- a/hw/acpi/aml-build.c
>>> +++ b/hw/acpi/aml-build.c
>>> @@ -2152,7 +2152,16 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>>       build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>>>       build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>>>       build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
>>> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
>>> +    /* IAPC_BOOT_ARCH */
>>> +    /*
>>> +     * This register is not defined in ACPI spec version 1.0, where the FACP
>>> +     * revision == 1 also applies. Therefore, just ignore setting this register.
>>> +     */
>>> +    if (f->rev == 1) {
>>> +        build_append_int_noprefix(tbl, 0, 2);
>>> +    } else {
>>> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
>>> +    }
>>>       build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>>>       build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>>>   
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index ebd47aa26f..c72c7bb9bb 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -38,6 +38,7 @@
>>>   #include "hw/nvram/fw_cfg.h"
>>>   #include "hw/acpi/bios-linker-loader.h"
>>>   #include "hw/isa/isa.h"
>>> +#include "hw/input/i8042.h"
>>>   #include "hw/block/fdc.h"
>>>   #include "hw/acpi/memory_hotplug.h"
>>>   #include "sysemu/tpm.h"
>>> @@ -192,6 +193,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>>>               .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>>>           },
>>>       };
>>> +    /*
>>> +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
>>> +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
>>> +     * (the earliest acpi revision that supports this).
>>   /* APCI spec version 2.0, Table 5-10 */
>>
>> is sufficient, the rest could be read from spec/
> ACPI though, not APCI.
It will be fixed in version 5.
> The comment can be shorter and more clearer, but I feel quoting spec
> and including table name is a good idea actually, but pls quote verbatim:
>
> /* ACPI spec version 2.0, Table 5-10: Fixed ACPI Description Table Boot Architecture Flags */
> /* Bit offset 1 -  port 60 and 64 based keyboard controller, usually implemented as an 8042 or equivalent micro-controller. */
>
>>> +     */
>>> +    fadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
>>> +                            0x0002 : 0x0000;
> and make it 0x1 << 1 - clearer that this is bit 1. Leading zeroes are
> not helpful since compiler does not check there's a correct number of
> these.
It will be fixed in version 5.
>>> +
>>>       *data = fadt;
>>>   }
>>>   
>>> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
>>> index 68ca7e7fc2..4bc72b1672 100644
>>> --- a/hw/i386/acpi-microvm.c
>>> +++ b/hw/i386/acpi-microvm.c
>>> @@ -31,6 +31,7 @@
>>>   #include "hw/acpi/generic_event_device.h"
>>>   #include "hw/acpi/utils.h"
>>>   #include "hw/acpi/erst.h"
>>> +#include "hw/input/i8042.h"
>>>   #include "hw/i386/fw_cfg.h"
>>>   #include "hw/i386/microvm.h"
>>>   #include "hw/pci/pci.h"
>>> @@ -189,6 +190,14 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>>           .reset_val = ACPI_GED_RESET_VALUE,
>>>       };
>>>   
>>> +    /*
>>> +     * second bit of 16 of the IAPC_BOOT_ARCH register indicates i8042 presence
>>> +     * or equivalent micro controller. See table 5-10 of APCI spec version 2.0
>>> +     * (the earliest acpi revision that supports this).
>>> +     */
>>> +    pmfadt.iapc_boot_arch = object_resolve_path_type("", TYPE_I8042, NULL) ?
>>> +                            0x0002 : 0x0000;
>>> +
> let's avoid code duplication pls.
>
What do you suggest to do with this? Creating a separate function to do 
this for us so we can call it from both locations?
>>>       table_offsets = g_array_new(false, true /* clear */,
>>>                                           sizeof(uint32_t));
>>>       bios_linker_loader_alloc(tables->linker,
>>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>>> index c97e8633ad..2b42e4192b 100644
>>> --- a/include/hw/acpi/acpi-defs.h
>>> +++ b/include/hw/acpi/acpi-defs.h
>>> @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
>>>       uint16_t plvl2_lat;        /* P_LVL2_LAT */
>>>       uint16_t plvl3_lat;        /* P_LVL3_LAT */
>>>       uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
>>> +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
>>>       uint8_t minor_ver;         /* FADT Minor Version */
>>>   
>>>       /*

