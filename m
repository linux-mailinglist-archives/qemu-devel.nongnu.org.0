Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA041288B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:55:32 +0200 (CEST)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRG7-0002tz-O1
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR1P-000365-Lj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:40:20 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR1M-00068O-Fd
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:40:18 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRSdf-1mGWGe3QX7-00NOtj; Mon, 20 Sep 2021 23:40:13 +0200
Subject: Re: [PATCH v4 20/20] q800: configure nubus available slots for Quadra
 800
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-21-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0289c039-3b4a-5ca3-69df-476d1648437a@vivier.eu>
Date: Mon, 20 Sep 2021 23:40:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-21-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wN5UiHmY2xMjeg1CyVfGQp0um+/BDU1nUsozJE3fOvUyQfAkx/O
 zrIbeTJNbNJ9SsoRdf3LR4JWmzBs/F+0Q8rdmfms3LGojXyevwgvHFmnKCAGo32kd7wiMOf
 64ms+CzGym4xrvakZIzgAJPhKkx4/hsRMYcSPYvFh+UzwGRSDulfnKInpiPjKk/L42N3PBB
 N6hSYUokAe2t0Cn+WQOMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MbcrgRIui5g=:neDwnVUXk/onTJOICk8ppK
 +oSTxf/amm3N2MxtT5nOVS5co/NZf858zXWEZO9GcRDULSvaPIP/9AUl7iXHIRAorda1E/Pkg
 vPyTqYcXaRgMnW3C4R+LUE91rw5RDaOPw1MouEzQKWhsYQXFPYW6WRPT2MPrioMptazohaZnu
 yjJsvmCLSY9iqAGXTv+NsNHu5l7nS2Et0JR4OzE+kcxefHI8hX3K8wuCTAUPtY71C1ROr7Pph
 asiNbp9PoLilmrnydvVLZoEiaZ1MbQipZ8cUdnPCeb9pdwaB6SNeEVeTvu+vvZ7uvJQYQszdJ
 0K+jjxBDBJDM8hb2oc6TOEPnxV75ZV4lgkzLda62rzOnOU4EG4/nLnB9jypm9A+VYieQwErme
 Wisxw3MQut6ZHbmZar4pXWESX1aHzNxy3BOMI6uniANgRhrDrm/YfxgMkD4dHGceBiNTTHcBh
 lJ3bB1nhoW66grzj6Id/6D1rRqakCywP5QRsxdljvvt/9/Z/b4doFbK8up+CNx81VtlxQwfAa
 EIB7SIqETMIHWAKks/0nkhCqELZyta2lEufoaYFNcBfOpl/St+JveoI1I6OMJzTBYpY8TLBKs
 kDG9o3XHffxqAYQquu5Zg18lV5KKZ8Sl4W8QC1nnO7BEzg3d+jaZ8DRcG7kjGuzwulSc90kTY
 8FORQypO16HlnzPc3YQm0kF2pRs/J7wp+T99H7kcL+CoiQJ9J2bwYm9/QVX0OqnmTjVlS0LaA
 j5OfVPoUnf0diK5rkASVagdmEDLyhjnsF90A1Q==
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
> Slot 0x9 is reserved for use by the in-built framebuffer whilst only slots
> 0xc, 0xd and 0xe physically exist on the Quadra 800.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index fbc45a301f..63f42764eb 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -78,6 +78,13 @@
>  
>  #define MAC_CLOCK  3686418
>  
> +/*
> + * Slot 0x9 is reserved for use by the in-built framebuffer whilst only
> + * slots 0xc, 0xd and 0xe physically exist on the Quadra 800
> + */
> +#define Q800_NUBUS_SLOTS_AVAILABLE    (BIT(0x9) | BIT(0xc) | BIT(0xd) | \
> +                                       BIT(0xe))
> +
>  /*
>   * The GLUE (General Logic Unit) is an Apple custom integrated circuit chip
>   * that performs a variety of functions (RAM management, clock generation, ...).
> @@ -392,6 +399,8 @@ static void q800_init(MachineState *machine)
>      /* NuBus */
>  
>      dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
> +    qdev_prop_set_uint32(dev, "slot-available-mask",
> +                         Q800_NUBUS_SLOTS_AVAILABLE);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

