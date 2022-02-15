Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619FA4B7A5B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:19:35 +0100 (CET)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6AY-0003hM-Fh
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5xz-0006Wt-FF
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:06:35 -0500
Received: from [2a00:1450:4864:20::32b] (port=42664
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5xx-00066A-DZ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:06:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso313472wme.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uWJuQd3u5jYBPObb+LwdIwwHZ0kfCM4Q0ZXoLm2w4EA=;
 b=sB1RfWYAXYNKWwPJ4cjdS/s2ExUKnVxURS+huSKvm8AoixapMZqu1ffIPr8EZfYr4H
 ZrEDZAXChDwhRlh8TAzdRlBhDyYWOUwS8gdsJ4DvW+Ro/v5D485uzXReE6BJ8ivBI53H
 68QTHkb0Z30TcPPR52Qbf2UKIaMze1e4zCb6P5gXfZYdPEYHXm6bD6DMCNSlPt9HOUaB
 lZhSygubT1h9L2uXlIttJQ3lwHsD2UKum7FCrqPmNeiKLdmDyb5YhcrUaKdNyJF8m7TJ
 8STx/80ZrCunbRhrbsCnstlmbx1niwNF0Fu4sSK8iuFe2sPVS1FexKjVZdfZuRNs/Min
 2pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uWJuQd3u5jYBPObb+LwdIwwHZ0kfCM4Q0ZXoLm2w4EA=;
 b=Dr9yM1R7j3JL8ZCmiM7CoL9w+DhG/QV0HypuUTlNct0TPqWaMx81n4r6m67KH0jmOC
 qxxL+QHbAayZnEsFFYvIAAy1sJ8l2q5YZCm7B1x0tQj1c1gGxMkkMDs1kb+Iq/5IFas5
 /w9OyM1mK5rGKsBE9hiQMjjN2S+oI+X0+ImK3K5nG61Ud3W5NyAmYfxfVzZe8ZX93OUy
 sLk0psMGNFBRd04D0uDK2N1P+MCjr++22P9VLBRZ4WafnzpnEdCTl/fO726KD05T6//l
 lKKowEY9v1/7To2cNUIw+gBhavhVBBcNNrTIpB5xq6FqbnEmzXsT/8YXkA6VRBNM4g74
 sfzQ==
X-Gm-Message-State: AOAM531vqyyk4Jh6ikKDKdElfHASdBjwUy9oQDibIrOo3ZSoAxssBGkL
 zIWx/70I9a+LYNngq3MXeQIy/Ri+LxgUb8IOdqvJuQ==
X-Google-Smtp-Source: ABdhPJxpeSXrPrHXz65iwfq46zelyyLGGI5akUL+4TQXOLjN92Q1D0w/v7/LEcVJF01udTi3hZaSSYRzyK1j3tY4o1c=
X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id
 l20-20020a05600c4f1400b0035332b70b47mr4955913wmq.126.1644962791921; Tue, 15
 Feb 2022 14:06:31 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-11-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:06:20 +0000
Message-ID: <CAFEAcA8=ZkMy7YNMricVtBA-U8tTnBKbgH0Et2MjvBSKDPtHEA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] target/arm: Implement FEAT_LPA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature widens physical addresses (and intermediate physical
> addresses for 2-stage translation) from 48 to 52 bits, when using
> 64k pages.  The only thing left at this point is to handle the
> extra bits in the TTBR and in the table descriptors.
>
> Note that PAR_EL1 and HPFAR_EL2 are nominally extended, but we don't
> mask out the high bits when writing to those registers, so no changes
> are required there.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h |  2 +-
>  target/arm/cpu64.c     |  2 +-
>  target/arm/helper.c    | 19 ++++++++++++++++---
>  3 files changed, 18 insertions(+), 5 deletions(-)

Need to update docs/system/arm/emulation.rst

-- PMM

