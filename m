Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5642E9A1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:02:54 +0200 (CEST)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHEz-0007WQ-7D
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbHDN-0006QF-Jc
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:01:13 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbHDL-00067O-Vc
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:01:13 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mr7iw-1n7q401Hte-00oHwf; Fri, 15 Oct 2021 09:01:10 +0200
Subject: Re: [PATCH 5/8] q800: wire up auxmode GPIO to GLUE
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6f58a188-2e19-cef5-53cd-7e993717500b@vivier.eu>
Date: Fri, 15 Oct 2021 09:01:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EAmwcr/B/AyHb18WhclCLmqcGWT2vT0GWkJ+CPuFs5sPUmFsTeS
 UQA0olWV1Q6dbUxSxp39HQRT3DGmLERh9PXj5l2CKK4lvs6ACxS6fvlZj3uBY9hKlnoJ4h5
 berNlAjDJuPFPK9mQhfI9vO2Fzv/RE4DUf61+g1/xiTpe0EQi7IqRQSxiQVMWfY6G7o8IZ5
 MtdCaa/DEdUzEBcI/K3AQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/1ao4vUkqMM=:u3MFpgd2UjX1dWgxWEp4Q2
 Y1vCixaXEiGneOr8kG8rs8KkKdWWDNWRbYPmUUN0hjBOabdCKk4kHp1Fnh3WT6mARllfXPbUP
 PYtgjH1pvjGvMhdpVvfvsSIGc1fk1KK6T9xVT09HJ82UUJYc87jRbMTZwrE0wxmyILv0TMyuJ
 ItvbvBUBhBDuk2wlcEVHh0Gsb++evMDOPz8JDYiLCcl2A1aVbZkVeLENRfNVQqyR1Tgx2JKnV
 tr1sF/AWjzFTpEuppQLtfOYL3oIDdalEGU6fL+YNw2vJHCFNDVB4yuz+kajOv/yeoJh8jwVYk
 Ya3/H4grzG/hR8tiCzz8aKlVvyj+UokXk4qcgZB8SBBe5QOrOn41Dn5C2/j589XCw8i+97z5T
 XEQ9sEJuHt0aqNe8St7L/s1wpx6VPE00zr8B3H1rPGpi4eBqWUjDLjo7LlfNCEqEa/O7W2Z25
 mGqM3HUY8RNfU2tbfbQGL/MZqyD6HRAzQZykbEoAk9yTodY5DF1CqhpL2OB39R6J+2YNn4avQ
 a43GjgGFs7xId+jiyvJe2np7UiB7zsrSF0zIkkphgDMOMlDlnX9K0MxnrBejzaAnUjS9hCalR
 9RbywIyzLTF6ao+dxx/ToFv6OMCT+6USkFiKuRkePmEksYkPLvNxIklMkAOUWgcpcdcx/nCM1
 L0+RPS07AWWQCPaCrUAE31QRlGP2nyiq2FMjcNzdCKQjdwrffaWX4O4VBwboAqklGBRGs9C/8
 ssf/z8lhgE2Rx3vDILoAXDSYi+qz6tsAZ89toA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
> This enables the GLUE logic to change its CPU level IRQ routing depending upon
> whether the hardware has been configured for A/UX mode.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 81c335bf16..0093872d89 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -100,6 +100,7 @@ struct GLUEState {
>      SysBusDevice parent_obj;
>      M68kCPU *cpu;
>      uint8_t ipr;
> +    uint8_t auxmode;
>  };
>  
>  #define GLUE_IRQ_IN_VIA1       0
> @@ -145,11 +146,19 @@ static void GLUE_set_irq(void *opaque, int irq, int level)
>      m68k_set_irq_level(s->cpu, 0, 0);
>  }
>  
> +static void glue_auxmode_set_irq(void *opaque, int irq, int level)
> +{
> +    GLUEState *s = GLUE(opaque);
> +
> +    s->auxmode = level;
> +}
> +
>  static void glue_reset(DeviceState *dev)
>  {
>      GLUEState *s = GLUE(dev);
>  
>      s->ipr = 0;
> +    s->auxmode = 0;
>  }
>  
>  static const VMStateDescription vmstate_glue = {
> @@ -158,6 +167,7 @@ static const VMStateDescription vmstate_glue = {
>      .minimum_version_id = 0,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(ipr, GLUEState),
> +        VMSTATE_UINT8(auxmode, GLUEState),
>          VMSTATE_END_OF_LIST(),
>      },
>  };
> @@ -178,6 +188,7 @@ static void glue_init(Object *obj)
>      DeviceState *dev = DEVICE(obj);
>  
>      qdev_init_gpio_in(dev, GLUE_set_irq, 8);
> +    qdev_init_gpio_in_named(dev, glue_auxmode_set_irq, "auxmode", 1);
>  }
>  
>  static void glue_class_init(ObjectClass *klass, void *data)
> @@ -308,6 +319,9 @@ static void q800_init(MachineState *machine)
>      sysbus_realize_and_unref(sysbus, &error_fatal);
>      sysbus_mmio_map(sysbus, 1, VIA_BASE);
>      sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_VIA1));
> +    /* A/UX mode */
> +    qdev_connect_gpio_out(via1_dev, 0,
> +                          qdev_get_gpio_in_named(glue, "auxmode", 0));
>  
>      adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
>      dev = qdev_new(TYPE_ADB_KEYBOARD);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

