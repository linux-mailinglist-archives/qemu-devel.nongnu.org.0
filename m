Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAB52DC3F0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:22:10 +0100 (CET)
Received: from localhost ([::1]:45008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZZ3-0003oC-H9
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZWu-0001xO-Hp
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:19:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZWs-0006Sn-Mm
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:19:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id q18so16237102wrn.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NZu5bw3IUBTSMTVQ9xxZ3UQaYvaV750g3pX6MW8abSY=;
 b=dy28pI/mWHdtET6rvvM5iJK4NyJI+FlhTOqAxXyAwyJz98907w9IE3eBm8jT/uB3j8
 VbRk0YfkJt8zioWz4kgyLgWR6gdoe0RqmT70YSwKizdmH3P+WY3kJim0m/PFl6Ypuf2x
 ThiYqkbBbIOGLczDUh5NkiG1lKItydEXN0TQqjYl68znVWnVofIkk4XOOxry5OxBVR6K
 JGYpD4aKyAh5lQ6rWq2ycDCf+FuNlbZJa9air5mp0Liqrz/U4UYQE8tzf+bao1DJ+/lm
 kalaLWQALpJJ+U1607R5FR91HCCJuNJR7BBCGbBbY0ijn/TR1OPquv0fxuLTFENl4pur
 l5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NZu5bw3IUBTSMTVQ9xxZ3UQaYvaV750g3pX6MW8abSY=;
 b=pjorIxaxZ+JJbRqDuKDN8spxMswm9Faf3infK/uvRi59ELOwvlxjiuRyiqCwbBxVxz
 gSFRAMRKytTqamKcrxV2+OVAvROYMGjSogNJstPkrz+tVjXZiTZcDHoos6OZHw/eb3ES
 8XqvAjpMIjkQMRG2BXFFnWyS4hRAVz+i4S1nTSC7Cl1/cJc3qUSK7KMk21KghLhfF0RZ
 AkMEEk5OD5t0/reXyJScvTtwsfXESkVBKvgF9xlI/953Ag+lE5UEizD0fpWBWiav7vxh
 xM1LGMU/xtK7xzwpizi5FkWvehkuZXvVZ+L+ECm230vUexFJecQt3K4Ee3XFqaRUqC2U
 0hgQ==
X-Gm-Message-State: AOAM531bgkxjyUJiD+BELvdlWWg72Bf0jpjpBcJgeR53o31GnVKmW03h
 9J5dYGzCZv9bStxVQaCaNR86kw==
X-Google-Smtp-Source: ABdhPJxU0+GQCoICGneJ0ozw77MV5J+UxSgEvoPWfqf0ytZ1AZWz7TGC5eG3NClsHC1z9xf5ullLjA==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr39955710wrv.51.1608135593153; 
 Wed, 16 Dec 2020 08:19:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm3282212wmi.15.2020.12.16.08.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:19:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C38A1FF7E;
 Wed, 16 Dec 2020 16:19:51 +0000 (GMT)
References: <20201216141653.213980-1-berrange@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] tests: update for rename of CentOS8 PowerTools repo
Date: Wed, 16 Dec 2020 16:19:39 +0000
In-reply-to: <20201216141653.213980-1-berrange@redhat.com>
Message-ID: <87r1npsoyg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

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

Your in luck, Queued to pr/161220-testing-1, thanks.

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
>=20=20
>  RUN dnf install -y dnf-plugins-core && \
> -  dnf config-manager --set-enabled PowerTools && \
> +  dnf config-manager --set-enabled powertools && \
>    dnf install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt


--=20
Alex Benn=C3=A9e

