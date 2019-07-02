Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093D45D51F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 19:20:48 +0200 (CEST)
Received: from localhost ([::1]:55516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiMSU-0007o5-R8
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 13:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hiLTy-0003sM-Ap
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:18:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hiLTx-000131-9K
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:18:14 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:33725)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hiLTx-00011v-13; Tue, 02 Jul 2019 12:18:13 -0400
Received: by mail-lf1-x143.google.com with SMTP id y17so11850172lfe.0;
 Tue, 02 Jul 2019 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/MBg1zX8WAYF9zMp578Nj6qoQ2mH4XRdogrHDNzRxH8=;
 b=p239fiOv339O2ABHfp65iiXtc0jFVwosmq+0/RVutIJ1FW8TrlEK0m0GvvyS8tZO95
 km9WxM0FqzHM9cRgIstj4yVndzbBC/IhSspsOyCxKcKL6mdjUslTkWmBAAYYCuj9ekdk
 pj/ADNqxMc1gSs0z0lEZRUnjHpxYuKCnRnaQFniZJqJ1+EoMbhzGiVzUFQVAtB4gi8vm
 C5wsZ9T/9rRRU9vNr6ErXdekoIiuawpw4Bh4wy8MqWpzUJYVL2esuqAz/9YXVkgY4eGa
 TVpqcUZGFzEDhj2RLU6oOs7Gq893pWCVzb+hAsxcOoHjg+jTa/j+BZuQ8XcIf/InCsTj
 mqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/MBg1zX8WAYF9zMp578Nj6qoQ2mH4XRdogrHDNzRxH8=;
 b=ZkE6WUMtncuQ759kgUQPqSPZLM53XZXxgilWQI8ikMST8+/DfnntPzn1t7J4PG6HKR
 W3+Y5g0hH4eR/bDhz/HkaH4GVTbRGwsKzDDxYmnzyb6QMJ56Unr1RX0dcu/YiXx3LX2T
 4TT1pIW+057psL4nUKp+Wnq/hSxKpw/oP3Q6Z7ThT2ocE+duM9J/ifHoG5DCjvg1/an0
 HOUpto85glCJN+PpXtyNcWoYT8jJ1sO3xwcLk8b6P29s1khhqp0t++WHsvkcMdqZtH3w
 4fWR5d58OMxtcy50ivM4mINZ8muhlJFjdhKO2ra8KzXlKQVSyhRaY2J2/EiPF4R9eIwA
 bu7A==
X-Gm-Message-State: APjAAAX0jeqE4oSaETwOV5i+Wl5Tg+2WAyk/x5S1UZHs8mmlr5b6A6Ta
 eB7c1UxGuFFyLqcXRpVjM9p5e0Wu3iae9SVa64w=
X-Google-Smtp-Source: APXvYqzisf0aezxqwOJlaLCnHvkhxG3cLzmSo2ipcO3X+b71dzXG/JhYiVEF3ynFU7MVdgrw1I2MzZYeRis6TyG91x4=
X-Received: by 2002:ac2:5324:: with SMTP id f4mr15308676lfh.156.1562084290697; 
 Tue, 02 Jul 2019 09:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com>
 <20190702001301.4768-9-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-9-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:15:07 -0700
Message-ID: <CAKmqyKMZhZMy2cG_Ub8oL4hrpTHzk5fCCmsKV7Ypzkp9huqm+A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-devel] [PATCH v2 8/9] hw/block/pflash_cfi01: Replace
 DPRINTF by qemu_log_mask(GUEST_ERROR)
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 1, 2019 at 5:16 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index f50d0a9d37..e891112b67 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -286,7 +286,9 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>      switch (pfl->cmd) {
>      default:
>          /* This should never happen : reset state & treat it as a read *=
/
> -        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid state, "
> +                      "wcycle %d cmd 0x02%x\n",
> +                      __func__, pfl->wcycle, pfl->cmd);
>          pfl->wcycle =3D 0;
>          pfl->cmd =3D 0xff;
>          /* fall through to read code */
> @@ -631,7 +633,9 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>          break;
>      default:
>          /* Should never happen */
> -        DPRINTF("%s: invalid write state\n",  __func__);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid state, "
> +                      "wcycle %d cmd (0x02%x -> value 0x02%x)\n",
> +                      __func__, pfl->wcycle, pfl->cmd, value);
>          goto mode_read_array;
>      }
>      return;
> --
> 2.20.1
>

