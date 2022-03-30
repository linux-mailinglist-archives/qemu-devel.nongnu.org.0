Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318FB4EC8F3
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 17:57:32 +0200 (CEST)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZahO-0002Jf-St
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 11:57:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZafO-00012W-B8
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:55:27 -0400
Received: from smtp41.i.mail.ru ([94.100.177.101]:34658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZafI-0006XH-SR
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Z+F66x3UEhVaB+QJ/glayAtUhnRHGZ09DX+8n2cuDqs=; 
 t=1648655720;x=1649261120; 
 b=qfURLvtWl+edUBSHT9cWCrCDk/dB3+cWmWH6f1erxvkLOdDOnjDjNek857wKyHFLRwU9QRUWHYlX2sPgtbdu7ZNxMcChy++fve47bBMNbWGb2a9KN0K1hkX6/9Ihp1D50PHjpW/De5tzWvtObyhfVvPB2AGw5d/l7rGmuYzCleCa+wmdEmmyt6J3vyn5sjUiyuZAdI1qNJx0VUpZup9tLbRxmoJoiHuVUrSJf9JRX9Yp4vvU7p9rAU30b+RUfkuITzYBNiYhpW6dleTpnG/q+idmjp0uwcNpNZZbwQOC2lIORY00ZXgYzej5gvWu+Nz2PHPvkipUF/vjqdelRsUJIw==;
Received: by smtp41.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZafD-0007Ug-G9; Wed, 30 Mar 2022 18:55:16 +0300
Message-ID: <00246e6f-85a4-487f-7025-fe616a65ebe6@mail.ru>
Date: Wed, 30 Mar 2022 18:55:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 9/9] scripts: printing machine type compat properties
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-10-maxim.davydov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220328211539.90170-10-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp41.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61C24934C3AF654FA0FDE5B3EC8CDA719600894C459B0CD1B9EAC064F5E033D21383F7D1100FA7BB330C537C0976333811ACCB5262BB561CA2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A3295C83650092F9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378556F4CD9D953FFE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81799AAB02A5D55848EE77E16791FE8216F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74F330F0740BBDD1F9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAE9A1BBD95851C5BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC1B1A2329255CBA5E3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379A27C7195405AE8DD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F1F775082B55F042FC6EABA9B74D0DA47B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5BA19A262A67F7B8BEC037C5E8EE49A4D4FE21741DE8603FDD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349A949488F6BF46DD86265B7616D8E93D391D38431FD3EC4FF9E90A0986C0E0CB2D9CBE68D20ED8471D7E09C32AA3244C728E79C56C5B763EFB97E8C9E9E25CC55595C85A795C7BAE4A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+VRhw6Mwrv4uQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE7D63647332065CCA0EA087E541AF9F9C5B61746BC5060E2FE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.101;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp41.i.mail.ru
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
> This script makes the information that can be obtained from
> query-init-properties and query-machines easy to read.
> 
> Note: some init values from the devices can't be available like properties
> from virtio-9p when configure has --disable-virtfs. Such values are
> replaced by "DEFAULT". Another exception is properties of abstract
> classes. The default value of the abstract class property is common
> value of all child classes. But if the values of the child classes are
> different the default value will be "BASED_ON_CHILD" (for example, old
> x86_64-cpu can have unsupported feature).
> 
> Example:
> 
>      1) virsh qemu-monitor-command VM --pretty \
>         '{"execute" : "query-init-properties"}' > init_props.json
> 
>      2) virsh qemu-monitor-command VM --pretty \
>         '{"execute" : "query-machines", "arguments" : {"is-full" : true}}' \
>         > compat_props.json
> 
>      3) scripts/print_MT.py --MT_compat_props compat_props.json\
>          --init_props init_props.json --mt pc-q35-7.0 pc-q35-6.1
> 
> Output:
> ╒═══════════════════════════════════╤══════════════╤══════════════╕
> │           property_name           │  pc-q35-7.0  │  pc-q35-6.1  │
> ╞═══════════════════════════════════╪══════════════╪══════════════╡
> │   ICH9-LPC-x-keep-pci-slot-hpc    │     True     │    False     │
> ├───────────────────────────────────┼──────────────┼──────────────┤
> │          nvme-ns-shared           │     True     │     off      │
> ├───────────────────────────────────┼──────────────┼──────────────┤
> │ vhost-user-vsock-device-seqpacket │     auto     │     off      │
> ├───────────────────────────────────┼──────────────┼──────────────┤
> │ virtio-mem-unplugged-inaccessible │     auto     │     off      │
> ├───────────────────────────────────┼──────────────┼──────────────┤
> │  x86_64-cpu-hv-version-id-build   │    14393     │    0x1bbc    │
> ├───────────────────────────────────┼──────────────┼──────────────┤
> │  x86_64-cpu-hv-version-id-major   │      10      │    0x0006    │
> ├───────────────────────────────────┼──────────────┼──────────────┤
> │  x86_64-cpu-hv-version-id-minor   │      0       │    0x0001    │
> ╘═══════════════════════════════════╧══════════════╧══════════════╛
> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>   scripts/print_MT.py | 274 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 274 insertions(+)
>   create mode 100755 scripts/print_MT.py
> 
> diff --git a/scripts/print_MT.py b/scripts/print_MT.py
> new file mode 100755
> index 0000000000..8be13be8d7
> --- /dev/null
> +++ b/scripts/print_MT.py
> @@ -0,0 +1,274 @@
> +#! /usr/bin/python3

Standard shebang line for python3 is:

#!/usr/bin/env python3


> +#
> +# Script for printing machine type compatible features. It uses two JSON files
> +# that should be generated by qmp-init-properties and query-machines.
> +#
> +# Copyright (c) 2022 Maxim Davydov <maxim.davydov@openvz.org>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program. If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +import pandas as pd
> +import json
> +from tabulate import tabulate
> +from argparse import ArgumentParser
> +
> +
> +# used for aliases and other names that can be changed
> +aliases = { "e1000-82540em": "e1000" }
> +
> +
> +def get_major(mt):
> +    splited = mt.split('.')
> +    if (len(splited) >= 2):
> +        return int(mt.split('.')[1])

why to call split() again? You may use splited[1]

> +    else:
> +        return 0
> +
> +
> +def get_prefix(mt):
> +    splited = mt.split('.')
> +    if (len(splited) >= 1):

In python you don't need braces around if condition:

    if len(splited) >= 1:

is the same thing.

> +        return mt.split('.')[0]
> +    else:
> +        return mt

seems, split() never return empty list, so len is always >=1.

You can do simply

return mt.split(',', 1)[0]

> +
> +
> +def get_mt_sequence(mt_data):
> +    mt_list = [mt['name'] for mt in mt_data['return']]
> +    mt_list.remove('none')
> +
> +    mt_list.sort(key=get_major, reverse=True)
> +    mt_list.sort(key=get_prefix, reverse=True)

Aha. You may use one sort() call, if use tuple as key. Something like this should work:

def parse_mt(mt):
   spl = mt.split('.')
   if len(spl) >= 2:
     return spl[0], spl[1]
   else:
     return mt, 0

...

mt_list.sort(key=parse_mt, ...)

> +
> +    return mt_list
> +
> +
> +def get_req_props(defval_data, prop_set, abstr_class_to_features):
> +    req_prop_values = dict()
> +    req_abstr_prop_values = dict()

{} construction is native way to create empty dict:

   req_prop_values = {}

> +
> +    for device in defval_data['return']:
> +        # Skip cpu devices that will break all default values for cpus
> +        if device['name'] == 'base-x86_64-cpu':
> +            continue
> +        if device['name'] == 'max-x86_64-cpu':
> +            continue
> +
> +        # some features in mt set as one absract class
> +        # but this features are owned by another class

Hmm. That all hard for me to review, because I don't know the whole model of machine types.. Don't we have a documentation somewhere? Which objects, classes, abstart classes and properties we have and what that all mean.

> +        device_props_owners = dict()
> +        for props_class in device['props']:
> +            if not 'classprops' in props_class: # for example, Object class

More pythonic is:

   if 'classprops' not in props_class:

> +                continue
> +
> +            for prop in props_class['classprops']:
> +                if not 'value' in prop:
> +                    continue
> +
> +                prop_name = device['name'] + '-' + prop['name']
> +                device_props_owners[prop['name']] = prop['value']
> +                if prop_name in prop_set:
> +                    req_prop_values[prop_name] = prop['value']
> +
> +        for props_class in device['props']:
> +            if not props_class['classname'] in abstr_class_to_features:
> +                continue
> +
> +            for req_prop in abstr_class_to_features[props_class['classname']]:
> +                if not req_prop in device_props_owners:
> +                    continue
> +
> +                prop_value = device_props_owners[req_prop]
> +                prop_name = props_class['classname'] + '-' + req_prop
> +                if req_abstr_prop_values.setdefault(prop_name, prop_value) \
> +                    != prop_value:
> +                    req_abstr_prop_values[prop_name] = 'BASED_ON_CHILD'
> +
> +    return req_prop_values, req_abstr_prop_values
> +
> +
> +def make_definition_table(mt_to_compat_props, prop_set,
> +                          req_props, req_abstr_props, is_full):
> +    mt_table = dict()
> +    for prop in sorted(prop_set):
> +        if not is_full:
> +            values = set()
> +            for mt in mt_to_compat_props:
> +                if prop in mt_to_compat_props[mt]:
> +                    values.add(mt_to_compat_props[mt][prop])
> +                else:
> +                    if prop in req_props:
> +                        values.add(req_props[prop])
> +                    else:
> +                        values.add('DEFAULT')
> +            # Skip the property if its value is the same for
> +            # all required machines
> +            if len(values) == 1:
> +                continue
> +
> +        mt_table.setdefault('property_name', []).append(prop)
> +        for mt in mt_to_compat_props:
> +            if prop in mt_to_compat_props[mt]:
> +                value = mt_to_compat_props[mt][prop]
> +                mt_table.setdefault(mt, []).append(value)
> +            else:
> +                if prop in req_props:
> +                    mt_table.setdefault(mt, []).append(req_props[prop])
> +                else:
> +                    value = req_abstr_props.get(prop, 'DEFAULT')
> +                    mt_table.setdefault(mt, []).append(value)
> +
> +    return mt_table
> +
> +
> +def get_standard_form(value):
> +    if type(value) is str:
> +        out = value.upper()
> +        if out.isnumeric():
> +            return int(out)
> +        if out == 'TRUE':
> +            return True
> +        if out == 'FALSE':
> +            return False
> +
> +    return value
> +
> +
> +def get_features(mt_data, defval_data, mts, is_full):
> +    prop_set = set()
> +    abstr_prop_set = set()
> +    mt_to_compat_props = dict()
> +    # It will be used for searching appropriate feature (sometimes class name
> +    # in machine type definition and real class name are different)
> +    abstr_class_to_features = dict()
> +
> +    for mt in mt_data['return']:
> +        if mt['name'] == 'none':
> +            continue
> +
> +        if not mt['name'] in mts:
> +            continue
> +
> +        mt_to_compat_props[mt['name']] = dict()
> +        for prop in mt['compat-props']:
> +            driver_name = aliases.get(prop['driver'], prop['driver'])
> +            prop_name = prop['driver'] + '-' + prop['property']
> +            real_name = driver_name + '-' + prop['property']
> +            # value is always string
> +            prop_val  = get_standard_form(prop['value'])
> +            if prop['abstract']:
> +                mt_to_compat_props[mt['name']][real_name] = prop_val
> +                abstr_prop_set.add(real_name)
> +                abstr_class_to_features.setdefault(driver_name,
> +                                                   set()).add(prop['property'])
> +            else:
> +                mt_to_compat_props[mt['name']][real_name] = prop_val
> +                prop_set.add(real_name)
> +
> +    req_props, req_abstr_props = get_req_props(defval_data, prop_set,
> +                                               abstr_class_to_features)
> +
> +    # join sets for global sorting by name
> +    prop_set.update(abstr_prop_set)
> +    mt_table = make_definition_table(mt_to_compat_props, prop_set, req_props,
> +                                     req_abstr_props, is_full)
> +    # to save mt sequence
> +    df = pd.DataFrame({'property_name': mt_table['property_name']})
> +    for mt in mts:
> +        if not mt in mt_table:
> +            print('Error: {0} no found'.format(mt))
> +            continue
> +        df[mt] = mt_table[mt]
> +
> +    return df
> +
> +
> +def main():
> +    parser = ArgumentParser(description='''Print definition of machine
> +                                           type (compatible features)''')
> +    parser.add_argument('--MT_compat_props', type=str, required=True,
> +                        help='''Path to JSON file with current machine type
> +                                definition. It must be generated via
> +                                query-machines with is-full option.''')
> +    parser.add_argument('--init_props', type=str, required=True,
> +                        help='''Path to JSON file with initial features. It
> +                                must be generated via
> +                                query-init-properties.''')
> +    parser.add_argument('--format', type=str,
> +                        choices=['table', 'csv', 'html', 'json'],
> +                        default='table', help='Format of the output file')
> +    parser.add_argument('--file', type=str,
> +                        help='''Path to output file. It must be set with csv
> +                                and html formats.''')
> +    parser.add_argument('--all', action='store_true',
> +                        help='''Print all available machine types (list of
> +                                machine types will be ignored''')
> +    parser.add_argument('--mt', nargs="*", type=str,
> +                        help='List of machine types that will be compared')
> +    parser.add_argument('--full', action='store_true',
> +                        help='''Print all defined properties (by default,
> +                                only properties with different values are
> +                                printed)''')
> +
> +    args = parser.parse_args()
> +
> +    if args.all == 0 and args.mt == None:

Don't compare boolean value with zero, use it as is (I'm about args.all, but comparing mt with None doesn't make real sense here too):

   if not(args.all or args.mt):

> +        print('Enter the list of required machine types (list of all '\
> +              'machine types : qemu-system-x86_64 --machine help)')
> +        return
> +
> +    with open(args.MT_compat_props) as mt_json_file:
> +        mt_data = json.load(mt_json_file)
> +
> +    with open(args.init_props) as defval_json_file:
> +        defval_data = json.load(defval_json_file)
> +
> +    if args.all:
> +        df = get_features(mt_data, defval_data, get_mt_sequence(mt_data),
> +                          args.full)
> +    else:
> +        df = get_features(mt_data, defval_data, args.mt, args.full)

I'd write it like this:

mt = args.mt or get_mt_sequence(mt_data)
df = get_feature(..., mt, args.full)

> +
> +    if args.format == 'csv':
> +        if args.file == None:
> +            print('Error: csv format requires path to output file')
> +            return
> +        df.to_csv(args.file)
> +    elif args.format == 'html':
> +        if args.file == None:
> +            print('Error: html format requires path to output file')
> +            return
> +        with open(args.file, 'w') as output_html:
> +            output_html.write(df.to_html(justify='center', col_space='400px',
> +                                         index=False))
> +    elif args.format == 'json':
> +        json_table = df.to_json()
> +        if args.file == None:
> +            print(json_table)
> +        else:
> +            with open(args.file, 'w') as output_json:
> +                output_json.write(json_table)
> +    elif args.format == 'table':
> +        table = tabulate(df, showindex=False, stralign='center',
> +                         tablefmt='fancy_grid', headers='keys')
> +        if args.file == None:
> +            print(table)
> +        else:
> +            with open(args.file, 'w') as output_table:
> +                output_table.write(table)

For me this looks like extra logic.

Why to restrict printing csv/html directly to stdout? It's native to use output redirection to save output to some file. I think you can simply drop --file argument always print to stdout.

Or, if you still want this option, it's better to prepare the whole output in string variable, and then handle it once:

if ...
elif ...
elif ...

...

if args.file:
   with open(...) as f:
     f.write(output)
else:
   print(output)

> +
> +
> +if __name__ == '__main__':
> +    main()


-- 
Best regards,
Vladimir

