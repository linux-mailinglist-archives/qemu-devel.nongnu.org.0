Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C447E398548
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:29:34 +0200 (CEST)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNBt-0007DK-SQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loN9Q-0005Ba-Qs
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:27:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loN9O-0000dS-0Z
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:27:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id g204so801002wmf.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 02:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FL5sunqDBaGGH5ijKjXvkD5/KlDypbqTkxc4yYjeSsM=;
 b=g+C3Gp/iwZMHFP5ddIDmRSPpWEZjUU2UWndcyCseBSUhmPWcdXHKvH9MarHx8mNdJF
 iaToQK0hhOVtyhR58F+KlTrSNmvwZkKZ5Mhxcwskh168OY8VJT2//m80SO+qJT73LiEu
 z7Wo03dDOID9HWMAYn9rn+OUyiOZ9d7s29dbivx7t3GFFSHyEuiOfY6FwwAAoCu34Hdr
 uwqZuVGat9S2Q879gHSiKoXtjTDfEsXdsKx/w+ysS2f8OFGx5vWOOmorsXTK6MYO6H4T
 F/cca2KMK7+0ERi+WkJFN/K/X9QL3c3Dqikj4rKkPQcGrXFribSV22DDWhHAR0bttXBk
 YlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FL5sunqDBaGGH5ijKjXvkD5/KlDypbqTkxc4yYjeSsM=;
 b=MskaxwHvkrsoe0+0LbFys1lHPMNGeqFj7+yj0pfiu4aoiKdgdR2rlmPOYJn9pVi0wQ
 vR4HXybI1HciqLw6hSuJpUxN13538XT/SJyfaWd55mOK/00AtWPY4to4f8SxI93C2Ev6
 TNj8+1+bnfbm4kR0Cr11Mcp6gBJ/NVTfOjpW2SCc/okBwzw4517R39B4rgO9Bkt/pfUb
 W4IsssNf8e8BJh2ZCxk6jCBZNNLHLusy41a/HfRjhy4QoAxTZokltTQXH2sNJ5t12H+N
 Uhs5DBNesplLgonp8kVKY/cfzv+2c2m6e1LqRf1VIa6fjdcXmkPa25HLVbStZFJHVFDm
 v7lg==
X-Gm-Message-State: AOAM532+HQoaWJun4l7kqi6EliSfBucFMcDMYwO08xzod1bmZ5Bz9Ja0
 r9pKMsnfJ7E+lr6/9thQglKzzw==
X-Google-Smtp-Source: ABdhPJxKW2P1mO+q/Gk4GyCL1G8AZ6afgz0ZflT/za2O1eAsBm88edi4ZWXl7Ox+PoRWFL/brUIUgQ==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr31372740wmh.186.1622626014420; 
 Wed, 02 Jun 2021 02:26:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o6sm1976815wmh.19.2021.06.02.02.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:26:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE4D31FF7E;
 Wed,  2 Jun 2021 10:26:52 +0100 (BST)
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-28-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v7 27/27] tests/tcg: Increase timeout for TCI
Date: Wed, 02 Jun 2021 10:26:47 +0100
In-reply-to: <20210601150106.12761-28-richard.henderson@linaro.org>
Message-ID: <87eedkborn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The longest test at the moment seems to be a (slower)
> aarch64 host, for which test-mmap takes 64 seconds.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure                 | 3 +++
>  tests/tcg/Makefile.target | 6 ++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 90c0807347..69091ff8ba 100755
> --- a/configure
> +++ b/configure
> @@ -5846,6 +5846,9 @@ fi
>  if test "$optreset" =3D "yes" ; then
>    echo "HAVE_OPTRESET=3Dy" >> $config_host_mak
>  fi
> +if test "$tcg" =3D "enabled" -a "$tcg_interpreter" =3D "true" ; then
> +  echo "CONFIG_TCG_INTERPRETER=3Dy" >> $config_host_mak
> +fi
>  if test "$fdatasync" =3D "yes" ; then
>    echo "CONFIG_FDATASYNC=3Dy" >> $config_host_mak
>  fi
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index b29fae4630..63cf1b2573 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -81,8 +81,10 @@ LDFLAGS=3D
>  QEMU_OPTS=3D
>=20=20
>=20=20
> -# If TCG debugging is enabled things are a lot slower
> -ifeq ($(CONFIG_DEBUG_TCG),y)
> +# If TCG debugging, or TCI is enabled things are a lot slower
> +ifneq ($(CONFIG_TCG_INTERPRETER),)
> +TIMEOUT=3D90
> +else ifneq ($(CONFIG_DEBUG_TCG),)
>  TIMEOUT=3D60
>  else
>  TIMEOUT=3D15

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

