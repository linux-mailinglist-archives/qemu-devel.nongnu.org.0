Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0E58EED4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:52:56 +0200 (CEST)
Received: from localhost ([::1]:44020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLn4p-0008Kw-P9
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oLn2M-0004zD-Rb
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oLn2I-00043k-0W
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660143014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeSW4K0oQHPQz01A6d5k/ngS9xAcRK/YzlN4mAf7+wo=;
 b=LT6cQ4kKV0rvJ0sNXmyYogiU5RV1FjpnDkMWPDLajOtJPEH+HT7fJjiBzuRNkUWcWXMh22
 3nQtEtJgwUzvomQ4eOeq1k0c9gVXxmWMEnS/akUmZna38tOngPr+9Pg9MQAfRyhnCNZobl
 OgRvQlT4Y/SpK0wEv7oqH6ybTUo0qlk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-BCZa6v8fOYOgOahXrJrBPQ-1; Wed, 10 Aug 2022 10:50:13 -0400
X-MC-Unique: BCZa6v8fOYOgOahXrJrBPQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 bp14-20020a05620a458e00b006b959ef9d51so6414691qkb.12
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 07:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=oeSW4K0oQHPQz01A6d5k/ngS9xAcRK/YzlN4mAf7+wo=;
 b=HdfVCeNrlhE7GGsPRgakKvamMS4Ax1AJ6j2VD2uwd8edK5LH1Fz4l7Ve3CfLI6GDip
 TrVrtItDvvADmew6kwHoTEUaa9WlGmQmA2rVLlBbaPBHeCSy6urm1Pi5BYtkyCR4SOrY
 itTdGpsJmCoe8S/rCRqziPTBtuyOnnbbZWcAoB9X78zFhI1EOETvv62akeGTTqlTv6Dw
 3JbVGOAnyyXnH2yRl6N03bgbn7DmI5RqKubDqxN1RxQ/In2WyGENgbbNBnL7vAD2a+VE
 yrGgtmKdCG91vY61rnRFc+t5ts4uZbxFxG0AYQWnX5tYnXuDDLzy4tRICnZqw9TAqnDX
 db/A==
X-Gm-Message-State: ACgBeo3iQrnkneaC3CmtzSAYIq7kghQqXRDqcCYUSbnMOCMPXDPb5abO
 1gPXw+wUZWnbQ96f8atSYdoo01Exin7BZAyJ1Z2ck7Ctmva+a+k1dDfxERk0Am9hKWsiWjAW0kf
 2Te++RXPOZCz823A=
X-Received: by 2002:ad4:5bc8:0:b0:476:bc85:d3ad with SMTP id
 t8-20020ad45bc8000000b00476bc85d3admr23990414qvt.4.1660143013220; 
 Wed, 10 Aug 2022 07:50:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Z9taZ1Pqgd1pzTw+c1qkqpVXUKu7VEKiw+GrZH6zhOufYdCnl87jPMCdTBrTuXkDxNig/IA==
X-Received: by 2002:ad4:5bc8:0:b0:476:bc85:d3ad with SMTP id
 t8-20020ad45bc8000000b00476bc85d3admr23990404qvt.4.1660143013049; 
 Wed, 10 Aug 2022 07:50:13 -0700 (PDT)
Received: from [10.35.4.238] (bzq-82-81-161-50.red.bezeqint.net.
 [82.81.161.50]) by smtp.gmail.com with ESMTPSA id
 e13-20020ac8490d000000b00342f80223adsm6349227qtq.89.2022.08.10.07.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 07:50:12 -0700 (PDT)
Message-ID: <d7051dc5a5fe9d96c9dcdd6527f52c6ea654928d.camel@redhat.com>
Subject: Re: [PATCH RFC v1 1/2] i386: reset KVM nested state upon CPU reset
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Date: Wed, 10 Aug 2022 17:50:10 +0300
In-Reply-To: <20220810140007.1036293-2-vkuznets@redhat.com>
References: <20220810140007.1036293-1-vkuznets@redhat.com>
 <20220810140007.1036293-2-vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-08-10 at 16:00 +0200, Vitaly Kuznetsov wrote:
> Make sure env->nested_state is cleaned up when a vCPU is reset, it may
> be stale after an incoming migration, kvm_arch_put_registers() may
> end up failing or putting vCPU in a weird state.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f148a6d52fa4..4f8dacc1d4b5 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1695,6 +1695,30 @@ static void kvm_init_xsave(CPUX86State *env)
>             env->xsave_buf_len);
>  }
>  
> +static void kvm_init_nested_state(CPUX86State *env)
> +{
> +    struct kvm_vmx_nested_state_hdr *vmx_hdr;
> +    uint32_t size;
> +
> +    if (!env->nested_state) {
> +        return;
> +    }
> +
> +    size = env->nested_state->size;
> +
> +    memset(env->nested_state, 0, size);
> +    env->nested_state->size = size;
> +
> +    if (cpu_has_vmx(env)) {
> +        env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
> +        vmx_hdr = &env->nested_state->hdr.vmx;
> +        vmx_hdr->vmxon_pa = -1ull;
> +        vmx_hdr->vmcs12_pa = -1ull;
> +    } else if (cpu_has_svm(env)) {
> +        env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
> +    }
> +}
> +
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
>      struct {
> @@ -2122,19 +2146,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          assert(max_nested_state_len >= offsetof(struct kvm_nested_state, data));
>  
>          if (cpu_has_vmx(env) || cpu_has_svm(env)) {
> -            struct kvm_vmx_nested_state_hdr *vmx_hdr;
> -
>              env->nested_state = g_malloc0(max_nested_state_len);
>              env->nested_state->size = max_nested_state_len;
>  
> -            if (cpu_has_vmx(env)) {
> -                env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
> -                vmx_hdr = &env->nested_state->hdr.vmx;
> -                vmx_hdr->vmxon_pa = -1ull;
> -                vmx_hdr->vmcs12_pa = -1ull;
> -            } else {
> -                env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
> -            }
> +            kvm_init_nested_state(env);
>          }
>      }
>  
> @@ -2199,6 +2214,8 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
>      /* enabled by default */
>      env->poll_control_msr = 1;
>  
> +    kvm_init_nested_state(env);
> +
>      sev_es_set_reset_vector(CPU(cpu));
>  }
>  
Makes sense.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


