Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE159A71D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 22:49:18 +0200 (CEST)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP8vc-0000d3-1t
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 16:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oP8rZ-0007DL-4p; Fri, 19 Aug 2022 16:45:05 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:35350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oP8rX-0000az-8k; Fri, 19 Aug 2022 16:45:04 -0400
Received: by mail-vk1-xa32.google.com with SMTP id i67so2804809vkb.2;
 Fri, 19 Aug 2022 13:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=J5FZFMyY5hsnaHfZ2yCROf/29hrcuK+MckZgnNRAOMc=;
 b=EMPK/LEPXiS0c5J/TRpc/cAtNph4riLAuevFPHj9vqU7mwmRBRLkwgGl617w6Ul6+0
 dIRVhRh2yDdZt4Y0KkO6k+sCCUAAsFSr/4jo6b8Sw6vGfbzMrqEqnGD959bgyQV7uxmm
 72ZSpAJEdsFZO0PiW7O5zH5oyXw+W7muRwgKj3lN5t6LzY7c0WwNpXhyZ3/sxVmENohJ
 hP2U9NBPgqAGIjVugaSoBb5GBH8aGtqqrivjJgC1vXQ1JRpYS3SaZ9XEy1hGsMqMZhMY
 OglpTwmlDp3ek9jLWpxQRTkZqXmS2V9WPG6HwcWuAZJxq7EgEoSG8cXYKsHIYe6mz7pv
 e/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=J5FZFMyY5hsnaHfZ2yCROf/29hrcuK+MckZgnNRAOMc=;
 b=sYvhUlyY0xUykJgNq9uTHhxu6YzP5/k65ytAnfqizkRCzN98+cBz4hsIQ4ThKm4qDH
 iNp+p2Hd1zoJA/X363mPHoXU/CkUPILqDOUVzqx6mNxyiDp69G3gyvuvm9Ak+qd+uSzZ
 HhFs7rt3Yr4PMsLWl+y465cSby+JvP1hqE19wwJVVVAJY/FpT3rLbfA/ut1Xxh1fSSTQ
 AQt0JyKAKAHEaZNRobWFhW+CleQI34zQPYNMXnIUklO+j99YucVgGwwkNM3LRzcTTMzn
 tQj5DtZhrCkzLs49u1U1hhzrmJp5/ShcIr4XebU8TReLApe7OxsglpqZljF/NrORyWBh
 MkQw==
X-Gm-Message-State: ACgBeo0L4cIvug+v20AV1K7uINvephvsvVug43COY67STjAv1mvY4+5u
 ykmT/oPC2bUJEGUHngC3IQs=
X-Google-Smtp-Source: AA6agR4dkcVc6totp58p+IbjZqNE7dssnH5jzB3VxH+OHkWYZPskX8GyVjQToPxk+jGF810IiyR33g==
X-Received: by 2002:a05:6122:635:b0:389:9ad6:f974 with SMTP id
 g21-20020a056122063500b003899ad6f974mr1185283vkp.4.1660941901786; 
 Fri, 19 Aug 2022 13:45:01 -0700 (PDT)
Received: from [192.168.10.102] ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 n72-20020a1f274b000000b0037907a59f76sm3155984vkn.29.2022.08.19.13.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 13:45:01 -0700 (PDT)
Message-ID: <f34748b1-f7e2-6363-fbf9-ad72c902e1aa@gmail.com>
Date: Fri, 19 Aug 2022 17:44:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v3 20/20] hmp, device_tree.c: add 'info fdt
 <property>' support
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
 <20220816173428.157304-21-danielhb413@gmail.com> <Yv2XOd3kDB+fgHDi@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yv2XOd3kDB+fgHDi@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
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



On 8/17/22 22:34, David Gibson wrote:
> On Tue, Aug 16, 2022 at 02:34:28PM -0300, Daniel Henrique Barboza wrote:
>> 'info fdt' is only able to print full nodes so far. It would be good to
>> be able to also print single properties, since ometimes we just want
>> to verify a single value from the FDT.
>>
>> libfdt does not have support to find a property given its full path, but
>> it does have a way to return a fdt_property given a prop name and its
>> subnode.
>>
>> Add a new optional 'propname' parameter to x-query-fdt to specify the
>> property of a given node. If it's present, we'll proceed to find the
>> node as usual but, instead of printing the node, we'll attempt to find
>> the property and print it standalone.
>>
>> After this change, if an user wants to print just the value of 'cpu' inside
>> /cpu/cpu-map(...) from an ARM FDT, we can do it:
>>
>> (qemu) info fdt /cpus/cpu-map/socket0/cluster0/core0 cpu
>> /cpus/cpu-map/socket0/cluster0/core0/cpu = <0x8001>
>>
>> Or the 'ibm,my-dma-window' from the v-scsi device inside the pSeries
>> FDT:
>>
>> (qemu) info fdt /vdevice/v-scsi@71000003 ibm,my-dma-window
>> /vdevice/v-scsi@71000003/ibm,my-dma-window = <0x71000003 0x0 0x0 0x0 0x10000000>
> 
> nit: dts property definitions also include a terminating ';'
> 	prop = "foobar";


I forgot to update the commit msg. The code is already putting
the semi-colon at the end:

(qemu) info fdt /vdevice/v-scsi@71000003 ibm,my-dma-window
/vdevice/v-scsi@71000003/ibm,my-dma-window = <0x71000003 0x0 0x0 0x0 0x10000000>;
(qemu)


I'll update it in v4.

Thanks,

Daniel

> 
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hmp-commands-info.hx         |  9 +++++----
>>   include/sysemu/device_tree.h |  2 ++
>>   monitor/hmp-cmds.c           |  5 ++++-
>>   monitor/qmp-cmds.c           |  8 +++++---
>>   qapi/machine.json            |  4 +++-
>>   softmmu/device_tree.c        | 29 ++++++++++++++++++++++++-----
>>   6 files changed, 43 insertions(+), 14 deletions(-)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index 743b48865d..17d6ee4d30 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -924,13 +924,14 @@ ERST
>>   
>>       {
>>           .name       = "fdt",
>> -        .args_type  = "nodepath:s",
>> -        .params     = "nodepath",
>> -        .help       = "show firmware device tree node given its path",
>> +        .args_type  = "nodepath:s,propname:s?",
>> +        .params     = "nodepath [propname]",
>> +        .help       = "show firmware device tree node or property given its path",
>>           .cmd        = hmp_info_fdt,
>>       },
>>   
>>   SRST
>>     ``info fdt``
>> -    Show a firmware device tree node given its path. Requires libfdt.
>> +    Show a firmware device tree node or property given its path.
>> +    Requires libfdt.
>>   ERST
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index 057d13e397..551a02dee2 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -140,6 +140,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>>   void qemu_fdt_dumpdtb(void *fdt, int size);
>>   void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>>   HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
>> +                                          bool has_propname,
>> +                                          const char *propname,
>>                                             Error **errp);
>>   
>>   /**
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index accde90380..df8493adc5 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -2488,8 +2488,11 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>>   void hmp_info_fdt(Monitor *mon, const QDict *qdict)
>>   {
>>       const char *nodepath = qdict_get_str(qdict, "nodepath");
>> +    const char *propname = qdict_get_try_str(qdict, "propname");
>>       Error *err = NULL;
>> -    g_autoptr(HumanReadableText) info = qmp_x_query_fdt(nodepath, &err);
>> +    g_autoptr(HumanReadableText) info = NULL;
>> +
>> +    info = qmp_x_query_fdt(nodepath, propname != NULL, propname, &err);
>>   
>>       if (hmp_handle_error(mon, err)) {
>>           return;
>> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>> index db2c6aa7da..ca2a96cdf7 100644
>> --- a/monitor/qmp-cmds.c
>> +++ b/monitor/qmp-cmds.c
>> @@ -604,9 +604,10 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>>       return qemu_fdt_qmp_dumpdtb(filename, errp);
>>   }
>>   
>> -HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
>> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
>> +                                   const char *propname, Error **errp)
>>   {
>> -    return qemu_fdt_qmp_query_fdt(nodepath, errp);
>> +    return qemu_fdt_qmp_query_fdt(nodepath, has_propname, propname, errp);
>>   }
>>   #else
>>   void qmp_dumpdtb(const char *filename, Error **errp)
>> @@ -614,7 +615,8 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>>       error_setg(errp, "dumpdtb requires libfdt");
>>   }
>>   
>> -HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
>> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, bool has_propname,
>> +                                   const char *propname, Error **errp)
>>   {
>>       error_setg(errp, "this command requires libfdt");
>>   
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 96cff541ca..c15ce60f46 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1688,6 +1688,7 @@
>>   # Query for FDT element (node or property). Requires 'libfdt'.
>>   #
>>   # @nodepath: the path of the FDT node to be retrieved
>> +# @propname: name of the property inside the node
>>   #
>>   # Features:
>>   # @unstable: This command is meant for debugging.
>> @@ -1697,6 +1698,7 @@
>>   # Since: 7.2
>>   ##
>>   { 'command': 'x-query-fdt',
>> -  'data': { 'nodepath': 'str' },
>> +  'data': { 'nodepath': 'str',
>> +            '*propname': 'str' },
>>     'returns': 'HumanReadableText',
>>     'features': [ 'unstable' ]  }
>> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
>> index 9e681739bd..523c9b8d4d 100644
>> --- a/softmmu/device_tree.c
>> +++ b/softmmu/device_tree.c
>> @@ -823,23 +823,42 @@ static void fdt_format_node(GString *buf, int node, int depth,
>>       g_string_append_printf(buf, "%*s}\n", padding, "");
>>   }
>>   
>> -HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
>> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
>> +                                          bool has_propname,
>> +                                          const char *propname,
>> +                                          Error **errp)
>>   {
>>       g_autoptr(GString) buf = g_string_new("");
>> -    int node;
>> +    const struct fdt_property *prop = NULL;
>> +    void *fdt = current_machine->fdt;
>> +    int node, prop_size;
>>   
>> -    if (!current_machine->fdt) {
>> +    if (!fdt) {
>>           error_setg(errp, "Unable to find the machine FDT");
>>           return NULL;
>>       }
>>   
>> -    node = fdt_path_offset(current_machine->fdt, nodepath);
>> +    node = fdt_path_offset(fdt, nodepath);
>>       if (node < 0) {
>>           error_setg(errp, "node '%s' not found in FDT", nodepath);
>>           return NULL;
>>       }
>>   
>> -    fdt_format_node(buf, node, 0, nodepath);
>> +    if (!has_propname) {
>> +        fdt_format_node(buf, node, 0, nodepath);
>> +    } else {
>> +        g_autofree char *proppath = g_strdup_printf("%s/%s", nodepath,
>> +                                                    propname);
>> +
>> +        prop = fdt_get_property(fdt, node, propname, &prop_size);
>> +        if (!prop) {
>> +            error_setg(errp, "property '%s' not found in node '%s' in FDT",
>> +                       propname, nodepath);
>> +            return NULL;
>> +        }
>> +
>> +        fdt_format_property(buf, proppath, prop->data, prop_size, 0);
>> +    }
>>   
>>       return human_readable_text_from_str(buf);
>>   }
> 

