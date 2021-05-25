Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874338FE08
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:42:28 +0200 (CEST)
Received: from localhost ([::1]:52598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llTZz-0005Pn-El
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llTYU-0003EG-07
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:40:55 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llTYS-0004xc-7o
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:40:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so6110090wmq.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XvLjqnBVuyjGDhnW1jskQWQOr8FKHBewRRa8thmMlLU=;
 b=jSQ9KaRTzd2KPmdnv+s/gJM1ZMqfYl1Uq8VmLqmnho1N7pHUbLWBAgL9+wX8GvAwqv
 hzqv5QpJKZAlh9MTlhdcO9NJdhI8FVnO+5stqa6+kdc4FqRfcuHdZDYsR14ucbh5DZlY
 DrNhqKVd3IdDAf4ul4+NhMs+wZFHfa4S3aIojFu5L0an7l7RtLvtKgkYfX+1CHYIzlUF
 rMopi4qp9pqPgaGy+yKm9NGU3J0U14rl5kVGxvkCdyRNKPaF6Ecq3FoKUAFWzpeCTOrF
 CKH1h7QFQnIqlVitVtn1jEiBXHTPMPIqddne9E1uevuXQf8c14xVTTFSNgIkG0Kgp+/5
 5kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XvLjqnBVuyjGDhnW1jskQWQOr8FKHBewRRa8thmMlLU=;
 b=hxIpkGJiaTFwY7sPEkSFIcW981nxIwGGy8W9cb8prKl6YMyajNHIfBPDVRZn9pjdMH
 iK86Joy8p3MZRFpcuXq/iKXqvD2fSum5M74P8MZYpnlFfOjAhRrTUqHiHEas4h5FXXHh
 myrAFaPwSn7EqeclCkTxe8uy9g4Ppokia+CfMLrqWCtJ3jRxM1eveKPuKv5mzRhndIp5
 5T6R3TfnFJq4jBuyaKFzRXvTlHazGuzinrx6Q8CdhwRfFbjFte1pKnPwJx7L8jtp2LuO
 8QjK635ua9NeAqsaijjnpmPtbUE6nkK6vHcfNLbRpgaCP+yYz/1xUp5IdE4AzqvLDnga
 Y9zg==
X-Gm-Message-State: AOAM533Akel3kADxgC/sP0n1GHfXXbrIIsQownQzUybjzHTO95n1HC7T
 GAzFRLt84GGKNJdPsyxg298=
X-Google-Smtp-Source: ABdhPJzYfuhetH7N+esew4UCZREub5tYBhB/bbSQMdRdCR2CNQqCAAhRvx0irglq6FMclNea0k1WRQ==
X-Received: by 2002:a1c:b6d5:: with SMTP id g204mr3055359wmf.106.1621935650515; 
 Tue, 25 May 2021 02:40:50 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a123sm2219071wmd.2.2021.05.25.02.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 02:40:49 -0700 (PDT)
Subject: Re: [PATCH v1 3/8] gitlab: add special rule for the hexagon container
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3f5c486a-2f67-8f65-ef7d-5877c69e2399@amsat.org>
Date: Tue, 25 May 2021 11:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 7:42 PM, Alex Bennée wrote:
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
> Tested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> 
> ---
> v2
>   - fix silly typo
> ---
>  .gitlab-ci.d/containers.yml | 27 +++++++++++++++++++++++++++
>  .gitlab-ci.yml              |  2 ++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 3fb3c14f06..088c7e68c3 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -101,6 +101,33 @@ armhf-debian-cross-container:
>    variables:
>      NAME: debian-armhf-cross
>  
> +# We never want to build hexagon in the CI system and by default we
> +# always want to refer to the master registry where it lives.
> +hexagon-cross-container:
> +  image: docker:stable
> +  stage: containers
> +  except:
> +    variables:
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project'

FYI Daniel said we should be consistent and use the 'rules:' syntax:
https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg07308.html

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
>  hppa-debian-cross-container:
>    extends: .container_job_template
>    stage: containers-layer2
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa7..b2f929c758 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -421,6 +421,8 @@ build-user-static:
>  # declared. The image is manually uploaded.
>  build-user-hexagon:
>    extends: .native_build_job_template
> +  needs:
> +    job: hexagon-cross-container
>    variables:
>      IMAGE: debian-hexagon-cross
>      TARGETS: hexagon-linux-user
> 

