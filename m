Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E651307883
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:48:12 +0100 (CET)
Received: from localhost ([::1]:33414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58ah-000864-1l
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58Ua-0000Ya-5m
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:52 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58UV-0007HU-Cs
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:41:51 -0500
Received: by mail-ej1-x62e.google.com with SMTP id l9so8142315ejx.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6HIVzNVqs8si5zhdqS4qhDfVW8FvAwhegS35T9JqgpE=;
 b=vn0COtHbqCX//3Jyne5pmBN7AbiywrY2BdjPoYDOnuHLWGPsP6i8yV7EJ840G8Q3Wd
 E9gs1bTIjhGb8oRTuXCHTBxZbTdvlN+9ZtZNtcDifir7OLUmF/hnnocPTZrw82rfLc63
 s5J0qlq1utLixiY3CrFhkF6l8BcdaqAs0HHHS3WZBo1n0QLnLttPabmHVvjRMDbP8PVn
 ZHrON4NThmpLQAHOv74qu5Xa0S1nqcXjZv3plOn+krp6eQrtb7igxV0MivBT6Pl0tnxF
 x+whjAisN+5KQT7nb+HZxG4wuDzpIlfkxo40ObnmFoNi+PwcJ6fVtAw8X35s9t81FWh7
 aF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6HIVzNVqs8si5zhdqS4qhDfVW8FvAwhegS35T9JqgpE=;
 b=MzdgQZ3MkXgxX3AzS5P657e1D6gbNeRIEuQPCvksyToerNbEBQlD24qbcwam9A8a8E
 9A/KzY5AZRuZgXjQude9Ne8A2Al27opKE4uOvxi0Rdu51R4PvMxtvGDkpTzg1/Khi5OJ
 rQY5Pirf4E2/PbJ0SUyrgc3EK59N5VAEsi5kX6fZnBtBZFi8Smww/jpENa7IF8PwMldN
 qtY7OoIvuzsE4V2zUQeYAJyqqPmcX3VXHHLON6h6prdMwg1qArNNvHC0ms7Q8pyIn9k+
 Ip/pt57wVO6Qeotbns3mG+JAqmhIerg1E9LXCmOFPyr5+dptAh6x567aUEzdrtxDTVIw
 OYOQ==
X-Gm-Message-State: AOAM5333MRjLc51C/F60Th62X/bOwaeSe5Dd9rXSs0trSYd2Q8IcDSba
 YpPFiElTqMgtmWCi8kTdlvVtLL503QLtVJRiEglOBA==
X-Google-Smtp-Source: ABdhPJxn7B6ZLk8bLMCl2pQbuB6DZnwArAZyq/GNWalr7J94Xf3k+7ZxEBW8F+T5DAUUYxXrsH5l68shEJPgpSDonso=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr11681040ejt.56.1611844902345; 
 Thu, 28 Jan 2021 06:41:42 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
 <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
 <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
 <9a8312d7-d3b3-b896-a669-8ce8efc66bf0@amsat.org>
In-Reply-To: <9a8312d7-d3b3-b896-a669-8ce8efc66bf0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 14:41:31 +0000
Message-ID: <CAFEAcA9LbKUZPhDfqQjHGfF9s-Se2drWYmKkn6pHY3gQit=BcA@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 28 Jan 2021 at 14:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Oh I totally missed that :S
>
> Bin, I'd correct this as:
>
> - extract imx_spi_soft_reset(IMXSPIState *s) from imx_spi_reset()
> - zero-initialize CONREG in imx_spi_reset().
>
> static void imx_spi_soft_reset(IMXSPIState *s)
> {
>  ...
> }
>
> static void imx_spi_reset(DeviceState *dev)
> {
>     IMXSPIState *s =3D IMX_SPI(dev);
>
>     s->regs[ECSPI_CONREG] =3D 0;
>     imx_spi_soft_reset(s);
> }
>
> What do you think?

That doesn't give you anywhere to put the imx_spi_update_irq()
call, which must happen only on soft reset and not on DeviceState
reset. You could do one of:
 * have a 'common reset' function that does most of this,
   plus an imx_spi_reset which clears CONREG and calls
   common reset and an imx_spi_soft_reset which calls
   common reset and imx_spi_update_irq()
 * have imx_spi_soft_reset save the old CONREG in a local
   variable before calling imx_spi_reset and then restore it
   to s->regs

thanks
-- PMM

