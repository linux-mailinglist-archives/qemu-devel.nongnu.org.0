Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09031D8F0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:59:29 +0100 (CET)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLUO-0002Ce-76
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLTC-0001lA-9M
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:58:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLT9-0002SJ-Tp
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:58:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v7so17076630wrr.12
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=a3nbVNGutJMcVPW7dranXbkKWMcxoXpBBKBGT+dOQ6o=;
 b=TNn27DlwkrEdsPQ6YRe0D7umQsMzBGjJUVHew6GiQve/gRvwp3Aeo67blO7H/FYChe
 MBO1ggrE7IyX2UFM/E2uPTyPZahV9GSps/YKfpEcwsPvjBnh8zYik9TDJ0cOojMY5miD
 tfzr0fh7fVywxghNCDN5HuHdAyMQ5HFBudOU9pi3t2nVBGTXqjBVlA3hsebOcK86RA3e
 R2U08ilgBSvSRNQlL6duB5xEZH2UjXUwRwMCai+3m3F8ft1G6hWXltvfRRH+48ShiBXK
 MbRCwk96JuBeJ1cE5HVhSOjZaU6NDnuTgvptXNgCV72NngxXifXj6DtCif0v4KXES+2V
 yErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=a3nbVNGutJMcVPW7dranXbkKWMcxoXpBBKBGT+dOQ6o=;
 b=dhLAT4NC0zjKdYzbyvavDtt+qm6ano8UEuwiZP3XCsSZKOwLDw6OyWKEiJDbtxSg0W
 HujRsM3K8JIf9VHD5AV1E8P6PN/JFTIpiBSMXHw2TbA6Hhbn7hKFO7hBop6WdIxPdEd/
 t/aPwIlNF5OI/6HulfJr/eqDgy/PsvQpaLv1JSeDIfrRZxnwLHOSSxUFTeNOMJ6qPeJD
 81S5aaw7iwrKdzFF9Kh+P8v2UVDaHpoxBfl4v6ZbUIuzsTiKtQ+JmGaDUXUZPKf1oP/9
 6xBNqur2t13qdzsu7tCsbm2D+ZNh72XRc9PM2CKwHR8mbTLTLhtFfTceNtvNTjry429G
 PQ+A==
X-Gm-Message-State: AOAM531hzNEF0Ey+byCc49Wo/U8HgaZRlYpI7WRk1yQwlBrBg5MMvnTN
 zrcKPGSBPMOqwnwrAnwjWqOm9CrHI9udYQ==
X-Google-Smtp-Source: ABdhPJwJfJrn4AwxJ0n4vemsy5jpU0ZuCQcsf3tUftwFmORQfAZYPHKF5u/yOw/Sh/XD6b54I1czxw==
X-Received: by 2002:adf:e943:: with SMTP id m3mr22788300wrn.179.1613563089496; 
 Wed, 17 Feb 2021 03:58:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n186sm2673050wmn.22.2021.02.17.03.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 03:58:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3E721FF7E;
 Wed, 17 Feb 2021 11:58:07 +0000 (GMT)
References: <20210217102531.1441557-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] travis.yml: Limit simultaneous jobs to 3
Date: Wed, 17 Feb 2021 11:57:52 +0000
In-reply-to: <20210217102531.1441557-1-thuth@redhat.com>
Message-ID: <87czwyucs0.fsf@linaro.org>
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Even though the host machines that run the Travis CI jobs have
> quite a lot of CPUs (e.g. nproc in an aarch64 job reports 32), the
> containers on Travis are still limited to 2 vCPUs according to:
>
>  https://docs.travis-ci.com/user/reference/overview/#approx-boot-time
>
> So we do not gain much when compiling with a job number based on
> the output of "getconf _NPROCESSORS_ONLN" - quite the contrary, the
> aarch64 containers are currently aborting quite often since they
> are running out of memory. Thus let's rather use a fixed number
> like 3 in the jobs here, so that e.g. two threads can actively run
> while a third one might be waiting for I/O operations to complete.
> This should hopefully fix the out-of-memory failures in the aarch64
> CI jobs.
>

Queued to testing/next, thanks.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  See also this URL for the explanation of the 32 vs 2 CPUs on aarch64:
>  https://travis-ci.community/t/nproc-reports-32-cores-on-arm64/5851
>
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index fc27fd6330..cc39a447e8 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -88,7 +88,7 @@ git:
>  # Common first phase for all steps
>  before_install:
>    - if command -v ccache ; then ccache --zero-stats ; fi
> -  - export JOBS=3D$(($(getconf _NPROCESSORS_ONLN) + 1))
> +  - export JOBS=3D3
>    - echo "=3D=3D=3D Using ${JOBS} simultaneous jobs =3D=3D=3D"
>=20=20
>  # Configure step - may be overridden


--=20
Alex Benn=C3=A9e

