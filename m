Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1A51DDAF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:36:42 +0200 (CEST)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0wb-0004RE-QD
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0uQ-0002yY-Ox
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:34:26 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0uP-0006ih-6P
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:34:26 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec42eae76bso87178367b3.10
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DrKeoY7EnHJfB1OxCMPypdHj3bMBrCzaSzFqKYpoSPE=;
 b=pakHyvaKUzihwevbX+MyP4qaViXhh6NNdh3j1Snznv4jUhPvXIywuEET+tC1cAVUIK
 FqFGCL2fCloy2FleSSh4Z3H7yKR4Nq3NiLEQrFUc/ysNEOBgBnqarEVwij4J8zVvZ6SR
 ZGHqWNIWzUmqUt05kEZI+QCeuJoGAnLxP3oc3nc5SakWKpFiVF2ez0hhtmzlZArNB7bI
 LT40fWRTVvDv4/Z9MVIDknD/Rq/mKy4+MJOPiOPSqUnXEtIyRF+MCpcuaQfSudK5hGdJ
 ElljCJwgo44LwteVUBS/fj1gcjOI/k9JBngWM/gPV///5Y/E8amkMx1JeeHrcFrWleno
 B0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DrKeoY7EnHJfB1OxCMPypdHj3bMBrCzaSzFqKYpoSPE=;
 b=CGv7nU0TFTNwRnlW/97r8qDFf49o0IZHx5YNplT47imqcHobXmIk3p/CGt5MeeF3Ss
 XRI9HQqP52gyxMysFeJ7YLQWpg+GsgPnyYJ99mIf/7tmxYifNXVwnliBaI5EtGJDuKWk
 cP9FVf73c5TOTx4JgTD5NewxSV2O54gNQMFQBOzh/tD1qcfxdnwNXxDBwwq0Wj4uw7L4
 Fg02mWGYd3Jt9EpFgPT4SA7SfPIwNcNJtbFGhXcocwdKh59npe0cnO4FXlaLqbrUGQr5
 UexejTSl6hP15snt7BhljZdWWRujLaDGhSmubjDT05xO+sKbazk8KQKHjs0rWmLryhi5
 caSg==
X-Gm-Message-State: AOAM532j6WjB/CfjzfvGRfVzbR1YRzNXASV0T0puJOagW05mtZGkD7Cg
 4OJyl5u0VcmaYde0zp3RuWQ6vjQnTNr6mF6vt6Za+g==
X-Google-Smtp-Source: ABdhPJzXDqxWViODLtJlQLTFcD8jR3VSe52UNpxc2TizmypDtO2RsjFy2vcI1eozA6CVtwyIxfFhIx8WXxMZVDmd2xI=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr3623772ywb.469.1651854864243; Fri, 06
 May 2022 09:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <20220506162129.2896966-5-peter.maydell@linaro.org>
In-Reply-To: <20220506162129.2896966-5-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 17:34:13 +0100
Message-ID: <CAFEAcA8bT_LzFTuuciWOUEVnozpOqySrpr1pkZ76MGEk4NK2RA@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/intc/arm_gicv3: Use correct number of priority
 bits for the CPU
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Fri, 6 May 2022 at 17:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Make the GICv3 set its number of bits of physical priority from the
> implementation-specific value provided in the CPU state struct, in
> the same way we already do for virtual priority bits.  Because this
> would be a migration compatibility break, we provide a property
> force-8-bit-prio which is enabled for 7.0 and earlier versioned board
> models to retain the legacy "always use 8 bits" behaviour.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have guessed at the right value for the A64FX, but if we can
> find the correct ICC_CTLR_EL1 value that would be better.

Shuuichirou, Itaru: do either of you know the right setting for
the A64FX for this? If you can find what the hardware value of
the ICC_CTLR_EL3 or ICC_CTLR_EL1 register is (more specifically,
the PRIBits subfield) that should be enough to tell us.

> @@ -961,6 +964,12 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->gic_num_lrs = 4;
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
> +    /*
> +     * TODO: What does the real A64FX GICv3 provide ?
> +     * This is a guess based on what other Arm CPUs do; to find the correct
> +     * answer we need the value of the A64FX's ICC_CTLR_EL1 register.
> +     */
> +    cpu->gic_pribits = 5;
>
>      /* Suppport of A64FX's vector length are 128,256 and 512bit only */
>      aarch64_add_sve_properties(obj);
> --
> 2.25.1

thanks
-- PMM

