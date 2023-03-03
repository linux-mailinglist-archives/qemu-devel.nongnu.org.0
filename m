Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8026A9F11
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAH6-0006Jw-6h; Fri, 03 Mar 2023 13:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pYAH4-0006Cg-8n
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:36:58 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pYAH2-0005dt-Ex
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:36:58 -0500
Received: by mail-pl1-x629.google.com with SMTP id i5so3694159pla.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677868615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bC58pHzup28Zky1TbGESvWro5VyZ3IUsNOyVUSPwmg=;
 b=YZd2QV5eB66iSr9X9FRWhhSvuk/f5d32BSkCiE+6WrTEPzfn1H8rsb4mw30FHXdh9D
 bOfA0O64/2chI1fzVHzEkBN/g5RBspKX86hCCWLCFkrIsBE0R+vAsvOB7jbCzF6Q7AEH
 gjcGcOvcLptLcuXi1UeoO/c4sRjyzg5AsCY5V+JOd9KACSFkO3qZERSv6ZGW/Ki0tJY9
 ak2TK4Q1rtUVz1xFhaWhU8ndyFT7fnzXLYiU49n+ZgLT+nA2e5dfGIhALtgjorceTgb0
 Vxrw5exKggKanP0EzL3MtrlDZohe+m7AABjWLihbKQ6fsNKGZPKZFQ5vhr25pW7KtLai
 5UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2bC58pHzup28Zky1TbGESvWro5VyZ3IUsNOyVUSPwmg=;
 b=WNdK7g1PDJ3ygNdTCZtxUcjDSdu2OH9+J9SFDjcdrsA7eiNyGeYppkglcINj64xgyS
 8Vukp9b2RXFqj0Pk6Q/TRq4jzgBifcKbwbSGsaUMApV7fK5mXyU9tvpu5QNTOBTpwk3I
 Mao3I4BSNaA7RBdaTHgYftkjGVcM8PttvyZnha8Ul/u80LjTRRXjFx1vuP96UGIs5tOS
 D3A+H9sdhDqi9LW7x7bcNsuzx71lySdmFB+11sBWvXaSP4H8Iss9/bFFL5MvGpViaCP/
 1KCiUS1OXZdmcLOgNgemYJ0ChN4trznRsIkhsNkWNN+NMv4ilte+6HIswl9ftoLn5h1G
 tpew==
X-Gm-Message-State: AO0yUKXbkLoxUKvUvCgYBF9kSLvUUUB/iFag7doMy6dZeeRawnvbEq+x
 ef4KqeqGY/9TrGVVlIPA4KHJ79SyavSvEjSjV5UQrA==
X-Google-Smtp-Source: AK7set9MHUmri16BoFkRZ+7eFjDivLevRLoQxLHmkGrWi4aZiTyuu29A7GDMh10gQH/C1p4q0s5K4wE7I+viHXaGyb4=
X-Received: by 2002:a17:90a:ea0b:b0:237:5e4c:7d78 with SMTP id
 w11-20020a17090aea0b00b002375e4c7d78mr942356pjy.9.1677868614592; Fri, 03 Mar
 2023 10:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303022618.4098825-3-hshan@google.com>
 <5da6862c-523b-91d4-f5b0-90bd0fb25059@linaro.org>
In-Reply-To: <5da6862c-523b-91d4-f5b0-90bd0fb25059@linaro.org>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 10:36:43 -0800
Message-ID: <CAGD3tSxw7zwALJpb-_7x_vWMaojTdPGWyOaKJ7MOzQAUePvVPw@mail.gmail.com>
Subject: Re: [PATCH 3/6] Add the aehd-apic device type.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
 Haitao Shan <haitao.shan@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, 
 "open list:Android Emulator..." <emu-dev@google.com>,
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=hshan@google.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 3, 2023 at 1:59=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Hi Haitao,
>
> On 3/3/23 03:26, Haitao Shan wrote:
> > The aehd-apic device type represents the AEHD in kernel APIC.
> > The irqchips should be always in kernel when AEHD is used.
> >
> > Signed-off-by: Haitao Shan <hshan@google.com>
> > ---
> >   MAINTAINERS                  |   2 +
> >   hw/i386/aehd/apic.c          | 204 +++++++++++++++++++++++
> >   hw/i386/aehd/meson.build     |   4 +
> >   hw/i386/meson.build          |   1 +
> >   include/hw/core/cpu.h        |   7 +
> >   include/sysemu/aehd.h        |  52 ++++++
> >   target/i386/aehd/aehd-all.c  | 315 ++++++++++++++++++++++++++++++++++=
+
> >   target/i386/aehd/aehd.c      |  88 ++++++++++
> >   target/i386/aehd/aehd_int.h  |  50 ++++++
> >   target/i386/aehd/meson.build |   4 +
> >   target/i386/cpu-sysemu.c     |   3 +
> >   target/i386/meson.build      |   1 +
> >   12 files changed, 731 insertions(+)
> >   create mode 100644 hw/i386/aehd/apic.c
> >   create mode 100644 hw/i386/aehd/meson.build
> >   create mode 100644 target/i386/aehd/aehd-all.c
> >   create mode 100644 target/i386/aehd/aehd.c
> >   create mode 100644 target/i386/aehd/aehd_int.h
> >   create mode 100644 target/i386/aehd/meson.build
>
>
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index fb5d9667ca..5ed0600504 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -400,6 +400,13 @@ struct CPUState {
> >       uint32_t kvm_fetch_index;
> >       uint64_t dirty_pages;
> >
> > +    /* Only used in AEHD */
> > +#ifdef _WIN32
> > +    HANDLE aehd_fd;
> > +    struct AEHDState *aehd_state;
> > +    struct aehd_run *aehd_run;
> > +#endif
>
> We are difficultly trying to make this structure generic
> since 2 years now. Since AEHD won't make it to the 8.0 release,
> I'd rather take the time to get this part well done.
Can I know when 8.0 will be released? I don't aim to push my patches
as soon as possible. But understanding the timeline can be helpful.

>
> IIRC we ought to use a AccelCPUState pointer here, allocated by
> AccelCPUClass::cpu_instance_init()
I would agree. Will this be addressed when 8.0 is released?

>
> >       /* Use by accel-block: CPU is executing an ioctl() */
> >       QemuLockCnt in_ioctl_lock;
> >
> > diff --git a/include/sysemu/aehd.h b/include/sysemu/aehd.h
> > index 7ba4234f60..87fa2f8362 100644
> > --- a/include/sysemu/aehd.h
> > +++ b/include/sysemu/aehd.h
> > @@ -14,6 +14,12 @@
> >   #ifndef QEMU_AEHD_H
> >   #define QEMU_AEHD_H
> >
> > +#include "qemu/queue.h"
> > +#include "qemu/accel.h"
> > +#include "hw/core/cpu.h"
> > +#include "exec/memattrs.h"
> > +#include "hw/irq.h"
> > +
> >   #ifdef NEED_CPU_H
> >   # ifdef CONFIG_AEHD
> >   #  define CONFIG_AEHD_IS_POSSIBLE
> > @@ -23,3 +29,49 @@
> >   #endif
> >
> >   #define aehd_enabled()           (0)
> > +
> > +struct aehd_run;
> > +struct aehd_lapic_state;
> > +struct aehd_irq_routing_entry;
> > +
> > +struct AEHDState;
> > +
> > +#define TYPE_AEHD_ACCEL ACCEL_CLASS_NAME("aehd")
> > +typedef struct AEHDState AEHDState;
> > +DECLARE_INSTANCE_CHECKER(AEHDState, AEHD_STATE,
> > +                         TYPE_AEHD_ACCEL)
> > +
> > +extern AEHDState *aehd_state;
> > +
> > +#ifdef NEED_CPU_H
> > +#include "cpu.h"
> > +
> > +/* internal API */
> > +
> > +int aehd_ioctl(AEHDState *s, int type, void *input, size_t input_size,
> > +               void *output, size_t output_size);
> > +int aehd_vm_ioctl(AEHDState *s, int type, void *input, size_t input_si=
ze,
> > +                  void *output, size_t output_size);
> > +int aehd_vcpu_ioctl(CPUState *cpu, int type, void *input, size_t input=
_size,
> > +                    void *output, size_t output_size);
> > +
> > +/* Arch specific hooks */
> > +
> > +/* Notify arch about newly added MSI routes */
> > +int aehd_arch_add_msi_route_post(struct aehd_irq_routing_entry *route,
> > +                                 int vector, PCIDevice *dev);
> > +/* Notify arch about released MSI routes */
> > +int aehd_arch_release_virq_post(int virq);
> > +
> > +int aehd_set_irq(AEHDState *s, int irq, int level);
> > +int aehd_irqchip_send_msi(AEHDState *s, MSIMessage msg);
> > +
> > +void aehd_put_apic_state(DeviceState *d, struct aehd_lapic_state *kapi=
c);
> > +void aehd_get_apic_state(DeviceState *d, struct aehd_lapic_state *kapi=
c);
> > +
> > +#endif /* NEED_CPU_H */
> > +
> > +void aehd_irqchip_commit_routes(AEHDState *s);
> > +void aehd_irqchip_release_virq(AEHDState *s, int virq);
> > +
> > +#endif
>


--=20
Haitao @Google

