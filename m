Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE611E30A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 12:54:53 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifjX2-0003Wz-H2
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 06:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifjWD-0002vr-25
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:54:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifjWA-0002jZ-Ea
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:53:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20281
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifjWA-0002iK-AB
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 06:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576238037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDpMWcY8MAvgf11QbhUG+VybIy/cco4vYWuQfZdZoDo=;
 b=Rp0+EPutJf/d9avWj9cdsogb9/LtfEvd4lucADJUR7uUns5sZhoSFYYq/s2GIh5/TDQdJJ
 r34RArZUt0KMxAb9nuJ9rxya/hs0kvLBnVbfl0CHqjUWVpkxqs6Dt2EboV4Ip4YxF4MCcf
 u/+428Rz+45tM4GY0eBoHAGOLNMX10E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-obC1M4pjNUqKAU7agcofwA-1; Fri, 13 Dec 2019 06:53:54 -0500
Received: by mail-wm1-f69.google.com with SMTP id i17so2259574wmd.1
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2019 03:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KFc9zrc0lnaWTXScDbTfhkxNxQpAVklGF7JvKKV46Yw=;
 b=t1JUS0mVIkaokjf/PwJr69I1PdgsZr4ksGICeYjGsVME+pJz9b4Hy7pMO5MhBsi09e
 pAp12nKzmfO8OTqZeOEm/x9ws52yn4WOMQdcASdIQgM+IBvkgbLFgg/ZO5kBv9u52v1x
 hJfzx8HyIKeDK1684N+xzQ/0b0Pksm5kVc6WBRBZOZlpQ71KQ+TTS9slGAA4l/AT7nNj
 LoZowoSR59JoIYnCaeVVK1VXSQ0Rlcg8Dg/VcxgbUORzrJcdPo8Gw41QGipVFcFWWUBt
 H/MX5jfBrtl8Y9x6MrqH6y6fnW8utDg6Z2ACGRe+tmRgrJhJ3HMZoEynclLt3zCessaY
 GpxA==
X-Gm-Message-State: APjAAAWgVdEr/lnTqn923/neC+YdZP0jJy/yTZ8MWDbAxGuWNjzoVrsT
 pnezXB+szNZNhtXJ/QJQDE+jbIcYV8m64zPNXxfi11bKbuDCvTKhpODFXIpEY5Yt+g1bn2CJfJP
 npyQKoxP/XF0hRow=
X-Received: by 2002:a5d:438c:: with SMTP id i12mr12627054wrq.196.1576238032830; 
 Fri, 13 Dec 2019 03:53:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxE7FtlDzOpp15v3gB8QZ5NmgbfFuNJttdfg1aRcxPzTDf+i1ne4B/nU2LrXS9RYAUmFXdN7A==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr12627035wrq.196.1576238032554; 
 Fri, 13 Dec 2019 03:53:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id g18sm9437905wmh.48.2019.12.13.03.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 03:53:51 -0800 (PST)
Subject: Re: [PATCH] hw/i386: De-duplicate gsi_handler() to remove
 kvm_pc_gsi_handler()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213110736.10767-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3d1afe84-9d17-eaea-bddf-62f1c6064ee9@redhat.com>
Date: Fri, 13 Dec 2019 12:53:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213110736.10767-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: obC1M4pjNUqKAU7agcofwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 kvm@vger.kernel.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/12/19 12:07, Philippe Mathieu-Daud=C3=A9 wrote:
> Both gsi_handler() and kvm_pc_gsi_handler() have the same content,
> except one comment. Move the comment, and de-duplicate the code.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/sysemu/kvm.h |  1 -
>  hw/i386/kvm/ioapic.c | 12 ------------
>  hw/i386/pc.c         |  5 ++---
>  3 files changed, 2 insertions(+), 16 deletions(-)
>=20
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 9fe233b9bf..f5d0d0d710 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -515,7 +515,6 @@ int kvm_irqchip_add_irqfd_notifier(KVMState *s, Event=
Notifier *n,
>  int kvm_irqchip_remove_irqfd_notifier(KVMState *s, EventNotifier *n,
>                                        qemu_irq irq);
>  void kvm_irqchip_set_qemuirq_gsi(KVMState *s, qemu_irq irq, int gsi);
> -void kvm_pc_gsi_handler(void *opaque, int n, int level);
>  void kvm_pc_setup_irq_routing(bool pci_enabled);
>  void kvm_init_irq_routing(KVMState *s);
> =20
> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index f94729c565..bae7413a39 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -48,18 +48,6 @@ void kvm_pc_setup_irq_routing(bool pci_enabled)
>      }
>  }
> =20
> -void kvm_pc_gsi_handler(void *opaque, int n, int level)
> -{
> -    GSIState *s =3D opaque;
> -
> -    if (n < ISA_NUM_IRQS) {
> -        /* Kernel will forward to both PIC and IOAPIC */
> -        qemu_set_irq(s->i8259_irq[n], level);
> -    } else {
> -        qemu_set_irq(s->ioapic_irq[n], level);
> -    }
> -}
> -
>  typedef struct KVMIOAPICState KVMIOAPICState;
> =20
>  struct KVMIOAPICState {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index ac08e63604..97e9049b71 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -350,6 +350,7 @@ void gsi_handler(void *opaque, int n, int level)
> =20
>      DPRINTF("pc: %s GSI %d\n", level ? "raising" : "lowering", n);
>      if (n < ISA_NUM_IRQS) {
> +        /* Under KVM, Kernel will forward to both PIC and IOAPIC */
>          qemu_set_irq(s->i8259_irq[n], level);
>      }
>      qemu_set_irq(s->ioapic_irq[n], level);
> @@ -362,10 +363,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_en=
abled)
>      s =3D g_new0(GSIState, 1);
>      if (kvm_ioapic_in_kernel()) {
>          kvm_pc_setup_irq_routing(pci_enabled);
> -        *irqs =3D qemu_allocate_irqs(kvm_pc_gsi_handler, s, GSI_NUM_PINS=
);
> -    } else {
> -        *irqs =3D qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
>      }
> +    *irqs =3D qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
> =20
>      return s;
>  }
>=20

Queued, thanks.

Paolo


