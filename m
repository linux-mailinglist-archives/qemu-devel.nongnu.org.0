Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE17839B59A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 11:12:21 +0200 (CEST)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5sK-0005PL-U2
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 05:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5qT-0003gx-H5
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:10:25 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5qO-0006OS-KS
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:10:25 -0400
Received: by mail-pf1-x432.google.com with SMTP id f22so7064737pfn.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 02:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JPPVroswCC1XwTuYxFhgPQnepKMfLzbcTpcHWfNRKA4=;
 b=JiQa+MUO7DBMxMkf59Ejr6bAfMKa0sXpo3z4mPE2nExits1xt1AnK2ynMj5s8MeBUr
 KOyULScD60fNv5mqneYB4VZUyHCykT82NxiRRBuvXpwxxOlUBRbvyvzEz4EePq6NEEgj
 hJ7ZWKWht/70LGwnmSa3nL4ra+Mdeind4c21VSIyoU1PBIylLqyJ8R/lQSOLGClCbrP2
 fcW8S2Jv0je2ciI7oeuM7AmTuJ5HWswhZGvbZo9/bzbxLXOQomby+NAGhSFlK/KLEge4
 jKtR/ZAvstVP0QRzXynUlAMsjoJms7lJ8XE6x65lLO9HRxU7DxdpQX/lZxrny97fl/qZ
 NnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JPPVroswCC1XwTuYxFhgPQnepKMfLzbcTpcHWfNRKA4=;
 b=mEnfS6wLw4erujfLwlWMNr1YYOf/VvOEve1KJxkcg/bTgjOSyKK/s/v8TYDObB6LNB
 4loQbjtj4KGwBqGoOcQ5VXRJeNjfOl0fUoO/Uv2uLPXl5rCMxcjMuASBIlICSL2hm4tU
 6nrJQxLXkd1UIbcXH1lSBwEnp+oZBEp4C3HX96+JK12o5sTvtzc81jR7ALwfhqRpoP+i
 s7VyhcpG1PUxiVydMHu32jEvaM8+K5wU5b3pVgCYG1/Uq6HKtGEO10bun770P43Gw0gn
 yqF+ZJdW4ABbjhMWcVNqNQW4AFMHldPLHT/LnQvzk5uCOSRziKnzhkOqN9f5rank/XJ6
 xIrQ==
X-Gm-Message-State: AOAM533/uC2lwiUZ0qbZOZvdvuBny7yjcS5GtCtP/o6KzDJQcN6kWfYx
 uzAzEruiHV/npoBPiOwhPrRgPxLmT+x/vhYCRN3ynA==
X-Google-Smtp-Source: ABdhPJwZicMxIo/F4TNT6sAtVKT1dacoxKTgO3T59xK7z+AoYxjxkqGY0ZRjgY4PH0iMBZw1jucKe2lsDF4ASbVsgVw=
X-Received: by 2002:a63:475b:: with SMTP id w27mr3923114pgk.305.1622797818396; 
 Fri, 04 Jun 2021 02:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210527052122.97103-1-ysato@users.sourceforge.jp>
 <20210527052122.97103-2-ysato@users.sourceforge.jp>
In-Reply-To: <20210527052122.97103-2-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 10:09:44 +0100
Message-ID: <CAFEAcA81RvbdVV=+p8keYxuysz3aKg9nM2cK3Fo_eBefBvjQTQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] hw/char: Renesas SCI module.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 May 2021 at 06:30, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> This module supported SCI / SCIa / SCIF.
>
> Hardware manual.
> SCI / SCIF
> https://www.renesas.com/us/en/doc/products/mpumcu/001/r01uh0457ej0401_sh7751.pdf
> SCIa
> https://www.renesas.com/us/en/doc/products/mpumcu/doc/rx_family/r01uh0033ej0140_rx62n.pdf
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/char/renesas_sci.h |  129 +++-
>  hw/char/renesas_sci.c         | 1039 +++++++++++++++++++++++++++------
>  2 files changed, 966 insertions(+), 202 deletions(-)

This patch is much too large to review. Could you split it up into
multiple logical pieces, please?

>
> diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
> index a4764e3eee..ae9554db60 100644
> --- a/include/hw/char/renesas_sci.h
> +++ b/include/hw/char/renesas_sci.h
> @@ -1,54 +1,137 @@
>  /*
>   * Renesas Serial Communication Interface
>   *
> - * Copyright (c) 2018 Yoshinori Sato
> + * Copyright (c) 2020 Yoshinori Sato
> + *
> + * This code is licensed under the GPL version 2 or later.
>   *
> - * SPDX-License-Identifier: GPL-2.0-or-later

Did you have a reason for deleting the SPDX line ?

>   */
>
> -#ifndef HW_CHAR_RENESAS_SCI_H
> -#define HW_CHAR_RENESAS_SCI_H
> -

Why have you deleted the multiple-include guard?

thanks
-- PMM

