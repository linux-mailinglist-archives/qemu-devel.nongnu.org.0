Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1F2149C5
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 05:13:01 +0200 (CEST)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrv5Q-0005Ik-Bc
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 23:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jrv4c-0004fw-UV; Sat, 04 Jul 2020 23:12:10 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:39916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jrv4b-000483-Fz; Sat, 04 Jul 2020 23:12:10 -0400
Received: by mail-io1-xd41.google.com with SMTP id f23so36069092iof.6;
 Sat, 04 Jul 2020 20:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lmmq3pOJ8XpD/+z41UJPlhABVsMAZEqeiusaXpk+bps=;
 b=Vurskr+BiuCAcxLH171+5FGmcK4P7Y8oKu65ySNmRHP1/9mMx4pdenOP6RxZU5CdL3
 /uqF20H08d/8Wj8+Rya3Qy7SnTQWbk707N8zmC87Zc4Dc1k/Ed/aVUhlJSl6vSSr6gXO
 XNNbfcckZ9pus+BZZXN5diLbiPgkkZElIk8QmK/271ed3EHUcxPEJ6GfPtJXNKOvJkxs
 WXTefQNE1lNzIv/0THhjZ6oPjlguCr8IKllVM4cra55a2RE8e9Oj0R0xohUTRp2mb9wW
 /J4bJq+p08IAwcPdA4nXF0v93GFI+COrsCVyw3r76RlB3dZgGSC30WzFmCbtCs62aLRl
 yLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lmmq3pOJ8XpD/+z41UJPlhABVsMAZEqeiusaXpk+bps=;
 b=sKvbf1zxkf/UbH9gJvZbXRxedp/UpSts6PdddVIue8SsZ/NF/o7MID1/IYb4ZLuBeD
 pgaZdlsdGvUVyAomoOBU7j9qrtIFBPSNR8i6xzbAejWPKRVLiWdi7BHyeeNKayt/Iy0E
 oeFl1k/PiLnz1vXD0VlDB2n5sYzgcS2U5ovqQnNxqvC0YICl0FXWBjGB1QE/yvceTXtt
 gr5X/XEjGOzjGR2b5OIqLzEwK+ymDsyjYPWNZOJVhx2EONF5DBOeBtEOD39MHVaMEcBx
 p811BGmK1zme3l3xp+htlBMLXYOALak1n0UV4zD9u05bNp2C5sRUu0zEg0IugmNn93ia
 dWAQ==
X-Gm-Message-State: AOAM531IONuj7zqNIw1i9CrPuMJKV4djqsV/OQulfMYCQnt/tTgbYvrj
 81+xcK/drH0h7a4vD+qR3Mpse1fDuW+KY+WxwV0=
X-Google-Smtp-Source: ABdhPJxH+bgRb2ObKyBeN5Qw7US+AY7FpEJUBezJQXIiqQihdBtYpAYdIFyJoeEHPaVNYdW6r/49hNjlnoJu29h2FZ4=
X-Received: by 2002:a5d:8407:: with SMTP id i7mr19239804ion.175.1593918727693; 
 Sat, 04 Jul 2020 20:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200703200459.23294-1-f4bug@amsat.org>
In-Reply-To: <20200703200459.23294-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 4 Jul 2020 20:02:16 -0700
Message-ID: <CAKmqyKP5pv3YE3da0B-5cz-dJb+L+W9QH_st9yJgmA49f_80cg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2836: Remove unused 'cpu_type' field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 3, 2020 at 1:05 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> The 'cpu_type' has been moved from BCM283XState to BCM283XClass
> in commit 210f47840d, but we forgot to remove the old variable.
> Do it now.
>
> Fixes: 210f47840d ("hw/arm/bcm2836: Hardcode correct CPU type")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/bcm2836.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> index 024af8aae4..79dfff9d73 100644
> --- a/include/hw/arm/bcm2836.h
> +++ b/include/hw/arm/bcm2836.h
> @@ -33,7 +33,6 @@ typedef struct BCM283XState {
>      DeviceState parent_obj;
>      /*< public >*/
>
> -    char *cpu_type;
>      uint32_t enabled_cpus;
>
>      struct {
> --
> 2.21.3
>
>

