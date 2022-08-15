Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66D593616
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 21:22:41 +0200 (CEST)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNffc-0004di-TY
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 15:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oNfdZ-0001qb-9Q
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:20:37 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oNfdW-0000i3-JL
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 15:20:32 -0400
Received: by mail-vs1-xe29.google.com with SMTP id v128so8077928vsb.10
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 12:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8wgdP1ZMybUqjHWkf/cPFBWRz6KJgCY9sMn/wueXb44=;
 b=WSWAgoMiMKoA6o9fRCV+Jwswl86kC5sxPfkvVQaUe8Ptl2iNrTB9vlwDFfRnbKy+/s
 1gNaidGhxJlUyTJSH3EFZKjHXPyWZWowyqMQem4hdhhiHpgRt/inYaFwG1P2sDqFDd+g
 VxpGS7dLBVM5kSBVY6jvaEoo7zJccnopQAZcooHSKAReuFtAXoRj05cPUbwsJQ90fzyH
 D4TSWtVm13zTYw3IK/UtjQ4BXz3litsc0kdjYz8j24tcGRWUKL2zEBMf1dOSBFPQf5ce
 18ST9MSakzf0XK7me2kX10pMw5dzTyEHv/kqBtmlipUcmtwVu4SJ/vM/hsupPDWeSL9i
 labg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8wgdP1ZMybUqjHWkf/cPFBWRz6KJgCY9sMn/wueXb44=;
 b=Io93C6+yatZOSIStS1/mEJE648LsVK9R5JUyFZwHYLbHnxarFG1cMzYf4Ih/yvEbDt
 D0ghacAh5SmvEJBElg8ty2+3qKCG4Lhl7gE1EX5gNhIcKTvuZkqZFCvZQU1zzw6Lu1gM
 y372qjTUfjqhtMc2s7cYezIg37o7IR5jY18xt32TvAW1UVVvYe/PIG2e6JcIN7I2H8A7
 ecdr9qTsiKRuhB5xTIeNkDDEWwv8S2eAjsfDDEYIAe9jvGyJpOm9U1qm4vMBwgKGy16g
 L4MAzOIQk3y1QdsyPHt/f4eLY95g+GRsozh+6krI2V1BegKbf4ES5YauZFFEqu/n0h0t
 RUug==
X-Gm-Message-State: ACgBeo3jUe42sE3Wrb6/2QP5xUGMEICwO/czveLIl0UFsiGQPdRi6IaT
 JB7z7kW7S7U59OwAvWc5w74EV1jOsFhdjA==
X-Google-Smtp-Source: AA6agR4WNnkb8Y7G6i9c+u8V6yEXFku17YN2hpV1jykRPjDZ11xxi+FqaOdxWbpIXc9ouPD4hkfYcA==
X-Received: by 2002:a05:6102:212e:b0:388:90da:601e with SMTP id
 f14-20020a056102212e00b0038890da601emr7143456vsg.24.1660591225399; 
 Mon, 15 Aug 2022 12:20:25 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 k27-20020a9f30db000000b00387499c5353sm5472697uab.39.2022.08.15.12.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 12:20:25 -0700 (PDT)
Message-ID: <60d6f521-fec2-e561-fc15-825aeeda9d44@gmail.com>
Date: Mon, 15 Aug 2022 16:20:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 14/20] qmp/hmp, device_tree.c: introduce dumpdtb
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 alistair.francis@wdc.com
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-15-danielhb413@gmail.com> <YvCDY6PCvMWG5rnr@yekko>
 <7a5a55f5-2e60-e34b-f84a-85ae4c122f7f@gmail.com> <YvqRDrU3hW6Erl6e@work-vm>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YvqRDrU3hW6Erl6e@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
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



On 8/15/22 15:31, Dr. David Alan Gilbert wrote:
> * Daniel Henrique Barboza (danielhb413@gmail.com) wrote:
>>
>>
>> On 8/8/22 00:30, David Gibson wrote:
>>> On Fri, Aug 05, 2022 at 06:39:42AM -0300, Daniel Henrique Barboza wrote:
>>>> To save the FDT blob we have the '-machine dumpdtb=<file>' property.
>>>> With this property set, the machine saves the FDT in <file> and exit.
>>>> The created file can then be converted to plain text dts format using
>>>> 'dtc'.
>>>>
>>>> There's nothing particularly sophisticated into saving the FDT that
>>>> can't be done with the machine at any state, as long as the machine has
>>>> a valid FDT to be saved.
>>>>
>>>> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
>>>> FDT is available, it'll save it in a file 'filename'. In short, this is
>>>> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>>>>
>>>> A valid FDT consists of a FDT that was created using libfdt being
>>>> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
>>>> met by most FDT users in QEMU.
>>>
>>> On spapr at least, the fdt can change at runtime (due to hotplugs).
>>> So we need to think about concurrency between fdt updates and dumping
>>> it with this command.  I'm assuming it's protected by the BQL, but I'm
>>> wondering if we should outright state that somewhere for clarity.
>>
>> Your assumption is right. It is protected by BQL since it's always executed
>> in-band. To not hold BQL we would need to declare an extra flag "allow-oob"
>> to execute the command out-of-band.
>>
>> I'll mention in the commit msg that we're holding BQL. I'll do the same for
>> the 'info fdt' commit msg.
> 
> Is the update of the FDT also protected that way?

Yes. At least for the pseries machine, the only machine we have ATM that updates
the FDT after boot, without hotplug/unplug, and uses libfdt.

The update of the pseries FDT occurs in the h_client_architecture_support hcall,
which is always called holding BQL (either via kvm_arch_handle_exit() or
emulate_spapr_hypercall).

> (I guess hotplug commands are also protected by the bql - but is the
> hotplug completion?)

Hotplug completion is protected by BQL in all machines, as far as I know.


Thanks,


Daniel

> 
> Dave
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>
>>>>
>>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>    hmp-commands.hx              | 13 +++++++++++++
>>>>    include/monitor/hmp.h        |  1 +
>>>>    include/sysemu/device_tree.h |  1 +
>>>>    monitor/hmp-cmds.c           | 12 ++++++++++++
>>>>    monitor/qmp-cmds.c           | 13 +++++++++++++
>>>>    qapi/machine.json            | 17 +++++++++++++++++
>>>>    softmmu/device_tree.c        | 18 ++++++++++++++++++
>>>>    7 files changed, 75 insertions(+)
>>>>
>>>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>>>> index 182e639d14..d2554e9701 100644
>>>> --- a/hmp-commands.hx
>>>> +++ b/hmp-commands.hx
>>>> @@ -1800,3 +1800,16 @@ ERST
>>>>                          "\n\t\t\t\t\t limit on a specified virtual cpu",
>>>>            .cmd        = hmp_cancel_vcpu_dirty_limit,
>>>>        },
>>>> +
>>>> +SRST
>>>> +``dumpdtb`` *filename*
>>>> +  Save the FDT in the 'filename' file to be decoded using dtc.
>>>> +  Requires 'libfdt' support.
>>>> +ERST
>>>> +    {
>>>> +        .name       = "dumpdtb",
>>>> +        .args_type  = "filename:s",
>>>> +        .params     = "[filename] file to save the FDT",
>>>> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
>>>> +        .cmd        = hmp_dumpdtb,
>>>> +    },
>>>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>>>> index a618eb1e4e..d7f324da59 100644
>>>> --- a/include/monitor/hmp.h
>>>> +++ b/include/monitor/hmp.h
>>>> @@ -134,6 +134,7 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>>>>    void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>>>    void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>>>    void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>>>>    void hmp_human_readable_text_helper(Monitor *mon,
>>>>                                        HumanReadableText *(*qmp_handler)(Error **));
>>>>    void hmp_info_stats(Monitor *mon, const QDict *qdict);
>>>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>>>> index ef060a9759..bf7684e4ed 100644
>>>> --- a/include/sysemu/device_tree.h
>>>> +++ b/include/sysemu/device_tree.h
>>>> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>>>>        } while (0)
>>>>    void qemu_fdt_dumpdtb(void *fdt, int size);
>>>> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>>>>    /**
>>>>     * qemu_fdt_setprop_sized_cells_from_array:
>>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>>> index c6cd6f91dd..d23ec85f9d 100644
>>>> --- a/monitor/hmp-cmds.c
>>>> +++ b/monitor/hmp-cmds.c
>>>> @@ -2472,3 +2472,15 @@ exit:
>>>>    exit_no_print:
>>>>        error_free(err);
>>>>    }
>>>> +
>>>> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>>>> +{
>>>> +    const char *filename = qdict_get_str(qdict, "filename");
>>>> +    Error *local_err = NULL;
>>>> +
>>>> +    qmp_dumpdtb(filename, &local_err);
>>>> +
>>>> +    if (local_err) {
>>>> +        error_report_err(local_err);
>>>> +    }
>>>> +}
>>>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>>>> index 7314cd813d..8415aca08c 100644
>>>> --- a/monitor/qmp-cmds.c
>>>> +++ b/monitor/qmp-cmds.c
>>>> @@ -45,6 +45,7 @@
>>>>    #include "hw/intc/intc.h"
>>>>    #include "hw/rdma/rdma.h"
>>>>    #include "monitor/stats.h"
>>>> +#include "sysemu/device_tree.h"
>>>>    NameInfo *qmp_query_name(Error **errp)
>>>>    {
>>>> @@ -596,3 +597,15 @@ bool apply_str_list_filter(const char *string, strList *list)
>>>>        }
>>>>        return false;
>>>>    }
>>>> +
>>>> +#ifdef CONFIG_FDT
>>>> +void qmp_dumpdtb(const char *filename, Error **errp)
>>>> +{
>>>> +    return qemu_fdt_qmp_dumpdtb(filename, errp);
>>>> +}
>>>> +#else
>>>> +void qmp_dumpdtb(const char *filename, Error **errp)
>>>> +{
>>>> +    error_setg(errp, "dumpdtb requires libfdt");
>>>> +}
>>>> +#endif
>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>> index 6afd1936b0..aeb013f3dd 100644
>>>> --- a/qapi/machine.json
>>>> +++ b/qapi/machine.json
>>>> @@ -1664,3 +1664,20 @@
>>>>         '*size': 'size',
>>>>         '*max-size': 'size',
>>>>         '*slots': 'uint64' } }
>>>> +
>>>> +##
>>>> +# @dumpdtb:
>>>> +#
>>>> +# Save the FDT in dtb format. Requires 'libfdt' support.
>>>> +#
>>>> +# @filename: name of the FDT file to be created
>>>> +#
>>>> +# Since: 7.2
>>>> +#
>>>> +# Example:
>>>> +#   {"execute": "dumpdtb"}
>>>> +#    "arguments": { "filename": "/tmp/fdt.dtb" } }
>>>> +#
>>>> +##
>>>> +{ 'command': 'dumpdtb',
>>>> +  'data': { 'filename': 'str' } }
>>>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>>>> index 6ca3fad285..cd487ddd4d 100644
>>>> --- a/softmmu/device_tree.c
>>>> +++ b/softmmu/device_tree.c
>>>> @@ -643,3 +643,21 @@ out:
>>>>        g_free(propcells);
>>>>        return ret;
>>>>    }
>>>> +
>>>> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
>>>> +{
>>>> +    int size;
>>>> +
>>>> +    if (!current_machine->fdt) {
>>>> +        error_setg(errp, "Unable to find the machine FDT");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    size = fdt_totalsize(current_machine->fdt);
>>>> +
>>>> +    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    error_setg(errp, "Error when saving machine FDT to file %s", filename);
>>>> +}
>>>
>>

