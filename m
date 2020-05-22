Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4551C1DEC59
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 17:44:44 +0200 (CEST)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc9qk-0006Yw-Pi
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 11:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jc9q3-0004yk-0k; Fri, 22 May 2020 11:43:59 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jc9px-00081R-Ig; Fri, 22 May 2020 11:43:58 -0400
Received: by mail-io1-xd42.google.com with SMTP id q129so2667800iod.6;
 Fri, 22 May 2020 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PC7ssX+ZFZ33aEp3xUpkKd5iG93Ot5l7HURqGdFeHfQ=;
 b=a6AwITcidtwgAgQ+0aeKMHg8JLpzz5bTpIxk9xEMrVQfe9EgGk+Rqo+4UzE9qgEiWZ
 kX1TnOO7ekhdJOY+CnZxMU+Eqyn1qadsZ2iaWS2hplxLnG4lJaZ4hGN+OreVgl4jZVl0
 r6RefFFivAQxDqqA5JPRQDxjJsqHQq41QmA9Yc3nIlDj6aHsjwg34r+oBOI4Jmhbnnyx
 ZDX1+imDUxtv3CHVnU75+N2fYCk5JxTlROOYPLCJA/igDTXOcLjlCt/4lwh2ONghOGkI
 98p/fuYEn9fav8ZGU1LiepZ4oIzRGs7f1sFo8IVsv2GstfVmjUbMZhhcU5+7JrVhAsA2
 PFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PC7ssX+ZFZ33aEp3xUpkKd5iG93Ot5l7HURqGdFeHfQ=;
 b=q3c3nCUvbdkmGbZKv0vteeRkvKxboFJaZfXMBdJfxE76oqTeRkw8Z7JB2KvSrT1c00
 IVBCb6W+XLA3wcft0J3NpiOm4veM1xoYvyyXPtJw8uqtkgm5kIK4B3AH0Qiy1VUe+10P
 iPb7VAPW7U/4kbpd5RxizFo8/q49MuCi9XaR1b1LKYpU0ffBaJ2/f2vB8iD7JevspazK
 eWJAOJ94tL5ju+ptnJkNcdJMEE/I3ajERHApUTVh2naaYUkDozkesrL5hi0uLEhLYDfG
 vNTBEYNHvTu3DtXMtZ4ixInokqQ6O3SttFrsYwyvKKmFKHevPB6E59yGzIkW9qmwuQYZ
 NzWQ==
X-Gm-Message-State: AOAM532bG7MXsukeDSBoG/6LliwTIq9ksrYMCBjaVb94G4LQsJ/20kdt
 gMcRRJ4CT6I30nzt5AGUdfnQlUMgvKICywG8uEU=
X-Google-Smtp-Source: ABdhPJz9+vQJA0UZQAg8yQ8HPIXlSkdtbMfXGa35ZFXix3wQINuZ0wfiWbdSIbXhfB0t7+4VFxp5uVcuwWy47rfI71Q=
X-Received: by 2002:a6b:8f82:: with SMTP id r124mr3681687iod.42.1590162231039; 
 Fri, 22 May 2020 08:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
 <20200522115036.31516-1-e.mikitas@gmail.com>
 <20200522115036.31516-2-e.mikitas@gmail.com>
In-Reply-To: <20200522115036.31516-2-e.mikitas@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 May 2020 08:34:53 -0700
Message-ID: <CAKmqyKOrNwjsLSAOjcj2jmcZftqAi6W-8whOwQ6nwnxC8wf-cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi/imx_spi: changed while statement to prevent
 underflow
To: Eden Mikitas <e.mikitas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_TEMPERROR=0.01,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 22, 2020 at 4:51 AM Eden Mikitas <e.mikitas@gmail.com> wrote:
>
> The while statement in question only checked if tx_burst is not 0.
> tx_burst is a signed int, which is assigned the value put by the
> guest driver in ECSPI_CONREG. The burst length can be anywhere
> between 1 and 4096, and since tx_burst is always decremented by 8
> it could possibly underflow, causing an infinite loop.
>
> Signed-off-by: Eden Mikitas <e.mikitas@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/imx_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 2dd9a631e1..6fef5c7958 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -182,7 +182,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>
>          rx = 0;
>
> -        while (tx_burst) {
> +        while (tx_burst > 0) {
>              uint8_t byte = tx & 0xff;
>
>              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
> --
> 2.17.1
>
>

