Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13453DE92D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:04:36 +0200 (CEST)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAqLj-0001Fh-PJ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqKJ-0007xh-DW
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:03:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqKH-00037M-3r
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:03:07 -0400
Received: by mail-ed1-x533.google.com with SMTP id y12so28091308edo.6
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d64XEW3wUlV0KaJdc/F+hRb1GggDsSVbQTTFUSTUnXY=;
 b=aUCAu2MJHYVv3QE3WeylkrOYvaHkPxqL8FuKX1aXd2QK/KBzyDALnZbgoKMTh0ks5o
 dcpsUaqa+dSMhxXRdA7EmF4oO4cJZjqLP4Yb97COdF3/VLPW322uFVpW2xU3bsh+T9zq
 L6x3oQpcYG+HqwJMPjLMM9lvwg9dAbyMg+u4m8vfGxlj6lDh6L/OxrQGMfjBwCpsMZgH
 t9R8SrksvHn2VhdGfjvYMln6rxcWfd0q6xuumI6XbOPMV2H/Q4ck+FN1jFYFFTRV/O/E
 xGWacEPERfDv/G5T9iJtw4m/iLJW2+bMwe3vcWg5WwW2WiAoiNFtGSBMU31sSKNKvCUR
 BSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d64XEW3wUlV0KaJdc/F+hRb1GggDsSVbQTTFUSTUnXY=;
 b=CTtphdRbAKvzBA3RY6SMASCX7jUuA1GDtZEdunenuGKhT26b4HTKMK0UshrZl23syD
 CtwDKEILiVTc573O6/eQncubXdWDu5LfdW3l6NuSDnSKTisRq3Zkw2nOTuWtkbsVAAMJ
 ItkYqs+WiH1qCcT3siJ7eSXCWdvKKpNL9kk6mCTaUti1trc3y85c2NXeZ8JFFZG/uMY3
 7HjwDM0oqFbNDjf5VWw+vsTqIXXevSMW/5x9JrzeBM2rVDoF580WI5zT3x9TLsTw+NBO
 9a83/q70QsyOOtftU/Y1Li324LsknCWW9XLL7A7jSGxK8upp9k34rfme+iHQZZg/ZAll
 iYNw==
X-Gm-Message-State: AOAM530Nwor2fY1Wr2VOSirqvgKvIybh+1qnMSHUa71ZvbslxHc8ySlk
 zLqvoM1QnytKDQYJFQEvdvCFZt3zR9ocp01L2IykUw==
X-Google-Smtp-Source: ABdhPJyUsFYg+jXjpC66oIaS12aFtiWFePeqlNllZTnotCEzE1ejEy+lEkLr8XjeW9EWKvdTnWFUpak1R/dkVuCuhSw=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr23847042edt.100.1627981383638; 
 Tue, 03 Aug 2021 02:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210802235524.3417739-1-f4bug@amsat.org>
 <20210802235524.3417739-2-f4bug@amsat.org>
In-Reply-To: <20210802235524.3417739-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 10:02:20 +0100
Message-ID: <CAFEAcA_2ZjWPAicq+yUDW1y6rqfTXRuG3HVXGSs7hT2s9qJC+w@mail.gmail.com>
Subject: Re: [PATCH-for-6.1 v2 1/2] hw/sd/sdcard: Document out-of-range
 addresses for SEND_WRITE_PROT
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 00:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
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
> Split the if() statement (without changing the behaviour of the code)
> to better position the description comment.
>
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
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
>              ret |=3D (1 << i);


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

