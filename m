Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6E4B9FF7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:20:01 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKflQ-0000vQ-Hw
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:20:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKfQH-0003aR-9L
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:09 -0500
Received: from [2607:f8b0:4864:20::b36] (port=39848
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKfQD-000162-N9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:08 -0500
Received: by mail-yb1-xb36.google.com with SMTP id p19so12496357ybc.6
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 03:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OxBnHCH5W5E6hi5yEN2xLqLSERrZFG4VR4VpzWVDfnQ=;
 b=PI2WmmEJdeQS1UiUp1zEOB97arra40uL12Y0jXN6fuw2+NTBBhF4sWh0XqsTzLLztd
 213xgSCLLbMhGpNM3YU50rcqAP3vyqtWNwmEczjt9/Vdz9ci4bG/JOhhDH8PxUiyV9nf
 FdF2xDQNcCtVc6o9VPswI5xZkQiVwU9VOQxlc9KT5TmdVtcGdMNjmVIcBXzDcgEjh//h
 bfCyjoLmMvBn9o7lWZUwHIhCt7kliUFhPgcJPAUTcEvmXq7qHqLFjxsjFeNcK4kwfVbv
 /RqlIMaw4bMbcFutJhNweulFVNsVl+GpfHfFA6xWyyJoSzN8rmaxqrgjlI5WbfB1eCks
 F1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OxBnHCH5W5E6hi5yEN2xLqLSERrZFG4VR4VpzWVDfnQ=;
 b=62VcGTQNYQQOL6zx0298kYuM8YyQnH4JqjikViPw+4f+ZdqpMGNTaiKywDgPyxirSj
 vgFLCBXYzJclAHqA2IofwmYlX7+NQU4nH3rMWIKdEcJ79RQskjpwd8DrjxLS0ZubXyyn
 khWWe+kH7sZDAiPC+QcM69jqHF6oshDSp6ZgHqM7b2xVuGEhihLck2iyFViq73CurYxc
 S0BwlNBMfo/HzBNBWmUE3CidGa0envESZBsEOlbSjzd3wck4mvs/8se0OMeLwIZo+Veb
 bLSON7g6uqlCpHBpll232rN+Xd1o1o2ROY1QU+YnWjpjKATaCfcWmfdQpXm116dRo6PH
 PJjQ==
X-Gm-Message-State: AOAM532SVrSmXaP5R4fqSJqPsQ+BnlOhLeES6vacaVPNDBpWFvmbQN8j
 e3QRg7REsOHJ+if147hbHFP6ZG2tODHKyvfYO3e/+w==
X-Google-Smtp-Source: ABdhPJxljyOfBfaytODe0gfk4bJm7vKi5LHZIcN7DQ8yCSBfExcYp8Di45ZNe8007Kh0URQkc4fGzM/9kUWWxGN2mqo=
X-Received: by 2002:a25:34c9:0:b0:623:fc5f:b98 with SMTP id
 b192-20020a2534c9000000b00623fc5f0b98mr2101392yba.195.1645099083556; Thu, 17
 Feb 2022 03:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-2-shentey@gmail.com>
In-Reply-To: <20220216224519.157233-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 11:57:52 +0000
Message-ID: <CAFEAcA_hMcffJ0An4o6W4tMhHbrCGvXzK5UV45c0mvV6L5bJ+w@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be
 preserved during migration
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 at 22:45, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Based on commit e735b55a8c11dd455e31ccd4420e6c9485191d0c:
>
>   piix_pci: eliminate PIIX3State::pci_irq_levels
>
>   PIIX3State::pci_irq_levels are redundant which is already tracked by
>   PCIBus layer. So eliminate them.
>
> The IRQ levels in the PCIBus layer are already preserved during
> migration. By reusing them and rather than having a redundant implementation
> the bug is avoided in the first place.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/mips/gt64xxx_pci.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Ah, this is definitely the best place in the series to make this
fix. I didn't realize we had access to the device pointer here, I
was just looking at the fact that the opaque was the irq array
rather than the device pointer and didn't realize there was a
global floating around with it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

