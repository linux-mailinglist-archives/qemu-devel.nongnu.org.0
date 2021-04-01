Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA235151B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:25:21 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxK4-0007Ld-If
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRx8J-0002oD-10
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:13:11 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRx8H-0004gi-5T
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:13:10 -0400
Received: by mail-io1-xd31.google.com with SMTP id r193so2126092ior.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AWKPTT8bNs5FG2jpgPpLGL6k9c9hv8L6LF1Nt8/Fn00=;
 b=Gt7LsmAWwFEZ294snmu51+HyNPR1JdtvagV1IKcTy+GXhh5eW0ZSce0V7BKiVFhOVg
 WRmV70Et46St0hSf/lWU18pQvyaukWHzGLIsIXiJdoQnQdLDHUEJTtyN1FSmZUsYw2UL
 lyTopcR5s5O7dc/b9eHCol2djM20wfVwFuI0eITJoHjSffP4SdkgWwa+131JpObS3eSf
 umSmKYDxddEHtSNliDi2W43HwwVV3Jmp8PnQillyPMF5fSc8TVAdvkK4f8jprdGw3Cpm
 vkRFSJAh+MPBtGPQp72QnGWWUac/kcDFk2wMl9qkcDPCBjqL6/FJOH5v6wug69Ox1+d7
 MyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AWKPTT8bNs5FG2jpgPpLGL6k9c9hv8L6LF1Nt8/Fn00=;
 b=ZmXXYsmNHB9b6bNfsY80/n3X/YQo+GkIZYxOi1WrAofHx9oi06uGGApEkuxBb7+s8x
 /XLoD+B+nyVLK8Xd07GiIYs+SP9igqOcmgvIFj5EyQLncIAjiEa/FH4FNlciP8V4zAuH
 qcMIcWgr3ox0tZIz4RD5PylTJc+7sNhuao+sawtFkLUeVHyeOdg26uRwcSDNvRK/sqVQ
 m2D7van/oPMr6WD5Up1DUsBC+qghTZSm2zg+Q9kougj6dvAwiCjIanMt3W9ciVcsPqSi
 yBf2eV7zsTr65otM2O7nOrMNrJMCtWPd0hIlZLI79DmgtbctugWzhzZwAAzitA3Eyvcr
 4FMw==
X-Gm-Message-State: AOAM532VyIaVAJONiRXqgzDJURULSCxRd9a/MXXurRmH1rXiIoP2np9X
 qMyIigYuTauW6YJjWNbmz+J7SMOcYCKvB2mAEObO
X-Google-Smtp-Source: ABdhPJzOrzsDp2/kplTS7llBff45kY9W+m1AZ/0aJPHt2czy8V92Kxg+t9/pFCZHBX8OraOkdCGx8bWFHQlSPd/OiKM=
X-Received: by 2002:a02:a303:: with SMTP id q3mr7975812jai.32.1617282787054;
 Thu, 01 Apr 2021 06:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
 <87tuozo28v.fsf@secure.mitica>
In-Reply-To: <87tuozo28v.fsf@secure.mitica>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 1 Apr 2021 21:12:55 +0800
Message-ID: <CAJc+Z1EzD_5gXHMSbWBh0aEj-LC+yYT0acya8AvrQRmPcE4aFA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] Add APIs to get/set MTE tags
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 20:18, Juan Quintela <quintela@redhat.com> wrote:
>
> Haibo Xu <haibo.xu@linaro.org> wrote:
> > MTE spec provide instructions to retrieve the memory tags:
> > (1) LDG, at 16 bytes granularity, and available in both user
> >     and kernel space;
> > (2) LDGM, at 256 bytes granularity in maximum, and only
> >     available in kernel space
> >
> > To improve the performance, KVM has exposed the LDGM capability
> > to user space by providing a new APIs. This patch is just a
> > wrapper for the KVM APIs.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
> >  target/arm/kvm_arm.h |  2 ++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 73a191f8e1..3157025316 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -1606,3 +1606,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
> >      }
> >      return false;
> >  }
> > +
> > +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> > +{
> > +    struct kvm_arm_copy_mte_tags args = {
> > +        .guest_ipa = ipa,
> > +        .length = len,
> > +        .addr = buf,
> > +        .flags = KVM_ARM_TAGS_FROM_GUEST,
> > +    };
> > +
> > +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
>
> Just a question, how fast/slow are this calls?
>

There is no performance data for this API yet, but at least it's more
efficient than that
to only be able to access a single tag by the EL0 "LDG" instruction.
We will try to
collect some performance data for this KVM API later.

> My understanding is that we are making a kvm call for each page that we
> want to migrate, right?
>

Yes, currently I chose to append the tag values to the page data
during the migration.

> Each time that we want to send it.
>
> Later, Juan.
>
>
> > +}
> > +
> > +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> > +{
> > +    struct kvm_arm_copy_mte_tags args = {
> > +        .guest_ipa = ipa,
> > +        .length = len,
> > +        .addr = buf,
> > +        .flags = KVM_ARM_TAGS_TO_GUEST,
> > +    };
> > +
> > +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
> > +}
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 34f8daa377..bbb833d6c6 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -360,6 +360,8 @@ int kvm_arm_vgic_probe(void);
> >
> >  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
> >  void kvm_arm_pmu_init(CPUState *cs);
> > +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> > +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> >
> >  /**
> >   * kvm_arm_pvtime_init:
>

