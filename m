Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F32EC0D6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:05:35 +0100 (CET)
Received: from localhost ([::1]:56992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxBJW-0000R9-S1
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxBID-0008JZ-25; Wed, 06 Jan 2021 11:04:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:46288 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxBIA-0001bL-PC; Wed, 06 Jan 2021 11:04:12 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3DEFE412D6;
 Wed,  6 Jan 2021 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1609949046;
 x=1611763447; bh=4kxhXyFP2O5PFcbvvlJD21aFOWi3oLeDiYHrHgCqs/U=; b=
 VYmJgxsHjf11/fdrkDpxdOr0o9cvRSGRPnF4HCUsSVYm/g+FDUmLmVe0l0G5AM2M
 e+IiF2Dm+DK1yvu9L11CW+lCw5Lkkre0YmsVarMq2ZIHnMjjNWJYjB4lKuDfEf9N
 uB/kJttp0Uv7sjbL5x3Fq8vMu5G+3auWvk9vjnspirM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwWgguZxB6SH; Wed,  6 Jan 2021 19:04:06 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6096541268;
 Wed,  6 Jan 2021 19:04:06 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 6 Jan
 2021 19:04:06 +0300
Date: Wed, 6 Jan 2021 19:04:20 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v5 00/11] hvf: Implement Apple Silicon Support
Message-ID: <X/XfhCfOfYIgxhSY@SPB-NB-133.local>
References: <20201211151300.85322-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201211151300.85322-1-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
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
> 

Hi Alex,

For the ARM part:
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Note, that it doesn't apply to current master. So I applied it over
tagged v5.2.0.

Are there any outstanding issues that blocking merge apart from the
rebase?

Thanks,
Roman

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

