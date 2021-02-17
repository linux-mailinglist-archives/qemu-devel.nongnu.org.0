Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8A31D932
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:11:10 +0100 (CET)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLfh-0007di-Hi
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLdn-0006zw-WB
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:09:12 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLde-0005iu-DY
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:09:11 -0500
Received: by mail-wr1-x432.google.com with SMTP id l12so17190719wry.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=e1r3v972+5P4lxSnhfQ/hKduE7/Cz8KgTGbmgCjofik=;
 b=iTsfq6N3iHA+a1UEQ+97ZsdiUJXt8kC8ADNQ6lqzI4pWcC8kmeERZeV85xvVAAYIT9
 peUgkD3A+527dOFoiErJFec7JyPwgF3eCPurV8ablu2/XsH0UImy61SwUs0b8QG/tclG
 S3mSRjSmvDOUGSm3YGDScray2kXOOa2mEp0MZcFGcvS6LsRVndDtO1AWap3EJu81EcO6
 8eDj+XJIN7HQw6ALr3pxErgrjrXtuvPx+QFJZKtpPMS75KeX26yM1UhEZLunq0DEvwJT
 nY0iKHod1ub5pVb6W7zF/Xt6m3B6XChQvNc6UFLKTCkUZ9lqfQTVwmUlmXWGL4ikNuH4
 FUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=e1r3v972+5P4lxSnhfQ/hKduE7/Cz8KgTGbmgCjofik=;
 b=bvD+EVw8R3FN1sAveVDBovkiIChiDANafvY4Kr28OmVpzRPDZcfj43jChAz6CAUFWa
 LvmYLzQxVQ0yRvndq2XELxbPr3QWteVb0+RUK/cZ303fqfRbb/59oXChgOLpRU+yjUeb
 9dxyfrQGtnmQrWkm6qhJflmwChVhhtEaI8klMCx8gd+6iEY9NPHhoHPdflB42yAixRaH
 pSDsopXPqi8m2DuKJrmEqnN65KEtAY7/lgfDYoMd/D0tYZjlJxzqBtyWnHVz71KW4seJ
 1JwAgW3mEnQmgawu3d/87jBvA95NHb19IiowwtthzGQRCw33eWls7ecldjJ6V3fF5oj9
 qQTw==
X-Gm-Message-State: AOAM533m08NN7JH2dQVs9ok2X/0Eg0hXz1vSMJ0NJsw4vHsM+FwK5TOU
 JkyZLFi0G22LYqoXMkwm7fnNUDmH77Oq0A==
X-Google-Smtp-Source: ABdhPJx9lwfHf36FjobP6ygVOOeDLwelxI7kbsMuUaLonZ9D9rxNLw/UutVsaIngM7j7W2X/Bx+a+Q==
X-Received: by 2002:a5d:4583:: with SMTP id p3mr29546527wrq.305.1613563739204; 
 Wed, 17 Feb 2021 04:08:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm3790202wmg.41.2021.02.17.04.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:08:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2783A1FF7E;
 Wed, 17 Feb 2021 12:08:57 +0000 (GMT)
References: <20210127055903.40148-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.yml: Run check-tcg with TCI
Date: Wed, 17 Feb 2021 12:08:43 +0000
In-reply-to: <20210127055903.40148-1-thuth@redhat.com>
Message-ID: <877dn6uc9y.fsf@linaro.org>
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> It's now possible to also run the non-x86 TCG tests with TCI.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

> ---
>  Based-on: 20210126192518.2019885-1-sw@weilnetz.de
>  CI-run: https://gitlab.com/huth/qemu/-/jobs/988742434#L5200
>
>  .gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index de3a3d25b5..19602f4319 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -475,7 +475,7 @@ build-oss-fuzz:
>  build-tci:
>    <<: *native_build_job_definition
>    variables:
> -    IMAGE: fedora
> +    IMAGE: debian-all-test-cross
>    script:
>      - TARGETS=3D"aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390=
x x86_64"
>      - mkdir build
> @@ -483,7 +483,6 @@ build-tci:
>      - ../configure --enable-tcg-interpreter
>          --target-list=3D"$(for tg in $TARGETS; do echo -n ${tg}'-softmmu=
 '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
>      - make -j"$JOBS"
> -    - make run-tcg-tests-x86_64-softmmu
>      - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qte=
st/pxe-test
>      - for tg in $TARGETS ; do
>          export QTEST_QEMU_BINARY=3D"./qemu-system-${tg}" ;
> @@ -492,6 +491,7 @@ build-tci:
>        done
>      - QTEST_QEMU_BINARY=3D"./qemu-system-x86_64" ./tests/qtest/pxe-test
>      - QTEST_QEMU_BINARY=3D"./qemu-system-s390x" ./tests/qtest/pxe-test -=
m slow
> +    - make check-tcg
>=20=20
>  # Alternate coroutines implementations are only really of interest to KV=
M users
>  # However we can't test against KVM on Gitlab-CI so we can only run unit=
 tests


--=20
Alex Benn=C3=A9e

