Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C8600C05
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:08:34 +0200 (CEST)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okN2u-0007hW-9I
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMx2-0003PJ-6S
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:02:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMwm-0008NZ-Ms
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:02:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n7so10333055plp.1
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 03:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p+ZMSXTJyDGGWTu6iPzszVJjtq/DklNxtbL7y7+n6nU=;
 b=f7z7lw3uewBtqDBFEFPX1iUyGyAeZ5lQF+jY3ugxTESamo4P6F4RnwV4tFQ23VQE8G
 83tfwzkFqKAcd1lJ/ougyTWt/ysOmgocd1l80kwCa1ioorft0jZE8PQwQTvpZiVxhKDP
 ksOm2yZwjRHn77TW4atXYB+Lxjpte6wW0ZINWlS3CGdX3x+vEZonmFQC4AEgLOy8OG++
 LMILc9IRraJUqZ9GkC6JmIs57vb7juiCt/cli+kxZO1mTw17qgzU8Zdq8x4HnVkyx0FI
 JXkpevoD3DLRzaWnLSB+zwUO0/zZBEohQDOQkVhtwT7EQCN+dXvBi+Ecuu71EN75GusV
 lcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+ZMSXTJyDGGWTu6iPzszVJjtq/DklNxtbL7y7+n6nU=;
 b=J/rPE5Hph0wRO6uYo+HT99dj96R0pbwngs3gMZyxfZG0T2qnGRKnqDKvmw3ZIKyXMZ
 IdRPAMIwj3rakri2A9FljxtNfhFkGTyLtuuowH/n7uLwqXL5lApAGOukMmq8W1cptRfU
 lM2Ps7JjwaHF2xIPq/YpbOgi8M61CUVrGaWcEWdM06THTFFbFyOzbhevdqv/g0ckTiyh
 SVYSWQORWV7OK1jQXQi+LkUTNhfxTXacSLa+zLxJryVJVUpZIZ+cZmFUEpy9PBT6GNGL
 BkvI/gm8WJVKqXn7ZSuxM2+G/8E9YItQQSWZPA4C3/HNcjlx0Ltc8823YnERBLpBBi8/
 YcWA==
X-Gm-Message-State: ACrzQf0c7hf2xaJGu5RrBAeDV3x817PbR8chwtJq7+OGylZvf/pPhRMm
 6VuyuDxFlpkn1qFYuc+7AQRZZPWMMsHDcfiSfzawug==
X-Google-Smtp-Source: AMsMyM4mkh68kSUuwzfcr+Dy7kERJhZUwYTb/8usE2waHyxiXuZKIfUVnKiIG7EABC/Z4NcS9fAXOg0jkWSaHQJII9o=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr12922221pjb.19.1666000930868; Mon, 17
 Oct 2022 03:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-14-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 11:01:59 +0100
Message-ID: <CAFEAcA_Vdc2Cxvwnd_tc7ik_-NMXk_z0URsV=r7eGYy3bqhstg@mail.gmail.com>
Subject: Re: [PATCH v4 13/24] target/arm: Add ptw_idx to S1Translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 11 Oct 2022 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hoist the computation of the mmu_idx for the ptw up to
> get_phys_addr_with_struct and get_phys_addr_twostage.
> This removes the duplicate check for stage2 disabled
> from the middle of the walk, performing it only once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> +        if (!nstable) {
> +            /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
> +            ptw->in_ptw_idx &= ~1;
> +            ptw->in_secure = false;
> +        }

I feel like this bitwise manipulation of the mmuidx values
is leaving a landmine for any future re-organization of
our mmuidx use. Can we do this just using the symbolic
constant values?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

