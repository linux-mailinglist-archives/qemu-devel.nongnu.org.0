Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B049D4EC80C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 17:19:13 +0200 (CEST)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZa6K-0007PC-7h
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 11:19:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZa50-0006Nh-HY
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:17:50 -0400
Received: from smtp50.i.mail.ru ([94.100.177.110]:37696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZa4w-0007JV-G2
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ZqRr1fXpvj4k883Nld19YcqRvNiBwUWTOXoFCdhrz6U=; 
 t=1648653466;x=1649258866; 
 b=p9fmuaYk5Re5ynQK6+Uy75XukqS1rrKlcv9Jgq9mW8pa1d6MhiNNF+yq+X53mqzgeljfLjeqXNkHn87DqewSLw0gHoNOgF2h9uY2V0xSSVLa2JtIBHjMMT1VY0rHjX4srnoGrTQrFDEDdh3lwhx4abVOVgojHovWOQlbLp57urbCT823BQUu196Otlkdwh4/q7nHzEjhAwyTnL2MZ41p459bKU/cYjflZmXIOoVuCKvNlzEGxpHRUE6JogyMmO7fxej1Y3TIKuFb2SJyZfmiNrwsRfEe3JmrWgKZ1R9KAR9i8YV4Z0pE/+tUW4wzFzdRecufYiAcRt7ScdkhtWe0YA==;
Received: by smtp50.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZa4r-0001q8-Ai; Wed, 30 Mar 2022 18:17:42 +0300
Message-ID: <6265fc7c-1907-f10a-6984-597637e1187a@mail.ru>
Date: Wed, 30 Mar 2022 18:17:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 8/9] qom: add command to print initial properties
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-9-maxim.davydov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220328211539.90170-9-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp50.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B90B03281E564EDC9C11B13756E09467F6A2E858C9CC62BDD1E5172A561D0567CC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063748744D4CD6EC491D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84256D2A2CB9ED46271238ADA6B9F034E6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A6779F98BF527B7A9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC29CCCB165C7854CD3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006370DB91CA68F887047D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F1F775082B55F042FCE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A563CD06A0F5BE1653BC06A7BEFA7C2ADF9D97736D1AF87C02D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D340A4C04F5DECA7EE94F19BCFB7931B2B92D43BE9D7CEBD26C897DEE55E996A0E3967C806A4E809BB21D7E09C32AA3244CF04BE1E5F9D9FDCFE982DD5CD5F30BC239C99C45E8D137E94A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+VlWFVoumipOQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE68294E40DEB43E8545919914A2842BC1D1F123AE0859685FE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.110;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp50.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

29.03.2022 00:15, Maxim Davydov wrote:
> The command "query-init-properties" is needed to get values of properties
> after initialization (not only default value). It makes sense, for example,
> when working with x86_64-cpu.
> All machine types (and x-remote-object, because its init uses machime
> type's infrastructure) should be skipped, because only the one instance can
> be correctly initialized.
> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>   qapi/qom.json      |  69 ++++++++++++++++++++++++++
>   qom/qom-qmp-cmds.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 190 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index eeb5395ff3..1eedc441eb 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -949,3 +949,72 @@
>   ##
>   { 'command': 'object-del', 'data': {'id': 'str'},
>     'allow-preconfig': true }
> +
> +##
> +# @InitValue:
> +#
> +# Not all objects have default values but they have "initial" values.
> +#
> +# @name: property name
> +#
> +# @value: Current value (default or after initialization. It makes sence,
> +#         for example, for x86-cpus)
> +#
> +# Since: 7.0

7.1 (here and below)

> +#
> +##
> +{ 'struct': 'InitValue',
> +  'data': { 'name': 'str',
> +            '*value': 'any' } }
> +

[..]

> diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
> index 2d6f41ecc7..c1bb3f1f8b 100644
> --- a/qom/qom-qmp-cmds.c
> +++ b/qom/qom-qmp-cmds.c
> @@ -27,6 +27,7 @@
>   #include "qemu/cutils.h"
>   #include "qom/object_interfaces.h"
>   #include "qom/qom-qobject.h"
> +#include "hw/boards.h"
>   
>   ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
>   {
> @@ -235,3 +236,123 @@ void qmp_object_del(const char *id, Error **errp)
>   {
>       user_creatable_del(id, errp);
>   }
> +
> +static void query_object_prop(InitValueList **props_list, ObjectProperty *prop,
> +                              Object *obj, Error **errp)
> +{
> +    InitValue *prop_info = NULL;
> +
> +    /* Skip inconsiderable properties */
> +    if (strcmp(prop->name, "type") == 0 ||
> +        strcmp(prop->name, "realized") == 0 ||
> +        strcmp(prop->name, "hotpluggable") == 0 ||
> +        strcmp(prop->name, "hotplugged") == 0 ||
> +        strcmp(prop->name, "parent_bus") == 0) {
> +        return;
> +    }
> +
> +    prop_info = g_malloc0(sizeof(*prop_info));
> +    prop_info->name = g_strdup(prop->name);
> +    prop_info->value = NULL;
> +    if (prop->defval) {
> +        prop_info->value = qobject_ref(prop->defval);
> +    } else if (prop->get) {
> +        /*
> +         * crash-information in x86-cpu uses errp to return current state.
> +         * So, after requesting this property it returns  GenericError:
> +         * "No crash occured"
> +         */
> +        if (strcmp(prop->name, "crash-information") != 0) {
> +            prop_info->value = object_property_get_qobject(obj, prop->name,
> +                                                           errp);
> +        }
> +    }

Hmmm. Should we instead call prop->get() when is is available, and only if not use prep->defval?

> +    prop_info->has_value = !!prop_info->value;
> +
> +    QAPI_LIST_PREPEND(*props_list, prop_info);
> +}
> +
> +typedef struct QIPData {
> +    InitPropsList **dev_list;
> +    Error **errp;
> +} QIPData;
> +
> +static void query_init_properties_tramp(gpointer list_data, gpointer opaque)
> +{
> +    ObjectClass *k = list_data;
> +    Object *obj;
> +    ObjectClass *parent;
> +    GHashTableIter iter;
> +
> +    QIPData *data = opaque;
> +    ClassPropertiesList *class_props_list = NULL;
> +    InitProps *dev_info;
> +
> +    /* Only one machine can be initialized correctly (it's already happened) */
> +    if (object_class_dynamic_cast(k, TYPE_MACHINE)) {
> +        return;
> +    }
> +
> +    const char *klass_name = object_class_get_name(k);
> +    /*
> +     * Uses machine type infrastructure with notifiers. It causes immediate
> +     * notify and SEGSEGV during remote_object_machine_done
> +     */
> +    if (strcmp(klass_name, "x-remote-object") == 0) {
> +        return;
> +    }
> +
> +    dev_info = g_malloc0(sizeof(*dev_info));
> +    dev_info->name = g_strdup(klass_name);
> +
> +    obj = object_new_with_class(k);
> +
> +    /*
> +     * Part of ObjectPropertyIterator infrastructure, but we need more precise
> +     * control of current class to dump appropriate features
> +     * This part was taken out from loop because first initialization differ
> +     * from other reinitializations
> +     */
> +    parent = object_get_class(obj);

hmm.. obj = object_new_with_class(k); parent = object_get_class(obj);.. Looks for me like parent should be equal to k. Or object_ API is rather unobvious.

> +    g_hash_table_iter_init(&iter, obj->properties);
> +    const char *prop_owner_name = object_get_typename(obj);
> +    do {
> +        InitValueList *prop_list = NULL;
> +        ClassProperties *class_data;
> +
> +        gpointer key, val;
> +        while (g_hash_table_iter_next(&iter, &key, &val)) {
> +            query_object_prop(&prop_list, (ObjectProperty *)val, obj,
> +                              data->errp);
> +        }
> +        class_data = g_malloc0(sizeof(*class_data));
> +        class_data->classname = g_strdup(prop_owner_name);
> +        class_data->classprops = prop_list;
> +        class_data->has_classprops = !!prop_list;
> +
> +        QAPI_LIST_PREPEND(class_props_list, class_data);
> +
> +        if (!parent) {
> +            break;
> +        }
> +        g_hash_table_iter_init(&iter, parent->properties);
> +        prop_owner_name = object_class_get_name(parent);
> +        parent = object_class_get_parent(parent);
> +    } while (true);
> +    dev_info->props = class_props_list;
> +    object_unref(OBJECT(obj));
> +
> +    QAPI_LIST_PREPEND(*(data->dev_list), dev_info);
> +}
> +
> +InitPropsList *qmp_query_init_properties(Error **errp)
> +{
> +    GSList *typename_list = object_class_get_list(TYPE_OBJECT, false);
> +
> +    InitPropsList *dev_list = NULL;
> +    QIPData data = { &dev_list, errp };
> +    g_slist_foreach(typename_list, query_init_properties_tramp, &data);
> +    g_slist_free(typename_list);
> +
> +    return dev_list;
> +}


-- 
Best regards,
Vladimir

