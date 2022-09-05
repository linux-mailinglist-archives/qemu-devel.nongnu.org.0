Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30AE5AD89D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 19:53:46 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGI5-0003CB-Bd
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 13:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGFZ-0001K9-83; Mon, 05 Sep 2022 13:51:09 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGFW-0005xK-Fe; Mon, 05 Sep 2022 13:51:08 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1225219ee46so22976695fac.2; 
 Mon, 05 Sep 2022 10:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6J/QEznwaIzgpqD7hOKlwEXn5MRGZBkq0Zof1MEVEIY=;
 b=jmrfZdmwZ5pmywqDtioWMkXPUBGj7+kGZeV1cHvzKgcjqw/JjewHXxVI1rH3ZgicTZ
 PCu/tw9brLJ5k46qBFqH/Hn2s/aSFAnQICI1NmHhZb6MQ03hJY92ABfTcKUeZ/fm21vM
 Fgl+UlKMtk/LTKfiERxOgDV9wMYDyUrCp5IftpYZXQKyDOS1O9G6VwICDvA5UkhIA7rU
 dHJmSvRw+peD3C5kYvq9CYk82C6fjKFt5GuV1snhhlDE6iCeSKAavsd7Hm5kDoj2W1Ir
 54JGvfJ/Xl/iy7KnxTc7FsMPOK7jnA3HHzbmBUr9gIsdOKngZR3f6wrISZCbX82YQqlr
 5rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6J/QEznwaIzgpqD7hOKlwEXn5MRGZBkq0Zof1MEVEIY=;
 b=y3Z6cbgccLcfRjrSqO9bxZKKPFXCLis6KIAUwmKBhkmz7Vb3VivX5UGoSqFMkXYPXI
 ypuFKp1Zk/Cy+qrfrADvmN5w+CF3ooPDwc/McXtCvxuSo2V2cfOFA6kYaiU3ETaTZLUL
 29nX6Un54YgM3oNvS5N9T6yjuuDOyPlO5bxHlRbWSJ5A9Dlfk6KCwUWR5saY+HwhZGIj
 M+7BkWDDx7gNvxiwPL2th0E40iKurZMOWqBioK/KkB7tx34PadA4YUVMFsO3YOA7MIUE
 J7OVc2fJSV0JhIH7O9mprZNzFby/1n6kEQwkOyqtRocV9UHIL7kgx87knePaCHwqSRUJ
 xSWw==
X-Gm-Message-State: ACgBeo3NbT5OToGgKeMxbOYLNdMLFGbTPBp+8tPn/Ec1wy5QCTzPEQqF
 8KiZ354tBJjyDsyCV+tRBSg=
X-Google-Smtp-Source: AA6agR7bG0DYrd/texxmdUVDtbteGuImpCkASn3i6RAOy7k9wvql1NjMQoidx0rpl3mVdQu/HNXX0w==
X-Received: by 2002:a05:6808:1a04:b0:343:25c7:2f2f with SMTP id
 bk4-20020a0568081a0400b0034325c72f2fmr7957733oib.248.1662400264560; 
 Mon, 05 Sep 2022 10:51:04 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o4-20020a9d7644000000b006370815815asm4760005otl.61.2022.09.05.10.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 10:51:04 -0700 (PDT)
Message-ID: <1501d3bf-bbac-7e54-4ae0-b57ca28d1c6c@gmail.com>
Date: Mon, 5 Sep 2022 14:51:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v6 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220904233456.209027-1-danielhb413@gmail.com>
 <20220904233456.209027-15-danielhb413@gmail.com>
 <87edwqhrba.fsf@pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87edwqhrba.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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



On 9/5/22 10:41, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> To save the FDT blob we have the '-machine dumpdtb=<file>' property.
>> With this property set, the machine saves the FDT in <file> and exit.
>> The created file can then be converted to plain text dts format using
>> 'dtc'.
>>
>> There's nothing particularly sophisticated into saving the FDT that
>> can't be done with the machine at any state, as long as the machine has
>> a valid FDT to be saved.
>>
>> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
>> FDT is available, it'll save it in a file 'filename'. In short, this is
>> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>>
>> A valid FDT consists of a FDT that was created using libfdt being
>> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
>> met by most FDT users in QEMU.
>>
>> This command will always be executed in-band (i.e. holding BQL),
>> avoiding potential race conditions with machines that might change the
>> FDT during runtime (e.g. PowerPC 'pseries' machine).
>>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> Cc: David Gibson <david@gibson.dropbear.id.au>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hmp-commands.hx              | 15 +++++++++++++++
>>   include/sysemu/device_tree.h |  1 +
>>   monitor/misc.c               |  1 +
>>   qapi/machine.json            | 18 ++++++++++++++++++
>>   softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
>>   5 files changed, 66 insertions(+)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 182e639d14..9a3e57504f 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1800,3 +1800,18 @@ ERST
>>                         "\n\t\t\t\t\t limit on a specified virtual cpu",
>>           .cmd        = hmp_cancel_vcpu_dirty_limit,
>>       },
>> +
>> +#if defined(CONFIG_FDT)
>> +SRST
>> +``dumpdtb`` *filename*
>> +  Save the FDT in the 'filename' file to be decoded using dtc.
>> +  Requires 'libfdt' support.
> 
> Does the #if suppress the documentation snippet when
> !defined(CONFIG_FDT)?
> 
> If yes, the "Requires" line is redundant.
> 
> Other conditional commands don't have such lines.

I tested using a target that doesn't rely on libfdt (in this case I picked
the tricore softmmu) and disabled FDT support in ./configure:

configure --target-list=tricore-softmmu --enable-fdt=disabled

This didn't prevent the 'dumpdtb' section from appearing in the generated
docs at build/docs/manual/system/monitor.html. So I guess the documentation
isn't being suppressed by 'CONFIG_FDT'.

That said, I can remove the "Requires libfdt" observations to be in line
with other commands, and then we can then discuss in separate whether the
documentation should follow these preprocessing macros.


Thanks,


Daniel



> 
>> +ERST
>> +    {
>> +        .name       = "dumpdtb",
>> +        .args_type  = "filename:F",
>> +        .params     = "filename",
>> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
>> +        .cmd        = hmp_dumpdtb,
>> +    },
>> +#endif
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index ef060a9759..e7c5441f56 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>>       } while (0)
>>   
>>   void qemu_fdt_dumpdtb(void *fdt, int size);
>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>>   
>>   /**
>>    * qemu_fdt_setprop_sized_cells_from_array:
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index 3d2312ba8d..e7dd63030b 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -49,6 +49,7 @@
>>   #include "sysemu/blockdev.h"
>>   #include "sysemu/sysemu.h"
>>   #include "sysemu/tpm.h"
>> +#include "sysemu/device_tree.h"
>>   #include "qapi/qmp/qdict.h"
>>   #include "qapi/qmp/qerror.h"
>>   #include "qapi/qmp/qstring.h"
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 6afd1936b0..f968a5d343 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1664,3 +1664,21 @@
>>        '*size': 'size',
>>        '*max-size': 'size',
>>        '*slots': 'uint64' } }
>> +
>> +##
>> +# @dumpdtb:
>> +#
>> +# Save the FDT in dtb format. Requires 'libfdt' support.
> 
> We rarely document conditionals like this.  It's kind of redundant with
> the
> 
>      If
> 
>      CONFIG_FDT
> 
> part in the generated documentation.  Aside: this "If" part could
> certainly be improved.
> 
>> +#
>> +# @filename: name of the FDT file to be created
>> +#
>> +# Since: 7.2
>> +#
>> +# Example:
>> +#   {"execute": "dumpdtb"}
>> +#    "arguments": { "filename": "/tmp/fdt.dtb" } }
> 
> Excuse my nitpicking...  Creating files with a fixed filename in /tmp is
> a bad habit, and this example promotes it.  We have similar examples
> elsewhere.  Still, I'd prefer not to add more.
> 
>> +#
>> +##
>> +{ 'command': 'dumpdtb',
>> +  'data': { 'filename': 'str' },
>> +  'if': 'CONFIG_FDT' }
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index 6ca3fad285..cdd41b6de6 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -26,6 +26,9 @@
>>   #include "hw/loader.h"
>>   #include "hw/boards.h"
>>   #include "qemu/config-file.h"
>> +#include "qapi/qapi-commands-machine.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "monitor/hmp.h"
>>   
>>   #include <libfdt.h>
>>   
>> @@ -643,3 +646,31 @@ out:
>>       g_free(propcells);
>>       return ret;
>>   }
>> +
>> +void qmp_dumpdtb(const char *filename, Error **errp)
>> +{
>> +    g_autoptr(GError) err = NULL;
>> +    int size;
>> +
>> +    if (!current_machine->fdt) {
>> +        error_setg(errp, "Unable to find the machine FDT");
> 
> Perhaps: "this machine doesn't have an FDT".
> 
>> +        return;
>> +    }
>> +
>> +    size = fdt_totalsize(current_machine->fdt);
>> +
>> +    if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
>> +        error_setg(errp, "Error saving FDT to file %s: %s",
>> +                   filename, err->message);
>> +    }
>> +}
>> +
>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>> +{
>> +    const char *filename = qdict_get_str(qdict, "filename");
>> +    Error *local_err = NULL;
>> +
>> +    qmp_dumpdtb(filename, &local_err);
>> +
>> +    hmp_handle_error(mon, local_err);
>> +}
> 

