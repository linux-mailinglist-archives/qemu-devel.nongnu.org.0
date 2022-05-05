Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20151BBF7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:26:50 +0200 (CEST)
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXl3-0005vp-6B
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWpY-0003mX-52
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:27:24 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmWpU-0001mV-T0
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:27:23 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id j2so6459623ybu.0
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M+Y15q8eZi7pxqaAR7x4Ii7umLcQH5C2WqXr8VOuBc4=;
 b=KAySLnf+k0TclkwLpGrNS70p/se6G5fp1BxY6wa34qSMYHOAlSN4Q4xRn/XQWoIt04
 3SqeJqfoMpKZLzSdGT0dwnfGzXy7/7h1R+QWd36i2mveZST9/JQRqhn2vrqGwPkWPB4M
 EdmjHCQJBIopgqGcRlE3O9GFG8X6PA0bB5Uryt93xykLn4qOhdzXdjnQ6uOK5UUb/0uj
 Hj+APEHibON7H3AnRFtKHRY114kK3sfnJNXaRG0nUagSj8MlRALhfN/sTFgXFH6ezF59
 78CZqPfoTy4XP2vKiBozFCrEYCX+4KbSuf/UKTlR+aA+hsPw5tGAZfFFqftVL6EjmOnn
 Ly4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M+Y15q8eZi7pxqaAR7x4Ii7umLcQH5C2WqXr8VOuBc4=;
 b=CXJmIUCTa1qGrgg0rDXV1iN9IZ39i2l2dQ2dh/5zf9LJD5kAgbwoJlw+KENT6xEGW2
 u9GVigeWWQHiLftpTjidws1o8vxuDbh6kjm0fzY4ufO73fvVerqNxXHAL4PQOvS2fMe2
 wYdpOVxtef+sxLrOmTpnQGzbkF4pG9nNQCyfjixQ4khBC9FL04Ax8JhoViyUvcEzi+o/
 Xj2Q4PKf0rHj4OSCybs9fnuabDsEvXfA+3imhrcGq6uqif/h2Sogia8ZLW4UyGxjZGAm
 RtMJgVlulvuCNV5IKnv3LX8TtfuYC4VbxrUXQ8Et7I/oaPVIUhJHV9ycRgz/7Ms3kYin
 GLxw==
X-Gm-Message-State: AOAM533QXGq4eRlIUCNsL9G1uS2O5M60wmDA0IcPmwH6p99EpRHGOezf
 Cha4npuhaelpEoG60KiHPC5ZPGRLktXwuAOYgE6esw==
X-Google-Smtp-Source: ABdhPJx4wCP7BN7HePihErcDsM4RwRik1vmqfKaldBE6QPlBF4R6XEwsvIwcnA4EdGwpestIFRqkJyYF21KwRJASvDc=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr20068655yba.193.1651739239508; Thu, 05
 May 2022 01:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220505074841.406185-1-thuth@redhat.com>
In-Reply-To: <20220505074841.406185-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 09:27:08 +0100
Message-ID: <CAFEAcA81qUOC-nZMfN57_+j-bLrfqwyqjQjbUw8UK6ekZmx-hg@mail.gmail.com>
Subject: Re: [PATCH] docs/about: Update the support statement for Windows
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

Ccing Stefan Weil, since we're talking about clarifying what
our supported Windows host set is...

On Thu, 5 May 2022 at 08:54, Thomas Huth <thuth@redhat.com> wrote:
>
> Our support statement for Windows currently talks about "Vista / Server
> 2008" - which is related to the API of Windows, and this is not easy
> to understand for the non-technical users. It might also not be quite
> true anymore, since we only compile-test QEMU with recent toolchains.
>
> Thus I'm suggesting to change the support statement here to something
> similar that we use on Linux: Only support the very latest major release,
> with support for the previous major release being dropped after two years
> of overlap.
>
> And since we're nowadays also compile-testing QEMU with MSYS2 on Windows
> itself, I think we could also mention this build environment here.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/880
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/build-platforms.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index e9163ba556..a0ebc1acb4 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -86,11 +86,12 @@ similar versions.
>  Windows
>  -------
>
> -The project supports building with current versions of the MinGW toolchain,
> -hosted on Linux (Debian/Fedora).
> +The project aims to support the most recent major version of Windows. Support
> +for the previous major version will be dropped 2 years after the new major
> +version is released.
>
> -The version of the Windows API that's currently targeted is Vista / Server
> -2008.
> +The project supports building QEMU with current versions of the MinGW
> +toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
>
>  .. _Homebrew: https://brew.sh/
>  .. _MacPorts: https://www.macports.org/
> --
> 2.27.0

-- PMM

