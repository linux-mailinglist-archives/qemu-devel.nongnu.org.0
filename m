Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B545A184FD3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 21:03:36 +0100 (CET)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCqWt-0001j6-Mu
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 16:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jCqV7-0008Uw-Hh
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 16:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jCqV6-0007Mn-E8
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 16:01:45 -0400
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43]:38029)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jCqV6-0007Ks-9b; Fri, 13 Mar 2020 16:01:44 -0400
Received: by mail-vk1-xa43.google.com with SMTP id w4so3016550vkd.5;
 Fri, 13 Mar 2020 13:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OxHoNj73ij1tyjuFJTobIkE6lc8SgWazEItycwi/oTI=;
 b=Dh6JAb0pEAJRVSGkkqX+4JIQnLsTxop/96GbXIcrRMAGHx38SoGu8BeCIcR1yzlku1
 0u6auTWKl2S1G7+QAgUqW1m1jamXPO/nW41Dzn9J98ulPHx8erTJt0CLzaNX4Y4rYqt5
 obVGZUWzXH1XdNa7Jf0IUibDPCyWhMCP6ljoioyiLoD99c29ne2LLhEgvQw0vbYPZAqd
 L6qkWigBeyksawJObFPZHou6NYizKgHEd2EwY7w2v+BS77DXsnboF4eZ2OEXbgU8ZTBv
 NLA8gcT0EGoAx4jhKxBcJxOGyYvaVpIbagUkfGWgURILI3u3QH/RAQNOW27wshzYdzA/
 oBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OxHoNj73ij1tyjuFJTobIkE6lc8SgWazEItycwi/oTI=;
 b=cP5hNlITuDHNbksors1BiePuE/NkSjyX7xLWS0og8Lblq969dHj2PbJHwrkzK0rYlf
 14DWlsaf6+FNdxU7EXLSw2Mu6LRJ2QayX/kI9HYXcI1o/blJx5dZ5mFJSiWp+tnfDP3k
 RA3lQqzREFASpEW5jTGKaPqOh3Ya2A9Z2LRC8MnLReaXh2USV0iCXQU1KXhFRsmU8Kgd
 7twfy7ttBGJo+AxeFI8X9yFykVpw78vrtcmh2d0Qzaao6tweGOopR02NxT4Vr9eOJfXw
 whjKVzHKA0ocEvxaUE6bUtcbw2QkAXtBkTyDuBwNAwXZ8N38o3dzP3arT3tgudAVp7fO
 74cA==
X-Gm-Message-State: ANhLgQ18cAAOQX0wRmbvck7YYAXOOqyaw6ACWXci7g51b/jacxULatcS
 GkawVi7yOT0zythvl75M26+VldcuXoB9D7ns4I0=
X-Google-Smtp-Source: ADFU+vsEoXiHJ0spy87aO28SJvhnPFTV77ByNwGPD2NaiebUdXeCq6Qe/izPKfPyiVd4BFGmI4bxRsh+HaG3eHWNrwo=
X-Received: by 2002:a1f:c786:: with SMTP id x128mr9958917vkf.77.1584129703525; 
 Fri, 13 Mar 2020 13:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-8-philmd@redhat.com>
In-Reply-To: <20200313183652.10258-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 13:01:17 -0700
Message-ID: <CAKmqyKO=f=on17SBu8OmbdJ4SQ=L6==E-tr=ekQuHPkiTzct6Q@mail.gmail.com>
Subject: Re: [PATCH 07/14] target/riscv/cpu: Restrict CPU migration to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a43
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 13, 2020 at 11:39 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c0b7023100..b59e09209e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -475,10 +475,12 @@ static void riscv_cpu_init(Object *obj)
>      cpu_set_cpustate_pointers(cpu);
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  static const VMStateDescription vmstate_riscv_cpu =3D {
>      .name =3D "cpu",
>      .unmigratable =3D 1,
>  };
> +#endif
>
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
> @@ -534,13 +536,13 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      cc->do_transaction_failed =3D riscv_cpu_do_transaction_failed;
>      cc->do_unaligned_access =3D riscv_cpu_do_unaligned_access;
>      cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
> +    /* For now, mark unmigratable: */
> +    cc->vmsd =3D &vmstate_riscv_cpu;
>  #endif
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize =3D riscv_translate_init;
>      cc->tlb_fill =3D riscv_cpu_tlb_fill;
>  #endif
> -    /* For now, mark unmigratable: */
> -    cc->vmsd =3D &vmstate_riscv_cpu;
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.21.1
>
>

