Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D04C5E56
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:59:15 +0100 (CET)
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOlG-0000jB-T4
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOOkS-0008QV-VE
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:58:24 -0500
Received: from [2a00:1450:4864:20::42b] (port=44642
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nOOkQ-00084s-W2
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:58:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u1so12188553wrg.11
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6K8ypfGgWPmqX+cfImPvkNlnPHjqgamCAu3qXDIxm5g=;
 b=UU5OCQYFNCqdXaJ09osGdS8fZ2i5SVTOXhTl8BQnXR6ouS0lvCloVobDEYyFBdCEWs
 JQEcMZ0kv1aEgj6XQL7yfmrFh60sr62263GFHM1+VItkcW19gBJUOdfdqgyGkcL8TNtq
 CX57w3B4nWkuodTMThN4zchI+LiZmpecRGgMcjr4qRQM84gBkeYxkxFke7ToGYIMTmIC
 3eKlhxSVdXR2Ix1GUJ+KBfNV96wVoQANdkKi5ucjNyYPvhXuQlRO3uhYfQR4MWCDJxLc
 2iNIUlkH3ZLbKB3kSiZTn4KIViLxYyJ49C6RXqSVFy06ZQAyq7Or8125z6ECn2WbSuEs
 1enA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6K8ypfGgWPmqX+cfImPvkNlnPHjqgamCAu3qXDIxm5g=;
 b=YT7c5161le4tVQv4pyumGnHGJbYCemPHhLe8QbL4VOeMdwhm+2Bo6lM5kg1SE7sIZe
 DTkDHDgSizwX4TegbjgbYruMaVC5dbP6+5GaSkTzIfG9FwNXeYHIefB+JaDjDlRJTdqK
 yHZuEDiecNDlzsqUZeWoPEr+r7hG/UxIBykGhj3dcDHpt/sQYjt05w9kkhJLgcQ2JwPO
 /kmq6w9jSNViqu/pvDHJayZieV5BEX2cPAClIITrFqATKI35Se4i3Cz3grsxat+5rG57
 Y96+xst6lIky0/1isjZS2dBRc/4EmyI1IL6zSONChxGvV6M6zpJTBdNHbK3GgKAFMbBl
 ZtuA==
X-Gm-Message-State: AOAM5338wFoCHnczeIU1pIwJFJNYMn4KJykTv57bP1pVna7ugheFfDDC
 5gT3ag1gbK/D2lEm8rI27f4=
X-Google-Smtp-Source: ABdhPJwMvUIuDSDluJOJA0aFTwGy6yoK2lc6Y74svN5rllPDg1ZgPwOL98LtzkUBMYAPwX7zLJ25fA==
X-Received: by 2002:a5d:5709:0:b0:1ea:95eb:9e09 with SMTP id
 a9-20020a5d5709000000b001ea95eb9e09mr13759015wrv.188.1645988300772; 
 Sun, 27 Feb 2022 10:58:20 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5006000000b001e75916a7c2sm8409497wrt.84.2022.02.27.10.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 10:58:20 -0800 (PST)
Message-ID: <6e598f82-e68e-548d-7f72-ea7bcbca0e63@gmail.com>
Date: Sun, 27 Feb 2022 20:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 3/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
 <BE89AC1C-6ED9-4F1E-9DE6-EB1E2CC863E7@gmail.com>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <BE89AC1C-6ED9-4F1E-9DE6-EB1E2CC863E7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: ani@anisinha.ca, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/27/22 12:48, Bernhard Beschow wrote:
> Am 26. Februar 2022 06:30:18 UTC schrieb Liav Albani <liavalb@gmail.com>:
>> This can allow the guest OS to determine more easily if i8042 controller
>> is present in the system or not, so it doesn't need to do probing of the
>> controller, but just initialize it immediately, before enumerating the
>> ACPI AML namespace.
>>
>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>> ---
>> hw/acpi/aml-build.c         | 7 ++++++-
>> hw/i386/acpi-build.c        | 8 ++++++++
>> hw/i386/acpi-microvm.c      | 9 +++++++++
>> include/hw/acpi/acpi-defs.h | 1 +
>> 4 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 8966e16320..ef5f4cad87 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
>> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
>> +    /* IAPC_BOOT_ARCH */
>> +    if (f->rev == 1) {
>> +        build_append_int_noprefix(tbl, 0, 2);
>> +    } else {
>> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
>> +    }
>>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index ebd47aa26f..65dbc1ec36 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -192,6 +192,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>>              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>>          },
>>      };
>> +    /*
>> +     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
>> +     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
>> +     * (the earliest acpi revision that supports this).
>> +     */
>> +
>> +    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002 : 0x0000;
> Couldn't qdev_find_recursive() be used here instead? This would also make patch 1 unneccessary. Same below.
>
> Best regards
> Bernhard

I tried it first, but because it tries to find the ID of a device 
instead of a type (I look for i8042 type which is a string of the device 
type), it didn't work as expected. We don't compare DeviceState id, but 
ObjectClass type->name here :)

With my patch we could just find the device without any problem whatsoever.

Best regards,
Liav


