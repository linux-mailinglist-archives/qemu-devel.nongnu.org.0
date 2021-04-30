Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B853703ED
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 01:08:21 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lccFA-0000Kg-6r
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 19:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lccEA-0008Mo-OX
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 19:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lccE3-0005Sg-2Y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 19:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619824029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5GATnIFHJgLISpZCG709lZ/54ID7JHRuM/CKp3fcSfo=;
 b=QdGcGV8+X+pbH1cTm6fhsTGllzSfGQPXD+Av3I3kVO59t3Mx0rqqEfeKM2qYsgtixW2w6P
 oD2LHzpUc/RpPOP5eo1b41PxFW8LT23HxjYJC8dDAxNLCrvW0srF3kjhoxtKQX6b/u4SDF
 fBjRx5qNgeKjuv4NNcasZOQsmTTjnG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-21-hRRQNOUiWTOj60L4hSg-1; Fri, 30 Apr 2021 19:07:07 -0400
X-MC-Unique: 21-hRRQNOUiWTOj60L4hSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40BC080B71D
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 23:07:06 +0000 (UTC)
Received: from localhost (ovpn-115-66.phx2.redhat.com [10.3.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5BEE76E31;
 Fri, 30 Apr 2021 23:07:05 +0000 (UTC)
Date: Fri, 30 Apr 2021 19:07:05 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 01/19] i386: keep hyperv_vendor string up-to-date
Message-ID: <20210430230705.pdxvufj73haq5hno@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-2-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-2-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:11:12PM +0200, Vitaly Kuznetsov wrote:
> When cpu->hyperv_vendor is not set manually we default to "Microsoft Hv"
> and in 'hv_passthrough' mode we get the information from the host. This
> information is stored in cpu->hyperv_vendor_id[] array but we don't update
> cpu->hyperv_vendor string so e.g. QMP's query-cpu-model-expansion output
> is incorrect.

I was confused for a while because this can't happen until patch
15/19 is applied.  Probably worth a note in the commit message
indicating that hyperv_handle_properties() will be called by
x86_cpu_expand_features() in the future.

> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/cpu.c     | 19 +++++++++----------
>  target/i386/kvm/kvm.c |  5 +++++
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad99cad0e7ce..2d05df232329 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6665,17 +6665,16 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
>  
>      /* Hyper-V vendor id */
>      if (!cpu->hyperv_vendor) {
> -        memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
> -    } else {
> -        len = strlen(cpu->hyperv_vendor);
> -
> -        if (len > 12) {
> -            warn_report("hv-vendor-id truncated to 12 characters");
> -            len = 12;
> -        }
> -        memset(cpu->hyperv_vendor_id, 0, 12);
> -        memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
> +        object_property_set_str(OBJECT(cpu), "hv-vendor-id", "Microsoft Hv",
> +                                &error_abort);
> +    }
> +    len = strlen(cpu->hyperv_vendor);
> +    if (len > 12) {
> +        warn_report("hv-vendor-id truncated to 12 characters");
> +        len = 12;
>      }
> +    memset(cpu->hyperv_vendor_id, 0, 12);
> +    memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);

Existing issue: hardcoded 12 as the size of hyperv_vendor_id here
(compare with the code you add below using sizeof()).  I don't
think this should hold the whole series, so it can be fixed in a
follow up patch if necessary.

>  
>      /* 'Hv#1' interface identification*/
>      cpu->hyperv_interface_id[0] = 0x31237648;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 7fe9f527103c..ab073a5e9c44 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1215,6 +1215,11 @@ static int hyperv_handle_properties(CPUState *cs,
>              cpu->hyperv_vendor_id[0] = c->ebx;
>              cpu->hyperv_vendor_id[1] = c->ecx;
>              cpu->hyperv_vendor_id[2] = c->edx;
> +            cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
> +                                           sizeof(cpu->hyperv_vendor_id) + 1);
> +            memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
> +                   sizeof(cpu->hyperv_vendor_id));
> +            cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;

I don't like having to do manual g_realloc() + memcpy() here
(calling object_property_set_str() would be simpler), but I
believe it will be easier to clean this up after this whole
series is applied.

Reluctantly:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

>          }
>  
>          c = cpuid_find_entry(cpuid, HV_CPUID_INTERFACE, 0);
> -- 
> 2.30.2
> 

-- 
Eduardo


