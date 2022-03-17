Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C704DCE0B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:52:29 +0100 (CET)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvEa-00036O-Eh
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:52:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvAT-0005XF-Mm
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:48:14 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=43864
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvAS-00018n-56
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:48:13 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id v35so11850596ybi.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CROErrb3b+TtVaX1bP5gX5ur5e2SQC8+CMctYzcz45c=;
 b=NlC0m6CKyn9WhxOhBOOjxXelTYYi4V6bKiCjIA+IqiyV+Y5JKaz5XJcCDe5rWo+zOJ
 B2Ih3lqOf63QT+Sv+dJVVCWv4gVn4bi1f4NIMUh+IM2Eu8B56el1jsuLc2wakJeim8zX
 D07Z2QFac1+uDCqk9mgOX+zu6A1BkIlr9c1hIYWgE8SarF2CY3NTpSHAqM+FdZcFgvPY
 4RV5AGsi17WWEZCBP1VlpRAWRyNE7dcRFCJMxlweIOM608vZLTnW/A4yuvDOqlZs01wo
 YpOtFd3Pxyo/yaQO9t1zFjsXtr17cjQoBTNbI76RMOytopNC70GXe/LUMgukBb2tulSs
 6XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CROErrb3b+TtVaX1bP5gX5ur5e2SQC8+CMctYzcz45c=;
 b=AQrQq4h1hoxOro1PNtmRmKo8mfrSaJN1e9ZTiEY2pQ22y5u66m99pgTM9+FjSa8gLg
 sHB6vp1LrI1Z1b3l/1M53Y0/vpsnPM5PKzJomp52hVJLmsYs9zh1/9D3FMOanqvcEIvk
 Q2+AiAuCHcKm7UIXijYxQSmC3ncKal1nV5PCV6Eo2NtHwQZ/+tuywCrt3fshfV1fFcGZ
 VeZhAGbadf5d2NGf0xsUeEuLTDyuOXvRNmcTZInDS9rAZeObKDrhh2TakDGhaESLNYfc
 draR+UAQHSkOrDOD1P1NqrlRd15dv535g9lKCKLFl7M8qbqCwGt0AHOMq/0aq4ZispYG
 um/A==
X-Gm-Message-State: AOAM531Q9fVcP9joz5/xiVkT+pdVwR+SVkSzSsjnY1fdQR3JRRycsCNA
 Siq2Wc3tqRj+0MCTZwjAD7OAHkaaouX0e9dZxSrUgA==
X-Google-Smtp-Source: ABdhPJwYR5LHiXqRI4RJg18suH00lE0QgD9xxC4d2cfII9OtqNjclw/qx46awl7pvSVEdhIO4kKF5T9SwzoBvmfms5s=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr6554827ybq.479.1647542890010; Thu, 17
 Mar 2022 11:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-43-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 18:47:58 +0000
Message-ID: <CAFEAcA-sTu_c_cHmwB6gEXMKyr99cEfeato0fwkqkyBV3mZs9Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 42/51] target/nios2: Implement rdprs, wrprs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Thu, 17 Mar 2022 at 05:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement these out of line, so that tcg global temps
> (aka the architectural registers) are synced back to
> tcg storage as required.  This makes sure that we get
> the proper results when status.PRS == status.CRS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +void helper_wrprs(CPUNios2State *env, uint32_t regno, uint32_t val)
> +{
> +    unsigned prs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, PRS);
> +    env->shadow_regs[prs][regno] = val;
> +}

If we have the TB flag for "r0 is 0", then we'd need to make
wrprs writes to r0 in the current register set end the TB.
(If I'd been designing the ISA, I'd have made attempts to
use wrprs/rdprs with CRS == PRS cause an exception.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

