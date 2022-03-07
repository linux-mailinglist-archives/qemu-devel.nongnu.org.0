Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21894CFD64
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:50:08 +0100 (CET)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBsN-0002gO-Lw
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:50:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRB7V-0005xF-L1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:01:41 -0500
Received: from [2607:f8b0:4864:20::d30] (port=33473
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRB7L-0003e5-JK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:01:40 -0500
Received: by mail-io1-xd30.google.com with SMTP id 195so16622618iou.0;
 Mon, 07 Mar 2022 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pqM62srZHUw3ZxRPiEZRfEggvxHBZfijUbmwzqA3LH4=;
 b=P5CQqqP3Hj70rwX1t9G3b4mlfiD/dN/Mh99vSJ7W4UWpCA6ZQkh61iGummQdwRgcFL
 sPmtPwqXuBR0Ha51geVXAiktbV5oKhPuvLwdMzuQac68WFObQDpAAKmxgGWP0U88Ma60
 vi/91D6eD/gjNoal+cqX7Ag89dQIkG/Fs9QwmhuNhcsyNPOd0DT1tS8WqhINj2TZqrEE
 etXzfK5nNfSlWSsPEGh65TcmoxEcJKhfY8eiZzh7NxoheBIm7yuGeLt+T7KLe64c5hHj
 IQXKJbDJySfs1NkSbdJ7BK3kfbZMPgOqbfEw8nIyRii1B6hHuzABKF3LuPOAXNebYc3k
 MFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pqM62srZHUw3ZxRPiEZRfEggvxHBZfijUbmwzqA3LH4=;
 b=DXx/fCw7DWl3kWdj6Gs5mzgl17LTCjtl8khp08uw84rMNVEeZm4U3gto2EV8a31Rog
 GfwKLsN1rYZNzubdHqdiwI0FaqbSq9Pw/OPaJz17uUibCLELSHht17g0K00/Fys/vKGi
 KKGOCgjHSs9S5IKihhk2lUjcRVxnSNaiBumViIA2QGJaySfN3B4TOZu9HaAFNHOgkgDa
 RxNEjMLE/8NnMuwNzSOxJtMHjih/PUVbwzqG8CEqrOPZ2iBXmbJJa1lABQywZa0g2C/4
 M/eYeQtgYqskNLcFC1XsCZY08URSta2ufuF3Tu+8F0mLM54RuJwj5hj2rKJTrUd4oXe3
 j6sw==
X-Gm-Message-State: AOAM5310tdOKoCOn6kC9OBcMcesKF02r+ZfgQdF2ySLkZYjnVI/IuS2r
 E82hZofyNxzNvIrglimk/IS7GmYKJugZaw7NvsY=
X-Google-Smtp-Source: ABdhPJxNlka71Wywsmb9pYojpcvi/Wczr3kwfzlSEm2hh2PnQ48eLZeJvlyIxSkwLuCePrE4K6RWTJ78cvcLr/KjUVk=
X-Received: by 2002:a05:6602:45b:b0:645:bdc2:fe13 with SMTP id
 e27-20020a056602045b00b00645bdc2fe13mr5243891iov.114.1646650889999; Mon, 07
 Mar 2022 03:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-7-clg@kaod.org>
In-Reply-To: <20220307071856.1410731-7-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 21:01:03 +1000
Message-ID: <CAKmqyKOEg8ZQ1g6vsPETxi6baCiog25BM5oL_r46LtTF-tOg+w@mail.gmail.com>
Subject: Re: [PATCH 6/6] aspeed/smc: Fix error log
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 7, 2022 at 5:32 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/aspeed_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 113f31899a6b..f410248938c9 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -327,7 +327,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
>  static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
>                                                unsigned size)
>  {
> -    aspeed_smc_error("To 0x%" HWADDR_PRIx " of size %u" PRIx64, addr, si=
ze);
> +    aspeed_smc_error("To 0x%" HWADDR_PRIx " of size %u", addr, size);
>      return 0;
>  }
>
> --
> 2.34.1
>
>

