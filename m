Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8D3C08DE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 17:47:39 +0200 (CEST)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDsT1-0004xf-O9
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 11:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDql6-0004lS-5U
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDql4-0008Gz-FC
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:58:07 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40641)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDql4-0008Go-Al
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:58:06 -0400
Received: by mail-ot1-x342.google.com with SMTP id y39so2298255ota.7
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/L1vk8ZEX1dDFsyoP8jdEPTbwfmUYl1fqd9uotjBFoQ=;
 b=x6m1c+RIp9S7ggPV9dD5W8bthMp/oigvGlUwn0P8vP5dyfwGciPgIqLFSuAVJxZPT4
 CP1cRDyy5hWppSOhv0KDBB61zO+IFpXNGI9iJem8UT4mVqmcgi88bOBU/9ZxJPZhBc66
 NYfbHGjn5kYCx10GDN4KZHp3WaSqs2qDXPPku+2r2jW2IdjNn2FRco56rhpVbNOECVrb
 Hi7Pbi+KAs7QTCI6zE6oGtw5lJM56TyEluaqfhrFZ0YCecLW7xlhTiy0ax39XnZTKVD9
 meU7mgozp/vriibdlNDuOGKLahraOnRjlW2dur9VMe5fVTVbmuGzJN4udrCOFHmDGOlN
 m0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/L1vk8ZEX1dDFsyoP8jdEPTbwfmUYl1fqd9uotjBFoQ=;
 b=j9+Q3RJsVmhqifXHymShduBw6iKMmwvB09scV+3K17LQdErPzy502Q5H65vS2dmSdf
 lw+Zs9dyE+aVjrnG9DKbIiyD3g6KqfrB1UYQn7IjW+SdYvI5MJK16j5rFajNt8RhvczI
 vA5hjblq22xQn7c/3VnJ/uio4xpEDy4KPpJm7kMnhziaHb+t98w7MaFbdbFM/sgE9UYz
 LWvxZi8eh/X6UrzAKJZc389jA6d8N4WVqrQ2wN6VkKQg/6S8IUWGh/ttno7KwNSJZxHR
 M5rkl9L8Cc8vhAI+zgSDsR50dWD4NbQzbY8MWPZt8r6M70st21THVcULN+RzCOENkWTu
 qbyA==
X-Gm-Message-State: APjAAAWVMTuntT2C15LGQHk+NGvWKIvRZ5KSk0BlZzo9fewYancPtBag
 9dQhKRXJY1/JHVEhfgIryjBXz2Gm1zUFK72SPcPnJw==
X-Google-Smtp-Source: APXvYqx/U/Fyiz/LD14vi413zuKKZi9VIQ+Ap4zw2wBTN+o9Bnb6t+a9XUiOR3Rrp5pKjc5Z52IKSf9Io7r6O3MckpI=
X-Received: by 2002:a05:6830:1357:: with SMTP id
 r23mr3354259otq.91.1569592685416; 
 Fri, 27 Sep 2019 06:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
 <20190906083152.25716-7-zhengxiang9@huawei.com>
In-Reply-To: <20190906083152.25716-7-zhengxiang9@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2019 14:57:54 +0100
Message-ID: <CAFEAcA9Y3J8uRDN+HQO74-codKhoj5CyPW=9q3GwH8Mk_PNYTA@mail.gmail.com>
Subject: Re: [PATCH v18 6/6] target-arm: kvm64: handle SIGBUS signal from
 kernel or KVM
To: Xiang Zheng <zhengxiang9@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Marcelo Tosatti <mtosatti@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, gengdongjiu <gengdongjiu@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 James Morse <james.morse@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Sep 2019 at 09:33, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>
> Add a SIGBUS signal handler. In this handler, it checks the SIGBUS type,
> translates the host VA delivered by host to guest PA, then fills this PA
> to guest APEI GHES memory, then notifies guest according to the SIGBUS
> type.
>
> If guest accesses the poisoned memory, it generates Synchronous External
> Abort(SEA). Then host kernel gets an APEI notification and calls
> memory_failure() to unmapped the affected page in stage 2, finally
> returns to guest.
>
> Guest continues to access PG_hwpoison page, it will trap to KVM as
> stage2 fault, then a SIGBUS_MCEERR_AR synchronous signal is delivered to
> Qemu, Qemu records this error address into guest APEI GHES memory and
> notifes guest using Synchronous-External-Abort(SEA).
>
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---
>  hw/acpi/acpi_ghes.c         | 252 ++++++++++++++++++++++++++++++++++++
>  include/hw/acpi/acpi_ghes.h |  40 ++++++
>  include/sysemu/kvm.h        |   2 +-
>  target/arm/kvm64.c          |  39 ++++++
>  4 files changed, 332 insertions(+), 1 deletion(-)

I'll let somebody else review the ACPI parts as that's not my
area of expertise, but I'll look at the target/arm parts below:

> diff --git a/hw/acpi/acpi_ghes.c b/hw/acpi/acpi_ghes.c
> index 20c45179ff..2d17c88045 100644
> --- a/hw/acpi/acpi_ghes.c
> +++ b/hw/acpi/acpi_ghes.c
> @@ -26,6 +26,168 @@
>  #include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>
> +/* Total size for Generic Error Status Block

This block comment should start with '/*' on a line of its own
(as should others in this patch). Usually checkpatch catches these
but it's not infallible.

> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 909bcd77cf..5f57e4ed43 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -378,7 +378,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
>  /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
>  unsigned long kvm_arch_vcpu_id(CPUState *cpu);
>
> -#ifdef TARGET_I386
> +#if defined(TARGET_I386) || defined(TARGET_AARCH64)
>  #define KVM_HAVE_MCE_INJECTION 1
>  void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
>  #endif

Rather than introducing a new ifdef with lots of TARGET_*,
I think it would be better to have target/i386/cpu.h and
target/arm/cpu.h do "#define KVM_HAVE_MCE_INJECTION 1"
(nb that the arm cpu.h needs to define it only for aarch64,
not for 32-bit arm host compiles).

and then kvm.h can just do
#ifdef KVM_HAVE_MCE_INJECTION
void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
#endif

> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index bf6edaa3f6..186d855522 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -28,6 +28,8 @@
>  #include "kvm_arm.h"
>  #include "hw/boards.h"
>  #include "internals.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/acpi_ghes.h"
>
>  static bool have_guest_debug;
>
> @@ -1070,6 +1072,43 @@ int kvm_arch_get_registers(CPUState *cs)
>      return ret;
>  }
>
> +void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> +{
> +    ram_addr_t ram_addr;
> +    hwaddr paddr;
> +
> +    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
> +
> +    if (acpi_enabled && addr &&
> +            object_property_get_bool(qdev_get_machine(), "ras", NULL)) {
> +        ram_addr = qemu_ram_addr_from_host(addr);
> +        if (ram_addr != RAM_ADDR_INVALID &&
> +            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> +            kvm_hwpoison_page_add(ram_addr);
> +            /* Asynchronous signal will be masked by main thread, so
> +             * only handle synchronous signal.
> +             */

I don't entirely understand this comment. The x86 version
of this function says:

    /* If we get an action required MCE, it has been injected by KVM
     * while the VM was running.  An action optional MCE instead should
     * be coming from the main thread, which qemu_init_sigbus identifies
     * as the "early kill" thread.
     */

so we can be called for action-optional MCE here (not on the vcpu
thread). We obviously can't deliver those as a synchronous exception
to a particular CPU, but is there no mechanism for reporting them
to the guest at all?

> +            if (code == BUS_MCEERR_AR) {
> +                kvm_cpu_synchronize_state(c);
> +                if (ACPI_GHES_CPER_FAIL !=
> +                    acpi_ghes_record_errors(ACPI_GHES_NOTIFY_SEA, paddr)) {
> +                    kvm_inject_arm_sea(c);
> +                } else {
> +                    fprintf(stderr, "failed to record the error\n");
> +                }
> +            }
> +            return;
> +        }
> +        fprintf(stderr, "Hardware memory error for memory used by "
> +                "QEMU itself instead of guest system!\n");
> +    }
> +
> +    if (code == BUS_MCEERR_AR) {
> +        fprintf(stderr, "Hardware memory error!\n");
> +        exit(1);
> +    }
> +}
> +
>  /* C6.6.29 BRK instruction */
>  static const uint32_t brk_insn = 0xd4200000;
>

thanks
-- PMM

