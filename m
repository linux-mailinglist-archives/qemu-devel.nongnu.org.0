Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98970434D42
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:16:36 +0200 (CEST)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCOR-0005EF-4t
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdCFI-0008Tf-FT
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:07:08 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdCFF-0000qx-Dp
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:07:06 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mr8O8-1n0y1J1PxG-00oIo2; Wed, 20 Oct 2021 16:07:03 +0200
Message-ID: <08c7efd8-00fc-77b7-2206-d6c1f45abade@vivier.eu>
Date: Wed, 20 Oct 2021 16:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 6/8] q800: route SONIC on-board Ethernet IRQ via nubus
 IRQ 9 in classic mode
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
 <20211020134131.4392-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211020134131.4392-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DPvvX5TeVirWAD7OFXHWNgzO+A4fKXhmtANnY+q57pEAyKdBHa5
 i+IBxKxmyJf9U1ffWV3a4D8A+NbU2o07ecqgT0qT0IHnMpa8ehiSrjl3iU73xgSMPVgceMB
 cnFiNV7f+quH2Ot98M/Nfih83wiG4ARtZc1OWQgMUI02AGrazu3fmciiT+Htvo7ZbX07Xzz
 9axp1Wbsy9dPINjjKYd0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5TbFRl8hBrg=:xBomxIAQms7aj+T/OghNdZ
 x6TiHlRa+8Vz4q3QRq2ScV5e5faNaXmm3xuH47b992yitEiNzvAajlirLPNd5fkbcQBjAAxFC
 AYrMuurF/Kr818gXi3HINwei1xiK7dldNU9ao9TnBgNCHCJgNiW6icjGLzB+hwoER/GsDkPCI
 0zMbcTkywpeh+BtzwPi5UpPWE0/9YJwyyL+O1OqIwdBFCIjl1YKtM3L5P06BLdMx9+fVXB2eZ
 6KBJ6vO0fHlhC90ITnpfgBBAhuq1q0xpuDauPHguyLaMLSri1Fj9R81G7XP29H/i4AEogcCje
 d2CR7PGUsoC+mqFCCbDRg7Ysj78ajmTFsoNVKpC2hHHw/epHUq3VMUTKj15O8cXlyooodTNnH
 cV8IXZINN5mItusMDB2HVuYfqnwPMZEOEXRKmaYlt8eeWrcKEY6S/lYVRQduOHgzM8CQYdH9j
 hIdCRnCZ80sLdufv0YeGnZB0DxaC4cAjkbebFqib/4IOXlygxl8EXgqvKJo+NnG+ujNgCijQr
 4lApVrcgFziA3ZCvrPyhmzLP4mcGxAUhgxayzZP9pzsGmNOeBb3wh8T8r3MLU5DIlmjHWgOJe
 55OdsGqpG+493DrAiRv14XkXlGCE013QqHrQnao0KDj6OV0ZlbkeVPMfiBZYdkNx2TR8NP3v4
 5QHtZXCgCQ3bbc1H4ILwdbQgL9bKJW1PewA7wx7FSokrQ3zNv+lmyRe2hKwgx2O03ThE=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 20/10/2021 à 15:41, Mark Cave-Ayland a écrit :
> When the hardware is operating in classic mode the SONIC on-board Ethernet IRQ is
> routed to nubus IRQ 9 instead of directly to the CPU at level 3. This does not
> affect the framebuffer which although it exists in slot 9, has its own
> dedicated IRQ on the Quadra 800 hardware.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c | 57 ++++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 0093872d89..7a8de089f4 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -101,6 +101,7 @@ struct GLUEState {
>       M68kCPU *cpu;
>       uint8_t ipr;
>       uint8_t auxmode;
> +    qemu_irq irqs[1];
>   };
>   
>   #define GLUE_IRQ_IN_VIA1       0
> @@ -108,27 +109,40 @@ struct GLUEState {
>   #define GLUE_IRQ_IN_SONIC      2
>   #define GLUE_IRQ_IN_ESCC       3
>   
> +#define GLUE_IRQ_NUBUS_9       0
> +
>   static void GLUE_set_irq(void *opaque, int irq, int level)
>   {
>       GLUEState *s = opaque;
>       int i;
>   
> -    switch (irq) {
> -    case GLUE_IRQ_IN_VIA1:
> -        irq = 5;
> -        break;
> -
> -    case GLUE_IRQ_IN_VIA2:
> -        irq = 1;
> -        break;
> -
> -    case GLUE_IRQ_IN_SONIC:
> -        irq = 2;
> -        break;
> -
> -    case GLUE_IRQ_IN_ESCC:
> -        irq = 3;
> -        break;
> +    if (s->auxmode) {
> +        /* Classic mode */
> +        switch (irq) {
> +        case GLUE_IRQ_IN_SONIC:
> +            /* Route to VIA2 instead */
> +            qemu_set_irq(s->irqs[GLUE_IRQ_NUBUS_9], level);
> +            return;
> +        }
> +    } else {
> +        /* A/UX mode */
> +        switch (irq) {
> +        case GLUE_IRQ_IN_VIA1:
> +            irq = 5;
> +            break;
> +
> +        case GLUE_IRQ_IN_VIA2:
> +            irq = 1;
> +            break;
> +
> +        case GLUE_IRQ_IN_SONIC:
> +            irq = 2;
> +            break;
> +
> +        case GLUE_IRQ_IN_ESCC:
> +            irq = 3;
> +            break;
> +        }
>       }
>   
>       if (level) {
> @@ -186,9 +200,12 @@ static Property glue_properties[] = {
>   static void glue_init(Object *obj)
>   {
>       DeviceState *dev = DEVICE(obj);
> +    GLUEState *s = GLUE(dev);
>   
>       qdev_init_gpio_in(dev, GLUE_set_irq, 8);
>       qdev_init_gpio_in_named(dev, glue_auxmode_set_irq, "auxmode", 1);
> +
> +    qdev_init_gpio_out(dev, s->irqs, 1);
>   }
>   
>   static void glue_class_init(ObjectClass *klass, void *data)
> @@ -454,6 +471,14 @@ static void q800_init(MachineState *machine)
>                                                        VIA2_NUBUS_IRQ_9 + i));
>       }
>   
> +    /*
> +     * Since the framebuffer in slot 0x9 uses a separate IRQ, wire the unused
> +     * IRQ via GLUE for use by SONIC Ethernet in classic mode
> +     */
> +    qdev_connect_gpio_out(glue, GLUE_IRQ_NUBUS_9,
> +                          qdev_get_gpio_in_named(via2_dev, "nubus-irq",
> +                                                 VIA2_NUBUS_IRQ_9));
> +
>       nubus = &NUBUS_BRIDGE(dev)->bus;
>   
>       /* framebuffer in nubus slot #9 */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

