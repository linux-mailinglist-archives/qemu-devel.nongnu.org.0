Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11350915A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:23:19 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGr8-0002lT-Rf
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhGEH-0000Pn-HT
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:43:09 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhGEE-0007Vm-S9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:43:09 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f16645872fso29890697b3.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RqG5nYYQWuH7cWIXRd38XN8n0oXDwcNFZL9+kOW2VbM=;
 b=nYx7c/YqOfjw1+ndhXIKm1XBXAAvSbwphWC9jXaoANG0xQ+YMDs0KJgGK1+2eMGguS
 54pNTROFXOT3DY+JrYJODfP08bTpMKKi1bxs03IQk5lwbcMxb/o3SOEQoYIzNNjJHDDd
 vRo2zdZ0KADlBmh9ng6MhRB6sYCCpexzuHaKpO6HDYNsnBTz9mHzdcJw/1Lmh3sJI4ro
 W+wz3vvn9JSE8YlaRd6bCXqHFyXxt0V9HYW9nVOg0D4yEDgxvICQUFapHZO3jHpE+bCs
 mQpA7QsMkht4rV2tZVopTy4i3FeH5jG7Wy9sqCLrP9/22n7ef/qmjBx1UlCAyEdFefbf
 M/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RqG5nYYQWuH7cWIXRd38XN8n0oXDwcNFZL9+kOW2VbM=;
 b=H2p+puMqUv4JBEK+qDKd/y3IAmIldH3MPg8zGbSY89CHxnBXDueCxO5QS9hGt6Xm04
 +YzxTrxdTB96fH2d3OekChzVKkycVi7GaRoVhkk1i6XjMm4/87AJVPBykIU+Djv00p5k
 l+PAK7Vg9fwP80IMSYvikopoxUMv9g9To29GeZz+6wQTE379te0lnJL5kMsoMGkc701r
 LBIADaguCSDInr6OunRorIFGfrmm7Oh+WFxRoME077Pa0vT1UbNDQKRNn+VPx+XOyZ3C
 cfKSthH8xuDUFqUlA5dnTgEHfPmjZAgA1GXEi7ArCGLCRKngXrbHX5rZU27hFiocogLE
 YodQ==
X-Gm-Message-State: AOAM5329ryd17dgmH4XK39UZaMEDwQZ8x5V4GO4MvtQXJbXAS08WyItW
 3nzFQzHa7/AO9YGocWKjYr/eO1/nkHxwRE9O52SFMg==
X-Google-Smtp-Source: ABdhPJxfhL/kdmMqc2voGPST4onGbY1k4ifDS+gFDrBvZnftxON7da1aAnhg5oi2ZTetYMnC+pOMoyiokl7UhsEseSA=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr21935936ywc.64.1650483785817; Wed, 20
 Apr 2022 12:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
In-Reply-To: <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Apr 2022 20:42:54 +0100
Message-ID: <CAFEAcA854-k-c5ZAbb=m2LE_ogi2Gf-3idOxOc37zN844mKyAA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Apr 2022 at 20:19, Leandro Lupori
<leandro.lupori@eldorado.org.br> wrote:
>
> PPC64 CPUs can change its endian dynamically, so semihosting code
> must check its MSR at run time to determine if byte swapping is
> needed.

Arm CPUs also change endianness dynamically, so why is this
change PPC-specific ?

thanks
-- PMM

