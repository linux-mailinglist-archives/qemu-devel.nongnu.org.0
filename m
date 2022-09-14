Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087345B8EEB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 20:33:43 +0200 (CEST)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYXCe-00034N-RK
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 14:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYX5Q-0005dO-8A
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 14:26:16 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:58088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oYX5K-0004KY-FW
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 14:26:10 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 41DFF2E0A39;
 Wed, 14 Sep 2022 21:25:57 +0300 (MSK)
Received: from [172.31.103.133] (172.31.103.133-vpn.dhcp.yndx.net
 [172.31.103.133])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 mEjHXHZExN-PsOSjiRC; Wed, 14 Sep 2022 21:25:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663179956; bh=FGbNbrXUoLg8Vm00tH8SAw+V3VwZlMitZUFKEgn94/k=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=or5lNsLAgC0s4eVqaqGaiNJPXdmfwasbdT4+fj7ykoNOhTigIAsOylESMFnH9uzpR
 9zQPUbWCDrMWwCFehRYxteihlMQf/F91+maSS8Ou1WqecWF/VhVw1LNzWHlgw0MdtR
 wY+hMqMA9wNtOdcVvNci+3Ys39yZh2IZfJW6Pa2Q=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b666be2e-3001-1b40-8f29-3a329ec7930c@yandex-team.ru>
Date: Wed, 14 Sep 2022 21:25:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 4/4] scripts: add script to compare compatible
 properties
Content-Language: en-US
To: Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, lvivier@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, bleal@redhat.com
References: <20220914105539.18461-1-davydov-max@yandex-team.ru>
 <20220914105539.18461-5-davydov-max@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220914105539.18461-5-davydov-max@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

On 9/14/22 13:55, Maksim Davydov wrote:
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
> ./scripts/compare_mt.py --mt pc-q35-3.1 pc-q35-2.12
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

Looks great!

Some nitpicking:

1. I'd use left-align, at least for the first column as more readable.

2. Seems '-' is bad separator for driver-property, as both drivers and properties sometimes has own '-' inside. Let's use something else. Maybe colon, like driver:property. Or, maybe, just add one more column, to keep driver and property names in different columns.

Hmm, and what means [True, False] ?

> 
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> ---
>   scripts/compare_mt.py | 374 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 374 insertions(+)
>   create mode 100755 scripts/compare_mt.py
> 
> diff --git a/scripts/compare_mt.py b/scripts/compare_mt.py
> new file mode 100755
> index 0000000000..1df5e6c4f4
> --- /dev/null
> +++ b/scripts/compare_mt.py
> @@ -0,0 +1,374 @@
> +#!/usr/bin/env python3
> +#
> +# Script to compare machine type compatible properties (include/hw/boards.h).
> +# compat_props are applied to the driver during initialization to change
> +# default values, for instance, to maintain compatibility.
> +# This script constructs table with machines and values of their compat_props
> +# to compare and to find places for improvements or places with bugs. If
> +# during the comparision, some machine type doesn't have a property (it is in
> +# the comparision table because another machine type has it), then the
> +# appropriate method will be used to obtain the default value of this driver
> +# property via qmp command (e.g. query-cpu-model-expansion for x86_64-cpu).
> +# These methods are defined below in propery_methods.
> +#
> +# Copyright (c) Yandex Technologies LLC, 2022
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
> +import sys
> +from os import path
> +from argparse import ArgumentParser, RawTextHelpFormatter
> +import pandas as pd
> +
> +try:
> +    qemu_dir = path.abspath(path.dirname(path.dirname(__file__)))
> +    sys.path.append(path.join(qemu_dir, 'python'))
> +    from qemu.machine import QEMUMachine
> +except ModuleNotFoundError as exc:
> +    print(f"Module '{exc.name}' not found.")
> +    print("Try export PYTHONPATH=top-qemu-dir/python or run from top-qemu-dir")
> +    sys.exit(1)
> +
> +
> +default_cmd_line = 'build/qemu-system-x86_64 -enable-kvm -machine none'
> +
> +
> +# Methods to get right values of drivers props
> +#
> +# Use these methods as a 'whitelist' and add entries only if necessary. It's
> +# important to be stable and predictable in analysis and tests.
> +# * Names should be in qom-list-types format (486-x86_64-cpu, not 486)
> +# * The latest definition wins:
> +#   1) device
> +#   2) cpu
> +#   3) 486-x86_64-cpu
> +#   For 486 will be used - rule #3, for virtio device - #1, for Haswell - #2
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
> +script_desc="""Script to compare machine types (their compat_props).

PEP8: whitespaces around = operator

> +
> +If a property applies to an abstract class this script collects default \
> +values of all child classes and prints them as a set.
> +
> +"Unavailable method" - means that this script doesn\'t know how to get \

you don't need to escape quote (') inside """string""" in triple-double quotes.

> +default values of the driver. To add method use the construction described \
> +at the top of the script.
> +"Unavailable driver" - means that this script doesn\'t know this driver. \
> +For instance, this can happen if you configure QEMU without this device or \
> +if machine type definition has error.
> +"No default value" - means that the appropriate method can\'t get the default \
> +value and most likely that this property doesn\'t have it.
> +"Unknown property" - means that the appropriate method can\'t find property \
> +with this name."""
> +
> +
> +def parse_args():
> +    parser = ArgumentParser(formatter_class=RawTextHelpFormatter,
> +                            description=script_desc)
> +    parser.add_argument('--json', action='store_true',
> +                        help='returns table in json format')
> +    parser.add_argument('--csv', action='store_true',
> +                        help='returns table in csv format')

More usual would be to add one argument instead, like --format, that will take "json" or "csv" argument (or "ascii" by default). See here: https://docs.python.org/3/library/argparse.html#choices

> +    parser.add_argument('--all', action='store_true',
> +                        help='prints all available machine types (list of '
> +                             'machine types will be ignored). Execution with '
> +                             '--all may take several minutes!')
> +    parser.add_argument('--mt', nargs="*", type=str,
> +                        help='list of Machine Types that will be compared')

To restrict using both --all and --mt, you may use mutual exclusion: https://docs.python.org/3/library/argparse.html#mutual-exclusion

> +    parser.add_argument('--raw', action='store_true',
> +                        help='prints ALL defined properties without value '
> +                             'transformation. By default, only properties '
> +                             'with different values will be printed and with '
> +                             'value transformation(e.g. "on" -> True)')
> +    parser.add_argument('--cmd-line', default=default_cmd_line,
> +                        help='command line to start qemu. '
> +                             'Default: "{}"'.format(default_cmd_line))
> +    return parser.parse_args()
> +
> +
> +# return tuple (name, major, minor, revision)
> +def mt_comp(mt):
> +    splited_name = mt['name'].rsplit('-', 1)
> +    if len(splited_name) == 2:
> +        version = splited_name[1].split('.')
> +        if len(version) == 2:
> +            return (splited_name[0], int(version[0]), int(version[1]), 0)
> +        if len(version) == 3:
> +            return (splited_name[0],
> +                    int(version[0]), int(version[1]), int(version[2]))

            what if len(version) == 1 or len(version) > 3 ? Should we add an assertion?

            also, you don't need parentheses to return tuple

> +
> +    return (splited_name[0], 0, 0, 0)

what about something like this:

name = mt['name']

if '-' not in name:
    return name, 0, 0, 0

name, ver = name.rsplit('-', 1)
ver_list = map(int, ver.split('.', 2))
ver_list += [0] * (3 - len(ver_list))
return name, *ver_list

> +
> +
> +def get_mt_definitions(vm):
> +    args = {'compat-props': True}
> +    raw_mt_defs = vm.command('query-machines', **args)
> +    mt_defs = [] # MT: {driver_1: set_of_props, ...}

PEP8: at least two spaces before '#'.

> +    for raw_mt in raw_mt_defs:
> +        compat_props = {}
> +        for prop in raw_mt['compat-props']:
> +            if prop['driver'] not in compat_props:
> +                compat_props[prop['driver']] = {}
> +            compat_props[prop['driver']][prop['property']] = prop['value']
> +        mt_defs.append({'name': raw_mt['name'], 'compat-props': compat_props})
> +
> +    mt_defs.sort(key=mt_comp)
> +    return mt_defs
> +
> +
> +def get_req_props(mt_defs):
> +    driver_props = {}
> +    for mt in mt_defs:
> +        compat_props = mt['compat-props']
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
> +        abstr = obj_type.get('abstract', False)
> +        driver_to_def[obj_type['name']] = {
> +            'parent': parent,
> +            'abstract': abstr,
> +            'method': None}
> +        if abstr:
> +            type_args = {'implements': obj_type['name'], 'abstract': True}
> +            list_child_objs = vm.command('qom-list-types', **type_args)

I don't insist, but we already have two popular styles of calling qmp commands:

list_child_objs = vm.command('qom-list-types', **{
    'implemnts': obj_type['name'],
    'abstract': True
}

and

list_child_objs = vm.command('qom-list-types', implements=obj_type['name'],
                              abstract=True)

don't you like one of them?

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
> +def fill_prop_table(vm, mt_list, driver_props, driver_defs):
> +    table = {}
> +    for driver, props in sorted(driver_props.items()):
> +        for prop in sorted(props):
> +            name = '{}-{}'.format(driver, prop)
> +            table[name] = []
> +            for mt in mt_list:
> +                compat_props = mt['compat-props']
> +                if driver in compat_props:
> +                    if prop in compat_props[driver]:
> +                        table[name].append(compat_props[driver][prop])
> +                        continue
> +
> +                # properties from QEMU (not from machine type compat_props)
> +                # properties from another architecture or config
> +                if driver not in driver_defs:
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
> +    headers = [mt['name'] for mt in mt_list]
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

For this, you can simply use int(value, 0). It converts automatically 0x.. as hex and 0o.. as oct.

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
> +        for mt_prop_val in row:
> +            if type(mt_prop_val) is list:
> +                transformed = [transform_value(val) for val in mt_prop_val]

the same:

transformed = map(transform_value, mt_prop_val)

> +                if len(transformed) == 1:
> +                    new_row.append(transformed[0])
> +                else:
> +                    new_row.append(transformed)
> +
> +                numeric_values.update(set([transform_number(val)
> +                                           for val in mt_prop_val]))
> +                all_values.update(set(transformed))
> +            else:
> +                transformed = transform_value(mt_prop_val)
> +                new_row.append(transformed)
> +                numeric_values.add(transform_number(mt_prop_val))
> +                all_values.add(transformed)
> +
> +        if len(table.columns) > 1:
> +            if len(all_values) == 1:
> +                continue
> +
> +            if None not in numeric_values and len(numeric_values) == 1:
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


Not sure about good practices, but that's how I do for scripts:

add a separate main function, that will have arguments according to your ArgumentParser, like

def main(all, mt, raw, json, csv ...):
    ...

and in "if __name__ == '__main__'" block you'll just do

main(**vars(parse_args()))

But anyway, having large code block in "if __name__ == '__main__'" is not a good practices. Better add separate function and call it.


> +    with QEMUMachine(binary=qemu_arg_list[0],
> +                     qmp_timer=15, args=qemu_arg_list[1:]) as vm:
> +        vm.launch()
> +        mt_defs = get_mt_definitions(vm)
> +        list_mt = [mt['name'] for mt in mt_defs]
> +
> +        if not args.all:
> +            if args.mt is None:
> +                print('Enter machine types for comparision or use --help')
> +                print('List of available machine types:')
> +                print(*list_mt, sep='\n')
> +                sys.exit(1)
> +
> +            for mt in args.mt:
> +                if mt not in list_mt:
> +                    print('Wrong machine type name')
> +                    print('List of available machine types:')
> +                    print(*list_mt, sep='\n')
> +                    sys.exit(1)
> +
> +        req_mt = []
> +        if args.all:
> +            req_mt = mt_defs
> +        else:
> +            for mt in mt_defs:
> +                if mt['name'] in args.mt:
> +                    req_mt.append(mt)
> +
> +        if len(req_mt) == 1:
> +            args.full = True
> +
> +        req_driver_props = get_req_props(req_mt)
> +        driver_defs = get_driver_definitions(vm)
> +        comp_table = fill_prop_table(vm, req_mt, req_driver_props, driver_defs)
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


I'm afraid to be too strict :( But I have some advises to make the script more readable and more maintainable :)

1. Use classes instead of nested-nested dicts. For example you may have Driver object, that would have name, parent, abstract ... properties.

2. Avoid high level of nesting in functions (like in fill_prop_table, you have double if inside triple for). Try add some helper functions to reduce complexity and nesting of the original function.

3. Add a short doc-string for each function, what it does.

4. Use python typing. In Qemu we tend to use it for all new python code.

5. Use f-strings instead of .format() where appropriate (yes, that's a nitpicking, but still)

-- 
Best regards,
Vladimir

