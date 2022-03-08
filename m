Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B404D1549
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:58:06 +0100 (CET)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXXZ-00040m-Ce
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:58:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXVj-0002qf-H6
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:56:11 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=35373
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXVh-0007gr-UC
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:56:11 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id z30so24107045ybi.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cXD+3XkoPt0xxxXirhBy84RR1Rj6vnU5LvrExdE2hik=;
 b=NTbg/BFTvcp5eQYQovhFnOnF+kD1a2H/Mdxngh0QKdw4yrA5WI9wbKY7p/b+BYZCbO
 9T5zSm0czKYf6F8RclEPFJy3ZJgw8wF+NBq+lagX2mMPMhtMiYOhEwl7IXPinhqX2xa6
 plqUyGelzfQ6ylkCxirUZ+x820dSy8Cgz43EIoK74tM/Dxkz+UWZH5u56qTLnIOf8JTj
 g+BJQa+8JL+kk95G9RJjtiSIrn3Mnv2DIc3x7aw5uBTcEfQxZa0cakgTpX/33EaHGSTw
 AAPftN+Io67k3kKVYdHH6yAhFlZ9IobKrBiLWsQubDgNxIx2XzdK/SH57LLraTi1mSkl
 orsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXD+3XkoPt0xxxXirhBy84RR1Rj6vnU5LvrExdE2hik=;
 b=vt2WQvHL3qG9cIGl0+/YcMbdYPrPIlKHQ6/wpompFWdKnP0xCd6AhQ+RSb/X0N0PDX
 T3M36a78MYpEiZ5/kE/jWi2leMAO7hziI4C8Vhhr8BNDEYGGgtHayaMPsQxM8YN31PPM
 KL2Qr75JdZFqxCIjO5ZiARFxZKqDcndRJjIV9CXVycuHF30f4APR30NSsqKA2XRDE1tl
 fVNNyk+/dQ93l41oPHmVLbuGDbhaLdhyd/JbbasuEbZDsmbCAY5ImMKx3FcNk1Jk6Bin
 RT6j1BqFKKJBK8BIMn/3JS1dKuBbWxzcZfWVyXuy1mw+iua7OVq57Tnp0PUTXAG/X+fZ
 JFQQ==
X-Gm-Message-State: AOAM531gqR0TkD9Omi6DfkaM2mSn9A3yUy2F7JLPupzGMguxPY6PUTIl
 mM7xijYXpRWQ5q9YeMS3A1Zd5WZrqOkouShg7qSiHA==
X-Google-Smtp-Source: ABdhPJwO994NjENkePGR8D7acw3tMimi2eO1eVeeKH/iQ0j+Ytqo/ikVBo+z+wyPNz2cg2D20odwbK6s7n/+o/viWx4=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr11270480ybs.140.1646736968949; Tue, 08
 Mar 2022 02:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-20-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:55:57 +0000
Message-ID: <CAFEAcA8jRNOY3uLQEOzLAV=CVMhSGHthTWM9ykxoZxGuyZ2tqg@mail.gmail.com>
Subject: Re: [PATCH v4 19/33] target/nios2: Implement CR_STATUS.RSIE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
> Without EIC, this bit is RES1.  So set the bit at reset,
> and add it to the readonly fields of CR_STATUS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h | 1 +
>  target/nios2/cpu.c | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

