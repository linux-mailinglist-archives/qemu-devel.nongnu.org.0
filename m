Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39884A64B9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:13:29 +0100 (CET)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyam-0007Zw-Mz
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:13:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEw4h-0000kZ-0Y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:32:11 -0500
Received: from [2a00:1450:4864:20::42d] (port=41629
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEw4f-0008Qu-3Y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:32:10 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h21so33124763wrb.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sPCTwDmCGYseCgCw0KwQ00IJbYFdUJCkGP5BSmHT8gc=;
 b=XAaXjg9Nx2aOp/bCKtFWN962N8Ct9+jZt3hxNFEVKKxLUhRH2LPhkyXgCLBEgzMou4
 yoll1KhCaf4rVlgQR+MgeuW9h9wZoQ65PBZvZgsU9sIYT8FluBMuAdeVn3IDhlANtILT
 txk4wSJOMYtAGu6VggWB7LvP5AK5t/Fd/kbvJlC5XXcdWwjMYHcXTLuRmD+FPQFsafrq
 2Vl6onVUXQawO9gUALI5YM/9TJoqMREifoiCTjb+VUAkd2flI/0TY1d7FFL+cut6SirP
 9orN0yrp5gNmQNdoaIjMZJufikWUY6idNnj2weOYWtXnr7aOHPjsjykhsvfYgRNuq+Ze
 po1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sPCTwDmCGYseCgCw0KwQ00IJbYFdUJCkGP5BSmHT8gc=;
 b=raCmYzsBPTL1g+vdYxNkYyu20o31NN+M6GBqmECai/Wu//FzJ7fKIpfhbTYsRZIcqv
 nEWtR+UWj4OHsIFXZpGnO5CvLRoHq4IMioxL00lUbH9KujJ/B+LOxT/1SFhZCdnvqK2c
 MbXjTm3c9QvPvgvtjs1FVf3GsagXy0qz8/PksJkhH9TVIu+PoKX7IXRVQqTAcjGHkMPd
 IduQTKluhhgk+L+OlUC7sIVZ9VZn76ZXGxtwNKHuNo1ZJqJDKcwEmGyjI/drwFm5wgNp
 SAcqSyeKJ+5T5ZRoAvo6wFXyQI23KNZcj2H3c0ZSYq0HkYY+t//Xdm9TTW4usiwH+SbM
 DPPQ==
X-Gm-Message-State: AOAM531b+kUhIjrzYG/BMsy6zLdulZlChru10poE+Zblc+Jr5iuv84mm
 s5DvlvmV1jYP0bqrZfA13FA5fVB33NGT+A8b6au+cQ==
X-Google-Smtp-Source: ABdhPJy2DKoNSO3sXE5qtnQot8+8KE7jVotfOQd5JVz966+4DfNENntr1267O9dZBrNUkQsV0+t57RZwAYN6nSPeJT0=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr1169284wrq.172.1643733127381; 
 Tue, 01 Feb 2022 08:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20220131195636.31991-1-imp@bsdimp.com>
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Feb 2022 16:31:56 +0000
Message-ID: <CAFEAcA9Fdn55E8qbzVb_SMLrwvuqsexXXGZA8A7D2qEcho07NA@mail.gmail.com>
Subject: Re: [PULL 00/40] Bsd user arm 2022q1 patches
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, def@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 jrtc27@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 19:56, Warner Losh <imp@bsdimp.com> wrote:
>
> The following changes since commit 7a1043cef91739ff4b59812d30f1ed2850d3d34e:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2022-01-28 14:04:01 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:bsdimp/qemu.git tags/bsd-user-arm-2022q1-pull-request
>
> for you to fetch changes up to 1103d59caaa82c94b4223a5429c31895d2f05217:
>
>   bsd-user/freebsd/target_os_ucontext.h: Prefer env as arg name for CPUArchState args (2022-01-30 17:13:50 -0700)
>
> ----------------------------------------------------------------
> bsd-user: upstream signal implementation
>
> Upstream the bsd-user fork signal implementation, for the most part.  This
> series of commits represents nearly all of the infrastructure that surround
> signals, except the actual system call glue (that was also reworked in the
> fork and needs its own series). In addition, this adds the sigsegv and sigbus
> code to arm. Even in the fork, we don't have good x86 signal implementation,
> so there's little to upstream for that at the moment.
>
> bsd-user's signal implementation is similar to linux-user's. The full context
> can be found in the bsd-user's fork's 'blitz branch' at
> https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz which shows how these
> are used to implement various system calls. Since this was built from
> linux-user's stack stuff, evolved for BSD with the passage of a few years, it
> no-doubt missed some bug fixes from linux-user (though nothing obvious stood out
> in the quick comparison I made). After the first round of reviews, many of these
> improvements have been incorporated.
>
> Patchew history: https://patchew.org/QEMU/20220125012947.14974-1-imp@bsdimp.com/
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

