Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A420CE23
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 13:19:32 +0200 (CEST)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jprox-0000EW-FW
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 07:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jprnx-0008EN-Lv
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 07:18:29 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jprnv-0001Jk-SG
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 07:18:29 -0400
Received: by mail-oi1-x243.google.com with SMTP id x83so6486925oif.10
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xxpp6NBwJheKXdBBVZ+/lXG9dtO7roQWFX74TWn5h20=;
 b=Z5ZtcWtn/dNcKvP1nd6r7LJk14ZUsTdR9K/Ppek7vEKmaURNtaYpe9yA/IHiRho3De
 D9AvjgQXUmlZBtmr3G1PtZz49riqjZzM//gojfUv5aMWWPEbUjpsFV+ETIzyIsecXcla
 GVAph6vBynHQlFXXLUECIkoon8buWBVANvr8ink04BvZa5rrPsfB2GP4qmVpZ7PwydrG
 1h9tQ5RPvpwFJ9DIWEQ/21kjZSlYVrrXUoyn4v2/yCwRfzyGltrwwYNHbrZIvQDBK9lP
 hTa/WSzaJJV4RTQBBZiQj4tBduKHQ6j1cqYQhhMEG/rKUsYcktSBzf/WyqLdMZMPN+dv
 /vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xxpp6NBwJheKXdBBVZ+/lXG9dtO7roQWFX74TWn5h20=;
 b=OhrH+B6c0H8ux3pnmBALj5JSPe5lCaJDL/7K8FHq8De2FWrV4R1go5DHtFVoyBLeE7
 ZyOiCaIe5lb5jY32AsPLO/g3nxJkC01dbQk1n5fELdKf3yvs/xNWm6/VcNyGKmATWOey
 g2nr5QKaB3/fBPygVn9quTZ5sQwexLMzbTvW2dB/pLgrHf/XyFtzm03Uyd++pVBjLzzp
 xAArIEtcLqxOIt93oqJXCIaZRzTUjOaZLZPRp0bfGbbb0rWmtnH4oTAPrLMXN3vwOcex
 N4yNGRvwHqgO4DJq6fgN6lEP+2Aig/ytG6mCyTChLEucvtyLMymkAEYRAvZqEA21yEOo
 OtiA==
X-Gm-Message-State: AOAM533MariEBU4uJyJQfcbTdTG74vVy5lCwE+F9EK3BM7cT7OGoiuuS
 HA+HTAhxl9Hit3BIe0ASD0BKuclSZdneY8B22zw=
X-Google-Smtp-Source: ABdhPJykpnEn2b3e2xoCeKbj4XUADaf5NXwj9aHy0v/qeLFOFTvlGa/ZNkNe/WPayf0JGdVdakDqjfH9EhgvUtLnx9k=
X-Received: by 2002:aca:494d:: with SMTP id w74mr5945162oia.97.1593429506872; 
 Mon, 29 Jun 2020 04:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200624185523.762240-1-ppandit@redhat.com>
 <20200624185523.762240-6-ppandit@redhat.com>
In-Reply-To: <20200624185523.762240-6-ppandit@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 29 Jun 2020 19:17:51 +0800
Message-ID: <CAKXe6SKBYpdouoN=C_NZawLOnDMYjDU2X3c2CsCv7X7rPym1Rg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] nvram: add nrf51_soc flash read method
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

P J P <ppandit@redhat.com> =E4=BA=8E2020=E5=B9=B46=E6=9C=8825=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=883:01=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> Add nrf51_soc mmio read method to avoid NULL pointer dereference
> issue.
>
> Reported-by: Lei Sun <slei.casper@gmail.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/nvram/nrf51_nvm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> Update v2: return ldl_le_p()
>   -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg04972.html
>
> diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
> index f2283c1a8d..8000ed530a 100644
> --- a/hw/nvram/nrf51_nvm.c
> +++ b/hw/nvram/nrf51_nvm.c
> @@ -273,6 +273,13 @@ static const MemoryRegionOps io_ops =3D {
>          .endianness =3D DEVICE_LITTLE_ENDIAN,
>  };
>
> +static uint64_t flash_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    NRF51NVMState *s =3D NRF51_NVM(opaque);
> +
> +    assert(offset + size <=3D s->flash_size);
> +    return ldl_le_p(s->storage + offset);
> +}

The 'flash_ops' is for ROM, though I don't see where it calls
'memory_region_rom_device_set_romd'
to ROMD, so this MR is in MMIO mode and it needs a read callback.

However as the origin code doesn't provide a read callback. So why
here we return something?

I prefer here just 'qemu_log_mask(LOG_UNIMP, "%s not implemented\n",
__func__);' as other
patches does.

Thanks,
Li Qiang


>
>  static void flash_write(void *opaque, hwaddr offset, uint64_t value,
>          unsigned int size)
> @@ -300,6 +307,7 @@ static void flash_write(void *opaque, hwaddr offset, =
uint64_t value,
>
>
>  static const MemoryRegionOps flash_ops =3D {
> +    .read =3D flash_read,
>      .write =3D flash_write,
>      .valid.min_access_size =3D 4,
>      .valid.max_access_size =3D 4,
> --
> 2.26.2
>

