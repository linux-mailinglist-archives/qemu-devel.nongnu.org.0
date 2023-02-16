Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850A699753
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfBR-0005v3-1e; Thu, 16 Feb 2023 09:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pSfBH-0005on-FJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:24:16 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pSfBF-0007XU-Hc
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:24:15 -0500
Received: by mail-lf1-x132.google.com with SMTP id w11so2939094lfu.11
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SfgQq/T+JwDHEWnarOzlh81F7FjXVQrpDn529WoNuo=;
 b=SdrDUt6rW7leeURpUP9H4se69u8kiuunVLenB8VcGX86wlqnJykcmhjCyQ/cRL7jak
 G7MYV0Cbnr2Bleim3o5x292BVye+qCTWZntxCOfkf5BEvWhW4ZVmkrBA/U1OaCf7IfZs
 v9f9q269bJ2XqkdB0jfx8Ra5x8Ul/+ijFTnpP+yq4A2HBi9RfMaJLpwaHTvgf5DiZlc8
 xvm3Y84OvLmYJEKHPa24GQ7Kb6f31IbB8WMyY9T+V43ckf/QVXfNn4saHGOsYDGxWu9R
 bS/Foa8CkngDqf9ccXxs5BF7FSBK44tyS9YXblHBpRKWkrdx2+33RapuDd42CTsSA5tp
 W7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SfgQq/T+JwDHEWnarOzlh81F7FjXVQrpDn529WoNuo=;
 b=Lt1+wKDLAdY8OHTvfBSzbMnnWXzprJBzHgJwBEiI04nw5ZnDCfcuMVkapa9VFoSqiI
 /JrBP/W+vR0hp36daNg9NQ4/xKFaWX87fdblD2rHaqYjZeDc/c2RWe+9qq4uFP+5B15/
 jbFj4ybojw6hd+OEoPBTZxCR37UubTeNYDFP5UvwZw08VEN6UIPFg66y8eJEcdy8VTIl
 hs357kq/6li1u+p6h0R/75aRZZdh0kLcs1XeMJgr8Uc2+TRZ/n6V/GDE2zwsLoaZH8OS
 qt8yDIaSj9f/9ou483etuMT/wRRzTau2BVv4xy7ZuHGqXq350vnHQNOGcC/QyhK0/E3s
 vR8w==
X-Gm-Message-State: AO0yUKVqyetNoF3dyiDdrMe0VahqVkZQJHDX+PKW2pHfPXYvo5l1QgX+
 gJQSrmtTPh4EfKVmF0aczztqLOHicu3Jjd9/pIA=
X-Google-Smtp-Source: AK7set+mpBQFVSUsgrGCBbT4sGJ36NzG1lJk5bdSbX1upxm+z95kZVCUZ9sgXQwnltv9jy8xJ5eaWUVLb2Ah/D9qiKo=
X-Received: by 2002:ac2:5192:0:b0:4d5:ca43:7042 with SMTP id
 u18-20020ac25192000000b004d5ca437042mr1699599lfi.5.1676557450519; Thu, 16 Feb
 2023 06:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20161022095318.17775-1-marcandre.lureau@redhat.com>
 <20161022095318.17775-20-marcandre.lureau@redhat.com>
 <7f4f3a95-d1c5-a531-0ce5-8a974e5bc002@linaro.org>
In-Reply-To: <7f4f3a95-d1c5-a531-0ce5-8a974e5bc002@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Feb 2023 18:23:58 +0400
Message-ID: <CAJ+F1C+4VJOytUS4kukBcnNEo7XN1dCLKcSzbiFmLkM4F+gSJA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 19/38] char: make some qemu_chr_fe skip if no
 driver
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, pbonzini@redhat.com, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Philippe

On Thu, Feb 16, 2023 at 2:14 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Marc-Andr=C3=A9,
>
> [very old patch...]
>
> On 22/10/16 11:52, Marc-Andr=C3=A9 Lureau wrote:
> > In most cases, front ends do not care about the side effect of
> > CharBackend, so we can simply skip the checks and call the qemu_chr_fe
> > functions even without associated CharDriver.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   hw/arm/pxa2xx.c           |  8 +++-----
> >   hw/arm/strongarm.c        | 16 ++++++---------
> >   hw/char/bcm2835_aux.c     | 18 ++++++-----------
> >   hw/char/cadence_uart.c    | 24 +++++++---------------
>
> >   qemu-char.c               | 51 ++++++++++++++++++++++++++++++++++++++=
---------
> >   include/sysemu/char.h     | 40 +++++++++++++++++++++++++------------
> >   22 files changed, 156 insertions(+), 191 deletions(-)
>
>
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index 4459b2d..291818e 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -142,9 +142,7 @@ static void uart_rx_reset(CadenceUARTState *s)
> >   {
> >       s->rx_wpos =3D 0;
> >       s->rx_count =3D 0;
> > -    if (s->chr.chr) {
> > -        qemu_chr_fe_accept_input(&s->chr);
> > -    }
> > +    qemu_chr_fe_accept_input(&s->chr);
>
> I'm trying to understand this change. This code comes from:
>
> commit 9121d02cb33c96b444a3973579f5edc119597e81
>
>      char/cadence_uart: Fix reset for unattached instances
>
>      commit 1db8b5efe0c2b5000e50691eea61264a615f43de introduced an issue
>      where QEMU would segfault if you have an unattached Cadence UART.
>
>      Fix by guarding the flush-on-reset logic on there being a qemu_chr
>      attachment.
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 131370a74b..4d457f8c65 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -157,7 +157,9 @@ static void uart_rx_reset(UartState *s)
>   {
>       s->rx_wpos =3D 0;
>       s->rx_count =3D 0;
> -    qemu_chr_accept_input(s->chr);
> +    if (s->chr) {
> +        qemu_chr_accept_input(s->chr);
> +    }
>
> When resetting the xlnx-zcu102 machine, I hit:
>
> (lldb) bt
> * thread #1, queue =3D 'com.apple.main-thread', stop reason =3D
> EXC_BAD_ACCESS (code=3D1, address=3D0x50)
>    * frame #0: 0x10020a740 gd_vc_send_chars(vc=3D0x000000000) at
> gtk.c:1759:41 [opt]
>      frame #1: 0x100636264 qemu_chr_fe_accept_input(be=3D<unavailable>) a=
t
> char-fe.c:159:9 [opt]
>      frame #2: 0x1000608e0 cadence_uart_reset_hold [inlined]
> uart_rx_reset(s=3D0x10810a960) at cadence_uart.c:158:5 [opt]
>      frame #3: 0x1000608d4 cadence_uart_reset_hold(obj=3D0x10810a960) at
> cadence_uart.c:530:5 [opt]
>      frame #4: 0x100580ab4 resettable_phase_hold(obj=3D0x10810a960,
> opaque=3D0x000000000, type=3D<unavailable>) at resettable.c:0 [opt]
>      frame #5: 0x10057d1b0 bus_reset_child_foreach(obj=3D<unavailable>,
> cb=3D(resettable_phase_hold at resettable.c:162), opaque=3D0x000000000,
> type=3DRESET_TYPE_COLD) at bus.c:97:13 [opt]
>      frame #6: 0x1005809f8 resettable_phase_hold [inlined]
> resettable_child_foreach(rc=3D0x000060000332d2c0, obj=3D0x0000600002c1c18=
0,
> cb=3D<unavailable>, opaque=3D0x000000000, type=3DRESET_TYPE_COLD) at
> resettable.c:96:9 [opt]
>      frame #7: 0x1005809d8 resettable_phase_hold(obj=3D0x0000600002c1c180=
,
> opaque=3D0x000000000, type=3DRESET_TYPE_COLD) at resettable.c:173:5 [opt]
>      frame #8: 0x1005803a0
> resettable_assert_reset(obj=3D0x0000600002c1c180, type=3D<unavailable>) a=
t
> resettable.c:60:5 [opt]
>      frame #9: 0x10058027c resettable_reset(obj=3D0x0000600002c1c180,
> type=3DRESET_TYPE_COLD) at resettable.c:45:5 [opt]
>
> Doing similar to commit 9121d02cb3...:
>
> -- >8 --
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c069a30842..deadee1788 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -155,7 +155,9 @@ static void uart_rx_reset(CadenceUARTState *s)
>   {
>       s->rx_wpos =3D 0;
>       s->rx_count =3D 0;
> -    qemu_chr_fe_accept_input(&s->chr);
> +    if (qemu_chr_fe_backend_open(&s->chr)) {
> +        qemu_chr_fe_accept_input(&s->chr);
> +    }
>   }
> ---
>
> ... fixes the issue but I'm not sure 1/ this is a correct use of the
> chardev API and 2/ this is how the HW work at reset.

The trouble is that GTK/VTE console/chardev creation is done later.

I think we should rather fix ui/gtk.c, as this could happen with other
char frontends:

diff --git a/ui/gtk.c b/ui/gtk.c
index 4817623c8f..dfaf6d33c3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1783,7 +1783,9 @@ static void gd_vc_chr_accept_input(Chardev *chr)
     VCChardev *vcd =3D VC_CHARDEV(chr);
     VirtualConsole *vc =3D vcd->console;

-    gd_vc_send_chars(vc);
+    if (vc) {
+        gd_vc_send_chars(vc);
+    }
 }


>
> Can you help me with 1/ before I ask Xilinx folks for 2/ ? :)
>
> Thanks,
>
> Phil.
>


--=20
Marc-Andr=C3=A9 Lureau

