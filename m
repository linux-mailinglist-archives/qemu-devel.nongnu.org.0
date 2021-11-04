Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F7444DFF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 05:44:32 +0100 (CET)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miUc3-0004vg-I6
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 00:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miUaJ-00041s-K3
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 00:42:43 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:44616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miUaH-0002r1-9O
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 00:42:43 -0400
Received: by mail-qk1-x729.google.com with SMTP id bj27so2939179qkb.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 21:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MIav86MZ3Z/V4JoxZdybZaz+LCGJlyq8+Nh+aIVQvgs=;
 b=Mk9t3uGLMUVAzKK7O5Gw3hDvkx21vSLgaV2MsvwpC8cUttFGYak5DF5Aq3+HNgCYZJ
 IrodpHEQ2fXJTq/tJUfrhgkpErRzyZwuRx32TZsRXds8BtvMIng7EfDbD2KsCrejSD6X
 I7jKXvbObhIfpaYqdZ7RmYW+pf2XxZdllnP/HrAkYglrVX2QlJLLtF5yBqpzWS9fiHpd
 KVxFTRm6wVvsDXU2XE09Lej3k+004DEOKzGcHcJtV+/ekkXUFBcueH3nCZ6jas4gVLIP
 edAdG/beGbgWwVhz5UYzBLig5O2uGJ0DmIlz0H5BTAkXEOJyV0YWgKoeGtp78zZvXGyP
 RaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MIav86MZ3Z/V4JoxZdybZaz+LCGJlyq8+Nh+aIVQvgs=;
 b=oAOEIiwQgj6Y+RdHwMi0IbNc/Bvhy7VuZbM3h6KfvyqowqIW3njbl8MwTbjDjn0vKC
 eQWE3RQKEuLr5iubMCVhwbGt5+rm8Y0cJwqYv1rxD6MCnDXzoC89YevmieXKI6Vf3jdY
 1UfgoRcp8v0lQn1uH17eOwqcQtsR2Y1EZaCFtolVKcYjb4152qwyWc9RZgJVAiS8Nmoa
 3lBYLFcupg1XkMpOfTu9QSJO6AJ26QqERgPy57/XOS1TffBw8QU1WeuTwl2bOG8ktt6M
 PEb6QNgUcWmtDSJlq3TFyM1N4h5JMD48MlklCJMRpmpgmmBXt+PEgiONdTt0Nx6O8BAZ
 dL+Q==
X-Gm-Message-State: AOAM530GkgZ3hYSRXTv1RRcpnyMzT5XCt6BKUGwn712igHtzhe/BYZtW
 zUeJkbyFJ4IIkGlC63XrYvaqUWz09hpSOQ==
X-Google-Smtp-Source: ABdhPJz1IZy6D7C9WcUIL95yXXcnhvpHbbuBhEuwfLHZ235jZzuJGvAX/8FqXWThZnThKz6HhUfbTA==
X-Received: by 2002:a05:620a:460e:: with SMTP id
 br14mr21057246qkb.16.1636000960125; 
 Wed, 03 Nov 2021 21:42:40 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t9sm3170727qtx.47.2021.11.03.21.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 21:42:39 -0700 (PDT)
Subject: Re: [PULL 00/27] Misc patches for QEMU 6.2 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211103150442.387121-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <573377f1-0f4b-b7de-e88a-c79cef6f48f6@linaro.org>
Date: Thu, 4 Nov 2021 00:42:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 11:04 AM, Paolo Bonzini wrote:
> The following changes since commit f79bb385c0fb9756393bde2a13ebbc70ae6c8043:
> 
>    Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20211101' into staging (2021-11-02 08:46:23 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 16bfbc70f39e420b6b6cfe39ed8571606482b94a:
> 
>    configure: fix --audio-drv-list help message (2021-11-02 15:57:28 +0100)
> 
> ----------------------------------------------------------------
> * Build system fixes and cleanups
> * DMA support in the multiboot option ROM
> * Rename default-bus-bypass-iommu
> * Deprecate -watchdog and cleanup -watchdog-action
> * HVF fix for <PAGE_SIZE regions
> * Support TSC scaling for AMD nested virtualization
> * Fix for ESP fuzzing bug
> 
> ----------------------------------------------------------------
> Alex Bennée (1):
>        MAINTAINERS: update location of microvm docs
> 
> Alexander Graf (1):
>        hvf: Avoid mapping regions < PAGE_SIZE as ram
> 
> Eugenio Pérez (1):
>        util: Make some iova_tree parameters const
> 
> Helge Konetzka (1):
>        configure/optionrom: Fix MSYS2 multiboot.bin issue
> 
> Jean-Philippe Brucker (1):
>        hw/i386: Rename default_bus_bypass_iommu
> 
> Jessica Clarke (1):
>        Partially revert "build: -no-pie is no functional linker flag"
> 
> Marcus Hähnel (1):
>        optionrom: add a DMA-enabled multiboot ROM
> 
> Mark Cave-Ayland (2):
>        esp: ensure in-flight SCSI requests are always cancelled
>        qtest/am53c974-test: add test for cancelling in-flight requests
> 
> Maxim Levitsky (1):
>        KVM: SVM: add migration support for nested TSC scaling
> 
> Paolo Bonzini (11):
>        target/i386: move linuxboot_dma_enabled to X86MachineState
>        target/i386: use DMA-enabled multiboot ROM for new-enough QEMU machine types
>        configure: remove useless NPTL probe
>        configure: do not duplicate CPU_CFLAGS into QEMU_LDFLAGS
>        watchdog: add information from -watchdog help to -device help
>        vl: deprecate -watchdog
>        watchdog: remove select_watchdog_action
>        meson: bump submodule to 0.59.3
>        meson: remove pointless warnings
>        meson: remove unnecessary coreaudio test program
>        configure: fix --audio-drv-list help message
> 
> Pavel Dovgalyuk (1):
>        hw/i386: fix vmmouse registration
> 
> Peter Xu (2):
>        Makefile: Fix gtags generation
>        Makefile: Fix cscope issues on MacOS and soft links
> 
> Thomas Huth (3):
>        meson.build: Allow to disable OSS again
>        Move the l2tpv3 test from configure to meson.build
>        configure: Remove the check for the __thread keyword
> 
>   MAINTAINERS                       |   2 +-
>   Makefile                          |   5 +-
>   accel/hvf/hvf-accel-ops.c         |   7 +++
>   configure                         | 113 ++++++++------------------------------
>   docs/about/deprecated.rst         |   5 ++
>   hw/i386/intel_iommu.c             |   2 +-
>   hw/i386/microvm.c                 |   5 +-
>   hw/i386/multiboot.c               |  10 +++-
>   hw/i386/multiboot.h               |   4 +-
>   hw/i386/pc.c                      |  10 ++--
>   hw/i386/pc_piix.c                 |   3 +-
>   hw/i386/pc_q35.c                  |   3 +-
>   hw/i386/vmmouse.c                 |   1 +
>   hw/i386/x86.c                     |   7 ++-
>   hw/scsi/esp.c                     |  10 ++--
>   hw/watchdog/sbsa_gwdt.c           |   3 +-
>   hw/watchdog/watchdog.c            |  14 -----
>   hw/watchdog/wdt_aspeed.c          |   3 +-
>   hw/watchdog/wdt_diag288.c         |   3 +-
>   hw/watchdog/wdt_i6300esb.c        |   3 +-
>   hw/watchdog/wdt_ib700.c           |   3 +-
>   hw/watchdog/wdt_imx2.c            |   4 +-
>   include/hw/i386/pc.h              |   3 -
>   include/hw/i386/x86.h             |   5 +-
>   include/hw/qdev-core.h            |   1 +
>   include/qemu/iova-tree.h          |   8 +--
>   include/sysemu/watchdog.h         |   1 -
>   meson                             |   2 +-
>   meson.build                       |  30 +++-------
>   meson_options.txt                 |   2 +
>   monitor/misc.c                    |  15 ++++-
>   net/meson.build                   |   4 +-
>   pc-bios/meson.build               |   1 +
>   pc-bios/multiboot_dma.bin         | Bin 0 -> 1024 bytes
>   pc-bios/optionrom/Makefile        |   9 +--
>   pc-bios/optionrom/multiboot.S     |   4 +-
>   pc-bios/optionrom/multiboot_dma.S |   2 +
>   pc-bios/optionrom/optionrom.h     |  66 ++++++++++++++++++++++
>   scripts/meson-buildoptions.py     |  16 ------
>   scripts/meson-buildoptions.sh     |   3 +
>   softmmu/qdev-monitor.c            |   1 +
>   softmmu/vl.c                      |  11 ++--
>   target/i386/cpu.c                 |   5 ++
>   target/i386/cpu.h                 |   4 ++
>   target/i386/kvm/kvm.c             |  15 +++++
>   target/i386/machine.c             |  22 ++++++++
>   tests/qtest/am53c974-test.c       |  36 ++++++++++++
>   util/iova-tree.c                  |  12 ++--
>   48 files changed, 294 insertions(+), 204 deletions(-)
>   create mode 100644 pc-bios/multiboot_dma.bin
>   create mode 100644 pc-bios/optionrom/multiboot_dma.S

Applied, thanks.

r~


