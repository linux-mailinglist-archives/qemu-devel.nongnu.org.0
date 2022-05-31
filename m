Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6053893C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 02:21:47 +0200 (CEST)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvpdq-0001WT-Ce
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 20:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpaf-00072G-8I
 for qemu-devel@nongnu.org; Mon, 30 May 2022 20:18:29 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nvpad-0005KN-C4
 for qemu-devel@nongnu.org; Mon, 30 May 2022 20:18:29 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-f3381207a5so4992591fac.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 17:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p+E0+uE2lXtNLKuoVdNN7EHk5K32D3/loaRf0Upgg3k=;
 b=nN5wfyh3X7f4LWPXevZY6t2l+pqY5HiXOlbNPvNYTKfnmu/OzFhIBcZI6oz4XWImXd
 32V6MwNcC0OdVpK6D9zMUJDrHyZBOAeuGh0C5yJmWvLnjiqp5M20hBDyCITSU+pKL6ie
 CW1t1MQdbr68g6EIblws0dA0ApfUuMuOtOeAYGlMj6bSt32pKPkjFEBHisr0G43IYqcL
 06MzHJSbvDLQPeBqlOaBC09pMyP4It45jRHM42/0vsPP4n3qd9BGVYFVml4OB2Sus7cH
 DhUPNHf9dPw7fXlMnKkc79CNrbPgXTYhE4jKwdw3XFc22kB+MMKonLTpooqD9HhQ5N+j
 ljew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p+E0+uE2lXtNLKuoVdNN7EHk5K32D3/loaRf0Upgg3k=;
 b=J80qrnXYMwqRUv49v9JakAuYsbuFq8hPi414XMNq4DWn9ild38wkJMYIgJHmVPvt6J
 p3+/3/rMDdECjQ3zIA231sc6BPaEzyjor6zNNHBWKVzIdltCQaSu4HtkziCaGb5FOQ9A
 qeZLuZw1GFuuLeGzwFAFlvf05WpO66fcujDpX5nKBBmvLYlLgrLNxHn31VUcWiTmXz8w
 /TQ4ywvjlFjQh8b6ThgSNe1vCwqipX3qTbcnGN6QcXTPiJAPbU2EeCu9LXEcjzuximEB
 C6Qf3RZH3hbFDXRybTrc8Omx+oyBI9KorEoVOD+d/mQK5Q2IFtsuFNJyMhJW7hGD+ngf
 b0Mw==
X-Gm-Message-State: AOAM530Ogq25MaTkKM0q2bTeZJCCXOJzQ109J57raBiv3b9fCaInJWZd
 91cG7W9Gw9AW7hOz/XbAq6aY8Oy6pzCFzxVGMEM=
X-Google-Smtp-Source: ABdhPJyFX7aZUnxtr67BuwBeZYCEU0aeulm8VfnsZwb6qld+bJ3ulaFAhym3p1Mg3LG6OdO2xqrgH4eDWL2TzGVHrNU=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr11745560oae.278.1653956306310; Mon, 30
 May 2022 17:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-2-alex.bennee@linaro.org>
In-Reply-To: <20220527153603.887929-2-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 May 2022 10:18:00 +1000
Message-ID: <CAKmqyKNbiZK-WOXKXX2z3-1ofU_V5TRrGL08cohpBfTFoSiUUg@mail.gmail.com>
Subject: Re: [PATCH v1 01/33] .gitlab-ci.d/container-cross: Fix RISC-V
 container dependencies / stages
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 28, 2022 at 1:36 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The "riscv64-debian-cross-container" job does not depend on any other
> container job from the first stage, so we can move it to the first
> stage, too.
>
> The "riscv64-debian-test-cross-container" job needs the debian11
> container, so we should add a proper "needs:" statement here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20220524093141.91012-1-thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  .gitlab-ci.d/container-cross.yml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cr=
oss.yml
> index e622ac2d21..ac15fce9b6 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -125,7 +125,7 @@ ppc64el-debian-cross-container:
>
>  riscv64-debian-cross-container:
>    extends: .container_job_template
> -  stage: containers-layer2
> +  stage: containers
>    # as we are currently based on 'sid/unstable' we may break so...
>    allow_failure: true
>    variables:
> @@ -135,6 +135,7 @@ riscv64-debian-cross-container:
>  riscv64-debian-test-cross-container:
>    extends: .container_job_template
>    stage: containers-layer2
> +  needs: ['amd64-debian11-container']
>    variables:
>      NAME: debian-riscv64-test-cross
>
> --
> 2.30.2
>
>

