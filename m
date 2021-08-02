Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C133DD54F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:11:16 +0200 (CEST)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWmp-0007iZ-9D
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWd3-0006iz-H1
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:01:09 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWcy-0004R1-1I
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:01:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id y7so21866315eda.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vHq8CWy0CabcoM7CFgey8Lk7fxauhOp6vwrj4z33uYc=;
 b=craAnEFVLGh2m+D+bQKGfKtWyZOUShfp0V0qyEKQxq8fo2kSuamDcReamZiDxFrKQg
 bmFQpk5x3wf1Y+/d4Znv2AgP6gROFn4nQW9PWwjE2rqbE5ljve9Z82UswbdmCa3TcSgz
 0jk1WCnL6tOBzE6EiQVPtf4A2ozQRbnUTQAsdY3X49cWcsU+ywPQdGGSTg+0rGgATSKM
 tLmltgYVJUeYZLlpjwkCmRlhi83C89mX8UYxgB5Dk01pUkW+ZWGQVSW8an98HaHszoxS
 CvkxkdcNq5oER2yOCPPyHiLvVi8r/p2NO9cSKXSXZQBEF0NexX28jsUcnmQteMX6cTMa
 23rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vHq8CWy0CabcoM7CFgey8Lk7fxauhOp6vwrj4z33uYc=;
 b=Z/V90c1TLil5bnKmYOGhLjw0CSRDGwncm6eH8vwzSosGl9EIj8gxRhaaWMZMMZYQyz
 f+Q25R1b698PgCSwBpRm7wkdGP5r0dhwP1Zfd7hH2hPGPAr0IbdsbjAF6uMuA8G/rY3h
 dF7s7ukmwwzLTL+3/mpi8sI/2vYVFatVdYyh9pbNEABGAwiEfzrWgMv9GCmOEQ3s8hrb
 nZL48mOgFWO/Ej41EpMWfrK9v9dNZmA/KZTK84G+mubMD+FKODyckTd8lPAfS6saHV6d
 LeRLVsJpyS3fIBxRsYOvlxzFiic73+zK4zwv2rIyUklXyUbmlbhifR11qDN7GZendxX8
 9meA==
X-Gm-Message-State: AOAM5300CKpqlARB93oL0d/uux6cs4f3JBRsG1rynMArdeAaoahyxpBn
 kEJsga+d3Y8j6HCyRtAw7YczTL9KK+v66Hwllq/xhQ==
X-Google-Smtp-Source: ABdhPJy3f1Sey8ZDSHk4+rIqDFhZ32aKe3PwwY5OQkfrmC59xoaphAMeBmhfAv7dPzTm0UFnRe7sqqB5Co5cSylSjwk=
X-Received: by 2002:a50:f615:: with SMTP id c21mr19360591edn.146.1627905662580; 
 Mon, 02 Aug 2021 05:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-2-f4bug@amsat.org>
In-Reply-To: <20210728181728.2012952-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:00:19 +0100
Message-ID: <CAFEAcA_FSR23eR5Z8ix3HyFmmoFVK7eQCRqwA-YEuSqEMA4TkA@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 1/3] hw/sd/sdcard: Document out-of-range addresses
 for SEND_WRITE_PROT
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Jul 2021 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Per the 'Physical Layer Simplified Specification Version 3.01',
> Table 4-22: 'Block Oriented Write Protection Commands'
>
>   SEND_WRITE_PROT (CMD30)
>
>   If the card provides write protection features, this command asks
>   the card to send the status of the write protection bits [1].
>
>   [1] 32 write protection bits (representing 32 write protect groups
>   starting at the specified address) [...]
>   The last (least significant) bit of the protection bits corresponds
>   to the first addressed group. If the addresses of the last groups
>   are outside the valid range, then the corresponding write protection
>   bits shall be set to 0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 1f964e022b1..707dcc12a14 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -822,7 +822,14 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr=
)
>
>      for (i =3D 0; i < 32; i++, wpnum++, addr +=3D WPGROUP_SIZE) {
>          assert(wpnum < sd->wpgrps_size);
> -        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
> +        if (addr >=3D sd->size) {
> +            /*
> +             * If the addresses of the last groups are outside the valid=
 range,
> +             * then the corresponding write protection bits shall be set=
 to 0.
> +             */
> +            continue;
> +        }
> +        if (test_bit(wpnum, sd->wp_groups)) {

Am I misreading it, or does this commit not actually change
the behaviour of the code ?

>              ret |=3D (1 << i);
>          }
>      }
> --
> 2.31.1

-- PMM

