Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C94C45AE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:16:06 +0100 (CET)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaS1-0006ZJ-HU
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:16:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNa8r-0002JA-0I
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:56:14 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=33662
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNa8n-0000kA-E0
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:56:12 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id j2so5783017ybu.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S5ibQE5YsoAV9Hk7A0sBJlrtaY8slmsUqz0JqJ2qUns=;
 b=hAy+LIKbUtKxGkoyY5Gqjc5GGPU6fxB/i0zR3VFiKA97Ur0yKGW1tyNOKiXbfEmNAE
 MCmmVUYvVBfd6CX6FFvuobN9psxuhWur9h0S7Nd4cz12yTLvdPuTR6X24EPgJORA9apt
 BIfH+mhqfk92Od+qApr/qZgFzs2xDHkYJhp3iHaEwQD09spAjmEbXg5Pbb9oxqob5bRg
 37+bNNOndGxJdRB7Z5mayz9K6jx9KgzP7l2ha6IOBIFmclNtkn6av8hFXQuQ25el1QOS
 787j30FOnFa4WZRNKQsLa45aAd/+NMDQM0PwCS6Fn0xpABXz5W8EI+HwhNWlZAZ8XoQV
 O2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S5ibQE5YsoAV9Hk7A0sBJlrtaY8slmsUqz0JqJ2qUns=;
 b=AQwx1pJpRgrI+W0+DA3Wzo0GbjzBDHU/P+xVvss04MDQsTkHew68VIoqGJERRL+MpT
 qO5DP3VCkZtGNgPwpC2ydi8awZ0CjwoigzYppmU0W00cfXuQH9UTAoRT6Sfji+aCwAIP
 Ins0HEJ5kIQHBGQQ/DW6VO8Fv4uUnKFVtl0Kc/izYHymQG1PtzgmltYobrQtZzIKyxWb
 WfXZEJ4bNPHeuMjD8B3vE1clM/7frZGBjWCmFdcqHro3vm8SwAz5GfoDaZYPp5m850WW
 WhAUd511VfOxuWP6Cczq3yR61/4MZfAmTI5ezl0aG26GnnQgllwzRvOs5ztaPuLaedo4
 BgxQ==
X-Gm-Message-State: AOAM5336eo2lSXqPmCRcmm6uWa7JF6rqDouVn3U50rouAQoeYBjY082T
 Gotp4CqGtcRnOybaXL08vz2dQnm2mSE1w6qPf69kHA==
X-Google-Smtp-Source: ABdhPJx+lNilzW/pjELS6u7Kb4IkncAvxL3TeD+jpd+dUgctoLc5syQKRIkGmSMnqQK3dobKy+Vh9UE+siR45BNx42A=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr7064249ybk.193.1645793768607; Fri, 25
 Feb 2022 04:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-16-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-16-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 12:55:57 +0000
Message-ID: <CAFEAcA-jDpukrey8mpbA+5MJ9kzT5nJ+LJCWybf9aPkN_G=6Sw@mail.gmail.com>
Subject: Re: [PATCH v5 15/16] lcitool: refresh
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:58, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/docker/dockerfiles/ubuntu1804.docker | 2 --
>  tests/docker/dockerfiles/ubuntu2004.docker | 2 --
>  2 files changed, 4 deletions(-)

What's happening here? The commit message only has a very brief
subject and the patch changes don't seem to match up with it.

> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/do=
ckerfiles/ubuntu1804.docker
> index 699f2dfc6a..040938277a 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -65,7 +65,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>              libpam0g-dev \
>              libpcre2-dev \
>              libpixman-1-dev \
> -            libpmem-dev \
>              libpng-dev \
>              libpulse-dev \
>              librbd-dev \
> @@ -89,7 +88,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>              libvdeplug-dev \
>              libvirglrenderer-dev \
>              libvte-2.91-dev \
> -            libxen-dev \
>              libzstd-dev \
>              llvm \
>              locales \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/do=
ckerfiles/ubuntu2004.docker
> index 87513125b8..159e7f60c9 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -66,7 +66,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>              libpam0g-dev \
>              libpcre2-dev \
>              libpixman-1-dev \
> -            libpmem-dev \
>              libpng-dev \
>              libpulse-dev \
>              librbd-dev \
> @@ -91,7 +90,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>              libvdeplug-dev \
>              libvirglrenderer-dev \
>              libvte-2.91-dev \
> -            libxen-dev \
>              libzstd-dev \
>              llvm \
>              locales \
> --
> 2.34.1

thanks
-- PMM

