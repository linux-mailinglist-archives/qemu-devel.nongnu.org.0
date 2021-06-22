Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233F33B01AA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:45:42 +0200 (CEST)
Received: from localhost ([::1]:58312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvduX-0005oN-7L
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvdrW-0001iw-D3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:42:34 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvdrS-0004Gs-UH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:42:34 -0400
Received: by mail-oi1-x230.google.com with SMTP id w1so10040971oie.13
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 03:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u9LsbEZiezKhlK0VsTrDDolUHa3phfsN7g8L8H/DuWQ=;
 b=jjhUmp+J5W3igAnik5/znZuCohxssSkcipc6jHqF31KBMBLHC+wv4dvXHuuLLjW6Xl
 sQZIXvfaSiEbyr+GO3TE+9gTMq2QjZLX6JYYTA6Poie3H1O/4D+oHTxYLPv/Kh5Zc6aV
 1M7HvHGPa+iOlWcT2J2KQBgaMaYlPAnsxF4ig1psY40+5VfeEAICdl2jvcZp+ZGUJYHr
 YUdEEPbRXkZ2C8RtVh/2y4vY6pLn3y9u/eB+EiT8XNkpcwnNfPC9RXu87tY6a2m5wF2A
 GjCYDRdLDzvM8nMLcc7lV6iozGs1/CXTXChXoo3M5pfHI6CQVilIH4M+bwXo5bUqZeEg
 mZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9LsbEZiezKhlK0VsTrDDolUHa3phfsN7g8L8H/DuWQ=;
 b=Do4ID+wtmyP+8uQsDKFUvtyHIKKXFNGKF4iANpXVd1u1EuoYaXkdYsU70JswzyGHKs
 D98+b/Xx8gJu6w7N3ewka/+E2aM96tSBbf1TZd5Yamie5HSArs4KGU5yN/ulpPeoUc91
 CX+ddANBC62U0hhQYRv0HLCivCvgvivZE1quNbQgeL7eNRiO0GVmmHvYewu4mjQy7UMJ
 AZy0JpJXcMSOTt/RzNaSl4VPz0Ezbpm/5YWQvEnOymyhpXH72eYSlan9p6cj+cEtnRLW
 +X86DU9SEFseBUYni9vwSwSSs/Zq048+no1g1wtCL5WjinQBNxlENRufLWvYYSo2zqv8
 fv0Q==
X-Gm-Message-State: AOAM531mApESj4fp0TUrCWGWESHLGqRp8w4fES1XnOi10Fy7Gve9nFV1
 qLpFgh+kOvrLRAWfV4X9NP4qGmZBkWXF4VS8X946nA==
X-Google-Smtp-Source: ABdhPJz8qKFU+PeULxGcMib7uCs/Wju6IcRScAGlEI/0rntsAYUmwdpgQWNQ1ylLw9nqTDP4WojBowEwZ8vhGKrXDHs=
X-Received: by 2002:aca:b38a:: with SMTP id c132mr2598605oif.90.1624358549606; 
 Tue, 22 Jun 2021 03:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210621111716.37157-1-steven.price@arm.com>
 <20210621111716.37157-7-steven.price@arm.com>
 <CA+EHjTwww=QFq30bi8n2t2fkfr1B_0v0KSZ75dK+ZJDUU3f5xQ@mail.gmail.com>
 <874kdqchlx.wl-maz@kernel.org>
In-Reply-To: <874kdqchlx.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 22 Jun 2021 11:41:53 +0100
Message-ID: <CA+EHjTw7DqZs9j-nZJKD5QfjFJHYy_uGt8LBiWxbHfkCyBTC5g@mail.gmail.com>
Subject: Re: [PATCH v17 6/6] KVM: arm64: Document MTE capability and ioctl
To: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, 
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=tabba@google.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.009,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On Tue, Jun 22, 2021 at 11:35 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 22 Jun 2021 10:42:42 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi,
> >
> >
> > On Mon, Jun 21, 2021 at 12:18 PM Steven Price <steven.price@arm.com> wrote:
> > >
> > > A new capability (KVM_CAP_ARM_MTE) identifies that the kernel supports
> > > granting a guest access to the tags, and provides a mechanism for the
> > > VMM to enable it.
> > >
> > > A new ioctl (KVM_ARM_MTE_COPY_TAGS) provides a simple way for a VMM to
> > > access the tags of a guest without having to maintain a PROT_MTE mapping
> > > in userspace. The above capability gates access to the ioctl.
> > >
> > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > ---
> > >  Documentation/virt/kvm/api.rst | 61 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > index 7fcb2fd38f42..97661a97943f 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -5034,6 +5034,43 @@ see KVM_XEN_VCPU_SET_ATTR above.
> > >  The KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST type may not be used
> > >  with the KVM_XEN_VCPU_GET_ATTR ioctl.
> > >
> > > +4.130 KVM_ARM_MTE_COPY_TAGS
> > > +---------------------------
> > > +
> > > +:Capability: KVM_CAP_ARM_MTE
> > > +:Architectures: arm64
> > > +:Type: vm ioctl
> > > +:Parameters: struct kvm_arm_copy_mte_tags
> > > +:Returns: number of bytes copied, < 0 on error (-EINVAL for incorrect
> > > +          arguments, -EFAULT if memory cannot be accessed).
> > > +
> > > +::
> > > +
> > > +  struct kvm_arm_copy_mte_tags {
> > > +       __u64 guest_ipa;
> > > +       __u64 length;
> > > +       void __user *addr;
> > > +       __u64 flags;
> > > +       __u64 reserved[2];
> > > +  };
> > > +
> > > +Copies Memory Tagging Extension (MTE) tags to/from guest tag memory. The
> > > +``guest_ipa`` and ``length`` fields must be ``PAGE_SIZE`` aligned. The ``addr``
> > > +field must point to a buffer which the tags will be copied to or from.
> > > +
> > > +``flags`` specifies the direction of copy, either ``KVM_ARM_TAGS_TO_GUEST`` or
> > > +``KVM_ARM_TAGS_FROM_GUEST``.
> > > +
> > > +The size of the buffer to store the tags is ``(length / 16)`` bytes
> > > +(granules in MTE are 16 bytes long). Each byte contains a single tag
> > > +value. This matches the format of ``PTRACE_PEEKMTETAGS`` and
> > > +``PTRACE_POKEMTETAGS``.
> > > +
> > > +If an error occurs before any data is copied then a negative error code is
> > > +returned. If some tags have been copied before an error occurs then the number
> > > +of bytes successfully copied is returned. If the call completes successfully
> > > +then ``length`` is returned.
> > > +
> > >  5. The kvm_run structure
> > >  ========================
> > >
> > > @@ -6362,6 +6399,30 @@ default.
> > >
> > >  See Documentation/x86/sgx/2.Kernel-internals.rst for more details.
> > >
> > > +7.26 KVM_CAP_ARM_MTE
> > > +--------------------
> > > +
> > > +:Architectures: arm64
> > > +:Parameters: none
> > > +
> > > +This capability indicates that KVM (and the hardware) supports exposing the
> > > +Memory Tagging Extensions (MTE) to the guest. It must also be enabled by the
> > > +VMM before creating any VCPUs to allow the guest access. Note that MTE is only
> > > +available to a guest running in AArch64 mode and enabling this capability will
> > > +cause attempts to create AArch32 VCPUs to fail.
> >
> > I was wondering if there might be an issue with AArch32 at EL0 and
> > MTE, because I think that even if AArch64 at EL1 is disallowed, the
>
> Did you mean AArch32 here?

Yes.

> > guest can still run AArch32 at EL0.
>
> I don't get your question:
>
> - If the guest is AArch32 at EL1, there is not MTE whatsoever (where
>   would you place the tag?)
>
> - If the guest is AArch64, it can have MTE enabled or not,
>   irrespective of the EL. If this guest decides to run an AArch32 EL0,
>   the architecture rules still apply, and it cannot expose MTE to its
>   own 32bit userspace. Nothing that KVM needs to do about this.
>
> What KVM enforces is that at the point where the guest is in charge,
> we have a consistent architectural behaviour.

This answers my question. I was wondering whether we should be
concerned with the case where the guest decides to run an AArch32 EL0.

Thanks,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

