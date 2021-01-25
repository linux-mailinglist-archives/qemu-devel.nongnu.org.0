Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456383025B0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:49:53 +0100 (CET)
Received: from localhost ([::1]:59376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42Fc-0006wL-CX
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l42EU-0005xu-PM
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:48:44 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l42EQ-0001Il-D8
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:48:42 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a10so18090566ejg.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 05:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9PQAHG/OKnFAYRPTQRas8Brwzd83UEEmSalTBKDNPns=;
 b=puERnuNdoY4COAcIa3W6qlfanB7NmRws3/f+lbQruVhFUn+fIQjRIgFelDzXWwzv0b
 dioz3Ps88PXUZ0xXfgUbKR8/Ga1ITwXbRaP7J7oh7we7s/JY7ws+xw05KRLbJtgf9iTI
 b+MjcWJCw0MkT0g3+7xrUBu+5JX2K6g8gUVkryZO6aWCn2QxusW3BsdeJfCF7C0rOe41
 5NBdy52nh+uMaKGyi2fhZcuAgjzsvKsksY87uKWDsuP8YUIr+UQndUnHeLK9Mn2/ECxN
 uznuVUOUulO0+qtWhO9Fa/a30tWCIwE2mNPqqT6KbZ5tZZY5p02CIaVdW86K24L2J2d2
 C1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9PQAHG/OKnFAYRPTQRas8Brwzd83UEEmSalTBKDNPns=;
 b=GzcTxU14YHtrPnPO+Vp1X7jzo5H1kyRRoiG5Emxr+iFhksiDxVhs1Wt891IogwQ0Qo
 WdAKI938I0e7JiClnSkoy1evuZN2ua2MAovIMrlnEOYCttDT5j2MUoxwpceKJo+mYxde
 0A5qbt2XkWlsrNFzV4K1nH7AiDXyqOu1psxila4g0rsVjQMIstXwbgSovpCSKX6oexg/
 uGGMntrnFgu/LknTLMysaUHEtnTmJbdvN+m0dn3XkikZy8T8zWn8KtCy6a4U62O9SIWx
 LyvsOjc6dtpccSMTlBbEoZk7/ZmUzNvGNmK8u/PdJxph0J79dg6GPTjuusfrv/zE1wUV
 jYeA==
X-Gm-Message-State: AOAM532B7HtUvH0OwUauvIEAc4kgUFRyvBRJj5cUqW/0QoGZ8aRO1QZq
 EIiBaxpJaqW2XslTDlQuN51writPGjEpj2r5ZzgO5A==
X-Google-Smtp-Source: ABdhPJzLbIs/EpjhDIO7MiOj9VkJL1wZp1MWxXOJv+v1JsTPqLUcNJkKZ1MOO4J+zt0TTHzS98X18Iw8JK/oYvqZTQ4=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr454288ejd.250.1611582515252; 
 Mon, 25 Jan 2021 05:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20210124201106.2602238-1-f4bug@amsat.org>
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 13:48:23 +0000
Message-ID: <CAFEAcA-xagpKmjRs2zf0N-Z2M6OkuxAsB7sVs7h3_uRbH80fkg@mail.gmail.com>
Subject: Re: [PULL 0/9] SD/MMC patches for 2021-01-24
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 Jan 2021 at 20:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit e93c65a6c64fa18b0c61fb9338d364cbea32b6=
ef:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210122-pull-req=
uest' into staging (2021-01-23 14:40:45 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/sdmmc-20210124
>
> for you to fetch changes up to 3f20ccd359913013723f64e2443dd513786039f6:
>
>   hw/sd: sd.h: Cosmetic change of using spaces (2021-01-24 20:11:05 +0100=
)
>
> ----------------------------------------------------------------
> SD/MMC patches
>
> - Various improvements for SD cards in SPI mode (Bin Meng)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

