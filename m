Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF51FCBAD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 13:04:13 +0200 (CEST)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlVrY-0005sf-9n
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 07:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlVq5-0005KU-80
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:02:41 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlVq3-0005Fk-DB
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:02:40 -0400
Received: by mail-wm1-x343.google.com with SMTP id d128so1531151wmc.1
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 04:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZHYdrXHfbB9SI3ECLJXjVsyDD6N1M2l0IvUH+4GQtl0=;
 b=N/rxg5I6JUeVqG5BYlfcFrqtjjcjcvQehGj20AkY+Sp1VACjthQrOfoBXzRK2li/Xk
 iMT/uEGyNyaXEl6vWj9iWVRefLmL/BLrmZCNOzRjRersS91sAN8xGYvcQrVdYMSyotX0
 7EsHWEunPRnCmRIpjW9xbmsxkGJyrtElCqW1wuhIK8OHkjhKwQPt1YnH93YzyOgY3A5Y
 f58lKOQ76O+3mAusfKQgwPiC/X1tENMP606qEeYNZ0LS7O7W2yplRDm1Fcf81aUefGex
 Ak/x4kdDqko5tTf5tPcO56Low49UQGgljcYXNvHLxbdaY0wSJ38iHovbVovrP1Jp3oqW
 ezgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ZHYdrXHfbB9SI3ECLJXjVsyDD6N1M2l0IvUH+4GQtl0=;
 b=q8PEaN7ffrzzoVpyUsKPxDXQM8wpKYblb0t3CC8vloVITpU1QNFTJj1UaAVWbSnP9z
 xdg6hN3oc6dxb+6m3qMyB7euDLUiTQO865gUS8TaK0DnUnL/F75lOBixsU4Jzuy6ToME
 gdXbUSxqxfI7U4etxMETQ+cBgTSAyMfSo3pxakPN1JB/EaM8XRr3FPRcXZT0PNBKzuKI
 PBbmVtAI55pMnzZEoQawZJ1b2+jZvsaQqr6Ii771PiJq9PgCHmJdkcDwI707uj/0ne62
 p6XLHSck5XxGEL32TYJGFMKC2lLgGd+ZGcWJwGl4MAal4GwdjvjFvG+2Y49OInKejGJR
 LK0w==
X-Gm-Message-State: AOAM533eiCf5U061oxtrpi4E3O4aiS1V7znwlX2GQgzdLnVaQFAwuBAr
 dIUQKZP4RIMxhGpKzJa1LoBlEw==
X-Google-Smtp-Source: ABdhPJw/AIKI5uX6B81J3Z2S/SOpzQJKKa8VlOIUTFviDE7GKbIcdPjodAtcUxme39JnQI4hWvXU6w==
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr8432821wma.83.1592391757620; 
 Wed, 17 Jun 2020 04:02:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x14sm4037232wrt.60.2020.06.17.04.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 04:02:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B96811FF7E;
 Wed, 17 Jun 2020 12:02:35 +0100 (BST)
References: <20200617043757.1623337-1-richard.henderson@linaro.org>
 <20200617043757.1623337-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 5/5] configure: Add -Wno-psabi
In-reply-to: <20200617043757.1623337-6-richard.henderson@linaro.org>
Date: Wed, 17 Jun 2020 12:02:35 +0100
Message-ID: <87h7vax8dw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On aarch64, gcc 9.3 is generating
>
> qemu/exec.c: In function =E2=80=98address_space_translate_iommu=E2=80=99:
> qemu/exec.c:431:28: note: parameter passing for argument of type \
>   =E2=80=98MemTxAttrs=E2=80=99 {aka =E2=80=98struct MemTxAttrs=E2=80=99} =
changed in GCC 9.1
>
> and many other reptitions.  This structure, and the functions
> amongst which it is passed, are not part of a QEMU public API.
> Therefore we do not care how the compiler passes the argument,
> so long as the compiler is self-consistent.
>
> The only portion of QEMU which does have a public api, and so
> must have a stable abi, is "qemu/plugin.h".  We test this by
> forcing -Wpsabi in tests/plugin/Makefile.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure             | 1 +
>  tests/plugin/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index 5e27229f58..ba88fd1824 100755
> --- a/configure
> +++ b/configure
> @@ -2055,6 +2055,7 @@ add_to nowarn_flags -Wno-shift-negative-value
>  add_to nowarn_flags -Wno-string-plus-int
>  add_to nowarn_flags -Wno-typedef-redefinition
>  add_to nowarn_flags -Wno-tautological-type-limit-compare
> +add_to nowarn_flags -Wno-psabi
>=20=20
>  gcc_flags=3D"$warn_flags $nowarn_flags"
>=20=20
> diff --git a/tests/plugin/Makefile b/tests/plugin/Makefile
> index b3250e2504..3a50451428 100644
> --- a/tests/plugin/Makefile
> +++ b/tests/plugin/Makefile
> @@ -17,7 +17,7 @@ NAMES +=3D lockstep
>=20=20
>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>=20=20
> -QEMU_CFLAGS +=3D -fPIC
> +QEMU_CFLAGS +=3D -fPIC -Wpsabi
>  QEMU_CFLAGS +=3D -I$(SRC_PATH)/include/qemu
>

It's a shame api.c includes enough headers to get tripped up but
hopefully this will catch enough of the breakage if/when it comes.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

