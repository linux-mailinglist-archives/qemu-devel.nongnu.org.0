Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3431F0DD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:17:35 +0100 (CET)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpjx-0004to-8t
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCpUz-000143-73
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:02:05 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCpUw-000295-Pr
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:02:04 -0500
Received: by mail-ej1-x635.google.com with SMTP id lu16so7669287ejb.9
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6FKIyB8068PPf5X5gYfFqwSCM8jTxi8UQAmHJLCkGcc=;
 b=LiVGOYM1s7rJlGOwPh+ZMvAZd5xHzP0U369nyXo2tSbGz7cneYWD7GcvQpi2UYNV08
 orJ6SUk2ojiTnKjH62cvh63soc42mExZoiiILw5G0QHE/zb2iP6HcSmUCdOVcHzNykcP
 QYLdKhlfFIm2ECLo/pYxkGS8FmDP1wOMldYe+6c/goAinizoF16hukWnYnV/4PFRuWnN
 wofkITtn91fdOYentEFPgE0YSMAB7kUJWypK4e9ryZmi0ECGkQeD8OLxhy/wCj1h1/lW
 pSF1B5bPt7i8xKf3Wqd9N+XxEpTjs9OcYqMgoexK0PTFSKh9HUYjWqmHZaWp9JrVT/32
 +LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6FKIyB8068PPf5X5gYfFqwSCM8jTxi8UQAmHJLCkGcc=;
 b=WUp32ybs+fKFaSPXO9Uuym6TNHDcnWeIG540lUMGb2MY2+nN9xpMTLglyBsC9guH+D
 I9FlWZyA1rX9XmYYQKflF9L6oyInOVK+Pxcjdb7XI/IuoiTweBN+RK/7N++RMipJFYrA
 BxNBadsBPuIxy6XPZAoJJnMD5CKqaqze7XYbYoV9cq+Dp170wUSrKUQ1H01unT/Vkiax
 X3/xkFeekWw/UaoRsjZ/Vw0Y16tbdJDBkGtDNlycewqoT54MmiF9y688qzMV3TfnpBEb
 bOSH3ZTe3yXRB3OQv92WlABQmkDR3AoqqOWs6ejJaPkv2u2Is7YUpSRbwGQMNdYnVxNP
 nsDQ==
X-Gm-Message-State: AOAM5300/yOGj0k7zg/NcuxHyGpxewlfA9XpwL7c9fIePMsMKXH4LD9Q
 pkRpBVwOYuo16hZLppxiXuRwyFt63nTRoCq5DntQLA==
X-Google-Smtp-Source: ABdhPJwou43/ggWhrSunFXY1X6psAW6P78P+hVvK7p09VEjLsqfBE4da4Q/P6CrDUsUyo3762fYbtgG3E1CHSI3OGZ4=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr5648099ejd.4.1613678520827; 
 Thu, 18 Feb 2021 12:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20210218162944.1756160-1-richard.henderson@linaro.org>
In-Reply-To: <20210218162944.1756160-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2021 20:01:49 +0000
Message-ID: <CAFEAcA8UKp69EcDnKv6LegL7pHzewwZYnCvK3O6AcFz_NcdkuQ@mail.gmail.com>
Subject: Re: [PULL v2 00/35] hexagon initial commit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 at 16:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> V2: Patch 35: do not re-find the python executable to use.
>
> r~
>
>
> The following changes since commit 91416a4254015e1e3f602f2b241b9ddb7879c10b:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-plugin-updates-180221-1' into staging (2021-02-18 13:27:03 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210218
>
> for you to fetch changes up to 3e7a84eeccc3b3a9b43c6dfb52bd98ea5acebf0a:
>
>   Hexagon build infrastructure (2021-02-18 08:25:06 -0800)
>
> ----------------------------------------------------------------
> Initial commit for the Qualcomm Hexagon processor.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

