Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C264B7A6F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:26:24 +0100 (CET)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6H9-00086K-8J
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:26:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5pN-0001of-P3
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:57:41 -0500
Received: from [2a00:1450:4864:20::334] (port=45987
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5pM-0004pG-9e
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:57:41 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso282846wmb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8u18YS2hazMVfN1W1rnVoZUe4MbcYd57oLDSIf6U+oU=;
 b=SGw2WklHc5ki6E8Ind6FU5md1f5/fqVrsG9DR32f3FcdsI0i2M+HTgrH+YmSubobXU
 WM4uEWj/BZxVbZ6+lP21xeR+dPyNL+8oUOJjN6zhQwgIIM36fZ1rNB/KVVzletXLeDa2
 TY14+nwzcR0QnXFUx3ZmZ1JJJiP73bKpetbUtAXh80pNLxJe0a8wlZ9cAopO88FUa2Wq
 BKqi4spzTFdDRdqhgCjid8GRun8t7iIzPGcwuVSLBx+AcwSulyL1cBrs8UJU2bnfvVLb
 4QqPX652nyZxv1sy2lB3Rqx+3a8tgCYd71CaJdy0stZ3AvQkvOctxaOQrAEtsqyGC76M
 e/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8u18YS2hazMVfN1W1rnVoZUe4MbcYd57oLDSIf6U+oU=;
 b=IGkrKjYO5R6YpabpPTrNzWNRe4NcsSNykmeTw814YPXQ5lLWbBbKLAe2H6Uyb+BPbE
 J4yk9cDy5clrNlCj4/tNTmEhEJW1Fb8Kva0deh2Ii56e5e986DN0OWr8MpX9ieH37/tM
 IDFPg/QeO0UHu52W2maj6QDJDHT22x+30+gNrhX/CRKPsu5dUljB4tWv0rgZUZsXd3Zn
 houKFBrc8ToqtfoK+oiwvrDghj191NxBaz/+71Bct167naDQdbahUs6J+CaU2F5KBRzt
 JzEaGIvwNalce6zJalWtHgLvpa3OiSnmx0+qAqzB0hIR2J9S9b7ODGgOMtad3WOVCGz2
 s/Qg==
X-Gm-Message-State: AOAM533S6BB9wbBIRu0SauPKnL5/E42y5p9vFZ+SjeLyUjuvkt6ZbyRe
 /+5GbSwzEH4WjXenHsg75tCvKjmHgAa5xs4nsxzPLg==
X-Google-Smtp-Source: ABdhPJy3ptIz2v+GH6ZG5aCPpQDrcSoFeEqM9ujR8S7vFZ90a6pnvpW6v7kBbbSpEuxU7Nn+7r05rZuMChqabzoLwmw=
X-Received: by 2002:a05:600c:2502:b0:37b:ce43:9ac0 with SMTP id
 d2-20020a05600c250200b0037bce439ac0mr4717038wma.37.1644962258911; Tue, 15 Feb
 2022 13:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-6-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:57:27 +0000
Message-ID: <CAFEAcA_hXzX7t=JR7L642B5Yr1=tYDvUbZXvK841AmRT7dhyfg@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] target/arm: Pass outputsize down to
 check_s2_mmu_setup
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass down the width of the output address from translation.
> For now this is still just PAMax, but a subsequent patch will
> compute the correct value from TCR_ELx.{I}PS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

