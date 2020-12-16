Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607012DC543
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:25:34 +0100 (CET)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaYP-0004Lp-6E
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kpaVA-0000lq-Gz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:22:12 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:48055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kpaV6-0008Be-57
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:22:11 -0500
Received: by mail-io1-f72.google.com with SMTP id q21so16665871ios.14
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SKzcu4dytl44Tsbejz1Y4K0pzxQ2qV4D8GV90u2/anM=;
 b=kfxw5nJ3my31us/HwLT7rXgcA10moL5nMEtVqOHBfrjTyTWf3vfY4ee+UMQUoPT1en
 sUNEpLj7yvKkwp6hqdgxUtT+hgniz+S73ilrTquTJbGuzKmWBAmkMl1ls3AcGWaugybF
 P7vAlRfCN1JIb6kdlV9fb0v5SZ4RmOIUqiLudc2WwF6ztOpLIwmyEcW0b8WuONPR/WHX
 1fUD/WePfwnN9+nnHmt8zHJVhLURlGiKE37Thcousw0J679fI6/CcwxVCGLJcNMp4C/R
 E/DYkAVrBnwJ5JTpnAQ76KyUpz6AAdCHKdo8B3X7XvQBXv/BHY3+yk/Eh56QHrmMt0Gt
 Hufw==
X-Gm-Message-State: AOAM530/zXL4ylGD2TgAJJ0aht5IFjoAluylWGw+kSgKb4s4Qe6bQvRX
 DaEKZ1sC2VVRHmlkBjFjnx6FVTrikxiVJwIBPVxiNXqrv38yVh0CGjlEL4eLIOiA5/VSFfzZg/Z
 IZmnmyA0YD2zyRer8VSkOpOH6Py8f6K5kcEec
X-Google-Smtp-Source: ABdhPJyf6Wft8xuaBGwFA23oePDVLHE9aqUddMljGlbbwSAMaNIzsLCo5HCUV6zStvIblmpN/Tpf9TF8wi1mpgQ9KP1sMKxR3wT3/Q==
X-Received: by 2002:a92:b60a:: with SMTP id s10mr46988811ili.135.1608139323961; 
 Wed, 16 Dec 2020 09:22:03 -0800 (PST)
Received: from XorA-MBP.xoralocal ([2a02:8010:64d6::12ae])
 by smtp.gmail.com with ESMTPSA id k10sm2326386wrq.38.2020.12.16.02.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 02:38:20 -0800 (PST)
Date: Wed, 16 Dec 2020 10:38:18 +0000
From: Graeme Gregory <graeme@nuviainc.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v5 00/11] hvf: Implement Apple Silicon Support
Message-ID: <X9njms3NDHnKUg8i@XorA-MBP.xoralocal>
References: <20201211151300.85322-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211151300.85322-1-agraf@csgraf.de>
Received-SPF: pass client-ip=209.85.166.72; envelope-from=graeme@nuviainc.com;
 helo=mail-io1-f72.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 04:12:49PM +0100, Alexander Graf wrote:
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
> 
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
> 
>   - Live migration / savevm
>   - gdbstub debugging (SP register)
> 
> 
> Enjoy!

I have been using a VM created using v4/v5 as my daily work machine
since v4 came out so.

Tested-by: Graeme Gregory <graeme@nuviainc.com>

> 
> Alex
> 
> v1 -> v2:
> 
>   - New patch: hvf: Actually set SIG_IPI mask
>   - New patch: hvf: Introduce hvf vcpu struct
>   - New patch: hvf: arm: Mark CPU as dirty on reset
>   - Removed patch: hw/arm/virt: Disable highmem when on hypervisor.framework
>   - Removed patch: arm: Synchronize CPU on PSCI on
>   - Fix build on 32bit arm
>   - Merge vcpu kick function patch into ARM enablement
>   - Implement WFI handling (allows vCPUs to sleep)
>   - Synchronize system registers (fixes OVMF crashes and reboot)
>   - Don't always call cpu_synchronize_state()
>   - Use more fine grained iothread locking
>   - Populate aa64mmfr0 from hardware
>   - Make safe to ctrl-C entitlement application
> 
> v2 -> v3:
> 
>   - Removed patch: hvf: Actually set SIG_IPI mask
>   - New patch: hvf: arm: Add support for GICv3
>   - New patch: hvf: arm: Implement -cpu host
>   - Advance PC on SMC
>   - Use cp list interface for sysreg syncs
>   - Do not set current_cpu
>   - Fix sysreg isread mask
>   - Move sysreg handling to functions
>   - Remove WFI logic again
>   - Revert to global iothread locking
> 
> v3 -> v4:
> 
>   - Removed patch: hvf: arm: Mark CPU as dirty on reset
>   - New patch: hvf: Simplify post reset/init/loadvm hooks
>   - Remove i386-softmmu target (meson.build for hvf target)
>   - Combine both if statements (PSCI)
>   - Use hv.h instead of Hypervisor.h for 10.15 compat
>   - Remove manual inclusion of Hypervisor.h in common .c files
>   - No longer include Hypervisor.h in arm hvf .c files
>   - Remove unused exe_full variable
>   - Reuse exe_name variable
> 
> v4 -> v5:
> 
>   - Use g_free() on destroy
> 
> Alexander Graf (10):
>   hvf: Add hypervisor entitlement to output binaries
>   hvf: x86: Remove unused definitions
>   hvf: Move common code out
>   hvf: Introduce hvf vcpu struct
>   arm: Set PSCI to 0.2 for HVF
>   hvf: Simplify post reset/init/loadvm hooks
>   hvf: Add Apple Silicon support
>   arm: Add Hypervisor.framework build target
>   hvf: arm: Add support for GICv3
>   hvf: arm: Implement -cpu host
> 
> Peter Collingbourne (1):
>   arm/hvf: Add a WFI handler
> 
>  MAINTAINERS                  |  14 +-
>  accel/hvf/entitlements.plist |   8 +
>  accel/hvf/hvf-all.c          |  54 +++
>  accel/hvf/hvf-cpus.c         | 466 +++++++++++++++++++
>  accel/hvf/meson.build        |   7 +
>  accel/meson.build            |   1 +
>  include/hw/core/cpu.h        |   3 +-
>  include/sysemu/hvf.h         |   2 +
>  include/sysemu/hvf_int.h     |  66 +++
>  meson.build                  |  40 +-
>  scripts/entitlement.sh       |  13 +
>  target/arm/cpu.c             |  13 +-
>  target/arm/cpu.h             |   2 +
>  target/arm/hvf/hvf.c         | 856 +++++++++++++++++++++++++++++++++++
>  target/arm/hvf/meson.build   |   3 +
>  target/arm/kvm_arm.h         |   2 -
>  target/arm/meson.build       |   2 +
>  target/i386/hvf/hvf-cpus.c   | 131 ------
>  target/i386/hvf/hvf-cpus.h   |  25 -
>  target/i386/hvf/hvf-i386.h   |  49 +-
>  target/i386/hvf/hvf.c        | 462 +++----------------
>  target/i386/hvf/meson.build  |   1 -
>  target/i386/hvf/vmx.h        |  24 +-
>  target/i386/hvf/x86.c        |  28 +-
>  target/i386/hvf/x86_descr.c  |  26 +-
>  target/i386/hvf/x86_emu.c    |  62 +--
>  target/i386/hvf/x86_mmu.c    |   4 +-
>  target/i386/hvf/x86_task.c   |  12 +-
>  target/i386/hvf/x86hvf.c     | 224 ++++-----
>  target/i386/hvf/x86hvf.h     |   2 -
>  30 files changed, 1786 insertions(+), 816 deletions(-)
>  create mode 100644 accel/hvf/entitlements.plist
>  create mode 100644 accel/hvf/hvf-all.c
>  create mode 100644 accel/hvf/hvf-cpus.c
>  create mode 100644 accel/hvf/meson.build
>  create mode 100644 include/sysemu/hvf_int.h
>  create mode 100755 scripts/entitlement.sh
>  create mode 100644 target/arm/hvf/hvf.c
>  create mode 100644 target/arm/hvf/meson.build
>  delete mode 100644 target/i386/hvf/hvf-cpus.c
>  delete mode 100644 target/i386/hvf/hvf-cpus.h
> 
> -- 
> 2.24.3 (Apple Git-128)
> 
> 

