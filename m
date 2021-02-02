Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C030C009
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:50:07 +0100 (CET)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w4E-0005d5-K6
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6w2K-0003rt-8O
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:48:08 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6w2H-0002CY-HE
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:48:08 -0500
Received: by mail-ed1-x531.google.com with SMTP id y8so7829904ede.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u6tYLc3QvI7oOyextRmlipyLgaS2zGToHBWZQm8Z1nA=;
 b=kzyD4CswHzRQpLhuZgq3STXVgLvuAQF6aBucPPmviECIhpgJKNZFKKnQgda5v5HW10
 CJW0gDluBszqd/TIV0eHJWrWIQbbknJL2mgBOwFAxEQumb6lOo4YwXe+sycbvXNFqGYH
 TfpfE/Y6p6L8KB+ciCFrpAy2ePDm23wGi7M0PwQE4ee2wU00erH3BEwboDyJ9p907MZm
 KxMgdGrXZB5623GU6u71MaIDqmeOu4YHml8V9GDRWaO2U0pXYsQMuvA8fuX1h6JvhjIx
 faEHn3P8t7Bw+92JbBuukwlIXkBq58tBLNme6AFctvdQkhnT6YaBLSQpDz7ldzHtmFC0
 n/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u6tYLc3QvI7oOyextRmlipyLgaS2zGToHBWZQm8Z1nA=;
 b=CuUGOia3/UaFaEco833l0Ql0pdUPBOnO8qDNiTdX42y8YJbvU+ibd9zwDTFGOQa3TZ
 GFxAj7xmX4tzwwlf6Ds2oghfv6iFRHBGFF0b4kwA9Uote2MMWPYec7viNHajd+RsLiy1
 d7SBshnTzkkmPSDrsQJ9s4Xsk87YmBs+b8wxfzn5MHSLhpVVlAeJIRpHsYKPjkHFvMEC
 lszBo1d5Lhks5EITR4VRJiNJs17Nw0DoheW6Txpupi14362ymUJ+Ei2QGUBYou7YDRgV
 MvIQzc47sLk/zFf0oaklLtAY+dRGCU75VbefL0+r33C+wvr9ql3zPLK4dmEHgdDDHUmO
 pAOQ==
X-Gm-Message-State: AOAM532lBFROToJktf5ohhigP9jnTSqUqBnSeAVWug0pKQbyEK/D4Cxd
 OGYjnhKdl2z21WRklqfsnnQNKrQJ1HKk8w44bljliBoWE7LvMg==
X-Google-Smtp-Source: ABdhPJzAImkBMEuC8PQ6hAYFeucsr7/mj4sPBGbc5ENhKr0SlxGhFdbkGozohToEJbyH+wi7BD28EIROYl+FjlQBgSA=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr23660437eds.204.1612273683889; 
 Tue, 02 Feb 2021 05:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
 <313440b0-95b8-a690-a7ed-65c8428d7c42@amsat.org>
In-Reply-To: <313440b0-95b8-a690-a7ed-65c8428d7c42@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 13:47:52 +0000
Message-ID: <CAFEAcA-9asbQXq8E1Jcqq=AcZw6kO8M9UKGbq=FSnB5iC+dAUg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 13:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 2/2/21 1:28 PM, Peter Maydell wrote:
> > At the moment we can reasonably
> > say "only the 'virt' board and one of the Xilinx boards are
> > security-critical".
>
> What about the SBSA-ref?

It doesn't work with KVM, and enforces it:

    if (kvm_enabled()) {
        error_report("sbsa-ref: KVM is not supported for this machine");
        exit(1);
    }

thanks
-- PMM

