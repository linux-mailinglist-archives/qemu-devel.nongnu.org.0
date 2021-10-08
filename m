Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077DE426CDC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 16:42:21 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYr4i-0007jJ-9p
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 10:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYr3k-000704-DE
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 10:41:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYr3i-0006ew-Ik
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 10:41:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so9549069pjb.5
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=seVKogE/xQwT0R078Ra+cwyqo5KMptuW2fhf2+5MUt4=;
 b=iQ6QFxHUGd5YEfA/X7+SKplM+2UGJDu+nmB2DcrUzdbakyFvt8G+wZsrdAz696UbG8
 0LpwKF2xoZN+BPsjwLlF1gH5ZLGfLn5dUbVb+XPUaRuf/ueOzJgBbrD7KVmGeePOMt4X
 K7sYYwFan3e2mmj9oz5zeapLW+lnmnMOn45eeUgFixaHmQKmyDesheZLb1B/B14QeygR
 DIcBC1+k/KhgK5RA2/kS9HSVbBl40rLFKB1sh/bZJbu83LbKAsw4lEfZ2PIj+cJ1eeLP
 XawMZJ4J/dYdQROhyZG6DhaMCy1inuKCFh8kxA3oY0m3gB5o+HwUVnAHtR2tLKVkoh+k
 xjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=seVKogE/xQwT0R078Ra+cwyqo5KMptuW2fhf2+5MUt4=;
 b=je9nX2D5j+y9V63rPAP2drJALBih5BN4XS6CtG7ZusQsJ/5qYnBkv69KAUDqmpzE6s
 H7jf1arDVOAVgkhP/AnwjNTmGCgYJNBW8sWBCyN4AgTP4mNdkOiI6BaYm4H5Jud6dO7L
 ezQx61WNZPcL5PmEix6alwE0mkdFXUTvwrZtdoc9FpQlGANUHl8uUsjT1MK2JQrEiCDo
 A0pXBmAGfL3tXwgQnn6V0j60zSgUrHtyiEd3VC96ro+9iMaICab3U1EecvFtdQCYER+a
 s0iSfxNAt9mhsj4BFhPDUr7FnJBmwjPyYxwdYFBHesUIziTrzW6jG6PJhcpWfAMANkWm
 xu4A==
X-Gm-Message-State: AOAM530J82y9Xn8TrGDaLo81bxe7sScGsx2sUrNrvwDln9+fKPFhwwNL
 swax0trNxveYw4WLSQDzHNgXMqbIkdUaWg==
X-Google-Smtp-Source: ABdhPJwxgTL4k0+Fg1loR/WB70urpYwGbr9f709l/94P7OBBtlAvpLf+/RNg6UiX4S0QYbJ69E5PBw==
X-Received: by 2002:a17:90a:8807:: with SMTP id
 s7mr2355798pjn.226.1633704072619; 
 Fri, 08 Oct 2021 07:41:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id js18sm2634745pjb.3.2021.10.08.07.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 07:41:12 -0700 (PDT)
Subject: Re: [PULL 00/12] some testing and plugin updates
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c22a0b4e-e679-6b00-018f-161611685fb8@linaro.org>
Date: Fri, 8 Oct 2021 07:41:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 5:25 AM, Alex Bennée wrote:
> The following changes since commit 14f12119aa675e9e28207a48b0728a2daa5b88d6:
> 
>    Merge remote-tracking branch 'remotes/vsementsov/tags/pull-jobs-2021-10-07-v2' into staging (2021-10-07 10:26:35 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-for-6.2-081021-1
> 
> for you to fetch changes up to 755c4aefd86f8b8eda1eb37f20024765c70ebbcb:
> 
>    tests/docker: add a debian-native image and make available (2021-10-08 12:55:27 +0100)
> 
> ----------------------------------------------------------------
> Some testing and plugin updates:
> 
>    - don't override the test compiler when specified
>    - split some multiarch tests by guest OS
>    - add riscv64 docker image and cross-compile tests
>    - drop release tarball test from Travis
>    - skip check-patch on master repo
>    - fix passing of TEST_TARGETS to cirrus
>    - fix missing symbols in plugins
>    - refactor plugin instruction boundary detection
>    - update github repo lockdown
>    - add a debian-native test image for multi-arch builds
> 
> ----------------------------------------------------------------
> Alex Bennée (7):
>        configure: don't override the selected host test compiler if defined
>        tests/tcg/sha1: remove endian include
>        tests/tcg: move some multiarch files and make conditional
>        tests/docker: promote debian-riscv64-cross to a full image
>        accel/tcg: re-factor plugin_inject_cb so we can assert insn_idx is valid
>        .github: move repo lockdown to the v2 configuration
>        tests/docker: add a debian-native image and make available
> 
> Daniel P. Berrangé (2):
>        gitlab: skip the check-patch job on the upstream repo
>        gitlab: fix passing of TEST_TARGETS env to cirrus
> 
> Lukas Jünger (1):
>        plugins/: Add missing functions to symbol list
> 
> Richard Henderson (1):
>        gitlab: Add cross-riscv64-system, cross-riscv64-user
> 
> Thomas Huth (1):
>        travis.yml: Remove the "Release tarball" job
> 
>   configure                                          |   6 +-
>   include/tcg/tcg.h                                  |   6 -
>   accel/tcg/plugin-gen.c                             | 157 +++++++++++----------
>   tests/tcg/multiarch/{ => libs}/float_helpers.c     |   2 +-
>   tests/tcg/multiarch/{ => linux}/linux-test.c       |   0
>   tests/tcg/multiarch/sha1.c                         |   1 -
>   .github/lockdown.yml                               |  34 -----
>   .github/workflows/lockdown.yml                     |  30 ++++
>   .gitlab-ci.d/cirrus.yml                            |   2 +-
>   .gitlab-ci.d/cirrus/build.yml                      |   1 +
>   .gitlab-ci.d/container-cross.yml                   |   3 +-
>   .gitlab-ci.d/crossbuilds.yml                       |  19 +++
>   .gitlab-ci.d/static_checks.yml                     |   2 +-
>   .travis.yml                                        |  23 ---
>   plugins/qemu-plugins.symbols                       |   3 +
>   tests/docker/Makefile.include                      |   6 +-
>   tests/docker/common.rc                             |  10 +-
>   tests/docker/dockerfiles/debian-native.docker      |  49 +++++++
>   .../docker/dockerfiles/debian-riscv64-cross.docker |  46 +++++-
>   tests/tcg/multiarch/Makefile.target                |  15 +-
>   tests/tcg/x86_64/Makefile.target                   |   4 +
>   21 files changed, 263 insertions(+), 156 deletions(-)
>   rename tests/tcg/multiarch/{ => libs}/float_helpers.c (99%)
>   rename tests/tcg/multiarch/{ => linux}/linux-test.c (100%)
>   delete mode 100644 .github/lockdown.yml
>   create mode 100644 .github/workflows/lockdown.yml
>   create mode 100644 tests/docker/dockerfiles/debian-native.docker

I'm seeing:

   TEST    threadcount-with-libmem.so on s390x
**
ERROR:../accel/tcg/plugin-gen.c:795:plugin_gen_inject: assertion failed: (insn_idx >= 0)
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
timeout: the monitored command dumped core
Segmentation fault

on the build-user job.

https://gitlab.com/qemu-project/qemu/-/jobs/1662530140


r~


