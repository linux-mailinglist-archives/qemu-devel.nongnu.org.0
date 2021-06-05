Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C305939CA9A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:02:59 +0200 (CEST)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbZS-0001ib-Rf
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbYL-0000ji-F8; Sat, 05 Jun 2021 15:01:49 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbYJ-0007cy-DY; Sat, 05 Jun 2021 15:01:49 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMXcP-1m7PgO3mVT-00Jchd; Sat, 05 Jun 2021 21:01:44 +0200
Subject: Re: [PATCH] i386/kvm: The value passed to strerror should be positive
To: Dmitry Voronetskiy <davoronetskiy@gmail.com>, qemu-devel@nongnu.org
References: <20210519113528.12474-1-davoronetskiy@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9e73bc57-13cb-3ab8-1f8d-01182de2e423@vivier.eu>
Date: Sat, 5 Jun 2021 21:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519113528.12474-1-davoronetskiy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Knyw1PANWskZGYnyzv2b3I4U5Ugd1iv9F81205sSr1yCIV4RYWH
 U6zwSAxSkZkJ6qs8m8nEK/Mqi9vCSjm0LDd7DBjRiWpxLG8+GVwkChR6mlLb14d1XUq3o8G
 AMwXYUPigFFRAjQgfKzj+y7LlmmmoX+K0PT7C+/B9VOfFLgkg/wamIZG9XccQwm3ZWV1Aaa
 is/qlaL8tjSWP3JfdM2bA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9dD++n0uhXg=:GdlJiK5ZKSXsS6ihqQ2Z/3
 vS5hY8PEgIzTk/skHv/gPTTGuRNWrBqopQAJGKrEJPZ3uDeXVBCB57Q+CQWKLld9646ow0jHL
 4OwELVXxCwoTuaN5CR0bLtVXTVTb7CSXMAbszOv6yhEpiMWLrdVUc4xuHiWj/j3XRvCqapkcj
 HLAftsA4LV5zgNE7eqyGFpuJW/hH4vWGJq8vAIVymWM00sRSPTFJWO+89AVtM+QhlodME0U2o
 R/N8bVCz6y5MTzQmI3HeU/jzUzmIbmaRd3B3ALP1f3umUnbxtv+FCajKCjtYYYqF90WA9nv5F
 ld7Wlphutg0xhUdtw4hMKy9HXRF54ND/VpPru5aaATBxSe5pz4by+Cyq6A8Qclgm9PudQiJ7v
 bF6oLsKJpCz71Jfvd6LdtJynFXvqKnQxcjb9elstLo+bgibNTvylnvriPAY3H6dGLyrfAvApU
 uMXHpzwuBVlXX2Mru7htxx3BvOvFC5WQQGO0Ja/Hli31A0NzDbv+fjSRW+YEKQsQ9zxsEOXSE
 wS4BYBe58bLUXxVeFKU4pA=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Dmitry Voronetskiy <vda1999@yandex.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/05/2021 à 13:35, Dmitry Voronetskiy a écrit :
> From: Dmitry Voronetskiy <vda1999@yandex.ru>
> 
> Signed-off-by: Dmitry Voronetskiy <vda1999@yandex.ru>
> 
> ---
>  hw/i386/kvm/apic.c   |  2 +-
>  hw/i386/kvm/clock.c  |  4 ++--
>  hw/i386/kvm/i8254.c  | 10 +++++-----
>  hw/i386/kvm/i8259.c  |  4 ++--
>  hw/i386/kvm/ioapic.c |  4 ++--
>  5 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
> index 52ff490910..1e89ca0899 100644
> --- a/hw/i386/kvm/apic.c
> +++ b/hw/i386/kvm/apic.c
> @@ -145,7 +145,7 @@ static void kvm_apic_put(CPUState *cs, run_on_cpu_data data)
>  
>      ret = kvm_vcpu_ioctl(CPU(s->cpu), KVM_SET_LAPIC, &kapic);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_SET_LAPIC failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_SET_LAPIC failed: %s\n", strerror(-ret));
>          abort();
>      }
>  }
> diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
> index efbc1e0d12..df70b4a033 100644
> --- a/hw/i386/kvm/clock.c
> +++ b/hw/i386/kvm/clock.c
> @@ -105,7 +105,7 @@ static void kvm_update_clock(KVMClockState *s)
>  
>      ret = kvm_vm_ioctl(kvm_state, KVM_GET_CLOCK, &data);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_GET_CLOCK failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_GET_CLOCK failed: %s\n", strerror(-ret));
>                  abort();
>      }
>      s->clock = data.clock;
> @@ -189,7 +189,7 @@ static void kvmclock_vm_state_change(void *opaque, bool running,
>          data.clock = s->clock;
>          ret = kvm_vm_ioctl(kvm_state, KVM_SET_CLOCK, &data);
>          if (ret < 0) {
> -            fprintf(stderr, "KVM_SET_CLOCK failed: %s\n", strerror(ret));
> +            fprintf(stderr, "KVM_SET_CLOCK failed: %s\n", strerror(-ret));
>              abort();
>          }
>  
> diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
> index c558893961..fa68669e8a 100644
> --- a/hw/i386/kvm/i8254.c
> +++ b/hw/i386/kvm/i8254.c
> @@ -104,7 +104,7 @@ static void kvm_pit_get(PITCommonState *pit)
>      if (kvm_has_pit_state2()) {
>          ret = kvm_vm_ioctl(kvm_state, KVM_GET_PIT2, &kpit);
>          if (ret < 0) {
> -            fprintf(stderr, "KVM_GET_PIT2 failed: %s\n", strerror(ret));
> +            fprintf(stderr, "KVM_GET_PIT2 failed: %s\n", strerror(-ret));
>              abort();
>          }
>          pit->channels[0].irq_disabled = kpit.flags & KVM_PIT_FLAGS_HPET_LEGACY;
> @@ -115,7 +115,7 @@ static void kvm_pit_get(PITCommonState *pit)
>           */
>          ret = kvm_vm_ioctl(kvm_state, KVM_GET_PIT, &kpit);
>          if (ret < 0) {
> -            fprintf(stderr, "KVM_GET_PIT failed: %s\n", strerror(ret));
> +            fprintf(stderr, "KVM_GET_PIT failed: %s\n", strerror(-ret));
>              abort();
>          }
>      }
> @@ -180,7 +180,7 @@ static void kvm_pit_put(PITCommonState *pit)
>      if (ret < 0) {
>          fprintf(stderr, "%s failed: %s\n",
>                  kvm_has_pit_state2() ? "KVM_SET_PIT2" : "KVM_SET_PIT",
> -                strerror(ret));
> +                strerror(-ret));
>          abort();
>      }
>  }
> @@ -272,7 +272,7 @@ static void kvm_pit_realizefn(DeviceState *dev, Error **errp)
>      }
>      if (ret < 0) {
>          error_setg(errp, "Create kernel PIC irqchip failed: %s",
> -                   strerror(ret));
> +                   strerror(-ret));
>          return;
>      }
>      switch (s->lost_tick_policy) {
> @@ -286,7 +286,7 @@ static void kvm_pit_realizefn(DeviceState *dev, Error **errp)
>              if (ret < 0) {
>                  error_setg(errp,
>                             "Can't disable in-kernel PIT reinjection: %s",
> -                           strerror(ret));
> +                           strerror(-ret));
>                  return;
>              }
>          }
> diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
> index 3f8bf69e9c..d61bae4dc3 100644
> --- a/hw/i386/kvm/i8259.c
> +++ b/hw/i386/kvm/i8259.c
> @@ -43,7 +43,7 @@ static void kvm_pic_get(PICCommonState *s)
>      chip.chip_id = s->master ? KVM_IRQCHIP_PIC_MASTER : KVM_IRQCHIP_PIC_SLAVE;
>      ret = kvm_vm_ioctl(kvm_state, KVM_GET_IRQCHIP, &chip);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(-ret));
>          abort();
>      }
>  
> @@ -96,7 +96,7 @@ static void kvm_pic_put(PICCommonState *s)
>  
>      ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(-ret));
>          abort();
>      }
>  }
> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index 71a563181e..ee7c8ef68b 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -62,7 +62,7 @@ static void kvm_ioapic_get(IOAPICCommonState *s)
>      chip.chip_id = KVM_IRQCHIP_IOAPIC;
>      ret = kvm_vm_ioctl(kvm_state, KVM_GET_IRQCHIP, &chip);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(-ret));
>          abort();
>      }
>  
> @@ -95,7 +95,7 @@ static void kvm_ioapic_put(IOAPICCommonState *s)
>  
>      ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
>      if (ret < 0) {
> -        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
> +        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(-ret));
>          abort();
>      }
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


