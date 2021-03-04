Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B89C32D2A8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:11:33 +0100 (CET)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHmpI-0005Em-DS
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHmns-0004S3-Sb
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:10:04 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHmnq-000354-Pw
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:10:04 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j2so14520619wrx.9
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 04:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kHcAuYSAM8TP6PRzbgSDZMQAcj23wtRSgtlX/M1ArFw=;
 b=LfCoG1LV16wzPtvq9RkgtRT27ijJ4aQ1Xkw7E4yjUTDPngI5bnf19KRUpPmRfz7qKO
 yjzWnw3afwL5LHl2RXIivxN9wz1chGruOzDGtPaDDKSTGwW+PKXxxawEmn6qARyTyl4d
 clXunjQfo+hSkZHe2oIhoz4RLmUsWcYOfujbqndogoZD4hdrLgvGa3z36wie/DSFVe/l
 Ozbb6XONMeaJ799fpuchhwftXjNsEbRy/VJEw/zG0QXYbntLVQAPedABoNlrSGB54dpI
 2tamLjGZjYkLMk5VXH7in62XAzrnj0Uv3KKN7t+oM8aofEI+eWUGX4hJ53nqQ/1dVN5e
 IyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kHcAuYSAM8TP6PRzbgSDZMQAcj23wtRSgtlX/M1ArFw=;
 b=Rp8kZ1A/PQTDLuCA1zYtqg4Nd1WyN9UZnEvmCqIDTFnZRZW8kT2vH8CUldoISmabZ8
 0tCJ28h6+kwhEAjb5XZ5Bae5N8/nLhbXFTfdJJ0G1Hw2Zog6iikL7mu5fLipqIhO0QT7
 Z53sEpmL3fZdgb0IvSarGhR6LD0ATRnbcfAM1RAFIltSH3nd7rznB6oPMadSDb5Wx1pT
 PRPaFMAgTO+p6Tz0ALg8u7mGFonAWomqKQWoNeBK//R+jdS/dLjoZJCdVZ/c3xiImaz8
 5c/YDQBzjqB2oh4PqWTTJDEjW7wWuxlncmKLVPsuk4dIo3f6q7m1GyPgj3vLaNFiG/xH
 Y/rQ==
X-Gm-Message-State: AOAM533qr7rAY8KNDR6IGwj7ozkK1XUqoxPDfeNBMx/nPezwnZduKxwa
 Iiw0jOiVWtZYqmbHcmKgNIUKsw==
X-Google-Smtp-Source: ABdhPJzk6K6xx25e1YqG7Ow4Dg8vo91byCwIQTprfwDgr0u4956sCG9RGXewwoovZ4coWJujeLGRYw==
X-Received: by 2002:a5d:6610:: with SMTP id n16mr3578179wru.399.1614859800886; 
 Thu, 04 Mar 2021 04:10:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j16sm11230747wmi.2.2021.03.04.04.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 04:10:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 414801FF7E;
 Thu,  4 Mar 2021 12:09:59 +0000 (GMT)
References: <20210228222314.304787-1-f4bug@amsat.org>
 <20210228222314.304787-4-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] gitlab-ci: Build Hexagon cross-toolchain
Date: Thu, 04 Mar 2021 12:08:43 +0000
In-reply-to: <20210228222314.304787-4-f4bug@amsat.org>
Message-ID: <875z27glwo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 qemu-devel@nongnu.org, Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Add a job to build the Debian based Hexagon cross-toolchain image.
>
> This image requires a lot of compute time, too much for the common
> shared runners. To avoid having the job to timeout, it has to be
> built with custom unlimited runner. For this reason we restrict this
> job to manual runs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/containers.yml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 7137cc4184d..ed57e02e769 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -103,6 +103,16 @@ armhf-debian-cross-container:
>    variables:
>      NAME: debian-armhf-cross
>=20=20
> +hexagon-debian-cross-container:
> +  <<: *container_job_definition
> +  stage: containers-layer2
> +  needs: ['amd64-debian10-container']
> +  when: manual
> +  timeout: 3h
> +  variables:
> +    NAME: debian-hexagon-cross
> +    EXTRA_FILES: tests/docker/dockerfiles/debian-hexagon-cross.docker.d/=
build-toolchain.sh
> +

We don't really want this - what we need is the ability to run the tests
for hexagon when the registry contains a built container that we have
manually pushed from a build machine:

  https://gitlab.com/qemu-project/qemu/container_registry/1759846

>  hppa-debian-cross-container:
>    <<: *container_job_definition
>    stage: containers-layer2


--=20
Alex Benn=C3=A9e

