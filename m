Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9E84C16
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 14:52:43 +0200 (CEST)
Received: from localhost ([::1]:40733 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvLQp-0006ng-2I
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 08:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50001)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hvLPU-0004cG-H2
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 08:51:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hvLPT-0007rp-1M
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 08:51:20 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39942)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hvLPS-0007qj-PE
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 08:51:18 -0400
Received: by mail-wm1-x342.google.com with SMTP id v19so79923435wmj.5
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=yiJn4Oq0suMZvK/DdKaxh+JnBlGPVM2CYzG7YsuW46E=;
 b=tI/Km8X24D3C/uxjJ78/csq9XSi+wE3Z9MfEv2mwxAuwOtJp8bhdWykd1n+XrtbY/m
 6ecdafCWL0gY8D6lo48H+8+h+v6FjU5EPzUs4tvLs3g61HcEtyhNGOfW8YJP2Ks/qZLp
 FQjT9RngBxNquzOUrVcRdj9jQTbW5/dOvlt/vi4zr/0r2QbpqiqlNoZkYO//l8HYMTvs
 PHZf6amXsswPLQR4PzVPYVg5tIiMg/0NImsPBXnTcrlbG4eTfgKeiXWwRW+0yYe42zeL
 Wdckq2Dwt9sRSJx6t6WyjEnipk6+6OL5h/wCJtoAKrkRLS3V73nzA/o0SJDXCV7611lg
 B1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=yiJn4Oq0suMZvK/DdKaxh+JnBlGPVM2CYzG7YsuW46E=;
 b=nGvt3ZwZrHZ/6xt1zemBVv1Q3mxkfTvBVV6i2RZKwW+AeuOhCrQ4Wkax6F7sDTOZaZ
 fiVzdKHUohp+IsuveR6xUcb1vp/PXtiufakzYQFzMsHBqKTDXH7UmkwPsUK62wQkzsuG
 KV0zvYc11AqBQsrpfvarMlfw1Sieik4IRsEvRigQHUBz1Y1heVHN3yAhiGzs4asU3/QF
 KCpOrfSBtCri4i5+YWX8fLRiJL/oL+si+JAxkvzH0jbPdZXHboNUTgHcZGBa5xClXdBS
 5jx3/w/1F1d7kqup1+erKzgoQsrZJEHaLD8RExj5Jqnfw7UcHxoklSVqQh2d2NUSqoG1
 3jYA==
X-Gm-Message-State: APjAAAV1/bjlMSaJ9ZEN2I4+zLWEfWoRrNOQ4BkA4M8zX7LmDchr9rFi
 EJjSanpMGAT4hn9hncfsHWmDVF9N+k8=
X-Google-Smtp-Source: APXvYqyo7DriqcF8CiyxNvErMST1njKH9C7AHIkWWiXoGVdqe1/c8uKPB7ztAjRx19yMznlBu1bK0w==
X-Received: by 2002:a1c:618b:: with SMTP id v133mr4681872wmb.47.1565182276638; 
 Wed, 07 Aug 2019 05:51:16 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id h16sm106310245wrv.88.2019.08.07.05.51.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 05:51:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC26B1FF87;
 Wed,  7 Aug 2019 13:51:15 +0100 (BST)
References: <20190730123759.21723-1-pbonzini@redhat.com>
 <20190730123759.21723-2-pbonzini@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
In-reply-to: <20190730123759.21723-2-pbonzini@redhat.com>
Date: Wed, 07 Aug 2019 13:51:15 +0100
Message-ID: <87o911i1fg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 1/3] tests/tcg: use EXTRA_CFLAGS everywhere
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> For i386 specifically, this allows using the host GCC
> to compile the i386 tests.  But, it should really be
> done for all targets, unless we want to pass $(EXTRA_CFLAGS)
> directly as part of $(CC).

Hmm well for softmmu the tests take the decision:

  # For softmmu targets we include a different Makefile fragement as the
  # build options for bare programs are usually pretty different. They
  # are expected to provide their own build recipes.

So we are not expecting to handle multi-classing the system compiler to
generate different binaries with a common build string. To be honest I
wonder if we should just drop the EXTRA_CFLAGS shenanigans in favour of
an explicit compiler per target?

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target | 4 ++--
>  tests/tcg/alpha/Makefile.softmmu-target   | 4 ++--
>  tests/tcg/arm/Makefile.softmmu-target     | 2 +-
>  tests/tcg/i386/Makefile.softmmu-target    | 4 ++--
>  tests/tcg/minilib/Makefile.target         | 2 +-
>  tests/tcg/xtensa/Makefile.softmmu-target  | 4 ++--
>  6 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch6=
4/Makefile.softmmu-target
> index 2e560e4..4c4aaf6 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -22,11 +22,11 @@ LDFLAGS+=3D-static -nostdlib $(CRT_OBJS) $(MINILIB_OB=
JS) -lgcc
>  .PRECIOUS: $(CRT_OBJS)
>
>  %.o: $(CRT_PATH)/%.S
> -	$(CC) $(CFLAGS) -x assembler-with-cpp -c $< -o $@
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
>
>  # Build and link the tests
>  %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
> -	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>
>  memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D1
>
> diff --git a/tests/tcg/alpha/Makefile.softmmu-target b/tests/tcg/alpha/Ma=
kefile.softmmu-target
> index 3c0f34c..09193a6 100644
> --- a/tests/tcg/alpha/Makefile.softmmu-target
> +++ b/tests/tcg/alpha/Makefile.softmmu-target
> @@ -22,11 +22,11 @@ LDFLAGS+=3D-static -nostdlib $(CRT_OBJS) $(MINILIB_OB=
JS) -lgcc
>  .PRECIOUS: $(CRT_OBJS)
>
>  %.o: $(CRT_PATH)/%.S
> -	$(CC) $(CFLAGS) -x assembler-with-cpp -c $< -o $@
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
>
>  # Build and link the tests
>  %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
> -	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>
>  memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D0
>
> diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefi=
le.softmmu-target
> index 49d48d8..2deb06e 100644
> --- a/tests/tcg/arm/Makefile.softmmu-target
> +++ b/tests/tcg/arm/Makefile.softmmu-target
> @@ -18,7 +18,7 @@ CFLAGS+=3D-Wl,--build-id=3Dnone -x assembler-with-cpp
>  LDFLAGS+=3D-nostdlib -N -static
>
>  %: %.S %.ld
> -	$(CC) $(CFLAGS) $(ASFLAGS) $< -o $@ $(LDFLAGS) -T $(ARM_SRC)/$@.ld
> +	$(CC) $(CFLAGS) $(ASFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) -T $(ARM=
_SRC)/$@.ld
>
>  # Specific Test Rules
>
> diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Make=
file.softmmu-target
> index 0a43648..cee3420 100644
> --- a/tests/tcg/i386/Makefile.softmmu-target
> +++ b/tests/tcg/i386/Makefile.softmmu-target
> @@ -32,11 +32,11 @@ TESTS+=3D$(MULTIARCH_TESTS)
>  .PRECIOUS: $(CRT_OBJS)
>
>  %.o: $(CRT_PATH)/%.S
> -	$(CC) $(CFLAGS) -c $< -o $@
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
>
>  # Build and link the tests
>  %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
> -	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>
>  memory: CFLAGS+=3D-DCHECK_UNALIGNED=3D1
>
> diff --git a/tests/tcg/minilib/Makefile.target b/tests/tcg/minilib/Makefi=
le.target
> index 3ed8077..c821d28 100644
> --- a/tests/tcg/minilib/Makefile.target
> +++ b/tests/tcg/minilib/Makefile.target
> @@ -18,4 +18,4 @@ MINILIB_INC=3D-isystem $(SYSTEM_MINILIB_SRC)
>  .PRECIOUS: $(MINILIB_OBJS)
>
>  %.o: $(SYSTEM_MINILIB_SRC)/%.c
> -	$(CC) $(CFLAGS) -c $< -o $@
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
> diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/=
Makefile.softmmu-target
> index 8212d96..9530cac 100644
> --- a/tests/tcg/xtensa/Makefile.softmmu-target
> +++ b/tests/tcg/xtensa/Makefile.softmmu-target
> @@ -34,9 +34,9 @@ $(XTENSA_USABLE_TESTS): linker.ld macros.inc $(CRT) Mak=
efile.softmmu-target
>
>  # special rule for common blobs
>  %.o: %.S
> -	$(CC) $(XTENSA_INC) $($*_ASFLAGS) $(ASFLAGS) -c $< -o $@
> +	$(CC) $(XTENSA_INC) $($*_ASFLAGS) $(ASFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
>
>  %: %.S
> -	$(CC) $(XTENSA_INC) $(ASFLAGS) $< -o $@ $(LDFLAGS) $(NOSTDFLAGS) $(CRT)
> +	$(CC) $(XTENSA_INC) $(ASFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) $(NO=
STDFLAGS) $(CRT)
>
>  endif


--
Alex Benn=C3=A9e

