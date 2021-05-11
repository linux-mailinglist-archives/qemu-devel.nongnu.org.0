Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D75737A701
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:46:37 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRmW-0003dj-J8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRkT-0002UA-Lo
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:44:30 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRkR-0006x5-2c
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:44:29 -0400
Received: by mail-ej1-x630.google.com with SMTP id l4so29528766ejc.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F684eT0hVKGv5hV9NXyS7ly1wAr5UgED2uIgD+XB6wQ=;
 b=pPeQ0udAVEsTEtTcq+5/7L0KJBZocwe/F0e/mNOKvk6Q2qDTc1+R2+l+7IdIeVSMoi
 yAncrh7xNeyrCWHR7gJfVs/1eHk9XBH2hxSam0D//dkAnp3T2zSA2WQ2nxpeyhuhgYhw
 coEFuuBtV2MQI5lr3KjqejgEJ03jf6pWMShhjHx1iRWqVnz/RbBxA4HPOFQ80iKt8lXt
 kiOc/78Ko5AselbLQrKLqdrxstaYW+5FJmJTRwFlvsPiuyQaavv9koJlcq3ADBucRwMG
 35KeHpmgTI7vQCD20BzO3KqrMLacfWnDRFckxpfcKt/X6pdesh3rPHpKA3pMdgvZsWjB
 q1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F684eT0hVKGv5hV9NXyS7ly1wAr5UgED2uIgD+XB6wQ=;
 b=hLHuIj5hPWHKtF46Scpf8MRRiODEp1tc6gW/WGAjD8pwjR0yPQRIO8F9HgmHdyXLFk
 S63BCdpO0dMK+v+Dd+jMVg+yRZAelOuKoHhC92swKx47zD7EuxLEMlmXBa1jPuOcbkOG
 yXBk2tjrOPaJexe5tL13J7uNZ2ilUzbG+K3wpbEFIOOuOx3Lh7eekNY9foInhNr2uioI
 khoI1bVG8tUySxzHwNOHqyyFAncDnMQmPi6vHdbQ2rjWLET1sz2n6RkoNIoM9QWYWC+G
 0oajfIdBOu2HQyTNgiMbLQgUq+KE64Z1j61nCIZKqJDhS+FqocpuxU2N40CPnPWqqbTL
 jwgA==
X-Gm-Message-State: AOAM533dVP06n72eixa4YMV3g/yG1veiyd2su7Ix8v+sbAJXtPacOiXP
 W+wQ6DPGHR6Gn7NB+fpfTkZAOGaXKZihb6qeTCqbiw==
X-Google-Smtp-Source: ABdhPJyUehAUGS1/D1Wq/DOJY0wwEb9YZDV6+YYW4IBowQY3nfRbbMuJcVr8vXE8d+DPlhCQ59bUN9KpEB39pkUSqQ0=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr31136874ejb.382.1620737063132; 
 Tue, 11 May 2021 05:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-17-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:43:10 +0100
Message-ID: <CAFEAcA_jJwuMaZ0wL-+CotQyhCp1-PeMMJ8A9LpVD=kruz4L4g@mail.gmail.com>
Subject: Re: [PATCH v6 16/82] target/arm: Implement SVE2 bitwise exclusive-or
 interleaved
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Fri, 30 Apr 2021 at 21:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve.decode      |  5 +++++
>  target/arm/sve_helper.c    | 20 ++++++++++++++++++++
>  target/arm/translate-sve.c | 19 +++++++++++++++++++
>  4 files changed, 49 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

