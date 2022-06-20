Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4955159D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:20:15 +0200 (CEST)
Received: from localhost ([::1]:45500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EVy-000793-96
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3ETI-0005a8-GW
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:17:28 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3ETD-0007PD-Je
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:17:27 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-317803b61e5so69890997b3.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRmH9mDZym0wZHx18FHftuNWiUsP10FrjTqoQEdG4Ew=;
 b=kxNcm8W10eAqh7KswqGySXdhRhMj8wIW43Ms064bVeRzcxpfgFL4tCSjOXt75jp/2C
 14LWTx0vPxjQCPy4uKQ4ZYYje18c3UAv3ymYmAkKAdBWnicokha5ZiRAdgrS9hVGTOym
 RbURb5oBD9cNdOnfstEQwbDFj4yzARLjWehSrjf3dGUGmCY5XO+Fp5+4I35vv9IN8u6T
 /W3daddJBxG7vdMNdtojDjAqWZCDQQUfESGYDms37/ZKqRLsRjsF0r2qdm8Bb+LTbOzH
 NpELk+ZtEQ9NZtYSmlT0+ugKeyzBwQ4PJEvaUxqF3LSksfhm5fQ31m5vdG5UdCncQAZ3
 EiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRmH9mDZym0wZHx18FHftuNWiUsP10FrjTqoQEdG4Ew=;
 b=JSapT2szkq04hLsT6gsg7Fb4bzEOcEEPSL01LvTgM5mwTdrzAX06ny+StNGT1ZDkgx
 c3VBHmX14e2Hd5MNF2dxG9ww4dpee6VatqK5jFybe59wxpcezMo2bKCUeHdpC57X2Cqq
 V7qYvhlBRiNqpcFwheK/GOxKgZCeouPEDuG7FtGsUxDDffL7nqZks+mAVRmLUno7F+Aa
 z904KbNgI5wsYzSlqURqcSk/VGKJ+O/iHyGyPOi8kROjCGgm5p3muwEQP80ZPaiyJ8LM
 RRQkLkaqv/T/qY884VwSfGqSLU5BZ3uf3nPyewDstxMPHrJNxIqiZO5kguts3A2gNB1z
 uujA==
X-Gm-Message-State: AJIora+idRvsZZGuZt/BQ5m0ePdkM9dsTl2LUOuPvETgtPqM587snskY
 716u3ubfThUk3Y3Igj7Gw+Kb8OdeYiBhAUm+TjueuA==
X-Google-Smtp-Source: AGRyM1vtUKzB6XSC5JBf/lwpa2JKZgurRUY0LOkaMMQNmPRVnX2bMAHOiZP9jtrMppk2QA4qbS/WlkrUuRbceehOZb8=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr10603534ywg.329.1655720240763; Mon, 20
 Jun 2022 03:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
 <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
 <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
In-Reply-To: <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 11:17:09 +0100
Message-ID: <CAFEAcA-F_v_S3TMbtQvboBCzg9OsXM3YZ-Bs6yVabTpE9_yJ5Q@mail.gmail.com>
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 11 Jun 2022 at 16:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 10/06/2022 08:17, Mark Cave-Ayland wrote:
>
> > On 09/06/2022 12:18, Peter Maydell wrote:
> >> If you find yourself #defining names for IRQ lines then this is
> >> probably a sign you should be using named GPIO lines :-)
> >
> > Yeah that's something I've done a few times here, mainly to have just one "set IRQ"
> > function rather a separate one for both keyboard and mouse. It takes a bit more work,
> > but I can certainly separate them out.
>
> Looking at this again, the gpio being defined here actually is the (only) lasips2
> output IRQ, and so should be left unnamed.
>
> The reason for adding LASIPS2_IRQ was so that the gpio connection process looked like:
>
>      qdev_connect_gpio_out(dev, LASIPS2_IRQ, irq);
>
> instead of:
>
>      qdev_connect_gpio_out(dev, 0, irq);
>
> Would you still prefer for me to simply hardcode 0 here and drop the LASIPS2_IRQ
> define in this case since there is only one output IRQ?

Well, I think that "unnamed GPIO out" lines should be for
actual GPIO lines, ie on a GPIO controller or similar.
If you want an outbound IRQ line and don't want to name it,
that's what sysbus IRQ lines do. Otherwise, name the GPIO line.

thanks
-- PMM

