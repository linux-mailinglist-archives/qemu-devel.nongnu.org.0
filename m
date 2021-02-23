Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CC3230CD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:32:48 +0100 (CET)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcUJ-0006ht-Gq
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcQz-0005DC-QM
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:29:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:32852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcQx-0000X0-UF
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:29:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id 7so23602835wrz.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xkHzDPWYUO/Xr9IzBu4/hp/fhAcYRxw6HNHasl3o7J8=;
 b=jmwYq6rQ9FZnW1GmSYDbYpoFWZbOfvw0jb59FkrvwMMkcIma01hDPP/Wei3AoS8SJT
 aeEZ00FUR34Ey+1s8/g8L/h5UoPEsihRj4BtgRCtv3YXbIgdFwvBcbLc1CBxZ2yBrFKE
 Of+WuHHrkkU3CiyEtnaeaO8Bp5TsuAlK5lUq9Ff0DQXKZFDBK+B+I69L9qlYZqPPfMTs
 +ByqwuOdPp7ZdZX1z6O9+V1fMfF3TuDjAAhRvH7MpK5UTcgtw1nx8x4ENaQxuZQQ0Y3E
 byQdPqVs7AyTVKpzHNvHQMiC27iQoNdqQSxHpEA6dj49QI0rhBfH4We9L61k3J921bV/
 92Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xkHzDPWYUO/Xr9IzBu4/hp/fhAcYRxw6HNHasl3o7J8=;
 b=t4JodbD1goPHGYQlrOv/mo9VZEnBKOlQUhPANoA7PEohVj/SAC+fX+TTLK8AuOO9hg
 GsyRoar2P9eNPIwaFl4h0ZwdSBzA14h1MlYyir12w73/5UJ++xW7QzMz4ng0A8lBFWhi
 BswqYYf71+dKdRFd5ghMIttirBHJWeb9t5WxgxQj/uVhq/yN0gwXwtD1v3SlYSvKC7qF
 aAWk4SO6Ko8AI4rGXvJHgPnMXfV43IjeyYUrx4L+FUqcw4qKJg9gwLFCeX6hBs6/snNI
 yKVTNXrcRrZCA5o/y3+TZy5IjNaZvYoN/wCAkSSQ54mj2uZ6fpYGvb8TUbEZTXMy/GGO
 ZPQw==
X-Gm-Message-State: AOAM532dvBSfJYkS4OnUZkFhA3qetc3SKc0rN7GnSdkRa/SK/Pna7ph0
 6FhV4gN11l9JHfjI9CFo92zt2Q==
X-Google-Smtp-Source: ABdhPJx3cGfHUL6docFAiLMUS0o9aNWbgfVryzAEVAqYo3NWB0KGLbf+XEoagvq16rqT0kWUdDJjcg==
X-Received: by 2002:a5d:67c2:: with SMTP id n2mr28078387wrw.298.1614104958431; 
 Tue, 23 Feb 2021 10:29:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n10sm6553211wrt.83.2021.02.23.10.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 10:29:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2E6A1FF7E;
 Tue, 23 Feb 2021 18:29:16 +0000 (GMT)
References: <20210223170910.2916721-1-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/docker: Use --arch-only when building Debian
 cross images
Date: Tue, 23 Feb 2021 18:28:00 +0000
In-reply-to: <20210223170910.2916721-1-f4bug@amsat.org>
Message-ID: <87sg5m3af7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> When building a Docker image based on debian10.docker on
> a non-x86 host, we get:
>
>  [2/4] RUN apt update &&     DEBIAN_FRONTEND=3Dnoninteractive eatmydata  =
   apt build-dep -yy qemu
>  Reading package lists... Done
>  Building dependency tree
>  Reading state information... Done
>  Some packages could not be installed. This may mean that you have
>  requested an impossible situation or if you are using the unstable
>  distribution that some required packages have not yet been created
>  or been moved out of Incoming.
>  The following information may help to resolve the situation:
>
>  The following packages have unmet dependencies:
>   builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
>                    Depends: gcc-alpha-linux-gnu but it is not installable
>  E: Unable to correct problems, you have held broken packages.
>
> Fix by using the --arch-only option suggested here:
> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1866032/comments/1
>
> Suggested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/docker/dockerfiles/debian-all-test-cross.docker | 2 +-
>  tests/docker/dockerfiles/debian10.docker              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/test=
s/docker/dockerfiles/debian-all-test-cross.docker
> index dedcea58b46..593b7ef1023 100644
> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
> @@ -11,7 +11,7 @@ FROM qemu/debian10
>  # What we need to build QEMU itself
>  RUN apt update && \
>      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> -    apt build-dep -yy qemu
> +    apt build-dep --arch-only -yy qemu

This is just going to fail later on when you discover the cross
compilers are only packaged for amd64. Perhaps we need to mark this one
as amd64 only somehow?

>=20=20
>  # Add the foreign architecture we want and install dependencies
>  RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dock=
erfiles/debian10.docker
> index 9d42b5a4b81..d034acbd256 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -32,6 +32,6 @@ RUN apt update && \
>          psmisc \
>          python3 \
>          python3-sphinx \
> -        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut =
-d\  -f2)
> +        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep
>  '[all]' | cut -d\  -f2)

This bit is fine, without the all-test-cross change:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

