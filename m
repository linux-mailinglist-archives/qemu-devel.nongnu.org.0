Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3634203F1F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 20:27:47 +0200 (CEST)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnRAZ-0001S9-0k
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 14:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnR9Z-0000fw-P2
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 14:26:45 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnR9Y-0007Ag-0N
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 14:26:45 -0400
Received: by mail-wr1-x444.google.com with SMTP id z13so5928790wrw.5
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ggjyW17WAwb3Tfms8Bl9vTaGlkQ3V7vidUTp5kxPFOw=;
 b=hDmzVIPluth3h2dM27OvyXl/OF+f4zrsucexip4c+d/eL+ZrCwd9rpO/CFEQDZUEYU
 bskb58xLCeErgPUsXhJ71GrPXWif6uBBXq30BBAptu73s+8ImrXyNvNm5DM26HAtggI1
 MSVk8kNJZGNELF8L91QFWWQieu2IqkJ81BqRwUBF8n6VcUkQa06vpe26041MIKe+lsaZ
 cEs1ejc6wuExpDuiBGeQAQ6hl43YR8kVacAbAOixChKqkhD6rQHPW7YQecwFBkkxnpH+
 u2qAd3xuxi+Q0rC78EKiAdrzhvFmDjsHv4F5oQgrOIR4iAJERI8iqDsJLjKd0ntrcg1k
 VGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ggjyW17WAwb3Tfms8Bl9vTaGlkQ3V7vidUTp5kxPFOw=;
 b=jZZGR/1ruk6UxbH/Gfb/P+0qDS6akBpq8YIF427h4KB2b1QFRsFYihTwm+Lu1VKK9+
 WpZ8++MssdasChcx40DQ/rzW4XiH7HHXTM1+NPzwCRCMqhiOgygMaL4+Ua0TAgargVPF
 3wkCwcexjzLLOanLI+9NUwD5ceVUQr8fHJsEUgz2BRU6B3GMn0nqFl6CIbSD9KNfCvxB
 hMPQaBS1FxFKylJsB6bYUVsXDsXmnM4rfdJeGnFl1KyPrzgXnMB7pFm8EDwFkCLP4DLw
 w7toTKW1JzmBAUiVfK8hlcKYujPceDhB5eZxlJ6eVJ1iW85yXhVj8e3pLgqsI0dFD8//
 CVIg==
X-Gm-Message-State: AOAM531tKxTCPFlpXqxzAjzbl2mmTTVcnXMw6o98qtkeTWuNfEGdoVug
 PBVuavBe10M04XxvWw9TCk0Rl45NYLg=
X-Google-Smtp-Source: ABdhPJxktFrNIPBZmQ+esZKWjCtvY7Zujp0KvmkFbhNVspGeIpfS6p97j/weItNUOvmTHPs0mQfUdg==
X-Received: by 2002:adf:afdb:: with SMTP id y27mr19865810wrd.267.1592850401879; 
 Mon, 22 Jun 2020 11:26:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s2sm431694wmh.11.2020.06.22.11.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:26:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEA201FF7E;
 Mon, 22 Jun 2020 19:26:39 +0100 (BST)
References: <20200622153318.751107-1-berrange@redhat.com>
 <20200622153318.751107-3-berrange@redhat.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH RFC 2/3] gitlab: build all container images during CI
In-reply-to: <20200622153318.751107-3-berrange@redhat.com>
Date: Mon, 22 Jun 2020 19:26:39 +0100
Message-ID: <87a70v9ctc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> We have a number of container images in tests/docker/dockerfiles
> that are intended to provide well defined environments for doing
> test builds. We want our CI system to use these containers too.
>
> This introduces builds of all of them as the first stage in the
> CI, so that the built containers are available for later build
> jobs. The containers are setup to use the GitLab container
> registry as the cache, so we only pay the penalty of the full
> build when the dockerfiles change. The main qemu-project/qemu
> repo is used as a second cache, so that users forking QEMU will
> see a fast turnaround time on their CI jobs.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml | 248 ++++++++++++++++++++++++++++++++++++
>  .gitlab-ci.yml              |   3 +
>  2 files changed, 251 insertions(+)
>  create mode 100644 .gitlab-ci.d/containers.yml
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> new file mode 100644
> index 0000000000..ea1edbb196
> --- /dev/null
> +++ b/.gitlab-ci.d/containers.yml
> @@ -0,0 +1,248 @@
> +
> +
> +.container_job_template: &container_job_definition
> +  image: docker:stable
> +  stage: containers
> +  services:
> +    - docker:dind
> +  before_script:
> +    - export TAG=3D"$CI_REGISTRY_IMAGE/ci-$NAME:latest"
> +    - export
> COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/ci-$NAME:latest"

It would be nice if we could keep the same form as they have in the
local registry which would make it easier to integrate with the rest of
the tooling, e.g. "$CI_REGISTRY/qemu-project/qemu:$NAME"

Otherwise it looks good:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

