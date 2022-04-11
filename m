Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259A4FC3AF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 19:51:23 +0200 (CEST)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndyCA-0001k6-Eo
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 13:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndy9g-0000pN-VC
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 13:48:48 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndy9f-0004i6-Io
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 13:48:48 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2eafabbc80aso174069097b3.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmdfrTiE5HMntn41iTvPYVO4OrYKZDbyYz2XDT/n0yQ=;
 b=YR/LO8F9sQ7ZEkdJbcoSP0WnnAk6hdQhAI+QmVL7tl884Cv+Y3Bc35AEbSQA3TIT0Z
 U4cF17EjqFVC9PTj3vbbaGI73rI0qxO6I34L4s1BQnSlETPagHk5uNtSF1QnHQG3+7Ff
 uME+dviQxNzLqtzZcQXa6q6IsYlihG/8O3u2miCQufKROR4ddnepwztH7xLk1ArOvAsj
 RWvjrS6Yo9EBg8LlwITPqu2nQQgwOG632CF2AtM2rJC1106TO0NE21zPZ2MxJZj+L2A8
 lp/Abj1iW5gBvs+GRwC1Dw+hUtQbVZWWZiS1FOVYLCEikT9eoijf1kO+0mcCnaOcealU
 xlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmdfrTiE5HMntn41iTvPYVO4OrYKZDbyYz2XDT/n0yQ=;
 b=FR0ObYUtf8wnJn1Dn17L2eNBlXxAZMDeBSHw107EBf4NN8bdopc3Lz/dLqbC9FlI+f
 YdwLCbbPh/Wo8trjGyegL9TFHDUwq+u7KlGeEV6PYWWfZD09ZKbVkyp3EwvARFDUKwF1
 CXi83DWAK+WeV+BIzIfnJffzfv7aSxFK0XRpowHgkMrm3U6TxhdYX2N9l2QDWj1drhTs
 hgR7VZ8VTbNaC0FQmNchlDCmvgWQ0Ht2fu1wP3BBo+U/vdQUdarpPIeI+G3jAkWWw/Op
 oRXCEK3hrodXqbFu2oNWR8UJSzVOvCzy5MgyuGJ1XxExKfzmpadsWN8x9IJqIMWXTUW4
 ZEkA==
X-Gm-Message-State: AOAM531XSqGctDPRUXvUiI/DFRi8DSJBWLZxte+/RXKH/MyAO2oqLkbT
 y0+M2rY0Qc43ZQmfsnVsRu+aC6Bof3OPQVbDouRF4A==
X-Google-Smtp-Source: ABdhPJzp0qbzZpafyNTj9CWO2QN/0RX7s9aEhoFiW8fyJNDvSSpTvifIZONJwVEAJ1szbkyAM2L0KjOt5qrvtzs1Jb4=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr17695396ywc.64.1649699326572; Mon, 11
 Apr 2022 10:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-9-richard.henderson@linaro.org>
 <CAFEAcA-b5RHzJ0BxeyswL6C6Cr-6fzRF_a0SVkLdWQo4Xs6=dQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-b5RHzJ0BxeyswL6C6Cr-6fzRF_a0SVkLdWQo4Xs6=dQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 18:48:35 +0100
Message-ID: <CAFEAcA8w6VySz=LUk4bps+hqGAs_1QsjafO7OFgvnyRW9ybnmQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] target/arm: Enable FEAT_Debugv8p2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 14:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 9 Apr 2022 at 01:18, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > The only portion of FEAT_Debugv8p2 that is relevant to QEMU
> > is CONTEXTIDR_EL2, which is also conditionally implemented
> > with FEAT_VHE.  The rest of the debug extension concerns the
> > External debug interface, which is outside the scope of QEMU.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/cpu.c     | 1 +
> >  target/arm/cpu64.c   | 1 +
> >  target/arm/cpu_tcg.c | 2 ++
> >  3 files changed, 4 insertions(+)
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...except that I've just remembered that this patch, and the
others in this and the other series that add support for new
FEAT_* need to update the list in docs/system/arm/emulation.rst
of all the features we implement.

thanks
-- PMM

