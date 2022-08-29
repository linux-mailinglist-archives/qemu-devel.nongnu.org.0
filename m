Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31905A56A2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 00:03:09 +0200 (CEST)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSmqa-0002Qg-Gq
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 18:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oSmof-00013L-Vr; Mon, 29 Aug 2022 18:01:10 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oSmoa-0005Yc-4C; Mon, 29 Aug 2022 18:01:09 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11c4d7d4683so12514596fac.8; 
 Mon, 29 Aug 2022 15:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=EP67YyhU2mnb24TPgVICtAQJHV415JlR7rlbtwT9/Dw=;
 b=Rzqs9A/JxBOiHZMEeQsw5Yhy5uoY2oTnjC6NiLtBUjr0vthkyrgZd0H6k+KxYAxZEH
 Zfo3DQf1wQvyBWKLqIb7FEtE45sLPwSxcKJ9RnfxwiKRVKPxhaEvy3crY8nM6jgTPKMB
 qgam2dk1L22Q7ihsE6jCud5c0eePttANHdp0sD6srNoJNgw2Ba9jYA0b8IS7SaVCT/Vp
 DSf7IP/CQbLwqnUecaQIC3SJOWpnHQCHqYxD79DrKFPw73bHeIFmaAeQDnhl0HMHGc6D
 ETgK/D3x0TJgwF5F4s1mncGFBPN/YboK0gUTEVMCI7aQ4vFwoW5hfZ/hG7DAshJGdOfl
 SGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=EP67YyhU2mnb24TPgVICtAQJHV415JlR7rlbtwT9/Dw=;
 b=ATNK7Y4KGd7cGOJDCmn92DMdSmO90aZshA4gsD6hqS1/Su4C+Qa+vVhJ12P2zd5rdl
 e9RUMpgR7XFyVXHG5BThHtAllaC5Hv9B8FWv5QQuND+5Q7C4SNHdAwXxrJZYHl3lYNUf
 k18Y3JuhFS21envP8HFx40hl9+eyfxFD07Q1hqi7HWZklNAl0yEd0oaNko/eB/UnWcW9
 zHe/tNUNw7bI6NnKQw/Cn2UfJ19nKL7ouL3/ucw7m/k1G1RvDBNGOql0cBEUAX64Os57
 o5XzrUbfRwNczE1mjuhtcyS6XDx0JzuTZ1/LL9lMLmOKpjoqRqe74dgeuMZwADLgZ+9N
 YLCA==
X-Gm-Message-State: ACgBeo0kfkJ/uMRG49nQQDlY9ExkF8Bd56S9EvgWVL0M5fx+KHJLvQsn
 HK9glrSgWXaaarQB+0mwFnY=
X-Google-Smtp-Source: AA6agR4yi3Mi65Vwk2Qxdbg4F/PoTr2lUaP1X3ena2MjE3Daa7gwASyFe8mlyYOqqa68L8IHoOnTiw==
X-Received: by 2002:a05:6870:d688:b0:11e:50bb:d554 with SMTP id
 z8-20020a056870d68800b0011e50bbd554mr8692210oap.48.1661810461506; 
 Mon, 29 Aug 2022 15:01:01 -0700 (PDT)
Received: from [192.168.10.102] ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a05680813cc00b003448fac8b00sm5458129oiw.29.2022.08.29.15.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 15:01:00 -0700 (PDT)
Message-ID: <45bd4519-1529-c147-cd99-c68e1045d2f2@gmail.com>
Date: Mon, 29 Aug 2022 19:00:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 15/21] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-16-danielhb413@gmail.com> <YwwzyxSCB8rP/usi@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YwwzyxSCB8rP/usi@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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



On 8/29/22 00:34, David Gibson wrote:
> On Fri, Aug 26, 2022 at 11:11:44AM -0300, Daniel Henrique Barboza wrote:
>> Reading the FDT requires that the user saves the fdt_blob and then use
>> 'dtc' to read the contents. Saving the file and using 'dtc' is a strong
>> use case when we need to compare two FDTs, but it's a lot of steps if
>> you want to do quick check on a certain node or property.
>>
>> 'info fdt' retrieves FDT nodes (and properties, later on) and print it
>> to the user. This can be used to check the FDT on running machines
>> without having to save the blob and use 'dtc'.
>>
>> The implementation is based on the premise that the machine thas a FDT
>> created using libfdt and pointed by 'machine->fdt'. As long as this
>> pre-requisite is met the machine should be able to support it.
>>
>> For now we're going to add the required QMP/HMP boilerplate and the
>> capability of printing the name of the properties of a given node. Next
>> patches will extend 'info fdt' to be able to print nodes recursively,
>> and then individual properties.
>>
>> This command will always be executed in-band (i.e. holding BQL),
>> avoiding potential race conditions with machines that might change the
>> FDT during runtime (e.g. PowerPC 'pseries' machine).
>>
>> 'info fdt' is not something that we expect to be used aside from debugging,
>> so we're implementing it in QMP as 'x-query-fdt'.
>>
>> This is an example of 'info fdt' fetching the '/chosen' node of the
>> pSeries machine:
>>
>> (qemu) info fdt /chosen
>> chosen {
>>      ibm,architecture-vec-5;
>>      rng-seed;
>>      ibm,arch-vec-5-platform-support;
>>      linux,pci-probe-only;
>>      stdout-path;
>>      linux,stdout-path;
>>      qemu,graphic-depth;
>>      qemu,graphic-height;
>>      qemu,graphic-width;
>> };
>>
>> And the same node for the aarch64 'virt' machine:
>>
>> (qemu) info fdt /chosen
>> chosen {
>>      stdout-path;
>>      rng-seed;
>>      kaslr-seed;
>> };
> 
> So, I'm reasonably convinced allowing dumping the whole dtb from
> qmp/hmp is useful.  I'm less convined that info fdt is worth the
> additional complexity it incurs.  Note that as well as being able to
> decompile a whole dtb using dtc, you can also extract and list
> specific properties from a dtb blob using the 'fdtget' tool which is
> part of the dtc tree.

What's your opinion on patch 21/21, where 'dumpdtb' can write a formatted
FDT in a file with an extra option? That was possible because of the
format helpers introduced for 'info fdt'. The idea is that since we're
able to format a FDT in DTS format, we can also write the FDT in text
format without relying on DTC to decode it.

If we think that this 'dumpdtb' capability is worth having, I can respin
the patches without 'info fdt' but adding these helpers to enable this
'dumpdtb' support. If not, then we can just remove patches 15-21 and
be done with it.


Thanks,


Daniel

> 
>>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hmp-commands-info.hx         | 13 ++++++++++
>>   include/monitor/hmp.h        |  1 +
>>   include/sysemu/device_tree.h |  4 +++
>>   monitor/hmp-cmds.c           | 13 ++++++++++
>>   monitor/qmp-cmds.c           | 12 +++++++++
>>   qapi/machine.json            | 19 +++++++++++++++
>>   softmmu/device_tree.c        | 47 ++++++++++++++++++++++++++++++++++++
>>   7 files changed, 109 insertions(+)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index 188d9ece3b..743b48865d 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -921,3 +921,16 @@ SRST
>>     ``stats``
>>       Show runtime-collected statistics
>>   ERST
>> +
>> +    {
>> +        .name       = "fdt",
>> +        .args_type  = "nodepath:s",
>> +        .params     = "nodepath",
>> +        .help       = "show firmware device tree node given its path",
>> +        .cmd        = hmp_info_fdt,
>> +    },
>> +
>> +SRST
>> +  ``info fdt``
>> +    Show a firmware device tree node given its path. Requires libfdt.
>> +ERST
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index d7f324da59..c0883dd1e3 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -135,6 +135,7 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>   void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>   void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>   void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>> +void hmp_info_fdt(Monitor *mon, const QDict *qdict);
>>   void hmp_human_readable_text_helper(Monitor *mon,
>>                                       HumanReadableText *(*qmp_handler)(Error **));
>>   void hmp_info_stats(Monitor *mon, const QDict *qdict);
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index bf7684e4ed..057d13e397 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -14,6 +14,8 @@
>>   #ifndef DEVICE_TREE_H
>>   #define DEVICE_TREE_H
>>   
>> +#include "qapi/qapi-types-common.h"
>> +
>>   void *create_device_tree(int *sizep);
>>   void *load_device_tree(const char *filename_path, int *sizep);
>>   #ifdef CONFIG_LINUX
>> @@ -137,6 +139,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>>   
>>   void qemu_fdt_dumpdtb(void *fdt, int size);
>>   void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
>> +                                          Error **errp);
>>   
>>   /**
>>    * qemu_fdt_setprop_sized_cells_from_array:
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 1c7bfd3b9d..93a4103afa 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>>           hmp_handle_error(mon, local_err);
>>       }
>>   }
>> +
>> +void hmp_info_fdt(Monitor *mon, const QDict *qdict)
>> +{
>> +    const char *nodepath = qdict_get_str(qdict, "nodepath");
>> +    Error *err = NULL;
>> +    g_autoptr(HumanReadableText) info = qmp_x_query_fdt(nodepath, &err);
>> +
>> +    if (hmp_handle_error(mon, err)) {
>> +        return;
>> +    }
>> +
>> +    monitor_printf(mon, "%s", info->human_readable_text);
>> +}
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index 8415aca08c..db2c6aa7da 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -603,9 +603,21 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>>   {
>>       return qemu_fdt_qmp_dumpdtb(filename, errp);
>>   }
>> +
>> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
>> +{
>> +    return qemu_fdt_qmp_query_fdt(nodepath, errp);
>> +}
>>   #else
>>   void qmp_dumpdtb(const char *filename, Error **errp)
>>   {
>>       error_setg(errp, "dumpdtb requires libfdt");
>>   }
>> +
>> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
>> +{
>> +    error_setg(errp, "this command requires libfdt");
>> +
>> +    return NULL;
>> +}
>>   #endif
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index aeb013f3dd..96cff541ca 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1681,3 +1681,22 @@
>>   ##
>>   { 'command': 'dumpdtb',
>>     'data': { 'filename': 'str' } }
>> +
>> +##
>> +# @x-query-fdt:
>> +#
>> +# Query for FDT element (node or property). Requires 'libfdt'.
>> +#
>> +# @nodepath: the path of the FDT node to be retrieved
>> +#
>> +# Features:
>> +# @unstable: This command is meant for debugging.
>> +#
>> +# Returns: FDT node
>> +#
>> +# Since: 7.2
>> +##
>> +{ 'command': 'x-query-fdt',
>> +  'data': { 'nodepath': 'str' },
>> +  'returns': 'HumanReadableText',
>> +  'features': [ 'unstable' ]  }
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index cd487ddd4d..6b15f6ace2 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -18,6 +18,7 @@
>>   #endif
>>   
>>   #include "qapi/error.h"
>> +#include "qapi/type-helpers.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/option.h"
>>   #include "qemu/bswap.h"
>> @@ -661,3 +662,49 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
>>   
>>       error_setg(errp, "Error when saving machine FDT to file %s", filename);
>>   }
>> +
>> +static void fdt_format_node(GString *buf, int node, int depth)
>> +{
>> +    const struct fdt_property *prop = NULL;
>> +    const char *propname = NULL;
>> +    void *fdt = current_machine->fdt;
>> +    int padding = depth * 4;
>> +    int property = 0;
>> +    int prop_size;
>> +
>> +    g_string_append_printf(buf, "%*s%s {\n", padding, "",
>> +                           fdt_get_name(fdt, node, NULL));
>> +
>> +    padding += 4;
>> +
>> +    fdt_for_each_property_offset(property, fdt, node) {
>> +        prop = fdt_get_property_by_offset(fdt, property, &prop_size);
>> +        propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
>> +
>> +        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
>> +    }
>> +
>> +    padding -= 4;
>> +    g_string_append_printf(buf, "%*s};\n", padding, "");
>> +}
>> +
>> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
>> +{
>> +    g_autoptr(GString) buf = g_string_new("");
>> +    int node;
>> +
>> +    if (!current_machine->fdt) {
>> +        error_setg(errp, "Unable to find the machine FDT");
>> +        return NULL;
>> +    }
>> +
>> +    node = fdt_path_offset(current_machine->fdt, nodepath);
>> +    if (node < 0) {
>> +        error_setg(errp, "node '%s' not found in FDT", nodepath);
>> +        return NULL;
>> +    }
>> +
>> +    fdt_format_node(buf, node, 0);
>> +
>> +    return human_readable_text_from_str(buf);
>> +}
> 

