Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742744B9019
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:22:32 +0100 (CET)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOwh-0003RU-2h
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKOSW-00015s-32
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:51:20 -0500
Received: from [2a00:1450:4864:20::430] (port=46945
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKOSR-0002o1-I3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:51:19 -0500
Received: by mail-wr1-x430.google.com with SMTP id q7so4705025wrc.13
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2t8HxMW3UIXA5IlSwgBJ+vLneK5MnHi+nyZnxObiZ4=;
 b=e6xdHIW8K2XElO+C0mBTxXV6R4cqLIDwCqbA2LqemYWOjgjx/fIkAeEOtIR1S6X9ZA
 SnstctOloSuCJhg+z9a4VO8gG478I45+gcu76MT0XJ9n+onpzZpX2wsFaLxtx7lS5bMY
 JZtoKBMOJPGhqA0dRF23CXc9FC/a36xBglTnAuXN1aDspcYEYJR92L/6ohwesKVfHcdS
 BWoy4eMUvEj0qOppueaM4b9jyvTdv6h/5BzpDGOs6IVrBiQLqq/T8umyLAdaE02b6hmd
 qHV6sQYqI6XoLkEJz6UYgXYTNazCtj9KKEt2C1P9MkQVoLamq2up/b7T+g5V+75R0OFM
 0znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2t8HxMW3UIXA5IlSwgBJ+vLneK5MnHi+nyZnxObiZ4=;
 b=6wsBGYvYYJz4K1sSpcTNia/aq7BBIQtGpKsdoQCDrMlXgM0a8hIv6K7Sv7nW3oXOPC
 oETKtL3R8vjIN7Jyq+aOW4byxnua7JpWT5K5bLxEom9h13q7rYnu1bkSYINkM85KpiFw
 hnFb24wXWDPp/Y98lJW/16Wl/mitb2qrtjgi0vlOVPVoNSY3XiGpezco9RYDcIl1GKIR
 T7wAeVZR6RwVJEWfFNJ81cIOPAralLfQ5G5a7Z5tlQktXvTkzcYKA3t3T963j6/fLGu2
 vAdjMrc0b5S2qN4G0QluLUdKywO14NBbnL/CQUAejCN6wfOZ3YhduOZDRA7GBSS2VaTX
 kf1A==
X-Gm-Message-State: AOAM533qHioNBSgSxDhV/LBP/AwU2+EGA2lzuzDj2O6GyjOgY8FJyFqb
 1wB18s2DpPsgaDbkWUNtqhXnWbRIrOA+mrwJNqkJjw==
X-Google-Smtp-Source: ABdhPJyL+19EG1kRk7iylXko9/G4R3t2dsDhDmJlDthHtF9Ww/74gKwwCxHCB0ItpUxbQOB4Bg2OTLnmA5J49HAyd2Q=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr3249652wrr.172.1645033874244; Wed, 16
 Feb 2022 09:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:51:03 +0000
Message-ID: <CAFEAcA8Ya2Ghobdosfnkv6XWAFN0HBSxawoUq0tQd-z9hC0V1w@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
> Changes for v2:
>   * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>   * Set TCR_EL1 more completely for user-only.
>   * Continue to bound tsz within aa64_va_parameters;
>     provide an out-of-bound indicator for raising AddressSize fault.
>   * Split IPS patch.
>   * Fix debug registers for LVA.
>   * Fix long-format fsc for LPA2.
>   * Fix TLBI page shift.
>   * Validate TLBI granule vs TCR granule.
>
> Not done:
>   * Validate translation levels which accept blocks.
>
> There is still no upstream kernel support for FEAT_LPA2,
> so that is essentially untested.

Is this ready to go into the tree, from your point of view ?
(If it is, I can add the docs changes when I put it into target-arm.)

thanks
-- PMM

