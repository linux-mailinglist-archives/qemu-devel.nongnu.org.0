Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7B330D01
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:02:50 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEb3-0007bM-Jk
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJEZT-0006va-9T
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:01:11 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJEZN-0005Tp-4T
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:01:10 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so3638874wmy.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 04:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lBV/6oNfdY0HH6piNX/pDOkSbw857PaIKvOtxigDknY=;
 b=ZOvCU9Um2mcUX4Y4x01KZbZFUB+O10r0SH9Bt89w9LAjKj21S89K4HQ8UFe8aoh3z4
 psv1uy52e5GoXCbyZfg0M2NM8GD/dyBb8T8TPKfBVK0lRTP07LAf04Pmeep1ZpZkoRDf
 3pMran84ceFG3hiZXh/8gfsudOXOjrVM9vHV85m0CPfxwNjjz98xju1JAB87TcHl5OuB
 XjmwaXs9c98SmwwBxrIhte3c76Lcdtm3VIXZIcJfEYKIN3eM9grWWwCKVnyP4zcvu+F8
 hsgCWjrvOZHkMzmkFCx7cdGNQwtIWqvj1t1BfYRUcznTejeGsVKAjv9M7jq8P1LlOXjw
 0GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lBV/6oNfdY0HH6piNX/pDOkSbw857PaIKvOtxigDknY=;
 b=nnkFthLFvnDTen0OLnywYN2RdTK+ErJUu2M8c4JdR39UbVwTjGIRQ/dROHFQWMmNLC
 +g6pPtlgbElTU61/wlzUSmdgTUCrustFrljDqXqu3tlyQKktS+f0NC/loabv6GDtrc1z
 FxhKSSx+NK0LLHwaf2H1WpcfdlOv8ddmdrMT2yQQHToLtC4oPMP1allqMn6n9NjLj4+W
 uzpxjj2vY5GfNe695R84B5YTw7LT+LVL5GQw9669wQsubqETQc4eSGsQRlDTGks8rhI5
 LRcPM2ZSreYzB1aKmC2xDnJ34pfvnrf/hxVhjyacp79Vi9AOI9wj8fvlkxlVm63ER3V1
 4gOA==
X-Gm-Message-State: AOAM530STRM/5rMfs0rP0WF6nsx71QfnTGl7OOkgxgEts3UK6JS9vm2T
 8yU7GUK+dHOmng6IRfTZj6aD2w==
X-Google-Smtp-Source: ABdhPJypwztWY/cqUIwNtHVgrY8keYhrAI5hQQ7OQMLjsVcx6XccoLJJJisBu8XFYS7QQg9AfmAzyA==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr22599514wmc.185.1615204862643; 
 Mon, 08 Mar 2021 04:01:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f16sm17851709wrt.21.2021.03.08.04.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 04:01:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C18F1FF7E;
 Mon,  8 Mar 2021 12:01:01 +0000 (GMT)
References: <20210307113403.11028-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
Date: Mon, 08 Mar 2021 11:57:28 +0000
In-reply-to: <20210307113403.11028-1-thuth@redhat.com>
Message-ID: <878s6xam83.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
> completely for the repository and will soon use it as its gating CI, too.
> So it makes way more sense if the gitlab-ci.yml files belong to the people
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test and
> build automation" section,

I have no problem with this, might as well keep it all together.

> and change the status of myself to a "reviewer"
> there instead.

Can we not have multiple maintainers? Considering how important keeping
the testing green should be wouldn't it help to keep the bus factor
lower (not to mention holidays/breaks and just plain busy with other
things periods). It shouldn't be to hard to track as long as we mention
when we queue things to our trees?

> While we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26c9454823..e9cd29ed0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
>=20=20
>  Build and test automation
>  -------------------------
> -Build and test automation
> +Build and test automation, Linux Continuous Integration
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> -M: Fam Zheng <fam@euphon.net>
>  R: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +R: Thomas Huth <thuth@redhat.com>
> +R: Wainer dos Santos Moschetta <wainersm@redhat.com>
>  S: Maintained
>  F: .github/lockdown.yml
> +F: .gitlab-ci.yml
> +F: .gitlab-ci.d/
>  F: .travis.yml
>  F: scripts/ci/
>  F: tests/docker/
>  F: tests/vm/
>  F: scripts/archive-source.sh
> +W: https://gitlab.com/qemu-project/qemu/pipelines
>  W: https://travis-ci.org/qemu/qemu
>  W: http://patchew.org/QEMU/
>=20=20
> @@ -3289,17 +3293,6 @@ S: Maintained
>  F: .cirrus.yml
>  W: https://cirrus-ci.com/github/qemu/qemu
>=20=20
> -GitLab Continuous Integration
> -M: Thomas Huth <thuth@redhat.com>
> -M: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> -M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> -R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -S: Maintained
> -F: .gitlab-ci.yml
> -F: .gitlab-ci.d/crossbuilds.yml
> -F: .gitlab-ci.d/*py
> -F: scripts/ci/gitlab-pipeline-status
> -
>  Guest Test Compilation Support
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--=20
Alex Benn=C3=A9e

