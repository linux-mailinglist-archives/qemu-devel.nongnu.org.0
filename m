Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CC629D96
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:32:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxtn-0003Aa-NZ; Tue, 15 Nov 2022 10:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouxtl-0003AE-V6
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:30:53 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouxtk-0007cL-Bj
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:30:53 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y4so13481857plb.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 07:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENXLXfZD2kh0LsP8cqYu2QnzNIzmJHd/emWlPGbkRRU=;
 b=DGino0ygI/z5O7SJZQUQDzC9WK3QPnJxFQ4Npludzyx7rRIGi+SXpZzXW+OiX7BGIe
 mSJhjmuMJo9ENxpAKO38Ho7bZKC4j3/KVYvH8NwYirJI/+FMZ8IKmhUgLFlK9zXtNa9p
 rfFuJg9PD5RjFIdu4qrm1aUR3VfgQ9gJJakMvupSHNAt5gM7IuIjRG5g/ikG3qZdEvKW
 4PgUsUKxuX6HkFPum6FkKlu9Sow9CF1Q7H7o3yWIP9PvfWiYNbnX1sJP4fJtVWeVvnKF
 Rop3+W9dFrvtIUa2nRgSuLDcmSNm94sSsAVVyZeb1UflgA9cCK3gGEO51Fg3gkYYdjl7
 i+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENXLXfZD2kh0LsP8cqYu2QnzNIzmJHd/emWlPGbkRRU=;
 b=LtP7wc04X7fSmI6vjnqW2wcp+/8HG3c6YNT3pVNr5NJkyVJWvJGcKzadM2Kd6S/eNx
 5+fpa1Zi1NS86NqiQ8dFrQ1h0gTFi9lCBNmJUCpEO0Ix5rJ9yMvLj0WQm7/kKgJ3lrLd
 UUYTnuRz0xyzOB0EfJ3GfkhJCv6i67NprL8nUvO0Yzjg/+R7qy34DJPwkzm16hBrl5gl
 GlDA6Qo6T3ujVIuUIF3fLhjcr6r8Si+6u6A9UkL1VtIuu7IPI4J7j74NOtp74oM2o2hT
 aXhHExDXH7WmmKLwcc/yKGVnoYXa6G7gse2tMmlur1XdW88jfR96f7ShGalpCI8P8e2h
 K0SA==
X-Gm-Message-State: ANoB5pkzbTrGI67MAcNsxVBzwEa6In8UybwQvFH53P0WVDCm32rmhQ5P
 l/5UNVcraKtpizj6Ca5rs6lNtyPsCggh7VKbpExOaQ==
X-Google-Smtp-Source: AA0mqf6+u4zZ5Hed8OoUY2al6yrziJJWYoaFW5z9jyqrHFKOAbZ/n+rlD71Rz9IZveQbZsZR1It30MhoSDrwU1u/7Ls=
X-Received: by 2002:a17:90a:1a13:b0:212:d62a:aeb8 with SMTP id
 19-20020a17090a1a1300b00212d62aaeb8mr973586pjk.221.1668526250105; Tue, 15 Nov
 2022 07:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20221115151000.2080833-1-clg@kaod.org>
In-Reply-To: <20221115151000.2080833-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 15:30:38 +0000
Message-ID: <CAFEAcA-4omeOGcxAU1GKrvpT3LrL8Zk3QnMLZe1oD+EiWpT2kg@mail.gmail.com>
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size does
 not match the device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Delevoryas <peter@pjd.dev>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Tue, 15 Nov 2022 at 15:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, when a block backend is attached to a m25p80 device and the
> associated file size does not match the flash model, QEMU complains
> with the error message "failed to read the initial flash content".
> This is confusing for the user.
>
> Use blk_check_size_and_read_all() instead of blk_pread() to improve
> the reported error.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 02adc87527..68a757abf3 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "sysemu/block-backend.h"
> +#include "hw/block/block.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/ssi/ssi.h"
> @@ -1614,8 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error=
 **errp)
>          trace_m25p80_binding(s);
>          s->storage =3D blk_blockalign(s->blk, s->size);
>
> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
> -            error_setg(errp, "failed to read the initial flash content")=
;
> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, er=
rp)) {
>              return;
>          }
>      } else {
> --
> 2.38.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

