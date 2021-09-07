Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC254025E0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:03:54 +0200 (CEST)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNX1F-0008AS-Gu
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWwy-0006hl-HB; Tue, 07 Sep 2021 04:59:28 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:37859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWwu-00019o-Vu; Tue, 07 Sep 2021 04:59:28 -0400
Received: by mail-qk1-x733.google.com with SMTP id w78so9350946qkb.4;
 Tue, 07 Sep 2021 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQTyvCtnDaAPGiV4Gm3wvQ0nVPyZV73ZjUNQOmaKquI=;
 b=lCVcAduD++/dKbVmf5slwb7XzrH80KNNmovftpyunNCxCL7lgI6WVx4uqVEceDfzwF
 lvDrhOufk/jwJsC+iIfN3JpD8GFssKa7bWA3LUTNpKvetIUWTOz/2BISw98YxlS7uAoZ
 bse3hgeIaNQ2xLTa4rVu8JaOQD8/6mfebdlB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQTyvCtnDaAPGiV4Gm3wvQ0nVPyZV73ZjUNQOmaKquI=;
 b=iEoWM5PPmMTQYgDE8naVVt9J45MDGtTPA6seMDfzhO5RElvRW6qyglmOcdNDn1oIsc
 uVyXYdZUAu+tQwiOLW8yluzLsOMjxX2D+FB62iV87COnPJSJXjC3R0b9Tu1/VyP6NIUc
 HKeGi1kjTzF5VOuzmqnjv+n5+lc3LdsU268kMU6IomPzttH8KdE2AqoAGPGV9OybrlS6
 +V3PMNCNmOCRL6ZgKMMxNnDe4eW/R5PQo9qjayt1RPpsvXSSjTtXNFRFIrYTE3WDsrfz
 rRLeGL9WA/tDz4r6iB52mYtMThTnqe7M9SyF85C7nSxcwfHq5q5zoB5L5Xrm3J76x6ay
 RPZw==
X-Gm-Message-State: AOAM533s12c98/IbW7J+OPPpVU9RcL1zu75/hrkSW1nuBXxK1aqH5cI3
 bQNaPgeCStxP5U2fazsY5x0GniQLZ7axq6z9zL8=
X-Google-Smtp-Source: ABdhPJwCnq0cdpUkhHtjQt6h+LZgQAD/RdZ5pzOAqtNzrPC7FoBhikAzGdkXSXHaMcrkgyocbdViFaRDtC0WpMUuIrY=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr14284170qkg.381.1631005163414; 
 Tue, 07 Sep 2021 01:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210906133124.3674661-1-pdel@fb.com>
In-Reply-To: <20210906133124.3674661-1-pdel@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Sep 2021 08:59:11 +0000
Message-ID: <CACPK8Xdmc3i8C7gkVxsuBcPuHKzDsTZ1tKcx5R7qVAHYN=uhwQ@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm/aspeed: Add Fuji machine type
To: pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Sept 2021 at 13:31, <pdel@fb.com> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> This adds a new machine type "fuji-bmc" based on the following device tree:
>
> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
>
> Most of the i2c devices are not there, they're added here:
>
> https://github.com/facebook/openbmc/blob/fb2ed12002fb/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh
>
> I tested this by building a Fuji image from Facebook's OpenBMC repo,
> booting, and ssh'ing from host-to-guest.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CBus *i2c[144] = {};
> +
> +    for (int i = 0; i < 16; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +    I2CBus *i2c180 = i2c[2];
> +    I2CBus *i2c480 = i2c[8];
> +    I2CBus *i2c600 = i2c[11];
> +
> +    get_pca9548_channels(i2c180, 0x70, &i2c[16]);

Wow, this is interesting. How did you go about testing it? Are you
sure you didn't overwrite any of the pointers?

It might be worth coming up with a better way of describing all of the
i2c buses for future machines.

Cheers,

Joel

> +    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
> +    /* NOTE: The device tree skips [32, 40) in the alias numbering */
> +    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> +    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> +    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> +    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> +    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> +    for (int i = 0; i < 8; i++) {
> +        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> +    }

