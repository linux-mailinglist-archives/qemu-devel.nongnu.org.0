Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3C3B00A6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:45:57 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcyj-0006kT-0g
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvcwF-0004uI-LV
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:43:23 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:41682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tabba@google.com>) id 1lvcwC-0000Dl-Ji
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:43:22 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 v22-20020a0568301416b029044e2d8e855eso11424552otp.8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mOZsVL4W9RtqKElq9uj4H6IEXm0Hjxy6DO7qW7nF8+s=;
 b=ux0YEZplnfIscu7weLF3XpMoCtMnkNmS6hVSWuN56okSLW/zGV1P+guRXMFRqRkbf7
 Orp3GVpNMWhLy8UtZep53Z6pymX+WaeuKiMBhSvFvW6/XyhpgTlktM+RQbnkC8iI/O3J
 SNDkBBMrMo+ywAPTzu2X1V2oRTSHHVxXL0N6GZQ66fkZMVbICFky94VQxIOgL1khTDJ/
 10I1gamEP+yLZDLwjGD3OLmFleSlcamkg+L3gTC5dl81NSS/qNHiLNYAALAy1X1kjFhq
 ep/UgbeZLCglgQHlqBhfpYHMWUpBPmett/7lXuSbLiI7EYBc+8nCCO8QEvWc/dd2Xg8E
 FkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mOZsVL4W9RtqKElq9uj4H6IEXm0Hjxy6DO7qW7nF8+s=;
 b=T6Auig6yE8FKldLPjMKuIEzClmmZx8QkHrZsBDStvKx4O3FOyfcdePBO9634GRmr/B
 6QSlHnWQ0eZEtSyzu7R5CjgwyNl4zRzxPjeZteeP5++XZB208zW5tF6Z1QxPu6HkgeG0
 mSvUKNKR+CTMcZ5xRQJ2k6KMLFyCaTtMbeH7maeq7DRp6oBHRLGhWwPGD6HjWDz/A82c
 SMKhoUh65wm6bQtmcG5+aBOSOgQZliIOmOpGRSr5V7bMu4z6oI2xp1x+QIcLyjuw28Sl
 cMm6js8QwTX8wpTLeCRh+Nf7Q+PIjsoFVoPN/+VHKgvYvZdJtzFvOXkz8ZnlDLx6QhD6
 Ne5Q==
X-Gm-Message-State: AOAM533+1vJEtsSBmgSFa9zqlfPAM+KXfywM5HeHmUuInmX3GKwxTorK
 rRfLPqSWTasvWujr+t9FqraDcNjj3jyMs96sRSrn9A==
X-Google-Smtp-Source: ABdhPJzlIDoe2rVjsQdnkHJBL+8HQrVMGP+s17mqW1WIzdE5TsTe6sX5gcHWH9dUwFLCPfuFLUMJObjVJ+/GHUBWjfw=
X-Received: by 2002:a05:6830:2315:: with SMTP id
 u21mr2367474ote.365.1624354999094; 
 Tue, 22 Jun 2021 02:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210621111716.37157-1-steven.price@arm.com>
 <20210621111716.37157-7-steven.price@arm.com>
In-Reply-To: <20210621111716.37157-7-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 22 Jun 2021 10:42:42 +0100
Message-ID: <CA+EHjTwww=QFq30bi8n2t2fkfr1B_0v0KSZ75dK+ZJDUU3f5xQ@mail.gmail.com>
Subject: Re: [PATCH v17 6/6] KVM: arm64: Document MTE capability and ioctl
To: Steven Price <steven.price@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Will Deacon <will@kernel.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, 
 Dave Martin <Dave.Martin@arm.com>, Juan Quintela <quintela@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, kvmarm@lists.cs.columbia.edu, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=tabba@google.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -155
X-Spam_score: -15.6
X-Spam_bar: ---------------
X-Spam_report: (-15.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_DOTEDU=1.999, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

Hi,


On Mon, Jun 21, 2021 at 12:18 PM Steven Price <steven.price@arm.com> wrote:
>
> A new capability (KVM_CAP_ARM_MTE) identifies that the kernel supports
> granting a guest access to the tags, and provides a mechanism for the
> VMM to enable it.
>
> A new ioctl (KVM_ARM_MTE_COPY_TAGS) provides a simple way for a VMM to
> access the tags of a guest without having to maintain a PROT_MTE mapping
> in userspace. The above capability gates access to the ioctl.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  Documentation/virt/kvm/api.rst | 61 ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 7fcb2fd38f42..97661a97943f 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -5034,6 +5034,43 @@ see KVM_XEN_VCPU_SET_ATTR above.
>  The KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST type may not be used
>  with the KVM_XEN_VCPU_GET_ATTR ioctl.
>
> +4.130 KVM_ARM_MTE_COPY_TAGS
> +---------------------------
> +
> +:Capability: KVM_CAP_ARM_MTE
> +:Architectures: arm64
> +:Type: vm ioctl
> +:Parameters: struct kvm_arm_copy_mte_tags
> +:Returns: number of bytes copied, < 0 on error (-EINVAL for incorrect
> +          arguments, -EFAULT if memory cannot be accessed).
> +
> +::
> +
> +  struct kvm_arm_copy_mte_tags {
> +       __u64 guest_ipa;
> +       __u64 length;
> +       void __user *addr;
> +       __u64 flags;
> +       __u64 reserved[2];
> +  };
> +
> +Copies Memory Tagging Extension (MTE) tags to/from guest tag memory. The
> +``guest_ipa`` and ``length`` fields must be ``PAGE_SIZE`` aligned. The ``addr``
> +field must point to a buffer which the tags will be copied to or from.
> +
> +``flags`` specifies the direction of copy, either ``KVM_ARM_TAGS_TO_GUEST`` or
> +``KVM_ARM_TAGS_FROM_GUEST``.
> +
> +The size of the buffer to store the tags is ``(length / 16)`` bytes
> +(granules in MTE are 16 bytes long). Each byte contains a single tag
> +value. This matches the format of ``PTRACE_PEEKMTETAGS`` and
> +``PTRACE_POKEMTETAGS``.
> +
> +If an error occurs before any data is copied then a negative error code is
> +returned. If some tags have been copied before an error occurs then the number
> +of bytes successfully copied is returned. If the call completes successfully
> +then ``length`` is returned.
> +
>  5. The kvm_run structure
>  ========================
>
> @@ -6362,6 +6399,30 @@ default.
>
>  See Documentation/x86/sgx/2.Kernel-internals.rst for more details.
>
> +7.26 KVM_CAP_ARM_MTE
> +--------------------
> +
> +:Architectures: arm64
> +:Parameters: none
> +
> +This capability indicates that KVM (and the hardware) supports exposing the
> +Memory Tagging Extensions (MTE) to the guest. It must also be enabled by the
> +VMM before creating any VCPUs to allow the guest access. Note that MTE is only
> +available to a guest running in AArch64 mode and enabling this capability will
> +cause attempts to create AArch32 VCPUs to fail.

I was wondering if there might be an issue with AArch32 at EL0 and
MTE, because I think that even if AArch64 at EL1 is disallowed, the
guest can still run AArch32 at EL0.

Thanks,
/fuad

> +
> +When enabled the guest is able to access tags associated with any memory given
> +to the guest. KVM will ensure that the tags are maintained during swap or
> +hibernation of the host; however the VMM needs to manually save/restore the
> +tags as appropriate if the VM is migrated.
> +
> +When this capability is enabled all memory in memslots must be mapped as
> +not-shareable (no MAP_SHARED), attempts to create a memslot with a
> +MAP_SHARED mmap will result in an -EINVAL return.
> +
> +When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
> +perform a bulk copy of tags to/from the guest.
> +
>  8. Other capabilities.
>  ======================
>
> --
> 2.20.1
>
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm

