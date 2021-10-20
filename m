Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2073434D19
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:08:45 +0200 (CEST)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCGr-0001bm-0h
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdCCV-0004QP-P1
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:04:16 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdCCS-0006NL-9q
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:04:14 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mzz6m-1msH2U2J6c-00wzzx; Wed, 20 Oct 2021 16:04:08 +0200
Message-ID: <7d9165eb-1001-6000-779c-a479cbc99279@vivier.eu>
Date: Wed, 20 Oct 2021 16:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/8] q800: use GLUE IRQ numbers instead of IRQ level
 for GLUE IRQs
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211020134131.4392-1-mark.cave-ayland@ilande.co.uk>
 <20211020134131.4392-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211020134131.4392-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MrQePmFBMIkOdyeqZQ1TsiYCpNEWlNOarxs7eknYmTHMw9wHqCi
 oaQ8Xxrf8MCSNLAMoQUfIjneBl8GOyvc/Ss94+x9q9gDbL8fdWVFjhvXpD6LSUQkrPDSnIr
 uRFnOCxomeYshLessvCXRWQTB41t1dDRcL7NtbO0nCcpe/dA3Va8vaQ3IywTvgAVWpCBF9I
 /4OkiJKnTS7hu807KYOJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vloBUHLA69o=:yRxEcdkEh2FG/3BiJt1IjH
 IfCViz1+ulJKPsoFDI5wUtz3wspnDLvHHBPmGY+/pW5wVWdXMuR03mjDX8I8TxpZaGaF3BOcq
 26JQKb/+U54KPvo5McBBXM2DGNqqbMfgSgy2QtNrRlWI+9X3QfvOtaTzqhBXZd8zky96zzsay
 9dFb+fTwkoYq+wz/eN2nYKBZXsOhQ3C1s+gNfuWgz2qHylI5zAGHfCyahODlvPil8nMtrxbB0
 NHJkdwnRYucvlpdx3jt+PSjNBKVQLZkZXV3nBTPcxVanWI7/hDcv7lT2yCrXFi8utz0JBtwgp
 /FBWwIXrwgJ5kg8rYGyWebqFnIw3P6ihZ5OAC4c5LnKvETTdbchKo4A4R3wbgxKJbNl3Veack
 cvbs0e3aPRS+NrMayUg+M+1SWcOaPsxeJq/2e+JrbIUS4Aoue+Tm5deHAInKEXvXk2kgScdCZ
 PzsBCbe6PrxFPuAOZhq6uu3bBcPzdIEL0nD7lDozTAT2Ud05bg0iciEX26/6oH5zhaQcwC5mt
 iTmd8CxWgRZV2cxm/hi61aij+jJEver3rMCuyXgaVpXFIFbj28kX7fb0pMyLb8XhSCGtP3mqP
 vfDCXxdQO+WMfBTb9pZVGIg3ssBh2DUsOs5wTcxXtFUdL3PbeVSJ5d8QnU656fvepQNoFjd7f
 3oXohzrrAtXqHqAEGGvwQBG/fXtV3nkP1ECN8sJ4iza4ctQCQErNP/z0TWU3OGluYrGJ4LBTL
 rgi97/5vEDsNNcDekXIc8RhecAAIEy6AtVnykA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
> In order to allow dynamic routing of IRQs to different IRQ levels on the CPU
> depending upon port B bit 6, use GLUE IRQ numbers and map them to the the
> corresponding CPU IRQ level accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c | 32 ++++++++++++++++++++++++++++----
>   1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 15f3067811..81c335bf16 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -102,11 +102,34 @@ struct GLUEState {
>       uint8_t ipr;
>   };
>   
> +#define GLUE_IRQ_IN_VIA1       0
> +#define GLUE_IRQ_IN_VIA2       1
> +#define GLUE_IRQ_IN_SONIC      2
> +#define GLUE_IRQ_IN_ESCC       3
> +
>   static void GLUE_set_irq(void *opaque, int irq, int level)
>   {
>       GLUEState *s = opaque;
>       int i;
>   
> +    switch (irq) {
> +    case GLUE_IRQ_IN_VIA1:
> +        irq = 5;
> +        break;
> +
> +    case GLUE_IRQ_IN_VIA2:
> +        irq = 1;
> +        break;
> +
> +    case GLUE_IRQ_IN_SONIC:
> +        irq = 2;
> +        break;
> +
> +    case GLUE_IRQ_IN_ESCC:
> +        irq = 3;
> +        break;
> +    }
> +
>       if (level) {
>           s->ipr |= 1 << irq;
>       } else {
> @@ -284,7 +307,7 @@ static void q800_init(MachineState *machine)
>       sysbus = SYS_BUS_DEVICE(via1_dev);
>       sysbus_realize_and_unref(sysbus, &error_fatal);
>       sysbus_mmio_map(sysbus, 1, VIA_BASE);
> -    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 5));
> +    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_VIA1));
>   
>       adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
>       dev = qdev_new(TYPE_ADB_KEYBOARD);
> @@ -297,7 +320,7 @@ static void q800_init(MachineState *machine)
>       sysbus = SYS_BUS_DEVICE(via2_dev);
>       sysbus_realize_and_unref(sysbus, &error_fatal);
>       sysbus_mmio_map(sysbus, 1, VIA_BASE + VIA_SIZE);
> -    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 1));
> +    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_VIA2));
>   
>       /* MACSONIC */
>   
> @@ -330,7 +353,7 @@ static void q800_init(MachineState *machine)
>       sysbus = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(sysbus, &error_fatal);
>       sysbus_mmio_map(sysbus, 0, SONIC_BASE);
> -    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 2));
> +    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, GLUE_IRQ_IN_SONIC));
>   
>       memory_region_init_rom(dp8393x_prom, NULL, "dp8393x-q800.prom",
>                              SONIC_PROM_SIZE, &error_fatal);
> @@ -366,7 +389,8 @@ static void q800_init(MachineState *machine)
>       qdev_realize_and_unref(escc_orgate, NULL, &error_fatal);
>       sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(escc_orgate, 0));
>       sysbus_connect_irq(sysbus, 1, qdev_get_gpio_in(escc_orgate, 1));
> -    qdev_connect_gpio_out(DEVICE(escc_orgate), 0, qdev_get_gpio_in(glue, 3));
> +    qdev_connect_gpio_out(DEVICE(escc_orgate), 0,
> +                          qdev_get_gpio_in(glue, GLUE_IRQ_IN_ESCC));
>       sysbus_mmio_map(sysbus, 0, SCC_BASE);
>   
>       /* SCSI */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

