Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04262187C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQfX-000307-Ku; Tue, 08 Nov 2022 10:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osQfP-0002x0-2W
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:37:35 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osQfL-0003Ti-6L
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:37:34 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 86E4A60C97;
 Tue,  8 Nov 2022 18:37:11 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 aA2YMOueop-b9Ne7jkE; Tue, 08 Nov 2022 18:37:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667921830; bh=Fc0m2pjA4MZ8WKveqBWvppYXjLlkU7uQX+iSlGoNB9Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Ur1gSvwl6O8B75KC1VwtnhKEZSQXGn4daboKxyodhRLN2WtZCy+ReR6PJGg+5vxdm
 AgMBsZdYsgACIizt4Av5s5Kkn8SfYjctvyT2g18pnNitM+4i8liXlG31DYQfK3TCGB
 X9bY8QBBhUpaFVB9bfz2440B1zL5SSsxh18hnXow=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a0a1aa51-5f85-868f-5177-969b8cd95591@yandex-team.ru>
Date: Tue, 8 Nov 2022 18:37:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 4/4] scripts: add script to compare compatible
 properties
Content-Language: en-US
To: Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, jsnow@redhat.com, crosa@redhat.com,
 bleal@redhat.com, eblake@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, alxndr@bu.edu, bsd@redhat.com, stefanha@redhat.com,
 thuth@redhat.com, darren.kenny@oracle.com, Qiuhao.Li@outlook.com,
 lvivier@redhat.com
References: <20221103102741.11201-1-davydov-max@yandex-team.ru>
 <20221103102741.11201-5-davydov-max@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221103102741.11201-5-davydov-max@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 11/3/22 13:27, Maksim Davydov wrote:
> This script run QEMU to obtain compat_props of machines and default
> values of different types and produce appropriate table. This table
> can be used to compare machine types to choose the most suitable
> machine. Also this table in json or csv format should be used to check that
> new machine doesn't affect previous ones by comparing tables with and
> without new machine.
> Default values of properties are needed to fill "holes" in the table (one
> machine has these properties and another not. For instance, 2.12 mt has
> `{ "EPYC-" TYPE_X86_CPU, "xlevel", "0x8000000a" }`, but compat_pros of
> 3.1 mt doesn't have it. So, to compare these machines we need to fill
> unknown value of "EPYC-x86_64-cpu-xlevel" for 3.1 mt. This unknown value
> in the table I called "hole". To get values (default values) for these
> "holes" the script uses list of appropriate methods.)
> 
> Notes:
> * some init values from the devices can't be available like properties
>    from virtio-9p when configure has --disable-virtfs. This situations will
>    be seen in the table as "unavailable driver".
> * Default values can be obtained in an unobvious way, like x86 features.
>    If the script doesn't know how to get property default value to compare
>    one machine with another it fills "holes" with "unavailable method". This
>    is done because script uses whitelist model to get default values of
>    different types. It means that the method that can't be applied to a new
>    type that can crash this script. It is better to get an "unavailable
>    driver" when creating a new machine with new compatible properties than
>    to break this script. So it turns out a more stable and generic script.
> * If the default value can't be obtained because this property doesn't
>    exist or because this property can't have default value, appropriate
>    "hole" will be filled by "unknown property" or "no default value"
> * If the property is applied to the abstract class, the script collects
>    default values from all child classes (set of default values)
> 
> Example:
> 
> ./scripts/compare_mt.py --mt pc-q35-3.1 pc-q35-4.0
> 
> ╒═══════════════════════════════════════════════════════════╤══════════════╤════════════════════╕
> │                                                           │  pc-q35-3.1  │     pc-q35-4.0     │
> ╞═══════════════════════════════════════════════════════════╪══════════════╪════════════════════╡
> │ Cascadelake-Server-x86_64-cpu:mpx                         │     True     │       False        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Cascadelake-Server-x86_64-cpu:stepping                    │      5       │         6          │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Icelake-Client-x86_64-cpu:mpx                             │     True     │ unavailable driver │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Icelake-Server-x86_64-cpu:mpx                             │     True     │       False        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Opteron_G3-x86_64-cpu:rdtscp                              │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Opteron_G4-x86_64-cpu:rdtscp                              │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Opteron_G5-x86_64-cpu:rdtscp                              │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Skylake-Client-IBRS-x86_64-cpu:mpx                        │     True     │       False        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Skylake-Client-x86_64-cpu:mpx                             │     True     │       False        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Skylake-Server-IBRS-x86_64-cpu:mpx                        │     True     │       False        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ Skylake-Server-x86_64-cpu:mpx                             │     True     │       False        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ intel-iommu:dma-drain                                     │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ memory-backend-file:x-use-canonical-path-for-ramblock-id  │     True     │  no default value  │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ memory-backend-memfd:x-use-canonical-path-for-ramblock-id │     True     │  no default value  │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ pcie-root-port:x-speed                                    │     2_5      │         16         │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ pcie-root-port:x-width                                    │      1       │         32         │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ pcie-root-port-base:disable-acs                           │     True     │       False        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ tpm-crb:ppi                                               │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ tpm-tis:ppi                                               │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ usb-kbd:serial                                            │      42      │  no default value  │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ usb-mouse:serial                                          │      42      │  no default value  │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ usb-tablet:serial                                         │      42      │  no default value  │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ virtio-balloon-device:qemu-4-0-config-size                │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ virtio-blk-device:discard                                 │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ virtio-blk-device:write-zeroes                            │    False     │        True        │
> ├───────────────────────────────────────────────────────────┼──────────────┼────────────────────┤
> │ x86_64-cpu:x-intel-pt-auto-level                          │    False     │        True        │
> ╘═══════════════════════════════════════════════════════════╧══════════════╧════════════════════╛
> 
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> ---
>   scripts/compare_mt.py | 440 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 440 insertions(+)
>   create mode 100755 scripts/compare_mt.py
> 
> diff --git a/scripts/compare_mt.py b/scripts/compare_mt.py
> new file mode 100755
> index 0000000000..31ac86dddd
> --- /dev/null
> +++ b/scripts/compare_mt.py
> @@ -0,0 +1,440 @@
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
> +# These methods are defined below in qemu_propery_methods.
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
> +from argparse import ArgumentParser, RawTextHelpFormatter, Namespace
> +import pandas as pd
> +from typing import Callable, List, Dict, Set, Generator, Tuple, Union, Any
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
> +# Be careful:
> +# * Names should be in qom-list-types format (486-x86_64-cpu, not 486)
> +# * Specialization always wins (from 'device' and 'x86_64-cpu', 'x86_64-cpu'
> +#   will be used for '486-x86_64-cpu')
> +
> +# It's default stub for all undefined in property_methods drivers because all
> +# QEMU types are inherited from Object
> +def get_object_prop(vm: QEMUMachine, device: str, prop_name: str):

missed "-> str" ?

> +    return 'Unavailable method'
> +
> +
> +def get_device_prop(vm: QEMUMachine, device: str, prop_name: str) -> str:
> +    device_props = vm.command('device-list-properties', typename=device)

Seems, would be good to cache the result of device-list-properties to not call it for each property. May be done separately.

> +    for prop in device_props:
> +        if prop['name'] == prop_name:
> +            return str(prop.get('default-value', 'No default value'))
> +
> +    return 'Unknown property'
> +
> +
> +def get_x86_64_cpu_prop(vm: QEMUMachine, device: str, prop_name: str) -> str:
> +    # crop last 11 chars '-x86_64-cpu'

seems assert(device.endswith('-x86_64-cpu') will not hurt

> +    props = vm.command('query-cpu-model-expansion', type='full',
> +                       model={'name': device[:-11]})['model']['props']
> +    return str(props.get(prop_name, 'Unknown property'))
> +
> +
> +# Now it's stub, because all memory_backend types don't have default values
> +# but this behaviour can be changed
> +def get_memory_backend_prop(vm: QEMUMachine, driver: str,
> +                            prop_name: str) -> str:
> +    memory_backend_props = vm.command('qom-list-properties', typename=driver)
> +    for prop in memory_backend_props:
> +        if prop['name'] == prop_name:
> +            return str(prop.get('default-value', 'No default value'))
> +
> +    return 'Unknown property'
> +
> +
> +class GetPropMethod:
> +    def __init__(self, driver_name: str,
> +                 method: Callable[[QEMUMachine, str, str], str]) -> None:
> +        self.name = driver_name
> +        self.get_prop = method
> +
> +
> +qemu_property_methods = [
> +        GetPropMethod('device', get_device_prop),
> +        GetPropMethod('x86_64-cpu', get_x86_64_cpu_prop),
> +        GetPropMethod('memory-backend', get_memory_backend_prop)
> +]
> +
> +# all types in QEMU are inherited from Object

Hmm, inherited..

What do you think about the following:

class QEMUObject:
    ... (your class Driver, without set_prop_method() method)
    def get_prop(...):
       return 'Unavailable method'

class QEMUDevice(QEMUObject):
    def get_prop(...):
        <it's yours get_device_prop>

class QEMUx86Cpu(QEMUObject):
    def get_prop(...):
        <it's yours get_x86_64_cpu_prop>

class QEMUMemoryBackend(QEMUObject):
    ...


Than, a helper function to create an object of correct class:

def new_driver_obj(name, *args, **kwargs):
    if name == 'device':
        return QEMUDevice(name, *args, **kwargs)
    elif name == 'x86_64-cpu':
       ...
    else
       return QEMUObject(...)  # the default


-- 
Best regards,
Vladimir


