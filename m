Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E458535F574
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:54:29 +0200 (CEST)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfyP-0005mc-1V
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWfvS-0003b9-5v
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:51:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWfvP-00007B-OQ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:51:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id a4so19974673wrr.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=H3NBbA+Ad/ofpehVJWL26+9hlnHMHXca6heVgWIRMgY=;
 b=VeVM4H6bFIX2uK+fMvY6VvERmoNOs6cxuXaD+dsyY6MaYhOLkMzxzjNEmVN1om9hl2
 IwMcARRHGm5G8gWXyB7WLI2g7I26LBVXxVD9sknjHaMq7O3lkjDSraaLc2rpwPurhM0V
 CCoWZb9nG5HV+v9huQmIjiVM6e8MIqKcfDFwtMLj0EQU8GsBgIxVmyABkIxjAahq49hC
 iIzjNX1iyQ7elMEpM0unnkCzlLxaOnpZeAmYT4Uvftj9sc2w7hp9SQyBY1a0Qi0eorK4
 J3R1/iMyuU/pTC2y9Y6pVNH+nJr5ss62CoKQGLqL6uoam7Adqous7VWgyRdYjI37N1AE
 cZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=H3NBbA+Ad/ofpehVJWL26+9hlnHMHXca6heVgWIRMgY=;
 b=pHh6s3NF2cPt5ClrKg94vCH0eTQ5quv993Hu0av1gfKb+8Fi3Gymsi40yWBs8I3tlR
 HERP5Je3y8gdMMXk3hUvptwIcfswUzR2QBoS0R0HV7isIR0+cVqY9uypT9VAhO7Ltpnh
 5/pFgQVZsKe+jupHJBvbPPlEYGbBCKwr5JevuBYmwJ7ftOwxY0gGAwhlnyB7vQSdCG/c
 OPxkNwjjCqW1y4qTErDOk46v7lK4kh1wHmeNdrPB78g3kb6Yu0oLMmiZggUIBdE/7/kZ
 CoeZgh9bAHj2YtjHIwkipJ0TUr7+4hzDH2EB0dTUMLzzuop1HCqebXHqYbO+g5B+lo2e
 dHeg==
X-Gm-Message-State: AOAM532w+/dx4f4DOsff7fNXE/fDyS6lOiRDzWRHp/uy8/t/Yp8YQGlJ
 Bgb4hr5GDjo7bm6yY8DUiUH+fw==
X-Google-Smtp-Source: ABdhPJzmZaVvKtXqRdlkOe5MjcEsBeNx//uekuYArBWObOklWeymrzeGrXKk8Ht7NVYY0yWgdUuJnw==
X-Received: by 2002:a05:6000:504:: with SMTP id
 a4mr13162060wrf.51.1618408282122; 
 Wed, 14 Apr 2021 06:51:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a4sm2508382wmm.12.2021.04.14.06.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 06:51:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B01E81FF7E;
 Wed, 14 Apr 2021 14:51:20 +0100 (BST)
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
 <20210305170045.869437-2-kbastian@mail.uni-paderborn.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: Re: [PATCH v3 01/15] tests/tcg: Add docker_as and docker_ld cmds
Date: Wed, 14 Apr 2021 14:40:15 +0100
In-reply-to: <20210305170045.869437-2-kbastian@mail.uni-paderborn.de>
Message-ID: <87tuo9km93.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bastian Koppelmann <kbastian@mail.uni-paderborn.de> writes:

> At least for the TriCore target no easily available c compiler exists.
> Thus we need to rely on "as" and "ld". This allows us to run them
> through the docker image as well as with locally installed tools.
>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
> v2 -> v3:
>     - emit CROSS_LD_GUEST/CROSS_AS_GUEST
>
>  tests/tcg/Makefile.qemu | 15 +++++++++++++++
>  tests/tcg/configure.sh  | 20 ++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
> index a56564660c..fefb50903d 100644
> --- a/tests/tcg/Makefile.qemu
> +++ b/tests/tcg/Makefile.qemu
> @@ -22,6 +22,8 @@ quiet-@ =3D $(if $(V),,@)
>  quiet-command =3D $(quiet-@)$(call quiet-command-run,$1,$2,$3)
>=20=20
>  CROSS_CC_GUEST:=3D
> +CROSS_AS_GUEST:=3D
> +CROSS_LD_GUEST:=3D
>  DOCKER_IMAGE:=3D
>=20=20
>  -include tests/tcg/config-$(TARGET).mak
> @@ -42,6 +44,7 @@ cross-build-guest-tests:
>  	$(call quiet-command, \
>  	   (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
>  	    $(MAKE) -f $(TCG_MAKE) TARGET=3D"$(TARGET)" CC=3D"$(CROSS_CC_GUEST)=
" \
> +			AS=3D"$(CROSS_AS_GUEST) LD=3D"$(CROSS_LD_GUEST)" \
>  			SRC_PATH=3D"$(SRC_PATH)" BUILD_STATIC=3D$(CROSS_CC_GUEST_STATIC) \
>  			EXTRA_CFLAGS=3D"$(CROSS_CC_GUEST_CFLAGS)"), \
>  	"BUILD","$(TARGET) guest-tests with $(CROSS_CC_GUEST)")
> @@ -59,11 +62,23 @@ DOCKER_COMPILE_CMD=3D"$(DOCKER_SCRIPT) cc \
>  		-i qemu/$(DOCKER_IMAGE) \
>  		-s $(SRC_PATH) -- "
>=20=20
> +DOCKER_AS_CMD=3D"$(DOCKER_SCRIPT) cc \
> +		--cc $(DOCKER_CROSS_AS_GUEST) \
> +		-i qemu/$(DOCKER_IMAGE) \
> +		-s $(SRC_PATH) -- "
> +
> +DOCKER_LD_CMD=3D"$(DOCKER_SCRIPT) cc \
> +		--cc $(DOCKER_CROSS_LD_GUEST) \
> +		-i qemu/$(DOCKER_IMAGE) \
> +		-s $(SRC_PATH) -- "
> +
> +
>  .PHONY: docker-build-guest-tests
>  docker-build-guest-tests: docker-image-$(DOCKER_IMAGE)
>  	$(call quiet-command, \
>  	  (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
>  	   $(MAKE) -f $(TCG_MAKE) TARGET=3D"$(TARGET)" CC=3D$(DOCKER_COMPILE_CM=
D) \
> +			AS=3D$(DOCKER_AS_CMD) LD=3D$(DOCKER_LD_CMD) \
>  			SRC_PATH=3D"$(SRC_PATH)" BUILD_STATIC=3Dy \
>  			EXTRA_CFLAGS=3D"$(CROSS_CC_GUEST_CFLAGS)"), \
>  	"BUILD","$(TARGET) guest-tests with docker qemu/$(DOCKER_IMAGE)")
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 36b8a73a54..4da8c3fa12 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -72,6 +72,12 @@ fi
>  : ${cross_cc_x86_64=3D"x86_64-pc-linux-gnu-gcc"}
>  : ${cross_cc_cflags_x86_64=3D"-m64"}
>=20=20
> +# cross as defaults, can be overridden with --cross-as-ARCH
> +: ${cross_as_tricore=3D"tricore-as"}
> +
> +# cross ld defaults, can be overridden with --cross-ld-ARCH
> +: ${cross_as_tricore=3D"tricore-ld"}
> +

These explicit defaults should be in a separate patch.

>  for target in $target_list; do
>    arch=3D${target%%-*}
>    case $arch in
> @@ -228,6 +234,18 @@ for target in $target_list; do
>      fi
>      echo "CROSS_CC_GUEST=3D$target_compiler" >> $config_target_mak
>=20=20
> +    eval "target_as=3D\${cross_as_$i}"
> +    if has $target_as; then
> +      echo "CROSS_AS_GUEST=3D$target_as" >> $config_target_mak
> +      continue
> +    fi

Should there be any attempt to verify the assembler will do something.
If you passed --cross-as-tricore=3D/bin/false to force the use of the
docker container it wouldn't work because we assume if it's there it
works.

> +
> +    eval "target_ld=3D\${cross_ld_$i}"
> +    if has $target_ld; then
> +      echo "CROSS_LD_GUEST=3D$target_ld" >> $config_target_mak
> +      continue
> +    fi
> +
>      # Test for compiler features for optional tests. We only do this
>      # for cross compilers because ensuring the docker containers based
>      # compilers is a requirememt for adding a new test that needs a
> @@ -261,5 +279,7 @@ for target in $target_list; do
>    if test $got_cross_cc =3D no && test "$container" !=3D no && test -n "=
$container_image"; then
>      echo "DOCKER_IMAGE=3D$container_image" >> $config_target_mak
>      echo "DOCKER_CROSS_CC_GUEST=3D$container_cross_cc" >> $config_target=
_mak
> +    echo "DOCKER_CROSS_AS_GUEST=3D$container_cross_as" >> $config_target=
_mak
> +    echo "DOCKER_CROSS_LD_GUEST=3D$container_cross_ld" >>
> $config_target_mak

Could we gate these on being defined please?

>    fi
>  done


--=20
Alex Benn=C3=A9e

