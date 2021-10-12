Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9842A8C3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 17:49:15 +0200 (CEST)
Received: from localhost ([::1]:33148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maK1h-0001qc-R6
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 11:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maK0P-00017m-TY
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:47:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maK0K-0007tG-Kc
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 11:47:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so2902575pjb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 08:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ugA81lw5mza9utQYdH6DtYNg3BDdfZD8/GbpuZNM9v8=;
 b=ee+VhC1Cl4KrjGGaJO0fr/AFFXk2d9XKWcd6txiOqDpwTPjrp7tcPk+rMc/0Ynddbv
 s+OBelN1q5WwJGhk4pXXkh0fB6VNpJkrCRwzOsZWOvccSL9jObW1g/TzoL+Av1xpvtsK
 aadv0UxL6oJOACU4a4zI1FPVUVLYIQEoxott23t5OXPMD+OMToqpWkU7DoqV17BsKYUZ
 TrrrPbhoadGNiwqz2wQ141BiAk0oXbAyIJaIv0gZQr6kqSBM+SU76Q6kNrXD1t82ICr8
 hZPamzv3HIn62sg3nH+B9XGdAiihIivPX2UGyZs3L8/wM5TC4vmuWSGlR37h2nbuj8r9
 d0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ugA81lw5mza9utQYdH6DtYNg3BDdfZD8/GbpuZNM9v8=;
 b=QQBNE8+CX7vECxmnxOjgSVWklWDO8tIBvf2cQ+S9hNt7oM4D+H7td88tel1c1cllFK
 XpdMm+vntEFCKnw5wyX09RoEQnNBG8Jwum7kl5C0miwGOg+WjrBHwVZ2g+Kroy4sTM03
 N6GE49EfpT2zkXGsDmCsM97qg8OZtuORJzEjLlDvWGuEnWWneMXWKOZpXxp7d9LHNzWV
 fasGlm5k8uzvCwTcalosNerM7SPpl4KyTGmAIDNa1Z0ar/ldlI8WmoTDgoEXRj5tOdd+
 jqLtWc4F5XmjyruabXQkO5mL745LA1q66vQeL+2YxTeCF3FJaj5E65lSLPth5Ju2FIkH
 8oIA==
X-Gm-Message-State: AOAM533gdNRA0YTI4ceubGTVJToNvuWHcFEWUT8bWQXAuy6SDJ/lapnl
 tBqSDoIZ2DKlUpMUlpXpht/7bSXmBayV2w==
X-Google-Smtp-Source: ABdhPJx6h/0e1hh2KBntIdFTExENEqNCXwdLi7ryY+Gudv7Yt/1ABmoDAxWxwr7X1MPDlJ1qri48eA==
X-Received: by 2002:a17:90b:8a:: with SMTP id
 bb10mr6886852pjb.149.1634053666994; 
 Tue, 12 Oct 2021 08:47:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p17sm3240803pjg.54.2021.10.12.08.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:47:46 -0700 (PDT)
Subject: Re: [PULL v2 00/13] some testing and plugin updates
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211012093618.3914052-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b20c744-56c4-6f21-03c3-c598da698aa5@linaro.org>
Date: Tue, 12 Oct 2021 08:47:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012093618.3914052-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 10/12/21 2:36 AM, Alex Bennée wrote:
> The following changes since commit c09124dcb8401a0d635b4a52b295e9b3fc12392a:
> 
>    Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2021-10-11 08:15:32 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-for-6.2-121021-2
> 
> for you to fetch changes up to 17888749ba0fb06694de5efe0b941f16a0fba6fa:
> 
>    tests/docker: add a debian-native image and make available (2021-10-12 08:38:10 +0100)
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
>    - ensure s390x insn start ops precede plugin instrumentation
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
> Richard Henderson (2):
>        gitlab: Add cross-riscv64-system, cross-riscv64-user
>        target/s390x: move tcg_gen_insn_start to s390x_tr_insn_start
> 
> Thomas Huth (1):
>        travis.yml: Remove the "Release tarball" job
> 
>   configure                                          |   6 +-
>   include/tcg/tcg.h                                  |   6 -
>   accel/tcg/plugin-gen.c                             | 157 +++++++++++----------
>   target/s390x/tcg/translate.c                       |  10 +-
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
>   22 files changed, 271 insertions(+), 158 deletions(-)
>   rename tests/tcg/multiarch/{ => libs}/float_helpers.c (99%)
>   rename tests/tcg/multiarch/{ => linux}/linux-test.c (100%)
>   delete mode 100644 .github/lockdown.yml
>   create mode 100644 .github/workflows/lockdown.yml
>   create mode 100644 tests/docker/dockerfiles/debian-native.docker

Applied, thanks.

r~


