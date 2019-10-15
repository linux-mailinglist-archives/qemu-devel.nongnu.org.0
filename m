Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D06D7CDD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 19:05:05 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKQFr-0005In-Vp
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 13:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iKQEf-00046R-40
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 13:03:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iKQEd-0000yp-Mj
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 13:03:48 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:41143)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iKQEd-0000yP-IA
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 13:03:47 -0400
Received: by mail-ot1-x334.google.com with SMTP id g13so17563798otp.8
 for <qemu-devel@nongnu.org>; Tue, 15 Oct 2019 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UcIbnJ7VtnM5P+YWIC3SrDz4tB9UIeJ+PX7t0huq+uE=;
 b=EGM9Psqo4C8uWFNP+wli2Uo9yj5SXrWnYsntut9T59LGF9JhgDpkYF5yIJSyXI3pjM
 KHT/kz9SOJ2nXRiRbA88Q1D5N3dNgVEuTjFHmahkInw2El/PJddBzW17rWMFvGRV0qfL
 KxbaipwPh5a0a2xxUUhyC3NUQRiFiX4Zl2DHHF6rJae0FZWbjOWmaJUxMJtR1UQMwPdr
 l8mocb8hpyqaVsjaO0uYMcXmJlTZozCg3YeTnETMPOq0ci+sudnfGMPp756ykiM5/AsC
 phmp2KxvbN91w4oOOM91UGA76JSRTRNZ1oE/l6UV/DptXukfpks/UJG8iSyJ6uhbXspd
 LupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UcIbnJ7VtnM5P+YWIC3SrDz4tB9UIeJ+PX7t0huq+uE=;
 b=Xyg9r5ukXVDRTAhztkFrgW5KOXntU1ei/s3dY1vGZ62ryp+zyGfZKYyp00/bjS1ln/
 C+KfPax9S0ythwmFHRZW8eR7+OEYRI/CCvy0QcQN+EgFq0TVU+ic2RjiugjpX36IRi3X
 s3b3KSkadAjdD8pj+K09p0oCQdHKAewttGTAEe2ZYRffC+hi9ZxHXGW4RqlZ9a2VKOn1
 iaxxvUptQOyTeByBytPU+lH3+d9cZBGksML9zbGWlRI/Zyz8VBZtb0kCt+uIqfGdEgvq
 kL9ym8XehusBJKfKYUupdYPUFMcsZRZSGCzsx8TY5vxTdfud5+sjKIPraqkHdzwSCMe6
 TrqQ==
X-Gm-Message-State: APjAAAW5BxC4c0F8lE47kTHQpRWlZgQvAPmpDOzSbpA6keJOO0mJOTFZ
 3o0S8yji+IBWJrYjfkL0wikttjumYGYqmGE/3kUJpaQMEJw=
X-Google-Smtp-Source: APXvYqyH1xYyYWU3DMGaTlTzYfLyOJ6BZB/bGaXkQ28UQagK48oCdgELgW8l1ju/yKtc8Tbn5xvUEcU5hv3UwVFY0zI=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr30046282otj.135.1571159025709; 
 Tue, 15 Oct 2019 10:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191014160404.19553-1-peter.maydell@linaro.org>
 <20191014160404.19553-60-peter.maydell@linaro.org>
In-Reply-To: <20191014160404.19553-60-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2019 18:03:33 +0100
Message-ID: <CAFEAcA-2EZnnrYViQUQK-mR0=JqR9mXNzfVNa_WR5HoCTJ+tag@mail.gmail.com>
Subject: Re: [PULL 59/68] aspeed: Add an AST2600 eval board
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Oct 2019 at 17:05, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Message-id: 20190925143248.10000-21-clg@kaod.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/aspeed.h |  1 +
>  hw/arm/aspeed.c         | 23 +++++++++++++++++++++++
>  2 files changed, 24 insertions(+)

> @@ -455,6 +467,17 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
>          .num_cs    =3D 2,
>          .i2c_init  =3D witherspoon_bmc_i2c_init,
>          .ram       =3D 512 * MiB,
> +    }, {
> +        .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
> +        .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
> +        .soc_name  =3D "ast2600-a0",
> +        .hw_strap1 =3D AST2600_EVB_HW_STRAP1,
> +        .hw_strap2 =3D AST2600_EVB_HW_STRAP2,
> +        .fmc_model =3D "w25q512jv",
> +        .spi_model =3D "mx66u51235f",
> +        .num_cs    =3D 1,
> +        .i2c_init  =3D ast2600_evb_i2c_init,
> +        .ram       =3D 2 * GiB,

Hi. I just discovered that this makes 'make check' fail on
32-bit systems, because you can't default to 2GB of RAM
for a board:

(armhf)pmaydell@mustang-maydell:~/qemu$
./build/all-a32/arm-softmmu/qemu-system-arm -M ast2600-evb
qemu-system-arm: at most 2047 MB RAM can be simulated

It's also a pretty rudely large amount of RAM to allocate
by default: it caused 'make check' to fail on my OSX
box, which is 64-bits but doesn't have huge swathes
of free RAM.

I'm going to drop this patch from my queue and redo
the pullreq.

thanks
-- PMM

