Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622068C05D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:43:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2hW-00016H-L6; Mon, 06 Feb 2023 09:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2hJ-00015g-3G
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:42:26 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2hG-0002rs-2c
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:42:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id iy2so2181873plb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GZhtcm73xXtLyTCE+EdhmrWLHplC+k3EvzfhIdd/2Jg=;
 b=WuvEBVG4ZvjwsVHVJL8JVefrLfgigqGdrV+4RF+mbQchkSLV1gjcVW7EMQJ09YNGKe
 vON5xQDHBGBZyyMDMxbE7bBaqBByG0YtHnMAnXhIlaTpW2LW0toC48eorLahZ2NladLM
 VAEqfAfFoVdIfY9o8O5atLm4VB9Kce8/p3C+RM4ABqHXf0RcNQ04pbJ6FmbJwu3XIrVZ
 7ER030Gw4uo0FWw8gz1jPn4rjpO+PnmhvtJ1202QjUuM1dGtC38fzykSUZ6ShCXxvP9F
 MHa+Zkgsi5CP8j/lERTP00ey4usS/38yzO23qjEfu2vsRHBXAGZt+Q4yHEINkb/cfJtF
 TcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZhtcm73xXtLyTCE+EdhmrWLHplC+k3EvzfhIdd/2Jg=;
 b=1MfGMi3OvHIg+DpZlvmrv3kcb8/GGQIk7aXIqCyklsQc+czRbyvXBHObmKRIxCFWrk
 0REUqrepYIqBlC6SNEpeIoTwAPvVtvlEuXlGPmgWwSljFeAkfjgAihaDR/WH63PeU1fG
 zFuTRQZZBz+QTEuwnioJDrkhjON+CORY5Nx2k51pbEqE35amHrzYHdcDIwmKWLQMs5rb
 2E2JVDtaLKBHNNWdrPPRnH7b6fFS1DDERLjCXuV0ekKhM5FM6EW5tYg134j1eypQ4TBf
 j/7NQymSk9lwjAJXac7Dhv6lYpwzkEFB5DwdDzH5mLOCML+7VSZpLYjHTvtw82Qqkpmy
 Xevg==
X-Gm-Message-State: AO0yUKU0JO3ZwUE4wKs/0pYDhNA3heYodpxox9Yj+HBgUt3FvJjQ3DD3
 ntagBCKNBSTVVnR8GUnYUcI/x9g9JxY+HKKdtkcyfw==
X-Google-Smtp-Source: AK7set/L4i25UrBYOQIVerGwWYUaGlyolJIg8+G7bLK9YRg2mQOtOVBqo4r18cr0IKS/pZrfoZvO38af9qcd81aj8co=
X-Received: by 2002:a17:90a:313:b0:230:c24b:f22c with SMTP id
 19-20020a17090a031300b00230c24bf22cmr684258pje.53.1675694536427; Mon, 06 Feb
 2023 06:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20230205052636.11822-1-dinahbaum123@gmail.com>
In-Reply-To: <20230205052636.11822-1-dinahbaum123@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 14:42:05 +0000
Message-ID: <CAFEAcA_HJZwfZBQT_dQ0Fv+q63yQ3cwK1nShwHAKuR5m4y91jw@mail.gmail.com>
Subject: Re: [PATCH] configure: Add 'mkdir build' check
To: Dinah Baum <dinahbaum123@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 5 Feb 2023 at 07:44, Dinah Baum <dinahbaum123@gmail.com> wrote:
>
> QEMU configure script goes into an infinite error printing loop
> when in read only directory due to 'build' dir never being created.
>
> Checking if 'mkdir dir' succeeds and if the directory is
> writeable prevents this error.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
>
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>

Hi; thanks for sending this patch.

> ---
>  configure | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/configure b/configure
> index 64960c6000..fe9028991f 100755
> --- a/configure
> +++ b/configure
> @@ -32,9 +32,11 @@ then
>      fi
>
>      mkdir build
> -    touch $MARKER
> +    if [ -d build ] && [ -w build ]
> +    then
> +        touch $MARKER

It would be more straightforward to check whether
the 'mkdir' and 'touch' commands succeed, I think.

>
> -    cat > GNUmakefile <<'EOF'
> +        cat > GNUmakefile <<'EOF'
>  # This file is auto-generated by configure to support in-source tree
>  # 'make' command invocation
>
> @@ -56,8 +58,15 @@ force: ;
>  GNUmakefile: ;
>
>  EOF
> -    cd build
> -    exec "$source_path/configure" "$@"
> +        cd build
> +        exec "$source_path/configure" "$@"
> +    elif ! [ -d build ]
> +    then
> +        echo "ERROR: Unable to create ./build dir, try using a ../qemu/configure build"
> +    elif ! [ -w build ]
> +    then
> +        echo "ERROR: ./build dir not writeable, try using a ../qemu/configure build"
> +    fi

If these are errors, we should exit immediately, not
continue further trying to run code.

>  fi
>
>  # Temporary directory used for files created while
> @@ -181,9 +190,12 @@ compile_prog() {
>
>  # symbolically link $1 to $2.  Portable version of "ln -sf".
>  symlink() {
> -  rm -rf "$2"
> -  mkdir -p "$(dirname "$2")"
> -  ln -s "$1" "$2"
> +  if [ -d $source_path/build ] && [ -w $source_path/build ]
> +  then
> +      rm -rf "$2"
> +      mkdir -p "$(dirname "$2")"
> +      ln -s "$1" "$2"
> +  fi

The symlink function is a utility one used in various
places in the code. It may be used for other directories
than $source_path/build. If we need to better handle
errors here then we should do that by checking the
exit status of the commands (and probably passing the
return status back up for the caller to look at).

But there's a lot of code in configure that assumes it
can write to the destination directory elsewhere too,
so why change this function specifically ?

>  }
>
>  # check whether a command is available to this shell (may be either an
> @@ -2287,7 +2299,18 @@ fi
>  #######################################
>  # generate config-host.mak
>
> +if ! [ -d $source_path/build ] || ! [ -w $source_path/build ]

You can't assume that the build dir is always $source_path/build
-- that's just the default if the user ran configure from
the source directory.

> +then
> +    echo "ERROR: ./build dir unusable, exiting"
> +    # cleanup
> +    rm -f config.log
> +    rm -f Makefile.prereqs
> +    rm -r "$TMPDIR1"
> +    exit 1

Most of these haven't been created at this point, so don't
need to be deleted. (If you do the error-exit earlier,
as I suggest, then this is clearer.)

> +fi
> +
>  if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
> +    echo "BAD"
>      exit 1
>  fi

thanks
-- PMM

