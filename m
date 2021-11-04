Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588B445881
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:35:56 +0100 (CET)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1migeZ-0007oB-8c
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migdH-00078A-Ip
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:34:35 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migdF-0008OF-96
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:34:35 -0400
Received: by mail-qk1-x734.google.com with SMTP id bm28so6393272qkb.9
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NbU9zQ42RV+7aOkJFTeNUYAHppArPowlV7ZAHrV8Qq4=;
 b=IiuS48MyOZTdm/4khGSlHOslllUR6AFEaz4j9M3e1aZOQ06BzNK+jYLGwU9kugo0ZP
 4KpzcGIQQrh+N7eW4AHRngeVTBuhzOp9aWnDhXUHsFVpSjLlo9A155ktQeYahup2dLyN
 jR2+kOLi5HJHwJIM9yC1yG4yUh6XVSzT8unqOioVVH7gY+jZ8DQyW/+jNh0bRnNZDe6r
 AXPoeZeR0BIAQRfo8YnhYLfBkZN1dLXmiAQDX1tT1T7qOlkeInxBJtGjn4J5ctVoRwuc
 QSXUkkRep0J0JviLDGWKbD8Rdkaaq1puair0UXr5ZB7u8LmzUUVyHXOSWbeX6HCBHtp0
 5zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NbU9zQ42RV+7aOkJFTeNUYAHppArPowlV7ZAHrV8Qq4=;
 b=4f/VM2jF/yHYyqHd/2mMTHG8GD2flXtdtPUhUzZ6dq2uE0XbV9kPUCaKQYNgE14uuN
 wXXOdAK1ZPweZn7MNJ9nitGeW7S++xx3HDoy/2e8fLaalcQdo10ATe4cWZPV1BsLt0yF
 iawBgRQUlX+tGFN7ks+2J5OBxENcnH6RTFh2PoQLnGMVbIoFjK/CQfRkJWrKCMj6igHU
 V7kmJfF6LkztYZ/9YbmcyuReFRT1VUTZJPuz3n54vL5a4C9yHdbRpyjS6VmfJR4/rNMQ
 hyGmJJNaKDP2kuP4WVF5LdXpshkoz3ezPNh9xMFEp68AzsqVc+AwO2eNl3+zrZg1J8/e
 xLdg==
X-Gm-Message-State: AOAM532PI0jB453RMjHNcPi8T2KsfQe80oBSdMFMBKtliTEbBUfeN5iB
 vC+lG+z9RZOjOvRQChLTmOqZBGN6cnxWQQ==
X-Google-Smtp-Source: ABdhPJyNXOArY2zgy5iGOuXxoGKn55aydj8XVq+yw/9RbfkvN7W7LY1mmNTeuWI5Nt4AARSpnP/jUg==
X-Received: by 2002:a05:620a:414e:: with SMTP id
 k14mr42629749qko.400.1636047270512; 
 Thu, 04 Nov 2021 10:34:30 -0700 (PDT)
Received: from ?IPv6:2607:fb90:f802:6e0c:4407:203:e794:8e1f?
 ([2607:fb90:f802:6e0c:4407:203:e794:8e1f])
 by smtp.gmail.com with ESMTPSA id o14sm4446092qtv.34.2021.11.04.10.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:34:30 -0700 (PDT)
Subject: Re: [PULL for 6.2 v2 00/19] testing, plugin and gdbstub updates
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20211104121634.900434-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1dc3460-6dba-8750-054a-0c7e1f353b3e@linaro.org>
Date: Thu, 4 Nov 2021 13:34:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104121634.900434-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/4/21 8:16 AM, Alex Bennée wrote:
> v2, dropped the hexagon toolchain updates which seem to be busted.
> 
> The following changes since commit b1fd92137e4d485adeec8e9f292f928ff335b76c:
> 
>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-11-03 13:07:30 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-for-6.2-041121-2
> 
> for you to fetch changes up to b31b3fd0c0e17b95b9b0e05e0d67d0cd3ca081da:
> 
>    tests/vm/openbsd: Update to release 7.0 (2021-11-04 10:32:01 +0000)
> 
> ----------------------------------------------------------------
> Testing, gdbstub and plugin updates for 6.2
> 
>   - add microblaze and nios2 compiler docker images
>   - fix test cross compiler detection for some targets
>   - don't try and link ebf to user targets
>   - add L2 tracking to cache plugin
>   - exit cleanly on C-a x
>   - clean up debug output in check-tcg
>   - switch to thread on break in gdbstub
>   - update openbsd VM to 7.0
> 
> ----------------------------------------------------------------
> Alex Bennée (7):
>        tests/docker: split PARTIAL into PARTIAL and VIRTUAL images
>        tests/tcg: enable debian-nios2-cross for test building
>        chardev: don't exit() straight away on C-a x
>        tests/plugins: extend the insn plugin to track opcode sizes
>        plugins: try and make plugin_insn_append more ergonomic
>        tests/tcg: remove duplicate EXTRA_RUNS
>        tests/tcg: remove debug polluting make output
> 
> Mahmoud Mandour (5):
>        plugins/cache: freed heap-allocated mutexes
>        plugins/cache: implement unified L2 cache emulation
>        plugins/cache: split command line arguments into name and value
>        plugins/cache: make L2 emulation optional through args
>        docs/tcg-plugins: add L2 arguments to cache docs
> 
> Paolo Bonzini (1):
>        ebpf: really include it only in system emulators
> 
> Pavel Labath (1):
>        gdbstub: Switch to the thread receiving a signal
> 
> Philippe Mathieu-Daudé (1):
>        tests/tcg: Fix some targets default cross compiler path
> 
> Richard Henderson (4):
>        tests/docker: Add debian-nios2-cross image
>        tests/docker: Add debian-microblaze-cross image
>        tests/tcg: Enable container_cross_cc for microblaze
>        tests/vm/openbsd: Update to release 7.0
> 
>   docs/devel/tcg-plugins.rst                         |  20 +-
>   meson.build                                        |   2 -
>   include/exec/plugin-gen.h                          |  12 +-
>   include/qemu/plugin.h                              |   7 +-
>   accel/tcg/plugin-gen.c                             |   3 +-
>   accel/tcg/translator.c                             |   2 +-
>   chardev/char-mux.c                                 |   3 +-
>   contrib/plugins/cache.c                            | 318 +++++++++++++++------
>   gdbstub.c                                          |   8 +-
>   stubs/qmp-quit.c                                   |   8 +
>   tests/plugin/insn.c                                |  37 ++-
>   MAINTAINERS                                        |   3 +
>   stubs/meson.build                                  |   1 +
>   tests/docker/Makefile.include                      |  39 ++-
>   .../debian-microblaze-cross.d/build-toolchain.sh   |  88 ++++++
>   .../debian-nios2-cross.d/build-toolchain.sh        |  87 ++++++
>   tests/docker/dockerfiles/debian-toolchain.docker   |  36 +++
>   tests/tcg/configure.sh                             |  26 +-
>   tests/tcg/multiarch/Makefile.target                |  13 +-
>   .../multiarch/gdbstub/test-thread-breakpoint.py    |  60 ++++
>   tests/tcg/nios2/Makefile.target                    |  11 +
>   tests/tcg/sh4/Makefile.target                      |   6 +
>   tests/vm/openbsd                                   |   7 +-
>   23 files changed, 670 insertions(+), 127 deletions(-)
>   create mode 100644 stubs/qmp-quit.c
>   create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
>   create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
>   create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker
>   create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>   create mode 100644 tests/tcg/nios2/Makefile.target

Applied, thanks.


r~

