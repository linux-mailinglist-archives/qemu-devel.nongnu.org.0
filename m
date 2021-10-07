Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174842534E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:40:26 +0200 (CEST)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYShF-0004Yw-6I
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYSdk-0001HK-1b
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:36:48 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:47843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYSdi-0005P0-7g
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:36:47 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MFK8N-1mauPo1EXB-00FnT7; Thu, 07 Oct 2021 14:36:41 +0200
Subject: Re: [PATCH v3 02/13] macfb: update macfb.c to use the Error API best
 practices
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211007093407.3329-1-mark.cave-ayland@ilande.co.uk>
 <20211007093407.3329-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2514e187-21b3-6b0e-44b5-debd1cd5c114@vivier.eu>
Date: Thu, 7 Oct 2021 14:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211007093407.3329-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K4wp1o7+obBS7p/Pnt7yIQFx3fI8hZQ2XSr+DWKpdFBf8biS6dX
 mWBujyNPy47XNb4FYCwcF5eUpyk6LR9IwNYn+A+9N3bvIzw+t7ypG0rd2PZhEMCx+hlFuBX
 hl9oGgLZh4junaHdl14OEhnD0ujAdrY/ssUhrVZXqM/X0URToAn75uf2R4HtHbHal4alWM8
 X8ucvF35MX/w/tDS6PzWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0/jXmcWiAZ8=:UqKBOdZIXECumekCtSyvBV
 FsfLQnmHaIHyjgm201nGzzt9jz0J06Kl5rKshk8r8KZnKi7jDtR4iMlmYc/M1qSlLyz7OXJz3
 OruZ1R72QLNnsIrDeHvY2Rcxw0No4XcDgrtYf44lIj0j7m/vNiwW6C4B9dNqI+aJOGHX5p6HQ
 JqUjZ2M9jj/AzCQZ1gl9RX3tkwghr26Ch6WV0IRgS0lHLHH/QVHMFV3fpoPq0rYWunFObiH8/
 P46ACP+NRdVWMlfgAicgidxFHSnM9NSXT9AAd9a77nLV/HTkoEl0eD98lxPM1HFLLt5zFfqYE
 21Ud3zKCdmtXLZcKSnMpya+3qY5UYMjRtHy+Hh0Jx+kLDcUQTd+Vrs8gQRKhkY7lLRft4oQ09
 +ll1ZQwnuBcnpwfqW13MPUTm5P1MWS+JnyBxfZAV+Su4JN+Y4hC8XkHpWvLzMM8rJMCAsnQtc
 Uk8lNSx+H8zpjkbLQIJ/mgblfdIJkK0P3nc+tQYNzmte2PvY9tW9eN1OKA6pwhTA32MgwYa87
 C+x0+030WdJ7IEX/A81zXbQ37mp9jgBh6cVQIZSJPgJaV/509uYN7ilnSZx851ywhJi2ncT5c
 AIth3scXkrIb8CXtfCzKCTOxVStBrRke3lGzwWq0t4I/xlcABR0a9AxrJXqGaHeECc2TI4NPy
 G5Xe6/4ImhhhFS0lH3EqOAAyHrZf5karBdhkNM4BrbDCWA1Uh7TyBWGGbujilogdNEoS25t14
 syRFvg1M66ihggQozoCvjqA2YWFJhL2bamyyTA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
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

Le 07/10/2021 à 11:33, Mark Cave-Ayland a écrit :
> As per the current Error API best practices, change macfb_commom_realize() to return
> a boolean indicating success to reduce errp boiler-plate handling code. Note that
> memory_region_init_ram_nomigrate() is also updated to use &error_abort to indicate
> a non-recoverable error, matching the behaviour recommended after similar
> discussions on memory API failures for the recent nubus changes.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 2b747a8de8..2ec25c5d6f 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -343,14 +343,14 @@ static const GraphicHwOps macfb_ops = {
>      .gfx_update = macfb_update_display,
>  };
>  
> -static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
> +static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>  {
>      DisplaySurface *surface;
>  
>      if (s->depth != 1 && s->depth != 2 && s->depth != 4 && s->depth != 8 &&
>          s->depth != 16 && s->depth != 24) {
>          error_setg(errp, "unknown guest depth %d", s->depth);
> -        return;
> +        return false;
>      }
>  
>      s->con = graphic_console_init(dev, 0, &macfb_ops, s);
> @@ -359,18 +359,20 @@ static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>      if (surface_bits_per_pixel(surface) != 32) {
>          error_setg(errp, "unknown host depth %d",
>                     surface_bits_per_pixel(surface));
> -        return;
> +        return false;
>      }
>  
>      memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
>                            "macfb-ctrl", 0x1000);
>  
>      memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram",
> -                                     MACFB_VRAM_SIZE, errp);
> +                                     MACFB_VRAM_SIZE, &error_abort);
>      s->vram = memory_region_get_ram_ptr(&s->mem_vram);
>      s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
>      vmstate_register_ram(&s->mem_vram, dev);
>      memory_region_set_coalescing(&s->mem_vram);
> +
> +    return true;
>  }
>  
>  static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
> @@ -378,8 +380,7 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>      MacfbSysBusState *s = MACFB(dev);
>      MacfbState *ms = &s->macfb;
>  
> -    macfb_common_realize(dev, ms, errp);
> -    if (*errp) {
> +    if (!macfb_common_realize(dev, ms, errp)) {
>          return;
>      }
>  
> @@ -399,8 +400,7 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    macfb_common_realize(dev, ms, errp);
> -    if (*errp) {
> +    if (!macfb_common_realize(dev, ms, errp)) {
>          return;
>      }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

