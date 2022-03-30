Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D44EBF8F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 13:06:53 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZWA7-0002q6-Rs
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 07:06:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZW6y-0001Jg-GX
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:03:37 -0400
Received: from smtp39.i.mail.ru ([94.100.177.99]:39314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZW6p-0003BC-KK
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=NnkW7j7UDV0AGgFdI/Z6pg6f4OrX0EWZHi3xRFSdO68=; 
 t=1648638207;x=1649243607; 
 b=jjHBNaw7krsTjaaYU4EaGpRUiA0F2iFZZh7dbuobAZWzCjHE8/5r/r3SQUtWq3U36RjRbs2sQXQM3NWpZ3F/KcilDgu54Ca3xVbEfwgl+QPRITfKw0FrNmX+Go9ppmwVr8e/N3ov5D1jD7teUsHT+iuWrP81Ze3WcqPIoYyaiiEp65cZQ/mw06nh/gz1K9tpLXhftwHus6pnNdR6bNHRcbZGk79T+fbvy1LbBvl0ej8zHy90A84Wf0qFCFwdqJPW10LkjKxZLVYFpLCqqtP44NpxLtyoqKZR8kMgvxi8yjnN3TFaEah7MHsjN3IWHARyO2pfdKtuCkOkwEgV85VDog==;
Received: by smtp39.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZW6Q-0003rj-F1; Wed, 30 Mar 2022 14:03:03 +0300
Message-ID: <7797f1b7-91dd-6f16-e10d-8d4ad08fda9d@mail.ru>
Date: Wed, 30 Mar 2022 14:03:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/9] qmp: Add dump machine type compatible properties
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-2-maxim.davydov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220328211539.90170-2-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp39.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B9B816DFE0D8C2D8060CE94830C429F0B12323F0B855BC53928483CDA5FC7E7E3C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72C932D6B54DFB189EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637593B4F2A76947A308638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82D4D9CC3BF1F6C4D16B54178118D6B406F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7934314F73869482B9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B974A882099E279BDA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC29CCCB165C7854CD3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006370DB91CA68F887047D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F1FC58B5115ECA9A242539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5B946947B24DA1798F5122CE00FC2394E18F0ABB56D134DB8D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D348F1757F8DFBC5C33C78E2E6F7C706D5006351700CEC0FEC3EBB215BA50B10B72823EF3D1C8AFE9C81D7E09C32AA3244C0C268FA4AC04E5B54521E8942AED913E33C9DC155518937F4A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+X1ZAKSj7lzzQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE35A9CCA2793203971F620DAE8CE39A64DB946844D3C7440BE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.99;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp39.i.mail.ru
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
> This patch adds the ability to get all the compat_props of the
> corresponding supported machines for their comparison.
> 
> Example:
> { "execute" : "query-machines", "arguments" : { "is-full" : true } }
> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>   hw/core/machine-qmp-cmds.c  | 25 +++++++++++++++-
>   qapi/machine.json           | 58 +++++++++++++++++++++++++++++++++++--
>   tests/qtest/fuzz/qos_fuzz.c |  2 +-
>   3 files changed, 81 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 4f4ab30f8c..8f3206ba8d 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -74,7 +74,8 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
>       return head;
>   }
>   
> -MachineInfoList *qmp_query_machines(Error **errp)
> +MachineInfoList *qmp_query_machines(bool has_is_full, bool is_full,
> +                                    Error **errp)
>   {
>       GSList *el, *machines = object_class_get_list(TYPE_MACHINE, false);
>       MachineInfoList *mach_list = NULL;
> @@ -107,6 +108,28 @@ MachineInfoList *qmp_query_machines(Error **errp)
>               info->default_ram_id = g_strdup(mc->default_ram_id);
>               info->has_default_ram_id = true;
>           }
> +        if (has_is_full && is_full && mc->compat_props) {

is_full is guaranteed to be zero when has_is_full is zero. So, it's enough to write:

    if (is_full && mc->compat_props) {

> +            int i;
> +            info->compat_props = NULL;
> +            info->has_compat_props = true;
> +
> +            for (i = 0; i < mc->compat_props->len; i++) {
> +                GlobalProperty *mt_prop = g_ptr_array_index(mc->compat_props,
> +                                                            i);
> +                ObjectClass *klass = object_class_by_name(mt_prop->driver);
> +                CompatProperty *prop;
> +
> +                prop = g_malloc0(sizeof(*prop));
> +                if (klass && object_class_is_abstract(klass)) {
> +                    prop->abstract = true;
> +                }
> +                prop->driver = g_strdup(mt_prop->driver);
> +                prop->property = g_strdup(mt_prop->property);
> +                prop->value = g_strdup(mt_prop->value);
> +
> +                QAPI_LIST_PREPEND(info->compat_props, prop);
> +            }
> +        }
>   
>           QAPI_LIST_PREPEND(mach_list, info);
>       }
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 42fc68403d..16e961477c 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -130,6 +130,28 @@
>   ##
>   { 'command': 'query-cpus-fast', 'returns': [ 'CpuInfoFast' ] }
>   
> +##
> +# @CompatProperty:
> +#
> +# Machine type compatible property. It's based on GlobalProperty and created
> +# for machine type compat properties (see scripts)
> +#
> +# @driver: name of the driver that has GlobalProperty
> +#
> +# @abstract: Bool value that shows that property is belonged to abstract class
> +#
> +# @property: global property name
> +#
> +# @value: global property value
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'CompatProperty',
> +  'data': { 'driver': 'str',
> +            'abstract': 'bool',
> +            'property': 'str',
> +            'value': 'str' } }
> +
>   ##
>   # @MachineInfo:
>   #
> @@ -158,6 +180,9 @@
>   #
>   # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
>   #
> +# @compat-props: List of compatible properties that defines machine type
> +#                (since 7.0)
> +#
>   # Since: 1.2
>   ##
>   { 'struct': 'MachineInfo',
> @@ -165,18 +190,47 @@
>               '*is-default': 'bool', 'cpu-max': 'int',
>               'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
>               'deprecated': 'bool', '*default-cpu-type': 'str',
> -            '*default-ram-id': 'str' } }
> +            '*default-ram-id': 'str', '*compat-props': ['CompatProperty'] } }
>   
>   ##
>   # @query-machines:
>   #
>   # Return a list of supported machines
>   #
> +# @is-full: if true return will contain information about machine type
> +#           compatible properties (since 7.0)

Should be 7.1.

Also, maybe call it "compat-props" to be consistent with output and with documentation?

> +#
>   # Returns: a list of MachineInfo
>   #
>   # Since: 1.2
> +#
> +# Example:
> +#
> +# -> { "execute" : "query-machines", "arguments" : { "is-full" : true } }
> +# <- { "return": [
> +#          {
> +#              "hotpluggable-cpus": true,
> +#              "name": "pc-q35-6.2",
> +#              "compat-props": [
> +#                  {
> +#                      "abstract": false,
> +#                      "driver": "virtio-mem",
> +#                      "property": "unplugged-inaccessible",
> +#                      "value": "off"
> +#                   }
> +#               ],
> +#               "numa-mem-supported": false,
> +#               "default-cpu-type": "qemu64-x86_64-cpu",
> +#               "cpu-max": 288,
> +#               "deprecated": false,
> +#               "default-ram-id": "pc.ram"
> +#           },
> +#           ...
> +#    }
>   ##
> -{ 'command': 'query-machines', 'returns': ['MachineInfo'] }
> +{ 'command': 'query-machines',
> +  'data': { '*is-full': 'bool' },
> +  'returns': ['MachineInfo'] }
>   
>   ##
>   # @CurrentMachineParams:
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index 7a244c951e..3f9c1ede6e 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -47,7 +47,7 @@ static void qos_set_machines_devices_available(void)
>       MachineInfoList *mach_info;
>       ObjectTypeInfoList *type_info;
>   
> -    mach_info = qmp_query_machines(&error_abort);
> +    mach_info = qmp_query_machines(false, false, &error_abort);
>       machines_apply_to_node(mach_info);
>       qapi_free_MachineInfoList(mach_info);
>   

weak:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

-- 
Best regards,
Vladimir

