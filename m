Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B84E73F7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:09:21 +0100 (CET)
Received: from localhost ([::1]:52548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXjgt-0004fx-TC
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:09:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXjel-0002Zp-2n
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:07:08 -0400
Received: from [2607:f8b0:4864:20::b29] (port=34564
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXjej-0008TT-Jl
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:07:06 -0400
Received: by mail-yb1-xb29.google.com with SMTP id g9so11508720ybf.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 06:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15s50tcDFR1HzqW8ksdyxObCwUPRyLfSU33iA7ERmPI=;
 b=dGZFjfF3wbOPvvHgIjtfRMF+RGFc+U4P0F4zwCRh0q9VyHxRJ1vlNpfBaW99ZhUAn4
 eeHDsm4UjDRHpDTLEBdcaDC5fkInQDOhsNzwb3QJNasi7rhUC7LSAi6ZM6XctHTQ8q8L
 sYxyt3sHh3qPI+To4VS6PHtiW6HZwQiM0JsqRK/4uzeuiJjVYpDhqTZkHNKvnsCiBlxp
 O6cyLUz5Fp4/ItYKNd06pBvmsSweeDWv52bkucI0TYPk9GGd5Z1XMiSFp+QMtOp3sGLu
 yT5cOj9soM+ueBzAFkN70pzQxNQmhNkdzN0hfeGQfoRwFEvVcpxpfkWOmCyYEYEbq0BF
 HQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15s50tcDFR1HzqW8ksdyxObCwUPRyLfSU33iA7ERmPI=;
 b=G+rncYbcQ/m1svzGI5r4nOULmt+CoMgdm8LhWLCYKkqi1fyLJNLn0EWnMs73SIpNrg
 GQACmCMLD+b+g7NSoy7m1uNEo2/9HnJ6925DsQrHRmgSE/gJMpF1KdQsCVWncXPjz++4
 rHo51JT+DYgD5umHcMR64+5/eQsJ5iOu+wFXy8HMqG7DCsc4t1xvJfV85PvVtsvwMLMx
 APQJAbi8lew6RGaGu4KcHN2lNedFZmjZI7r+s9SJOa5d7Nfb4zbkVpLBRx1eHYjS1FMi
 sPSKuvaLhh1j8mDj+5HkAAxGBMrhlbh6KkaQfQYZ+21iS8zQOaDfBEwhCSylmQR9qTAf
 8grg==
X-Gm-Message-State: AOAM5334HG0IsK9qmKzz3ckSWB7ZnhD74mOSAYdpiUQtfKGI69iMmYER
 ix8Tvu1Vhiye00p8IUSUzIcyip5H7JzJn1gYWxEq/w==
X-Google-Smtp-Source: ABdhPJzhVi3cIc1ymNPG5bBvwSvfxpTpNCYlgqbu7OzesJYxNeIZEgA9hkaJgGLhVbzxU2tH8beONe/SPsWiq/+NnQU=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr9718348ybf.288.1648213623618; Fri, 25
 Mar 2022 06:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220324010932.190428-1-richard.henderson@linaro.org>
In-Reply-To: <20220324010932.190428-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 13:06:50 +0000
Message-ID: <CAFEAcA_vJc35M1MGQ_Ytq5sHPM66E4oczw+Ab+oqWo-O_TJWrA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Thu, 24 Mar 2022 at 01:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Both of these functions missed handling the TLB_MMIO flag
> during the conversion to handle MTE.
>
> Fixes: 10a85e2c8ab6 ("target/arm: Reuse sve_probe_page for gather loads")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/925
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

