Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFE446C35
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 04:24:10 +0100 (CET)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjCJN-0000xm-98
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 23:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjCGf-0007Uv-GI; Fri, 05 Nov 2021 23:21:22 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjCGc-0004mb-0t; Fri, 05 Nov 2021 23:21:21 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HmMzS3khNzZcdt;
 Sat,  6 Nov 2021 11:19:00 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 11:21:09 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 11:21:08 +0800
Subject: Re: [PATCH 2/3] hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin'
 parameter
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20211105172127.224462-1-f4bug@amsat.org>
 <20211105172127.224462-3-f4bug@amsat.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <6fc3573e-ebe8-cb23-3105-6972dbdf7203@huawei.com>
Date: Sat, 6 Nov 2021 11:21:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211105172127.224462-3-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 2021/11/6 1:21, Philippe Mathieu-Daudé wrote:
> @pin is an input where we connect a device output.
> Rename it @input_pin to simplify the documentation.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/qdev-core.h |  8 ++++----
>   hw/core/gpio.c         | 13 +++++++------
>   2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 5b88c8b9dd3..3a0fe643a73 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -470,7 +470,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
>    * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
>    * @dev: Device whose GPIO to connect
>    * @n: Number of the anonymous output GPIO line (which must be in range)
> - * @pin: qemu_irq to connect the output line to
> + * @input_pin: qemu_irq to connect the output line to
>    *
>    * This function connects an anonymous output GPIO line on a device
>    * up to an arbitrary qemu_irq, so that when the device asserts that
> @@ -495,14 +495,14 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
>    *
>    * For named output GPIO lines, use qdev_connect_gpio_out_named().
>    */
> -void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
> +void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq input_pin);
>   /**
>    * qdev_connect_gpio_out_named: Connect one of a device's named output
>    *                              GPIO lines
>    * @dev: Device whose GPIO to connect
>    * @name: Name of the output GPIO array
>    * @n: Number of the anonymous output GPIO line (which must be in range)
> - * @pin: qemu_irq to connect the output line to
> + * @input_pin: qemu_irq to connect the output line to
>    *
>    * This function connects an anonymous output GPIO line on a device
>    * up to an arbitrary qemu_irq, so that when the device asserts that
> @@ -521,7 +521,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
>    * same qemu_irq; see qdev_connect_gpio_out() for details.
>    */
>   void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
> -                                 qemu_irq pin);
> +                                 qemu_irq input_pin);
>   /**
>    * qdev_get_gpio_out_connector: Get the qemu_irq connected to an output GPIO
>    * @dev: Device whose output GPIO we are interested in
> diff --git a/hw/core/gpio.c b/hw/core/gpio.c
> index 8e6b4f5edf3..80d07a6ec99 100644
> --- a/hw/core/gpio.c
> +++ b/hw/core/gpio.c
> @@ -115,17 +115,18 @@ qemu_irq qdev_get_gpio_in(DeviceState *dev, int n)
>   }
>   
>   void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
> -                                 qemu_irq pin)
> +                                 qemu_irq input_pin)
>   {
>       char *propname = g_strdup_printf("%s[%d]",
>                                        name ? name : "unnamed-gpio-out", n);
> -    if (pin && !OBJECT(pin)->parent) {
> +    if (input_pin && !OBJECT(input_pin)->parent) {
>           /* We need a name for object_property_set_link to work */
>           object_property_add_child(container_get(qdev_get_machine(),
>                                                   "/unattached"),
> -                                  "non-qdev-gpio[*]", OBJECT(pin));
> +                                  "non-qdev-gpio[*]", OBJECT(input_pin));
>       }
> -    object_property_set_link(OBJECT(dev), propname, OBJECT(pin), &error_abort);
> +    object_property_set_link(OBJECT(dev), propname,
> +                             OBJECT(input_pin), &error_abort);
>       g_free(propname);
>   }
>   
> @@ -165,9 +166,9 @@ qemu_irq qdev_intercept_gpio_out(DeviceState *dev, qemu_irq icpt,
>       return disconnected;
>   }
>   
> -void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin)
> +void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq input_pin)
>   {
> -    qdev_connect_gpio_out_named(dev, NULL, n, pin);
> +    qdev_connect_gpio_out_named(dev, NULL, n, input_pin);
>   }
>   
>   void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

