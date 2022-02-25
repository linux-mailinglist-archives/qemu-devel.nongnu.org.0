Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E64C4D22
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:01:37 +0100 (CET)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeuN-0005EO-Nf
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNeqX-0007fT-5s
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:57:38 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=37876
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNeqT-0001Hx-SF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:57:36 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id y189so7392193ybe.4
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TbDhTR7G0bzWRyZi1swxpGARwyW/b/53IV/Y4M0uj3s=;
 b=iPZP5pTarRnx9XopRgzpZWOHKN6XbT6MM2sb2sKcj8GrHSM0YNp/6TKew7oMHHLYXr
 PA/kcGGXGjqjfUWbejlOV+BHlLQajPlHd9UW/K3iDUCwpOlC4bkd29XMjaz0o0JIVIU3
 jye6uMJfXW2URnPjBdA0xkKY+RhpQrHmE0HeW39Sx4ynbGddmPZvzBohM9orRzKBfpW3
 P7KWoncK5Y+D5BUCdHyCvg6V1yrRyqyRaf18GMX9PKFqvx/bJ3U3lhSpHsqvZl2MX9dd
 WQbPufjcyrRyukU+YUcndGSufvnJqgMhExtKhnKtHm14iROIpEYLSsSqoFnzg46XEaYl
 MZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TbDhTR7G0bzWRyZi1swxpGARwyW/b/53IV/Y4M0uj3s=;
 b=h14cKiVo7Mm0M0FU9Gvl7RgXXO+AK+8tO1hOcG9KPE+Ukv5UW5n0OrG9anhExPQFtQ
 Gk+69QtyFScGUr7NRTBTXP3/D2kX/300drYI3wXJL8Oii7BmN5lQLH9Q3mdnSrHZEqe7
 9JpVmVAPhLXKlzmvEy4rmteVoNb2atjue4Oo66DgUX1sUYyZ1FCnfFQPXhNls+ozubmV
 79pSYHgLERx+81VuBXW4TEGIlqh3K+dnHXRo10qdk8qLm+sn6IiDaphQDP1VCLbrSsL8
 uIBgAkn7H3ouA/edfKlzw7T5y20kVajZa/ZPflmsLUaxHL1MNeIzYh8q5mXcrGsgPOdV
 Prkw==
X-Gm-Message-State: AOAM532PCLXlADXpCEbtUHTTZTawrwAHaq6uLSrG6NhbBW5YzazCkttI
 SusV9+cfsfeMlG6/y21KmMdHb2SVJSkRsyGnrH08eQ==
X-Google-Smtp-Source: ABdhPJwZCdDUKRyrwVFGiKzVDDxHR0IqYbUr9eixpkuH/KxK3Iey9u1RGuUpPVjuGDm5zuQ8I7AjdjMKHZaFCpJBEsQ=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr8524396ybq.479.1645811852780; Fri, 25
 Feb 2022 09:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-4-alex.bennee@linaro.org>
In-Reply-To: <20220225172021.3493923-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 17:57:21 +0000
Message-ID: <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] tests/lcitool: update to latest version
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 17:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We will need an update shortly for some new images.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
>  tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
>  tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
>  tests/lcitool/libvirt-ci                      | 2 +-
>  4 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker=
/dockerfiles/opensuse-leap.docker
> index 1b78d8369a..e1ad9434a3 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -127,8 +127,7 @@ RUN zypper update -y && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>
> -RUN pip3 install \
> -         meson=3D=3D0.56.0
> +RUN pip3 install meson=3D=3D0.56.0

Why are these formatting changes to the dockerfiles in this commit ?

thanks
-- PMM

