Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997B338349
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:50:35 +0100 (CET)
Received: from localhost ([::1]:57226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKWwj-0004z7-3V
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWvG-0004NK-2m
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:49:02 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:41260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWvE-00043M-El
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:49:01 -0500
Received: by mail-il1-x134.google.com with SMTP id c10so1165908ilo.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ccL+z8Dr/YWLz2NKXtdS3NF7qoZW6Vs6Ltc+OQVp0H4=;
 b=qPmteqeXw61SweSIYu0RUcJQTOe/T0x81HNtA2uoVQf1hs433INgL8OoObg3SPx1eh
 d73GZS5HRfyH9dvX7OjvYdaub80lJ+/nLZ5WbW4uS24kOe7KCrFGuQ6ErxhcHoSj/eOa
 gstCmr9RnvkXJ/kBZXrf67YIWinpm5fZ8PnX2cUqOqyHKEjvpdDFQDL6tKeTu33A/6b+
 jap703ZvnEWeUhjqWG3B7wSNL5ucNB12prI6b3IQptOoBfYILSXj+A/zmOlxAZIkzRLP
 OMlMyNpLx1sRTIwJPaOkdqm6tf3XucUu+OUDWPycrOheouj6WcE0nV5WvdiD8MSOjcN5
 VqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ccL+z8Dr/YWLz2NKXtdS3NF7qoZW6Vs6Ltc+OQVp0H4=;
 b=S8b3agycjeSCzPMdhaQeCQX4kIUZ596Ke77mSVRw7FKCRnMP+w2FBINZs9SKwqpeDk
 haZxfuScAsc32byxf9bFjsNXoafc1QD71F72lYtHacaS6dUE9rVVrM7IDly0I6Z234Wp
 JHFEAW1uYApJRyv0/5y0sIe8TEnyjYN5mA08ls4yMgxgrxvIKg4pBEOLb7AJ196Ya3yA
 Eg+TlFMDidYvDt8bmEJtB1DmuHzEbRaWjCuz6ti9YiTnCOcY08Ok4cqgAb5O1zj5dxMS
 yfwGtWRSDIVc5vY4LoGgeF3vNwO1CBQDF+bvkpe7nwjGnaYJDJwFUDpVyh9+ilLftvLd
 9ILw==
X-Gm-Message-State: AOAM530uDKBpqu09XDhSPd22RbNV1JAaZThTN1Wg2ZtZoHPGAtSeSTEJ
 fugbzImNq3buH495r/oJp0GjwgLHmCPm2vi7fTi4
X-Google-Smtp-Source: ABdhPJwuvcO5aAm9q1Sros93McfQCY2W1MfMyNxNJIzErUp2IkCF66dkvgM6YMzDP0AGxwMlFzApGDDP0WHuDCi6vM4=
X-Received: by 2002:a92:b70a:: with SMTP id k10mr1062158ili.23.1615513735316; 
 Thu, 11 Mar 2021 17:48:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <432d5c0c6fb79e29f2e7aa4730cf4339d3d858f0.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <432d5c0c6fb79e29f2e7aa4730cf4339d3d858f0.1612747873.git.haibo.xu@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 12 Mar 2021 09:48:43 +0800
Message-ID: <CAJc+Z1FfpbJtEz9VG_nC_22N8fQZs3+F+XAQvQzmuchCfTLcjA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] Update Linux headers with new MTE support
To: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x134.google.com
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
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  linux-headers/linux/kvm.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 020b62a619..6a291a9a35 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
>  #define KVM_CAP_SYS_HYPERV_CPUID 191
>  #define KVM_CAP_DIRTY_LOG_RING 192
> +#define KVM_CAP_ARM_MTE 193
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -1241,6 +1242,19 @@ struct kvm_arm_device_addr {
>         __u64 addr;
>  };
>
> +#define KVM_ARM_TAGS_TO_GUEST           0
> +#define KVM_ARM_TAGS_FROM_GUEST         1
> +
> +struct kvm_arm_copy_mte_tags {
> +       __u64 guest_ipa;
> +       __u64 length;
> +       union {
> +               void *addr;
> +               __u64 padding;
> +       };
> +       __u64 flags;
> +};
> +
>  /*
>   * Device control API, available with KVM_CAP_DEVICE_CTRL
>   */
> @@ -1396,6 +1410,7 @@ struct kvm_s390_ucas_mapping {
>  /* Available with KVM_CAP_PMU_EVENT_FILTER */
>  #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
>  #define KVM_PPC_SVM_OFF                  _IO(KVMIO,  0xb3)
> +#define KVM_ARM_MTE_COPY_TAGS    _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
>
>  /* ioctl for vm fd */
>  #define KVM_CREATE_DEVICE        _IOWR(KVMIO,  0xe0, struct kvm_create_device)
> --
> 2.17.1
>

