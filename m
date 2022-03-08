Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6414D1651
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:32:44 +0100 (CET)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRY55-0004Ix-Tg
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:32:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXzx-0001xV-0E
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:27:28 -0500
Received: from [2607:f8b0:4864:20::1132] (port=34867
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXzv-0004n6-0L
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:27:24 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so197506077b3.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izYXiCNZ9KpG1I53EqTPhbT6k10s2TaLQlrCi0Y2mzI=;
 b=ufZUkjFwbLChjeIGy4bL8+g3OCGGIkl68OVVZSPBs6u48byVDKviF78IvDEUhQSz7Y
 YT05ugO8FM/8JLc8FBZEem5YkTm3xD1Ql4szavMn89iehgnMfCn+nDmV9NXzWwUGKLqT
 aLc1wQifIxaSmqoleqgZxi0fmM5KA7Idb+sQTXYqWBILdywZU+YJoEodaFBg2ZYEfOh1
 WsJey4rAsUUhB7VPq01MDKj3YzFQFd4T/Zt7gwKf3HVz5c93f2+0zV16sSiak+LGckul
 z+K+LFdWC3iFngR3vdYPVZfY3CboJULVhFOX0tDC3i8RTbGDhb684fmLbSx4nryfnYNs
 Y/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izYXiCNZ9KpG1I53EqTPhbT6k10s2TaLQlrCi0Y2mzI=;
 b=CgovCv5CCPjeq1zMf1n2iCT4Wudp5qQpsfhNPF3sYrnz4jNVznkGcBjf8Nk7ynk0R9
 a01n3YQOo/3otJjK2nRdzYtRb1/rUR8HbTtEVB6PVqHOAoSBmZvvAEjIIyAfBuMgCbZC
 eoOwtMkaCQRgcUf5jxmenYe+Bk7jk0p44FyrKEEZh81HYBWz5OUNy/KoJYNjDZIoBnRr
 ddp1/BrBAeukmsafxzPdjpotPWgxLZp60XeUYHZ3V6xZ4NAAVIzkS0+W3+2OEQmzzgHE
 c+9U1MkKsULfRCjZu84VyR2tb020SFsbpYUP/GUiPY948Md/y3ORh9pr2KU/gkEwpOoV
 tqNQ==
X-Gm-Message-State: AOAM531GnIZpmiEz12q3J9kncQLwDzWHZ3E0jMLNcR0zbI7kkXYhZ/f8
 Jrbj3adj+8XUXUwOr3n3eAhRnnFMEtlu9wJhZMHElw==
X-Google-Smtp-Source: ABdhPJwS2Rz8oqXnaukhiLZyT93GiOg2+jHEHvH2K4zgT3Yu8HPuw6mcMUSSGP+dLz6l1tjMP5t04hS7teWgXTsNk1o=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr11984989ywh.329.1646738842137; Tue, 08
 Mar 2022 03:27:22 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-31-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 11:27:11 +0000
Message-ID: <CAFEAcA_isAdx2LtDJ8WjoXazjOcqPgVUbwQMXEL+gyiQV53JCg@mail.gmail.com>
Subject: Re: [PATCH v4 30/33] hw/intc: Vectored Interrupt Controller (VIC)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Amir Gonnen <amir.gonnen@neuroblade.ai>
>
> Implement nios2 Vectored Interrupt Controller (VIC).
> VIC is connected to EIC. It needs to update rha, ril, rrs and rnmi
> fields on Nios2CPU before raising an IRQ.
> For that purpose, VIC has a "cpu" property which should refer to the
> nios2 cpu and set by the board that connects VIC.
>
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> Message-Id: <20220303153906.2024748-5-amir.gonnen@neuroblade.ai>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

I reviewed the version of this patch that was in Amir's v3 -- has
it changed, and if so how, or did you just drop the R-by by accident?

thanks
-- PMM

