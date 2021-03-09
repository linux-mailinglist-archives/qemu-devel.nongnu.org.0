Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E63323A1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:07:56 +0100 (CET)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaDS-00021j-SH
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJa7Y-00051X-RV
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:01:48 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJa7W-00070h-EB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:01:48 -0500
Received: by mail-ed1-x532.google.com with SMTP id l12so19268118edt.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vdZ4o+zoeGhBm3eWUzEKAm3SjsyvDpQ7XHjJEgZbpvA=;
 b=mLLgcOkGiUnzFw3UE3oQBVac/QperD9HatYPiTHaHcjhWXjSDD9xGqDW9WAKvrfswy
 12Kaqb8Mxo0fSaxpDqm5TJki2Vs+jTW3433sX1ZHcUJ2m4/Pi8FnaoAW78pwEm2X2erO
 8fRS7lCr/tep5XCTaV5V8csBu2hfOkYN7lB7rNFPcE42icw/QkJvQMHzxIFuBAyUjAKG
 INrt/uotzmU+770iB07TJu/T//V7mQ1Qt4g/7OPcU5T2DXTKnmMfH8FkMRcC01sKh52i
 FJwt39CTqR9mmdQ4vly4YFUdfl8mt8Hy/tDK5ys81SjtV9JAkLVYUbJnVwi+M/VNYQMN
 5TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vdZ4o+zoeGhBm3eWUzEKAm3SjsyvDpQ7XHjJEgZbpvA=;
 b=Vk8BSWdYYNCtdPMLkokLvEx8CPemKwwOr3Eg+8XRXzWyEozFwbwvWf087W8ar6lnhy
 KCINPkgEY1OLUqNENhNqoAlUgm/d5RDLyMTCJsqhPGp6Xdk5gQXaNGOrY73N4nx7B663
 Fn8506kVOBLztlXKGnpaKlHYQ7bNLW5hsyj3UsryDhKQ2MYMWgvY3+zNJQfDHbOZ2xSY
 +/4SRfKp7rrX/1p4swk6E18rovMW+mrud/bZrO7qTv96BqHlCEfJbvYbwDMgYpbl6VKa
 eRMxDCa68i5/3bNzOV3oFnle08Aanoi/jmoCjsbuyOf6wqRZGRnoDFR0ebssKLNA5223
 Heow==
X-Gm-Message-State: AOAM530iTKql0UCOihcXqgDAfGUNJib60wpMK4TRsJtjGF3dpMbm6RY2
 wvyIZbG3Fxh7pSz/bbr2pprezVspfu1b1Nq8qbApPg==
X-Google-Smtp-Source: ABdhPJxklFVbfFNwNwAAaKz6vbxUZ69o/Z0+23/AeFD9ENbDqkgki+Ljib01MLFfq9nwJFRwK6T2DanfvfvyeHNfctY=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr3358969edv.44.1615287704169; 
 Tue, 09 Mar 2021 03:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20210301142315.30920-1-steven.price@arm.com>
 <20210301142315.30920-7-steven.price@arm.com>
In-Reply-To: <20210301142315.30920-7-steven.price@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 11:01:27 +0000
Message-ID: <CAFEAcA8pkvWeGV19QEaZx+pENDpUTO3=p-euPjkjeiU8OGtZzw@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] KVM: arm64: Document MTE capability and ioctl
To: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Mar 2021 at 14:23, Steven Price <steven.price@arm.com> wrote:
>
> A new capability (KVM_CAP_ARM_MTE) identifies that the kernel supports
> granting a guest access to the tags, and provides a mechanism for the
> VMM to enable it.
>
> A new ioctl (KVM_ARM_MTE_COPY_TAGS) provides a simple way for a VMM to
> access the tags of a guest without having to maintain a PROT_MTE mapping
> in userspace. The above capability gates access to the ioctl.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  Documentation/virt/kvm/api.rst | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index aed52b0fc16e..1406ea138127 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -4939,6 +4939,23 @@ KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO
>  Allows Xen vCPU attributes to be read. For the structure and types,
>  see KVM_XEN_VCPU_SET_ATTR above.
>
> +4.131 KVM_ARM_MTE_COPY_TAGS
> +---------------------------
> +
> +:Capability: KVM_CAP_ARM_MTE
> +:Architectures: arm64
> +:Type: vm ioctl
> +:Parameters: struct kvm_arm_copy_mte_tags
> +:Returns: 0 on success, < 0 on error
> +
> +Copies Memory Tagging Extension (MTE) tags to/from guest tag memory.

Mostly virt/kvm/api.rst seems to include documentation of the
associated structs, something like:

::

  struct kvm_arm_copy_mte_tags {
         __u64 guest_ipa;
         __u64 length;
         union {
                 void __user *addr;
                 __u64 padding;
         };
         __u64 flags;
  };


which saves the reader having to cross-reference against the header file.
It also means you can more naturally use the actual field names in the doc,
eg:

> +The
> +starting address and length of guest memory must be ``PAGE_SIZE`` aligned.

you could say "The guest_ipa and length fields" here.

Also "The addr field must point to a buffer which the tags will
be copied to or from." I assume.

> +The size of the buffer to store the tags is ``(length / MTE_GRANULE_SIZE)``
> +bytes (i.e. 1/16th of the corresponding size).

> + Each byte contains a single tag
> +value. This matches the format of ``PTRACE_PEEKMTETAGS`` and
> +``PTRACE_POKEMTETAGS``.

What are the valid values for 'flags' ? It looks like they specify which
direction the copy is, which we definitely need to document here.

What happens if the caller requests a tag copy for an area of guest
address space which doesn't have tags (eg it has nothing mapped),
or for an area of guest addres space which has tags in some parts
but not in others ?

> +
>  5. The kvm_run structure
>  ========================
>
> @@ -6227,6 +6244,25 @@ KVM_RUN_BUS_LOCK flag is used to distinguish between them.
>  This capability can be used to check / enable 2nd DAWR feature provided
>  by POWER10 processor.
>
> +7.23 KVM_CAP_ARM_MTE
> +--------------------
> +
> +:Architectures: arm64
> +:Parameters: none
> +
> +This capability indicates that KVM (and the hardware) supports exposing the
> +Memory Tagging Extensions (MTE) to the guest. It must also be enabled by the
> +VMM before the guest will be granted access.
> +
> +When enabled the guest is able to access tags associated with any memory given
> +to the guest. KVM will ensure that the pages are flagged ``PG_mte_tagged`` so
> +that the tags are maintained during swap or hibernation of the host, however

s/,/;/

> +the VMM needs to manually save/restore the tags as appropriate if the VM is
> +migrated.
> +
> +When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
> +perform a bulk copy of tags to/from the guest

"guest."

> +
>  8. Other capabilities.
>  ======================
>
> @@ -6716,3 +6752,4 @@ KVM_XEN_HVM_SET_ATTR, KVM_XEN_HVM_GET_ATTR, KVM_XEN_VCPU_SET_ATTR and
>  KVM_XEN_VCPU_GET_ATTR ioctls, as well as the delivery of exception vectors
>  for event channel upcalls when the evtchn_upcall_pending field of a vcpu's
>  vcpu_info is set.
> +
> --
> 2.20.1


Stray whitespace change ?

thanks
-- PMM

