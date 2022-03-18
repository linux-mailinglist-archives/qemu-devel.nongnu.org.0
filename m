Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF934DD862
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 11:47:10 +0100 (CET)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVA8T-0000KS-Jq
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 06:47:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVA6p-0007oF-JL
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 06:45:28 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=43929
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVA6n-0007TX-0s
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 06:45:27 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id v35so15079738ybi.10
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 03:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=caDBYGIUNO2OHO+Uch1oAdpMHErIerLtn1C+qAgza7o=;
 b=NeKE+36RkGB8VBcj/IiRcVwDTezuQXrp/5uj1H+qC+6BbOXgKldX4snA6kQ2FjgjOh
 4iKnm1NhMV4sMHcY9IeHdny5gazfaj/2xRpz8BwC8gAie7vJ16Xeepu7aWsteqWuXQBI
 UzkmlS0DlqBzF7TWHsK1itpTz1TICMPEn1wBDxOAnYsiFFCoUrJmXsGPeWVGq8l04Ho7
 dXafxD4r3mxiJz2dRcvDywd70JMesDAD+DkTjNNKXPaFBg9FIdJcl/m6U14emiCQjUma
 w/NLAJUIAEUVU0Qm/3aM3XWoFN4grO5yRlnVbSx63LnaqrpKaAVlM7jC/yHBm5HarVIz
 DDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=caDBYGIUNO2OHO+Uch1oAdpMHErIerLtn1C+qAgza7o=;
 b=WbPzj52EQEwUIfLVBwEwpKgjrdZkIgKpvIPCq9A5lgmjmzFWx8us7KibHv8v40v2xh
 2Z3Hw6Byfmvf1s3aw3BJTG7n06dzEL/wmoUAhQJGPDdtbO1u4E/6+y7CKrY09O7ZqyWI
 6YhjAwtAjlAl6A5PPHlntvWKJb5dGCiZvIOzmLfLSG1IcMRYYRzd8r+1S4x8w+QdfX1j
 1f4yyqr5y+DnocfFVK1MUWDXPjCcvwmre9VsKvXy6YCEKlS3HfRkMGCdiDey88Ro5A9j
 M3MBOGc8D7YCvOeavBlD1WQCzOTseP4u8qXs86Bdv+26IgNwf8yzdAgOTZEKgw/TdLMe
 0iNA==
X-Gm-Message-State: AOAM5316fNFN3WqZUFmbuerxCbTxt6ozfdijkThEgz9X0nXDMHfoBSFA
 +9DX7fNqbmbfveIZc4zfvGQQntv8WShBqX3mN43YzZspr1tDoQ==
X-Google-Smtp-Source: ABdhPJwV9Z3OEjjuuMx/Oqq3x2s2d9CwRTwKR0DwTxsCTB1hbS7wCpNpwgtTLivALxwamcxu9Hnv4H2LIcvFpgS9W38=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr8996723ybp.39.1647600323869; Fri, 18
 Mar 2022 03:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220318101124.912-1-quic_rcran@quicinc.com>
In-Reply-To: <20220318101124.912-1-quic_rcran@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 10:45:11 +0000
Message-ID: <CAFEAcA-SHKsmemg10VnO6pcKrR9HB=ViX0+zhwWKXGzMsp8Obg@mail.gmail.com>
Subject: Re: [PATCH trivial 1/1] hw/pci/pci.c: Fix typos of "Firewire", and of
 "controller" on same line
To: Rebecca Cran <quic_rcran@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <Laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 at 10:14, Rebecca Cran <quic_rcran@quicinc.com> wrote:
>
> Signed-off-by: Rebecca Cran <quic_rcran@quicinc.com>
> ---
>  hw/pci/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 5cb1232e271d..dae9119bfe5f 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1697,7 +1697,7 @@ static const pci_class_desc pci_class_descriptions[] =
>      { 0x0902, "Mouse", "mouse"},
>      { 0x0A00, "Dock station", "dock", 0x00ff},
>      { 0x0B00, "i386 cpu", "cpu", 0x00ff},
> -    { 0x0c00, "Fireware contorller", "fireware"},
> +    { 0x0c00, "Firewire controller", "firewire"},
>      { 0x0c01, "Access bus controller", "access-bus"},
>      { 0x0c02, "SSA controller", "ssa"},
>      { 0x0c03, "USB controller", "usb"},
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

