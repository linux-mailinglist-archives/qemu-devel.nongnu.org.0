Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBA446C32
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 04:08:15 +0100 (CET)
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjC3x-0003fC-NG
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 23:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjC2s-0002ox-47; Fri, 05 Nov 2021 23:07:06 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjC2c-0007ai-3I; Fri, 05 Nov 2021 23:07:05 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HmMfr1R8mz1DJBd;
 Sat,  6 Nov 2021 11:04:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 11:06:44 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 11:06:43 +0800
Subject: Re: [PATCH 1/3] hw/qdev: Correct qdev_connect_gpio_out_named()
 documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20211105172127.224462-1-f4bug@amsat.org>
 <20211105172127.224462-2-f4bug@amsat.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5627bdf4-c2bb-21fe-8257-07502af05cbe@huawei.com>
Date: Sat, 6 Nov 2021 11:06:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211105172127.224462-2-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 2021/11/6 1:21, Philippe Mathieu-Daudé wrote:
> qdev_connect_gpio_out_named() is described as qdev_connect_gpio_out(),
> and referring to itself in an endless loop, which is confusing. Fix.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/qdev-core.h | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 72622bd3370..5b88c8b9dd3 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -497,7 +497,8 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
>    */
>   void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
>   /**
> - * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
> + * qdev_connect_gpio_out_named: Connect one of a device's named output
> + *                              GPIO lines
>    * @dev: Device whose GPIO to connect
>    * @name: Name of the output GPIO array
>    * @n: Number of the anonymous output GPIO line (which must be in range)
> @@ -518,8 +519,6 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
>    * It is not valid to try to connect one outbound GPIO to multiple
>    * qemu_irqs at once, or to connect multiple outbound GPIOs to the
>    * same qemu_irq; see qdev_connect_gpio_out() for details.
> - *
> - * For named output GPIO lines, use qdev_connect_gpio_out_named().
After deleting the wrong context, we can also add the right one, like:
"For anonymous output GPIO lines, use qdev_connect_gpio_out()."
>    */
>   void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
>                                    qemu_irq pin);
Having a further, the description of qdev_init_gpio_out_named() also needs
a tweak. Maybe we can squash that fix in this patch too.

Thanks,
Yanan


