Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4654AFEBA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 21:50:45 +0100 (CET)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHtvH-0003ow-4I
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 15:50:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHtsh-0002eJ-HF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 15:48:03 -0500
Received: from [2a00:1450:4864:20::434] (port=44864
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHtsf-0003vZ-Ny
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 15:48:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id k18so6040583wrg.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 12:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=54GpJGtyR145B33wSc2aV8lkBniVUGl7MaAv9knKJaM=;
 b=ao6lXMFUyEuLaIQtE0Ex90m6Gchh76LuEuWnbYuJbE5d+s1t186JQWw8Vz0Dzdq7Vz
 EM28Ne0PtK7P6ZapukBL/sRH+Z5W399f61CYdH7MR2/7Ty+wZcJPd5VlB3Rg1EvSNJLk
 zg5hB0vBqm0upMCdkPZ/JnNFVYWIjH1aRpniHX3ioe+REF9wkRMkWmvo2rAKV2abVEhV
 58bSqXW29HhUHsXjn3awSnM0f6OkM6EbdIT15HuF1ilfFCFkSU9wd6T8cLpVCXRuM8km
 173qKylDiNSgQio54p8tFFT14FhG09WwU+orCyc1dyDhgQt1fAkS0t9AR5TKlVyR99ew
 Va8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54GpJGtyR145B33wSc2aV8lkBniVUGl7MaAv9knKJaM=;
 b=pJm41Ohhz3M2oBJPqIuDONcZJ52cYLkqOK8O+5YSBziGP3ct5Q9t6kXYWCJTFwkZK7
 9FOWB2exMxQY1iZXW3qgwoPn5Z44UxJfW1CKKwehglUSuB/988DLHnunhUlwm5U7U7i1
 AyFyxeWLn2Vpm1p8S5HPOPrw6atOgV8zdY42EPricYXcBWBP3FncZMGhk4uATeRJJs16
 C+D6NGKMDZTbiwUgHQEzqX6u5nJpDvEMOG0mJEjd8HqSrdW0/6MuaIA5Z/nY33yYRi3u
 mOAtxPloqFN2ENb2zbZOu5kjDSmEGaiBZjwwb3bcfjZn76GsMApIFJnYoFgaX+0UjFWE
 Amtg==
X-Gm-Message-State: AOAM533PT0M+qvEYSOBVo+uckbnQisBJWo/UA4aC5EIA19AjMLeztYKT
 NtR/BecEUzkymUngcscxcfxSW/WtGHqHDheGXO0sjQ==
X-Google-Smtp-Source: ABdhPJys4hx80fqH1mS7DQbfUpVsCUI7uoL6szNB28+Mzz9DyWFiInlv8vrvvYJJXXUVIDPLiVH9ps1mHorhiGfB67o=
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr3695039wrq.2.1644439680141;
 Wed, 09 Feb 2022 12:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20220209165040.56062-1-dgilbert@redhat.com>
In-Reply-To: <20220209165040.56062-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 20:47:49 +0000
Message-ID: <CAFEAcA-JwQDQWQcY7tNSOb5LS8FNBjFi-msTyxUyV_q=OymXaw@mail.gmail.com>
Subject: Re: [PATCH] Deprecate C virtiofsd
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: virtio-fs@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 16:57, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> There's a nice new Rust implementation out there; recommend people
> do new work on that.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 47a594a3b6..3a0e15f8f5 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -454,3 +454,17 @@ nanoMIPS ISA
>
>  The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
>  As it is hard to generate binaries for it, declare it deprecated.
> +
> +Tools
> +-----
> +
> +virtiofsd
> +'''''''''
> +
> +There is a new Rust implementation of ``virtiofs`` at

I guess there's a missing "d" here ?

> +``https://gitlab.com/virtio-fs/virtiofsd``;
> +since this is now marked stable, new development should be done on that
> +rather than the existing C version in the QEMU tree.
> +The C version will still accept fixes and patches that
> +are already in development for the moment.

thanks
-- PMM

