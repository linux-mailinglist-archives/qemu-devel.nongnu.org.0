Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E423D54635B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:17:48 +0200 (CEST)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbi7-0002kP-ED
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaX1-0004WR-SC
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:02:16 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzaWz-0007CO-6R
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:02:15 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id l204so45931425ybf.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13sAxX7GKXkIZ4REPY1Y+0Kxy1FvjqnfyQedx/44MBw=;
 b=OceuNUIqGHX/JagenohmhkvriQdKUILMGPV6b2Mv0q3fW8xtL9jW07tUS6lUbiS0V4
 4Tx6HjDfgE+0ayUzEBOvBIkNZyFEhYyeRAAZ0RqxVBAy35Pe57LK3e2wORR36U9nOlNP
 RzRZBks8g/wL8kQ0UqIaWt/x4g8vztvUDhrcpKOhKmIL+09vHjg4ynwJhRhlwN/XoSt0
 PUJcs3+MqG5M25DS3LxzN28taiaSrMBQUZMI73ldWawPUc/xOKst+4h+ijsWygwbABJS
 sh9/jdHWSCe/JqFuwNYHjFZ7ZT7dHAuaQsI5XsSHVFuWuAg21pxSjSMJO5abaESnqbyL
 4f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13sAxX7GKXkIZ4REPY1Y+0Kxy1FvjqnfyQedx/44MBw=;
 b=cKEMhdamCYZPCQoHCAU7Qz5UkhzPUAxuJGd9a5G/I2ekG1FRYGdxO1WmJtEzrnYU+4
 A3LN5L1aQtGbBHshwoJ8uSWgRsl+EXkaEV4eFsbQWB4QUhgCeL10zcIkbCUeC3Ob+6y1
 0CE3jiWhHLQK5iNACNRF7SUcJ9Aqf+kaAtWHGi0CElNZgWjbRbVFxHQMvp6itWdctObt
 h31+rg3xFfBuNpwPsMg4C92CnoQ3/nbMVzbGLttxyCxZC57TVxyIYhbyynzsHTcHHedy
 xJcbObHpqkJR9icWFXityG6s0guI4fGFEnfe1zkGupREEj8exAuTQdjB4htU2qKOGMD0
 jP7A==
X-Gm-Message-State: AOAM531ssf26xhbTY+LQvg6ztaDxJCvWWuMZxB/VjKq1kfVY8lfidCnu
 3jXlgSSFeEQh//HVKU3xNF9VWctO9APc9C2XbnF6bA==
X-Google-Smtp-Source: ABdhPJz2WvrXsJw+BYgClSWw5/LDoJZlKZnjABOuEqr4SMx/YSDVz9RlW/HtvNsetk9bUUBczJMIrx8evTYssG9bBMs=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr43692466yba.39.1654851731057; Fri, 10
 Jun 2022 02:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-42-richard.henderson@linaro.org>
 <CAFEAcA9jEYarLY_srx8bo5EUhW5+-pP_3pcbv+H4MomYve25ZQ@mail.gmail.com>
 <7404df97-1116-2c13-4c86-f327cda96eb7@linaro.org>
In-Reply-To: <7404df97-1116-2c13-4c86-f327cda96eb7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 10:02:00 +0100
Message-ID: <CAFEAcA-dEzHA+GEaGRdgPBBZbA0m5K+HqceshywnhYiotzdSaA@mail.gmail.com>
Subject: Re: [PATCH v2 41/71] target/arm: Add infrastructure for disas_sme
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Thu, 9 Jun 2022 at 23:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/9/22 08:35, Peter Maydell wrote:
> >> +        if (!disas_sme(s, insn)) {
> >> +            unallocated_encoding(s);
> >> +        }
> >> +        break;
> >
> > I still think we should check bit 31 here.
>
> We don't do anything similar over in a32, where we've done the full conversion:
>
>          if (disas_a32_uncond(s, insn) ||
>
>              disas_vfp_uncond(s, insn) ||
>
>              disas_neon_dp(s, insn) ||
>
>              disas_neon_ls(s, insn) ||
>
>              disas_neon_shared(s, insn)) {
>
>              return;
>
>          }

The difference there is that we've basically completed the decodetree
conversion. Here we're putting one decodetree disas call inside a
legacy decode, so we should put it at the right point in the
legacy structure, I think.

> and there's nothing else within major opcode 0 to conflict.

Yet :-)

-- PMM

