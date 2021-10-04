Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02594208D7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:57:01 +0200 (CEST)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKiS-0000dS-NV
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXKGs-0004yI-F6
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:28:31 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXKGq-0002kV-9m
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:28:30 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvbO4-1mpHA72ccA-00seR9; Mon, 04 Oct 2021 11:28:25 +0200
Subject: Re: [PATCH 12/12] q800: wire macfb IRQ to separate video interrupt on
 VIA2
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-13-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <dd154c1c-2b27-2f24-3bda-811e13d7dbbe@vivier.eu>
Date: Mon, 4 Oct 2021 11:28:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C+dKj6FWDz6Hrb6YPlDGKup6CIdJRc2AWs2FIHfpogjCApbxhwT
 KLYA3FxYLebfHOh7IbVhkT8o/bqwIEOUP+lO5AfU/nDx9FdnWhAptR9mjfCSd+Ol+YVi3Z4
 lBpHbIMUUd8CBSXuzoHYxbV/Me7ybaqpUCFml5etDCPdmt5obG7+9/YP4DMUADqtQO7W1/8
 Be+U95hS7fOEuwpuV8Inw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O6LxHyIX3WU=:X6LWcK2q1RM6j4ZCb3kEK6
 VQs6ZI4xtt0oAW+q2yzii5sFdwoUO7MyN+HtR1xyI8voHERVmE3YFTX9M6LyZaqDsYc9lnJdL
 1hK56L0Qpnsf9LOhn0mdI1abfuNGAbfdnIWYk3sv7nCoeur2b8EpJ16edTx2G6HKnuSLUwss2
 lQmT8QA1vWqPssyRFl2iMlwie8jxHT6mLLQkzA7V4J+bCb3ZL4QRVWIBbpETnAPj2ATuSpFw0
 w0GIUEIEHqXR/RV3XZH353An8GbzuShPSAFkq4SqC74QaPJnG9s7UFum4SLvRlcASG3USCMVB
 8qfvaxKAP6ElbibcQmra3kbDfCwLgSalKeaxdgVXxjUFBIaebfg+wPLX4uTEOTEm/Pc/8k3E6
 y3rfYbwcmVJq9zbFk6zDcoBIQeGGGMq9gTQ26aAwFaJSlydqT7neFGk7PeoY9YOe4ym/kLYSr
 o1ytdimkvNQO3PUhcelbCY54F3ahJlFyrmRQobSWipA6h2odoJDfvRtXAXL9BQCIuyXbMeJ1B
 1jYV2bDakToeA2KgFBArjhPOU10/xJ1uiCyFxzk4JfVBxcVsSTabV/zteHTYHcOpWQrhPWa42
 eaiYT5GzOEcV57lcwDaTB89JSf8BClctVI+3I8wMyomYMjExDHj4sbOM+jK/W3C02/tzQxEHM
 uudqFB/l8SbGbVi80In7lIvfsZ9AJN2ZjzYTbyW6XwqI/x5FYKq/DNfsOo4WeJRyhldc2Jd2X
 5716GcbVeYMozOwVps14WKRCz2mPLzO9veS6zw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/10/2021 à 13:00, Mark Cave-Ayland a écrit :
> Whilst the in-built Quadra 800 framebuffer exists within the Nubus address
> space for slot 9, it has its own dedicated interrupt on VIA2. Force the
> macfb device to occupy slot 9 in the q800 machine and wire its IRQ to the
> separate video interrupt since this is what is expected by the MacOS
> interrupt handler.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index df3fd3711e..fd4855047e 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -407,8 +407,10 @@ static void q800_init(MachineState *machine)
>                      MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
>                      MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
> -
> -    for (i = 0; i < VIA2_NUBUS_IRQ_NB; i++) {
> +    qdev_connect_gpio_out(dev, 9,
> +                          qdev_get_gpio_in_named(via2_dev, "nubus-irq",
> +                          VIA2_NUBUS_IRQ_INTVIDEO));
> +    for (i = 1; i < VIA2_NUBUS_IRQ_NB; i++) {
>          qdev_connect_gpio_out(dev, 9 + i,
>                                qdev_get_gpio_in_named(via2_dev, "nubus-irq",
>                                                       VIA2_NUBUS_IRQ_9 + i));
> @@ -419,6 +421,7 @@ static void q800_init(MachineState *machine)
>      /* framebuffer in nubus slot #9 */
>  
>      dev = qdev_new(TYPE_NUBUS_MACFB);
> +    qdev_prop_set_uint32(dev, "slot", 9);
>      qdev_prop_set_uint32(dev, "width", graphic_width);
>      qdev_prop_set_uint32(dev, "height", graphic_height);
>      qdev_prop_set_uint8(dev, "depth", graphic_depth);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

