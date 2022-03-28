Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37614E9102
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:28 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlW7-0007Rj-Po
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:18:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlRg-0003VC-SK
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:13:55 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=46693
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlRd-00071F-K8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:13:52 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d134so14021702ybc.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=koFHKxMx4foaTkt1A8Zr/I20XaHqP1gcSqnurmGbBuM=;
 b=DOcS1e6HH4/pCpXvnnetx8cw1ZwqwmUCPjzCFl2Q64vPit4ymMnejdPuF8YS4N8e4c
 LYZ5ggrhQ58LrNGPj/YcVc1vH5o6NpogT+n1tI7FSYRsy0R5sROvIV7T/w4Npcrz0Jp1
 P0wwM72EWo8v/qJ+AOeyBKK/BCOuVeOj9hD+Xt2u1lBvLRVApg1+yaAfRPLJpXBNel0W
 s1gXYTSy4Ccxb7EIvJw8Uj/H/z9KlvqoO7b7G/7yPNjMotmZjMzU2unh0k2Ej9FG/ntt
 nkYsZwvXMR7KEliKLRZTbXY+avp4zZnqWqnCbG+lBUFg/40D/u/aEftOyw5BGOBbveKV
 gNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=koFHKxMx4foaTkt1A8Zr/I20XaHqP1gcSqnurmGbBuM=;
 b=nJVYR6LN4PUL7u2B/B990y5ao6DJ3pXbhSbR4tiLEyQm0afRJc87K/CX/2T6/s8RH3
 4Jj9t6dPtU4YKIAMfQ6be7IzaUXkmFboKRrMC0a/oGQgVfBFiXC7NP+Id9KdsTkn66Wm
 6RtXTYosQvUlvPqdU70EE91ypqXsGNPRLgA3EQqd4+hQADI2MdEQZvmD2/0Z3B4nTwKK
 fdjUAyQdxd2w1VNvYEzzfzUiMTPcd3SMXKoAGmgEyIhIrMggpxoYFORf5vqoFX5PWPq2
 gdld5njM4hU2qSHIsf3XGeSKPpOZz52So7DpBbzg/4Z/caF/ia0pUCaCSij2BjOJfqtz
 cWxA==
X-Gm-Message-State: AOAM532BX8eWASSEDxFFqFwRSHBZqFz1vTZ8lywg0nrvPbgp3V1wcphb
 lxNM3ruPUctcAiFvHp6z3xC/P60Uh7aRDRygtYxtcw==
X-Google-Smtp-Source: ABdhPJz//WQw/l65ajxBY8UHKpYLiYxFLyPdX/FajgVc5PQ/fAMsxpy+DsKJN+k7dWGF/Az74D8QFbUsLZOr1Gbp8bQ=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr21681543ybf.288.1648458826169; Mon, 28
 Mar 2022 02:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-4-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 09:13:32 +0000
Message-ID: <CAFEAcA8-46DdsxXeWSb_smnGdBvQ0D31B1STC1O5pQNjJcfQqw@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm/allwinner-a10: fix format-overflow warning
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 09:48, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ../hw/arm/allwinner-a10.c: In function =E2=80=98aw_a10_realize=E2=80=99:
> ../hw/arm/allwinner-a10.c:135:35: error: =E2=80=98%d=E2=80=99 directive w=
riting between 1 and 11 bytes into a region of size 8 [-Werror=3Dformat-ove=
rflow=3D]
>   135 |             sprintf(bus, "usb-bus.%d", i);
>       |                                   ^~
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/arm/allwinner-a10.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 05e84728cb34..79082289ea5b 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -130,9 +130,7 @@ static void aw_a10_realize(DeviceState *dev, Error **=
errp)
>          int i;
>
>          for (i =3D 0; i < AW_A10_NUM_USB; i++) {
> -            char bus[16];
> -
> -            sprintf(bus, "usb-bus.%d", i);
> +            g_autofree char *bus =3D g_strdup_printf("usb-bus.%d", i);
>
>              object_property_set_bool(OBJECT(&s->ehci[i]), "companion-ena=
ble",
>                                       true, &error_fatal);

Another false positive. Maybe we should feed this back to the
compiler devs for them to improve their warning generation?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

