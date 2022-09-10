Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4D5B4626
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 14:07:23 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWzGb-00044m-VS
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 08:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWzF0-0002TV-Ez
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 08:05:42 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:38080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWzEq-0002F4-Kr
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 08:05:40 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 255772E0ADC;
 Sat, 10 Sep 2022 15:05:24 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1329::1:2d] (unknown
 [2a02:6b8:b081:1329::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 w3amwS9VeM-5LPKHxUO; Sat, 10 Sep 2022 15:05:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662811522; bh=scEtAZIh+aCzhYvoEVakeLxOGp5phRcqJBDDUEc2BlY=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=jr1//3dTQ8M868NNcgGUKL+ll9y20jSg2j1uOiKOGTliO8AiQgAh24vslUwyxMbn+
 ed+XwUfnpAZ+uZd/w56lsgbW6t4VF+RJCro77eI2iLFIZHNtJuwcVQXe9RVlnowIUl
 mZmuVr39tbWiOarynOoCm+y5hPSp0y34nctEuGpE=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7de09a19-2c21-4e4e-c8d0-4119c7e5ebac@yandex-team.ru>
Date: Sat, 10 Sep 2022 15:05:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 4/4] scripts: add script to compare compatible properties
Content-Language: en-US
To: Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, lvivier@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, bleal@redhat.com
References: <20220908103650.9518-1-davydov-max@yandex-team.ru>
 <20220908103650.9518-5-davydov-max@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220908103650.9518-5-davydov-max@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 9/8/22 13:36, Maksim Davydov wrote:
> This script run QEMU to obtain compat_props of machines and default
> values of different types and produce appropriate table. This table
> can be used to compare machine types to choose the most suitable
> machine. Also table in json or csv format should be used to check that
> new machine doesn't affect previous ones via comparisin tables with and
> without new machine.
> Default values of properties are needed to fill "holes" in the table (one
> machine has these properties and another not).
> 
> Notes:
> * some init values from the devices can't be available like properties
> from virtio-9p when configure has --disable-virtfs. This situations will
> be seen in the table as "unavailable driver".
> * Default values can be get can be obtained in an unobvious way, like
> x86 features. If the script doesn't know how to get property default value
> to compare one machine with another it fills "holes" with "unavailable
> method". This is done because script uses whitelist model to get default
> values of different types. It means that the method that can't be applied
> to a new type that can crash this script. It is better to get an
> "unavailable driver" when creating a new machine with new compatible
> properties than to break this script. So it turns out a more stable and
> generic script.
> * If the default value can't be obtained because this property doesn't
> exist or because this property can't have default value, appropriate
> "hole" will be filled by "unknown property" or "no default value"
> * If the property is applied to the abstract class, the script collects
> default values from all child classes (set of default values)
> 
> Example:
> 
> scripts/compare_mt.py --MT pc-q35-3.1 pc-q35-2.12
> 
> ╒════════════════════════════════════╤═══════════════╤═══════════════╕
> │                                    │  pc-q35-2.12  │  pc-q35-3.1   │
> ╞════════════════════════════════════╪═══════════════╪═══════════════╡
> │    EPYC-IBPB-x86_64-cpu-xlevel     │  0x8000000a   │  2147483678   │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │       EPYC-x86_64-cpu-xlevel       │  0x8000000a   │  2147483678   │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │ Skylake-Server-IBRS-x86_64-cpu-pku │     False     │     True      │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │   Skylake-Server-x86_64-cpu-pku    │     False     │     True      │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │         VGA-global-vmstate         │     True      │     False     │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │     cirrus-vga-global-vmstate      │     True      │     False     │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │        hda-audio-use-timer         │     False     │     True      │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │  migration-decompress-error-check  │     False     │     True      │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │       qxl-vga-global-vmstate       │     True      │     False     │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │     vmware-svga-global-vmstate     │     True      │     False     │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │      x86_64-cpu-legacy-cache       │     True      │ [True, False] │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │         x86_64-cpu-topoext         │     False     │ [True, False] │
> ├────────────────────────────────────┼───────────────┼───────────────┤
> │   x86_64-cpu-x-hv-synic-kvm-only   │     True      │     False     │
> ╘════════════════════════════════════╧═══════════════╧═══════════════╛
> 
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> ---
>   scripts/compare_mt.py | 370 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 370 insertions(+)
>   create mode 100755 scripts/compare_mt.py
> 
> diff --git a/scripts/compare_mt.py b/scripts/compare_mt.py
> new file mode 100755
> index 0000000000..a063c79682
> --- /dev/null
> +++ b/scripts/compare_mt.py
> @@ -0,0 +1,370 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) Yandex Technologies LLC, 2022
> +#
> +# Script to compare machine type compatible properties
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
> +# along with this program; if not, see <http://www.gnu.org/licenses/>.
> +
> +from tabulate import tabulate
> +import json

json import unused

> +import sys
> +from os import path
> +from argparse import ArgumentParser, RawTextHelpFormatter
> +import pandas as pd
> +
> +try:
> +    qemu_dir = path.abspath(path.dirname(path.dirname(__file__)))
> +    sys.path.append(path.join(qemu_dir, 'python'))
> +    from qemu.machine import QEMUMachine
> +    from qemu.qmp import ConnectError

ConnectError unused

> +except ModuleNotFoundError as exc:
> +    print(f"Module '{exc.name}' not found.")
> +    print("Try export PYTHONPATH=top-qemu-dir/python or run from top-qemu-dir")
> +    sys.exit(1)
> +
> +
> +DEF_CMD_LINE = 'build/qemu-system-x86_64 -enable-kvm -machine none'
> +
> +
> +# Methods to get right values of drivers props
> +#
> +# Use these methods as a 'whitelist' and add entries only if necessary. It's
> +# important in analysis and tests.
> +# Names should be in qom-list-types format (486-x86_64-cpu, not 486)
> +# The latest definition wins:
> +# 1) device
> +# 2) cpu
> +# 3) 486-x86_64-cpu
> +# For 486 will be used - 3) rule, for virtio device - 1), for Haswell - 2)
> +def get_device_prop(vm, device, prop_name):
> +    args = {'typename': device}
> +    device_props = vm.command('device-list-properties', **args)
> +    for prop in device_props:
> +        if prop['name'] == prop_name:
> +            return str(prop.get('default-value', 'No default value'))
> +
> +    return 'Unknown property'
> +
> +
> +def get_x86_64_cpu_prop(vm, device, prop_name):
> +    # crop last 11 chars '-x86_64-cpu'
> +    args = {'type': 'full', 'model': {'name': device[:-11]}}
> +    props = vm.command('query-cpu-model-expansion', **args)['model']['props']
> +    return str(props.get(prop_name, 'Unknown property'))
> +
> +
> +# Now it's stub, because all memory_backend types don't have default values
> +# but this behaviour can be changed
> +def get_memory_backend_prop(vm, driver, prop_name):
> +    args = {'typename': driver}
> +    memory_backend_props = vm.command('qom-list-properties', **args)
> +    for prop in memory_backend_props:
> +        if prop['name'] == prop_name:
> +            return str(prop.get('default-value', 'No default value'))
> +
> +    return 'Unknown property'
> +
> +
> +property_methods = [
> +    {'name': 'device', 'method': get_device_prop},
> +    {'name': 'x86_64-cpu', 'method': get_x86_64_cpu_prop},
> +    {'name': 'memory-backend', 'method': get_memory_backend_prop}
> +    ]
> +# End of methods definition
> +
> +
> +def parse_args():
> +    parser = ArgumentParser(formatter_class=RawTextHelpFormatter,
> +                            description='Script to compare machine types '
> +                            '(their compat_props).\n\n'
> +                            'The script execution with --all option may take '
> +                            'several minutes!\n\n'
> +                            'If a property applies to an abstract class this '
> +                            'script collects default values of all child '
> +                            'classes and prints them as a set.\n\n'
> +                            '"Unavailable method" - means that this script '
> +                            'doesn\'t know how to get default values of the '
> +                            'driver. To add method use the construction '
> +                            'described at the top of the script.\n'
> +                            '"Unavailable driver" - means that this script '
> +                            'doesn\'t know this driver. For instance, this '
> +                            'can happen if you configure QEMU without this '
> +                            'device or if machine type definition has error.\n'
> +                            '"No default value" - means that the appropriate '
> +                            'method can\'t get the default value and most '
> +                            'likely that this property doesn\'t have it.\n'
> +                            '"Unknown property" - means that the appropriate '
> +                            'method can\'t find property with this name.')

Please use triple quotes for this, like
      description="""\

A lot of text with new
lines ...
..."""

> +
> +    parser.add_argument('--json', action='store_true',
> +                        help='returns table in json format')
> +    parser.add_argument('--csv', action='store_true',
> +                        help='returns table in csv format')
> +    parser.add_argument('--all', action='store_true',
> +                        help='prints all available machine types (list of '
> +                             'machine types will be ignored)')
> +    parser.add_argument('--MT', nargs="*", type=str,
> +                        help='list of Machine Types that will be compared')
> +    parser.add_argument('--raw', action='store_true',
> +                        help='prints ALL defined properties without '
> +                             'value transformation. By default, '
> +                             'only properties with different values '
> +                             'printed and with value transformation(like '
> +                             '"on" -> True)')
> +    parser.add_argument('--cmd-line', default=DEF_CMD_LINE,
> +                        help='command line to start qemu.'
> +                             'Default: {}'.format(DEF_CMD_LINE))
> +    return parser.parse_args()
> +
> +
> +# return touple (name, major, minor, revision)

tuple

> +def MT_comp(MT):
> +    splited_name = MT['name'].rsplit('-', 1)

accordingly to PEP8 function and variable names should be lowercase. So please don't use uppercase for it, it's harder to read.

> +    if len(splited_name) == 2:
> +        version = splited_name[1].split('.')
> +        if len(version) == 2:
> +            return (splited_name[0], int(version[0]), int(version[1]), 0)
> +        if len(version) == 3:
> +            return (splited_name[0],
> +                    int(version[0]), int(version[1]), int(version[2]))
> +
> +    return (splited_name[0], 0, 0, 0)
> +
> +
> +def get_MT_definitions(vm):
> +    args = {'compat-props': True}
> +    raw_MT_defs = vm.command('query-machines', **args)
> +    MT_defs = [] # MT: {driver_1: set_of_props, ...}
> +    for raw_MT in raw_MT_defs:
> +        compat_props = {}
> +        for prop in raw_MT['compat-props']:
> +            if not compat_props.get(prop['driver'], None):

this condition is better to write like:

    if prop['driver'] not in compat_props:

> +                compat_props[prop['driver']] = {}
> +            compat_props[prop['driver']][prop['property']] = prop['value']
> +        MT_defs.append({'name': raw_MT['name'], 'compat-props': compat_props})
> +
> +    MT_defs.sort(key=MT_comp)
> +    return MT_defs
> +
> +
> +def get_req_props(MT_defs):
> +    driver_props = {}
> +    for MT in MT_defs:
> +        compat_props = MT['compat-props']
> +        for driver, prop in compat_props.items():
> +            if driver not in driver_props:
> +                driver_props[driver] = set()
> +            driver_props[driver].update(prop.keys())
> +
> +    return driver_props
> +
> +
> +def get_driver_definitions(vm):
> +    args = {'abstract': True}
> +    qom_all_types = vm.command('qom-list-types', **args)
> +
> +    driver_to_def = {}
> +    for obj_type in qom_all_types:
> +        # parent of Object is None
> +        parent = obj_type.get('parent', None)
> +        abstr  = obj_type.get('abstract', False)

double space breaks PEP8

> +        driver_to_def[obj_type['name']] = {
> +            'parent': parent,
> +            'abstract': abstr,
> +            'method': None}
> +        if abstr:
> +            type_args = {'implements': obj_type['name'], 'abstract': True}
> +            list_child_objs = vm.command('qom-list-types', **type_args)
> +            child_list = [child['name'] for child in list_child_objs]
> +            driver_to_def[obj_type['name']]['child_list'] = child_list
> +
> +    for driver in property_methods:
> +        if not driver_to_def[driver['name']]['abstract']:
> +            driver_to_def[driver['name']]['method'] = driver['method']
> +            continue
> +
> +        for child in driver_to_def[driver['name']]['child_list']:
> +            driver_to_def[child]['method'] = driver['method']
> +
> +    return driver_to_def
> +
> +
> +def fill_prop_table(vm, MT_list, driver_props, driver_defs):
> +    table = {}
> +    for driver, props in sorted(driver_props.items()):
> +        for prop in sorted(props):
> +            name = '{}-{}'.format(driver, prop)
> +            table[name] = []
> +            for MT in MT_list:
> +                compat_props = MT['compat-props']
> +                if compat_props.get(driver, None):
> +                    if compat_props[driver].get(prop, None):
> +                        table[name].append(compat_props[driver][prop])
> +                        continue
> +
> +                # properties from QEMU (not from machine type compat_props)
> +                # properties from another architecture or config
> +                if not driver_defs.get(driver, None):
> +                    table[name].append('Unavailable driver')
> +                    continue
> +
> +                if not driver_defs[driver]['abstract']:
> +                    if driver_defs[driver]['method'] is None:
> +                        table[name].append('Unavailable method')
> +                    else:
> +                        table[name].append(
> +                            driver_defs[driver]['method'](vm, driver, prop))
> +                else:
> +                    children = driver_defs[driver]['child_list']
> +                    values = set()
> +                    for child in children:
> +                        if driver_defs[child]['abstract']:
> +                            continue
> +
> +                        if driver_defs[child]['method'] is None:
> +                            values.add('Unavailable method')
> +                        else:
> +                            values.add(
> +                                driver_defs[child]['method'](vm, child, prop))
> +
> +                    table[name].append(list(values))
> +
> +    headers = [MT['name'] for MT in MT_list]
> +    return pd.DataFrame.from_dict(table, orient='index', columns=headers)
> +
> +
> +def transform_value(value):
> +    true_list = ['true', 'on']
> +    false_list = ['false', 'off']
> +
> +    out = value.lower()
> +
> +    if out in true_list:
> +        return True
> +
> +    if out in false_list:
> +        return False
> +
> +    return out
> +
> +
> +# Only hex, dec and oct formats
> +def transform_number(value):
> +    try:
> +        # C doesn't work with underscore ('2_5' != 25)
> +        if '_' in value:
> +            raise ValueError
> +
> +        if 'x' in value or 'X' in value:
> +            return int(value, 16)
> +
> +        if 'o' in value or 'O' in value:
> +            return int(value, 8)
> +
> +        return int(value)
> +
> +    except ValueError:
> +        return None
> +
> +
> +def transformed_table(table):
> +    new_table = {}
> +    for index, row in table.iterrows():
> +        new_row = []
> +        all_values = set()
> +        # We want to save original hex/decimal format if not all values
> +        # are the same in the row. So, transformed and not transformed will be
> +        # stored
> +        numeric_values = set()
> +        for MT_prop_val in row:
> +            if type(MT_prop_val) is list:
> +                transformed = [transform_value(val) for val in MT_prop_val]
> +                if len(transformed) == 1:
> +                    new_row.append(transformed[0])
> +                else:
> +                    new_row.append(transformed)
> +
> +                numeric_values.update(set([transform_number(val)
> +                                           for val in MT_prop_val]))
> +                all_values.update(set(transformed))
> +            else:
> +                transformed = transform_value(MT_prop_val)
> +                new_row.append(transformed)
> +                numeric_values.add(transform_number(MT_prop_val))
> +                all_values.add(transformed)
> +
> +        if len(table.columns) > 1:
> +            if len(all_values) == 1:
> +                continue
> +
> +            if not None in numeric_values and len(numeric_values) == 1:

PEP8 recommends "None not in numeric_value" instead of "not None in numeric_values"

> +                continue
> +
> +        new_table[index] = new_row
> +
> +    return pd.DataFrame.from_dict(new_table, orient='index',
> +                                  columns=table.columns.values)
> +
> +
> +if __name__ == '__main__':
> +    args = parse_args()
> +    qemu_arg_list = args.cmd_line.split(' ')
> +    with QEMUMachine(binary=qemu_arg_list[0],
> +                     qmp_timer=15, args=qemu_arg_list[1:]) as vm:
> +        vm.launch()
> +        MT_defs = get_MT_definitions(vm)
> +        list_MT = [MT['name'] for MT in MT_defs]
> +
> +        if not args.all:
> +            if args.MT is None:
> +                print('Enter machine types for comparision or use --help')
> +                print('List of available machine types:')
> +                print(*list_MT, sep='\n')
> +                sys.exit(1)
> +
> +            for MT in args.MT:
> +                if MT not in list_MT:
> +                    print('Wrong machine type name')
> +                    print('List of available machine types:')
> +                    print(*list_MT, sep='\n')
> +                    sys.exit(1)
> +
> +        req_MT = []
> +        if args.all:
> +            req_MT = MT_defs
> +        else:
> +            for MT in MT_defs:
> +                if MT['name'] in args.MT:
> +                    req_MT.append(MT)
> +
> +        if len(req_MT) == 1:
> +            args.full = True
> +
> +        req_driver_props = get_req_props(req_MT)
> +        driver_defs = get_driver_definitions(vm)
> +        comp_table = fill_prop_table(vm, req_MT, req_driver_props, driver_defs)
> +        if not args.raw:
> +            comp_table = transformed_table(comp_table)
> +
> +        if args.json:
> +            print(comp_table.to_json())
> +        elif args.csv:
> +            print(comp_table.to_csv())
> +        else:
> +            print(tabulate(comp_table, showindex=True, stralign='center',
> +                           tablefmt='fancy_grid', headers='keys',
> +                           disable_numparse=True))
> +
> +        vm.shutdown()


-- 
Best regards,
Vladimir

