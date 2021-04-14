Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1335F6EE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 16:59:25 +0200 (CEST)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWgzD-0000D6-JT
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 10:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWgyR-0008DZ-4z
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:58:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWgyP-0004fN-9u
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:58:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x7so20172048wrw.10
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=o5BtT3E7QJnohbLnGvvbRgrJF8hWpdSmdFQ0G3gTWQQ=;
 b=wrDc3c34Nxc/7xHr58Q0KjyVAsxJ8FpNH7vNccM7iUuMFoMiu4a1rihre4wQKUEfQo
 E2iiGazMs9G/2tszz0VkOVxHQA1YkRyCEIkVbbJmIGeay9zeIncBiGh95a2OpujG3Gkl
 dDoitn7DHlSMOi1YO3BnSvDEx6rMmC469KDdXQfPta9D0ZX0s9uHK32rm+OmC8a6E9yg
 m6JxpaF0J+ax0JcsIUsVThlddfG2Uxmul3xbObR3/0Fo0+jggbH+twor6eWeQYmWOjxm
 tAB8cNcJtRD/B3853Ek1vUxst9D1C2tglTVkkykW5gzKQLW9xYMiesfbReSCwH89Ftzs
 KIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=o5BtT3E7QJnohbLnGvvbRgrJF8hWpdSmdFQ0G3gTWQQ=;
 b=qnOVklPTk7MDsE/JTu4jHTDUrkVrC5rOgFHJRMPHLCG2+MusfYcXcZI8lF25hSB+Cg
 AWpTTllclng3HbqETh1M0rW1S9DwrKM47LqoE+iRDkBvUMbWSCEiUAyd2TEH5/jQ7+MI
 iIkqROMGIzP/PGa3s5owIUHPTi3KhAYBCcdtgBbaSz4Qo6ka/8+OwcoX7t4uRlQWq/tR
 mkryC+lFaJx5xxtfoWtpT0bOvrOp9ZbYn5D2vmgHZW5+IeDrGVNhZtx4ZXnGfxOzcgJP
 XbMBWwkFvWQH4FVEBtW9I29s7/uw1xx3XgidupC7dF6wz9YUwZ3G2ibHscOJdCI2FWyX
 6AkA==
X-Gm-Message-State: AOAM5303OZWpZ0lxorCLG4t4EIBlLhpPp/KQHanyWHKTue6nu61SEIPj
 lbioA37TqFrhoB+nzfOJfRxfng==
X-Google-Smtp-Source: ABdhPJyTXQpKhc54gwqXz3mCbmeesuC+bkVxlUJneztWYsPIv20QZxldiH4Uj81iWQpOi55V2EFoLA==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr42604048wri.403.1618412311409; 
 Wed, 14 Apr 2021 07:58:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g17sm3230350wrs.83.2021.04.14.07.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 07:58:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC6321FF7E;
 Wed, 14 Apr 2021 15:58:29 +0100 (BST)
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
 <20210305170045.869437-2-kbastian@mail.uni-paderborn.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: Re: [PATCH v3 01/15] tests/tcg: Add docker_as and docker_ld cmds
Date: Wed, 14 Apr 2021 15:58:13 +0100
In-reply-to: <20210305170045.869437-2-kbastian@mail.uni-paderborn.de>
Message-ID: <87r1jclxpm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

Also missing quote on AS=3D"

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
> +    echo "DOCKER_CROSS_LD_GUEST=3D$container_cross_ld" >> $config_target=
_mak
>    fi
>  done


--=20
Alex Benn=C3=A9e

