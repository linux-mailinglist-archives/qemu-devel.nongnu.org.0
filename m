Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F004CC2E0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:33:42 +0100 (CET)
Received: from localhost ([::1]:41024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoOc-0003qr-2s
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:33:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPoBb-00047b-65
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:20:15 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=47001
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPoBZ-0006H7-IE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:20:14 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id b35so11208138ybi.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 08:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhsvcMoBNEM7hxVRYwyTYNOekiwLASNClHhThvOJFIU=;
 b=kn8jWWOAX9ni3NHHT3/SM9mSzX9PHUgegAbitk4kgGZx/CpJ0eRXNLzdV4s444ZY4g
 kcazlvXOpPk4ON0SeAlaqe9I9ENlTwmJi5Lzw9j1q8Zo+EpUOr6pHJ7ab4CBVFf5rEnU
 +lKS+Mbm2SrPjbf4pHVSP1IJfmXWc86UZXVxnggKeglsRknLAAdNha1uGfnaYr+0lshE
 7dinn1ZZp6y9F5RUVF4IpkO8DuMqUA58o3xvUQ6roP0Z1k9J+V4+TrTGGgUtMzVnH1zt
 HQY9I9+7UrIx9rU57p5D6IsFRhKOeRulcCsBCuy2NO5C70mT8P30h1BL55ztbbkOR7gU
 RLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhsvcMoBNEM7hxVRYwyTYNOekiwLASNClHhThvOJFIU=;
 b=OxIVH0fvan4BPh3X87EKx2gHw/D7aYynX4YRWvaAvzalZDfRn/+HM3VqvHJ1C+SpwP
 m3eRSEywoAd4PuKoQYUkIVBkKoOmKH48exJRy4kGosYjkXPl2uuBCMoE+3i/5Af+EBNq
 wIEUAAlfG/Zb+5XRWiT7o/eSaltcoaWeZxaI9aHgZVMMFg9oA6PaExRTucMe6p/XLmRo
 Yr+PMugFiDFB+zoAmC7q78C6LPgHlspot+SOomKsISRAaFldoVhvsaGzDN4JrNbEpnqs
 gaenkQzw0dIy483nXwMoC4YxMajHWPdX58Di0INrA/CzvisUFB/0600U2Y0siAVH2S7C
 0jyQ==
X-Gm-Message-State: AOAM532oTqtsjsUlXScAs5oOhi6j6sY1TkUDUt+S5UB4o5o3jxIkBQPR
 x2CnLWG1KAu47bNBF+YEXkWVInlejhffXDDMC0SsNw==
X-Google-Smtp-Source: ABdhPJyAHKKpIEgtpJFItWQBlJnuXIBUfa/CXZfSQpSUtaPCfFyPDVQ323RrrciqnEM4GZ8pMxC86svNsenvQuVfzhk=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr33156155ybs.140.1646324407934; Thu, 03
 Mar 2022 08:20:07 -0800 (PST)
MIME-Version: 1.0
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-7-richard.henderson@linaro.org>
 <CAFEAcA_wCDP=-=FFp_hKE9r-5Vz7RMxpQV2BkH63cpv1oZRjbw@mail.gmail.com>
 <59dcee91-aec2-50b8-28a6-cbebfc9fb7ee@linaro.org>
In-Reply-To: <59dcee91-aec2-50b8-28a6-cbebfc9fb7ee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 16:19:56 +0000
Message-ID: <CAFEAcA9VF4ZnZ4sDv2anhGz_Yv8Y3m8ffGHX03yS=Zyr8xqEgA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 15:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/3/22 05:04, Peter Maydell wrote:
> >>       if (USE_GUEST_BASE) {
> >>           tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> >> -                               TCG_REG_GUEST_BASE, otype, addr_reg);
> >> +                               TCG_REG_GUEST_BASE, option, addr_reg);
> >>       } else {
> >>           tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> >> -                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
> >> +                               addr_reg, option, TCG_REG_XZR);
> >
> > This doesn't look right. 'option' specifies how we extend the offset
> > register, but here that is XZR, which is 0 no matter how we choose
> > to extend it, whereas we aren't going to be extending the base
> > register 'addr_reg' which is what we do need to either zero or
> > sign extend. Unfortunately we can't just flip addr_reg and XZR
> > around, because XZR isn't valid as the base reg.
> >
> > Is this a pre-existing bug? If addr_reg needs zero extending
> > we won't be doing that.
>
> It's just confusing, because stuff is hidden in macros:
>
> #define USE_GUEST_BASE     (guest_base != 0 || TARGET_LONG_BITS == 32)
>
> We *always* use TCG_REG_GUEST_BASE when we require an extension, so the else case you
> point out will always have option == 3 /* LSL #0 */.
>
> Previously I had a named constant I could use here, but I didn't create names for the full
> 'option' field being filled, so I thought it clearer to just pass along the variable.
> Would it be clearer as
>
>      3 /* LSL #0 */
>
> or with some LDST_OPTION_LSL0?

I think that using something that says it's LSL 0 (either comment as done
elsewhere in the patch, or maybe better with some symbolic constant)
would help, yes. Plus an assert or a comment that we know we don't
need to extend addr_reg in this half of the if().

thanks
-- PMM

