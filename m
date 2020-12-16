Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDE2DBF29
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:03:06 +0100 (CET)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUaH-00032z-W5
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpUWq-0000tQ-T3
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:59:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpUWn-0000nl-9o
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:59:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q18so15224359wrn.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cTd/mOll46zxMP8ZrYGdOmk8KTejyNnlw2hVTulXCTw=;
 b=cZXt1HJyzMYHNiFPJrB0FlIycsRXels2ztP4VX0Xp7YIBYFrnDkxTg7JisVYKxCBxY
 q4tiod+r3jXZNq2xjK+ySaczUOtv6X5JYOV3GUkNBl47soyJJ75exEsUbMiv6vJXzTl4
 YeMstfYv5yv8vJ9wG/0uAGYO4yte2NGVTYVrQDi/6GANs9qaldLk7htAxQH2smdacv9o
 +G9g3kSLPF2UyrQKUlW9Rzv8oFi7HJnNMqnKa8DmtpLcsgI1RvzSgNYwYpsjGBSWjyvX
 m4YV6ylsMAUB2zLwlYEOcuUM50M9uleDrEHYCbKoptOldv6sZvFJbo7ehzVwZ1lbXme+
 rbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cTd/mOll46zxMP8ZrYGdOmk8KTejyNnlw2hVTulXCTw=;
 b=e39LhcQ9JjW2MTU5dt8pmoVP51thOC6UH1eMfagnTxAlBa2HVeTtkdrFD6TK6IWHHP
 /Kq8PGEO9yat8TG54YL+1kTDCqAtHfIXCSf3XQmiJj2wfF8gh5a4Oy52xi6opGsTzSaN
 fgWm15TfmdTzvCuRfMo2v0JmuPIG0zvpMHRHEoNIDVGjfYeDwKuGTNJtt9bGUOhCiCix
 0AUHsLYpPhEDyNU0b+t9PivNrBF7PESdwsRgKMmZaRCFeyGEyMxDPw6VSfz6F0ujM0YT
 1AoYuuCFZPnRcNSuUjtodcc4GogcS7nDkT36MoTtsyJ2wNbej/Yv/TIf0XzO9UVnNinV
 z6Lw==
X-Gm-Message-State: AOAM533hz5gvqVh0pXHy8daYBiYikjQjU/5m9ABM0EMgR1/eRyECZQqn
 eRZ11WXbZ3s9DaHUp34VrM7Ew1tO7cKJFg==
X-Google-Smtp-Source: ABdhPJwGVKoUpXLaPMK0hUfwmeZVBcBv1gwyclF0U+GjXWIOJ+R92WrAtZEnhhFEtP/5SZ0YtFQwRg==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr30773232wrt.287.1608116367958; 
 Wed, 16 Dec 2020 02:59:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c129sm2294693wma.31.2020.12.16.02.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 02:59:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A0511FF7E;
 Wed, 16 Dec 2020 10:59:25 +0000 (GMT)
References: <20201216013646.40799-1-gromero@linux.ibm.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gromero@linux.ibm.com>
Subject: Re: [PATCH] configure: Fail when specified cross compiler cannot be
 found
Date: Wed, 16 Dec 2020 10:51:06 +0000
In-reply-to: <20201216013646.40799-1-gromero@linux.ibm.com>
Message-ID: <87bleut3si.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: gustavo.romero@protonmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gustavo Romero <gromero@linux.ibm.com> writes:

> Currently if the cross compiler passed to 'configure' (--cross-cc-<arch>)=
 does
> not exist no error happens and only later when the TCG tests are run they=
 fail
> because the cross compiler is not set correctly.

Do they? They should just skip because of a non-existing compiler and a
failed fallback to using docker:

  ../../configure --disable-docs --target-list=3Daarch64-softmmu --cross-cc=
-aarch64=3Dnonexisting_gcc

and then cat ./tests/tcg/config-aarch64-softmmu.mak

  # Automatically generated by configure - do not modify
  TARGET_NAME=3Daarch64
  CONFIG_SOFTMMU=3Dy
  QEMU=3D/home/alex/lsrc/qemu.git/builds/bisect/qemu-system-aarch64
  CROSS_CC_GUEST_CFLAGS=3D
  DOCKER_IMAGE=3Ddebian-arm64-test-cross
  DOCKER_CROSS_CC_GUEST=3Daarch64-linux-gnu-gcc-10

So what do you see in your failing case?

>
> This commit changes that behavior and make 'configure' fail if the specif=
ied
> cross compiler cannot be found, displaying an error similar to the follow=
ing:
>
> $ ../configure --target-list=3Dppc64-softmmu --cross-cc-ppc64=3Dnonexisti=
ng_gcc
> Specified cross-compiler 'nonexisting_gcc' not found!
>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> ---
>  configure              | 2 +-
>  tests/tcg/configure.sh | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index cb21108d34..c0389f5839 100755
> --- a/configure
> +++ b/configure
> @@ -6854,7 +6854,7 @@ done
>    export $i
>  done
>  export target_list source_path use_containers
> -$source_path/tests/tcg/configure.sh)
> +$source_path/tests/tcg/configure.sh) || exit 1
>=20=20
>  # temporary config to build submodules
>  for rom in seabios; do
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index e1b70e25f2..6c89d75c38 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -212,8 +212,10 @@ for target in $target_list; do
>=20=20
>      eval "target_compiler=3D\${cross_cc_$i}"
>      if ! has $target_compiler; then
> -      continue
> +      echo "Specified cross-compiler '$target_compiler' not found!"
> +      exit 1
>      fi
> +
>      write_c_skeleton
>      if ! do_compiler "$target_compiler" $target_compiler_cflags -o $TMPE=
 $TMPC -static ; then
>        # For host systems we might get away with building without -static


--=20
Alex Benn=C3=A9e

