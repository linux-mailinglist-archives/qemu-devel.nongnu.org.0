Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A32DC3C6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:13:54 +0100 (CET)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZR3-0003AP-Q9
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpZOU-0001NJ-Uk
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:11:14 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpZOP-0004ra-Jg
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:11:14 -0500
Received: by mail-ed1-x52a.google.com with SMTP id h16so25403843edt.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TZEhK2TTCNSxAcSqX+s5m6DWf7HzbQVPRxDZXVrqNy8=;
 b=eIaIRJFUAseY9rrJcIczaQq0gLlCMceCo0rxi/QfwkmuySUnsIBZ4eg1VYR6cArYU5
 SSou14dea0wKfzr0WQ5dX4Jw69GMP9Py/yGY5sddauAV1eVSXH7NnUWWn/zdmQMcUzaI
 PySRCTugi+OCBgclOs1eceyvkY+6/G5AfuPPmFagrzbsY5cjKSQ2vdak96uLG3AUQNp8
 7hICTGC+T9hu6y+KH1SABFsr+v70Fpaf4LgNBBFRhXCf7laaeXIq4eu8DG0HhIHDBhCF
 fFaDXYxetzEAhYRAKPBmtWOiSXP6mOVhzEdU+KNa599230kFQNuXexr05SKSdsfQY6t/
 P4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TZEhK2TTCNSxAcSqX+s5m6DWf7HzbQVPRxDZXVrqNy8=;
 b=t5JLLzhVUUBvvkOiE0Q0InHICStSpn7vKvDcZUHPZWscEdIw4EB0SZCUXocb6f0nsW
 40pgF8RJrNygdOflv5roHQYfBQNjlUcnG2W0sdhcb8aVLqJCB6M9zqJ/AapYTqlEryAt
 zWa1/WQArqEdldjasGaKtaOgjHuXd9MZrLv7gUzqxvSpxY6ullKnmAtQi+AQbCllRpuN
 gCCb24w1oY9Kwk59fSyIBTbIpmWvLWp3SnWsod0nXAv6sfoSbyDUKakO5NVSFPSKwFT1
 GIlP5ShBqbK+xeEe/oYRdnNlN5mtrD8QDQfIKuGO/iKxBDRccwjuDK1Yg0q0tlLU+Wtk
 5smw==
X-Gm-Message-State: AOAM532BflqolJAsFOmWJ1fT9DP+NBcG0Q2Ah2FlkzJeV7e7mUt3dCSv
 MW3/PuRshoPICCCZ99V84gS2a4RH3Q+0YzR4lIlrKA==
X-Google-Smtp-Source: ABdhPJyxdjo6FlfZ/ZKwex19o/jt5oCUOaj/6XJw9VH2YjMa7884Wz5Uj7alwnjlx7wHxy3AiZRQ7gMzIUP2H/mERbs=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr7265720edv.100.1608135068176; 
 Wed, 16 Dec 2020 08:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20201216141653.213980-1-berrange@redhat.com>
In-Reply-To: <20201216141653.213980-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 16:10:56 +0000
Message-ID: <CAFEAcA_QnRHEefC5sjDRc4V6GvxTn96wDf-b7gyg5wSRoJ7nmQ@mail.gmail.com>
Subject: Re: [PATCH] tests: update for rename of CentOS8 PowerTools repo
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 14:21, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> This was intentionally renamed recently to be all lowercase:
>
> https://bugs.centos.org/view.php?id=3D17920
> https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_a=
nd_repoid_changes
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>
> This needs to be merged asap, as CI will break for anyone whose branch
> triggers a rebuild of the centos container image.
>
> eg current broken git master:
>
>   https://gitlab.com/berrange/qemu/-/jobs/915852165
>
> vs with this fix
>
>   https://gitlab.com/berrange/qemu/-/jobs/915862731
>
>  tests/docker/dockerfiles/centos8.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/docke=
rfiles/centos8.docker
> index 54bc6d54cd..06b67962fd 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -31,6 +31,6 @@ ENV PACKAGES \
>      zlib-devel
>
>  RUN dnf install -y dnf-plugins-core && \
> -  dnf config-manager --set-enabled PowerTools && \
> +  dnf config-manager --set-enabled powertools && \
>    dnf install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt

I tried a test merge of this but it fails in Gitlab CI:

https://gitlab.com/qemu-project/qemu/-/jobs/916041167

#6 7.706 Error: No matching repo to modify: powertools.
#6 ERROR: executor failed running [/bin/sh -c dnf install -y
dnf-plugins-core && dnf config-manager --set-enabled powertools && dnf
install -y $PACKAGES]: exit code: 1

thanks
-- PMM

