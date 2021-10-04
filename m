Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41C4207CF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:04:47 +0200 (CEST)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJtu-0003bI-3e
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJjS-0002ru-K3
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:54:00 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:33181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJjM-00034K-J0
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:53:54 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MNbtF-1m8nn30wYt-00P44e; Mon, 04 Oct 2021 10:53:50 +0200
Subject: Re: [PATCH 04/12] macfb: use memory_region_init_ram() in
 macfb_common_realize() for the framebuffer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <19376047-965a-fb88-f29e-3e4ee6deef50@vivier.eu>
Date: Mon, 4 Oct 2021 10:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:twxSEGXxoKdnY2wdoyhHjoBbN0MjAh8miaKs/BMWbqqiQvaEkjP
 DMsGrGVM2eQxqLcAkysmDmNqiUiVvjSqM6My3x24xRHgZpGvPavEDIC8l84xJWvbBKOq/0c
 0R74y6BpCmQjZOMDGxtPUXbqcVtzk8WjMbyzXi0fWWqwJJ2Q6wOZ/4jaLrghmW7eCUiZCfV
 giAg4uJeiEWw8/jZPn2Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bg8EY5ZTDzI=:CJq+jAC6w9qPMPDQWErJPL
 nD1zWujqEjKSIUKVnO9NayfZ/Ws6reLXvmcCBMxb6/93R59drkv0eFvk8Phsja1Xma9Nj3sC4
 8t6lzgx+rTqEwnkJT2c/xxgWPQL4T83ZwHtVpNaR7p5K8qTGOE4ICQaO7bQoHJ8AvPGiibtB9
 DsIATsQRidH5Iz0V0onAGJjlIXd8GkZ1C9CYxVLpcpvD41woXZ3wtEM0w9y4T10M6KMA12O9D
 p9Y+DhIjRBsQMiz1YUkpvs2+P7QgO2cBroEFFuk8egfCGzfkb80pkHI44XQO4zzKcwn6F8ySi
 6q4vwBP8fr+StrkhPiBAiDglJXyacHveewJc1nJr+mS2ZVt4PVVnKU8AOIt9YBnlm2o/56Gu/
 H9W4Co0ZoZ383tMm2sdxCcbhhhbL9vnpVLySZfRF5yMWPI7fmUrreKJBRgeyi3NMoj61fd2vr
 XAUw37bZdRi93R1OeBmLSxnHC32dF7kuXQt+/Hj8hZHcHahm/lrcEmO8/3G9Ap4gy5Vjjig/f
 NhCKSAOWmQiP+Mkql2XNO6fbhqjNq6iGU4n3dj7H4jxATnswAErhKbp//9OIcap6mxp5uCQXQ
 KQ1RGq97RpTFUyglNvYRcj3gXvUGzlhS6bBrgyC6AoBjvWmYEL+rvXs1tQGeIV1KLV6Jb5b2c
 wCnK/LLv9vGxNaCvJ/ml7HWaBueGDA+rffLASzGTcPWO2M7g91D19MfCux70M6ThyZPx4oDBs
 MCUP+yAJMolf7O+8BC6slEudi/tqeoN5xQFZLg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 02/10/2021 à 12:59, Mark Cave-Ayland a écrit :
> Currently macfb_common_realize() defines the framebuffer RAM memory region as
> being non-migrateable but then immediately registers it for migration. Replace
> memory_region_init_ram_nomigrate() with memory_region_init_ram() which is clearer
> and does exactly the same thing.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index f4e789d0d7..e86fbbbb64 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -368,11 +368,10 @@ static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>      memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
>                            "macfb-ctrl", 0x1000);
>  
> -    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(dev), "macfb-vram",
> -                                     MACFB_VRAM_SIZE, errp);
> +    memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
> +                           MACFB_VRAM_SIZE, errp);
>      s->vram = memory_region_get_ram_ptr(&s->mem_vram);
>      s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
> -    vmstate_register_ram(&s->mem_vram, dev);
>      memory_region_set_coalescing(&s->mem_vram);
>  }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

