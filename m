Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2443040B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:03:08 +0200 (CEST)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbo1T-0008QV-CJ
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbnzE-00075o-9G
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:00:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbnz6-00055d-WC
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:00:47 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mati7-1n87bB3FUZ-00cNu0; Sat, 16 Oct 2021 20:00:38 +0200
Subject: Re: [PATCH 5/8] q800: wire up auxmode GPIO to GLUE
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <982340c3-7fa6-2a07-6f8b-4a97ab81a294@vivier.eu>
Date: Sat, 16 Oct 2021 20:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p14Ro+jcRKBkKUQlE2jzM0cJVt7KXJAP8wCBiQeZKy86UH3nKJm
 t5Th4r+t0hn8ciO8Ma6cptd7FpjuLcYTONnhyw/Aj6b76fv5obasMnQJcW06jf+FPeYB4En
 khlUxZPcwfCt9uwwJzOtR7lv0GyD8TeT4LzhKMalj8tg6PkDFR3DaHVgP+xl1uwXKsiKlGH
 +IjYor/jNv/CQo2WXrn/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:17kG+LqaweA=:fw6Eug2Gb6Bz0okG4RFPil
 oUrkKIE8/1TODwhQmJjdhk5Z+uAWJdLeadeNtfIHr/DZXECCsJru+T37Ju13MOSnooUjSH/q7
 k9GtJIUlr1dJL0cfPo6DyeUVvphLapu461Of02ISIaME5WQiXStCar5shsWa3UtVFlO2HvaHc
 vQgoXxDryNbFNE880tZMhmtYetbRb63tdEBh+9pzReVph7T8RRvmpPpSCM8sLyyM21dWi/qiT
 J1zJq+MOHS6mh3zaUPDRHu/tL3sthZwFjg272D7N3W/6Xf3CBJNtB09Tn1SPSwKl7CZfrpvkO
 FkCIH8dyjYbZVTBctID4N3nm1OdjoiLp674cQaWKDdOV8uriSyZ/zUHsMcUdza2HfGnAeZEBl
 EOrMatS18Z/IdZmfwrZKohGxeGbG0Dv6qv56eh583JBR9K/xS57AhQsOoIIDPdvelniQzigjM
 ALdEcZsKwitSheX/4NRNzbtqedHQzgNCEPsNSeQ+MizW7iBGhOZgyhDykYmVYY1ZkJvH++N1I
 hVMwIfXoNJJBaSpGgBS6O0yjIVQCrg1MkZz8QZ8mBsyzOIDY9wPi2Y/pIrh1oQTPB1nMOp6hu
 vjlSJ9j2m+XZ7QTPgMMT5wZgVQEPdGyzvV2UjIqwcIx0gWYVrsI662uTmZikLP5pk/+l0Im2t
 m0Hm8C5Bmcfym5LNCfPZEbxaogagLECIjwrySG5vQhDKsxPLKVFqHGut+bNxgKtNjnZDXRFCH
 SHu5k6Qls8GvL7bkAqRBe4OX9rGe5I+75GWbeQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

