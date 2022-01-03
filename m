Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D974482F54
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 10:19:42 +0100 (CET)
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4JVE-0000V1-JQ
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 04:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4JRI-0005zL-Bs
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 04:15:37 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4JRE-0003Lz-Fb
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 04:15:36 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JS97G3Q4GzcbTM;
 Mon,  3 Jan 2022 17:14:50 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 17:15:22 +0800
Subject: Re: [PATCH 1/3] hw/qdev: Restrict qdev_get_gpio_out_connector() to
 qdev-internal.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211229225206.171882-1-philmd@redhat.com>
 <20211229225206.171882-2-philmd@redhat.com>
 <8bf1a23a-7e3e-538b-3854-629545a98089@huawei.com>
 <d09675d0-b7fa-7484-22fa-e02a1655bcb0@redhat.com>
Message-ID: <7edb5d8a-9dd4-419f-4dee-6e06a52136f0@huawei.com>
Date: Mon, 3 Jan 2022 17:15:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d09675d0-b7fa-7484-22fa-e02a1655bcb0@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>


On 2021/12/31 20:11, Philippe Mathieu-Daudé wrote:
> On 12/31/21 08:30, wangyanan (Y) wrote:
>> Hi,
>>
>> On 2021/12/30 6:52, Philippe Mathieu-Daudé wrote:
>>> qdev_get_gpio_out_connector() is called by sysbus_get_connected_irq()
>>> which is only used by platform-bus.c; restrict it to hw/core/ by
>>> adding a local "qdev-internal.h" header.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    hw/core/qdev-internal.h | 15 +++++++++++++++
>>>    include/hw/qdev-core.h  | 18 ------------------
>>>    hw/core/gpio.c          |  1 +
>>>    hw/core/sysbus.c        |  1 +
>>>    4 files changed, 17 insertions(+), 18 deletions(-)
>>>    create mode 100644 hw/core/qdev-internal.h
>>>
>>> diff --git a/hw/core/qdev-internal.h b/hw/core/qdev-internal.h
>>> new file mode 100644
>>> index 00000000000..6ec17d0ea70
>>> --- /dev/null
>>> +++ b/hw/core/qdev-internal.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * qdev internal helpers
>>> + *
>>> + * Copyright (c) 2009-2021 QEMU contributors
>>> + */
>>> +#ifndef HW_CORE_QDEV_INTERNAL_H
>>> +#define HW_CORE_QDEV_INTERNAL_H
>>> +
>>> +#include "hw/qdev-core.h"
>>> +
>>> +/* Following functions are only used by the platform-bus subsystem */
>> Could it be better to also keep the original function comment here?
> We could, but this include being now internal, it seems superfluous.
Ok, makes sense to me. :)

Thanks,
Yanan
> Since Peter documented this function, let see if he has an preference.
>
>>> +qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char
>>> *name, int n);
>>> +
>>> +#endif /* HW_CORE_QDEV_INTERNAL_H */
>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>> index d19c9417520..655899654bb 100644
>>> --- a/include/hw/qdev-core.h
>>> +++ b/include/hw/qdev-core.h
>>> @@ -532,24 +532,6 @@ void qdev_connect_gpio_out(DeviceState *dev, int
>>> n, qemu_irq pin);
>>>    void qdev_connect_gpio_out_named(DeviceState *dev, const char *name,
>>> int n,
>>>                                     qemu_irq input_pin);
>>>    -/**
>>> - * qdev_get_gpio_out_connector: Get the qemu_irq connected to an
>>> output GPIO
>>> - * @dev: Device whose output GPIO we are interested in
>>> - * @name: Name of the output GPIO array
>>> - * @n: Number of the output GPIO line within that array
>>> - *
>>> - * Returns whatever qemu_irq is currently connected to the specified
>>> - * output GPIO line of @dev. This will be NULL if the output GPIO line
>>> - * has never been wired up to the anything.  Note that the qemu_irq
>>> - * returned does not belong to @dev -- it will be the input GPIO or
>>> - * IRQ of whichever device the board code has connected up to @dev's
>>> - * output GPIO.
>>> - *
>>> - * You probably don't need to use this function -- it is used only
>>> - * by the platform-bus subsystem.
>>> - */
>>> -qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char
>>> *name, int n);
>>> -
>>>    /**
>>>     * qdev_intercept_gpio_out: Intercept an existing GPIO connection
>>>     * @dev: Device to intercept the outbound GPIO line from
>>> diff --git a/hw/core/gpio.c b/hw/core/gpio.c
>>> index 80d07a6ec99..513ccbd1062 100644
>>> --- a/hw/core/gpio.c
>>> +++ b/hw/core/gpio.c
>>> @@ -21,6 +21,7 @@
>>>    #include "hw/qdev-core.h"
>>>    #include "hw/irq.h"
>>>    #include "qapi/error.h"
>>> +#include "qdev-internal.h"
>>>      static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
>>>                                                   const char *name)
>>> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
>>> index 05c1da3d311..0e6773c8df7 100644
>>> --- a/hw/core/sysbus.c
>>> +++ b/hw/core/sysbus.c
>>> @@ -23,6 +23,7 @@
>>>    #include "hw/sysbus.h"
>>>    #include "monitor/monitor.h"
>>>    #include "exec/address-spaces.h"
>>> +#include "qdev-internal.h"
>>>      static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int
>>> indent);
>>>    static char *sysbus_get_fw_dev_path(DeviceState *dev);
>> Otherwise, the tweak looks reasonable:
>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> Thanks,
>
> Phil.
>
> .


