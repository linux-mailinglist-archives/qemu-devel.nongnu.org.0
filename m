Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687785E8B26
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 11:50:54 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc1oC-0001Jz-VA
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 05:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oc1m0-00083N-AH; Sat, 24 Sep 2022 05:48:36 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oc1ly-0002UF-8X; Sat, 24 Sep 2022 05:48:35 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 t4-20020a4aa3c4000000b00475624f2369so400705ool.3; 
 Sat, 24 Sep 2022 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=F2zeCKN7X/KrKCdX7wc1KIiNOiUmp9nu34c6TLKgYfw=;
 b=eSU7AxZzu2eUNta2EcgqMFGxAS7IWbJvujc0e+RyVWcC+qBHnGNFgYUfkOuhxHJAz3
 ASTgKEMsQelWVlO4mChka8cOIIyZMssa96Yal3oJKVaXbuGMXCufGViBP1T1eSBc9dLg
 fqxaek86JZDqaOanKa0rAzg8Xrys1VUb3XAMKWDkYB/QY6GuzEfK4bcc0NpeGn5z2iAV
 60mWIXAOq7UFq/MqIIzzd+bR0q8dFhnKmr83wl4tBPHdjQIeU2e68jpca8fvtOhH0WWc
 D6CuLUHZPr3Cem+8tTlYZjIUgEdz5a4/kiFkYw7iw/P/2EA/R0y5rrqLFaJXHEB8Pstv
 eVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=F2zeCKN7X/KrKCdX7wc1KIiNOiUmp9nu34c6TLKgYfw=;
 b=15VVUSmZI2cW0L7gaHB+mXkzqe8+US/R8qpn5fwQPZx5+sln3tDJnlTSFaf4YlQ8b8
 XTEhgCr9Oo3DIJHQLSQxjdJF4Mr6XVUpQ6nU92E1RRKxnUorI6eJpqiwwBHAaESSh7J4
 lVhXpk0GZIy4Ch5hd3LJcT4+/oS5Da1A5p4JU+SzG4wLCd/euD6pEOWqYmBQK6wRZwyL
 W2UsuW7OPO2yGmh+v1t9HkY6VIHhT8cK3F6b/DDnIdNugI7gXEljgHQDkQa4ca/3U7XU
 Q4aBufP3jFuyElUU8W4eMfQ4+42G1GNmisg3oJqPZkDt3G5p1VaH+c/RyDxDOzTmwOy3
 vkyQ==
X-Gm-Message-State: ACrzQf16wzljuNqLZG1gGQ663aLjfxds17c5054sjT3ZcAyEjOWzb1Nd
 yYO+JXNQ5l1HkgYS0wSNYHI=
X-Google-Smtp-Source: AMsMyM47q7vhTBE5gCtHrCWdEWkuVJV2HYT/MTuMFsNN5m7UQKlG/lw7xZGFnARgk3bfFzYUS1BM6A==
X-Received: by 2002:a4a:9625:0:b0:472:9a81:10a7 with SMTP id
 q34-20020a4a9625000000b004729a8110a7mr5047932ooi.41.1664012912312; 
 Sat, 24 Sep 2022 02:48:32 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 w21-20020a056830111500b00638dd127f54sm5178118otq.1.2022.09.24.02.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:48:31 -0700 (PDT)
Message-ID: <798b9ebf-aa86-2cd3-08ab-a256f7ebd17f@gmail.com>
Date: Sat, 24 Sep 2022 06:48:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-15-danielhb413@gmail.com>
 <0d4f5caf-6005-779d-8e37-5d26ba3a0856@amsat.org>
 <87r103mw2q.fsf@pond.sub.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87r103mw2q.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/22/22 09:29, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 8/9/22 21:40, Daniel Henrique Barboza wrote:
>>> To save the FDT blob we have the '-machine dumpdtb=<file>' property.
>>> With this property set, the machine saves the FDT in <file> and exit.
>>> The created file can then be converted to plain text dts format using
>>> 'dtc'.
>>>
>>> There's nothing particularly sophisticated into saving the FDT that
>>> can't be done with the machine at any state, as long as the machine has
>>> a valid FDT to be saved.
>>>
>>> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
>>
>> Typo "parameter".
>>
>>> FDT is available, it'll save it in a file 'filename'. In short, this is
>>> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>>>
>>> A valid FDT consists of a FDT that was created using libfdt being
>>> retrieved via 'current_machine->fdt' in device_tree.c.
>>
>> This sentence is odd.
> 
> Seconded.

I removed it and changed the previous paragraph as follows:

The 'dumpdtb' command receives a 'filename' parameter and, if the FDT is available
via current_machine->fdt, save it in dtb format to 'filename'. In short, this is a
'-machine dumpdtb' that can be fired on demand via QMP/HMP.


> 
>>> This condition is
>>> met by most FDT users in QEMU.
>>>
>>> This command will always be executed in-band (i.e. holding BQL),
>>> avoiding potential race conditions with machines that might change the
>>> FDT during runtime (e.g. PowerPC 'pseries' machine).
>>>
>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Cc: Markus Armbruster <armbru@redhat.com>
>>> Cc: Alistair Francis <alistair.francis@wdc.com>
>>> Cc: David Gibson <david@gibson.dropbear.id.au>
>>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>    hmp-commands.hx              | 15 +++++++++++++++
>>>    include/sysemu/device_tree.h |  1 +
>>>    monitor/misc.c               |  1 +
>>>    qapi/machine.json            | 18 ++++++++++++++++++
>>>    softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
>>>    5 files changed, 66 insertions(+)
>>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>>> index 182e639d14..753669a2eb 100644
>>> --- a/hmp-commands.hx
>>> +++ b/hmp-commands.hx
>>> @@ -1800,3 +1800,18 @@ ERST
>>>                          "\n\t\t\t\t\t limit on a specified virtual cpu",
>>>            .cmd        = hmp_cancel_vcpu_dirty_limit,
>>>        },
>>> +
>>> +#if defined(CONFIG_FDT)
>>> +    {
>>> +        .name       = "dumpdtb",
>>> +        .args_type  = "filename:F",
>>> +        .params     = "filename",
>>> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> 
> Here, you document the format as "to be decoded using dtc".  In the QAPI
> schema below, you document it as "dtb format" and "FDT file".  Pick one
> and stick to it, please.
> 
> "the 'filename' file" feels a bit awkward.  Suggest something "dump the
> FDT in dtb format to 'filename'", similar to your phrasing in the QAPI
> schema.

Changed to:

         .help       = "dump the FDT in dtb format to 'filename'",


> 
> 
>>> +        .cmd        = hmp_dumpdtb,
>>> +    },
>>> +
>>> +SRST
>>> +``dumpdtb`` *filename*
>>> +  Save the FDT in the 'filename' file to be decoded using dtc.
> 
> *filename*, not 'filename'.

Changed the sentence to:


   Dump the FDT in dtb format to *filename*.


> 
>>> +ERST
>>> +#endif
>>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>>> index ef060a9759..e7c5441f56 100644
>>> --- a/include/sysemu/device_tree.h
>>> +++ b/include/sysemu/device_tree.h
>>> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>>>        } while (0)
>>>      void qemu_fdt_dumpdtb(void *fdt, int size);
>>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>>>      /**
>>>     * qemu_fdt_setprop_sized_cells_from_array:
>>> diff --git a/monitor/misc.c b/monitor/misc.c
>>> index 3d2312ba8d..e7dd63030b 100644
>>> --- a/monitor/misc.c
>>> +++ b/monitor/misc.c
>>> @@ -49,6 +49,7 @@
>>>    #include "sysemu/blockdev.h"
>>>    #include "sysemu/sysemu.h"
>>>    #include "sysemu/tpm.h"
>>> +#include "sysemu/device_tree.h"
>>>    #include "qapi/qmp/qdict.h"
>>>    #include "qapi/qmp/qerror.h"
>>>    #include "qapi/qmp/qstring.h"
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index abb2f48808..9f0c8c8374 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -1664,3 +1664,21 @@
>>>         '*size': 'size',
>>>         '*max-size': 'size',
>>>         '*slots': 'uint64' } }
>>> +
>>> +##
>>> +# @dumpdtb:
>>> +#
>>> +# Save the FDT in dtb format.
>>> +#
>>> +# @filename: name of the FDT file to be created
>>
>> "name of the binary FDT ..."?

Changed to:


# @filename: name of the dtb file to be created



>>
>>> +#
>>> +# Since: 7.2
>>> +#
>>> +# Example:
>>> +#   {"execute": "dumpdtb"}
>>> +#    "arguments": { "filename": "fdt.dtb" } }
>>> +#
>>> +##
>>> +{ 'command': 'dumpdtb',
>>> +  'data': { 'filename': 'str' },
>>> +  'if': 'CONFIG_FDT' }
>>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>>> index 6ca3fad285..7031dcf89d 100644
>>> --- a/softmmu/device_tree.c
>>> +++ b/softmmu/device_tree.c
>>> @@ -26,6 +26,9 @@
>>>    #include "hw/loader.h"
>>>    #include "hw/boards.h"
>>>    #include "qemu/config-file.h"
>>> +#include "qapi/qapi-commands-machine.h"
>>> +#include "qapi/qmp/qdict.h"
>>> +#include "monitor/hmp.h"
>>>      #include <libfdt.h>
>>>    @@ -643,3 +646,31 @@ out:
>>>        g_free(propcells);
>>>        return ret;
>>>    }
>>> +
>>> +void qmp_dumpdtb(const char *filename, Error **errp)
>>> +{
>>> +    g_autoptr(GError) err = NULL;
>>> +    int size;
>>
>> fdt_totalsize() returns an uint32_t. Maybe use "unsigned" if you
>> don't want to use uint32_t?
> 
> Best to avoid unnecessary conversions between signed and unsigned.
> 
> The value is passed to g_file_set_contents() below, which takes a
> gssize.  uint32_t should be narrower than gssize on anything capable of
> running QEMU.  So let's use that.


Changed size to uint32_t.


> 
>>> +
>>> +    if (!current_machine->fdt) {
>>> +        error_setg(errp, "This machine doesn't have a FDT");
>>> +        return;
>>> +    }
>>> +
>>> +    size = fdt_totalsize(current_machine->fdt);
>>
>>         assert(size > 0); ?

Given that this is classified as a debug command I believe it's ok to g_assert()
if size == 0 here. Changed.


>>
>>> +
>>> +    if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
>>> +        error_setg(errp, "Error saving FDT to file %s: %s",
>>> +                   filename, err->message);
>>> +    }
>>
>> Eventually:
>>
>>         info_report("Dumped %u bytes of FDT to %s\n", size, filename);
>>
>> To have a feedback in HMP.
> 
> If feedback is desired, it needs to be done in hmp_dumpdtb().
> info_report() here would make the QMP command spam stderr.

Added the following in hmp_dumpdtb():

     if (hmp_handle_error(mon, local_err)) {
         return;
     }

     info_report("dtb dumped to %s",filename);

> 
>>> +}
>>> +
>>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>>> +{
>>> +    const char *filename = qdict_get_str(qdict, "filename");
>>> +    Error *local_err = NULL;
>>> +
>>> +    qmp_dumpdtb(filename, &local_err);
>>> +
>>> +    hmp_handle_error(mon, local_err);
>>> +}
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> With the commit message, the documentation, and the integer conversions
> tidied up:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thank you both for the review. I've added both R-bs after the changes mentioned.



Daniel

> 

