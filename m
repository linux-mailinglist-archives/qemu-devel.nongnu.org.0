Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F832708F2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 00:27:07 +0200 (CEST)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJOqQ-0002Ag-HY
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 18:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJOon-0001b4-DD
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 18:25:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40784
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJOoi-00011n-VV
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 18:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600467919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jEchhEXJHMG9Vp5k+do0atgrHStSmP39xDB9BN7GoQo=;
 b=MUVm984N7x/R6a97WbelIjBGdyMsohdNVD6Z0b5u6Mq1GRDEBf5TMycCtw/9KYgBKJzKOP
 UnWvoRg74Uzl+4pjSAwPnE5J5SOVg4+RpIfh3EVTl3nAOTPbTYmWuswC/yX/oHsznE8MGz
 LuO7amYP2w0Pl5srCMUHN8c+tiujAA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-iIkbbEJ4Ph2ZbNksuDV1xA-1; Fri, 18 Sep 2020 18:25:17 -0400
X-MC-Unique: iIkbbEJ4Ph2ZbNksuDV1xA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E584557039
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 22:25:16 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A51278819;
 Fri, 18 Sep 2020 22:25:16 +0000 (UTC)
Date: Fri, 18 Sep 2020 18:25:15 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC 09/22] i386: add reserved FEAT_HYPERV_ECX CPUID leaf
Message-ID: <20200918222515.GI57321@habkost.net>
References: <20200904145431.196885-1-vkuznets@redhat.com>
 <20200904145431.196885-10-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200904145431.196885-10-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 18:14:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 04, 2020 at 04:54:18PM +0200, Vitaly Kuznetsov wrote:
> As a preparation to expanding Hyper-V CPU features early, add
> reserved FEAT_HYPERV_ECX CPUID leaf.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/cpu.c | 5 +++++
>  target/i386/cpu.h | 1 +
>  target/i386/kvm.c | 2 ++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ef3c672cf415..70588571ccb1 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -974,6 +974,11 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>          },
>          .cpuid = { .eax = 0x40000003, .reg = R_EBX, },
>      },
> +    [FEAT_HYPERV_ECX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        /* reserved */

What does "reserved" mean here?

> +        .cpuid = { .eax = 0x40000003, .reg = R_ECX, },
> +    },
>      [FEAT_HYPERV_EDX] = {
>          .type = CPUID_FEATURE_WORD,
>          .feat_names = {
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 095d0bf75493..39e0e89aa41f 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -521,6 +521,7 @@ typedef enum FeatureWord {
>      FEAT_KVM_HINTS,     /* CPUID[4000_0001].EDX */
>      FEAT_HYPERV_EAX,    /* CPUID[4000_0003].EAX */
>      FEAT_HYPERV_EBX,    /* CPUID[4000_0003].EBX */
> +    FEAT_HYPERV_ECX,    /* CPUID[4000_0003].ECX */
>      FEAT_HYPERV_EDX,    /* CPUID[4000_0003].EDX */
>      FEAT_HV_RECOMM_EAX, /* CPUID[4000_0004].EAX */
>      FEAT_HV_NESTED_EAX, /* CPUID[4000_000A].EAX */
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 96ac719adca1..259be2d514dd 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -1251,6 +1251,7 @@ static int hyperv_handle_properties(CPUState *cs,
>          if (c) {
>              env->features[FEAT_HYPERV_EAX] = c->eax;
>              env->features[FEAT_HYPERV_EBX] = c->ebx;
> +            env->features[FEAT_HYPERV_ECX] = c->ecx;
>              env->features[FEAT_HYPERV_EDX] = c->edx;
>          }
>  
> @@ -1350,6 +1351,7 @@ static int hyperv_handle_properties(CPUState *cs,
>      c->function = HV_CPUID_FEATURES;
>      c->eax = env->features[FEAT_HYPERV_EAX];
>      c->ebx = env->features[FEAT_HYPERV_EBX];
> +    c->ecx = env->features[FEAT_HYPERV_ECX];
>      c->edx = env->features[FEAT_HYPERV_EDX];
>  
>      c = &cpuid_ent[cpuid_i++];
> -- 
> 2.25.4
> 

-- 
Eduardo


