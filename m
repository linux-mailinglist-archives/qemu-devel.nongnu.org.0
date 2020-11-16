Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34462B438F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:20:45 +0100 (CET)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedUx-000842-N5
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedTw-0007dh-Fs
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:19:40 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedTu-0001Wi-Od
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:19:40 -0500
Received: by mail-wr1-x441.google.com with SMTP id r17so18492310wrw.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=n1DF4tVjJ4tKdtaKjQCbo//i1Se4Ur4yThRTXexO4Xg=;
 b=XRRDz4JNjYJ0kPo/XQza7ryLzNGidY0QtFyF52sUcfpFLFmzIgiS/+B9uiWCDXJ6qK
 q2Siv9AfNStBzLc/vcJhRn0/Ja3yDctIGXOw6Kx8gSL4WDLBRACcucsB59QJOZW5dfts
 fiVXKdy7ElhuE7R00WZO1CI8uo6XyC0DTepAwFP0r2yip6FTm/AgFe7VCz1rWXDuqDVG
 rAneTQrYvGvma54aDE/grSjn7Su2ze0nf6wxmlcmhTaV8fcCLYKfwZIG8SO8pj+00NgW
 NUse/zDNvkHXIhEnwKFcYeyui96neK4/AorZ5oq9JocBIQ/BQX8VbN2i3a3vjRnIZ/3i
 tNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=n1DF4tVjJ4tKdtaKjQCbo//i1Se4Ur4yThRTXexO4Xg=;
 b=L22edHWT3VdFbp7YB/eTGHry+s210NqledfndRjGydL5A0pNnOu/+e0mpJgrutkOdk
 UnTc6TrJBVOcg/8bVWkP5CDZGMVJ6mxsvNjm3i4BDI3kD51nv4Outal4CBoko6timge/
 gQNgMQeQlwluc+kK3R81tm0a7NQw+n0D6IvljVQ6osBT00li5TEk0bb6PqGVpiKCqLrj
 wjre+PE9LUYm32oxxHtbopC/5JHpuln3u3jNwz8iAVfrc7v5szWrAfvHnc8zrq6CD8zD
 W+TrRVrrYY/0IcQq0MDDe+vHfu1y8M5Gh07dN5WE7OUswPu21Et+CgWWZeag/wr9/xlH
 cAGA==
X-Gm-Message-State: AOAM533Fu8EMbrzolk6e1Uq5SkUgCBNzuWELPgEuSdgMMAS4EIKyyq5e
 3um9wZxArJf8GWZR0yK8McmbgA==
X-Google-Smtp-Source: ABdhPJzfSloh0TuoBhKMQHewCeLTvTejfdj2DtiTotWWOG0pjP6Qp9rP6aqHdBAXBgwJhrXFTeZopQ==
X-Received: by 2002:a5d:4a50:: with SMTP id v16mr19285995wrs.106.1605529176048; 
 Mon, 16 Nov 2020 04:19:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w10sm23249898wra.34.2020.11.16.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:19:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2DAE1FF7E;
 Mon, 16 Nov 2020 12:19:33 +0000 (GMT)
References: <20201116113046.11362-1-acho@suse.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Yu-Chen, Cho" <acho@suse.com>
Subject: Re: [PATCH] gitlab-ci.yml: Add openSUSE Tumbleweed and Leap for
 gitlab CI/CD
In-reply-to: <20201116113046.11362-1-acho@suse.com>
Date: Mon, 16 Nov 2020 12:19:33 +0000
Message-ID: <87y2j1wl2i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: fam@euphon.net, lyan@suse.com, thuth@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, brogers@suse.com, cfontana@suse.de, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Yu-Chen, Cho <acho@suse.com> writes:

> Add build-system-opensusetw and build-system-opensuse152 jobs and
> add opensuse152.docker and opensusetw.docker dockerfile.
> Use openSUSE Tumbleweed and openSUSE Leap 15.2 container image in the
> gitlab-CI.
>
> Signed-off-by: Yu-Chen, Cho <acho@suse.com>

Hi,

Could you split the TW and the Leap patches please as they are adding
distinct things.

I'm not super familiar with openSUSE LEAP but I assume this is in the
same category of short lived "tip" distros as Fedora and non LTS Ubuntu?
In which case we should name it as such (opensuse-leap?) as we will tick
the build version each time a new version comes out.

I'm less sure about Tumbleweed because I don't think we make any
commitment to support rolling distros. We don't have Gentoo, Arch or
Debian Testing* in our dockerfiles either. I would expect rolling
distros to track the upstream build themselves.

* Debian 11 (next stable is there purely for compiling test cases)

> ---
>  .gitlab-ci.d/containers.yml                 | 10 +++
>  .gitlab-ci.yml                              | 60 ++++++++++++++
>  tests/docker/dockerfiles/opensuse152.docker | 88 ++++++++++++++++++++
>  tests/docker/dockerfiles/opensusetw.docker  | 89 +++++++++++++++++++++
>  4 files changed, 247 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/opensuse152.docker
>  create mode 100644 tests/docker/dockerfiles/opensusetw.docker
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 11d079ea58..449a00de70 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -48,6 +48,16 @@ amd64-debian11-container:
>    variables:
>      NAME: debian11
>=20=20
> +amd64-opensuseTW-container:
> +  <<: *container_job_definition
> +  variables:
> +    NAME: opensusetw
> +
> +amd64-opensuse152-container:
> +  <<: *container_job_definition
> +  variables:
> +    NAME: opensuse152
> +
>  alpha-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9a8b375188..540a700596 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -195,6 +195,66 @@ acceptance-system-centos:
>      MAKE_CHECK_ARGS: check-acceptance
>    <<: *acceptance_definition
>=20=20
<snip>
> +
> +build-system-opensuse152:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: opensuse152
> +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +check-system-opensuse152:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-system-opensuse152
> +      artifacts: true
> +  variables:
> +    IMAGE: opensuse152
> +    MAKE_CHECK_ARGS: check
> +
> +acceptance-system-opensuse152:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-system-opensuse152
> +      artifacts: true
> +  variables:
> +    IMAGE: opensuse152
> +    MAKE_CHECK_ARGS: check-acceptance
> +  <<: *acceptance_definition
> +

What's the thinking about this selection of TARGETS and tests? We've
tried to spread the various configure, TARGETS and CHECK combinations
across all the distros to avoid too much repetition of what is mostly
the same code being tested.

--=20
Alex Benn=C3=A9e

