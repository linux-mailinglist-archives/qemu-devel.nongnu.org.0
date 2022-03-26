Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F94E80F5
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 13:57:10 +0100 (CET)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY5yf-0002yY-PA
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 08:57:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY5uH-0008Gz-AK
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 08:52:37 -0400
Received: from [2607:f8b0:4864:20::1135] (port=32946
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nY5uF-0007kx-VH
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 08:52:37 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e68c95e0f9so107791547b3.0
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XrPOpqoOcz6GH+UIfcJh+HaDjimc8MbJ1uDMT9c/Z6M=;
 b=Vrq8fdB7M6V3CfwY5bhCZPzKW/oSIlc0Hvm+bktGck6MuDyrW9gBEyMFnQJBn+hNY0
 tcL5+yLALnTK+Ax7gIO8eoFWyUpUiih7BZWU8xuUiKsvJXvGs+YyE6sGAUh2h5wsKIgJ
 lUQcOof1lvIf1x6Cjz97yqpGSl0TFcOrrnpbRvFUb23cngepjfDFHfQFjONTx5J0DM1W
 ozIxbXuQaE+fVzkOlReL4u0P2il0mImC4sI+ejNv+CSfvEus/Cnil3nhpGr0U01Jm5K5
 61Dzaf+mlaRe4pXw3quuVNTeXc5XLd/CAwzm5DEE5ZS+P3/eX+GVZcQeFbs7M8wDi04m
 +s5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XrPOpqoOcz6GH+UIfcJh+HaDjimc8MbJ1uDMT9c/Z6M=;
 b=OmsWFIkQleL/65PO0wg9i7Cs00aRwf3aUODEFkyjGNNBwR77acSlxwiBIjyPBO2fly
 hD8gHkeOW4FGjvW6WpOrWtMr6Nwe2yg/sdYQ+SZ4md0USMmkpiODLppnuRRAgSrpBXHV
 5dr6WsqQGDU5Uqr5CESwke6OCxxnlVS96uqXGZJ0PSjq891kMJBUE0FOAR0J2KK2/UYO
 mGWdNkLdAvjrizCkf9DiBIGp42HFVMJe2FxY3m9208rdkQ6dRN0tjT9nXHYCvkCQWN3j
 QETHCROM2FWCplH8Ppz2bcL1uXK9uxlbL7DsowZZ+9qwhuXPp/5OqRdmsOGovC+8Gw+n
 Tf8w==
X-Gm-Message-State: AOAM533vbcHIgUB7t3GNSX3om8kNwttG7YNLl0QyF0mMHeJNZuDI5SDX
 ng+nu2Hc5OvkDRv7mYhCx+1udVoR4s6vRmB59mDpXA==
X-Google-Smtp-Source: ABdhPJyDj4AHn2F0VG7EQ/YGmm4snT2HetpPpMnaG+/dMhMh9a5HY7vFKSvPn5rdKQ6jKl5ihcnmAPZi49Nzf6og75I=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr16112797ywr.64.1648299152784; Sat, 26
 Mar 2022 05:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220325195250.386071-1-richard.henderson@linaro.org>
 <20220325195250.386071-8-richard.henderson@linaro.org>
In-Reply-To: <20220325195250.386071-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 26 Mar 2022 12:52:19 +0000
Message-ID: <CAFEAcA_3pAAbmhzq93Qxth4wO4cVSucd3ZbkFxdqNb9AZUATFA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] linux-user/nios2: Use QEMU_ESIGRETURN from
 do_rt_sigreturn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 at 19:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the kernel-specific "pr2" code structure and use
> the qemu-specific error return value.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

