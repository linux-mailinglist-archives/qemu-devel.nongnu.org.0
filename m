Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD43502E1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:02:04 +0200 (CEST)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRcM4-0001Kp-R5
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRcKL-0000Pg-Ah
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:00:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRcKF-0008CK-88
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:00:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id v11so19963950wro.7
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZpSFD8QWrF9DNzcvqvRwi3dlIiL0WuqLY3OuVcHkS5w=;
 b=mZaWErJ/u91fbB8BYIMX3/T4mvSQeFbPpW02LhpwXcp+OUnETKJq+fJ//c4mrYa+yO
 2NyXhGHvz8RgNnfhnB4hdN7D9tDvnSPVQfPUa1cLTVKodzo1hFXIJrNvbAyt9QctprjN
 91ZWnmuegE/xez6Z/V0EnR1u2Xxae+RA29QIjGAgij/WL/nZ6SdpRAJ8ybzOlmzKObp7
 mGG2SULDdQ/lSaS3E8za19sBhIKdeV1SpswcUlETX253a4AWPvutcUgi1FKZw/OiPb1q
 f41m9z1n4cAE7zkLbzonWViopO9fZJIb1m77k/YbHGkFpf9k0O9lUuYd9sURYWACReSz
 7/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZpSFD8QWrF9DNzcvqvRwi3dlIiL0WuqLY3OuVcHkS5w=;
 b=drvQc/3tE2mfkGtOAgmXlghjzzdLpv4s0ElYY5zrgAxGRMQvsFGbdqAuWNmZgL7Tti
 vMy5EgINmP5Umzp6qHk/UL/unnuCLNUBtf6ZFXbOunEiQtgAfVw4K8S37HS3jNULGkEJ
 mPJOEYI7t3udUO78cej29JiChkxp9vgGgatq27CW0zo3tlaMrLlO5D/3e2iB9YPbEV2M
 uUv/JeO8oCX3FNNObFYtzr8l3TujGrnUBY/GcPtRXxo+kpIDM9iHIKy+QUq7AkoyT7wR
 y8ppuVT09UbdOgcCPKJEck/5HBJmEDW7FyW/8x8U6fU6bwK5tWUMgZ33YVpt3WXpcfAq
 wrug==
X-Gm-Message-State: AOAM531+iE6hLiw9v5TCyuHpursOCM3vc4H3ZkxUVrw1R4uw9gW/3M/U
 uEfeD4oO8eawTcyMa8txJKSkpg==
X-Google-Smtp-Source: ABdhPJwMICGrfIKpNxew9h26AKw2geCJDBacgIvwjwJrxPMHrAhDzoe5P8pLUvphlCQPEc2wW1SG5Q==
X-Received: by 2002:a5d:570b:: with SMTP id a11mr4154885wrv.281.1617202805351; 
 Wed, 31 Mar 2021 08:00:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm4986252wrq.74.2021.03.31.08.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 08:00:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B6AF91FF7E;
 Wed, 31 Mar 2021 16:00:03 +0100 (BST)
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-3-alex.bennee@linaro.org>
 <e1db2987-b9d2-c4a0-d96e-441c182a6c5a@amsat.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 2/6] tests/docker: don't set DOCKER_REGISTRY on
 non-x86_64
Date: Wed, 31 Mar 2021 15:57:27 +0100
In-reply-to: <e1db2987-b9d2-c4a0-d96e-441c182a6c5a@amsat.org>
Message-ID: <87h7krnzbg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi Alex, Willian,
>
> On 3/29/21 1:02 PM, Alex Benn=C3=A9e wrote:
>> Currently our gitlab registry is x86_64 only so attempting to pull an
>> image from it on something else will end in tears.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/docker/Makefile.include | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.inclu=
de
>> index 7cab761bf5..9f464cb92c 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -16,7 +16,10 @@ DOCKER_IMAGES :=3D $(sort $(notdir $(basename $(wildc=
ard $(DOCKER_FILES_DIR)/*.doc
>>  DOCKER_TARGETS :=3D $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
>>  # Use a global constant ccache directory to speed up repetitive builds
>>  DOCKER_CCACHE_DIR :=3D $$HOME/.cache/qemu-docker-ccache
>> -DOCKER_REGISTRY :=3D $(if $(REGISTRY),$(REGISTRY),registry.gitlab.com/q=
emu-project/qemu)
>> +ifeq ($(HOST_ARCH),x86_64)
>> +DOCKER_DEFAULT_REGISTRY :=3D registry.gitlab.com/qemu-project/qemu
>> +endif
>> +DOCKER_REGISTRY :=3D $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGI=
STRY))
>
> I remember we chatted about Docker multiarch on IRC.
>
> It doesn't look going into the right direction. IMO the problem
> you are having is because we push an amd64 docker image into the now
> multiarch namespace, so it is obviously failing on all non-amd64 hosts.
>
> I think the correct way is to remove the images stored in the multiarch
> namespace (they are amd64, not multiarch); and store the amd64 images
> under the amd64 namespace.
>
> IOW prepend amd64/ in our amd64 specific images.

I agree we should fix this properly but I don't think it's worth the
churn on the run up to release. ATM we don't really test building on
other architectures (qemu or tests) except manually. This step makes it
a little less painful. Once we actually have the non-x86 runners going
we can then start working out how to get them to push properly to the
registry and revert this change.

>
> Then you could push a aarch64 image using the arm64v8/ prefix namespace
> and the buildsys machinery will work with the registry.
>
> FWIW I tested it with mips64le/ prefix on the mips64le runner.
>
> Willian, can you have a try with ppc64le/ (eventually s390x/) prefix
> for similar hosts?
>
> Related info:
> https://github.com/docker-library/official-images#architectures-other-tha=
n-amd64
> https://github.com/docker-library/official-images#multiple-architectures
>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e

