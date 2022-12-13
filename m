Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512FF64B6A6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 14:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55j6-0001fC-I4; Tue, 13 Dec 2022 08:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p55iv-0001c1-Ti
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:53:40 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p55iq-0001h8-Ku
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:53:30 -0500
Received: by mail-pg1-x52b.google.com with SMTP id f9so10447903pgf.7
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 05:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHMaokyjr27CS5rkdbnnEtYsn9U4n9/xandQHoXDiNE=;
 b=ltOa7mlELncktV/fY+kCf6K4cJWjkUKON1LnvkkOqhjZnDkJPEXVtW8HBP2wy8++PL
 ScRAH/7iwb66wx2kva7VKxxSYMHk4xJGzFRLDkXLsqXD0VXQeLmPZuhoiMofqeMNm3Uy
 CvuaBi5shOmIstg31jOvV6F2wyoZbZEzNE/Ra9C6X1duRFuBnZoLAMjD2NligYm+Absf
 y5u5xHzwmVc0Iqoy3YcyMl/DRQpPXftWAMeQlRKpC8fCJGZdkhgIuYvgw4ZCrTcro1jF
 +wQN8QDTydY2g5fyWASv+MuHEJMp9O1n1iyOJf5zvxAxJB8Jw92+165HeiegDt8vTh82
 W2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHMaokyjr27CS5rkdbnnEtYsn9U4n9/xandQHoXDiNE=;
 b=gzIhAPtk/ucBYtrN4RquuV38A8vLrKGxOXdBRZTmN5bmwon4jvgD62WQDEqFPd51Ct
 eyKgtdwgNxkxLqvNeaUKyl7cjtqHPTlIUoLmpL5NBQGYDsgaDb4M+qSygKQR9lXedzEV
 bftIdgkfgZ0a2eri8+K47O+nu/IxGH86cbtS8TjePEm3VKFj75sHw2pNwGznEALZKxMc
 MVcM+0mSWzK0/LJ3KFGLZBnby/rObYxvSfK3eGyyR7BniEZuiUy7Lriay1bLhgUiH6GE
 zOWFYQKFbCjrcIbrOenxPufmAUHzFZENTb11m3KCrpvhMthYBguEEIELCjjama3nZnoW
 nuvw==
X-Gm-Message-State: ANoB5pmnHXMb+/fTnQqd0hgeDoAa41sDgE5Nq1vh81ZcXgj9fXhP7Bi7
 aS7tcAI7ZiHrzEG9zBkTvYZ9HmM7NaqJHAv3q6uX0Q==
X-Google-Smtp-Source: AA0mqf70D8jPcBllhJs41kvS035Bh4MO+4Fwjr0ncXgwRq7xxQkaF3qvSoz/si1sLXKAEubA/HkdE4YqVvGbDnfzafs=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr79718932pfb.3.1670939607082; Tue, 13
 Dec 2022 05:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
In-Reply-To: <20221213125218.39868-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 13:53:15 +0000
Message-ID: <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> This partly revert commit d48751ed4f ("xilinx-ethlite:
> Simplify byteswapping to/from brams") which states the
> packet data is stored in big-endian.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

> @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size=
)
>              D(qemu_log("%s " TARGET_FMT_plx "=3D%x\n", __func__, addr * =
4, r));
>              break;
>
> -        default:
> -            r =3D tswap32(s->regs[addr]);
> +        default: /* Packet data */
> +            r =3D be32_to_cpu(s->regs[addr]);
>              break;
>      }
>      return r;
> @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
>              s->regs[addr] =3D value;
>              break;
>
> -        default:
> -            s->regs[addr] =3D tswap32(value);
> +        default: /* Packet data */
> +            s->regs[addr] =3D cpu_to_be32(value);
>              break;
>      }
>  }

This is a change of behaviour for this device in the
qemu-system-microblazeel petalogix-s3adsp1800 board, because
previously on that system the bytes of the rx buffer would
appear in the registers in little-endian order and now they
will appear in big-endian order.

Edgar, do you know what the real hardware does here ?

thanks
-- PMM

