Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA14F11AD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:10:13 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIiy-00054A-8z
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:10:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbIh0-0003Aj-V9
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:08:11 -0400
Received: from [2a00:1450:4864:20::134] (port=40913
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbIgy-00053r-Kg
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:08:10 -0400
Received: by mail-lf1-x134.google.com with SMTP id t25so15969582lfg.7
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vqFm+nahNnGO4BMo4KMO0nHJNl+iJbVTBknKquQPptA=;
 b=gcV2lXMagU1SkxGQmF/pBMoVYY5qm9PF/VWR6FrC/IRhqrUyptIVwrIukN9TKrT+ue
 ehVzZWHwpj2kVO+85KLOTpdzfo1S3rBOmKfUI+y66ObZ27w59UZ6Ud/46ij6iArks9uX
 NzFiv3XXCgf7tOWsNQDVgYOYCwb2YSC/hwnSSEZM3Rz6z8yBxcSDCRLhYMB0wHG8kCHe
 hOp02mOFSSvWfiBwoIRCVuXh1J99ire/NFQEDbk9rsomwxIHGVCnaD2uimuq+AJUFicf
 V+gErW+WHgTplL44hY3qu7/8ezfRWaDv8uaMBsnC+bZLWpjBCMUDIkmFGWv9/nbtaZcp
 FiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vqFm+nahNnGO4BMo4KMO0nHJNl+iJbVTBknKquQPptA=;
 b=jOHA76dFWK6MwkwkdY0M7LXCCwm44bW0x5162ucSQr5bcD+0qzaxvr7QaH+EcWvJJU
 lki+wFy7VYP50kl3CVXHMLh2tF2NIdCDEL55swdGHVLxyfwLMUhPJ5W3lpp8pBIx2BlW
 +PEhnbxfvMJlUGa3tqpwMuNcjIgrqeXv/Sz2KEUZ4d554ljLAkQHR9iI19oDOM/fMyRY
 pRB1EvsZgiZwo6V1+oOBzh9u7uI80oL/uN8+W8Fdlb3pSO7O42MaoAS4zfhLvIPp+7W/
 eysPB/LizMXUAYUh/xrTWBaeliXuGZkmi99oA/W+U25HW6nSqaHx6z/c6Kn0eR+qNdV3
 fe1w==
X-Gm-Message-State: AOAM530BM8WQVH6sjfrAn6T5XQLeUHATFlvP8mEygSIbtc3rNs++hzfa
 dNrlI3vUGvvBY4XmzOS/S4wmWA==
X-Google-Smtp-Source: ABdhPJx+AeBLCqLwhCQ6Tx2Rqa3rbmPuxJBXCJJDZX9DbUgN0X3hD0B+uAFsOSmPBBqceRkqZCwdAA==
X-Received: by 2002:a05:6512:3e10:b0:44a:4443:76a9 with SMTP id
 i16-20020a0565123e1000b0044a444376a9mr21610087lfv.630.1649063285503; 
 Mon, 04 Apr 2022 02:08:05 -0700 (PDT)
Received: from [192.168.50.150] ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056512060700b0044a73e7841bsm1070099lfe.215.2022.04.04.02.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 02:08:05 -0700 (PDT)
Message-ID: <fe22e1b0-6b6b-a59d-f2e2-563e3667bc02@openvz.org>
Date: Mon, 4 Apr 2022 12:08:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/9] qmp: Add dump machine type compatible properties
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-2-maxim.davydov@openvz.org>
 <7797f1b7-91dd-6f16-e10d-8d4ad08fda9d@mail.ru>
From: Maxim Davydov <maxim.davydov@openvz.org>
In-Reply-To: <7797f1b7-91dd-6f16-e10d-8d4ad08fda9d@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x134.google.com
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
 chen.zhang@intel.com, armbru@redhat.com, wangyanan55@huawei.com,
 marcandre.lureau@redhat.com, imammedo@redhat.com, lizhijian@fujitsu.com,
 pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/30/22 14:03, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2022 00:15, Maxim Davydov wrote:
>> This patch adds the ability to get all the compat_props of the
>> corresponding supported machines for their comparison.
>>
>> Example:
>> { "execute" : "query-machines", "arguments" : { "is-full" : true } }
>>
>> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
>> ---
>>   hw/core/machine-qmp-cmds.c  | 25 +++++++++++++++-
>>   qapi/machine.json           | 58 +++++++++++++++++++++++++++++++++++--
>>   tests/qtest/fuzz/qos_fuzz.c |  2 +-
>>   3 files changed, 81 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>> index 4f4ab30f8c..8f3206ba8d 100644
>> --- a/hw/core/machine-qmp-cmds.c
>> +++ b/hw/core/machine-qmp-cmds.c
>> @@ -74,7 +74,8 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
>>       return head;
>>   }
>>   -MachineInfoList *qmp_query_machines(Error **errp)
>> +MachineInfoList *qmp_query_machines(bool has_is_full, bool is_full,
>> +                                    Error **errp)
>>   {
>>       GSList *el, *machines = object_class_get_list(TYPE_MACHINE, 
>> false);
>>       MachineInfoList *mach_list = NULL;
>> @@ -107,6 +108,28 @@ MachineInfoList *qmp_query_machines(Error **errp)
>>               info->default_ram_id = g_strdup(mc->default_ram_id);
>>               info->has_default_ram_id = true;
>>           }
>> +        if (has_is_full && is_full && mc->compat_props) {
>
> is_full is guaranteed to be zero when has_is_full is zero. So, it's 
> enough to write:
>
>    if (is_full && mc->compat_props) {
>
>> +            int i;
>> +            info->compat_props = NULL;
>> +            info->has_compat_props = true;
>> +
>> +            for (i = 0; i < mc->compat_props->len; i++) {
>> +                GlobalProperty *mt_prop = 
>> g_ptr_array_index(mc->compat_props,
>> +                                                            i);
>> +                ObjectClass *klass = 
>> object_class_by_name(mt_prop->driver);
>> +                CompatProperty *prop;
>> +
>> +                prop = g_malloc0(sizeof(*prop));
>> +                if (klass && object_class_is_abstract(klass)) {
>> +                    prop->abstract = true;
>> +                }
>> +                prop->driver = g_strdup(mt_prop->driver);
>> +                prop->property = g_strdup(mt_prop->property);
>> +                prop->value = g_strdup(mt_prop->value);
>> +
>> +                QAPI_LIST_PREPEND(info->compat_props, prop);
>> +            }
>> +        }
>>             QAPI_LIST_PREPEND(mach_list, info);
>>       }
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 42fc68403d..16e961477c 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -130,6 +130,28 @@
>>   ##
>>   { 'command': 'query-cpus-fast', 'returns': [ 'CpuInfoFast' ] }
>>   +##
>> +# @CompatProperty:
>> +#
>> +# Machine type compatible property. It's based on GlobalProperty and 
>> created
>> +# for machine type compat properties (see scripts)
>> +#
>> +# @driver: name of the driver that has GlobalProperty
>> +#
>> +# @abstract: Bool value that shows that property is belonged to 
>> abstract class
>> +#
>> +# @property: global property name
>> +#
>> +# @value: global property value
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'CompatProperty',
>> +  'data': { 'driver': 'str',
>> +            'abstract': 'bool',
>> +            'property': 'str',
>> +            'value': 'str' } }
>> +
>>   ##
>>   # @MachineInfo:
>>   #
>> @@ -158,6 +180,9 @@
>>   #
>>   # @default-ram-id: the default ID of initial RAM memory backend 
>> (since 5.2)
>>   #
>> +# @compat-props: List of compatible properties that defines machine 
>> type
>> +#                (since 7.0)
>> +#
>>   # Since: 1.2
>>   ##
>>   { 'struct': 'MachineInfo',
>> @@ -165,18 +190,47 @@
>>               '*is-default': 'bool', 'cpu-max': 'int',
>>               'hotpluggable-cpus': 'bool', 'numa-mem-supported': 'bool',
>>               'deprecated': 'bool', '*default-cpu-type': 'str',
>> -            '*default-ram-id': 'str' } }
>> +            '*default-ram-id': 'str', '*compat-props': 
>> ['CompatProperty'] } }
>>     ##
>>   # @query-machines:
>>   #
>>   # Return a list of supported machines
>>   #
>> +# @is-full: if true return will contain information about machine type
>> +#           compatible properties (since 7.0)
>
> Should be 7.1.
>
> Also, maybe call it "compat-props" to be consistent with output and 
> with documentation?
>
>> +#
>>   # Returns: a list of MachineInfo
>>   #
>>   # Since: 1.2
>> +#
>> +# Example:
>> +#
>> +# -> { "execute" : "query-machines", "arguments" : { "is-full" : 
>> true } }
>> +# <- { "return": [
>> +#          {
>> +#              "hotpluggable-cpus": true,
>> +#              "name": "pc-q35-6.2",
>> +#              "compat-props": [
>> +#                  {
>> +#                      "abstract": false,
>> +#                      "driver": "virtio-mem",
>> +#                      "property": "unplugged-inaccessible",
>> +#                      "value": "off"
>> +#                   }
>> +#               ],
>> +#               "numa-mem-supported": false,
>> +#               "default-cpu-type": "qemu64-x86_64-cpu",
>> +#               "cpu-max": 288,
>> +#               "deprecated": false,
>> +#               "default-ram-id": "pc.ram"
>> +#           },
>> +#           ...
>> +#    }
>>   ##
>> -{ 'command': 'query-machines', 'returns': ['MachineInfo'] }
>> +{ 'command': 'query-machines',
>> +  'data': { '*is-full': 'bool' },
>> +  'returns': ['MachineInfo'] }
>>     ##
>>   # @CurrentMachineParams:
>> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
>> index 7a244c951e..3f9c1ede6e 100644
>> --- a/tests/qtest/fuzz/qos_fuzz.c
>> +++ b/tests/qtest/fuzz/qos_fuzz.c
>> @@ -47,7 +47,7 @@ static void qos_set_machines_devices_available(void)
>>       MachineInfoList *mach_info;
>>       ObjectTypeInfoList *type_info;
>>   -    mach_info = qmp_query_machines(&error_abort);
>> +    mach_info = qmp_query_machines(false, false, &error_abort);
>>       machines_apply_to_node(mach_info);
>>       qapi_free_MachineInfoList(mach_info);
>
> weak:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>
Thank you for the review. Yes, the name "compat-props" seems more 
appropriate than "is-full". It will be changed in the next version

-- 
Best regards,
Maxim Davydov


