Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408F4C5E58
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 20:01:58 +0100 (CET)
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOns-00038Q-Ur
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 14:01:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOOm3-0001a2-5K
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 14:00:03 -0500
Received: from [2a00:1450:4864:20::42c] (port=45987
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOOm0-0008Cn-VZ
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 14:00:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id p9so12190746wra.12
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 11:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xHZblY6rOonyYNhNFv7zF7XSCrhBHtqGf5hrF3tgUoU=;
 b=kigE93R2X171G2FCf7xdtMELS0gSP3W8qqYvGczWy+eJxMSvQpBywKLW6OTCjZMsiZ
 Lx/0o9AyZ4VzNtyDZeb8eCDN8bC1FvX8Z1YzQvVs+pWxiOKe5WOy6QixscHPbFHxax0x
 RWZhWaa2TKgkgl+U08vqg9Q8u+uig0lIJdbQ8h5MucW9wkh978Ul6m4fYVpG69pA0JrM
 vuN4dbZ1zHr8WpE6fSpb9p4rCFu44GxtCwlfefInqVenDKDpqW8sfpcdwY2Vb+++ta+c
 IFZuIpJNXks+JszLFZ44D55lhSy17vAGTTq1DcZYdrOHZpEFWolYvpNxo0JevagTtnin
 JX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xHZblY6rOonyYNhNFv7zF7XSCrhBHtqGf5hrF3tgUoU=;
 b=HI9/DNwwi7R6Ty5AmeZ2NxOSxFZ4NkZ5rgztdWzTYds4UvqRibhNa27h1eHpPGxGN7
 tw27US5juRC7s+P6VcQixiwCevy1Fg59mtGeK81F+auoxpHCdSZnr+ik5Vzfsg0ox2WJ
 tWez3c25qOg13RHQt8wp55E59SH6TGgQiB7SM4hpe1mLvRRf81/2ILHlG/ACrWpFPnHR
 i6iblb6F4M17rzeQpDAmAaQvdFSpoKYfK6AXitXOal6IIJOaa8As0liJ0raRin6VO6P1
 LpoPnRv+nbl89bnnX8+FQRAkWb0L6d4oyNl2ibqAIah2wHF9Z01R1r/+NqdfsRTGlwPm
 d+pg==
X-Gm-Message-State: AOAM531Tb6kbaSKL4wvWh8NraLNv6oGNxXA3qstdKFgXjfkFPS8Y34E5
 /FGdgPV82cib/6Lg2+KpEgw=
X-Google-Smtp-Source: ABdhPJyAeuHpYpRhKQLkPWrg1UKqKWdTgNBAP7e8Onz42BG2yaPr58/mvp8BcqyiAAJOOZ7Sz1ZAaw==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr12886671wru.426.1645988399596; 
 Sun, 27 Feb 2022 10:59:59 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056000120600b001ea9414f2c3sm8217114wrx.12.2022.02.27.10.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:59:59 -0800 (PST)
Message-ID: <2f8036a3-5ed7-9e16-3e9d-82dbcd4a96da@gmail.com>
Date: Sun, 27 Feb 2022 20:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 3/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
 <alpine.DEB.2.22.394.2202271222230.1249418@anisinha-lenovo>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2202271222230.1249418@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/27/22 08:56, Ani Sinha wrote:
>
> On Sat, 26 Feb 2022, Liav Albani wrote:
>
>> This can allow the guest OS to determine more easily if i8042 controller
>> is present in the system or not, so it doesn't need to do probing of the
>> controller, but just initialize it immediately, before enumerating the
>> ACPI AML namespace.
>>
>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>> ---
>>   hw/acpi/aml-build.c         | 7 ++++++-
>>   hw/i386/acpi-build.c        | 8 ++++++++
>>   hw/i386/acpi-microvm.c      | 9 +++++++++
>>   include/hw/acpi/acpi-defs.h | 1 +
>>   4 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 8966e16320..ef5f4cad87 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>       build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>>       build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>>       build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
>> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
>> +    /* IAPC_BOOT_ARCH */
>> +    if (f->rev == 1) {
>> +        build_append_int_noprefix(tbl, 0, 2);
>> +    } else {
>> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
>> +    }
> Like a suggested in the previous iteration, please add a comment here to
> specify why you are adding this only for rev !=1 . Also please mention
> that your change only affects q35 machines since i440fx uses rev 1 (ref to
> acpi_get_pm_info()).
>
>
>>       build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>>       build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index ebd47aa26f..65dbc1ec36 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -192,6 +192,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>>               .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>>           },
>>       };
>> +    /*
>> +     * second bit of 16 but
> wow, you even retained my typo here! :-)

Yeah, I figured this after I sent the patch series, sorry for that mistake!

>
>> IAPC_BOOT_ARCH indicates presence of 8042 or
>> +     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
>> +     * (the earliest acpi revision that supports this).
>> +     */
>> +
>> +    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002 : 0x0000;
>> +
>>       *data = fadt;
>>   }
>>
>> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
>> index 68ca7e7fc2..e5f89164be 100644
>> --- a/hw/i386/acpi-microvm.c
>> +++ b/hw/i386/acpi-microvm.c
>> @@ -189,6 +189,15 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>           .reset_val = ACPI_GED_RESET_VALUE,
>>       };
>>
>> +    /*
>> +     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
>>
> ditto as above.
No problem, I'll send a v4 soon :)
>
>   +     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
>> +     * (the earliest acpi revision that supports this).
>> +     */
>> +
>> +    pmfadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002
>> +                            : 0x0000;
>> +
>>       table_offsets = g_array_new(false, true /* clear */,
>>                                           sizeof(uint32_t));
>>       bios_linker_loader_alloc(tables->linker,
>> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
>> index c97e8633ad..2b42e4192b 100644
>> --- a/include/hw/acpi/acpi-defs.h
>> +++ b/include/hw/acpi/acpi-defs.h
>> @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
>>       uint16_t plvl2_lat;        /* P_LVL2_LAT */
>>       uint16_t plvl3_lat;        /* P_LVL3_LAT */
>>       uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
>> +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
>>       uint8_t minor_ver;         /* FADT Minor Version */
>>
>>       /*
>> --
>> 2.35.1
>>
>>

