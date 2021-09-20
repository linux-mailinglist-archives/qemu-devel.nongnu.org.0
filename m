Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C576412897
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:59:45 +0200 (CEST)
Received: from localhost ([::1]:43908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRKC-00039G-Ih
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR1o-0003Hy-AM
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:40:45 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR1l-0006Xi-G5
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:40:43 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mgvj1-1n52Qf0ClB-00hQ08; Mon, 20 Sep 2021 23:40:40 +0200
Subject: Re: [PATCH v4 18/20] nubus: add support for slot IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-19-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7a664003-458e-7a83-9dda-1cab904974fd@vivier.eu>
Date: Mon, 20 Sep 2021 23:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-19-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cG9DzaH5vudeBzdLbTc967Pw3WWwqT4BfMvoXfeeVMyzWDXoBHl
 /p7Z8Z5NUNa0GOa8QFJBiJeynGmW3IH2TzdK6qo3PQ7YTwU0XZa90Ga3vCT87FOUPSl5512
 6+39toG7qlyAO9KT7ux/kI2pA7NlBlQWkfHlJ0kMcNWF5xxgrhCHtHUEPfanLk3rkDRECqr
 ItLq4/n/0v6Zi4AT5Il2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AK5O4eHMVYc=:ET5kTZTCGfby3c3uKr8Niu
 h0UmggGJKl9bXY7ze7MCUaVuQjToYFmYy8EpkKx8KX+a/QJw3j56dB8g5tsi6ybIP7jj5tAtN
 fxx5sKerRmyk0TQxC0W9w+tKa2GJh2WII0l7kcd3CM7HKqpvt300n3A6fp8i/uB+KVHGblS+m
 qcQL3ZpKjhPo6wI9tneU0F+muroUMfgXY6jYP9Kik5ay8N2JBo/L+CDvb+iDCdpUI6QyIugqC
 300H3VxvVAeHNAw0yFNInnRV/TXLUJBs40/FuQDICY1tSTnqvOfYwFcSP4camgPIkYKgo3sPi
 +PlGcAV14g5XWW5nkSOquZM2oZ2r+LFUNDk7Hb5Z+fUABfxAbPAt/1+G3CHxzP44ImysvH8H5
 ZfOsFXSwO+g+zu7WpgW7gY45E0klsZtCBiX+EGa/XsIKJNDLBtZKrCqxE7Tcu0haTwj+FEbIC
 xr0c/CATTk8hLd90U3WI6HhvwN5ifSpC+uI5xny29xIOyroTUO3PMIds8hNLgDZfMh70Y2EB/
 q7bfiELP+6smCwF8dKzcaOOsMqQAvjxgCihD4M/jxVEbiTYpTyN+Yh4w/pVjjmDQGIw0id2xe
 En5mQ01nncfo1Xbo2cdkmbyDieY4gwHoJAtJvj1Aweimfp8Lx4k/OvEJTHHE3L605U9mwGfep
 lqKUa6s4Ofu68HflZ9y5rXaYpb91vTMmwDF6pP9L7yhb/Gs/cTBtCQ7JKKxn7AZexbXSzkVW5
 0O12BtvOjCZBX8ewlSpKVrkzSpXqaCVU7dukPw==
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

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> Each Nubus slot has an IRQ line that can be used to request service from the
> CPU. Connect the IRQs to the Nubus bridge so that they can be wired up using qdev
> gpios accordingly, and introduce a new nubus_set_irq() function that can be used
> by Nubus devices to control the slot IRQ.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bridge.c  | 2 ++
>  hw/nubus/nubus-device.c  | 8 ++++++++
>  include/hw/nubus/nubus.h | 6 ++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
> index 2c7c4ee121..0366d925a9 100644
> --- a/hw/nubus/nubus-bridge.c
> +++ b/hw/nubus/nubus-bridge.c
> @@ -19,6 +19,8 @@ static void nubus_bridge_init(Object *obj)
>      NubusBus *bus = &s->bus;
>  
>      qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
> +
> +    qdev_init_gpio_out(DEVICE(s), bus->irqs, NUBUS_IRQS);
>  }
>  
>  static Property nubus_bridge_properties[] = {
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 9cecb487a1..4856e81991 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -10,12 +10,20 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/datadir.h"
> +#include "hw/irq.h"
>  #include "hw/loader.h"
>  #include "hw/nubus/nubus.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  
>  
> +void nubus_set_irq(NubusDevice *nd, int level)
> +{
> +    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
> +
> +    qemu_set_irq(nubus->irqs[nd->slot], level);
> +}
> +
>  static void nubus_device_realize(DeviceState *dev, Error **errp)
>  {
>      NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index cf9a585a91..1c487f74ac 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -25,6 +25,8 @@
>  #define NUBUS_FIRST_SLOT      0x0
>  #define NUBUS_LAST_SLOT       0xf
>  
> +#define NUBUS_IRQS            16
> +
>  #define TYPE_NUBUS_DEVICE "nubus-device"
>  OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
>  
> @@ -44,6 +46,8 @@ struct NubusBus {
>      MemoryRegion slot_io;
>  
>      uint32_t slot_available_mask;
> +
> +    qemu_irq irqs[NUBUS_IRQS];
>  };
>  
>  #define NUBUS_DECL_ROM_MAX_SIZE    (128 * KiB)
> @@ -59,6 +63,8 @@ struct NubusDevice {
>      MemoryRegion decl_rom;
>  };
>  
> +void nubus_set_irq(NubusDevice *nd, int level);
> +
>  struct NubusBridge {
>      SysBusDevice parent_obj;
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

