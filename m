Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D283420831
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:25:17 +0200 (CEST)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKDk-0006uy-5v
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJf4-0004KC-53
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:49:26 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:57481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJf1-00046X-Sj
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:49:25 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2VKr-1mwBW233b5-013tcy; Mon, 04 Oct 2021 10:49:21 +0200
Subject: Re: [PATCH 02/12] macfb: fix invalid object reference in
 macfb_common_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <821b8d60-8b78-c4a5-5289-f65093b9b5bd@vivier.eu>
Date: Mon, 4 Oct 2021 10:49:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W9klYjdZw3W0BwmE7RElLzJRWUUJeGROv1WxZLn7Oz5ge7IDeho
 mYRxYzQWmuT1yw/Pejkb6VKtrM7CB7yWNxiU+DQTvTeaEqWoXJ1ywRLHtp9b7rOUfKyZTjh
 UH4lH/8M8H0FgApH+nQmQRa6h+9TVUaj+MN4DsR62kTAjJK5Xuh84cWijPRDlitDduwTd+J
 f0i1C17JPGEP3Go4VQ9ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1LzXTHTN/Ec=:6S+SJdm7VbOGw0o/MlB06t
 UNHNSEFcEjin8e9pBUiCx4TbJU17FD6Dxgo+z6t1PYYjaacfoY/CQfb6WsZAORAimmX6drR2u
 8NUhbMpcjDVotg0zFmhKgW4Rkoh03ZgAtb7+OCoGsNUJHXvBwoN5c1tLCLRxqN0+15JtMDDHQ
 oCCNKpmG3kc0K3cyE3qf+uI5shMMGppQJ1c2NXPvgR9ch9rI1irESmYQg5tyxYL7Dn0zQmFeR
 LMQ1opjoxy2VZ8Nicf9YUbbzORhQhmpwkdv0bbWUQIyAu6ZBSVZguooCfRJFMgZIgHk7TJwPT
 cXHS5v6sqzFC7AIaiZAMapNc2cfNuV+rxzP52z7qz4SJwJigturMaF1HezBuXcxMibEN6kbot
 hkVsdy6Ak2cmRVGtLNb0scZSpPKWyNKto/+llwpYJcoS0VeJrkcnbw4mf6FpJcKluLJlmUq3K
 IkOe+Fz7zlrp35xiJc1bV8AUeJjr/SJyFx9R7jVbaAM951Esiyxl2rsEB9SyHKuIflD5AAiWr
 j5KFysi151B4yHcxovZcdMZMUmTOltFyUyWWjryT5/R37wGBkknvzTQl/R81QWISspL8B28fX
 /EZVKpcieJrlqh1BJ8EX0p614lxPYwXpod3vqY9y1D7pTDpEFSgo5DWGEwBJJu1Knw9bPFl1+
 RNCMAMhguuaPoNUkbGkZ4eegwMqc07aeiqW75RuqitI8qvGSHcMeYBwEKkj2Wkr/rAKoaeBaS
 v4xkWnLW2e5iJ8kCvOhI9alJb9bQagHTPLOyDA==
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

Le 02/10/2021 à 12:59, Mark Cave-Ayland a écrit :
> During realize memory_region_init_ram_nomigrate() is used to initialise the RAM
> memory region used for the framebuffer but the owner object reference is
> incorrect since MacFbState is a typedef and not a QOM type.
> 
> Change the memory region owner to be the corresponding DeviceState to fix the
> issue and prevent random crashes during macfb_common_realize().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 2b747a8de8..815870f2fe 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -365,7 +365,7 @@ static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>      memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
>                            "macfb-ctrl", 0x1000);
>  
> -    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram",
> +    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(dev), "macfb-vram",
>                                       MACFB_VRAM_SIZE, errp);
>      s->vram = memory_region_get_ram_ptr(&s->mem_vram);
>      s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

