Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2353AE82
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:29:36 +0200 (CEST)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwVuJ-0000Kp-CA
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwVmM-0003dN-HA
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 17:21:23 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwVmK-0007EJ-Ah
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 17:21:22 -0400
Received: by mail-pl1-x631.google.com with SMTP id b5so2863616plx.10
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KXFM9EWRKwpyW+uEtLDc6ZdihNAXfX/3K2GzGAmaVco=;
 b=H6KdbzuQ+0FI9Mvd+CF+3SgOHx31ImfZTA3k/rOlKp6zcWHrBGrOXSJQgY1GcwLKOQ
 2R7HZC3Ds4SDQ8XeZHCe/dcxTwZ/RYA+d4qBWwdWEn2xPSAjhg38lMuffNqmRQFhlDW4
 TvIyZx+qDjs/6itJAtWxxRB9iQdiL/kyCod9IHEq0QXf430uyFgToW6ZHHN3OoNBGS8z
 1P5DI791vWWxrfcyfHrPKBbwPRBmmQu3iQe/DAx6g4iZrb+W6oZCHK9Nx7jovNUOuxmF
 UgexblnX9bmZx8j3eE7NSn4dAvDTtijj0da9cI25e+LThXlyI3HDHdiqree57cKBvGSc
 604A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KXFM9EWRKwpyW+uEtLDc6ZdihNAXfX/3K2GzGAmaVco=;
 b=qSUJX16xubagyUth0r5eoY+bJvLnYdnBiU+wNwYN5sIzqByeVlLtxNmfIu1lUjqZbw
 pc+Gn+d4bP7rovSWywj8hryyfLVO7YlyhuW7wlp6S3lGrGLm5hPrrRJDAr2bqqCavjxc
 XcYN5DDQEnn2gDGKjO9v34EgMl0S6fRlOF3p8eHo79gkTE7R/V6vpxvGNaqURIsFtxXQ
 rvcG2WH22Yy8VhtMRYJpcxOM3AmMnRDtGkPtohvcrhlZciGUZ33aBaqsQ4t5DgR+rn60
 T5eg4V+4hT9aNOMVam84dEm2uAbcr4wt5cHkeo4C3RpzEF2GDuJi1EkXglD1FJVbuvdU
 B0Ow==
X-Gm-Message-State: AOAM530fh3pcs8DkxSiVyO7cusXl9HVhUz9VhXkVFn93GfyuqBr4Ha/l
 QDgK6/nKKG7YvzE6q3E+3ifpIQ==
X-Google-Smtp-Source: ABdhPJyt0KpLh5QVaoJOHau01EuldS/8sOV4pD0uyDXI2bVMtRziJ/c1jc+8yCWUItKrH2h96RbNbg==
X-Received: by 2002:a17:90b:3ec3:b0:1e3:42df:12c with SMTP id
 rm3-20020a17090b3ec300b001e342df012cmr10010842pjb.238.1654118478299; 
 Wed, 01 Jun 2022 14:21:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:9ec4:1716:8e7:1e42?
 ([2602:ae:1547:e101:9ec4:1716:8e7:1e42])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a1709029b9300b0015e8d4eb2b4sm1972373plp.254.2022.06.01.14.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 14:21:17 -0700 (PDT)
Message-ID: <521c95cf-8436-4c0e-f9b5-7216f9dadc98@linaro.org>
Date: Wed, 1 Jun 2022 14:21:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/33] testing updates (gitlab, junit, lcitool, x-compile)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/1/22 11:05, Alex Bennée wrote:
> The following changes since commit 7077fcb9b68f058809c9dd9fd1dacae1881e886c:
> 
>    Merge tag 'vmbus-maint-20220530' of https://github.com/maciejsszmigiero/qemu into staging (2022-05-30 12:40:36 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-testing-next-010622-3
> 
> for you to fetch changes up to 7266ecce502c31387a3cbf83d7297bc9cf27b139:
> 
>    docs/devel: clean-up the CI links in the docs (2022-06-01 18:55:04 +0100)
> 
> ----------------------------------------------------------------
> Various testing updates
> 
>    - fix some gitlab container dependencies
>    - report meson test results via JUnit
>    - fix meson display of enabled cross compilers
>    - convert more cross build containers to lcitool and Debian 11
>    - re-factor cross compiler detection
>    - use test cross-compilers for building ROMs
>    - disable CI runs by default (see docs)
>    - fix some broken links in development documentation

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Alex Bennée (9):
>        meson.build: fix summary display of test compilers
>        tests/lcitool: fix up indentation to correct style
>        tests/docker: update debian-armhf-cross with lcitool
>        tests/docker: update debian-armel-cross with lcitool
>        tests/docker: update debian-mipsel-cross with lcitool
>        tests/docker: update debian-mips64el-cross with lcitool
>        tests/docker: update debian-ppc64el-cross with lcitool
>        tests/docker: update debian-amd64 with lcitool
>        docs/devel: clean-up the CI links in the docs
> 
> Daniel P. Berrangé (5):
>        gitlab: introduce a common base job template
>        gitlab: convert Cirrus jobs to .base_job_template
>        gitlab: convert static checks to .base_job_template
>        gitlab: convert build/container jobs to .base_job_template
>        gitlab: don't run CI jobs in forks by default
> 
> Marc-André Lureau (1):
>        gitlab-ci: add meson JUnit test result into report
> 
> Paolo Bonzini (16):
>        configure: do not define or use the CPP variable
>        build: clean up ninja invocation
>        build: add a more generic way to specify make->ninja dependencies
>        build: do a full build before running TCG tests
>        configure, meson: move symlinking of ROMs to meson
>        tests/tcg: correct target CPU for sparc32
>        tests/tcg: merge configure.sh back into main configure script
>        configure: add missing cross compiler fallbacks
>        configure: handle host compiler in probe_target_compiler
>        configure: introduce --cross-prefix-*=
>        configure: include more binutils in tests/tcg makefile
>        configure: move symlink configuration earlier
>        configure: enable cross-compilation of s390-ccw
>        configure: enable cross-compilation of optionrom
>        configure: enable cross compilation of vof
>        configure: remove unused variables from config-host.mak
> 
> Thomas Huth (2):
>        .gitlab-ci.d/container-cross: Fix RISC-V container dependencies / stages
>        .gitlab-ci.d/crossbuilds: Fix the dependency of the cross-i386-tci job
> 
>   docs/devel/ci-jobs.rst.inc                         | 116 +++-
>   docs/devel/ci.rst                                  |  11 +-
>   docs/devel/submitting-a-patch.rst                  |  36 +-
>   docs/devel/testing.rst                             |   2 +
>   configure                                          | 606 ++++++++++++++++++---
>   Makefile                                           |   9 +-
>   pc-bios/s390-ccw/netboot.mak                       |   2 +-
>   meson.build                                        |   8 +-
>   .gitlab-ci.d/base.yml                              |  72 +++
>   .gitlab-ci.d/buildtest-template.yml                |  18 +-
>   .gitlab-ci.d/buildtest.yml                         |  28 +-
>   .gitlab-ci.d/cirrus.yml                            |  16 +-
>   .gitlab-ci.d/container-cross.yml                   |  24 +-
>   .gitlab-ci.d/container-template.yml                |   1 +
>   .gitlab-ci.d/containers.yml                        |   3 +-
>   .gitlab-ci.d/crossbuild-template.yml               |   3 +
>   .gitlab-ci.d/crossbuilds.yml                       |   2 +
>   .gitlab-ci.d/qemu-project.yml                      |   1 +
>   .gitlab-ci.d/static_checks.yml                     |  19 +-
>   .gitlab-ci.d/windows.yml                           |   1 +
>   pc-bios/meson.build                                |  17 +-
>   pc-bios/optionrom/Makefile                         |   4 +-
>   pc-bios/s390-ccw/Makefile                          |   9 +-
>   pc-bios/vof/Makefile                               |  17 +-
>   scripts/mtest2make.py                              |   8 +-
>   tests/Makefile.include                             |   4 +-
>   tests/docker/Makefile.include                      |   5 -
>   tests/docker/dockerfiles/debian-amd64.docker       | 194 +++++--
>   tests/docker/dockerfiles/debian-armel-cross.docker | 178 +++++-
>   tests/docker/dockerfiles/debian-armhf-cross.docker | 184 ++++++-
>   .../dockerfiles/debian-mips64el-cross.docker       | 177 +++++-
>   .../docker/dockerfiles/debian-mipsel-cross.docker  | 179 +++++-
>   .../docker/dockerfiles/debian-ppc64el-cross.docker | 178 +++++-
>   tests/lcitool/refresh                              | 178 ++++--
>   tests/tcg/configure.sh                             | 376 -------------
>   35 files changed, 1885 insertions(+), 801 deletions(-)
>   create mode 100644 .gitlab-ci.d/base.yml
>   delete mode 100755 tests/tcg/configure.sh
> 


