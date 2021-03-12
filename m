Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFD338350
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:54:33 +0100 (CET)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKX0a-0002Ld-JO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWwc-0005oN-PQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:50:28 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:42111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWwa-0004bQ-Bh
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:50:26 -0500
Received: by mail-io1-xd2f.google.com with SMTP id u20so24086058iot.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKXrHldIIBsjvr3+URYqe96BijLsBRBaJyF4AeZ6as8=;
 b=Jfj/dyFChhSxyt8t3Sg5gNnEf7hpE5JVlvJPjcZFowbwKeT1sFeYb8HUaANIQN7jKw
 qpPsvJUdN5QhZ7le+pK7VsCfwna5If8ZKM7IgWOuw7uKxID4RpGREd7UFZxOpNWkZzYi
 D5zYcOdf6w82its0jrYaEdbjmCnVOJ7rzx33DHnLHdVbqWlHX+DKYZXwgJckmxVZ717q
 jVkUe/nANGUD9QrJEBKsm3WEm51rnp9oJ5zNqJzn6xB6b9iVH5PUTTl4FwBwQsepOyvP
 7wlnE0tVhsvp+eRusC1xPE4JS0IW6V+21O23k8kTmhbo/BKSerVjxK1kd3KT2oqSIaix
 GnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKXrHldIIBsjvr3+URYqe96BijLsBRBaJyF4AeZ6as8=;
 b=epNEfHLcR/Kf79RBHvaQVKVNnsm4okOwDNE5SomISZGYBdTdnpqvHr6hqR+a8oIjo9
 TRu7y/g2aLy5s3S2CghEM1g2XgzCB2aRdQj/Ghxpa3Jp9w7T6UFVK5DrLhB0PSKLDRpO
 ZUDy5/Z/XoSHFcdRGR+2FoI37+I7z31xwD/B6M7Iq5eU2P+PAih+ZZEYUggyOg0PXvG/
 /PdX0o6MwVMw0vnavMMXR3CLesKBvLcYoLvSD81AVDelX8YooP/4yGdaceQXFwfPY5qK
 FGmLb9XCeyAeJqc2COuCX1PBmeyl2NaE+PWCDJleoloDmfdsq9ZJtGa1oIe1G+SgelKV
 vIpA==
X-Gm-Message-State: AOAM532HSP6lt2onjNYUEy34k2QfafsJWE6LjPY5xfbGOXVAr/v+dMUp
 DkMHpWKn5uhPbyVaa3ddIVXig45kzSFFgRBneaxu
X-Google-Smtp-Source: ABdhPJwbp4LF4RHl6B81wkcymjpKHtAAe8yCfa5w5WdC/5/A/4KElF8Twy9TiKeEMN3F0Hx8aJaPxz68XQwZlZ/BYvw=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr8525268ioq.13.1615513823084; 
 Thu, 11 Mar 2021 17:50:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <ae69254130370fff4c9a38673deb1e3a27609e9c.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <ae69254130370fff4c9a38673deb1e3a27609e9c.1612747873.git.haibo.xu@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 12 Mar 2021 09:50:11 +0800
Message-ID: <CAJc+Z1HST_3w_Cgm+7D_LUw_s5iEz2J0ey2JkSeZACHCkyj8pQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] Add APIs to get/set MTE tags
To: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd2f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

++ more migration experts!

On Mon, 8 Feb 2021 at 11:20, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> MTE spec provide instructions to retrieve the memory tags:
> (1) LDG, at 16 bytes granularity, and available in both user
>     and kernel space;
> (2) LDGM, at 256 bytes granularity in maximum, and only
>     available in kernel space
>
> To improve the performance, KVM has exposed the LDGM capability
> to user space by providing a new APIs. This patch is just a
> wrapper for the KVM APIs.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
>  target/arm/kvm_arm.h |  2 ++
>  2 files changed, 26 insertions(+)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 23f34034db..4a6790d53b 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -1608,3 +1608,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
>      }
>      return false;
>  }
> +
> +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> +{
> +    struct kvm_arm_copy_mte_tags args = {
> +        .guest_ipa = ipa,
> +        .length = len,
> +        .addr = buf,
> +        .flags = KVM_ARM_TAGS_FROM_GUEST,
> +    };
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
> +}
> +
> +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> +{
> +    struct kvm_arm_copy_mte_tags args = {
> +        .guest_ipa = ipa,
> +        .length = len,
> +        .addr = buf,
> +        .flags = KVM_ARM_TAGS_TO_GUEST,
> +    };
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
> +}
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index eb81b7059e..1b94dbe7c8 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -358,6 +358,8 @@ int kvm_arm_vgic_probe(void);
>
>  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
>  void kvm_arm_pmu_init(CPUState *cs);
> +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
>
>  /**
>   * kvm_arm_pvtime_init:
> --
> 2.17.1
>

