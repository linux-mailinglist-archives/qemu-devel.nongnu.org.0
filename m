Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2635A304D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:04:58 +0200 (CEST)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfZZ-0001LZ-4I
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfXh-0007wW-EX
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfXf-0002qm-8j
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XF1E9ltGqY2GPUols5GrH9feO8JwOaWwHDyzqmwPwzU=;
 b=gBKgkwf4L+hsvctqWUWp55y4lFWE++ZKz6hcnuXEtarSCHb/U7JO1U5oRQI09TEqKxx1jC
 NakfiZjfmrFqWaZW7XmPB48RdqFXDeyx80vwx78i0O9BLszNS487/xo79aKWyBFd5pexWR
 +UFoHjLPW4gsXdp7qxXBJOOIHw0W/8w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-GIQVqKCRNvqD0wm44KCkuQ-1; Fri, 26 Aug 2022 16:02:57 -0400
X-MC-Unique: GIQVqKCRNvqD0wm44KCkuQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 j12-20020adfff8c000000b002265dcdfad7so274823wrr.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=XF1E9ltGqY2GPUols5GrH9feO8JwOaWwHDyzqmwPwzU=;
 b=p/x2qrzLBGCFKEg7HxsZ7tJ+OWjdU6JqXv3zHdwi9r3cGeHVl1CRxT/tAaGjmB6sHz
 8+mgmtiDuoHZ+rVo5pyvUYLicrjZqMVG84BKP7ujh75iBVzeN/xeO+1JaW/r7OqfzWB7
 0CClQPuKmH5z6jAt5BIovfAfcudSsZpwKL340pExseMGYPyMGFo57d/NuoDZwHGVL9Oo
 X4A02yaXtwz9dLmIk29ElwRH43CSiCs8vR/Xw9OyTWYiwKsycaV1JM+mNCcBRCcOF6dR
 4BCr3I5J3RRQZxmqS4YuX25+2bSg3pOFCfaCXVHD4p2gwmedXpw95K5VnAmvgQGLDCHO
 L3bA==
X-Gm-Message-State: ACgBeo2FYXCOZn65K2R1nl1kl4fQI99mi3c6RqzsLz/nTguMgkHRbG7a
 lAMJpJN0nmBeCNcn5M7EyHAjCkPwopj6YOYH9XcNetUSRZG3PHDeI+0yMF/8D+dg9VRgYG4WoVE
 TucNkb7yDsFOpz3s=
X-Received: by 2002:a5d:514d:0:b0:225:3507:79e6 with SMTP id
 u13-20020a5d514d000000b00225350779e6mr630487wrt.85.1661544176415; 
 Fri, 26 Aug 2022 13:02:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4aFAyB4sQle/coWJHGzcQxagU4WhkZ0HxNe4ea2lVfvea0GKRRDPVUW5ZkXecNA6AhDbobeg==
X-Received: by 2002:a5d:514d:0:b0:225:3507:79e6 with SMTP id
 u13-20020a5d514d000000b00225350779e6mr630474wrt.85.1661544176243; 
 Fri, 26 Aug 2022 13:02:56 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 b8-20020adff908000000b00223a50b1be8sm554357wrr.50.2022.08.26.13.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:02:55 -0700 (PDT)
Message-ID: <2a236f11-0f37-a13c-0fb0-0014d23f7400@redhat.com>
Date: Fri, 26 Aug 2022 22:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/25] tests/docker: update and flatten
 debian-m68k-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/08/2022 19.21, Alex Bennée wrote:
> Update to the latest stable Debian. While we are at it flatten into a
> single dockerfile. We really don't need the rest of the stuff from
> the QEMU base image just to compile test images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml                  |  1 -
>   tests/docker/Makefile.include                     |  1 -
>   tests/docker/dockerfiles/debian-m68k-cross.docker | 12 +++++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 6c1d765463..15a5270f6d 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -71,7 +71,6 @@ hppa-debian-cross-container:
>   m68k-debian-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-m68k-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index e39597d35c..95790e974e 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -88,7 +88,6 @@ DOCKER_PARTIAL_IMAGES += debian-s390x-cross
>   DOCKER_PARTIAL_IMAGES += fedora
>   endif
>   
> -docker-image-debian-m68k-cross: docker-image-debian10
>   docker-image-debian-mips-cross: docker-image-debian10
>   docker-image-debian-mips64-cross: docker-image-debian10
>   docker-image-debian-sh4-cross: docker-image-debian10
> diff --git a/tests/docker/dockerfiles/debian-m68k-cross.docker b/tests/docker/dockerfiles/debian-m68k-cross.docker
> index fcb10e3534..dded71c5d2 100644
> --- a/tests/docker/dockerfiles/debian-m68k-cross.docker
> +++ b/tests/docker/dockerfiles/debian-m68k-cross.docker
> @@ -1,12 +1,14 @@
>   #
>   # Docker cross-compiler target
>   #
> -# This docker target builds on the debian Buster base image.
> +# This docker target builds on the Debian Bullseye base image.
>   #
> -FROM qemu/debian10
> +FROM docker.io/library/debian:11-slim
>   
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt install -y --no-install-recommends \
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    apt-get update && \
> +    apt-get install -y eatmydata && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y \
>           gcc-m68k-linux-gnu \
>           libc6-dev-m68k-cross

Reviewed-by: Thomas Huth <thuth@redhat.com>


