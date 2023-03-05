Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79D66AB38D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 00:43:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYy0d-00008H-CG; Sun, 05 Mar 2023 18:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYy0Z-00007i-C1
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 18:43:15 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYy0X-000730-0r
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 18:43:15 -0500
Received: by mail-pl1-x62b.google.com with SMTP id h8so8395563plf.10
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 15:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678059791;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=yIh1lN+9dkH89Si6XgS1D9s5qWnDOWjVZhmy/Se/BVg=;
 b=CL1SrI+KTUaFE9ErX0FGLdJiQHw7Ytc+s0i18mpguULi+LwP3zU+tz+QMIoZYsVbtg
 GnflsIIob0GhvluDvGZ+Hnk6VXJNNDLYfKVtTxh90QCuzwrx6/izAC3kBy0StqnaD4H0
 DEvzR8ImTTfef3dH1A3qkoHlIbXNFgmcw0Egu8S+8x7CG0h70+Zc1eclbKyOJ7Y72yQ6
 VEMVDYaTAEfLXsGZmEKivJ6zmUrzPYOxfx4FPtnlUpJp5R1wy8e5mIUScpqL1njlqyyQ
 XRP45yzr/06IwqbkN60hW/+YeaiPV1oufejFM4kY+UYk+hZcg2u0/8TCdueleAt6wJ6F
 7HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678059791;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIh1lN+9dkH89Si6XgS1D9s5qWnDOWjVZhmy/Se/BVg=;
 b=isqyka3+64Q3+/lncutRgvIzijHWf3VQJ4/z9x0OW43WmCEc4bbbUnctc1zOtgm58t
 IjCC1vAeoPCm3U4ANHFYdRM5nIkGQpxPwlAFabIkaeEDzjvyiCsAz/7pW1v8kKPaN5Q0
 Oz8XPWoNVqtXs2gq4iUlKOWaR5x1BUoqhJ0mhHkhdrUhmFowTTt7ILNxTylKNHtUXfBi
 HBasrIhnwJ3Qlw9vSgEcZ8MIIWdJEnJzLjrbpRTLdtNAE0M2vJ3Lj266xLhYBvHJWhSM
 wCmlnXBAkbdgMRGrGeZ4x2YGbOcqzi0MvzIuualcaYT5fYTV89FzcmFP9+1zrut6iGnw
 NBsg==
X-Gm-Message-State: AO0yUKVcFQNS0KuUKeyXnDe2qd4WeQcS+p1qI2nPPpAXDRGuW9DyojaM
 kOWhuEmqnsby0dkcsH52nBYPnCd+4DFT0e76qe8=
X-Google-Smtp-Source: AK7set9avzaQ5XfCyzAUNbK9LDxodchHbhHbadhVIKQHslIiAb8J6no0UILnjxkTUDzwf+c/rteKag==
X-Received: by 2002:a17:902:c946:b0:19c:1433:5fba with SMTP id
 i6-20020a170902c94600b0019c14335fbamr11225704pla.0.1678059790718; 
 Sun, 05 Mar 2023 15:43:10 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001898ee9f723sm5289843plh.2.2023.03.05.15.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 15:43:10 -0800 (PST)
Date: Sun, 05 Mar 2023 15:43:10 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 15:42:20 PST (-0800)
Subject: Re: [PATCH v2 1/2] gitlab/opensbi: Move to docker:stable
In-Reply-To: <CAEUhbmXVqJ3RnTk7OGquR-ChCSWJ8NmOGeo6kUmoFhipofm7tQ@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <mhng-94876e10-142c-43de-bfa9-774e398cc502@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 03 Mar 2023 15:28:14 PST (-0800), Bin Meng wrote:
> On Sat, Mar 4, 2023 at 4:25 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The OpenSBI build has been using docker:19.03.1, which appears to be old
>> enough that v2 of the manifest is no longer supported.  Something has
>> started serving us those manifests, resulting in errors along the lines
>> of
>>
>>     $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
>>     Step 1/7 : FROM ubuntu:18.04
>>     18.04: Pulling from library/ubuntu
>>     mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'
>>
>> This moves to docker:stable, as was suggested by the template.  It also
>> adds the python3 package via apt, as OpenSBI requires that to build.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  .gitlab-ci.d/opensbi.yml        | 4 ++--
>>  .gitlab-ci.d/opensbi/Dockerfile | 1 +
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
>> index 04ed5a3ea1..9a651465d8 100644
>> --- a/.gitlab-ci.d/opensbi.yml
>> +++ b/.gitlab-ci.d/opensbi.yml
>> @@ -42,9 +42,9 @@
>>  docker-opensbi:
>>    extends: .opensbi_job_rules
>>    stage: containers
>> -  image: docker:19.03.1
>> +  image: docker:stable
>>    services:
>> -    - docker:19.03.1-dind
>> +    - docker:stable-dind
>>    variables:
>>      GIT_DEPTH: 3
>>      IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
>> diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Dockerfile
>> index 4ba8a4de86..2d151a6bc8 100644
>> --- a/.gitlab-ci.d/opensbi/Dockerfile
>> +++ b/.gitlab-ci.d/opensbi/Dockerfile
>> @@ -16,6 +16,7 @@ RUN apt update \
>>          git \
>>          make \
>>          wget \
>> +       python3 \
>
> nits: this should be inserted before wget to follow the alphabetical order

Thanks, I just squashed that in and stuck these on riscv-to-apply.next.  

>
>>      && \
>>      \
>>      rm -rf /var/lib/apt/lists/*
>> --
>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

