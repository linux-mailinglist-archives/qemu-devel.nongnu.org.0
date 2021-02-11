Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62956319137
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:39:15 +0100 (CET)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFvu-00078B-2s
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAFgw-0000qk-PX
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:23:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAFgu-0006qr-SJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613064224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZO0EtVikD90Sui6IUPsiiNny6SOVbGeqe48a8De5hDE=;
 b=apwcgVNoZQY68ccXAA4REkH1V8Gupgc5EtncZlevZaCxMRPbWlM6uKn3+h8e8q3FBJ4+cZ
 Y1XIzjpVP3POSP7gTCBWUZvjX2TM9cRG2QUrGjKvmWBjsCn2xbFmhmyPVstrzwIRWffG6f
 ofjbqQv5fnhMghGdAZcrvZyWbLfjVaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-KQNfVA_2Mbic1mY8kFUArQ-1; Thu, 11 Feb 2021 12:23:42 -0500
X-MC-Unique: KQNfVA_2Mbic1mY8kFUArQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98B6B801978
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 17:23:41 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBB7419C81;
 Thu, 11 Feb 2021 17:23:39 +0000 (UTC)
Date: Thu, 11 Feb 2021 18:23:37 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 20/21] i386: provide simple 'hv-default=on' option
Message-ID: <20210211182337.209986c1@redhat.com>
In-Reply-To: <20210210164033.607612-21-vkuznets@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-21-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 17:40:32 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
> requires listing all currently supported enlightenments ("hv-*" CPU
> features) explicitly. We do have 'hv-passthrough' mode enabling
> everything but it can't be used in production as it prevents migration.
> 
> Introduce a simple 'hv-default=on' CPU flag enabling all currently supported
> Hyper-V enlightenments. Later, when new enlightenments get implemented,
> compat_props mechanism will be used to disable them for legacy machine types,
> this will keep 'hv-default=on' configurations migratable.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  docs/hyperv.txt   | 16 ++++++++++++---
>  target/i386/cpu.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
>  target/i386/cpu.h |  3 +++
>  3 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> index 5df00da54fc4..a54c066cab09 100644
> --- a/docs/hyperv.txt
> +++ b/docs/hyperv.txt
> @@ -17,10 +17,20 @@ compatible hypervisor and use Hyper-V specific features.
>  
>  2. Setup
>  =========
> -No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
> -QEMU, individual enlightenments can be enabled through CPU flags, e.g:
> +All currently supported Hyper-V enlightenments can be enabled by specifying
> +'hv-default=on' CPU flag:
>  
> -  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default ...
> +
> +Alternatively, it is possible to do fine-grained enablement through CPU flags,
> +e.g:
> +
> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-relaxed,hv-vpindex,hv-time ...
> +
> +It is also possible to disable individual enlightenments from the default list,
> +this can be used for debugging purposes:
> +
> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default=on,hv-evmcs=off ...
>  
>  Sometimes there are dependencies between enlightenments, QEMU is supposed to
>  check that the supplied configuration is sane.
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index f8df2caed779..013aa60272d8 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4736,6 +4736,12 @@ static void x86_hv_passthrough_set(Object *obj, bool value, Error **errp)
>  {
>      X86CPU *cpu = X86_CPU(obj);
>  
> +    if (cpu->hyperv_default) {
> +        error_setg(errp,
> +                   "'hv-default' and 'hv-paththrough' are mutually exclusive");
> +        return;
> +    }
> +
>      cpu->hyperv_passthrough = value;
>  
>      /* hv-passthrough overrides everything with what's supported by the host */
> @@ -4748,6 +4754,33 @@ static void x86_hv_passthrough_set(Object *obj, bool value, Error **errp)
>      return;
>  }
>  
> +static bool x86_hv_default_get(Object *obj, Error **errp)
> +{
> +    X86CPU *cpu = X86_CPU(obj);
> +
> +    return cpu->hyperv_default;
> +}
> +
> +static void x86_hv_default_set(Object *obj, bool value, Error **errp)
> +{
> +    X86CPU *cpu = X86_CPU(obj);
> +
> +    if (cpu->hyperv_passthrough) {
> +        error_setg(errp,
> +                   "'hv-default' and 'hv-paththrough' are mutually exclusive");
this check will work only half way, i.e.: hv-paththrough=on,hv-default=on|off
(where off value looks a bit wierd)
but not other way around: hv-default=on,hv-paththrough=on

were you thinking about following error:
  "hv-default can't be used after hv-paththrough were enabled"

or if it symmetric, then putting this check in realizefn() will do the job
as both properties are processed by that time.

> +        return;
> +    }
> +
> +    cpu->hyperv_default = value;
> +
> +    /* hv-default overrides everything with the default set */
> +    if (value) {
> +        cpu->hyperv_features = cpu->hyperv_default_features;
> +        cpu->hyperv_features_on = 0;
> +        cpu->hyperv_features_off = 0;
> +    }
> +}
> +
>  /* Generic getter for "feature-words" and "filtered-features" properties */
>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
>                                        const char *name, void *opaque,
> @@ -7152,6 +7185,21 @@ static void x86_cpu_initfn(Object *obj)
>      if (xcc->model) {
>          x86_cpu_load_model(cpu, xcc->model);
>      }
> +
> +    /* Hyper-V features enabled with 'hv-default=on' */
> +    cpu->hyperv_default_features = BIT(HYPERV_FEAT_RELAXED) |
> +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
> +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
> +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
> +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
> +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
> +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_IPI) |
> +        BIT(HYPERV_FEAT_STIMER_DIRECT);
> +
> +    /* Enlightened VMCS is only available on Intel/VMX */
> +    if (kvm_hv_evmcs_available()) {
> +        cpu->hyperv_default_features |= BIT(HYPERV_FEAT_EVMCS);
> +    }
>  }
>  
>  static int64_t x86_cpu_get_arch_id(CPUState *cs)
> @@ -7486,6 +7534,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>                                     x86_hv_passthrough_get,
>                                     x86_hv_passthrough_set);
>  
> +    object_class_property_add_bool(oc, "hv-default",
> +                              x86_hv_default_get,
> +                              x86_hv_default_set);
> +
>      for (w = 0; w < FEATURE_WORDS; w++) {
>          int bitnr;
>          for (bitnr = 0; bitnr < 64; bitnr++) {
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index b4fbd46f0fc9..59350e70fb51 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1670,6 +1670,9 @@ struct X86CPU {
>      uint64_t hyperv_features_on;
>      uint64_t hyperv_features_off;
>      bool hyperv_passthrough;
> +    /* 'hv-default' enablement */
> +    uint64_t hyperv_default_features;
> +    bool hyperv_default;
>      OnOffAuto hyperv_no_nonarch_cs;
>      uint32_t hyperv_vendor_id[3];
>      uint32_t hyperv_interface_id[4];


