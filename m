Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D031A5A600F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 12:02:37 +0200 (CEST)
Received: from localhost ([::1]:52760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSy4q-0000qW-2s
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 06:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oSy1g-0006Y1-TI; Tue, 30 Aug 2022 05:59:20 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:41478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oSy1e-00009O-Nr; Tue, 30 Aug 2022 05:59:20 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 r1-20020a056830418100b0063938f634feso7696036otu.8; 
 Tue, 30 Aug 2022 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=YSGqRLZXFVhmeNcWuyhPZfgDjJZXfHN+mXvoOr8lFRE=;
 b=bn1WpEJR3lJy27MF3vt96GJl/t5p1q+UkaYgL9eE6rQlQhNFqcCEzEEvv2ItP1Rw1y
 wF/bgR1yEAEcXSIGWiJrU7eWL2UpKjsZM9oKV45tSNAbA3fdsvnBXoyDaCR0upz0QDWa
 X076yviczArlvCLuaUkHEczpxgWlMKdIKt2fNKAmyWIEHEwecxYe7sAubf29NWmWnRPu
 7x81pt6zOs8TGNm1jHa5MUcupZ4Lv2BXtGN/r8WZezESofuxPBr5QXLTisZAJFuOjNPt
 +NswW9s1zaGq9NzeiHrI3gT4KYhsqdgzNBwPN+S4dnLBbuGcE1WK1ZrqKVCU78+A/4gu
 3FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YSGqRLZXFVhmeNcWuyhPZfgDjJZXfHN+mXvoOr8lFRE=;
 b=GVFN/PvA2N5rRX4tt0DX65BvhObzPLQZ+IKVAXJczVUdc4l4oKs3RVZaozkEjhMWmH
 vMWKFKPLFRXMnF/n83swVefc00X8JJA4GNYlNcdFCJL75d+IK6VxIjtF2YF9+kqsVe9L
 HdJwYnyA8z7GpSHkXPgNg9dtGjxA44U7iUe8o+cKp0SFbWUMv7FYLxWtsQc1toX40wjD
 u1cqUYgdGoa2suqpzA+1WWNU4Avk2TBJ85KXRyyK7EUVumVoCjRf2BoCwAl2+fP61c35
 TDqVqKehyWQ40M5G2AJQiw63Lum8R6ncQDgwoLFx6zOtZoukfcgcqFl6uzhJ17mA3QJz
 gy4Q==
X-Gm-Message-State: ACgBeo1eWJGupq/Ye9R9sj3s1bwz23aixe0VSUf2GGuiG2VM7+evMPge
 obqEYcjEfgn55TJnXhvDFCc=
X-Google-Smtp-Source: AA6agR68sF20djnSqx2z0BoOr05Yr0eN+A+S4ISogUeDdJYojwejD1gHeU+5R4wFH2Eq8SSeCIt+yQ==
X-Received: by 2002:a9d:72d0:0:b0:638:e9cf:3e75 with SMTP id
 d16-20020a9d72d0000000b00638e9cf3e75mr7938008otk.289.1661853555340; 
 Tue, 30 Aug 2022 02:59:15 -0700 (PDT)
Received: from [192.168.10.102] ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a4ae389000000b0044b47bb023fsm6403377oov.37.2022.08.30.02.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 02:59:14 -0700 (PDT)
Message-ID: <b1bbd9a0-a749-a61a-49be-e2756ded913e@gmail.com>
Date: Tue, 30 Aug 2022 06:59:10 -0300
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
 <45bd4519-1529-c147-cd99-c68e1045d2f2@gmail.com> <Yw1s6A3zCa8hjFAl@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yw1s6A3zCa8hjFAl@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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



On 8/29/22 22:50, David Gibson wrote:
> On Mon, Aug 29, 2022 at 07:00:55PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 8/29/22 00:34, David Gibson wrote:
>>> On Fri, Aug 26, 2022 at 11:11:44AM -0300, Daniel Henrique Barboza wrote:
>>>> Reading the FDT requires that the user saves the fdt_blob and then use
>>>> 'dtc' to read the contents. Saving the file and using 'dtc' is a strong
>>>> use case when we need to compare two FDTs, but it's a lot of steps if
>>>> you want to do quick check on a certain node or property.
>>>>
>>>> 'info fdt' retrieves FDT nodes (and properties, later on) and print it
>>>> to the user. This can be used to check the FDT on running machines
>>>> without having to save the blob and use 'dtc'.
>>>>
>>>> The implementation is based on the premise that the machine thas a FDT
>>>> created using libfdt and pointed by 'machine->fdt'. As long as this
>>>> pre-requisite is met the machine should be able to support it.
>>>>
>>>> For now we're going to add the required QMP/HMP boilerplate and the
>>>> capability of printing the name of the properties of a given node. Next
>>>> patches will extend 'info fdt' to be able to print nodes recursively,
>>>> and then individual properties.
>>>>
>>>> This command will always be executed in-band (i.e. holding BQL),
>>>> avoiding potential race conditions with machines that might change the
>>>> FDT during runtime (e.g. PowerPC 'pseries' machine).
>>>>
>>>> 'info fdt' is not something that we expect to be used aside from debugging,
>>>> so we're implementing it in QMP as 'x-query-fdt'.
>>>>
>>>> This is an example of 'info fdt' fetching the '/chosen' node of the
>>>> pSeries machine:
>>>>
>>>> (qemu) info fdt /chosen
>>>> chosen {
>>>>       ibm,architecture-vec-5;
>>>>       rng-seed;
>>>>       ibm,arch-vec-5-platform-support;
>>>>       linux,pci-probe-only;
>>>>       stdout-path;
>>>>       linux,stdout-path;
>>>>       qemu,graphic-depth;
>>>>       qemu,graphic-height;
>>>>       qemu,graphic-width;
>>>> };
>>>>
>>>> And the same node for the aarch64 'virt' machine:
>>>>
>>>> (qemu) info fdt /chosen
>>>> chosen {
>>>>       stdout-path;
>>>>       rng-seed;
>>>>       kaslr-seed;
>>>> };
>>>
>>> So, I'm reasonably convinced allowing dumping the whole dtb from
>>> qmp/hmp is useful.  I'm less convined that info fdt is worth the
>>> additional complexity it incurs.  Note that as well as being able to
>>> decompile a whole dtb using dtc, you can also extract and list
>>> specific properties from a dtb blob using the 'fdtget' tool which is
>>> part of the dtc tree.
>>
>> What's your opinion on patch 21/21, where 'dumpdtb' can write a formatted
>> FDT in a file with an extra option? That was possible because of the
>> format helpers introduced for 'info fdt'. The idea is that since we're
>> able to format a FDT in DTS format, we can also write the FDT in text
>> format without relying on DTC to decode it.
> 
> Since it's mostly the same code, I think it's reasonable to throw in
> if the info fdt stuff is there, but I don't think it's worth including
> without that.  As a whole, I remain dubious that (info fdt + dumpdts)
> is worth the complexity cost.
> 
> People with more practical experience debugging the embedded ARM
> platforms might have a different opinion if they thing info fdt would
> be really useful though.

Fair enough. Let's wait to see if they have an option on that. Otherwise
I'll prune 'info fdt' from the next version and roll out just with
dumpdtb.


Thanks,

Daniel

> 
>> If we think that this 'dumpdtb' capability is worth having, I can respin
>> the patches without 'info fdt' but adding these helpers to enable this
>> 'dumpdtb' support. If not, then we can just remove patches 15-21 and
>> be done with it.
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>>
>>>>
>>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>    hmp-commands-info.hx         | 13 ++++++++++
>>>>    include/monitor/hmp.h        |  1 +
>>>>    include/sysemu/device_tree.h |  4 +++
>>>>    monitor/hmp-cmds.c           | 13 ++++++++++
>>>>    monitor/qmp-cmds.c           | 12 +++++++++
>>>>    qapi/machine.json            | 19 +++++++++++++++
>>>>    softmmu/device_tree.c        | 47 ++++++++++++++++++++++++++++++++++++
>>>>    7 files changed, 109 insertions(+)
>>>>
>>>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>>>> index 188d9ece3b..743b48865d 100644
>>>> --- a/hmp-commands-info.hx
>>>> +++ b/hmp-commands-info.hx
>>>> @@ -921,3 +921,16 @@ SRST
>>>>      ``stats``
>>>>        Show runtime-collected statistics
>>>>    ERST
>>>> +
>>>> +    {
>>>> +        .name       = "fdt",
>>>> +        .args_type  = "nodepath:s",
>>>> +        .params     = "nodepath",
>>>> +        .help       = "show firmware device tree node given its path",
>>>> +        .cmd        = hmp_info_fdt,
>>>> +    },
>>>> +
>>>> +SRST
>>>> +  ``info fdt``
>>>> +    Show a firmware device tree node given its path. Requires libfdt.
>>>> +ERST
>>>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>>>> index d7f324da59..c0883dd1e3 100644
>>>> --- a/include/monitor/hmp.h
>>>> +++ b/include/monitor/hmp.h
>>>> @@ -135,6 +135,7 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>>>    void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>>>    void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>>>    void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>>>> +void hmp_info_fdt(Monitor *mon, const QDict *qdict);
>>>>    void hmp_human_readable_text_helper(Monitor *mon,
>>>>                                        HumanReadableText *(*qmp_handler)(Error **));
>>>>    void hmp_info_stats(Monitor *mon, const QDict *qdict);
>>>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>>>> index bf7684e4ed..057d13e397 100644
>>>> --- a/include/sysemu/device_tree.h
>>>> +++ b/include/sysemu/device_tree.h
>>>> @@ -14,6 +14,8 @@
>>>>    #ifndef DEVICE_TREE_H
>>>>    #define DEVICE_TREE_H
>>>> +#include "qapi/qapi-types-common.h"
>>>> +
>>>>    void *create_device_tree(int *sizep);
>>>>    void *load_device_tree(const char *filename_path, int *sizep);
>>>>    #ifdef CONFIG_LINUX
>>>> @@ -137,6 +139,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>>>>    void qemu_fdt_dumpdtb(void *fdt, int size);
>>>>    void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>>>> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
>>>> +                                          Error **errp);
>>>>    /**
>>>>     * qemu_fdt_setprop_sized_cells_from_array:
>>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>>> index 1c7bfd3b9d..93a4103afa 100644
>>>> --- a/monitor/hmp-cmds.c
>>>> +++ b/monitor/hmp-cmds.c
>>>> @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>>>>            hmp_handle_error(mon, local_err);
>>>>        }
>>>>    }
>>>> +
>>>> +void hmp_info_fdt(Monitor *mon, const QDict *qdict)
>>>> +{
>>>> +    const char *nodepath = qdict_get_str(qdict, "nodepath");
>>>> +    Error *err = NULL;
>>>> +    g_autoptr(HumanReadableText) info = qmp_x_query_fdt(nodepath, &err);
>>>> +
>>>> +    if (hmp_handle_error(mon, err)) {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    monitor_printf(mon, "%s", info->human_readable_text);
>>>> +}
>>>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>>>> index 8415aca08c..db2c6aa7da 100644
>>>> --- a/monitor/qmp-cmds.c
>>>> +++ b/monitor/qmp-cmds.c
>>>> @@ -603,9 +603,21 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>>>>    {
>>>>        return qemu_fdt_qmp_dumpdtb(filename, errp);
>>>>    }
>>>> +
>>>> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
>>>> +{
>>>> +    return qemu_fdt_qmp_query_fdt(nodepath, errp);
>>>> +}
>>>>    #else
>>>>    void qmp_dumpdtb(const char *filename, Error **errp)
>>>>    {
>>>>        error_setg(errp, "dumpdtb requires libfdt");
>>>>    }
>>>> +
>>>> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
>>>> +{
>>>> +    error_setg(errp, "this command requires libfdt");
>>>> +
>>>> +    return NULL;
>>>> +}
>>>>    #endif
>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>> index aeb013f3dd..96cff541ca 100644
>>>> --- a/qapi/machine.json
>>>> +++ b/qapi/machine.json
>>>> @@ -1681,3 +1681,22 @@
>>>>    ##
>>>>    { 'command': 'dumpdtb',
>>>>      'data': { 'filename': 'str' } }
>>>> +
>>>> +##
>>>> +# @x-query-fdt:
>>>> +#
>>>> +# Query for FDT element (node or property). Requires 'libfdt'.
>>>> +#
>>>> +# @nodepath: the path of the FDT node to be retrieved
>>>> +#
>>>> +# Features:
>>>> +# @unstable: This command is meant for debugging.
>>>> +#
>>>> +# Returns: FDT node
>>>> +#
>>>> +# Since: 7.2
>>>> +##
>>>> +{ 'command': 'x-query-fdt',
>>>> +  'data': { 'nodepath': 'str' },
>>>> +  'returns': 'HumanReadableText',
>>>> +  'features': [ 'unstable' ]  }
>>>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>>>> index cd487ddd4d..6b15f6ace2 100644
>>>> --- a/softmmu/device_tree.c
>>>> +++ b/softmmu/device_tree.c
>>>> @@ -18,6 +18,7 @@
>>>>    #endif
>>>>    #include "qapi/error.h"
>>>> +#include "qapi/type-helpers.h"
>>>>    #include "qemu/error-report.h"
>>>>    #include "qemu/option.h"
>>>>    #include "qemu/bswap.h"
>>>> @@ -661,3 +662,49 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
>>>>        error_setg(errp, "Error when saving machine FDT to file %s", filename);
>>>>    }
>>>> +
>>>> +static void fdt_format_node(GString *buf, int node, int depth)
>>>> +{
>>>> +    const struct fdt_property *prop = NULL;
>>>> +    const char *propname = NULL;
>>>> +    void *fdt = current_machine->fdt;
>>>> +    int padding = depth * 4;
>>>> +    int property = 0;
>>>> +    int prop_size;
>>>> +
>>>> +    g_string_append_printf(buf, "%*s%s {\n", padding, "",
>>>> +                           fdt_get_name(fdt, node, NULL));
>>>> +
>>>> +    padding += 4;
>>>> +
>>>> +    fdt_for_each_property_offset(property, fdt, node) {
>>>> +        prop = fdt_get_property_by_offset(fdt, property, &prop_size);
>>>> +        propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
>>>> +
>>>> +        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
>>>> +    }
>>>> +
>>>> +    padding -= 4;
>>>> +    g_string_append_printf(buf, "%*s};\n", padding, "");
>>>> +}
>>>> +
>>>> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
>>>> +{
>>>> +    g_autoptr(GString) buf = g_string_new("");
>>>> +    int node;
>>>> +
>>>> +    if (!current_machine->fdt) {
>>>> +        error_setg(errp, "Unable to find the machine FDT");
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    node = fdt_path_offset(current_machine->fdt, nodepath);
>>>> +    if (node < 0) {
>>>> +        error_setg(errp, "node '%s' not found in FDT", nodepath);
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    fdt_format_node(buf, node, 0);
>>>> +
>>>> +    return human_readable_text_from_str(buf);
>>>> +}
>>>
>>
> 

