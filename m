Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D3391C1B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:35:31 +0200 (CEST)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvZC-0007go-24
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llvXY-0006s9-Dq
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:33:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llvXU-0002pe-RM
 for qemu-devel@nongnu.org; Wed, 26 May 2021 11:33:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id z130so978890wmg.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6GnbaqkkeQOiginaKxLrIfbSSN8Qhu3yXppHkpoazGI=;
 b=CaoQS+NCAFrupHkNrcy94Gegf3kTsulwLL1plMbtzB+LpCxcaxPYw0cosyg2eKw2pk
 wPQCpjmQehLZhfY0pMjzRpTEM45qj/VnZ4hc6nSsciMe2kJQid09G4nutwqLIgMex5FQ
 Y7KJaCYssPTPDkc6IYZURtiVUEMQ3BZ4YycEqAtOC6Q8kluUYD9iqY1gZxRPsuCZ2fFM
 /+9OpsaS5t/4AbAqcNuOFZ0LrxArqIxzUPHW/RxVCKc7p0lN81jrHhfnWnyr7BH2ZR8Q
 ptFEbl/pFnFcVq7A2xBc+GkrjG8hXzUkM4oFdmaNxmia6bLE5XWRu656D/IXZ8zWypGY
 AQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6GnbaqkkeQOiginaKxLrIfbSSN8Qhu3yXppHkpoazGI=;
 b=q9wRzoKU6+CQKE48ltAng+DcGHALlqx6NGwWSiXD1o6evPnUKErY3Y5K6NuwwAf33O
 VsTcul07AWAytZzqWYuMod98oxeEgKO+OllLWF/T6K6oSlITw3e/L/hY8ZyF8ltjxE6/
 Tbbnj4bpBfptK1BiG7hhxUG/6yQwin442qkV56TYCXvyyxakkmKrrmUYVAh3enEE5RIE
 vSPtRSZlQSSzXPhmNCLAVtadfrcvyTJnKaF3XAUTUQ56sXHAP2YO79ipSoDNw2JuKzZy
 kq88fTUoGbTAl2Zpuganq176fRE838n2ctO07kjhS3Hp40omepG+JYbZI45r1u+El3Bk
 VyYw==
X-Gm-Message-State: AOAM532atqsrUg6rXCjsGXBG9yYa0n16eW7AjuRq8xVjkMZ0bSSREjq+
 i8T5ilAxjcY8ia1L9yFnhnvlrA==
X-Google-Smtp-Source: ABdhPJwfosdgSnjPS4vtAshfMe82s1g9yTnUtvM175vnYXjDFVbndmnCApYmrMQmbB0NmI9/C5Jgyg==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr28637109wmi.15.1622043220679; 
 Wed, 26 May 2021 08:33:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x10sm20705542wrt.65.2021.05.26.08.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 08:33:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFE501FF7E;
 Wed, 26 May 2021 16:33:38 +0100 (BST)
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-32-jsnow@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 31/31] gitlab: add python linters to CI
Date: Wed, 26 May 2021 16:32:43 +0100
In-reply-to: <20210526002454.124728-32-jsnow@redhat.com>
Message-ID: <874kep33xp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Add a python container that contains just enough juice for us to run the =
python
> code quality analysis tools.
>
> Base this container on fedora, because fedora has very convenient
> packaging for testing multiple python versions.
>
> Add two tests:
>
> check-python-pipenv uses pipenv to test a frozen, very explicit set of
> packages against our minimum supported python version, Python 3.6. This
> test is not allowed to fail.
>
> check-python-tox uses tox to install the latest versions of required
> python dependencies against a wide array of Python versions from 3.6 to
> 3.9, even including the yet-to-be-released Python 3.10. This test is
> allowed to fail with a warning.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml            |  5 +++++
>  .gitlab-ci.yml                         | 26 ++++++++++++++++++++++++++
>  tests/docker/dockerfiles/python.docker | 18 ++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/python.docker
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 765408ae274..05ebd4dc11d 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -242,3 +242,8 @@ amd64-opensuse-leap-container:
>    extends: .container_job_template
>    variables:
>      NAME: opensuse-leap
> +
> +python-container:
> +  extends: .container_job_template
> +  variables:
> +    NAME: python
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa78..cc2a3935c62 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -789,6 +789,32 @@ check-patch:
>      GIT_DEPTH: 1000
>    allow_failure: true
>=20=20
> +
> +check-python-pipenv:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> +  script:
> +    - cd python
> +    - make venv-check
> +  variables:
> +    GIT_DEPTH: 1000

A GIT_DEPTH of 1000 seems rather arbitrary - why not 1 (or 3)? Do the
tools actually care about diff history?

> +  needs:
> +    job: python-container
> +
> +
> +check-python-tox:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> +  script:
> +    - cd python
> +    - make check-tox
> +  variables:
> +    GIT_DEPTH: 1000
> +  needs:
> +    job: python-container
> +  allow_failure: true
> +
> +
>  check-dco:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/docker=
files/python.docker
> new file mode 100644
> index 00000000000..56d88417df4
> --- /dev/null
> +++ b/tests/docker/dockerfiles/python.docker
> @@ -0,0 +1,18 @@
> +# Python library testing environment
> +
> +FROM fedora:latest
> +MAINTAINER John Snow <jsnow@redhat.com>
> +
> +# Please keep this list sorted alphabetically
> +ENV PACKAGES \
> +    gcc \
> +    make \
> +    pipenv \
> +    python3 \
> +    python3-pip \
> +    python3-tox \
> +    python3-virtualenv \
> +    python3.10
> +
> +RUN dnf install -y $PACKAGES
> +RUN rpm -q $PACKAGES | sort > /packages.txt


Otherwise seems OK to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

