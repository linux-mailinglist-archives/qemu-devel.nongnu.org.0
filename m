Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D19537FE67
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:51:11 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhHMR-0006RT-CY
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHKy-0005Dt-Tt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:49:37 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHKu-0005UC-8S
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:49:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id v5so21178885edc.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3MKnanJpetd+bgL1z3iqqnlJuHGJL8SoANkO+db6Jvs=;
 b=wbO1Jo16KU07q65HDdBNvrqsCDHrqSbHO7gpIUwl3rhpX9x3VmOwSRA/1KbJu9v7XJ
 eMDUrTYxCodSTrH/S21yMblU/hQAHgRir4uRlNKHobtSc8wjhQpROx1XTeLdlLNMSoor
 GB1qRL3CDCsemvjYHLHCZKNMQhKXKMiAFwX1Au0cOGn4Yx53SSyWTuOSbGfLZNJG7Qud
 c3aW/h5axJX5iNNHiLI9J0Dqb3DazCbIasD1ymWdxLRQq4rItRYDwqpIgOIomJg1/sP/
 Q90954stcBL1tNqMAS3rts1Ug4M44HZ0GdlBmC7N3FD+/j9qzFwa29VOpGeFzIim/r3n
 8E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MKnanJpetd+bgL1z3iqqnlJuHGJL8SoANkO+db6Jvs=;
 b=uiuSzLQrPZ7kmsFKiRP0ECxyuNFDbbEvJ3sfNkutXjExd7XWQl0a8AdSswBC1lYCWM
 SrGDlhzVCIF//61c1w7jb8FBo2BCkstO3qs+fBLVJP8jgbTr5x031rmkkzgFvT3r/udY
 8D166N0dlFs+eZ/Y0dN16zXJeVMotO1LfUD7ndHLBy30xPx4/Kqu72TmCUnmjRpTRBre
 9X/n7Rw8+STcuWSerqCEgvhBkr0sijyD44+p1b2RNR/SiX4Q1eL3noArBjVxgmc0IPaz
 ZX005/saI+AwE4qkZlpPUkWkVqcTVWlJei6DYnmkEOjbRf2sUmEdxZpQ01+S/YTyUGBY
 L8Lg==
X-Gm-Message-State: AOAM530h6qxKQWRCBLRTNQ+Yfp8bP/7xkqx95J2OdDAJ+PcVbg0J/G01
 oRRmWGR29C6YZeXlkIoVpcVBaOTzNSp6MnUeQ/UQrw==
X-Google-Smtp-Source: ABdhPJzQviKRFirm4fmb0haWV8WSjln7qSrk7KV8J69aTrnqY6u/fagiSTx31V0BDgfjFYnMjTuCdmAvylpcKrHMbZ4=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr51648256edt.36.1620935370374; 
 Thu, 13 May 2021 12:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-81-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-81-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:49:18 +0100
Message-ID: <CAFEAcA-V+dnrcrnhOLm4ggNajvfKA4CwYLvbML2tXW2mjQJ1mw@mail.gmail.com>
Subject: Re: [PATCH v6 80/82] target/arm: Implement integer matrix multiply
 accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
> and V{S,U,US}MMLA.S8 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h           |  7 ++++
>  target/arm/neon-shared.decode |  7 ++++
>  target/arm/sve.decode         |  6 +++
>  target/arm/translate-a64.c    | 18 ++++++++
>  target/arm/translate-neon.c   | 27 ++++++++++++
>  target/arm/translate-sve.c    | 27 ++++++++++++
>  target/arm/vec_helper.c       | 77 +++++++++++++++++++++++++++++++++++
>  7 files changed, 169 insertions(+)

I have to say the decode parts for SVE and A32 (using decodetree
were much easier to review than the A64 part...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

