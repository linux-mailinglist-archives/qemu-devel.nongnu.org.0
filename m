Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0147A35E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 02:51:03 +0100 (CET)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mz7pO-0005s5-Et
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 20:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz7mn-0003WT-CA; Sun, 19 Dec 2021 20:48:21 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mz7ml-0003EL-ID; Sun, 19 Dec 2021 20:48:20 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JHMpt24g6zZdhh;
 Mon, 20 Dec 2021 09:45:10 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 09:48:15 +0800
Subject: Re: [PATCH v2 2/5] hw/qdev: Correct qdev_init_gpio_out_named()
 documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, <qemu-trivial@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
 <20211218130437.1516929-3-f4bug@amsat.org>
Message-ID: <4f304da4-88ca-f5b9-a09c-458656c2321f@huawei.com>
Date: Mon, 20 Dec 2021 09:48:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211218130437.1516929-3-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
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
> qdev_init_gpio_out_named() is described as qdev_init_gpio_out(),
> and referring to itself in an endless loop, which is confusing. Fix.
>
> Reported-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/qdev-core.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 59a822ffceb..dcf20c69b89 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -621,7 +621,7 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
>   void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
>   
>   /**
> - * qdev_init_gpio_out: create an array of named output GPIO lines
> + * qdev_init_gpio_out_named: create an array of named output GPIO lines
>    * @dev: Device to create output GPIOs for
>    * @pins: Pointer to qemu_irq or qemu_irq array for the GPIO lines
>    * @name: Name to give this array of GPIO lines


