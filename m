Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784A5942D5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 00:49:52 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNiu7-0000y7-9b
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 18:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oNisg-00083N-66
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 18:48:22 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:43969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oNisd-0005st-UY
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 18:48:21 -0400
Received: by mail-ua1-x92b.google.com with SMTP id s18so3396984uac.10
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 15:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=EDgMpNSCBokBmm14+knk86ut90WruWV65l5y0h1IZgs=;
 b=AejaUrMvu8QdIooavzWql0ceyt5+/MsuVadoQLJG0tJZXzfhXIUZiVLtjxh32sB8Je
 gW6+gL5wkTHx1IglwpEXTTiHhrt5a9Zp6FPxQXIBlUkTAQdi+rIAIY0x515U0RFaSjcT
 PnUNju+capx6BFANyv5ZtgpsLZ2QXYYnuu5U0QZhUFSIM7qTkaXH5nkIN6os2TuqTVRv
 dJVvopYZqm4hL01wwCR0iS6RyU+6/GUsBJxJ6b5XONlHdYuH9xqSf5n8zOzus8eI3M1k
 iQz/S/78I5CZntNtZSg6tXXJEXAJtZn4gbNK+J5gAGBHqrFcbb7+hi0ySrAvOSoK29Fw
 fF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=EDgMpNSCBokBmm14+knk86ut90WruWV65l5y0h1IZgs=;
 b=pLXYG526irnGIPbdNRY54i2OkXgi23GU/3jqODUKpay2pDuUUhCpK35wGtK+O4bPOP
 BUuZjRQxgZgsLD8GW8b5MhfmfegfN45FqCvPC9gGNFxQGRZ9KuWAlcLpvlNATeDmq5OG
 iHc6IJuFO9MqgBP+yaLIccTX+MgidpVxGpEKLffv3H3OPXpqM3eAr8hlMmhRmy21ZqNs
 SkgRRDkigqD+aVXoFEFsrrn4rscIfHnFHS+UdAZw+X1gdJHLzNI1bDvTFS6ZI8UE49tH
 az9DEGkWoSouNRJOfi8YBSJ7fMhJCMQgdDan0DZFoKS8cWrZQ9GSb3AqrzrQ84qq8Cts
 4bUg==
X-Gm-Message-State: ACgBeo1c9JsGi9+h3jROF+BocJOptTcTGNxIE0BdA0r0kEy3hU0xNvWE
 LWhY5uSTbaUBMOiFBq1jazzKFcQ9X10d5g==
X-Google-Smtp-Source: AA6agR6DgLZeQiON1QmqTm4+YPlRdBf943qKyqB0/4n+mVsCrjZQafOc25iqRGXAZJVvVsxEY+lwCA==
X-Received: by 2002:a05:6130:112:b0:38c:4226:62f2 with SMTP id
 h18-20020a056130011200b0038c422662f2mr7608760uag.82.1660603698541; 
 Mon, 15 Aug 2022 15:48:18 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 b21-20020a056102233500b0037c457e4b49sm6533802vsa.6.2022.08.15.15.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 15:48:18 -0700 (PDT)
Message-ID: <2e4509e2-db98-70ff-fb12-9d753127bd64@gmail.com>
Date: Mon, 15 Aug 2022 19:48:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 15/20] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-16-danielhb413@gmail.com> <YvCPT8eZSKMM4zk5@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YvCPT8eZSKMM4zk5@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
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



On 8/8/22 01:21, David Gibson wrote:
> On Fri, Aug 05, 2022 at 06:39:43AM -0300, Daniel Henrique Barboza wrote:
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
>> }
>>
>> And the same node for the aarch64 'virt' machine:
>>
>> (qemu) info fdt /chosen
>> chosen {
>>      stdout-path;
>>      rng-seed;
>>      kaslr-seed;
>> }
> 
> So... it's listing the names of the properties, but not the contents?
> That seems kind of odd.
> 
>>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
>> index d23ec85f9d..accde90380 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>>           error_report_err(local_err);
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
> 
> 
> A QMP command that returns human readable text, rather than something
> JSON structured seems... odd.
> 
> Admittedly, *how* you'd JSON structure the results gets a bit tricky.
> Listing nodes or property names would be easy enough, but getting the
> property contents is hairy, since JSON strings are supposed to be
> Unicode, but DT properties can be arbitrary bytestrings.
> 
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index cd487ddd4d..3fb07b537f 100644
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
>> +    g_string_append_printf(buf, "%*s}\n", padding, "");
> 
> So, this lists it in dts format... kind of.  Because you don't include
> the property values, it makes it look like all properties are binary
> (either absent or present-but-empty).  I think that's misleading.  If
> you're only going to list properties, I think you'd be better off
> using different formatting (and maybe a more specific command name as
> well).

As you've already noticed in the next patch, I decided to split between QMP/HMP
introduction and the dts formatting to avoid clogging everything in a single patch.
In the end the whole fdt tree can be printed with all the properties types.

As for using HumanReadableText, I tried to imagine a structured output for
'info fdt'. It would be something like:

- struct Property: an union of the possible types (none, string, uint32 array,
byte array)

- struct Node: an array of properties and subnodes

And then 'info fdt <node>' would return a struct node and  'info fdt <node> <prop>'
would return a struct Property

Adding this stable ABI sounded like too much extra work for a command that would be
used mostly for debug/development purposes. Every other command that outputs
internal guest state (info roms, info rdma, info irq, info numa ...) are happy with
returning HumanReadableFormat and being considered debug only. I decided to do the
same thing.


Thanks,

Daniel



> 
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

