Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B355F8A9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 14:58:46 +0200 (CEST)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj1K2-0006Li-5p
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 08:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44351)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hj1Ir-0005x4-PK
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 08:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hj1Ip-0000si-SX
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 08:57:33 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1hj1Ip-0000sN-Ko
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 08:57:31 -0400
Received: by mail-wr1-x441.google.com with SMTP id p11so1042694wro.5
 for <qemu-devel@nongnu.org>; Thu, 04 Jul 2019 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/OGm6d7AWBkSoijpZfCgy3P3KA3/hXLiW50lcb4L2Tw=;
 b=fs9cbuFpTeztakFwaG4/kgJB7ZkSfjFlIwg3oixjfz2BhNubdELuS+8nAcJDLTAQEr
 kOsqDTNxbmtQf2tZ815+DCJ02ygQ11Rrg77TJFKf6YQmHkaSs998bAB49as82lcvJYcP
 ThP0MBDfUYqggwqsrcVsr0kU5J7KMUBFqfUKJGExgI3hB8i3OThaeMaldQ11uO6bzHYR
 Y56YuZk6lrLlM0uBY9zAzMIiYJqkiiIJ+zxo9h3QXKI7vdxJulE4C1ad6lgyLPaBGwPY
 97wyOI8glHTFeUHolOq4vCXbhlLxCwEkPbcXFA6AZTViIHZ6fmPCEydsiWIiXxSnQRVa
 dW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/OGm6d7AWBkSoijpZfCgy3P3KA3/hXLiW50lcb4L2Tw=;
 b=Pg3Yy8rAI2UQdb6FeMBZkxtCAf9OstivcRHw0utpWj7HLHVnP8703Sh+a8CTOC3UoE
 FYpf2gzEl7sHM5/fpihqpoyCBTVOaH5s7FP5YpUDkV/frKtREKJGsMD/rh1BzdnFDWw0
 WC1NoYWSS63Sr6zvGTvALUMvAqVW7Jw6P7yRIUNUrgMjCSJfOzJIrytTSj1JZt2mFE4W
 d0tFqN6VXAg6i45RnsEH/BV5uS5eCBnqpgHtIusu8dPodgUGqVRo0utpT6q1mh0AuExu
 bIUVD1gpiVcPbktPuzNa9o9E6w+6wYKGoU3Do5vZ3J8nlI1z3hpjhsSEfxXGeMBYoM21
 GlZQ==
X-Gm-Message-State: APjAAAX/vJLubK/bRF+5Zs7RSdCKgMbr0pl4ozODMaUJMMTiv8ME1f9m
 AhwFBV7LSEmxrSrPI2PydpVtm4UvyeldHxUztNK4OXrweFqUdA==
X-Google-Smtp-Source: APXvYqyuAsV5wLshxFOwfxXFCnn1kOHyd0vxoZtu3fiyu/esHPqsnT4Fpq48Ut8t9Ddqjw5OYgaBTQ/LulkmBlQYewc=
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr26953446wrm.100.1562245049562; 
 Thu, 04 Jul 2019 05:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
 <1557953433-19663-20-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1557953433-19663-20-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 4 Jul 2019 16:57:17 +0400
Message-ID: <CAJ+F1CK+FYYOFefek55yrFWRfC=NYBH5g8uPw9iO1QWZLh6r5A@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PULL 19/21] ioapic: allow buggy guests
 mishandling level-triggered interrupts to make progress
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, May 16, 2019 at 1:04 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Vitaly Kuznetsov <vkuznets@redhat.com>
>
> It was found that Hyper-V 2016 on KVM in some configurations (q35 machine=
 +
> piix4-usb-uhci) hangs on boot. Root-cause was that one of Hyper-V
> level-triggered interrupt handler performs EOI before fixing the cause of
> the interrupt. This results in IOAPIC keep re-raising the level-triggered
> interrupt after EOI because irq-line remains asserted.
>
> Gory details: https://www.spinics.net/lists/kvm/msg184484.html
> (the whole thread).
>
> Turns out we were dealing with similar issues before; in-kernel IOAPIC
> implementation has commit 184564efae4d ("kvm: ioapic: conditionally delay
> irq delivery duringeoi broadcast") which describes a very similar issue.
>
> Steal the idea from the above mentioned commit for IOAPIC implementation =
in
> QEMU. SUCCESSIVE_IRQ_MAX_COUNT, delay and the comment are borrowed as wel=
l.
>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Message-Id: <20190402080215.10747-1-vkuznets@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

After this commit, I get the following ASAN error when booting a VM:

/home/elmarco/src/qq/hw/intc/ioapic.c:266:27: runtime error: index 41
out of bounds for type 'int [24]'
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D9761=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address
0x61b00000312c at pc 0x55e40b8f9e74 bp 0x7f269c1d32a0 sp
0x7f269c1d3290
WRITE of size 4 at 0x61b00000312c thread T4 (CPU 0/KVM)
    #0 0x55e40b8f9e73 in ioapic_eoi_broadcast
/home/elmarco/src/qq/hw/intc/ioapic.c:266
    #1 0x55e40bd3fa4e in kvm_arch_handle_exit
/home/elmarco/src/qq/target/i386/kvm.c:3644
    #2 0x55e40b7d1fd7 in kvm_cpu_exec
/home/elmarco/src/qq/accel/kvm/kvm-all.c:2083
    #3 0x55e40b6e435f in qemu_kvm_cpu_thread_fn /home/elmarco/src/qq/cpus.c=
:1282
    #4 0x55e40ce9ba42 in qemu_thread_start
/home/elmarco/src/qq/util/qemu-thread-posix.c:502
    #5 0x7f26ac3435a1 in start_thread (/lib64/libpthread.so.0+0x85a1)
    #6 0x7f26ac270302 in __clone (/lib64/libc.so.6+0xfb302)

Address 0x61b00000312c is a wild pointer.
SUMMARY: AddressSanitizer: heap-buffer-overflow
/home/elmarco/src/qq/hw/intc/ioapic.c:266 in ioapic_eoi_broadcast
Shadow bytes around the buggy address:
  0x0c367fff85d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c367fff85e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c367fff85f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c367fff8600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c367fff8610: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fa fa
=3D>0x0c367fff8620: fa fa fa fa fa[fa]fa fa fa fa fa fa fa fa fa fa
  0x0c367fff8630: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c367fff8640: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c367fff8650: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c367fff8660: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c367fff8670: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
  Shadow gap:              cc
Thread T4 (CPU 0/KVM) created by T0 here:
    #0 0x7f26af884965 in pthread_create (/lib64/libasan.so.5+0x3a965)
    #1 0x55e40ce9be8b in qemu_thread_create
/home/elmarco/src/qq/util/qemu-thread-posix.c:539
    #2 0x55e40b6ea347 in qemu_kvm_start_vcpu /home/elmarco/src/qq/cpus.c:20=
18
    #3 0x55e40b6eb03b in qemu_init_vcpu /home/elmarco/src/qq/cpus.c:2084
    #4 0x55e40bb52352 in x86_cpu_realizefn
/home/elmarco/src/qq/target/i386/cpu.c:5382
    #5 0x55e40c017aed in device_set_realized
/home/elmarco/src/qq/hw/core/qdev.c:834
    #6 0x55e40c95e703 in property_set_bool
/home/elmarco/src/qq/qom/object.c:2074
    #7 0x55e40c959332 in object_property_set
/home/elmarco/src/qq/qom/object.c:1266
    #8 0x55e40c961edb in object_property_set_qobject
/home/elmarco/src/qq/qom/qom-qobject.c:27
    #9 0x55e40c959700 in object_property_set_bool
/home/elmarco/src/qq/qom/object.c:1332
    #10 0x55e40ba831a3 in pc_new_cpu /home/elmarco/src/qq/hw/i386/pc.c:1531
    #11 0x55e40ba838a0 in pc_cpus_init /home/elmarco/src/qq/hw/i386/pc.c:15=
79
    #12 0x55e40ba9f394 in pc_q35_init /home/elmarco/src/qq/hw/i386/pc_q35.c=
:183
    #13 0x55e40baa19ab in pc_init_v4_0 /home/elmarco/src/qq/hw/i386/pc_q35.=
c:385
    #14 0x55e40c035aa7 in machine_run_board_init
/home/elmarco/src/qq/hw/core/machine.c:1033
    #15 0x55e40bda59d8 in main /home/elmarco/src/qq/vl.c:4494
    #16 0x7f26ac198f32 in __libc_start_main (/lib64/libc.so.6+0x23f32)

I start investigating.

> ---
>  hw/intc/ioapic.c                  | 57 +++++++++++++++++++++++++++++++++=
++----
>  hw/intc/trace-events              |  1 +
>  include/hw/i386/ioapic_internal.h |  3 +++
>  3 files changed, 56 insertions(+), 5 deletions(-)
>
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 9d75f84..7074489 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -139,6 +139,15 @@ static void ioapic_service(IOAPICCommonState *s)
>      }
>  }
>
> +#define SUCCESSIVE_IRQ_MAX_COUNT 10000
> +
> +static void delayed_ioapic_service_cb(void *opaque)
> +{
> +    IOAPICCommonState *s =3D opaque;
> +
> +    ioapic_service(s);
> +}
> +
>  static void ioapic_set_irq(void *opaque, int vector, int level)
>  {
>      IOAPICCommonState *s =3D opaque;
> @@ -222,13 +231,39 @@ void ioapic_eoi_broadcast(int vector)
>          }
>          for (n =3D 0; n < IOAPIC_NUM_PINS; n++) {
>              entry =3D s->ioredtbl[n];
> -            if ((entry & IOAPIC_LVT_REMOTE_IRR)
> -                && (entry & IOAPIC_VECTOR_MASK) =3D=3D vector) {
> -                trace_ioapic_clear_remote_irr(n, vector);
> -                s->ioredtbl[n] =3D entry & ~IOAPIC_LVT_REMOTE_IRR;
> -                if (!(entry & IOAPIC_LVT_MASKED) && (s->irr & (1 << n)))=
 {
> +
> +            if ((entry & IOAPIC_VECTOR_MASK) !=3D vector ||
> +                ((entry >> IOAPIC_LVT_TRIGGER_MODE_SHIFT) & 1) !=3D IOAP=
IC_TRIGGER_LEVEL) {
> +                continue;
> +            }
> +
> +            if (!(entry & IOAPIC_LVT_REMOTE_IRR)) {
> +                continue;
> +            }
> +
> +            trace_ioapic_clear_remote_irr(n, vector);
> +            s->ioredtbl[n] =3D entry & ~IOAPIC_LVT_REMOTE_IRR;
> +
> +            if (!(entry & IOAPIC_LVT_MASKED) && (s->irr & (1 << n))) {
> +                ++s->irq_eoi[vector];
> +                if (s->irq_eoi[vector] >=3D SUCCESSIVE_IRQ_MAX_COUNT) {
> +                    /*
> +                     * Real hardware does not deliver the interrupt imme=
diately
> +                     * during eoi broadcast, and this lets a buggy guest=
 make
> +                     * slow progress even if it does not correctly handl=
e a
> +                     * level-triggered interrupt. Emulate this behavior =
if we
> +                     * detect an interrupt storm.
> +                     */
> +                    s->irq_eoi[vector] =3D 0;
> +                    timer_mod_anticipate(s->delayed_ioapic_service_timer=
,
> +                                         qemu_clock_get_ns(QEMU_CLOCK_VI=
RTUAL) +
> +                                         NANOSECONDS_PER_SECOND / 100);
> +                    trace_ioapic_eoi_delayed_reassert(vector);
> +                } else {
>                      ioapic_service(s);
>                  }
> +            } else {
> +                s->irq_eoi[vector] =3D 0;
>              }
>          }
>      }
> @@ -401,6 +436,9 @@ static void ioapic_realize(DeviceState *dev, Error **=
errp)
>      memory_region_init_io(&s->io_memory, OBJECT(s), &ioapic_io_ops, s,
>                            "ioapic", 0x1000);
>
> +    s->delayed_ioapic_service_timer =3D
> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, delayed_ioapic_service_cb, s);
> +
>      qdev_init_gpio_in(dev, ioapic_set_irq, IOAPIC_NUM_PINS);
>
>      ioapics[ioapic_no] =3D s;
> @@ -408,6 +446,14 @@ static void ioapic_realize(DeviceState *dev, Error *=
*errp)
>      qemu_add_machine_init_done_notifier(&s->machine_done);
>  }
>
> +static void ioapic_unrealize(DeviceState *dev, Error **errp)
> +{
> +    IOAPICCommonState *s =3D IOAPIC_COMMON(dev);
> +
> +    timer_del(s->delayed_ioapic_service_timer);
> +    timer_free(s->delayed_ioapic_service_timer);
> +}
> +
>  static Property ioapic_properties[] =3D {
>      DEFINE_PROP_UINT8("version", IOAPICCommonState, version, IOAPIC_VER_=
DEF),
>      DEFINE_PROP_END_OF_LIST(),
> @@ -419,6 +465,7 @@ static void ioapic_class_init(ObjectClass *klass, voi=
d *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      k->realize =3D ioapic_realize;
> +    k->unrealize =3D ioapic_unrealize;
>      /*
>       * If APIC is in kernel, we need to update the kernel cache after
>       * migration, otherwise first 24 gsi routes will be invalid.
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index a28bdce..90c9d07 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -25,6 +25,7 @@ apic_mem_writel(uint64_t addr, uint32_t val) "0x%"PRIx6=
4" =3D 0x%08x"
>  ioapic_set_remote_irr(int n) "set remote irr for pin %d"
>  ioapic_clear_remote_irr(int n, int vector) "clear remote irr for pin %d =
vector %d"
>  ioapic_eoi_broadcast(int vector) "EOI broadcast for vector %d"
> +ioapic_eoi_delayed_reassert(int vector) "delayed reassert on EOI broadca=
st for vector %d"
>  ioapic_mem_read(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t val=
) "ioapic mem read addr 0x%"PRIx8" regsel: 0x%"PRIx8" size 0x%"PRIx8" retva=
l 0x%"PRIx32
>  ioapic_mem_write(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t va=
l) "ioapic mem write addr 0x%"PRIx8" regsel: 0x%"PRIx8" size 0x%"PRIx8" val=
 0x%"PRIx32
>  ioapic_set_irq(int vector, int level) "vector: %d level: %d"
> diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_i=
nternal.h
> index 9848f39..07002f9 100644
> --- a/include/hw/i386/ioapic_internal.h
> +++ b/include/hw/i386/ioapic_internal.h
> @@ -96,6 +96,7 @@ typedef struct IOAPICCommonClass {
>      SysBusDeviceClass parent_class;
>
>      DeviceRealize realize;
> +    DeviceUnrealize unrealize;
>      void (*pre_save)(IOAPICCommonState *s);
>      void (*post_load)(IOAPICCommonState *s);
>  } IOAPICCommonClass;
> @@ -111,6 +112,8 @@ struct IOAPICCommonState {
>      uint8_t version;
>      uint64_t irq_count[IOAPIC_NUM_PINS];
>      int irq_level[IOAPIC_NUM_PINS];
> +    int irq_eoi[IOAPIC_NUM_PINS];
> +    QEMUTimer *delayed_ioapic_service_timer;
>  };
>
>  void ioapic_reset_common(DeviceState *dev);
> --
> 1.8.3.1
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

