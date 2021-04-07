Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F48735746F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:36:58 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUD2v-0007KG-0C
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUD04-00062T-Kq
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:34:00 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUD02-0005Ja-Us
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:34:00 -0400
Received: by mail-ej1-x631.google.com with SMTP id w3so29294181ejc.4
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EvBUytbF0u9Y37zhuQWxKu0ki/OoBvG5WSFFefH+HnU=;
 b=FHCq/JDjQtTkfDINVJn1rxZ1/P1FyqYfMr8n1/TEZFe0IzFjhBl+dOEHLXncikAA5r
 dV6XECNRPqOhYfNk2ez89hR+4nyoEZaFEP9sNKfPnTX2lhCOZwfEi3KwXLI3mz8jWYpn
 0R9gsKyD+CvFawdl7fEhN6KoCNk8DZCKyrCSZ2SFAy+oxmWtRsEWUELTpndxKWVeVeCM
 CiERs0t3mSx96rE0wNl4/D4gNSa1zn57zUx46i7weCAdsRqBZ3z9SJwZWjzCsNGq7HC+
 1uWdBSM3qPlz4XvNh9sclWtRvoVveAVfjM/XkE/6Dt++gbDJXQBjspaX9hA9diOGOHv4
 HwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvBUytbF0u9Y37zhuQWxKu0ki/OoBvG5WSFFefH+HnU=;
 b=uV2kEs++qoVuVCUJnNspXmVJHhWgZx602w8TghX4n/o+lzTojxs/6QS6+9XF/T9gw2
 WW/O6D87OTbNQ7yTq/QmWg/P52KoDxb8KoJk/E9anjzwVyP3lubMYd3WLX4z8Edhxr/p
 I9snCUNGLvcq6iI08St/2LAg+GOmOIzAOHdO/XAOxy/4ci4NnSyoljLqO2ms3cl44gJV
 7Fz1V0eERSBwtOfKmndWc4hqTveTRb4bQRG3LXhs/eGnG7xBfm2eaCVCodn+Qg3YT5t9
 1DGKM/Qgm4yRGbePRoyuMQrslO1m4zR5I8eMQ6Oqh8zdYGwhvBr+DEz429+dSXPa1Rkb
 EjBg==
X-Gm-Message-State: AOAM531h+FKEFz+PXo+aj5Khj39DcJMMwiUFRiW09hmY0tyT7NcYQPft
 dQOYsoryvQYHoi7TjUFAJhb7xzP4HKspiJmX5cZp2w==
X-Google-Smtp-Source: ABdhPJw4zNAt1B4q/q1dyn6Pnc11aAWnOireH/gSlzzRa4GI1CrkoXBPegbc1FAhMzqxdh5Gg153TLsW8Vxg3KUFBg4=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr5252318ejz.382.1617820437415; 
 Wed, 07 Apr 2021 11:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-7-cupertinomiranda@gmail.com>
 <2d3c797b-74a5-d464-fbbd-5819c88d828d@linaro.org>
In-Reply-To: <2d3c797b-74a5-d464-fbbd-5819c88d828d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 18:33:17 +0000
Message-ID: <CAFEAcA_tpx36QBJtegt_ChySnpYm+rqn5B+gMkuWDXJpUNDrZQ@mail.gmail.com>
Subject: Re: [PATCH 06/27] arc: semfunc.c tcg code generator.
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: cupertinomiranda@gmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 shahab@synopsys.com, cmiranda@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 18:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> > From: Cupertino Miranda<cmiranda@synopsys.com>
> >
> > TCG generator scripts for semfunc.c file.
> >
> > Signed-off-by: Cupertino Miranda<cmiranda@synopsys.com>

> I don't know ruby at all, and don't really know how to evaluate the rest.

Yes; there is a massive hill to climb to justify adding yet another
scripting language to the code base. The strong presumption would
be that this should be a Python script.

I agree that rewriting the .c file is very weird and probably
best avoided.

thanks
-- PMM

