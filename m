Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979194F18A3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:41:21 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbOpU-0000Nf-LG
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:41:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbOiN-0003R6-Pe
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:33:59 -0400
Received: from [2a00:1450:4864:20::12b] (port=41883
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbOiL-0006r1-MD
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:33:59 -0400
Received: by mail-lf1-x12b.google.com with SMTP id p15so18004046lfk.8
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=57Nsds7fnm3hiYexRas+/F9x1SNNj1Nv6VnU/VFO7+M=;
 b=N0yJfyci4UDQvI37a19ifFGF7rDEQOusHSCPtDu6t7UaKT4esPaYiVe17WuWxEJWZH
 z7wIvxvrnZYj9h0RV0DmlV2n9Vj4IAmqPX1ffpazHLZhP6V3TIUs5AAIuvJrF+pC2xHK
 E92uVNKpbjwaqmeAmfz42WgDT2zjcCLDy8BLr1Dp2evoWFBU9ogjOOUsqSdFfcDt59xc
 YU8kLrSoAqfwlhTXvY6b2OoN7VvUQFJYaAuTJPzFvoKzS6OGDpn4bHMEELWQIcNbR5Yh
 djl09wsdVboC4vC6bvs7dnu/QJFwY0jR7YSkVAjZLMB0r/5uJDLPUEzCJhMWHlhU/1Gk
 EjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=57Nsds7fnm3hiYexRas+/F9x1SNNj1Nv6VnU/VFO7+M=;
 b=SsPm6wp8Kuo90fJawF4NbJwsWSlbOxcCw1LJHIDwqi1CmnMQ30F2Oiz2gy//dIsEVw
 XwHpAPWhJZ7ZQthNo2jc1NIFWFA+SMtgl7xYYOoQGxJv2TFIrO0MfTEyBMnwE7jdanjD
 lAu7HoR0f2SuSUnOKbAg2eBcRwzk58QUGNfBzS2qul2VSEn6yWAtOZNIJ9drGLCDG7gZ
 gbnXSEU6f2J4yyF6jkdL2NpDUOaHJca5FgU2/6mE0yKcYRXK3S1o764lQFxqSsBMY7QI
 oqMZ7eqRsNsQUZ0qRBc7VcvnYyYcBwTHGB+Tn5z1gXBerchnlEvd12d3zb4lYxUfdkp6
 JRgw==
X-Gm-Message-State: AOAM531W+uC5psMn+fPraVyXHd0hpAgWYEnwSCSHnMYdK63BjCZngesJ
 3W9n3rPsos0RgzvnI+YrZSqvZg==
X-Google-Smtp-Source: ABdhPJxJ0ND4SKBnY6ASw2wEUpB2zWpHCQAgNXnqw/UBYyXD+96PYt0qglHoRVe6i0ytz0S1+eI58g==
X-Received: by 2002:a05:6512:32c2:b0:44a:70a9:4955 with SMTP id
 f2-20020a05651232c200b0044a70a94955mr18038lfg.171.1649086433004; 
 Mon, 04 Apr 2022 08:33:53 -0700 (PDT)
Received: from [192.168.50.150] ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a194315000000b0044a1e36fda4sm1168148lfa.25.2022.04.04.08.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:33:52 -0700 (PDT)
Message-ID: <893e027b-8622-45cc-a4ae-813115b07184@openvz.org>
Date: Mon, 4 Apr 2022 18:33:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 8/9] qom: add command to print initial properties
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-9-maxim.davydov@openvz.org>
 <6265fc7c-1907-f10a-6984-597637e1187a@mail.ru>
From: Maxim Davydov <maxim.davydov@openvz.org>
In-Reply-To: <6265fc7c-1907-f10a-6984-597637e1187a@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, berrange@redhat.com, xiaoguangrong.eric@gmail.com,
 mst@redhat.com, jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org,
 lizhijian@fujitsu.com, armbru@redhat.com, wangyanan55@huawei.com,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, pbonzini@redhat.com,
 ani@anisinha.ca, den@openvz.org, eblake@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/30/22 18:17, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2022 00:15, Maxim Davydov wrote:
>> The command "query-init-properties" is needed to get values of 
>> properties
>> after initialization (not only default value). It makes sense, for 
>> example,
>> when working with x86_64-cpu.
>> All machine types (and x-remote-object, because its init uses machime
>> type's infrastructure) should be skipped, because only the one 
>> instance can
>> be correctly initialized.
>>
>> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
>> ---
>>   qapi/qom.json      |  69 ++++++++++++++++++++++++++
>>   qom/qom-qmp-cmds.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 190 insertions(+)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index eeb5395ff3..1eedc441eb 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -949,3 +949,72 @@
>>   ##
>>   { 'command': 'object-del', 'data': {'id': 'str'},
>>     'allow-preconfig': true }
>> +
>> +##
>> +# @InitValue:
>> +#
>> +# Not all objects have default values but they have "initial" values.
>> +#
>> +# @name: property name
>> +#
>> +# @value: Current value (default or after initialization. It makes 
>> sence,
>> +#         for example, for x86-cpus)
>> +#
>> +# Since: 7.0
>
> 7.1 (here and below)
>
>> +#
>> +##
>> +{ 'struct': 'InitValue',
>> +  'data': { 'name': 'str',
>> +            '*value': 'any' } }
>> +
>
> [..]
>
>> diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
>> index 2d6f41ecc7..c1bb3f1f8b 100644
>> --- a/qom/qom-qmp-cmds.c
>> +++ b/qom/qom-qmp-cmds.c
>> @@ -27,6 +27,7 @@
>>   #include "qemu/cutils.h"
>>   #include "qom/object_interfaces.h"
>>   #include "qom/qom-qobject.h"
>> +#include "hw/boards.h"
>>     ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
>>   {
>> @@ -235,3 +236,123 @@ void qmp_object_del(const char *id, Error **errp)
>>   {
>>       user_creatable_del(id, errp);
>>   }
>> +
>> +static void query_object_prop(InitValueList **props_list, 
>> ObjectProperty *prop,
>> +                              Object *obj, Error **errp)
>> +{
>> +    InitValue *prop_info = NULL;
>> +
>> +    /* Skip inconsiderable properties */
>> +    if (strcmp(prop->name, "type") == 0 ||
>> +        strcmp(prop->name, "realized") == 0 ||
>> +        strcmp(prop->name, "hotpluggable") == 0 ||
>> +        strcmp(prop->name, "hotplugged") == 0 ||
>> +        strcmp(prop->name, "parent_bus") == 0) {
>> +        return;
>> +    }
>> +
>> +    prop_info = g_malloc0(sizeof(*prop_info));
>> +    prop_info->name = g_strdup(prop->name);
>> +    prop_info->value = NULL;
>> +    if (prop->defval) {
>> +        prop_info->value = qobject_ref(prop->defval);
>> +    } else if (prop->get) {
>> +        /*
>> +         * crash-information in x86-cpu uses errp to return current 
>> state.
>> +         * So, after requesting this property it returns GenericError:
>> +         * "No crash occured"
>> +         */
>> +        if (strcmp(prop->name, "crash-information") != 0) {
>> +            prop_info->value = object_property_get_qobject(obj, 
>> prop->name,
>> + errp);
>> +        }
>> +    }
>
> Hmmm. Should we instead call prop->get() when is is available, and 
> only if not use prep->defval?
default properties more rare and sometimes can give more information (if 
the device developer thought that there should be a default value). And 
I think that if prop->get() isn't available, prop->defval() isn't too.
>
>> +    prop_info->has_value = !!prop_info->value;
>> +
>> +    QAPI_LIST_PREPEND(*props_list, prop_info);
>> +}
>> +
>> +typedef struct QIPData {
>> +    InitPropsList **dev_list;
>> +    Error **errp;
>> +} QIPData;
>> +
>> +static void query_init_properties_tramp(gpointer list_data, gpointer 
>> opaque)
>> +{
>> +    ObjectClass *k = list_data;
>> +    Object *obj;
>> +    ObjectClass *parent;
>> +    GHashTableIter iter;
>> +
>> +    QIPData *data = opaque;
>> +    ClassPropertiesList *class_props_list = NULL;
>> +    InitProps *dev_info;
>> +
>> +    /* Only one machine can be initialized correctly (it's already 
>> happened) */
>> +    if (object_class_dynamic_cast(k, TYPE_MACHINE)) {
>> +        return;
>> +    }
>> +
>> +    const char *klass_name = object_class_get_name(k);
>> +    /*
>> +     * Uses machine type infrastructure with notifiers. It causes 
>> immediate
>> +     * notify and SEGSEGV during remote_object_machine_done
>> +     */
>> +    if (strcmp(klass_name, "x-remote-object") == 0) {
>> +        return;
>> +    }
>> +
>> +    dev_info = g_malloc0(sizeof(*dev_info));
>> +    dev_info->name = g_strdup(klass_name);
>> +
>> +    obj = object_new_with_class(k);
>> +
>> +    /*
>> +     * Part of ObjectPropertyIterator infrastructure, but we need 
>> more precise
>> +     * control of current class to dump appropriate features
>> +     * This part was taken out from loop because first 
>> initialization differ
>> +     * from other reinitializations
>> +     */
>> +    parent = object_get_class(obj);
>
> hmm.. obj = object_new_with_class(k); parent = 
> object_get_class(obj);.. Looks for me like parent should be equal to 
> k. Or object_ API is rather unobvious.
I'll change it)
>
>> +    g_hash_table_iter_init(&iter, obj->properties);
>> +    const char *prop_owner_name = object_get_typename(obj);
>> +    do {
>> +        InitValueList *prop_list = NULL;
>> +        ClassProperties *class_data;
>> +
>> +        gpointer key, val;
>> +        while (g_hash_table_iter_next(&iter, &key, &val)) {
>> +            query_object_prop(&prop_list, (ObjectProperty *)val, obj,
>> +                              data->errp);
>> +        }
>> +        class_data = g_malloc0(sizeof(*class_data));
>> +        class_data->classname = g_strdup(prop_owner_name);
>> +        class_data->classprops = prop_list;
>> +        class_data->has_classprops = !!prop_list;
>> +
>> +        QAPI_LIST_PREPEND(class_props_list, class_data);
>> +
>> +        if (!parent) {
>> +            break;
>> +        }
>> +        g_hash_table_iter_init(&iter, parent->properties);
>> +        prop_owner_name = object_class_get_name(parent);
>> +        parent = object_class_get_parent(parent);
>> +    } while (true);
>> +    dev_info->props = class_props_list;
>> +    object_unref(OBJECT(obj));
>> +
>> +    QAPI_LIST_PREPEND(*(data->dev_list), dev_info);
>> +}
>> +
>> +InitPropsList *qmp_query_init_properties(Error **errp)
>> +{
>> +    GSList *typename_list = object_class_get_list(TYPE_OBJECT, false);
>> +
>> +    InitPropsList *dev_list = NULL;
>> +    QIPData data = { &dev_list, errp };
>> +    g_slist_foreach(typename_list, query_init_properties_tramp, &data);
>> +    g_slist_free(typename_list);
>> +
>> +    return dev_list;
>> +}
>
>
-- 
Best regards,
Maxim Davydov


