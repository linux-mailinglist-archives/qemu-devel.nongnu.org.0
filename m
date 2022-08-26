Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99425A3045
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:02:47 +0200 (CEST)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfXQ-0007Oz-4T
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfVY-0005T9-Qz
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfVV-0002WL-Eh
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzcI89wwWxy9sFZmeDWowB3dSVVwflbh8cj7OtiWFh0=;
 b=ShYqM+5pWecZbcslLjCIqIYIFy82rUCGQIyGMUzfsRSED2q+h9MRCyRjVmQyklYUbx8vwP
 E2xsNZaR54ycCoeGqcQkFr0eSRH1xlt5cQ1eaw8jM2IRNEeUPThNClE7pk8YrwBZ72ltjD
 fmIQZfhIA0+Zjm2foz8EpCUrWbNzoyw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-6J7viUUAOsSyWovbRIe3Uw-1; Fri, 26 Aug 2022 16:00:42 -0400
X-MC-Unique: 6J7viUUAOsSyWovbRIe3Uw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h133-20020a1c218b000000b003a5fa79008bso4512549wmh.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RzcI89wwWxy9sFZmeDWowB3dSVVwflbh8cj7OtiWFh0=;
 b=s1ksZHgVEglnI47itnif3R4k3p88eEA/EKdZ/DlFN/NyxX/HxN2sNXWrA2SdaEmWyN
 75bAFupVE75JoiL0EWrZ3fQgR6e+STciyOcVA/jOj0AXip4lWKLi0Z3uNlR3VJm4Tnd6
 hW62e6++O6wBdf6eP0O9tAeS2YrlMcT89TqQIEfmoU6eLzJ73QXGKGDr52waMIJRj1+O
 pSjLaj8YBmXU3yciaIwgRro4zIKBxsi6AV9FUFfggJtOYnWCr5FwgJRw1bogAjP+S2rm
 VF0xjIAw3aqb6lraRSxEgbqdvfzSUSFTMhXMGcZxm4RoGGaPp3O3+730WPBjkYta8V+D
 ZuWA==
X-Gm-Message-State: ACgBeo3Mwm1/x2QHgozerlYlshMo7HXYxyr97hcu+rBkceKZi18r6CV6
 Z4U/SCTzKXPxoU9KlZZPZyT5JFkjwIL9QJWzPKKl+g9puAhxVowm6VgXRUdmE5m44SULD+Pbw0C
 sQ2uEFoQRvrpZNbY=
X-Received: by 2002:a05:6000:1379:b0:226:a73:434f with SMTP id
 q25-20020a056000137900b002260a73434fmr651639wrz.695.1661544041719; 
 Fri, 26 Aug 2022 13:00:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6rjOL1iWfFzJR9J21K5ElFxoZg1mt8fCDGZ2SXwiKRJ1t13QZjOytSFRAEHrf0+ZOTXWzRQA==
X-Received: by 2002:a05:6000:1379:b0:226:a73:434f with SMTP id
 q25-20020a056000137900b002260a73434fmr651622wrz.695.1661544041479; 
 Fri, 26 Aug 2022 13:00:41 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 j15-20020a5d464f000000b0022526db2363sm554566wrs.30.2022.08.26.13.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:00:41 -0700 (PDT)
Message-ID: <9eb743f5-4985-fb13-3d6b-d2e04f38113e@redhat.com>
Date: Fri, 26 Aug 2022 22:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 03/25] tests/docker: update and flatten
 debian-alpha-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-4-alex.bennee@linaro.org>
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
>   .gitlab-ci.d/container-cross.yml                   |  1 -
>   tests/docker/Makefile.include                      |  1 -
>   tests/docker/dockerfiles/debian-alpha-cross.docker | 12 +++++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 505b267542..802e332205 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -1,7 +1,6 @@
>   alpha-debian-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-alpha-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 9a45e8890b..c565aa5e7b 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -88,7 +88,6 @@ DOCKER_PARTIAL_IMAGES += debian-s390x-cross
>   DOCKER_PARTIAL_IMAGES += fedora
>   endif
>   
> -docker-image-debian-alpha-cross: docker-image-debian10
>   docker-image-debian-hppa-cross: docker-image-debian10
>   docker-image-debian-m68k-cross: docker-image-debian10
>   docker-image-debian-mips-cross: docker-image-debian10
> diff --git a/tests/docker/dockerfiles/debian-alpha-cross.docker b/tests/docker/dockerfiles/debian-alpha-cross.docker
> index 10fe30df0d..4eeb43c78a 100644
> --- a/tests/docker/dockerfiles/debian-alpha-cross.docker
> +++ b/tests/docker/dockerfiles/debian-alpha-cross.docker
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
>           gcc-alpha-linux-gnu \
>           libc6.1-dev-alpha-cross

Reviewed-by: Thomas Huth <thuth@redhat.com>


