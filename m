Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFD440DFD
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 12:57:34 +0100 (CET)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh9Su-0001QW-94
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 07:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mh9Rt-0000kb-UC
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 07:56:29 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mh9Rq-0001P1-9A
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 07:56:29 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hhvdg00F6zbmhX;
 Sun, 31 Oct 2021 19:51:34 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sun, 31 Oct 2021 19:56:17 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sun, 31 Oct 2021 19:56:16 +0800
Subject: Re: [PATCH 4/4] hw/core: Restrict hotplug to system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211028150521.1973821-1-philmd@redhat.com>
 <20211028150521.1973821-5-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5663b2dc-9e9c-761d-0cae-97e56cedba3b@huawei.com>
Date: Sun, 31 Oct 2021 19:56:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211028150521.1973821-5-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 2021/10/28 23:05, Philippe Mathieu-Daudé wrote:
> Restrict hotplug to system emulation, add stubs for the other uses.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/core/hotplug-stubs.c | 34 ++++++++++++++++++++++++++++++++++
>   hw/core/meson.build     | 12 ++++++++++--
>   2 files changed, 44 insertions(+), 2 deletions(-)
>   create mode 100644 hw/core/hotplug-stubs.c
>
> diff --git a/hw/core/hotplug-stubs.c b/hw/core/hotplug-stubs.c
> new file mode 100644
> index 00000000000..7aadaa29bd5
> --- /dev/null
> +++ b/hw/core/hotplug-stubs.c
> @@ -0,0 +1,34 @@
> +/*
> + * Hotplug handler stubs
> + *
> + * Copyright (c) Red Hat
Same as patch #3.
> + *
> + * Authors:
> + *  Philippe Mathieu-Daudé <philmd@redhat.com>,
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "hw/qdev-core.h"
> +
> +HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev)
> +{
> +    return NULL;
> +}
> +
> +void hotplug_handler_pre_plug(HotplugHandler *plug_handler,
> +                              DeviceState *plugged_dev,
> +                              Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> +
> +void hotplug_handler_plug(HotplugHandler *plug_handler,
> +                          DeviceState *plugged_dev,
> +                          Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 85f2ad1374b..afc5ed2c906 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -1,7 +1,6 @@
>   # core qdev-related obj files, also used by *-user and unit tests
>   hwcore_ss.add(files(
>     'bus.c',
> -  'hotplug.c',
>     'qdev-properties.c',
>     'qdev.c',
>     'reset.c',
> @@ -11,8 +10,17 @@
>     'irq.c',
>     'clock.c',
>     'qdev-clock.c',
> -  'qdev-hotplug.c',
>   ))
> +if have_system
> +  hwcore_ss.add(files(
> +    'hotplug.c',
> +    'qdev-hotplug.c',
> +  ))
> +else
> +  hwcore_ss.add(files(
> +    'hotplug-stubs.c',
> +  ))
> +endif
>   
>   common_ss.add(files('cpu-common.c'))
>   softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
Besides,
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

