Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D708565846
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:08:30 +0200 (CEST)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MkW-0004BR-UO
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2E-0006X2-VJ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:22:42 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M2D-000334-EU
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:22:42 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c8bb90d09so28275077b3.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNtBEk83itne9q7oSt+nYjES/HtK3AoV5jbfuSobWpY=;
 b=lG/p5iSPwbHsA7b3ypjeKjJAfv71lRTgWxl7mKeCR+A8DVSTta55okBJ9gyf1aHsYs
 kpr1Js21+zos05O3pW/K9yvqTWMZQWKNuKlT52splWJIHF5qvZ8bOiyfzzzI7DveH9/8
 SvdZCFLrFy5tKXsfI36YFcLZAeniGnaUKQHsisgJbhn0Hlr4c0ZrIkcrGRO/34dkADAd
 QnE9ktyiq2g4gkYRUSDVypoQx98QlK8c7OpfkEDfgwhVdu0uitO1jL8vwshvKONoqyy3
 PZn3Vccb484XEgJZPliGDdpnvNVyx5cGKxTROZUafbMpNXWNtx6VQ4TcHQN2zce3RRYW
 O1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNtBEk83itne9q7oSt+nYjES/HtK3AoV5jbfuSobWpY=;
 b=OctQRAESLT2wgT3XUwfTN9BN99mqgpS9ltIJ/He7QpUbW7uMrGiDJDWShBG9P51lE6
 8CKEiEIYUv+Y5Z/URzstLIH0b6dMw+PumDbGaIPmCv2F58m7MmjtvseOE1yacv49jTjx
 jaKMKVPy4p+Y51PKbRPvvHS3ulIyg7RR2RRLn+WLzq7VPmDa3ei28qLnxOBdaN1e2Mzt
 4Gs5Czdwj2lKnN2B8MGIzje2xWFG3K1Iiei1TNdVvVRQV0tNJwsHafXaj6GHjTDqFcdl
 sxTNwSJR3vZix1iHscXY3NnCQPJblt8B6cIJXH+aeKvDmwMfjsJJgTgKxt7+uQiKpxT/
 mtKw==
X-Gm-Message-State: AJIora+KVb7h1MkZZJImTmtwSSdvrdNeeg5haB5N6DAl63ywtzjuUeUf
 S4HH2+5sc9vIy1EC/vYdaU/xwqtGABOvCp7zWBic8g==
X-Google-Smtp-Source: AGRyM1sCAnj5Ub/CK1Z9qi3q7CVAXn9k1SH4MTqBTTk4yT1FlLuh6cLIDw8ZNioxMbcyoXhGXpX+VmX6pW+POxcVAw0=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr32677164ywb.10.1656940960481; Mon, 04
 Jul 2022 06:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-16-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-16-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:22:29 +0100
Message-ID: <CAFEAcA9+d9i9XWZNQu0oy6Vc4ovKTjHA1Nci5DkZYV3HHoFErw@mail.gmail.com>
Subject: Re: [PATCH 15/40] lasips2: change LASIPS2State dev pointer from void
 to PS2State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the compiler to enforce that the PS2 device pointer is always of
> type PS2State. Update the name of the pointer from dev to ps2dev to emphasise
> this type change.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 16 ++++++++--------
>  include/hw/input/lasips2.h |  3 ++-
>  2 files changed, 10 insertions(+), 9 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

