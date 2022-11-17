Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01E62E604
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 21:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovlbO-0000B0-3W; Thu, 17 Nov 2022 15:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1ovlbM-0000As-LT
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 15:35:12 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1ovlbH-0008Lb-3A
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 15:35:11 -0500
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 0A1A15F467;
 Thu, 17 Nov 2022 23:34:49 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8112::1:2f] (unknown
 [2a02:6b8:b081:8112::1:2f])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bpNs86pF5j-YkNW76qN; Thu, 17 Nov 2022 23:34:47 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668717287; bh=FyGgZUsii4nffEIkm2Obx+zjq0mDGhm4xwAVhetoLUU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=hwDC8ei+kqmQA/sdKnYGUKIztPrjx6xGqPX9ghFHjiyGkdy08CtkfHy4zr0TW8Z6l
 PpULeTBUceh5jUjXVKNWAUlbLDr/+uLSXgRQKDdnbszSJpnkIYsqNXPX7JSrZUQ+C3
 BEIh7wUOQC//5NhEiktDlkiCor24PzSEN4sYzgA8=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <34207803-526f-c06a-8067-e24ea5e525b5@yandex-team.ru>
Date: Thu, 17 Nov 2022 23:34:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 4/4] scripts: add script to compare compatible
 properties
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 crosa@redhat.com, bleal@redhat.com, eblake@redhat.com, armbru@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, lvivier@redhat.com
References: <20221103102741.11201-1-davydov-max@yandex-team.ru>
 <20221103102741.11201-5-davydov-max@yandex-team.ru>
 <CAFn=p-atFet3JWe+DemBcqjXmL8w3jy3Kdh8sJwpaqoNRKzDUA@mail.gmail.com>
Content-Language: en-US
From: Maksim Davydov <davydov-max@yandex-team.ru>
In-Reply-To: <CAFn=p-atFet3JWe+DemBcqjXmL8w3jy3Kdh8sJwpaqoNRKzDUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 11/9/22 00:16, John Snow wrote:
> On Thu, Nov 3, 2022 at 6:29 AM Maksim Davydov
> <davydov-max@yandex-team.ru> wrote:
>> This script run QEMU to obtain compat_props of machines and default
>> values of different types and produce appropriate table. This table
>> can be used to compare machine types to choose the most suitable
>> machine. Also this table in json or csv format should be used to check that
>> new machine doesn't affect previous ones by comparing tables with and
>> without new machine.
>> Default values of properties are needed to fill "holes" in the table (one
>> machine has these properties and another not. For instance, 2.12 mt has
>> `{ "EPYC-" TYPE_X86_CPU, "xlevel", "0x8000000a" }`, but compat_pros of
>> 3.1 mt doesn't have it. So, to compare these machines we need to fill
>> unknown value of "EPYC-x86_64-cpu-xlevel" for 3.1 mt. This unknown value
>> in the table I called "hole". To get values (default values) for these
>> "holes" the script uses list of appropriate methods.)
>>
>> Notes:
>> * some init values from the devices can't be available like properties
>>    from virtio-9p when configure has --disable-virtfs. This situations will
>>    be seen in the table as "unavailable driver".
>> * Default values can be obtained in an unobvious way, like x86 features.
>>    If the script doesn't know how to get property default value to compare
>>    one machine with another it fills "holes" with "unavailable method". This
>>    is done because script uses whitelist model to get default values of
>>    different types. It means that the method that can't be applied to a new
>>    type that can crash this script. It is better to get an "unavailable
>>    driver" when creating a new machine with new compatible properties than
>>    to break this script. So it turns out a more stable and generic script.
>> * If the default value can't be obtained because this property doesn't
>>    exist or because this property can't have default value, appropriate
>>    "hole" will be filled by "unknown property" or "no default value"
>> * If the property is applied to the abstract class, the script collects
>>    default values from all child classes (set of default values)
>>
>> Example:
>>
>> ./scripts/compare_mt.py --mt pc-q35-3.1 pc-q35-4.0
>>
>> ╒═══════════════════════════════════════════════════════════╤══════════════╤════════════════════╕
>> │                                                           │  pc-q35-3.1  │     pc-q35-4.0     │
>> ╞═══════════════════════════════════════════════════════════╪══════════════╪════════════════════╡
>> │ Cascadelake-Server-x86_64-cpu:mpx                         │     True     │       False        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Cascadelake-Server-x86_64-cpu:stepping                    │      5       │         6          │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Icelake-Client-x86_64-cpu:mpx                             │     True     │ unavailable driver │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Icelake-Server-x86_64-cpu:mpx                             │     True     │       False        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Opteron_G3-x86_64-cpu:rdtscp                              │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Opteron_G4-x86_64-cpu:rdtscp                              │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Opteron_G5-x86_64-cpu:rdtscp                              │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Skylake-Client-IBRS-x86_64-cpu:mpx                        │     True     │       False        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Skylake-Client-x86_64-cpu:mpx                             │     True     │       False        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Skylake-Server-IBRS-x86_64-cpu:mpx                        │     True     │       False        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ Skylake-Server-x86_64-cpu:mpx                             │     True     │       False        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ intel-iommu:dma-drain                                     │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ memory-backend-file:x-use-canonical-path-for-ramblock-id  │     True     │  no default value  │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ memory-backend-memfd:x-use-canonical-path-for-ramblock-id │     True     │  no default value  │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ pcie-root-port:x-speed                                    │     2_5      │         16         │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ pcie-root-port:x-width                                    │      1       │         32         │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ pcie-root-port-base:disable-acs                           │     True     │       False        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ tpm-crb:ppi                                               │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ tpm-tis:ppi                                               │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ usb-kbd:serial                                            │      42      │  no default value  │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ usb-mouse:serial                                          │      42      │  no default value  │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ usb-tablet:serial                                         │      42      │  no default value  │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ virtio-balloon-device:qemu-4-0-config-size                │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ virtio-blk-device:discard                                 │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ virtio-blk-device:write-zeroes                            │    False     │        True        │
>> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
>> │ x86_64-cpu:x-intel-pt-auto-level                          │    False     │        True        │
>> ╘═══════════════════════════════════════════════════════════╧══════════════╧════════════════════╛
>>
>> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> Do you expect this script to be used by any other portion of the
> build, or is this merely an interactive tool for developers to
> consult? You have the option of moving it into python/qemu/utils/, but
> the linting system will be a lot more stringent there. For your
> troubles, I'll be able to protect it from bitrot more proactively.
> It's up to you -- but it looks like you did try to statically type it
> already, so maybe a lot of the pain and gruntwork has already been
> done.
>
I apologize for replying late
The purposes of this script were the following:
1) help to choose an appropriate machine for the case by answering the
    question "how does the first_machine differ from the second_machine?"
2) add build check to be sure that other machines are not corrupted after
    the modification of one machine
If it's more correct, then I'll move the script into python/qemu/utils/
>> ---
>>   scripts/compare_mt.py | 440 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 440 insertions(+)
>>   create mode 100755 scripts/compare_mt.py
>>
>> diff --git a/scripts/compare_mt.py b/scripts/compare_mt.py
>> new file mode 100755
>> index 0000000000..31ac86dddd
>> --- /dev/null
>> +++ b/scripts/compare_mt.py
>> @@ -0,0 +1,440 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Script to compare machine type compatible properties (include/hw/boards.h).
>> +# compat_props are applied to the driver during initialization to change
>> +# default values, for instance, to maintain compatibility.
>> +# This script constructs table with machines and values of their compat_props
>> +# to compare and to find places for improvements or places with bugs. If
>> +# during the comparision, some machine type doesn't have a property (it is in
>> +# the comparision table because another machine type has it), then the
> "comparison", not "comparision", previous two lines.
>
>> +# appropriate method will be used to obtain the default value of this driver
>> +# property via qmp command (e.g. query-cpu-model-expansion for x86_64-cpu).
>> +# These methods are defined below in qemu_propery_methods.
>> +#
>> +# Copyright (c) Yandex Technologies LLC, 2022
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program; if not, see <http://www.gnu.org/licenses/>.
>> +
>> +from tabulate import tabulate
>> +import sys
>> +from os import path
>> +from argparse import ArgumentParser, RawTextHelpFormatter, Namespace
>> +import pandas as pd
>> +from typing import Callable, List, Dict, Set, Generator, Tuple, Union, Any
>> +
>> +try:
>> +    qemu_dir = path.abspath(path.dirname(path.dirname(__file__)))
>> +    sys.path.append(path.join(qemu_dir, 'python'))
>> +    from qemu.machine import QEMUMachine
>> +except ModuleNotFoundError as exc:
>> +    print(f"Module '{exc.name}' not found.")
>> +    print("Try export PYTHONPATH=top-qemu-dir/python or run from top-qemu-dir")
>> +    sys.exit(1)
>> +
>> +
>> +default_cmd_line = 'build/qemu-system-x86_64 -enable-kvm -machine none'
>> +
>> +
>> +# Methods to get right values of drivers props
>> +#
>> +# Use these methods as a 'whitelist' and add entries only if necessary. It's
>> +# important to be stable and predictable in analysis and tests.
>> +# Be careful:
>> +# * Names should be in qom-list-types format (486-x86_64-cpu, not 486)
>> +# * Specialization always wins (from 'device' and 'x86_64-cpu', 'x86_64-cpu'
>> +#   will be used for '486-x86_64-cpu')
>> +
>> +# It's default stub for all undefined in property_methods drivers because all
>> +# QEMU types are inherited from Object
>> +def get_object_prop(vm: QEMUMachine, device: str, prop_name: str):
>> +    return 'Unavailable method'
>> +
>> +
>> +def get_device_prop(vm: QEMUMachine, device: str, prop_name: str) -> str:
>> +    device_props = vm.command('device-list-properties', typename=device)
>> +    for prop in device_props:
>> +        if prop['name'] == prop_name:
>> +            return str(prop.get('default-value', 'No default value'))
>> +
>> +    return 'Unknown property'
>> +
>> +
>> +def get_x86_64_cpu_prop(vm: QEMUMachine, device: str, prop_name: str) -> str:
>> +    # crop last 11 chars '-x86_64-cpu'
>> +    props = vm.command('query-cpu-model-expansion', type='full',
>> +                       model={'name': device[:-11]})['model']['props']
>> +    return str(props.get(prop_name, 'Unknown property'))
>> +
>> +
>> +# Now it's stub, because all memory_backend types don't have default values
>> +# but this behaviour can be changed
>> +def get_memory_backend_prop(vm: QEMUMachine, driver: str,
>> +                            prop_name: str) -> str:
>> +    memory_backend_props = vm.command('qom-list-properties', typename=driver)
>> +    for prop in memory_backend_props:
>> +        if prop['name'] == prop_name:
>> +            return str(prop.get('default-value', 'No default value'))
>> +
>> +    return 'Unknown property'
>> +
>> +
>> +class GetPropMethod:
>> +    def __init__(self, driver_name: str,
>> +                 method: Callable[[QEMUMachine, str, str], str]) -> None:
>> +        self.name = driver_name
>> +        self.get_prop = method
>> +
>> +
>> +qemu_property_methods = [
>> +        GetPropMethod('device', get_device_prop),
>> +        GetPropMethod('x86_64-cpu', get_x86_64_cpu_prop),
>> +        GetPropMethod('memory-backend', get_memory_backend_prop)
>> +]
>> +
>> +# all types in QEMU are inherited from Object
>> +qemu_default_method = GetPropMethod('object', get_object_prop)
>> +# End of methods definition
>> +
>> +
>> +class Driver:
>> +    def __init__(self, driver_defs: Dict, driver_name: str, parent_name: str,
>> +                 is_abstr: bool, list_of_children: List[str],
>> +                 get_prop_method: GetPropMethod) -> None:
>> +        self.driver_defs = driver_defs
>> +        self.name = driver_name
>> +        self.parent = parent_name
>> +        self.abstract = is_abstr
>> +        self.children = list_of_children
>> +        self.method = get_prop_method
>> +
>> +
>> +    def is_parent(self, driver_name: str) -> bool:
>> +        if driver_name not in self.driver_defs:
>> +            return False
>> +
>> +        cur_parent = self.parent
>> +        while cur_parent:
>> +            if driver_name == cur_parent:
>> +                return True
>> +            cur_parent = self.driver_defs[cur_parent].parent
>> +
>> +        return False
>> +
>> +
>> +    def set_prop_method(self, prop_method: GetPropMethod) -> None:
>> +        if prop_method.name != self.name:
>> +            return
>> +
>> +        self.method = prop_method
>> +        if not self.abstract:
>> +            return
>> +
>> +        for child in self.children:
>> +            # specialization always wins
>> +            if self.is_parent(self.driver_defs[child].method.name):
>> +                self.driver_defs[child].method = prop_method
>> +
>> +
>> +class DriverDefinitions:
>> +    def __init__(self, vm: QEMUMachine, default_method: GetPropMethod,
>> +                 property_methods: List[GetPropMethod]) -> None:
>> +        self.driver_defs: Dict[str, Driver] = {}
>> +        self.default_method = default_method
>> +        self.property_methods = property_methods
>> +        self.vm = vm
>> +
>> +        qom_all_types = vm.command('qom-list-types', abstract=True)
>> +        for obj_type in qom_all_types:
>> +            # parent of Object is None
>> +            parent = obj_type.get('parent', None)
>> +            abstr = obj_type.get('abstract', False)
>> +            name = obj_type['name']
>> +            if abstr:
>> +                list_child_objs = vm.command('qom-list-types', implements=name,
>> +                                             abstract=True)
>> +                child_list = [child['name'] for child in list_child_objs]
>> +                self.driver_defs[name] = Driver(self.driver_defs, name, parent,
>> +                                                abstr, child_list,
>> +                                                default_method)
>> +            else:
>> +                self.driver_defs[name] = Driver(self.driver_defs, name, parent,
>> +                                                abstr, [], default_method)
>> +
>> +        for prop_method in property_methods:
>> +            # skipping other architectures and etc
>> +            if prop_method.name not in self.driver_defs:
>> +                continue
>> +            self.driver_defs[prop_method.name].set_prop_method(prop_method)
>> +
>> +
>> +    def add_prop_value(self, driver: str, prop: str, prop_list: list) -> None:
>> +        # wrong driver name or disabled in config driver
>> +        if driver not in self.driver_defs:
>> +            prop_list.append('Unavailable driver')
>> +            return
>> +
>> +        if not self.driver_defs[driver].abstract:
>> +            prop_list.append(self.driver_defs[driver].method.get_prop(self.vm,
>> +                                                                      driver,
>> +                                                                      prop))
>> +            return
>> +
>> +        # if abstract we need to collect default values from all children
>> +        values = set()
>> +        for child in self.driver_defs[driver].children:
>> +            if self.driver_defs[child].abstract:
>> +                continue
>> +
>> +            values.add(self.driver_defs[child].method.get_prop(self.vm, child,
>> +                                                               prop))
>> +
>> +        prop_list.append(list(values))
>> +
>> +
>> +class Machine:
>> +    # raw_mt_dict - dict produced by `query-machines`
>> +    def __init__(self, raw_mt_dict: dict) -> None:
>> +        self.name = raw_mt_dict['name']
>> +        self.compat_props: Dict[str, Dict[str, str]] = {}
>> +        # properties are applied sequentially and can rewrite values as in QEMU
>> +        for prop in raw_mt_dict['compat-props']:
>> +            if prop['driver'] not in self.compat_props:
>> +                self.compat_props[prop['driver']] = {}
>> +            self.compat_props[prop['driver']][prop['property']] = prop['value']
>> +
>> +
>> +script_desc="""Script to compare machine types (their compat_props).
>> +
>> +If a property applies to an abstract class this script collects default \
>> +values of all child classes and prints them as a set.
>> +
>> +"Unavailable method" - means that this script doesn't know how to get \
>> +default values of the driver. To add method use the construction described \
>> +at the top of the script.
>> +"Unavailable driver" - means that this script doesn't know this driver. \
>> +For instance, this can happen if you configure QEMU without this device or \
>> +if machine type definition has error.
>> +"No default value" - means that the appropriate method can't get the default \
>> +value and most likely that this property doesn't have it.
>> +"Unknown property" - means that the appropriate method can't find property \
>> +with this name."""
>> +
>> +
>> +def parse_args() -> Namespace:
>> +    parser = ArgumentParser(formatter_class=RawTextHelpFormatter,
>> +                            description=script_desc)
>> +    parser.add_argument('--format', choices=['human-readable', 'json', 'csv'],
>> +                        default='human-readable',
>> +                        help='returns table in json format')
>> +    parser.add_argument('--raw', action='store_true',
>> +                        help='prints ALL defined properties without value '
>> +                             'transformation. By default, only properties '
>> +                             'with different values will be printed and with '
>> +                             'value transformation(e.g. "on" -> True)')
>> +    parser.add_argument('--cmd-line', default=default_cmd_line,
>> +                        help='command line to start qemu. '
>> +                             f'Default: "{default_cmd_line}"')
>> +
>> +    mt_args_group = parser.add_mutually_exclusive_group()
>> +    mt_args_group.add_argument('--all', action='store_true',
>> +                               help='prints all available machine types (list '
>> +                                    'of machine types will be ignored). '
>> +                                    'Execution may take several minutes!')
>> +    mt_args_group.add_argument('--mt', nargs="*", type=str,
>> +                               help='list of Machine Types '
>> +                                    'that will be compared')
>> +
>> +    return parser.parse_args()
>> +
>> +
>> +# return socket_name, major version, minor version, revision
>> +def mt_comp(mt: Machine) -> Tuple[str, int, int, int]:
>> +    # none, microvm, x-remote and etc.
>> +    if '-' not in mt.name or '.' not in mt.name:
>> +        return mt.name, 0, 0, 0
>> +
>> +    socket, ver = mt.name.rsplit('-', 1)
>> +    ver_list = list(map(int, ver.split('.', 2)))
>> +    ver_list += [0] * (3 - len(ver_list))
>> +    return socket, ver_list[0], ver_list[1], ver_list[2]
>> +
>> +
>> +# construct list of machine type definitions (primarily compat_props) from QEMU
>> +def get_mt_definitions(vm: QEMUMachine) -> List[Machine]:
>> +    raw_mt_defs = vm.command('query-machines', compat_props=True)
>> +    mt_defs: List[Machine] = []
>> +    for raw_mt in raw_mt_defs:
>> +        mt_defs.append(Machine(raw_mt))
>> +
>> +    mt_defs.sort(key=mt_comp)
>> +    return mt_defs
>> +
>> +
>> +def get_req_mt(vm: QEMUMachine, args: Namespace) -> List[Machine]:
>> +    mt_defs = get_mt_definitions(vm)
>> +    if args.all:
>> +        return mt_defs
>> +
>> +    list_mt = [mt.name for mt in mt_defs]
>> +
>> +    if args.mt is None:
>> +                print('Enter machine types for comparision or use --help')
>> +                print('List of available machine types:')
>> +                print(*list_mt, sep='\n')
>> +                sys.exit(1)
>> +
>> +    for mt in args.mt:
>> +        if mt not in list_mt:
>> +            print('Wrong machine type name')
>> +            print('List of available machine types:')
>> +            print(*list_mt, sep='\n')
>> +            sys.exit(1)
>> +
>> +    requested_mt = []
>> +    for mt in mt_defs:
>> +        if mt.name in args.mt:
>> +            requested_mt.append(mt)
>> +
>> +    return requested_mt
>> +
>> +
>> +# method to iterate through all requested properties in machine definitions
>> +def get_req_props(mt_defs: list) -> Generator[Tuple[str, str], None, None]:
>> +    driver_props: Dict[str, Set[str]] = {}
>> +    for mt in mt_defs:
>> +        compat_props = mt.compat_props
>> +        for driver, prop in compat_props.items():
>> +            if driver not in driver_props:
>> +                driver_props[driver] = set()
>> +            driver_props[driver].update(prop.keys())
>> +
>> +    for driver, props in sorted(driver_props.items()):
>> +        for prop in sorted(props):
>> +            yield driver, prop
>> +
>> +
>> +def transform_value(value: str) -> Union[str, bool]:
>> +    true_list = ['true', 'on']
>> +    false_list = ['false', 'off']
>> +
>> +    out = value.lower()
>> +
>> +    if out in true_list:
>> +        return True
>> +
>> +    if out in false_list:
>> +        return False
>> +
>> +    return out
>> +
>> +
>> +def transform_number(value: str) -> Union[int, None]:
>> +    try:
>> +        # C doesn't work with underscore ('2_5' != 25)
>> +        if '_' in value:
>> +            raise ValueError
>> +
>> +        return int(value, 0)
>> +
>> +    except ValueError:
>> +        return None
>> +
>> +
>> +# delete rows with the same values for all mt and transform values to make it
>> +# easier to compare
>> +def transform_table(table: Dict, mt_names: List[str]) -> pd.DataFrame:
>> +    new_table: Dict[str, List] = {}
>> +    for full_prop_name, prop_values in table.items():
>> +        new_row: List[Any] = []
>> +        all_values = set()
>> +        # original number format if not all values are the same in the row
>> +        numeric_values = set()
>> +        for mt_prop_val in prop_values:
>> +            if type(mt_prop_val) is list:
>> +                transformed_val_list = list(map(transform_value, mt_prop_val))
>> +                if len(transformed_val_list) == 1:
>> +                    new_row.append(transformed_val_list[0])
>> +                else:
>> +                    new_row.append(transformed_val_list)
>> +
>> +                numeric_values.update(set(map(transform_number, mt_prop_val)))
>> +                all_values.update(set(transformed_val_list))
>> +            else:
>> +                transformed_val = transform_value(mt_prop_val)
>> +                new_row.append(transformed_val)
>> +                numeric_values.add(transform_number(mt_prop_val))
>> +                all_values.add(transformed_val)
>> +
>> +        if len(mt_names) > 1:
>> +            if len(all_values) == 1:
>> +                continue
>> +
>> +            if None not in numeric_values and len(numeric_values) == 1:
>> +                continue
>> +
>> +        new_table[full_prop_name] = new_row
>> +
>> +    return pd.DataFrame.from_dict(new_table, orient='index', columns=mt_names)
>> +
>> +
>> +def fill_prop_table(mt_list: List[Machine],
>> +                    qemu_drivers: DriverDefinitions,
>> +                    is_raw: bool) -> pd.DataFrame:
>> +    table: Dict[str, List] = {}
>> +    for driver, prop in get_req_props(mt_list):
>> +        name = f'{driver}:{prop}'
>> +        table[name] = []
>> +        for mt in mt_list:
>> +            if driver in mt.compat_props:
>> +                # values from QEMU machine type definitions
>> +                if prop in mt.compat_props[driver]:
>> +                    table[name].append(mt.compat_props[driver][prop])
>> +                    continue
>> +
>> +            # values from QEMU type definitions
>> +            qemu_drivers.add_prop_value(driver, prop, table[name])
>> +
>> +    headers = [mt.name for mt in mt_list]
>> +
>> +    if is_raw:
>> +        return pd.DataFrame.from_dict(table, orient='index', columns=headers)
>> +
>> +    return transform_table(table, headers)
>> +
>> +
>> +def print_table(table: pd.DataFrame, table_format: str) -> None:
>> +    if table_format == 'json':
>> +        print(comp_table.to_json())
>> +    elif table_format == 'csv':
>> +        print(comp_table.to_csv())
>> +    else:
>> +        print(tabulate(comp_table, showindex=True, stralign='center',
>> +                       colalign=('left',), tablefmt='fancy_grid',
>> +                       headers='keys', disable_numparse=True))
>> +
>> +
>> +if __name__ == '__main__':
>> +    args = parse_args()
>> +    qemu_arg_list = args.cmd_line.split(' ')
>> +    with QEMUMachine(binary=qemu_arg_list[0],
>> +                     qmp_timer=15, args=qemu_arg_list[1:]) as vm:
>> +        vm.launch()
>> +
>> +        req_mt = get_req_mt(vm, args)
>> +        qemu_drivers = DriverDefinitions(vm, qemu_default_method,
>> +                                         qemu_property_methods)
>> +        comp_table = fill_prop_table(req_mt, qemu_drivers, args.raw)
>> +        print_table(comp_table, args.format)
>> +
>> +        vm.shutdown()
>> --
>> 2.25.1
>>
-- 
Best regards,
Maksim Davydov


