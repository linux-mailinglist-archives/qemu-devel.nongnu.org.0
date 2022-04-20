Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C29D50910F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:05:34 +0200 (CEST)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGZx-0002U1-0w
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhGHx-0006NQ-L0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:46:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhGHv-0008Ho-KW
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:46:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r83so2611945pgr.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eSENCDvz1u+RxBgOxpkcIxhdGAb++GIkSMLfWSS7OPM=;
 b=nDO2Vhc37QiOp8H3Joz0zQwArwDHFGGOJ5o1tRaoCbj28Y5jUAku67oC00hxgCMJH9
 3yPX917vdjE93K6UwuSYI7MPRS76AY6+Nf0ESgPOpAb5Exl2ka/he5FPpoJL4hXazpp/
 BOJVZPX8y3+CfVEZ/ANMJTFru6CvNkTWARxEC7PPG91UUJ3YDzn4du+WsIgWJPZGITGW
 PmK9WqdLindtPUQu4191WxbpMWejqU6Ixf6dqdOk/31Bo0+TQ6zkhluGgUvahROgKnB5
 0jTH3GDJQOvCeWzpK9FjckTjvOdbo7Ep4MzBUrnQSDrIWafawJFq8ewcLUYsCZXYKbWV
 pDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eSENCDvz1u+RxBgOxpkcIxhdGAb++GIkSMLfWSS7OPM=;
 b=fQKq8HAoKEobS3F1+6uYK7xWWAHepVTbB44Ojpyor/0g029LdpGv865GdRoySdR61l
 LBHPdXAI5AohzEPtLoQ07aFQ0fu246rgAMVne8xX3bRgG2od5yFfw3PM2ka6ladKaSVE
 Os+S7QAnaFxyOSXyFCsUZtUql77EYn7nnDO2CGtZ1EVUEAAmm8fdrl+7TESyRyPvtzBs
 C0IEodF7/Q+fni791RM4OJ5a1luLFMgrXvZdLiCdd0Lkak1wWO0HoK/nf/AoHMQOwXua
 qaKiHX+WT18Lbk8U1rkVjiYDugeVZAOjaaBhN25U8gPvLEo990boCNra7pE3gbGopW3t
 Qdgg==
X-Gm-Message-State: AOAM533mIzksVFM80LvW4Ljba2SxnyfhXME8LfocM1+oaiKvoTtZDtsy
 B6qdrXDGObioWTmy1sfvp/Gt1w==
X-Google-Smtp-Source: ABdhPJyQ4b8rU6RFj4ULcWhxiEKVkqxq2fWKya3x1020xRtK/7V7WzPpBnPTLc5P8wW09ZAIRhO30Q==
X-Received: by 2002:a05:6a00:1486:b0:50a:40f7:5a86 with SMTP id
 v6-20020a056a00148600b0050a40f75a86mr25583206pfu.43.1650484013768; 
 Wed, 20 Apr 2022 12:46:53 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a150800b001cbaf536a3esm192933pja.18.2022.04.20.12.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:46:52 -0700 (PDT)
Message-ID: <25da722a-10c3-c35c-e487-e4d86f63e146@linaro.org>
Date: Wed, 20 Apr 2022 12:46:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/25] Various testing, doc and gdbstub fixes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 11:08, Alex Bennée wrote:
> The following changes since commit 1be5a765c08cee3a9587c8a8d3fc2ea247b13f9c:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-04-19 18:22:16 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-fixes-for-7.1-200422-1
> 
> for you to fetch changes up to caccf599181e2ea5f236345de9d9957a4c23e5ec:
> 
>    tests/guest-debug: better handle gdb crashes (2022-04-20 16:04:20 +0100)
> 
> ----------------------------------------------------------------
> Testing, docs and gdbstub updates:
> 
>    - make -M virt test exercise -cpu max
>    - document how binfmt_misc docker works
>    - clean-up the devel TOC generation
>    - clean-up check-tcg cross-compile behaviour
>    - fix byte swap error in xmm gdbstub access
>    - add float_convd test with reference files
>    - more reference files for float_convs
>    - more cleanly handle gdb crashing during check-tcg

Applied, thanks.  Please update the wiki changelog for 7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Alex Bennée (8):
>        tests/avocado: update aarch64_virt test to exercise -cpu max
>        docs/devel: add some notes on the binfmt-image-debian targets
>        docs/devel: drop :hidden: and :includehidden: tags
>        tests/tcg: remove duplicate sha512-sse case
>        tests/tcg: add float_convd test
>        tests/tcg: add missing reference files for float_convs
>        target/i386: fix byte swap issue with XMM register access
>        tests/guest-debug: better handle gdb crashes
> 
> Paolo Bonzini (17):
>        tests/docker: remove dead code for linux-user containers
>        tests/docker: remove test targets
>        tests/docker: remove dead variable
>        tests/docker: remove unnecessary default definitions
>        tests/docker: inline variable definitions or move close to use
>        tests/docker: remove unnecessary filtering of $(DOCKER_IMAGES)
>        tests/docker: simplify docker-TEST@IMAGE targets
>        tests/docker: do not duplicate rules for hexagon-cross
>        tests/tcg: add compiler test variables when using containers
>        tests/tcg: remove CONFIG_LINUX_USER from config-target.mak
>        tests/tcg: remove CONFIG_USER_ONLY from config-target.mak
>        tests/tcg: prepare Makefile.prereqs at configure time
>        tests/tcg: list test targets in Makefile.prereqs
>        tests/tcg: invoke Makefile.target directly from QEMU's makefile
>        tests/tcg: isolate from QEMU's config-host.mak
>        tests/docker: remove SKIP_DOCKER_BUILD
>        tests/tcg: fix non-static build
> 
>   docs/devel/index-api.rst                           |   1 -
>   docs/devel/index-build.rst                         |   3 +-
>   docs/devel/index-internals.rst                     |   1 -
>   docs/devel/index-process.rst                       |   1 -
>   docs/devel/index-tcg.rst                           |   1 -
>   docs/devel/index.rst                               |   2 -
>   docs/devel/qtest.rst                               |   1 -
>   docs/devel/testing.rst                             |  38 +
>   configure                                          |   3 +-
>   target/i386/gdbstub.c                              |   4 +-
>   tests/tcg/multiarch/float_convd.c                  | 106 +++
>   MAINTAINERS                                        |   1 +
>   tests/Makefile.include                             |  63 +-
>   tests/avocado/boot_linux_console.py                |  25 -
>   tests/avocado/machine_aarch64_virt.py              |  51 ++
>   tests/docker/Makefile.include                      | 115 +--
>   tests/docker/docker.py                             |  57 --
>   .../build-toolchain.sh                             |   0
>   tests/docker/dockerfiles/empty.docker              |   8 -
>   tests/guest-debug/run-test.py                      |  11 +-
>   tests/tcg/Makefile.prereqs                         |  18 -
>   tests/tcg/Makefile.qemu                            | 121 ---
>   tests/tcg/Makefile.target                          |  14 +-
>   tests/tcg/aarch64/Makefile.softmmu-target          |   2 +-
>   tests/tcg/aarch64/Makefile.target                  |  10 +-
>   tests/tcg/aarch64/float_convd.ref                  | 988 +++++++++++++++++++++
>   tests/tcg/arm/float_convd.ref                      | 988 +++++++++++++++++++++
>   tests/tcg/configure.sh                             |  78 +-
>   tests/tcg/i386/Makefile.target                     |   2 +-
>   tests/tcg/i386/float_convd.conf                    | 988 +++++++++++++++++++++
>   tests/tcg/i386/float_convs.ref                     | 748 ++++++++++++++++
>   tests/tcg/multiarch/Makefile.target                |   2 +-
>   tests/tcg/ppc64/Makefile.target                    |   4 +-
>   tests/tcg/ppc64le/Makefile.target                  |   4 +-
>   tests/tcg/x86_64/Makefile.target                   |   9 +-
>   tests/tcg/x86_64/float_convd.ref                   | 988 +++++++++++++++++++++
>   tests/tcg/x86_64/float_convs.ref                   | 748 ++++++++++++++++
>   37 files changed, 5780 insertions(+), 424 deletions(-)
>   create mode 100644 tests/tcg/multiarch/float_convd.c
>   create mode 100644 tests/avocado/machine_aarch64_virt.py
>   rename tests/docker/dockerfiles/{debian-hexagon-cross.docker.d => debian-hexagon-cross.d}/build-toolchain.sh (100%)
>   delete mode 100644 tests/docker/dockerfiles/empty.docker
>   delete mode 100644 tests/tcg/Makefile.prereqs
>   delete mode 100644 tests/tcg/Makefile.qemu
>   create mode 100644 tests/tcg/aarch64/float_convd.ref
>   create mode 100644 tests/tcg/arm/float_convd.ref
>   create mode 100644 tests/tcg/i386/float_convd.conf
>   create mode 100644 tests/tcg/i386/float_convs.ref
>   create mode 100644 tests/tcg/x86_64/float_convd.ref
>   create mode 100644 tests/tcg/x86_64/float_convs.ref
> 


