Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCC518AE6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 19:17:43 +0200 (CEST)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlw9e-0002DS-6N
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 13:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw5b-0004TK-6U
 for qemu-devel@nongnu.org; Tue, 03 May 2022 13:13:31 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw5Z-0004ny-OW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 13:13:30 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f7b815ac06so187228947b3.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Di4++87vTIuoqn0UMYKPw81uIUC7asGtUA11QiITcVI=;
 b=sPSHQOThpplkZHcxWkUEWuoCq9ro0MH+1dnV/GX7Po1iMp/sUTvEV3vEV6M+ALKkKq
 ZaX/VEdAX2LSI1sx48uPlHshXJkDn7vPwL92xf7OKGER8NRCMXnOjq3DKfELLjV76SjI
 s50B5yQ1/BNQCDSS/uo72Cx0XXW/g2d6YlosMPftGNuc8GOYuiX2vi+wxvgi8d5ajfBC
 rHzRiL1LO+pEzBv891wKP5m+9+TFM120rfsCO1IcMfrQggSptX9NgznbKRGGjoP+1mVI
 zIVHeD+f7mwAsubd14qi+D1L4zdvFiHjTOxyA2FQyOPDr9m5jGMkmBHs9HMoNN1ZDigL
 u6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Di4++87vTIuoqn0UMYKPw81uIUC7asGtUA11QiITcVI=;
 b=ybwo71EI5M5a/WajEubVBvw8oZc9VtZPPnGSQQQa+5h87Gi9BgV1NMz8hq0zMivKxy
 SgD5E28n6i2j0ZjFF3PVC11pchndEpCP0c3fx4FKePj62GqjSDc/oytOE3EO1v3jf1U3
 jFhcnLwq2cCFtvnxEMBWu9OYsnigeV98FsyfYP7vOP+B8yeMgx9OSFZ66HN7q+3cp1Hx
 gcWga27ZN9nlI3cw6qtbqq6+q/vtydlQ56TU7dG+PoDk4xfRNv0Q1TnjFIJ+rRX+H2l7
 Mx41+luaS0ZUyH2g3IPsnTZpcBmYwQrHFLqmpVx5aepa9DhwnoOv2PLOUOnz5cWMW+Cb
 d8EQ==
X-Gm-Message-State: AOAM531RTyGxblBER1D/dIOLvIZbEBdjsjl6yinf7aHqbhjw0BmBCJfL
 iHtLEByv93acrnJ9niSNox08CXeRe824+qwU4yxcow==
X-Google-Smtp-Source: ABdhPJw3taa3fI0HZq4a8OhcLZTA4SKtw2OR0RV1ldkhcHRyz9SO2C6AM3bBlgtHLewVPMq6FxNDMVA0iLT7LypPnc8=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr16071236ywj.329.1651598008887; Tue, 03
 May 2022 10:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-22-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 18:13:17 +0100
Message-ID: <CAFEAcA9_c8dSv=MxF_TDX0jRZJixm2sAoZ=QbBGWf_SqszH1Aw@mail.gmail.com>
Subject: Re: [PATCH v4 21/45] target/arm: Drop EL3 no EL2 fallbacks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 May 2022 at 07:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop el3_no_el2_cp_reginfo, el3_no_el2_v8_cp_reginfo,
> and the local vpidr_regs definition, and rely on the
> squasing to ARM_CP_CONST while registering.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 158 ++++----------------------------------------
>  1 file changed, 13 insertions(+), 145 deletions(-)

The vpidr bits will probably change here, so I'll skip
reviewing this until v5.

thanks
-- PMM

