Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A66447BEC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:35:55 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk089-0002Cz-VL
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:35:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mk06A-0000Pe-Hr
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:33:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:59759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mk064-0005mB-Uc
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:33:46 -0500
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQeDw-1n7bTp1nRG-00Nka5; Mon, 08 Nov 2021 09:33:23 +0100
Message-ID: <7534e121-b77c-90e4-7c9f-5e488f4cc030@vivier.eu>
Date: Mon, 8 Nov 2021 09:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH-for-6.2] ui/gtk-egl: Fix build failure when libgbm is
 not available
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211108083129.1262040-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211108083129.1262040-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gVoHX+NpXmRQkxqc1o9Rq6vMjhIXj8n5RGr1kKAzs5sfhcXYODp
 GGGzNjuSTtqdNERw4VFIV+Pm+Nu0mwfYfy6QfqfABGjCJVzih1S1SPVn4quDd97uGHvSQnF
 AwSwZg/q39HwaBgFD5OTEfY+wN/z/rQTGvMFaSkVXMgIqVRn4kyGAcofFQYxdVtKUyAezry
 kSVljC1QP2GUmIQggL3JQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4YKu072D430=:W5VNI1IoO5hpkHzonDxhwl
 CgTYg9CqvUIGYb8UaohS9hJeYDUZ2S1ic4sCRKMmPOPyQQlpNb3pNtCmcuUYgluixrnOjqvfA
 WMpaufobJZJQX97U4GWm9p12/pz/3Y5kfV+8XvCQV/3f0BxS+P/vdxkAYMjO2o07YjUL2kSma
 l0MWWaFiGKwRRuSUg5WyeCQfhFywRe/czHnVYSFCZCoKQbzI0DxkqJ82yhWQXI0d1TKNNAnoQ
 5xNF7ZDYvoFRn+ZRd/CNcGHyO3zMzM1IgVjm+3vQqL0dksgO2u3lbHCnwpu7s8wW29Xn2shWe
 /3IEvYGY3WAun/yt960PXPDSpoSZD+Vn50eqzgNRroSj3gYgiWI5hTjI4GfN6n1+l/7wnZ2X4
 E4GDhjoPfcvaQ6Hi82nxd1BhS5uhpbbV4XR7TvhOALaICnCmUZx6Rm2oJlVpayZcNwitHD20J
 xZUhccx5iZKiOBrwL6Cvi/Aku8KFTUdNZR1JxsTkXFZCkavrYZqIUCgF8SvD/Qv5bj9VHeZpH
 F2HWzAgMSZQug9PfP7fLIYJf7pgG2pEfndOWOD9O0Fh7PMWitgXmZFeRZjphYFf1FdcCjlnMy
 8YE+n3YySExMEZSG71Einn8fDiQyt/jy55A8tmBB1I0nmZv+uVL164ZCo1IqO4eMXRogZeiG+
 9Lk2c6Fwz0XtvC6wX9UFGgEOMeL5Aui+qc9IvNjkl5n5vaNwFQWQ2naYXJBvUbY+A/CI=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/11/2021 à 09:31, Philippe Mathieu-Daudé a écrit :
> Since commit 4872a023a59 ("ui/gtk-egl: guest fb texture needs
> to be regenerated when reinitializing egl") we get on Ubuntu
> 18.04.4 LTS and Debian Buster (oldstable):
> 
>    $ ../configure --enable-virglrenderer
>    [...]
>    ui/gtk-egl.c: In function 'gd_egl_refresh':
>    ui/gtk-egl.c:159:13: error: implicit declaration of function 'egl_dmabuf_release_texture' [-Werror=implicit-function-declaration]
>      159 |             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    ui/gtk-egl.c:159:13: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>    ui/gtk-egl.c:159:13: error: nested extern declaration of 'egl_dmabuf_release_texture' [-Werror=nested-externs]
> 
> Fix by restricting the egl_dmabuf_release_texture() call to the
> availability of the generic buffer management library (libgbm).
> 
> Fixes: 4872a023a593e6519b272a
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   ui/gtk-egl.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index f2026e4b5c9..45cb67712df 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -155,10 +155,12 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>               surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>               surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>           }
> +#ifdef CONFIG_GBM
>           if (vc->gfx.guest_fb.dmabuf) {
>               egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>               gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
>           }
> +#endif
>       }
>   
>       graphic_hw_update(dcl->con);
> 

On Fedora 34 too.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>

