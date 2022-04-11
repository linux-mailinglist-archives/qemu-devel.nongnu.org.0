Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BB44FBC9D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:59:02 +0200 (CEST)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndtdF-0008Df-Pf
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtbS-0006aD-4e
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:57:13 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtbP-0002bw-US
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:57:09 -0400
Received: by mail-yb1-xb33.google.com with SMTP id k36so5618635ybj.11
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10lACxEaxG10hmEYQ7rTcMokTMdrQksZmLJH5Yu9fY4=;
 b=wOE7e+l1H7q6f/WpfQbf3ocW/oNC1Htvk2X3Es2vlyVYhvR6vr+Viy907+L/E9c5FI
 Gi+clH71dYl7s9PfIPsI5DMQcPP05a+Igdy/KY/hd/thtO5pNDemlGBx46hdZcexi/g5
 ifYbNmv6S1823D1sZ7QPJWRm4IefzFwMfhs25pjCOw80INVeeCs1ZSb7emNCtuZqPD0+
 RKMY3l5NwgSCa0G9XMuojHd2fDRnIWPkHBC9+qUNuRXSbVRy4LW+gh/07QQy95dXudM1
 jO/gjM3efR0WxFCOx64qkH+U2x6VzUe5Vmh6BEhhjDoLoEBgytGsdaputh6gXdonT43J
 AEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10lACxEaxG10hmEYQ7rTcMokTMdrQksZmLJH5Yu9fY4=;
 b=APnpuUSxU5sAtH+GyqlOZ50wc24avHmv4X8ZmHgHhVlOyW5Wo5SVPHzL+Qi1bpZQcM
 kHTG2LjbLh2KMc2xYjrXEAP7dD+JZMPhyU0jCTMlyBN3m/EoFBVeUVXRjgQ3xl9mZ2gE
 Q0f2xuZ04B/+wVt67RmnsO01Eda0YhfO/3px2tLGXwBFHWh9yZvs2ZW9V8wrq0fJ8ThT
 Q7D5HE9TXM8WAh1HkaRbYRGT2HF+ySnKKZHdw3SHg3eJ1O5prhv/ZQ7upiLDmFqZW2JV
 s4J4GGuzcowHR5uxkUaZCsTIKScJ/41plmPx3/MYS21jZpWvOM/dEFpe8ocaQBzyNLNN
 XaAw==
X-Gm-Message-State: AOAM531EVVVKb1+27VO/Cxt+G3h3EM8UKpqcokuZo8Dtd6cNo/3NSvVR
 j7E5M2/rYmd/r9txxTiZ5Jm+HH3f7IWgTa/5hccp5Q==
X-Google-Smtp-Source: ABdhPJyVw51CrqmgtgLgS1f18FG6TDOrJLkfkA1V+vfcum7dw+Krfz7+Yx5QdMdmHJ6n0ng615vrgtxb05+MN1mxSjY=
X-Received: by 2002:a25:3b55:0:b0:641:bd5:e3fa with SMTP id
 i82-20020a253b55000000b006410bd5e3famr9519386yba.193.1649681825769; Mon, 11
 Apr 2022 05:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-8-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:56:54 +0100
Message-ID: <CAFEAcA9yCpO9istX6E=3FaM44oJB8qF+j07B=fzdLvavYMcD-Q@mail.gmail.com>
Subject: Re: [PATCH 07/16] target/arm: Use field names for manipulating EL2
 and EL3 modes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
> during arm_cpu_realizefn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

