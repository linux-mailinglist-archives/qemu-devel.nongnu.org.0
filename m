Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014BA1B5812
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 11:24:24 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRY5n-00016v-01
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 05:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY4o-0000DE-IO
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY4o-0001Iq-0g
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 05:23:22 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY4n-0001IW-Kf; Thu, 23 Apr 2020 05:23:21 -0400
Received: by mail-wm1-x343.google.com with SMTP id h2so5630443wmb.4;
 Thu, 23 Apr 2020 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rbPW8lVCPfygWoSZ3uTJQ3EBxRTB++QSWZ7GykrKU4M=;
 b=kuW5C361u0Sh7q5tOpwQ+Ur0lNJV6cIo6ElAICt6g4/2BzFFQH6eqPO0AIGdCzKqhD
 fca3q4uLUN2rGdCr1v+0FLn/N69eJO+IqffsqL59VJwVqbbwSqk4tfafqss/qIsxP0TP
 QdBK0y0kvIuYLDsd3a6AqH3zXo9sHcRhRNmq7/SqE0Hu5edBD0x+ABLVFItWjUzKr+13
 gkD+374cGlumL9U1YGynSkHjCkfdJo/wRTkhPDadmVFxGDuFW+PrPefU8fKQi2dkKEDM
 JEc4S9WkMtNeouFclKSf0BfXmo3txRyTdggH7kiNUVn0bq7yPSom5WHhmFs0PKlfkyhl
 3RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rbPW8lVCPfygWoSZ3uTJQ3EBxRTB++QSWZ7GykrKU4M=;
 b=fOAa0e2b4URHDF6JM0iSOH61wb+l5EXtxI8EJgk6tlYO04QD79vYxHzWkdYqRbD1rC
 hjQMAanLBgp/nc4swYrvAXe508msOSKV4dX4cDMow3YT1MzXIMscSm+hWYip96jfc/TE
 0WSKj8ayuMqOiAFqlPFoKCQlW0+g92UGf0AjG0Rbau31aPznj5gNsMUTAlAq+6juQbDI
 TxIW7vu6u3Sx0P7dzUR9GUGEsHKlj4XLUu/U7qYEsY9kW85LB4Teh1aMZCk9CSkd3OG+
 yMKVlvxM4p0dkITKicXOda96ef7fJqkW1p3QF7U+5sHh7cP7YEXjL4s5tqysZjKDGRLQ
 m56A==
X-Gm-Message-State: AGi0PuZBTO9D6FJXrZCEOuyT/OLRQm8YnVoQ3OiEp/l4pYGvC9U/eU2s
 LZAQvy40iB8Twf37LRrDuv8TkWGV
X-Google-Smtp-Source: APiQypJvnDKnANDu1/4xIgxYRby3GSXI4NBM/FTmIWG3zb115TbqSrNHc4mqYmjHPNEARTB7nTXs5A==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr2982042wmg.109.1587633798761; 
 Thu, 23 Apr 2020 02:23:18 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h2sm3073290wro.9.2020.04.23.02.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 02:23:18 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 2/5] ARM: PL061: Extract pl061_create_fdt()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-3-geert+renesas@glider.be>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <bcf9ac02-2be7-96c3-5377-a56dca4ff082@amsat.org>
Date: Thu, 23 Apr 2020 11:23:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423090118.11199-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
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
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> Move the code to create the DT node for the PL061 GPIO controller from
> hw/arm/virt.c to the PL061 driver, so it can be reused.
> 
> While at it, make the created node comply with the PL061 Device Tree
> bindings:
>   - Use generic node name "gpio" instead of "pl061",

I'd split this patch in 2 (first one being fixing missing properties).

>   - Add missing "#interrupt-cells" and "interrupt-controller"
>     properties.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  hw/arm/virt.c           | 20 +++-----------------
>  hw/gpio/pl061.c         | 42 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/gpio/pl061.h |  7 +++++++
>  3 files changed, 52 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7dc96abf72cf2b9a..c88c8850fbe00bdb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -40,6 +40,7 @@
>  #include "hw/arm/primecell.h"
>  #include "hw/arm/virt.h"
>  #include "hw/block/flash.h"
> +#include "hw/gpio/pl061.h"
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>  #include "hw/vfio/vfio-amd-xgbe.h"
>  #include "hw/display/ramfb.h"
> @@ -807,30 +808,16 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>  
>  static void create_gpio(const VirtMachineState *vms)
>  {
> -    char *nodename;
>      DeviceState *pl061_dev;
>      hwaddr base = vms->memmap[VIRT_GPIO].base;
>      hwaddr size = vms->memmap[VIRT_GPIO].size;
>      int irq = vms->irqmap[VIRT_GPIO];
> -    const char compat[] = "arm,pl061\0arm,primecell";
>  
>      pl061_dev = sysbus_create_simple("pl061", base,
>                                       qdev_get_gpio_in(vms->gic, irq));
>  
> -    uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
> -    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
> -    qemu_fdt_add_subnode(vms->fdt, nodename);
> -    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> -                                 2, base, 2, size);
> -    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
> -    qemu_fdt_setprop_cell(vms->fdt, nodename, "#gpio-cells", 2);
> -    qemu_fdt_setprop(vms->fdt, nodename, "gpio-controller", NULL, 0);
> -    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
> -                           GIC_FDT_IRQ_TYPE_SPI, irq,
> -                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> -    qemu_fdt_setprop_cell(vms->fdt, nodename, "clocks", vms->clock_phandle);
> -    qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
> -    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
> +    uint32_t phandle = pl061_create_fdt(vms->fdt, "", 2, base, size, irq,
> +                                        vms->clock_phandle);
>  
>      gpio_key_dev = sysbus_create_simple("gpio-key", -1,
>                                          qdev_get_gpio_in(pl061_dev, 3));
> @@ -846,7 +833,6 @@ static void create_gpio(const VirtMachineState *vms)
>                            KEY_POWER);
>      qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
>                             "gpios", phandle, 3, 0);
> -    g_free(nodename);
>  }
>  
>  static void create_virtio_devices(const VirtMachineState *vms)
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index e776c09e474216ef..74ba733a8a5e8ca5 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -9,12 +9,14 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/arm/fdt.h"
>  #include "hw/gpio/pl061.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "sysemu/device_tree.h"
>  
>  //#define DEBUG_PL061 1
>  
> @@ -397,3 +399,43 @@ static void pl061_register_types(void)
>  }
>  
>  type_init(pl061_register_types)
> +
> +/*
> + * pl061_create_fdt: Create a DT node for a PL061 GPIO controller
> + * @fdt: device tree blob
> + * @parent: name of the parent node
> + * @n_cells: value of #address-cells and #size-cells
> + * @base: base address of the controller's register block
> + * @size: size of the controller's register block
> + * @irq: interrupt number
> + * @clock: phandle of the apb-pclk clock
> + *
> + * Return value: a phandle referring to the created DT node.
> + *
> + * See the DT Binding Documentation in the Linux kernel source tree:
> + * Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
> + */
> +uint32_t pl061_create_fdt(void *fdt, const char *parent, unsigned int n_cells,
> +                          hwaddr base, hwaddr size, int irq, uint32_t clock)
> +{
> +    char *nodename = g_strdup_printf("%s/gpio@%" PRIx64, parent, base);
> +    static const char compat[] = "arm,pl061\0arm,primecell";
> +    uint32_t phandle = qemu_fdt_alloc_phandle(fdt);
> +
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", n_cells, base, n_cells,
> +                                 size);
> +    qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_cell(fdt, nodename, "#gpio-cells", 2);
> +    qemu_fdt_setprop(fdt, nodename, "gpio-controller", NULL, 0);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 2);
> +    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> +    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", GIC_FDT_IRQ_TYPE_SPI,
> +                           irq, GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +    qemu_fdt_setprop_cell(fdt, nodename, "clocks", clock);
> +    qemu_fdt_setprop_string(fdt, nodename, "clock-names", "apb_pclk");
> +    qemu_fdt_setprop_cell(fdt, nodename, "phandle", phandle);
> +    g_free(nodename);
> +
> +    return phandle;
> +}
> diff --git a/include/hw/gpio/pl061.h b/include/hw/gpio/pl061.h
> index 78cc40c52679dc4e..f98c6e24e0e68662 100644
> --- a/include/hw/gpio/pl061.h
> +++ b/include/hw/gpio/pl061.h
> @@ -11,6 +11,13 @@
>  #ifndef PL061_GPIO_H
>  #define PL061_GPIO_H
>  
> +#include <stdint.h>
> +
> +#include "exec/hwaddr.h"
> +
>  #define TYPE_PL061 "pl061"
>  
> +uint32_t pl061_create_fdt(void *fdt, const char *parent, unsigned int n_cells,
> +                          hwaddr addr, hwaddr size, int irq, uint32_t clock);
> +
>  #endif /* PL061_GPIO_H */
> 

