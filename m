Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CB02FB691
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:02:28 +0100 (CET)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1raV-0000P7-QJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rXI-0007N1-QI
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:59:09 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rXE-0006UA-LZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:59:08 -0500
Received: by mail-ej1-x634.google.com with SMTP id r12so17252739ejb.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5SuDYjCdGjAKfsaDHAQ8qZzC/7ZjU6lDwp7u0pgrRA=;
 b=lOFXSlyeiKpY/o5/GSrR1SFynHngPoCTKo1FHoIMq5mVR9rReXiXkBp9128AGnY+ia
 zVxpuolCK5kIItOGrnOfgJv2JF5Ct6XzYy8e71foQwlrANx64P4VzBsH5k/1lr1kraOu
 75ktl+8yA3mneUvbN7bCz23GavIKhL05cZcT36IwjsvauyaBjrf8+dgNx2hCZflGsPGP
 2DAYeqcetkNivo5JtwtMp0VwKijK1SMOpwUiY8MBsESj0WWbzz1XHkc7V9Z5cpmz0q5y
 vG3XaWdr7X+yB5sWo1vSpf/yvLHSF5uVKsatvzi59QJWgj4XGRzxKtQFWvJ4rdE/rk3D
 m0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5SuDYjCdGjAKfsaDHAQ8qZzC/7ZjU6lDwp7u0pgrRA=;
 b=CW8mqg4Ej3jQev+NsQfwFMFAQMM1lKgtGcEQizUQdsVptlPP2FtJ+qxmPLQzA3E03c
 4yTnFsXlMaBc5y81PJJGt+bmtLa1iSYvVKFOS9CEvA9BrHzWEOn0Hnug/ttvq+RAuecv
 yznQ3LOtTv/o+oY6S+DcXsi6AY64GE5TsqgW+NiA+sQPkM11YxHHNihuxjoJMRk43tTC
 7LiuCnn1XKlLKHJ28nkPp79CHnx+jYsdgqBCVetcH0YK/jDQkvi3bpfINeiJGRcn1Atl
 wZy5fyzKGBB/uk8QSYiBpS7IQF6juyGeD3ga9gCfDhFXnTOHKJYJFOa4qYS/fGxXGfBn
 rnIA==
X-Gm-Message-State: AOAM532RU9TGnQyGC9475FYg0k+8Lwj4ko7F2KCMBYJnYvJoJ6L9orA9
 viuy4JXmJk1MNTG7MX+37lwIJER9fggXcB6NwGn8bfRFMZs=
X-Google-Smtp-Source: ABdhPJzGWKNFnhysyOaRQidykAZmZTQGTxLxXYdSNshQQFi5APgQcCN6rfdRZhVWzpvSm41w63J7ibEb4/DEeG4DUR4=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr2981346ejz.407.1611064743126; 
 Tue, 19 Jan 2021 05:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20201122000131.18487-1-peter.maydell@linaro.org>
In-Reply-To: <20201122000131.18487-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:58:52 +0000
Message-ID: <CAFEAcA8ZWZUwqstAcg3tw8fAr+SDVXr-puPby_VU9eh4zgBq2w@mail.gmail.com>
Subject: Re: [PATCH] docs/user: Remove outdated 'Quick Start' section
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping? Laurent, what's your take on this docs patch?

thanks
-- PMM

On Sun, 22 Nov 2020 at 00:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The 'Quick Start' section of the userspace emulator documentation is
> very old and outdated. In particular:
>  - it suggests running x86-on-x86 emulation, which is the least
>    interesting possible use case
>  - it recommends that users download tarballs of guest binaries
>    from the QEMU web page which we no longer provide there
>
> There's nothing salvageable here; delete it all.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm open to suggestions that this is being too drastic;
> the main aim here is to remove references to tar.gz files
> that we haven't provided for years, as noted by
>  https://bugs.launchpad.net/qemu/+bug/1884982
> Ideally the whole of docs/user could use a lot of love...
>
>  docs/user/main.rst | 61 ----------------------------------------------
>  1 file changed, 61 deletions(-)
>
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> index bd99b0fdbe9..49ccae3ecab 100644
> --- a/docs/user/main.rst
> +++ b/docs/user/main.rst
> @@ -45,67 +45,6 @@ emulator.
>  Linux User space emulator
>  -------------------------
>
> -Quick Start
> -~~~~~~~~~~~
> -
> -In order to launch a Linux process, QEMU needs the process executable
> -itself and all the target (x86) dynamic libraries used by it.
> -
> --  On x86, you can just try to launch any process by using the native
> -   libraries::
> -
> -      qemu-i386 -L / /bin/ls
> -
> -   ``-L /`` tells that the x86 dynamic linker must be searched with a
> -   ``/`` prefix.
> -
> --  Since QEMU is also a linux process, you can launch QEMU with QEMU
> -   (NOTE: you can only do that if you compiled QEMU from the sources)::
> -
> -      qemu-i386 -L / qemu-i386 -L / /bin/ls
> -
> --  On non x86 CPUs, you need first to download at least an x86 glibc
> -   (``qemu-runtime-i386-XXX-.tar.gz`` on the QEMU web page). Ensure that
> -   ``LD_LIBRARY_PATH`` is not set::
> -
> -      unset LD_LIBRARY_PATH
> -
> -   Then you can launch the precompiled ``ls`` x86 executable::
> -
> -      qemu-i386 tests/i386/ls
> -
> -   You can look at ``scripts/qemu-binfmt-conf.sh`` so that QEMU is
> -   automatically launched by the Linux kernel when you try to launch x86
> -   executables. It requires the ``binfmt_misc`` module in the Linux
> -   kernel.
> -
> --  The x86 version of QEMU is also included. You can try weird things
> -   such as::
> -
> -      qemu-i386 /usr/local/qemu-i386/bin/qemu-i386 \
> -                /usr/local/qemu-i386/bin/ls-i386
> -
> -Wine launch
> -~~~~~~~~~~~
> -
> --  Ensure that you have a working QEMU with the x86 glibc distribution
> -   (see previous section). In order to verify it, you must be able to
> -   do::
> -
> -      qemu-i386 /usr/local/qemu-i386/bin/ls-i386
> -
> --  Download the binary x86 Wine install (``qemu-XXX-i386-wine.tar.gz``
> -   on the QEMU web page).
> -
> --  Configure Wine on your account. Look at the provided script
> -   ``/usr/local/qemu-i386/bin/wine-conf.sh``. Your previous
> -   ``${HOME}/.wine`` directory is saved to ``${HOME}/.wine.org``.
> -
> --  Then you can try the example ``putty.exe``::
> -
> -      qemu-i386 /usr/local/qemu-i386/wine/bin/wine \
> -                /usr/local/qemu-i386/wine/c/Program\ Files/putty.exe
> -
>  Command line options
>  ~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.20.1

