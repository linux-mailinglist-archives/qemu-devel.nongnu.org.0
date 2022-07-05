Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3305674E1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 18:54:58 +0200 (CEST)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8lpB-0005fj-4T
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 12:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8leA-0001sv-9u
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:43:35 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8le8-00025D-6o
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 12:43:33 -0400
Received: by mail-pl1-x631.google.com with SMTP id d5so11402057plo.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=sffxJBKLofQBWjw99IGs66Mx8XR/7zVJblmZTja8g5Q=;
 b=vJXrtKx/qlvtu94h9aPlVLgdR1wI2yz27s4MWAUBmAMAShRynX7wJjjreKBhcmye6u
 WxKYdpIjmb7vn1QndM0C5cPHw09J1asv1NaQQlPS6KjQAXHXSHvqnkNIo1xJ6H73W3wY
 dZNFO6xdj7yqvEW0OP+KU6i6xclHLt6K+o8fd8H1l8lcXGjb/QLD549ap7k6dgyx855W
 I4qkZ5ZjHYpKlrkjYNFwQLPA0eylmndyGBsAuV/tFG5snsD/Df/GrkENzVqrM9lwYjVF
 JyN7J9FoOU2mtRJ/7e88z7GwnxQXOmmt69f2eEUS/GRy2Y8Aext6XdaioO9h1wQ1RjPj
 DZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sffxJBKLofQBWjw99IGs66Mx8XR/7zVJblmZTja8g5Q=;
 b=BK8O+TP4K3r2O+Of70tdWutbj4JviUnXgWCPqpi+PcrfeUpkhS9Qn9OY9k6EHPB5Qt
 nToM0XHtVxX3xytQrjFcis5a1PMW1PRDavBZyh8yTvEcx0xIgrCNsfs/LLkqxpVoBfhi
 oN8eFovS8KHB6pdtIBQFgDi9UJQI8aFfN/xC556Wd789l8ZtVtKHONOwpp6RUH9S8qi+
 EcXiEHJftTqOwK9rV+/73gQY/QHjwocd079MMzJSIIWYWfcewkI1tnasmSCX3FQ6vdKu
 IIyXWHIfFBn+mu/sbtjrL0uGVlPZUdcT9ifvnb49J7IBJ6k1flI6z31YSYn7pO1fMcco
 P+Gg==
X-Gm-Message-State: AJIora/2WBdrVh2Z+NVVh2MGSsgNZFozMsctvs89s3OWE8oszQH6pl8M
 WISuicYVTtuiRcSnX4+UnfpfGQ==
X-Google-Smtp-Source: AGRyM1stR3ubBdLxQy0DuaT2m69uAL/E/XIqZkrerZM0mnhgL61brN4Z/AJlwgOge8BNf0YuSaeHbw==
X-Received: by 2002:a17:90b:3e86:b0:1ec:fc46:9e05 with SMTP id
 rj6-20020a17090b3e8600b001ecfc469e05mr43376090pjb.0.1657039410641; 
 Tue, 05 Jul 2022 09:43:30 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a621d04000000b00528a097aeffsm261547pfd.118.2022.07.05.09.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 09:43:29 -0700 (PDT)
Message-ID: <56adb3d4-6f8f-6231-495d-4e8eed36cc96@linaro.org>
Date: Tue, 5 Jul 2022 22:13:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/14] Testing and misc patches
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220705103816.608166-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
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

On 7/5/22 16:08, Thomas Huth wrote:
>   Hi Richard!
> 
> The following changes since commit dfe2382f0641f537fdd33399d579215077c8f68c:
> 
>    Merge tag 'kraxel-20220704-pull-request' of https://gitlab.com/kraxel/qemu into staging (2022-07-04 14:57:21 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-05
> 
> for you to fetch changes up to 7a890b756620223f35f8056baddf0406526ae025:
> 
>    include/qemu/host-utils: Remove unused code in the *_overflow wrappers (2022-07-05 10:15:49 +0200)
> 
> ----------------------------------------------------------------
> * Fix memory leak in test-cutils
> * Fix edk2/opensbi jobs to not run automatically by accident
> * Improve timings in the migration qtest
> * Remove libvixl disassembler
> * Add ukrainian translation
> * Require a recent version of libpng

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Andrij Mizyk (1):
>    po: add ukrainian translation
> 
> Daniel P. Berrangé (7):
>    gitlab: normalize indentation in edk2/opensbi rules
>    gitlab: tweak comments in edk2/opensbi jobs
>    gitlab: honour QEMU_CI variable in edk2/opensbi jobs
>    tests: wait max 120 seconds for migration test status changes
>    tests: wait for migration completion before looking for STOP event
>    tests: increase migration test converge downtime to 30 seconds
>    tests: use consistent bandwidth/downtime limits in migration tests
> 
> Marc-André Lureau (1):
>    tests: fix test-cutils leaks
> 
> Philippe Mathieu-Daudé (1):
>    tests/fp: Do not build softfloat3 tests if TCG is disabled
> 
> Richard Henderson (1):
>    gitlab-ci: Extend timeout for ubuntu-20.04-s390x-all to 75m
> 
> Thomas Huth (3):
>    disas: Remove libvixl disassembler
>    meson.build: Require a recent version of libpng
>    include/qemu/host-utils: Remove unused code in the *_overflow wrappers
> 
>   meson.build                                   |    6 +-
>   disas/libvixl/vixl/a64/assembler-a64.h        | 4624 -----------------
>   disas/libvixl/vixl/a64/constants-a64.h        | 2116 --------
>   disas/libvixl/vixl/a64/cpu-a64.h              |   83 -
>   disas/libvixl/vixl/a64/decoder-a64.h          |  275 -
>   disas/libvixl/vixl/a64/disasm-a64.h           |  177 -
>   disas/libvixl/vixl/a64/instructions-a64.h     |  757 ---
>   disas/libvixl/vixl/code-buffer.h              |  113 -
>   disas/libvixl/vixl/compiler-intrinsics.h      |  155 -
>   disas/libvixl/vixl/globals.h                  |  155 -
>   disas/libvixl/vixl/invalset.h                 |  775 ---
>   disas/libvixl/vixl/platform.h                 |   39 -
>   disas/libvixl/vixl/utils.h                    |  286 -
>   include/exec/poison.h                         |    2 -
>   include/qemu/host-utils.h                     |   65 -
>   disas.c                                       |    3 -
>   target/arm/cpu.c                              |    7 -
>   tests/qtest/migration-helpers.c               |   14 +
>   tests/qtest/migration-test.c                  |   59 +-
>   tests/unit/test-cutils.c                      |   42 +-
>   .../custom-runners/ubuntu-20.04-s390x.yml     |    1 +
>   .gitlab-ci.d/edk2.yml                         |  133 +-
>   .gitlab-ci.d/opensbi.yml                      |  134 +-
>   MAINTAINERS                                   |    4 -
>   disas/arm-a64.cc                              |  101 -
>   disas/libvixl/LICENCE                         |   30 -
>   disas/libvixl/README                          |   11 -
>   disas/libvixl/meson.build                     |    7 -
>   disas/libvixl/vixl/a64/decoder-a64.cc         |  877 ----
>   disas/libvixl/vixl/a64/disasm-a64.cc          | 3495 -------------
>   disas/libvixl/vixl/a64/instructions-a64.cc    |  622 ---
>   disas/libvixl/vixl/compiler-intrinsics.cc     |  144 -
>   disas/libvixl/vixl/utils.cc                   |  142 -
>   disas/meson.build                             |    5 -
>   po/LINGUAS                                    |    1 +
>   po/uk.po                                      |   75 +
>   scripts/clean-header-guards.pl                |    4 +-
>   scripts/clean-includes                        |    2 +-
>   scripts/coverity-scan/COMPONENTS.md           |    3 -
>   tests/fp/meson.build                          |    3 +
>   40 files changed, 314 insertions(+), 15233 deletions(-)
>   delete mode 100644 disas/libvixl/vixl/a64/assembler-a64.h
>   delete mode 100644 disas/libvixl/vixl/a64/constants-a64.h
>   delete mode 100644 disas/libvixl/vixl/a64/cpu-a64.h
>   delete mode 100644 disas/libvixl/vixl/a64/decoder-a64.h
>   delete mode 100644 disas/libvixl/vixl/a64/disasm-a64.h
>   delete mode 100644 disas/libvixl/vixl/a64/instructions-a64.h
>   delete mode 100644 disas/libvixl/vixl/code-buffer.h
>   delete mode 100644 disas/libvixl/vixl/compiler-intrinsics.h
>   delete mode 100644 disas/libvixl/vixl/globals.h
>   delete mode 100644 disas/libvixl/vixl/invalset.h
>   delete mode 100644 disas/libvixl/vixl/platform.h
>   delete mode 100644 disas/libvixl/vixl/utils.h
>   delete mode 100644 disas/arm-a64.cc
>   delete mode 100644 disas/libvixl/LICENCE
>   delete mode 100644 disas/libvixl/README
>   delete mode 100644 disas/libvixl/meson.build
>   delete mode 100644 disas/libvixl/vixl/a64/decoder-a64.cc
>   delete mode 100644 disas/libvixl/vixl/a64/disasm-a64.cc
>   delete mode 100644 disas/libvixl/vixl/a64/instructions-a64.cc
>   delete mode 100644 disas/libvixl/vixl/compiler-intrinsics.cc
>   delete mode 100644 disas/libvixl/vixl/utils.cc
>   create mode 100644 po/uk.po
> 


