Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82093077EB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:24:11 +0100 (CET)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58DS-0003qm-MW
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58C2-0002t4-Q3
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:22:42 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58C0-0000S7-Tk
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:22:42 -0500
Received: by mail-ed1-x536.google.com with SMTP id n6so6786279edt.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Tcbr9SedKFrNWTq4e/LLHNQILimboW0eGVvS+bEniw=;
 b=qyY/HXQXptNOa5T8hs1kvW4IKbJPZ6FpYo9Xe9CXzR7s8bHNQD+qiV2K52d+0NrCh6
 wuU1Cz/1JUwjnpVQUanfnaq05fFCQRMaoqYl9B/UAbhXLh0r/BTT8mvGSWib/vjzvD7w
 zo0YgkdEraZhEOeK3Zr7ro4EVYDaBU4ScCUIPb15gvwujbc9fV0nJK6ODLgZUwcByF2V
 6b+g1UUGa8dMUHYvIne5szc27uNN3azg6XNONst8igOnVQNZ4uauSlOtRjAJeMKw6OoO
 YK7xZytfkuJn5CWTnT+WSNBAeqeCDzZoSvoMqzdbq2sKgYlHD/EYwjfuDqwrAYsH2lvJ
 FNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Tcbr9SedKFrNWTq4e/LLHNQILimboW0eGVvS+bEniw=;
 b=RNVye2XeqfMMFMrXQxJqj8PaCIlYFgrxYmlu9+Aifsu1ntjUbsiuuHnThyn7LQO4hk
 qO0VxK+0sqghRBV8bsCy5UYpXkQiOjF+3CSc51Ic1Bu+YRVlhha+djsab00HhxpXyM/b
 h7RFznVZKLhuGs3WCNkbeWRiKk5hUy+Ija1uv433gfSGmZxGDUj8MKU7SvQVjdp3uAWF
 H5tmYnCFGbhWVpgNRUMpln80tljVJrzlBzNmOybVKNCJf+pD7wY0BLbgmAQPIHN/MYCY
 8+FTivdxKH/h9sCkzYVJJ659o9BDOGVxkbAnnT6p9a41U0gu0PP7qzeqUzp9a3Ura3SA
 SkOg==
X-Gm-Message-State: AOAM530xbKyrzVQGjn9EE4AoKTF53PM7v4QWzLcFtgGH4AYeVj4E8pHa
 NXAvhKMWlFhc8BxdEsF6BP5Mh92IpB2es2SBSCK4Ng==
X-Google-Smtp-Source: ABdhPJxeRYZ/DjXbTOu59+Zl39D6ljotFEFwNZnw+UDMAEV9t3tLO9oiDYiZI8QlzsIeT86xqZZ4ZonY021UA2Im0pg=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr14328349eds.204.1611843759171; 
 Thu, 28 Jan 2021 06:22:39 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
 <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
In-Reply-To: <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 14:22:27 +0000
Message-ID: <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 14:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 1/28/21 2:54 PM, Peter Maydell wrote:
> > On Thu, 28 Jan 2021 at 13:47, Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
> >>> This retains the CONREG register value for both:
> >>>  * 'soft' reset caused by write to device register to disable
> >>>    the block
> >>>    -- this is corrcet as per the datasheet quote
> >>>  * 'power on' reset via TYPE_DEVICE's reset method
> >>>    -- but in this case we should reset CONREG, because the Device
> >>>    reset method is like a complete device powercycle and should
> >>>    return the device state to what it was when QEMU was first
> >>>    started.
> >>
> >> The POR value of CONREG is zero, which should be the default value, no=
?
> >
> > But you're not setting it to zero here, you're leaving it with
> > whatever value it had before. (That's correct for soft reset,
> > but wrong for power-on.)
>
> zero value on power-on is what I tried to describe as
> "It is initialized to zero when the instance is created."

Yes, but QOM device reset does not happen just once at startup and
not thereafter. Consider:

 * user starts QEMU
 * QOM devices are created and realized
 * QOM device reset happens
     -- CONREG is zero here because QOM structs are zero-initialized
 * guest runs
 * guest modifies CONREG from its initial value
 * system reset is requested (perhaps by user, perhaps by
   guest writing some register or another)
 * QOM device reset happens
     -- CONREG is not zero here, so reset must clear it

thanks
-- PMM

