Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CCD484B1B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:14:08 +0100 (CET)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4t0J-0003l0-2W
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4szF-00035C-97
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:13:01 -0500
Received: from [2607:f8b0:4864:20::102d] (port=55153
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4szB-0002DO-QN
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:13:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id jw3so32468136pjb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zLGylKg7T0kH28cARSIloTawiDdOpbJAY5Tezk1WbkM=;
 b=ElAUTKnNMC+Jo5O9hs7vNl4mImrupw5ISGDGIMXJiFPgyxJO4lpUVyltXCGRjPToaU
 OEzxRDbBdtQD20TYhLudK+6S8+POC8YA1lEsvdeDuF9B2T/O9Yw2p+SLxsVqe/6xvKOw
 XeyTlZVEw3LFPC7CbMxaDTaZxCJ6I5ih9IGbO7zudTevhjIMk5dTKMkTsE1NrLM5YGrW
 9dobJzCmBZatAL8TAtEpVBcH0i2Vqsb00nfkm5+PzjuT38iX1ZfiZBtIfU5AHbKWX7kh
 iW8QV0V7AWQkexPo6x/0MXZO15nkW4fbhvi0N/GspRKs38AsAhxTH7VDm9lZ13/BLqnA
 WCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zLGylKg7T0kH28cARSIloTawiDdOpbJAY5Tezk1WbkM=;
 b=S0UNtsnQaG6AKxhUxE7iqta6Z/2irBBw6vx7NeOtoTcuBaKPvl4ul3JUhwJUj5GfgG
 5/rq+XVQ5Pzg+j3byK+YFNVcPLA4NqPaKQRcXCOTTT4p4SvAq8d0m5SLNQ4ec2XbstGM
 QPr9M/i+slYP4RMORAsS8sjqgvt1siKzdpUkPudt3IEUqcTA09Va6+XlIFcAwG4sLPVR
 DarUPSLSc5oVeb8WoC2S6RSAVoZTWdfuFQ9lo+JW+3tafX2jmSei4gnibYtru/xFrnRC
 XznAeYD0lqMNyVjGRNwV6bpUSwswU2avVqv5jhlPVu9aZw40JAnTrkcoFhlnZb5hNi4H
 hUcA==
X-Gm-Message-State: AOAM531QJlnlL+FH987WPAq+orzeTiHdd8RxS6u24EmIiHrUbTn1UzaZ
 6qUeDw2Qo/3ttbtAq13T+WADQ6a5yl0TiA==
X-Google-Smtp-Source: ABdhPJy6sR6SUYFRw1j/qOxPyuIqY7n3AW1pbcXoIruNaol53lVF45v55cZrhX4K4ql9rdtqX1upFw==
X-Received: by 2002:a17:90b:314e:: with SMTP id
 ip14mr759121pjb.19.1641337976236; 
 Tue, 04 Jan 2022 15:12:56 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b15sm44559729pfl.118.2022.01.04.15.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:12:55 -0800 (PST)
Subject: Re: [PULL v3 00/15] Build system and KVM changes for 2021-12-23
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220104145749.417387-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40e5bdaf-0617-a478-3880-a1b136f595d2@linaro.org>
Date: Tue, 4 Jan 2022 15:12:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 6:57 AM, Paolo Bonzini wrote:
> The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737:
> 
>    Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into staging (2022-01-03 09:34:41 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to a2c137e7e00d1bfcc80a17ff8e5104d0e1de2f9a:
> 
>    tests/tcg: Fix target-specific Makefile variables path for user-mode (2022-01-04 14:08:44 +0100)
> 
> ----------------------------------------------------------------
> * configure and meson cleanups
> * KVM_GET/SET_SREGS2 support for x86
> 
> ----------------------------------------------------------------
> 
> I dropped the tricore Dockerfile change because it is still broken occasionally
> with the patch.
> 
> Maxim Levitsky (1):
>        KVM: use KVM_{GET|SET}_SREGS2 when supported.
> 
> Paolo Bonzini (12):
>        meson: reuse common_user_inc when building files specific to user-mode emulators
>        user: move common-user includes to a subdirectory of {bsd,linux}-user/
>        meson: cleanup common-user/ build
>        configure: simplify creation of plugin symbol list
>        configure: do not set bsd_user/linux_user early
>        configure, makefile: remove traces of really old files
>        configure: parse --enable/--disable-strip automatically, flip default
>        configure: move non-command-line variables away from command-line parsing section
>        meson: build contrib/ executables after generated headers
>        configure, meson: move config-poison.h to meson
>        meson: add comments in the target-specific flags section
>        KVM: x86: ignore interrupt_bitmap field of KVM_GET/SET_SREGS
> 
> Philippe Mathieu-Daudé (1):
>        tests/tcg: Fix target-specific Makefile variables path for user-mode
> 
> Thomas Huth (1):
>        block/file-posix: Simplify the XFS_IOC_DIOINFO handling
> 
>   Makefile                                           |  11 +-
>   block/file-posix.c                                 |  37 ++---
>   bsd-user/{ => include}/special-errno.h             |   0
>   bsd-user/meson.build                               |   2 +-
>   common-user/meson.build                            |   2 +-
>   configure                                          | 182 +++------------------
>   contrib/elf2dmp/meson.build                        |   2 +-
>   contrib/ivshmem-client/meson.build                 |   2 +-
>   contrib/ivshmem-server/meson.build                 |   2 +-
>   contrib/rdmacm-mux/meson.build                     |   2 +-
>   .../{ => include}/host/aarch64/host-signal.h       |   0
>   linux-user/{ => include}/host/alpha/host-signal.h  |   0
>   linux-user/{ => include}/host/arm/host-signal.h    |   0
>   linux-user/{ => include}/host/i386/host-signal.h   |   0
>   .../{ => include}/host/loongarch64/host-signal.h   |   0
>   linux-user/{ => include}/host/mips/host-signal.h   |   0
>   linux-user/{ => include}/host/ppc/host-signal.h    |   0
>   linux-user/{ => include}/host/ppc64/host-signal.h  |   0
>   linux-user/{ => include}/host/riscv/host-signal.h  |   0
>   linux-user/{ => include}/host/s390/host-signal.h   |   0
>   linux-user/{ => include}/host/s390x/host-signal.h  |   0
>   linux-user/{ => include}/host/sparc/host-signal.h  |   0
>   .../{ => include}/host/sparc64/host-signal.h       |   0
>   linux-user/{ => include}/host/x32/host-signal.h    |   0
>   linux-user/{ => include}/host/x86_64/host-signal.h |   0
>   linux-user/{ => include}/special-errno.h           |   0
>   linux-user/meson.build                             |   4 +-
>   meson.build                                        |  33 ++--
>   pc-bios/s390-ccw/Makefile                          |   2 -
>   plugins/meson.build                                |  11 +-
>   scripts/make-config-poison.sh                      |  16 ++
>   scripts/meson-buildoptions.py                      |  21 ++-
>   scripts/meson-buildoptions.sh                      |   3 +
>   target/i386/cpu.h                                  |   3 +
>   target/i386/kvm/kvm.c                              | 130 +++++++++++++--
>   target/i386/machine.c                              |  29 ++++
>   tests/tcg/Makefile.target                          |   2 +-
>   37 files changed, 259 insertions(+), 237 deletions(-)
>   rename bsd-user/{ => include}/special-errno.h (100%)
>   rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
>   rename linux-user/{ => include}/host/arm/host-signal.h (100%)
>   rename linux-user/{ => include}/host/i386/host-signal.h (100%)
>   rename linux-user/{ => include}/host/loongarch64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/mips/host-signal.h (100%)
>   rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
>   rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
>   rename linux-user/{ => include}/host/s390/host-signal.h (100%)
>   rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
>   rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
>   rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
>   rename linux-user/{ => include}/host/x32/host-signal.h (100%)
>   rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
>   rename linux-user/{ => include}/special-errno.h (100%)
>   create mode 100755 scripts/make-config-poison.sh

Somewhere in there it breaks plugins:

https://gitlab.com/qemu-project/qemu/-/jobs/1941264303
https://gitlab.com/qemu-project/qemu/-/jobs/1941264320
https://gitlab.com/qemu-project/qemu/-/jobs/1941264310

  (143/171) tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_insn: 
INTERRUPTED: TCG Plugins not enabled?\nRunner error occurred: Timeout reached\nOriginal 
status: CANCEL\n{'name': 
'143-tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_insn', 'logdir': 
'/builds/qemu-project/qemu/build/tests/results/job-2022-01-04T20.25-ad... (121.12 s)
  (144/171) tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_insn_icount: 
  INTERRUPTED: TCG Plugins not enabled?\nRunner error occurred: Timeout reached\nOriginal 
status: CANCEL\n{'name': 
'144-tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_insn_icount', 
'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2022-01-04T2... (120.15 s)
  (145/171) tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_mem_icount: 
  INTERRUPTED: TCG Plugins not enabled?\nRunner error occurred: Timeout reached\nOriginal 
status: CANCEL\n{'name': 
'145-tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_mem_icount', 
'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2022-01-04T20... (120.15 s)


r~

