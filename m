Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B368C38E919
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:46:32 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBqh-0005J6-QL
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBgf-0000lA-La
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:36:09 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBgY-0007PZ-Hc
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:36:09 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so11339783pjp.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7EF6HXcaGC6E6NKCYJBnGVWD2yi+oHQBv6KvYqkaGDU=;
 b=qcz2gW81UzyIjX+hWr6IIALFRGUqnZW4l+4QJQC6yMWMBnfl9gvEio4z1ScLECpr2a
 wB1KYPSeediChn8mgig4qEMeQLqOIAiDCA0YaJLI5poj/cjP2OFyD9HUKoGaacZ8O6WS
 lMRP8ScdvlDKEK8p9MBDm1eUzdxIaDuuyG8Bg13oVBD7GWHesIDmk57kbnhU2MxNs0bD
 UMbtkftrlnht8/fFo/F+/1oi/P/IL2A7OeL9yxe14U5cuaoIqkvsr6XBRAu765p8eX2m
 /N8ZqB9GbS61zWohkow0pC7W8zH8paRMWPliRrumx3ChUrm4QHgD7IvhqxNfSY3LQb/O
 dpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7EF6HXcaGC6E6NKCYJBnGVWD2yi+oHQBv6KvYqkaGDU=;
 b=L/aYjitNEzcQujP0FgCbx73qU0CMB9Oknx7XbOF+nRXWIMZ9xb/tz8ndTPBtz3PN5K
 yF27LQiInRfn/DIysSueT4Er9YIe2vzVJxUxz7Pb3YV3+iQ2OpqHa9+IlLugQvOdC555
 OMAbuBKrb/6+E/Mhiq2yydTRHhwHltyfS5+ygfoxkYXFxpbQ3hLWYig+VHlV5O+iBF+J
 iOWQ/s7sMS5598QJf/fTvYqzwbwySTbVXhKFQ8scvvbF65xvcwA4go6zbCMYzr5V45v9
 BhMNn7qVvp8q/N5Ls9RcDAwLJM4dYFJy/3WL+7jZh22q0cqVypqiAJb1mopf+6Aewbqz
 cGSw==
X-Gm-Message-State: AOAM533pJZUHJcmuh0L2WIdRVqLi6u4Nukgruyc0hOdqrzDbby5rIZmm
 amzYOT4qY9puPnhnghRUeQ0B/A==
X-Google-Smtp-Source: ABdhPJzV2YLzqkH+knptOw0QdbzDotFAjLNNB+3T3kxEB0Hl5V9nmHDzIe/GXz0dymBXh1EJYLOMng==
X-Received: by 2002:a17:902:e88f:b029:f6:1818:33c4 with SMTP id
 w15-20020a170902e88fb02900f6181833c4mr23046595plg.8.1621866960809; 
 Mon, 24 May 2021 07:36:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 cv24sm11020744pjb.7.2021.05.24.07.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 07:36:00 -0700 (PDT)
Subject: Re: [RFC PATCH] gitlab: add special rule for the hexagon container
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520151924.5063-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb50c468-83d2-516f-adaa-ec7941ab0f8a@linaro.org>
Date: Mon, 24 May 2021 07:35:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520151924.5063-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Cornelia Huck <cohuck@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:19 AM, Alex Bennée wrote:
> The hexagon container is always manually built but of course not
> everyone will be building it themselves and pushing to their
> registries. We still need to create a "local" registry copy for the
> actual gitlab tests to run. We don't build it in this case, just pull
> it across from the upstream registry. We disable this rule from
> running on the qemu-project itself so it doesn't accidentally wipe out
> our master copy.
> 
> Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> ---

I get

Found errors in your .gitlab-ci.yml:
jobs:build-user-hexagon:needs config uses invalid types: bridge


r~


>   .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
>   .gitlab-ci.yml              |  2 ++
>   2 files changed, 29 insertions(+)
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 3fb3c14f06..088c7e68c3 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -101,6 +101,33 @@ armhf-debian-cross-container:
>     variables:
>       NAME: debian-armhf-cross
>   
> +# We never want to build hexagon in the CI system and by default we
> +# always want to refer to the master registry where it lives.
> +hexagon-cross-container:
> +  image: docker:stable
> +  stage: containers
> +  except:
> +    variables:
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project'
> +  variables:
> +    NAME: debian-hexagon-cross
> +    GIT_DEPTH: 1
> +  services:
> +    - docker:dind
> +  before_script:
> +    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> +    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
> +    - docker info
> +    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
> +  script:
> +    - echo "TAG:$TAG"
> +    - echo "COMMON_TAG:$COMMON_TAG"
> +    - docker pull $COMMON_TAG
> +    - docker tag $COMMON_TAG $TAG
> +    - docker push "$TAG"
> +  after_script:
> +    - docker logout
> +
>   hppa-debian-cross-container:
>     extends: .container_job_template
>     stage: containers-layer2
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa7..a04cca9db0 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -421,6 +421,8 @@ build-user-static:
>   # declared. The image is manually uploaded.
>   build-user-hexagon:
>     extends: .native_build_job_template
> +  needs:
> +    hob: hexagon-cross-container
>     variables:
>       IMAGE: debian-hexagon-cross
>       TARGETS: hexagon-linux-user
> 


