Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83682DB31C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 19:15:20 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL9Mt-0008Jo-63
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 13:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iL8L6-0004Nl-7b
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iL8L5-0008MW-2I
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:09:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57986
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iL8L4-0008MF-Sj
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 12:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571328562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIutrH/raJ1eyTbN5e6diEdzpBNPfF3TVuqifTnXoVs=;
 b=GoOr9F7l/dvtoDiACLAABhXY/rP0Y4OCIuniLUbTciBudR4UN8I+ip/M90t0DYyhI3UTiD
 jUQWlvszThxAFfqS9lFGxsqtBukuqZ87nppZuiT6J262worveArGWSc4Z3oUKZhoswDioV
 1yolYflz8f4fNDg6ErEaSmLvX963ruI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-rS5EqSpxN36fBo-TCO9QaA-1; Thu, 17 Oct 2019 12:09:20 -0400
Received: by mail-wr1-f69.google.com with SMTP id j7so1186714wrx.14
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 09:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=So1ll89itO5GgMtOn6m9wOnB7YmoBS+AbnuqBLwhNG8=;
 b=P07xokGVUWJ2V2RgpFw2kaJu6YqtpFkpmSrma/iFb0DW17jcI7nJ/IQxcjpmtlHpbG
 MNhyIOJOUcgUa8cLFRjvipkQFskOjCyjeaPzWD+uyRoAYLVzNAlIcGbUWh0SCdGQ+FX4
 NYCfyx8UPEoLlAQs8eZSIFzIWF5XH/1EiR1Ww7o1/q7w14W9YQiZUdlJ5jij/hsNpJWU
 UMBRmAmAje+T1XKtKEDvgQ4b6L+sA1wYatPP4ECWCLCV4oHrr2BlnkacraZJdBVzljv/
 3wz4vk0ij5O31m9p6JY1ifJGd0FEgewEHAuIOZ22lIhIfMbLtOoW+hNEZjIT6Nv4bXOl
 fwuQ==
X-Gm-Message-State: APjAAAWhf3mxModxx+Do+yL7LdH3Sz3vNKEGidEGejxiamymtDUPIdB6
 YSlBcruKjBFNCfjqAHZtEnUKWbPgADKMeg+0WqKZD2mu5+jsDY9GhBsYXjQMaZT2BDdisI3c+li
 pejjrcPbcpiMuA80=
X-Received: by 2002:a1c:2306:: with SMTP id j6mr3692897wmj.96.1571328559176;
 Thu, 17 Oct 2019 09:09:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLsyQWSusOhr5GaNNVi9u/VjPv8j4AGnhkFwmOawu6net6b7XaG3Fzl+zTBobi9Kspu8wgnQ==
X-Received: by 2002:a1c:2306:: with SMTP id j6mr3692865wmj.96.1571328558915;
 Thu, 17 Oct 2019 09:09:18 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id m18sm3007994wrg.97.2019.10.17.09.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 09:09:18 -0700 (PDT)
Subject: Re: [PATCH 5/8] hw/timer/altera_timer.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132905.5604-1-peter.maydell@linaro.org>
 <20191017132905.5604-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <18066f84-ea56-20c3-6e43-58978f8569bb@redhat.com>
Date: Thu, 17 Oct 2019 18:09:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017132905.5604-6-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: rS5EqSpxN36fBo-TCO9QaA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Magnus Damm <magnus.damm@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/19 3:29 PM, Peter Maydell wrote:
> Switch the altera_timer code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/timer/altera_timer.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
> index ee32e0ec1ff..79fc381252d 100644
> --- a/hw/timer/altera_timer.c
> +++ b/hw/timer/altera_timer.c
> @@ -19,7 +19,6 @@
>    */
>  =20
>   #include "qemu/osdep.h"
> -#include "qemu/main-loop.h"
>   #include "qemu/module.h"
>   #include "qapi/error.h"
>  =20
> @@ -53,7 +52,6 @@ typedef struct AlteraTimer {
>       MemoryRegion  mmio;
>       qemu_irq      irq;
>       uint32_t      freq_hz;
> -    QEMUBH       *bh;
>       ptimer_state *ptimer;
>       uint32_t      regs[R_MAX];
>   } AlteraTimer;
> @@ -105,6 +103,7 @@ static void timer_write(void *opaque, hwaddr addr,
>           break;
>  =20
>       case R_CONTROL:
> +        ptimer_transaction_begin(t->ptimer);
>           t->regs[R_CONTROL] =3D value & (CONTROL_ITO | CONTROL_CONT);
>           if ((value & CONTROL_START) &&
>               !(t->regs[R_STATUS] & STATUS_RUN)) {
> @@ -115,10 +114,12 @@ static void timer_write(void *opaque, hwaddr addr,
>               ptimer_stop(t->ptimer);
>               t->regs[R_STATUS] &=3D ~STATUS_RUN;
>           }
> +        ptimer_transaction_commit(t->ptimer);
>           break;
>  =20
>       case R_PERIODL:
>       case R_PERIODH:
> +        ptimer_transaction_begin(t->ptimer);
>           t->regs[addr] =3D value & 0xFFFF;
>           if (t->regs[R_STATUS] & STATUS_RUN) {
>               ptimer_stop(t->ptimer);
> @@ -126,6 +127,7 @@ static void timer_write(void *opaque, hwaddr addr,
>           }
>           tvalue =3D (t->regs[R_PERIODH] << 16) | t->regs[R_PERIODL];
>           ptimer_set_limit(t->ptimer, tvalue + 1, 1);
> +        ptimer_transaction_commit(t->ptimer);
>           break;
>  =20
>       case R_SNAPL:
> @@ -183,9 +185,10 @@ static void altera_timer_realize(DeviceState *dev, E=
rror **errp)
>           return;
>       }
>  =20
> -    t->bh =3D qemu_bh_new(timer_hit, t);
> -    t->ptimer =3D ptimer_init_with_bh(t->bh, PTIMER_POLICY_DEFAULT);
> +    t->ptimer =3D ptimer_init(timer_hit, t, PTIMER_POLICY_DEFAULT);
> +    ptimer_transaction_begin(t->ptimer);
>       ptimer_set_freq(t->ptimer, t->freq_hz);
> +    ptimer_transaction_commit(t->ptimer);

This looks odd because timers are not running at this point (REALIZE),
but if we don't protect it, ptimer_set_freq() will trigger the assertion.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>  =20
>       memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>                             TYPE_ALTERA_TIMER, R_MAX * sizeof(uint32_t));
> @@ -204,8 +207,10 @@ static void altera_timer_reset(DeviceState *dev)
>   {
>       AlteraTimer *t =3D ALTERA_TIMER(dev);
>  =20
> +    ptimer_transaction_begin(t->ptimer);
>       ptimer_stop(t->ptimer);
>       ptimer_set_limit(t->ptimer, 0xffffffff, 1);
> +    ptimer_transaction_commit(t->ptimer);
>       memset(t->regs, 0, sizeof(t->regs));
>   }
>  =20
>=20


