Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1A42E8F7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:26:31 +0200 (CEST)
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGfm-0001K0-G6
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbGdz-0008ED-H4
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:24:39 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:39211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbGdx-000492-TX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:24:39 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mnq0I-1n4YiU06NG-00pOn7; Fri, 15 Oct 2021 08:24:36 +0200
Subject: Re: [PATCH 2/8] q800: move VIA1 IRQ from level 1 to level 6
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6a293640-8bda-beb0-3e4c-35e50d5c5974@vivier.eu>
Date: Fri, 15 Oct 2021 08:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YDDjfI+OUwMyo/jIMabqsdPJclOwsPBR9gFGvaLDtTakRSIfgnJ
 NKYbmCkMay/ZF9+Xa/xw27hFkr0kwLJCywAdZhdAHP0xRnOTrVoQRivRXASVsSNTOWPFJhu
 CgfAmXCEHDhvop4yEtueUYRJvjtDOUW1LmRRNMp3P9AMaM6hDUZvI9cY++bLRhyS13qZjXl
 vvzCNZHoSdKEuh+iL+Thg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6bME1swvYUU=:QpGUx2d23WzGf2Fnsokflt
 P/uOZx1mGnnSyrpwW+NNY+ET3ua7BzjZa0Vq+pAJCkU678LoXhHLR3mHnLbp7eVEjzu5Q0RoH
 zWcH3IxBgozNfLmeOUK89/C4EtoyWk9XB4GNzoe1ejNypvzfiE83sxQo9072g4q1L9JiZ51/F
 RspNIwkvZimzprwkyCft1+JTqXoqjZAHxcVSBSCtJbTpN+HhZs/khVPEugo8OAIyXBmieP6/G
 TzJu30HwxdJr7rqny4EfSBrXRYR9FYODcqbdpDBotjpV8W6ux9x+t8OOqqoBqaVa7hEE7zepi
 4CPejLNCgOoxY/uQw7e7u0yIZabNVnB64ozyrlsxUqpfwkdSKhKytw4+q1ROK2m1setKKjpt7
 3h8LAtevuWPRIQMPlgk9Ic3kIuK3wh6qeFC1wEp4zrkzvMn7DlOF3gWCChv0ADzHiamdsWHPn
 vKO5V3Mi2R0tW1SLNDDtj0vlh8iY3YMiHGpBXwzCGueCCDeQz08lHk1Usygn9MsTghOx0qkiJ
 FYeHzPz25aeHBaQX+67n8lUBwiF7JXnddi4WXdq8Xuqo4SNT+ioYM5APPi68l2sZ/HdQxdHnx
 AG/g5IO3+hluoMJDNjRGP3V08TGcqF6dbgeXtIDQ0Yb+TsqoIPBYKRG/f9lrNSqewH5QmBXoR
 GXLwdxdrvK+rUnbkDbNvCDItZlX/u3vGTjHszcYee7Rm6099IBjqsoBu5Pw12h/2CfYOd/PJV
 TDRJrdxXOZKUI4Gs8qcz6xyuAECdND+xC3p7dA==
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
> On a Quadra 800 machine Linux sets via_alt_mapping to 1 and clears port B bit 6 to
> ensure that the VIA1 IRQ is delivered at level 6 rather than level 1. Even though
> QEMU doesn't yet emulate this behaviour, Linux still installs the VIA1 level 1 IRQ
> handler regardless of the value of via_alt_mapping which is why the kernel has been
> able to boot until now.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index fd4855047e..15f3067811 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -284,7 +284,7 @@ static void q800_init(MachineState *machine)
>      sysbus = SYS_BUS_DEVICE(via1_dev);
>      sysbus_realize_and_unref(sysbus, &error_fatal);
>      sysbus_mmio_map(sysbus, 1, VIA_BASE);
> -    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 0));
> +    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 5));
>  
>      adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
>      dev = qdev_new(TYPE_ADB_KEYBOARD);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

