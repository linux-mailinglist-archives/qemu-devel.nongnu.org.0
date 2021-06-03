Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F539A1C4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:03:40 +0200 (CEST)
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lon0d-0004it-Mn
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lomvV-0000pI-2z
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:58:21 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lomvT-0006fO-CC
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:58:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id dg27so6963564edb.12
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUoyPqNKBI+zbdIKugNnM1LHEZPj+FEDOImWQ084pVc=;
 b=EJrevWmSwPRTjY/jyp8oeyL0Zp3AQNzYIO1ML2mzYMG1+vxDX101Xe+niD7xPm71q2
 /2Knak6OVcqCPAgtQGnfAyJH1fnKgDB/p8/JA+F2zXPYqMHl9LJXtJeyydO4gEmqZ6Hw
 uGcs9jG5gyteLEl3sR8rpIbZW7IVFfYMDDqwyxFh+eh7YCf8iUVx+HcQ53s+iNPQe2/7
 Myu5IWxxJt49C6d0xujwZ8rzfCgDYxUjryJmr6Cd3ViGmXdp0oL+fThVW2z9lnmI3CbI
 NSk59N1XhsTDnRKflk28Pca4LigYK2ua1Z6Qt/KN3tyGWKV9o2oq+11iSevg+Qz13h4o
 /Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUoyPqNKBI+zbdIKugNnM1LHEZPj+FEDOImWQ084pVc=;
 b=lIIZvNR0+psyMEglAxZ0BDBY6kKKd6JPADXdUot6B+ms1uyxGMpRRTfL/LoWAbMKUa
 XjaO03xv2gHtNm8sCpqdFWa5/glHe4/nr9HUmONEndgdwBivJL7kVHu+yss0k5jKTUbh
 xWFE5dbzdyQcRUn4mx4GqA2k2PjTdrbA6zIBH65/Zts3dSlIHjUk4K2m7oaM7Ai5iHRq
 JzjpyzLtQoHirsLaAaQQW0WD2Tlg0RShobp3JYzQkobvfoglap+epTmwmQJAQJcZac+z
 MRsPYF5vdhA4HXoRiDcFXqg43OdEcjVwG9SPj4Lb78Gyl7pOnexkXjVcAt7RDHKCPQR1
 3fJQ==
X-Gm-Message-State: AOAM532O5V4lmRDen3TEfM9KQ4K/8hJZp7qf1Tustz0MsnwgceJSycEM
 njyekXP7D/M92UYsh8Rp84Qbihl77NakE96UAYnWQA==
X-Google-Smtp-Source: ABdhPJzLYaE9C2OE2Ibxl0Ou0SlvBwyZJ1tpMJSdTQEYzUFdjxGbzWTlujCuOXxY13F6MQghXm66JWPLUscT7FJvaNA=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr43573093edv.204.1622725097699; 
 Thu, 03 Jun 2021 05:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210525225817.400336-1-richard.henderson@linaro.org>
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 13:57:45 +0100
Message-ID: <CAFEAcA_ghPyRbDkGhSonZWaMVFXt8Keapjr48WT0t=dzVz6qnQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] target/arm: Implement BFloat16
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 25 May 2021 at 23:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Whee!  All prerequisites are now merged.
>
> Patches missing r-b:
>
>   05-softfpu-Add-float_round_to_odd_inf.patch
>   06-target-arm-Implement-bfloat16-dot-product-vector.patch
>   07-target-arm-Implement-bfloat16-dot-product-indexed.patch
>   11-linux-user-aarch64-Enable-hwcap-bits-for-bfloat16.patch
>   12-target-arm-Enable-BFloat16-extensions.patch
>
> Per the question of whether additional checks vs VFP or NEON
> are required, I have disabled BF16 when either VFP or NEON are
> also disabled.  Which seems like a similarly reasonable choice.



Applied to target-arm.next, thanks.

-- PMM

