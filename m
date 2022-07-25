Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232A157FFB6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:21:49 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFy1q-0000yE-W0
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oFxxv-0005P2-4e
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:17:43 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oFxxo-00008p-Pj
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:17:39 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 c20-20020a9d4814000000b0061cecd22af4so4115661otf.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BSIJXOg4nianif+mvv287tl270yT90Wor8zE5AjjBCU=;
 b=G3SKXbfhYZC5T0dYINdBMbqFEibhctn/HOHpvuTUhsC7kRUNH1gTcMfqmRa1RhL0u0
 mQSQ9BYxd/bN1CBR5X1+fx0XokqA+Bj4mGe7WjY9kaoLH39ZwaW09oaNC62kvuej6wF3
 zbjg2jqHFWok1WHv+aG8AGUnbynLi5tek6yxWDxfvmmmxL7anguEHgiIfoo1pj+OEZBx
 hE0viBgnIYntNQB5b01GmOXEFS5ZPa3/Ok6gOybN7qW4OPiM/qVk9QYyrOmgaJ5CPjFu
 pbPsqQ4N3kIjYrwoUb8MQOMTKwIn1w99sbStD4hI3CWm5W0LC0KEdu3vAq3M2duXW2Iz
 mm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BSIJXOg4nianif+mvv287tl270yT90Wor8zE5AjjBCU=;
 b=gTfJD6EHbqutKFXmyTavoKAH7jAdQjddmZ+tM3PqGc/+Qs60ghIoWj5DfmGzvVPueH
 qRToVdpEcCJM6wkP8FWAROJbYvIwtqimeqBY6q0fzvRwJ7LqllDgQ1ijspHF6HC6GCZ6
 FsfpDUNvflvMaImc/oHjv8cAUZ2SABDysuDYaiynyxfs/HHfHu3VwY4NZjM6shfVpa5V
 opzfKqeDrD3HbYGoIOpVfK99qFgp9bSZye+SqQW2Hh8ZptiZZj7YVTus+DKunSUbiPYO
 rXsD3In6PbaKyFiE7TrGP1nK0qOctMJBqvskhQHI2zxu199XdEa9VxCNEWVa2e8gRin0
 NErA==
X-Gm-Message-State: AJIora/N1E7wgkvPV2LCxO1m1ECLGTheLiW2kLaW+nccmFogXT8c+Xa2
 YTkFG3pyD6cuDvOVPM0bZ1U=
X-Google-Smtp-Source: AGRyM1tKqRpXfcDDwI42ERkvol05hndZCOfybkkJ7Ke2zpWJiqzy7o4nn8qRHZVlRqzqtA1UuWJnrA==
X-Received: by 2002:a05:6830:1291:b0:61c:9204:ddb9 with SMTP id
 z17-20020a056830129100b0061c9204ddb9mr4864098otp.179.1658755055700; 
 Mon, 25 Jul 2022 06:17:35 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:1396:9fee:cbb9:2bbd:ebf6?
 ([2804:431:c7c7:1396:9fee:cbb9:2bbd:ebf6])
 by smtp.gmail.com with ESMTPSA id
 p28-20020a056870831c00b0010c727a3c79sm5893752oae.26.2022.07.25.06.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 06:17:35 -0700 (PDT)
Message-ID: <5982ed2f-7d22-108d-f674-85ff89360593@gmail.com>
Date: Mon, 25 Jul 2022 10:17:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 04/10] hmp, device_tree.c: introduce fdt-save
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <20220722200007.1602174-5-danielhb413@gmail.com>
 <f0b25992-ac35-4b1-1ed9-ebf7ceaecbb7@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <f0b25992-ac35-4b1-1ed9-ebf7ceaecbb7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
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



On 7/22/22 20:13, BALATON Zoltan wrote:
> On Fri, 22 Jul 2022, Daniel Henrique Barboza wrote:
>> To save the FDT blob we have the '-machine dumpdtb=<file>' property. With this
>> property set, the machine saves the FDT in <file> and exit. The created
>> file can then be converted to plain text dts format using 'dtc'.
>>
>> There's nothing particularly sophisticated into saving the FDT that
>> can't be done with the machine at any state, as long as the machine has
>> a valid FDT to be saved.
>>
>> The 'fdt-save' command receives a 'filename' paramenter and, if a valid
>> FDT is available, it'll save it in a file 'filename'. In short, this is
>> a '-machine dumpdtb' that can be fired on demand via HMP.
> 
> If it does the same as -machine dumpdtb wouldn't it be more intuitive to call the HMP command the same, so either dumpdtb or machine-dumpdtb or similar? That way it's more obvious that these do the same.


Good point. I'll rename 'fdt-save' to 'dumpdtb'.


Daniel

> 
> Regards,
> BALATON Zoltan
> 
>> A valid FDT consists of a FDT that was created using libfdt being
>> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
>> met by most FDT users in QEMU.
>>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>> hmp-commands.hx              | 13 +++++++++++++
>> include/sysemu/device_tree.h |  2 ++
>> monitor/misc.c               | 13 +++++++++++++
>> softmmu/device_tree.c        | 18 ++++++++++++++++++
>> 4 files changed, 46 insertions(+)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index c9d465735a..3c134cf652 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1768,3 +1768,16 @@ ERST
>>                       "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
>>         .cmd        = hmp_calc_dirty_rate,
>>     },
>> +
>> +    {
>> +        .name       = "fdt-save",
>> +        .args_type  = "filename:s",
>> +        .params     = "[filename] file to save the FDT",
>> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
>> +        .cmd        = hmp_fdt_save,
>> +    },
>> +
>> +SRST
>> +``fdt-save`` *filename*
>> +  Save the FDT in the 'filename' file to be decoded using dtc
>> +ERST
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index ef060a9759..1397adb21c 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -123,6 +123,8 @@ int qemu_fdt_nop_node(void *fdt, const char *node_path);
>> int qemu_fdt_add_subnode(void *fdt, const char *name);
>> int qemu_fdt_add_path(void *fdt, const char *path);
>>
>> +void fdt_save(const char *filename, Error **errp);
>> +
>> #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>>     do {                                                                      \
>>         uint32_t qdt_tmp[] = { __VA_ARGS__ };                                 \
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index 3d2312ba8d..145285cec0 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -78,6 +78,7 @@
>> #include "qapi/qmp-event.h"
>> #include "sysemu/cpus.h"
>> #include "qemu/cutils.h"
>> +#include "sysemu/device_tree.h"
>>
>> #if defined(TARGET_S390X)
>> #include "hw/s390x/storage-keys.h"
>> @@ -936,6 +937,18 @@ static void hmp_boot_set(Monitor *mon, const QDict *qdict)
>>     }
>> }
>>
>> +static void hmp_fdt_save(Monitor *mon, const QDict *qdict)
>> +{
>> +    const char *path = qdict_get_str(qdict, "filename");
>> +    Error *local_err = NULL;
>> +
>> +    fdt_save(path, &local_err);
>> +
>> +    if (local_err) {
>> +        error_report_err(local_err);
>> +    }
>> +}
>> +
>> static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
>> {
>>     bool flatview = qdict_get_try_bool(qdict, "flatview", false);
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index 6ca3fad285..eeab6a5ef0 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -643,3 +643,21 @@ out:
>>     g_free(propcells);
>>     return ret;
>> }
>> +
>> +void fdt_save(const char *filename, Error **errp)
>> +{
>> +    int size;
>> +
>> +    if (!current_machine->fdt) {
>> +        error_setg(errp, "Unable to find the machine FDT");
>> +        return;
>> +    }
>> +
>> +    size = fdt_totalsize(current_machine->fdt);
>> +
>> +    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
>> +        return;
>> +    }
>> +
>> +    error_setg(errp, "Error when saving machine FDT to file %s", filename);
>> +}
>>

