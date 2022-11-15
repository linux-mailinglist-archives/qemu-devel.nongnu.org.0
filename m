Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018E629C2C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oux1V-0004fd-Dl; Tue, 15 Nov 2022 09:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oux1A-0004d0-8M
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:34:30 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oux18-0006JI-8w
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:34:27 -0500
Received: by mail-pf1-x42a.google.com with SMTP id k22so14276865pfd.3
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyIozUxRyN9z/nuVqumh80hdOoSlS2ynRIioWn0ImSY=;
 b=DK/5rykTk6Vxd2y/QUl1ePLjt+MksZmcpVfLNoLL3YMAVcw/oRIDYoJbbPpZhEjxHz
 dN3RI2Squ/U5eTv35WJoys246F9RYRrsnpmTvPgzOsgikVonZiCuzBMme90yFy8qYfZi
 hJBEF2LRlY7w4DA5Cyimu16Y43tlFX3j7bccSmZKecRmD06WZTQlGmmjePEyjMYgf4Gx
 d+hb/AVtuAu0bS7LgGYs8i1O8c1W0lx7BMTHCqHdDxF0cFF5AbBGAkgzpqpM8ME0Bw+S
 C8n820p2UgRTnrA8JMq11q9Z1xK/dpQhLH6/P75rxS3PsSPzjUGC9/5s1/iAzy5Ik8uV
 IWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyIozUxRyN9z/nuVqumh80hdOoSlS2ynRIioWn0ImSY=;
 b=4O7F0+XL/DxB4feIPATl7tepRF+tpILwf52JgAbDLiWNEmUJUYp/X1QoOBN2O13b4b
 hmRREyO7mUE5bVbUW+9b2skNx+981JlfWNS7RBLAy4UnF2b4UHAcOl/nYDuv4Avb2Jnn
 PQlytpZM2FtEAK6b+E5udD7oVFUbD7+wYS+ZbJ3jleCdP2KeOPUjm1oGfMcYr+ZL9GAB
 g98T3URpbBcb6B5EQQx6ZLS7FkU5ZvVXVnKb7y8ppHcd2rIWu0wW4gz0la9FN4iZRYbR
 QLugXoId4W3TBJj6EPBb1sKcc/y0psOrUbMneZcxbxaTjBy2EM8nS7CSGsDlk+TmeLGd
 ZIEA==
X-Gm-Message-State: ANoB5pmFzLNkWu1WCD+VXT7Dz2LwRq64gXQ0vDtv1pNkPX6D3Fb8etCL
 okXZGSDmfJuO03OXzYoPSiF5Rx/X9M8Rzk5DygMDLA==
X-Google-Smtp-Source: AA0mqf6/J1qhG55xbzaSIEj3ZbbykBQZPkk3MUgFJ1DiNFC6NMmW1tWsjf+6e18BVTHdCdRxCqnS12zpJHynmgXjr9Q=
X-Received: by 2002:a65:63c2:0:b0:46b:2753:2a60 with SMTP id
 n2-20020a6563c2000000b0046b27532a60mr16145886pgv.192.1668522852895; Tue, 15
 Nov 2022 06:34:12 -0800 (PST)
MIME-Version: 1.0
References: <20221115142141.2073761-1-clg@kaod.org>
In-Reply-To: <20221115142141.2073761-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 14:34:01 +0000
Message-ID: <CAFEAcA9OiNsX4-O60zKXL8WoEJbOH2TQr3LwDFJH4SOS8EPTMg@mail.gmail.com>
Subject: Re: [PATCH] m25p80: Warn the user when the backend file is too small
 for the device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Delevoryas <peter@pjd.dev>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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

On Tue, 15 Nov 2022 at 14:22, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, when a block backend is attached to a m25p80 device and the
> associated file size does not match the flash model, QEMU complains
> with the error message "failed to read the initial flash content".
> This is confusing for the user.

The commit message says we get an unhelpful error if the
file size "does not match"...

> Improve the reported error with a new message regarding the file size.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 02adc87527..e0515e2a1e 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1606,6 +1606,14 @@ static void m25p80_realize(SSIPeripheral *ss, Erro=
r **errp)
>      if (s->blk) {
>          uint64_t perm =3D BLK_PERM_CONSISTENT_READ |
>                          (blk_supports_write_perm(s->blk) ? BLK_PERM_WRIT=
E : 0);
> +
> +        if (blk_getlength(s->blk) < s->size) {

...but the code change is only checking for "too small".

What happens if the user provides a backing file that is too large ?

> +            error_setg(errp,
> +                       "backend file is too small for flash device %s (%=
d MB)",
> +                       object_class_get_name(OBJECT_CLASS(mc)), s->size =
>> 20);

This potentially reports to the user a size which isn't the
right one for them to use to set the size of the backing file,
if that required size isn't an exact number of MB.

> +            return;
> +        }
> +
>          ret =3D blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
>          if (ret < 0) {
>              return;
> --
> 2.38.1

thanks
-- PMM

