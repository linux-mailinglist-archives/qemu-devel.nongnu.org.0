Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6094AD855
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:30:40 +0100 (CET)
Received: from localhost ([::1]:59270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPdn-0007v1-9i
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:30:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOUA-0003Hg-8G
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:16:38 -0500
Received: from [2a00:1450:4864:20::332] (port=55017
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOU8-0006dX-Fm
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:16:37 -0500
Received: by mail-wm1-x332.google.com with SMTP id c192so11891895wma.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZibApSgJYaRpnWVHuiyGdQRSoLXR7DreYQEO9IPySxE=;
 b=KNftfQcrPyzbGlwdmlsKiWQsqovuQn62POV5SuMzgrETqpyb5Vqnj1eUivkpTARMu8
 ChfJolhAfYIAZNYPl/VBefClgjnzAB+ysaNbEJFRaxDvXZvBg6Uq1BqpMpez/+YhXlmG
 ztsCdCY4u+1FAxfbsJX0FSe8osDq/pRa/R/ob11JBD6PWjeoDL1GNahQ49Y3TxgbLKIC
 jR1/KNLnm5iX/+gDewuQ34zpcoA47l0nTm/4TRdMCTBsdDebB3lhZ4yoejScVuRRxO1j
 kQrWXG6flFjfsa51hZSiVbQ4OG3vBITZ71VDfVB1n2Ei+ktNbtfAU2D+1xZS9c0GQFPi
 112A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZibApSgJYaRpnWVHuiyGdQRSoLXR7DreYQEO9IPySxE=;
 b=GkpsJ3EeKiIaioFI5U0fjVpQ8VrrkU8NvFailt1JyA5W6xcPgHPMphd4ummgB1NT6k
 FA1Mj9b+yJtKzCClBKV9ZJlr5cpz95i2pX8Pi56hSG8UnfPEEUhpuyGXSbBGpLX1/Hlj
 +G8El7ZQcz/ZdPXa3M97k2AJQjhHracoc1rIr6IzNzjld/SyoThK05cY9JqZmwAskcmx
 i8dDj6gLWYJjKI/sTlM94mGcSyP4ve7D7LSSTArDlWXcwxMttCOv42XFGtFHShU6E1/R
 969cZY49NPuiBJ1SITdSFQtOt8m/otMZk7FhRapDmXC2Zeb8GAzyydbN7YxaDu+ChZxz
 OoiQ==
X-Gm-Message-State: AOAM531i34mUhYyhtsqB3M9oOHbuCpWC2sKZec0nzhyFQm7tqxmj4fwF
 EXhSxCvAn3WsN2y19evZRHbJL+rwlWacZy32H+WX/3roSbY=
X-Google-Smtp-Source: ABdhPJyjEZu31LRTHrtgL/cG/1RKNLbuFiDTRvuAznx0eD3rloZ+k+8N7In2tcHkOzUk+414wOvR+vJgk81vkzNU0ao=
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr730625wmq.126.1644318995073; 
 Tue, 08 Feb 2022 03:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20220208071710.320122-1-richard.henderson@linaro.org>
 <20220208071710.320122-2-richard.henderson@linaro.org>
 <CAFEAcA8guxNuHUhF38GT3rX15K_fTHEUBaRPooTxUFaVHx1wmw@mail.gmail.com>
 <e478cd62-9b81-91cb-8ce3-ca7872238c8e@linaro.org>
In-Reply-To: <e478cd62-9b81-91cb-8ce3-ca7872238c8e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 11:16:24 +0000
Message-ID: <CAFEAcA82xuxpjNW2wvuwe5OGN8WOjr8Fvif2te=WpWLAaTZRJg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] tcg/sparc: Use tcg_out_movi_imm13 in
 tcg_out_addsub2_i64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 11:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/8/22 21:40, Peter Maydell wrote:
> > On Tue, 8 Feb 2022 at 07:17, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> When BH is constant, it is constrained to 10 bits for use in MOVCC.
> >
> > Where does this happen? I assumed it was going to be done
> > by the constraint encodings, but tcg_out_addsub2_i64()
> > is called for the add2_i64 and sub2_i64 ops, which get
> >
> >          return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
> > and constraint J is
> > CONST('J', TCG_CT_CONST_S13).
> > (and indeed there is no "constrain to 10 bits" letter).
>
> Typo/thinko with 10 bit vs 11 bit:
>
> CONST('I', TCG_CT_CONST_S11)
>
> But there are different constraints for add2_i32 and add2_i64:
>
>      case INDEX_op_add2_i32:
>      case INDEX_op_sub2_i32:
>          return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
> ...
>      case INDEX_op_add2_i64:
>      case INDEX_op_sub2_i64:
>          return C_O2_I4(R, R, RZ, RZ, RJ, RI);

Yes, I must have been looking at the _i32 lines by mistake.

If you fix the 10s and 11s to 11s and 12s:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

