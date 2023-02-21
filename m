Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7369E4A5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:28:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVUc-0000Te-St; Tue, 21 Feb 2023 11:27:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVUZ-0000TB-GN
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:27:47 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVUX-0003pP-JQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:27:47 -0500
Received: by mail-pl1-x631.google.com with SMTP id c1so5866898plg.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676996864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7adh5Zpsike9uLB2dGKjB3/gxohGFUl9F2wMIS5DEeI=;
 b=S6Lb9h4OjaaUk4GMngr3Dew9XWSmrTKr8hUbsbSj2ZXELR70SNqxfQKs7yKW32dWOC
 5au9f+7f5szdfeIUsnHK2zqt7kalbzE2CjMLkedbsOqVOBBG1+5sd79medgwYjx5wbWZ
 oHQAu2k6+pWtf2ALP1ee8g+uJwnC9x7AvBYcQV3ADeq7BqSCVd7uQ0KJN6pkPO2JTjVh
 8HwPtaMeTz3N9Bzpga4ZkjxawGf3CShvMqXVUoD8OUihuVK7E3g6IV9C2a706vSCYv7n
 qKRZLJ+rpKkzi9avsXJmzhMNfN9q04jou01xg+UHQhbo8VXvNEJXHUtoeNNrexTT1ejR
 1JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676996864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7adh5Zpsike9uLB2dGKjB3/gxohGFUl9F2wMIS5DEeI=;
 b=lT66QchqneN+JoNPL9wmLH/5+ivmzygfjLKZw2SbehyyPE8MB4crMycDo5nOM41nu4
 RZHsk3HrhCLSRaIqqViYfX2Q1MwAb9yr2q4xeor6pgjjDE/lWseXw4TXbJ5e326ZddFp
 Fo3bH1dSJ6H9/4lbQMK5Eun87Ai7pU5sjFveIcu5DtZL3ii7SyuLWJUEh0Q7Tj0m9PSK
 A4jSAwNBwkinGSTRYBk0fDKhUPxtgMR7SFc+Tf9OZlHDNf+GQrRp7wOHl1MX4nvadi0X
 kz3tE1jBkioUBJ5NNnGoxxhXzyxOejpwTbDYD7qqgYqVpWUmQLEEvzOtMJI5Kjwus4Qu
 kj6g==
X-Gm-Message-State: AO0yUKWv7VpFaA3QuQeG8a5IwAIQ3bpbw4CBk3b5Jjglt1X3Z/nft7Um
 kaHT9Hw2qBtSkdF6V9IVM7Mqnm0/+OAqipSaITk2gA==
X-Google-Smtp-Source: AK7set888EV+xdQ4eRKDhbpEXFVlm7GlRdbQLuJz2RDaoDcFDsQgzoiFsf8RQlBcCBplSG50j5zs72t/PbS4nyYcbAk=
X-Received: by 2002:a17:902:ab8e:b0:19a:721b:bce1 with SMTP id
 f14-20020a170902ab8e00b0019a721bbce1mr845150plr.23.1676996863917; Tue, 21 Feb
 2023 08:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-6-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-6-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:27:32 +0000
Message-ID: <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023 at 00:40, Gavin Shan <gshan@redhat.com> wrote:
>
> When KVM device "kvm-arm-gicv3" or "arm-its-kvm" is used, we have to
> enable the backup bitmap for the dirty ring. Otherwise, the migration
> will fail because those two devices are using the backup bitmap to track
> dirty guest memory, corresponding to various hardware tables.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  hw/arm/virt.c        | 26 ++++++++++++++++++++++++++
>  target/arm/kvm64.c   | 25 +++++++++++++++++++++++++
>  target/arm/kvm_arm.h | 12 ++++++++++++
>  3 files changed, 63 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 75f28947de..ea9bd98a65 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2024,6 +2024,8 @@ static void machvirt_init(MachineState *machine)
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const CPUArchIdList *possible_cpus;
> +    const char *gictype = NULL;
> +    const char *itsclass = NULL;
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
>      MemoryRegion *tag_sysmem = NULL;
> @@ -2071,6 +2073,30 @@ static void machvirt_init(MachineState *machine)
>       */
>      finalize_gic_version(vms);
>
> +    /*
> +     * When "kvm-arm-gicv3" or "arm-its-kvm" is used, the backup dirty
> +     * bitmap has to be enabled for KVM dirty ring, before any memory
> +     * slot is added. Otherwise, the migration will fail with the dirty
> +     * ring.
> +     */
> +    if (kvm_enabled()) {
> +        if (vms->gic_version != VIRT_GIC_VERSION_2) {
> +            gictype = gicv3_class_name();
> +        }
> +
> +        if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
> +            itsclass = its_class_name();
> +        }
> +
> +        if (((gictype && !strcmp(gictype, "kvm-arm-gicv3")) ||
> +             (itsclass && !strcmp(itsclass, "arm-its-kvm"))) &&
> +            !kvm_arm_enable_dirty_ring_with_bitmap()) {
> +            error_report("Failed to enable the backup bitmap for "
> +                         "KVM dirty ring");
> +            exit(1);
> +        }
> +    }

Why does this need to be board-specific code? Is there
some way we can just do the right thing automatically?
Why does the GIC/ITS matter?

The kernel should already know whether we have asked it
to do something that needs this extra extension, so
I think we ought to be able in the generic "enable the
dirty ring" code say "if the kernel says we need this
extra thing, also enable this extra thing". Or if that's
too early, we can do the extra part in a generic hook a
bit later.

In the future there might be other things, presumably,
that need the backup bitmap, so it would be more future
proof not to need to also change QEMU to add extra
logic checks that duplicate the logic the kernel already has.

thanks
-- PMM

