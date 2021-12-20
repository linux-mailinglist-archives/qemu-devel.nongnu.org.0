Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4D47A358
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 02:48:57 +0100 (CET)
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mz7nM-0003FZ-Mj
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 20:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz7jF-0000bw-01; Sun, 19 Dec 2021 20:44:41 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz7jC-0002jm-2R; Sun, 19 Dec 2021 20:44:40 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JHMnh5cN6zcbvN;
 Mon, 20 Dec 2021 09:44:08 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 09:44:29 +0800
Subject: Re: [PATCH v2 1/5] hw/qdev: Cosmetic around documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, <qemu-trivial@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
 <20211218130437.1516929-2-f4bug@amsat.org>
Message-ID: <dfe11870-de06-2b9b-b3a3-1da5fa549bef@huawei.com>
Date: Mon, 20 Dec 2021 09:44:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211218130437.1516929-2-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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


On 2021/12/18 21:04, Philippe Mathieu-Daudé wrote:
> Add empty lines to have a clearer distinction between different
> functions declarations.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/qdev-core.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 20d3066595e..59a822ffceb 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -321,6 +321,7 @@ compat_props_add(GPtrArray *arr,
>    * The returned object has a reference count of 1.
>    */
>   DeviceState *qdev_new(const char *name);
> +
>   /**
>    * qdev_try_new: Try to create a device on the heap
>    * @name: device type to create
> @@ -329,6 +330,7 @@ DeviceState *qdev_new(const char *name);
>    * does not exist, rather than asserting.
>    */
>   DeviceState *qdev_try_new(const char *name);
> +
>   /**
>    * qdev_realize: Realize @dev.
>    * @dev: device to realize
> @@ -347,6 +349,7 @@ DeviceState *qdev_try_new(const char *name);
>    * qdev_realize_and_unref() instead.
>    */
>   bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
> +
>   /**
>    * qdev_realize_and_unref: Realize @dev and drop a reference
>    * @dev: device to realize
> @@ -372,6 +375,7 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
>    * would be incorrect. For that use case you want qdev_realize().
>    */
>   bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
> +
>   /**
>    * qdev_unrealize: Unrealize a device
>    * @dev: device to unrealize
> @@ -450,6 +454,7 @@ typedef enum {
>    * For named input GPIO lines, use qdev_get_gpio_in_named().
>    */
>   qemu_irq qdev_get_gpio_in(DeviceState *dev, int n);
> +
>   /**
>    * qdev_get_gpio_in_named: Get one of a device's named input GPIO lines
>    * @dev: Device whose GPIO we want
> @@ -497,6 +502,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
>    * For named output GPIO lines, use qdev_connect_gpio_out_named().
>    */
>   void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
> +
>   /**
>    * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
>    * @dev: Device whose GPIO to connect
> @@ -524,6 +530,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
>    */
>   void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
>                                    qemu_irq pin);
> +
>   /**
>    * qdev_get_gpio_out_connector: Get the qemu_irq connected to an output GPIO
>    * @dev: Device whose output GPIO we are interested in
> @@ -541,6 +548,7 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
>    * by the platform-bus subsystem.
>    */
>   qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
> +
>   /**
>    * qdev_intercept_gpio_out: Intercept an existing GPIO connection
>    * @dev: Device to intercept the outbound GPIO line from
> @@ -582,6 +590,7 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
>    * hold of an input GPIO line to manipulate it.
>    */
>   void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
> +
>   /**
>    * qdev_init_gpio_out: create an array of anonymous output GPIO lines
>    * @dev: Device to create output GPIOs for
> @@ -610,6 +619,7 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
>    * handler.
>    */
>   void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
> +
>   /**
>    * qdev_init_gpio_out: create an array of named output GPIO lines
>    * @dev: Device to create output GPIOs for
> @@ -623,6 +633,7 @@ void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
>    */
>   void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
>                                 const char *name, int n);
> +
>   /**
>    * qdev_init_gpio_in_named_with_opaque: create an array of input GPIO lines
>    *   for the specified device


