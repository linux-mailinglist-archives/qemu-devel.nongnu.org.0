Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572D446C3D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 04:36:32 +0100 (CET)
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjCVL-0004oN-DU
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 23:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjCU8-0003tL-KZ; Fri, 05 Nov 2021 23:35:16 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mjCU5-0001V4-B2; Fri, 05 Nov 2021 23:35:16 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HmNDR4ljhzcZxw;
 Sat,  6 Nov 2021 11:30:15 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 11:35:02 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 11:35:01 +0800
Subject: Re: [PATCH 3/3] hw/input/pckbd: Rename i8042_setup_a20_line() and its
 a20 irq argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20211105172127.224462-1-f4bug@amsat.org>
 <20211105172127.224462-4-f4bug@amsat.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <9cf31ee0-8a2f-c1b0-df4e-fcfc25df287a@huawei.com>
Date: Sat, 6 Nov 2021 11:35:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211105172127.224462-4-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
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
> 'a20_out' is an input IRQ, rename it as 'a20_input'.
> i8042_setup_a20_line() doesn't take a Device parameter
> but an ISADevice one. Rename it as i8042_isa_*() to
> make it explicit.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/input/i8042.h | 2 +-
>   hw/i386/pc.c             | 2 +-
>   hw/input/pckbd.c         | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
> index 1d90432daef..3534fcc4b43 100644
> --- a/include/hw/input/i8042.h
> +++ b/include/hw/input/i8042.h
> @@ -21,6 +21,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>                      MemoryRegion *region, ram_addr_t size,
>                      hwaddr mask);
>   void i8042_isa_mouse_fake_event(ISAKBDState *isa);
> -void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
> +void i8042_isa_setup_a20_line(ISADevice *dev, qemu_irq a20_input);
>   
>   #endif /* HW_INPUT_I8042_H */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2592a821486..06ef74ca22b 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1043,7 +1043,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
>       port92 = isa_create_simple(isa_bus, TYPE_PORT92);
>   
>       a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
> -    i8042_setup_a20_line(i8042, a20_line[0]);
> +    i8042_isa_setup_a20_line(i8042, a20_line[0]);
>       qdev_connect_gpio_out_named(DEVICE(port92),
>                                   PORT92_A20_LINE, 0, a20_line[1]);
>       g_free(a20_line);
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index baba62f357a..7b842c8f3b5 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -680,9 +680,9 @@ void i8042_isa_mouse_fake_event(ISAKBDState *isa)
>       ps2_mouse_fake_event(s->mouse);
>   }
>   
> -void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
> +void i8042_isa_setup_a20_line(ISADevice *dev, qemu_irq a20_input)
>   {
> -    qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
> +    qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_input);
>   }
>   
>   static const VMStateDescription vmstate_kbd_isa = {
Looks reasonable:
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

