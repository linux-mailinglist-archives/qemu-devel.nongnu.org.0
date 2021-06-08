Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0939FF1C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 20:29:03 +0200 (CEST)
Received: from localhost ([::1]:33850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqgTF-0000p4-Qu
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 14:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqgSE-000065-Ly
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqgSB-0001i3-01
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623176873;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHfTrudMUoZAMzDCosQcmPzHw7RNFV/qI6fCAf5nlzQ=;
 b=B55qYVI6Y6m2NyqnmJTxATlP5KVuucInjur3nBdxYPGE4xAIRe/gNHM2tmJE97qobN7vHB
 Jd6n5/bYC/UMTj+5b59Qox48XtJFBWTeT+swCedG3DCio4Ijyd05KKyjxdl4W7gYdzJk8m
 6IcBLDgphu+rkgp+zQn8mOqASa2Fr7U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-mOg6nLQPNUe8T3WCylHWMg-1; Tue, 08 Jun 2021 14:27:50 -0400
X-MC-Unique: mOg6nLQPNUe8T3WCylHWMg-1
Received: by mail-qk1-f197.google.com with SMTP id
 a193-20020a3766ca0000b02903a9be00d619so15636199qkc.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 11:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=oHfTrudMUoZAMzDCosQcmPzHw7RNFV/qI6fCAf5nlzQ=;
 b=VSY0gwNurHf/D+C6QJ02Y5YVJOvM1GXMiYSDQvjMFdKwnYsjrAF3rTM/pqSWz9Josl
 qztNaLn6Nexg9d+OT7PdkWlf3AlYInbfo2LhPen4VZW7irOgPw+iFYiDHp3J6yF6PB69
 jU4IP/z1L0g4tK+1QQgoD9luKfCj2cRqCJ1wXoJNn/chJBLjdpcl0sVT/0etntrMokX+
 zKozsGNV1iOZL6btR5Gjw67dXWhKYGn56Xjtf9cM5olwEQiOokdtzOwM4g6w3Saqan9j
 Jg9um25yih7bBUlVVo7XLlA35zj/5OXhCdZNAlKIN8wxa8Hx8XYjkTTHN5NBrHakpR+e
 ihHA==
X-Gm-Message-State: AOAM530zjKQdwGFRYp9Hqkjz8jU0xgpOVNC3dXvnjT+/uuHxZIZAoZWE
 HBGEisD8b+nGrpkC20Md2kWKQ97BNUySndPihd+BdMBk/Txb+DvaOIgbycKHap+muIn7tX4wdu0
 m2TKn5hOyqo/R/io=
X-Received: by 2002:a37:b404:: with SMTP id d4mr11486301qkf.465.1623176870006; 
 Tue, 08 Jun 2021 11:27:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmyKrJfQYn2Gc66St94CGFGzYNJphCbMFwinrO9W3SZMZRMAH+MTLoFqsZ3+ceKEClzjzREg==
X-Received: by 2002:a37:b404:: with SMTP id d4mr11486270qkf.465.1623176869714; 
 Tue, 08 Jun 2021 11:27:49 -0700 (PDT)
Received: from wainer-laptop.localdomain ([201.90.138.4])
 by smtp.gmail.com with ESMTPSA id b19sm922320qtq.84.2021.06.08.11.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 11:27:49 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <3444dc10-a1a7-a5ff-71df-c3fab2b0aa7d@redhat.com>
Date: Tue, 8 Jun 2021 15:27:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/8/21 12:14 AM, Cleber Rosa wrote:
> The QEMU project has two machines (aarch64 and s390x) that can be used
> for jobs that do build and run tests.  This introduces those jobs,
> which are a mapping of custom scripts used for the same purpose.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
>   1 file changed, 208 insertions(+)
>
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index a07b27384c..061d3cdfed 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -12,3 +12,211 @@
>   # guarantees a fresh repository on each job run.
>   variables:
>     GIT_STRATEGY: clone
> +
> +# All ubuntu-18.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +ubuntu-18.04-s390x-all-linux-static:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'

Should it restrict the job for pushes to qemu-project only? If yes, then 
it probably needs the statement:

'$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'

If you change that here, you will end it changing all over the jobs. In 
general, there are many boilerplates in this file. I'm ok to merge it as 
is as long as it is followed by another series to refactor the code.

> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> + - make --output-sync -j`nproc` check-tcg V=1
> +
> +ubuntu-18.04-s390x-all:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-18.04-s390x-alldbg:
Maybe we don't need both ubuntu-18.04-s390x-all and 
ubuntu-18.04-s390x-alldbg jobs.
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --disable-libssh
> + - make clean
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +ubuntu-18.04-s390x-clang:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-18.04-s390x-tci:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --enable-tcg-interpreter
> + - make --output-sync -j`nproc`
I think it needs to `make check-tcg` at least. See "build-tci" in 
`.gitlab-ci.d/buildtest.yml` for other tests being executed on shared 
runners.
> +
> +ubuntu-18.04-s390x-notcg:
The "build-tcg-disabled" in `.gitlab-ci.d/buildtest.yml` could be 
mimic-ed here too.
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --disable-tcg
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +# All ubuntu-20.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/qemu/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +ubuntu-20.04-aarch64-all-linux-static:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> + - make --output-sync -j`nproc` check-tcg V=1
> +
> +ubuntu-20.04-aarch64-all:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-20.04-aarch64-alldbg:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --disable-libssh
> + - make clean
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-20.04-aarch64-clang:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-20.04-aarch64-tci:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --enable-tcg-interpreter
> + - make --output-sync -j`nproc`
> +
> +ubuntu-20.04-aarch64-notcg:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --disable-tcg
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1


