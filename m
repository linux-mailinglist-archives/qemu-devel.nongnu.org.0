Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E8477B69
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:22:07 +0100 (CET)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxvOI-0007En-OP
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxvML-0006Ui-RB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:20:08 -0500
Received: from [2607:f8b0:4864:20::431] (port=37711
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxvMJ-0004xH-RJ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:20:05 -0500
Received: by mail-pf1-x431.google.com with SMTP id 8so69913pfo.4
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j42vBIQwkD52xdbXdWIFWa3QXjhl/SwHOUBhsRsfChU=;
 b=oMUD6u3RIL3LMCkTLclWoBw4MCMxfCTCgJjuihK+p+igKwMwIYs3hIu5bJJKCsiieo
 bYaso0ksmIK6Vuv/PI3UZ8CKHGctm8g+o+WdyY5SUC8IQNkAK0Fx4j8yxtz+8aItnKKL
 B1Mi0yySiYRxdVbB328XVe/uWKjzOZ5Di7EOktdRF0YmzdScXlyifKMhQqSo+uqWIjNJ
 rlSPzYgycmb5PrSv58L040MoWsCR7699jTACWEMz2lLmnxsKHc/7N1TMFcOW3X9jWEH1
 nEA9HKNtTw1DdzKukx/SaqcCb0JCsvbi4rE6KIs9XIAIuMZVV+wKPI22jplBTCHfZODF
 l5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j42vBIQwkD52xdbXdWIFWa3QXjhl/SwHOUBhsRsfChU=;
 b=V6FXh04Eiisviv+shDR0wsLXCw6CuWG3t0ksJcG6FxtSbVkb4R7cCuy5hJIWKGosKP
 0H1WYyGs8E1eWseMQcrQ/HYlZTKkqdlOzvPVW3jpJ/3mSpqSyfgvYYm8J0Hc97NL7NC+
 aK+h8aXixZDUoyHEX0kI1ZBTVQTIWYMfeKijCNzCKEhNe3XyDjsiYyj7zkJvdJsw5Oxi
 DtAtmgDXtQ5Xlw1m8qLtzViKkYLnE8Qn+vObX4y+HNDjiYZd1YXsjM50klqCCC1v6qjn
 jgKo3bZkBEmFYBQSDwg17wyrqO3MZ1UHAVkULQzaXcNUkpp4IDKmgDGRaDoBdjRUbJpR
 hDDw==
X-Gm-Message-State: AOAM5318JIjKFPwn5qkYl71FGiFwcxYhE2IYqFuFKWqLHomYCqOTgeCL
 ZStntutKfRPOaRZSEM6+AZPOfwPoAd7+6A==
X-Google-Smtp-Source: ABdhPJyHk12BTLoJtKrdvDbK5JwFlxp1IYTxf7F/LQAZyVKlSXasFaGv4Uhh/s7WDJYA3GZb4zRqWA==
X-Received: by 2002:a63:e04c:: with SMTP id n12mr11248200pgj.12.1639678789998; 
 Thu, 16 Dec 2021 10:19:49 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s21sm6838703pfk.3.2021.12.16.10.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:19:49 -0800 (PST)
Subject: Re: [PULL 00/13] Misc patches for 2021-12-15
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211215202515.91586-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad8bd443-338b-ac29-171e-a68cf72c2c32@linaro.org>
Date: Thu, 16 Dec 2021 10:19:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/15/21 12:25 PM, Paolo Bonzini wrote:
> The following changes since commit 50456a6794fbb8dc94a31eb9534e91c586da7add:
> 
>    Merge tag 'pull-ppc-20211129' of https://github.com/legoater/qemu into staging (2021-11-29 21:56:06 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to cbe08c35cfa8f96125512a8aa3e1bf251b1410a5:
> 
>    configure: remove dead variables (2021-12-10 09:47:18 +0100)
> 
> ----------------------------------------------------------------
> * improve compatibility for macOS scripts/entitlement.sh (Evan)
> * add support for KVM_GUESTDBG_BLOCKIRQ (Maxim)
> * update linux-headers to Linux 5.16 (myself)
> * configure cleanups (myself)
> * lsi53c895a assertion failure fix (Philippe)
> * fix incorrect description for die-id (Yanan)
> * support for NUMA in SGX enclave memory (Yang Zhong)
> 
> ----------------------------------------------------------------
> Evan Miller (1):
>        scripts/entitlement.sh: Use backward-compatible cp flags
> 
> Maxim Levitsky (3):
>        gdbstub: reject unsupported flags in handle_set_qemu_sstep
>        gdbstub, kvm: let KVM report supported singlestep flags
>        kvm: add support for KVM_GUESTDBG_BLOCKIRQ
> 
> Paolo Bonzini (3):
>        virtio-gpu: do not byteswap padding
>        linux-headers: update to 5.16-rc1
>        configure: remove dead variables
> 
> Philippe Mathieu-Daudé (2):
>        hw/scsi/lsi53c895a: Do not abort when DMA requested and no data queued
>        tests/qtest: Add fuzz-lsi53c895a-test
> 
> Yanan Wang (1):
>        qapi/machine.json: Fix incorrect description for die-id
> 
> Yang Zhong (3):
>        numa: Enable numa for SGX EPC sections
>        numa: Support SGX numa in the monitor and Libvirt interfaces
>        doc: Add the SGX numa description
> 
>   MAINTAINERS                                   |   1 +
>   accel/kvm/kvm-all.c                           |  29 ++++++
>   configure                                     |   5 --
>   docs/system/i386/sgx.rst                      |  31 ++++++-
>   gdbstub.c                                     |  83 ++++++++++++------
>   hw/core/numa.c                                |   5 +-
>   hw/i386/acpi-build.c                          |   2 +
>   hw/i386/sgx-epc.c                             |   3 +
>   hw/i386/sgx-stub.c                            |   4 +
>   hw/i386/sgx.c                                 |  95 ++++++++++++++++++--
>   hw/scsi/lsi53c895a.c                          |   3 +-
>   include/hw/i386/sgx-epc.h                     |   3 +
>   include/hw/virtio/virtio-gpu-bswap.h          |   1 -
>   include/standard-headers/drm/drm_fourcc.h     | 121 +++++++++++++++++++++++++-
>   include/standard-headers/linux/ethtool.h      |  31 +++++++
>   include/standard-headers/linux/fuse.h         |  10 ++-
>   include/standard-headers/linux/pci_regs.h     |   6 ++
>   include/standard-headers/linux/virtio_gpu.h   |  18 +++-
>   include/standard-headers/linux/virtio_ids.h   |  24 +++++
>   include/standard-headers/linux/virtio_vsock.h |   3 +-
>   include/sysemu/kvm.h                          |  15 ++++
>   linux-headers/asm-arm64/unistd.h              |   1 +
>   linux-headers/asm-generic/unistd.h            |  22 +++--
>   linux-headers/asm-mips/unistd_n32.h           |   1 +
>   linux-headers/asm-mips/unistd_n64.h           |   1 +
>   linux-headers/asm-mips/unistd_o32.h           |   1 +
>   linux-headers/asm-powerpc/unistd_32.h         |   1 +
>   linux-headers/asm-powerpc/unistd_64.h         |   1 +
>   linux-headers/asm-s390/unistd_32.h            |   1 +
>   linux-headers/asm-s390/unistd_64.h            |   1 +
>   linux-headers/asm-x86/kvm.h                   |   5 ++
>   linux-headers/asm-x86/unistd_32.h             |   3 +
>   linux-headers/asm-x86/unistd_64.h             |   3 +
>   linux-headers/asm-x86/unistd_x32.h            |   3 +
>   linux-headers/linux/kvm.h                     |  40 +++++++--
>   monitor/hmp-cmds.c                            |   1 +
>   qapi/machine.json                             |  12 ++-
>   qapi/misc-target.json                         |  19 +++-
>   qemu-options.hx                               |   4 +-
>   scripts/entitlement.sh                        |   2 +-
>   tests/qtest/fuzz-lsi53c895a-test.c            |  52 +++++++++++
>   tests/qtest/meson.build                       |   1 +
>   42 files changed, 590 insertions(+), 78 deletions(-)
>   create mode 100644 tests/qtest/fuzz-lsi53c895a-test.c

Applied, thanks.

r~

