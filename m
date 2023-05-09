Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2856FC9A7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:56:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOlH-0006Yc-Fk; Tue, 09 May 2023 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOlC-0006UL-G9
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:56:14 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOlA-0003bo-8T
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:56:14 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50db7f0a1b4so1536996a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683644169; x=1686236169;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TFaaj/6Ld8vJKoqN7Y7ch6XzfEfl83cBt43HKwvW+0U=;
 b=jSiEZz5IXZXr20jqdPiR5wS43Bt3mvJANb+NRfHJyamvsc1bJ3Z+mcjNR59Oj9jMKR
 naMCRsaO5m0sD4rLmY7QCNGAU3kUsd6AtzyYPtCkgpozalPglF/MY8wF92/gexNwZw5u
 ozWiXDiafTfiqll/RcTRm/PDfCDhWP+/6zFTxChlOyScuO1PXKyyKEQGUuaWg5gF/la5
 1durNKwAUkqPivzpKLdD9crxf6qiV7iPcLEj2iO9xSxkHWrZZrGxmyGCtklqW096NupC
 taJ8MW/ZiBCJE5RmIHf3L2K8ZthQ2+c+n91afMKAF58JhzI61SlPh/f6PIzZr5ou42Sc
 aTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683644169; x=1686236169;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFaaj/6Ld8vJKoqN7Y7ch6XzfEfl83cBt43HKwvW+0U=;
 b=Jp2aN6KZTSs2UcnywXALY+/NQOiKTtiqMV+PAHRLm69Oq4nVn16Rry/KnExBvt+g30
 h3oHh0rI+aywXmUMnLK77nSM+K+o2Ep/cljJw6Hq9ge/JgjZaf21UhwqJbSVRz6fi6rf
 0i5IHJjW9x3D2H3vcRvLjkj/LA022g0UusHb5JkO6VJ67AKUk4UumS3HjkmnztkkFYCL
 xgenyNralGYOKP/+CCerOxUYrt65qmQ5C+ZRzrX6mi5lKeaqm8+wH/hJxNRw9WwGWiOH
 /D2hXc7ZrGM9RsG8Y2yn7pRZ6TdAaCRFSHDsViXHfHHKB6zg97Upjw4t2PW+YANfbm2N
 Cf4w==
X-Gm-Message-State: AC+VfDxDrFur+5ZSZlel/juWojwwNW/NmYG9zdZxfvfqhIpuV7QFelWQ
 0k6YygREPbXJUzGJ/33/j8wNY1+MzKmCOvGwnMB4yQ==
X-Google-Smtp-Source: ACHHUZ7TXCGjY2fHWJTUXKqo0cUXLdaO7H7/rxfmcTTQGmlTtGz2hj/9UZ+GDTV6RwDDa2L8u4aKMIe6Tq0WWlE7GbU=
X-Received: by 2002:a50:fe8c:0:b0:506:ba8d:c317 with SMTP id
 d12-20020a50fe8c000000b00506ba8dc317mr10646376edt.40.1683644169156; Tue, 09
 May 2023 07:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230302123029.153265-1-pbonzini@redhat.com>
 <20230302123029.153265-33-pbonzini@redhat.com>
In-Reply-To: <20230302123029.153265-33-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 15:55:58 +0100
Message-ID: <CAFEAcA-s+sNDn4z_kXd70koFGSLXqjMUXB5Gn9VzTnaSbr2B_Q@mail.gmail.com>
Subject: Re: [PULL 32/62] hw/xen: Implement EVTCHNOP_bind_virq
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw@amazon.co.uk>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 2 Mar 2023 at 12:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Add the array of virq ports to each vCPU so that we can deliver timers,
> debug ports, etc. Global virqs are allocated against vCPU 0 initially,
> but can be migrated to other vCPUs (when we implement that).
>
> The kernel needs to know about VIRQ_TIMER in order to accelerate timers,
> so tell it via KVM_XEN_VCPU_ATTR_TYPE_TIMER. Also save/restore the value
> of the singleshot timer across migration, as the kernel will handle the
> hypercalls automatically now.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>

Hi; Coverity points out (CID 1507534) that we seem to sometimes
access env->xen_singleshot_timer_ns under the protection of
env->xen_timers_lock (eg in xen_vcpu_singleshot_timer_event())
and sometimes not (the specific case Coverity complains about is
in do_vcpu_soft_reset()). Is this a false positive, or is there
missing locking here ?

>  /* The x86 has a strong memory model with some store-after-load re-ordering */
>  #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
>
> @@ -1806,6 +1808,8 @@ typedef struct CPUArchState {
>      uint64_t xen_vcpu_time_info_gpa;
>      uint64_t xen_vcpu_runstate_gpa;
>      uint8_t xen_vcpu_callback_vector;
> +    uint16_t xen_virq[XEN_NR_VIRQS];
> +    uint64_t xen_singleshot_timer_ns;
>  #endif
>  #if defined(CONFIG_HVF)
>      HVFX86LazyFlags hvf_lflags;

> @@ -387,6 +434,8 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
>      env->xen_vcpu_time_info_gpa = INVALID_GPA;
>      env->xen_vcpu_runstate_gpa = INVALID_GPA;
>      env->xen_vcpu_callback_vector = 0;
> +    env->xen_singleshot_timer_ns = 0;
> +    memset(env->xen_virq, 0, sizeof(env->xen_virq));
>
>      set_vcpu_info(cs, INVALID_GPA);
>      kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
> @@ -395,6 +444,7 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
>                            INVALID_GPA);
>      if (kvm_xen_has_cap(EVTCHN_SEND)) {
>          kvm_xen_set_vcpu_callback_vector(cs);
> +        kvm_xen_set_vcpu_timer(cs);
>      }
>
>  }

thanks
-- PMM

