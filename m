Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B852357647C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 17:34:29 +0200 (CEST)
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCNKm-0006K9-FU
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 11:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNIo-0003nR-15
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:32:26 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:38634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNIm-0001ZE-Fb
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:32:25 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id i206so9013318ybc.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/00aHuHfBHBaPWjhRmDoqkplkcFpIz0h0lvKN0qyg30=;
 b=bE0oXlNLSU/YOHlL4UV9/v3VepLwjaT7s4QMywKCu9mZk5Fx75Wrt2FzbMV71olqcI
 0hOcvWICQrM0+1G0YrkC0SpZXerKoN0eC1z3hZVguGsAPXO4ty31NcnCzlqVFa07DSUo
 z+b7/eE0lF03hclzf3qUS6ywrL93PawoetG5RdqERScMgDHNKqN/3ct7XtS5awzXKA/v
 pVBMa1Ba30/Qmf/WPamzV34iUzH0dRGIrvlEZBaU7nrY6KZWxEATyTvw+6w/Q6GlWpiX
 0o9nOZtUJcJQ80hNwLb4Mi6nLqsu9lsrbZRJkab4GD+fFAKKAG/ycHMETekIDk73BEsE
 xB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/00aHuHfBHBaPWjhRmDoqkplkcFpIz0h0lvKN0qyg30=;
 b=DiHqINScN1w8FkQfqVMQ1pzUPgWFp4slZqvQcVLXY3R07LpF+zpRbGvONZJkBmnpBR
 GIcHvJnF51kMmuHtBrSB8RPvfjBREcxQJNIjClaB/pw68F8pDu9vcv/1szCYtIDdaAvP
 SlBCPNbGhdZ48bFQEb74Ae4U1ComZ9dxtkj2lZoX9mVxlcJPQjuQg8XtaZXo5HdyMSq7
 Nynb+UmvzFgC+rc/lszszMyBEX+W7pnGzmHGbT1+wOGkcYgwNeUTPd7DIbE3g+YwzOvt
 hFJNOuOHFLO7rwPlnKPiXokZx93f2BjH74bt83jKgJFhnphekFBdYExf2x80pFwwZpA5
 jMfw==
X-Gm-Message-State: AJIora8xnfK7MMZOtqQTPqLWDcP6LnTiG3BOD4lvUcw18WzCD/DHAY3z
 5KXY8JVoJ8BllVwWYv1c5K2/q6bJTFC5OHRNtG059w==
X-Google-Smtp-Source: AGRyM1vvoi4cASsgIMk10VgDr9rHVbv5/7cHLjMRs/Vkn1OIgPYR6V8evnasEW6JdHh6FPpTT0M1+inC5UvbTeBSjHE=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr15507273ybj.479.1657899142865; Fri, 15
 Jul 2022 08:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220714093929.247118-1-andrey.makarov@auriga.com>
In-Reply-To: <20220714093929.247118-1-andrey.makarov@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 16:31:43 +0100
Message-ID: <CAFEAcA_JZHExzVASkKxPwhMZ8Zv=r32yqvkUBDY3k7vKurzg2Q@mail.gmail.com>
Subject: Re: [PATCH v3] Align Raspberry Pi DMA interrupts with Linux DTS
To: Andrey Makarov <ph.makarov@gmail.com>
Cc: qemu-devel@nongnu.org, Andrey Makarov <andrey.makarov@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 14 Jul 2022 at 10:44, Andrey Makarov <ph.makarov@gmail.com> wrote:
>
> In v3:
>
> - changed naming of orgate & removed hard-coded constants
>
>
> Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>


> diff --git a/tests/qtest/bcm2835-dma-test.c b/tests/qtest/bcm2835-dma-test.c
> new file mode 100644
> index 0000000000..111adfe7f2
> --- /dev/null
> +++ b/tests/qtest/bcm2835-dma-test.c
> @@ -0,0 +1,106 @@

All new files need to start with a comment with the copyright
and license information, please.

thanks
-- PMM

