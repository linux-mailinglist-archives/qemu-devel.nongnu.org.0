Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12EC31A02F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 14:59:48 +0100 (CET)
Received: from localhost ([::1]:39406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAYz5-0003Gd-Nz
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 08:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAYsa-0003w4-4p
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:53:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAYsY-0006UP-6i
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 08:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613137981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aw8fTwhtM66724aX4iRbc5McdoOYcIthTOGwSmU3hJY=;
 b=GxvIM4v5fb66WRYL59VnKBjQmsNSAVonNdIglmPEJ55RmGCLtGIgcw8Ic5fLoibHO+g8f6
 0xgimVHkrKYXAL2C23PlYEgQuriInYRln4OKB/6xWWeyqI99Nx7EH4k5kuEmyKppSqyE+6
 MOJCHgdXhGe4i9zVyj37aRX0//GCWms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Ypx-loQ4ObOMZXgsEzicuw-1; Fri, 12 Feb 2021 08:52:58 -0500
X-MC-Unique: Ypx-loQ4ObOMZXgsEzicuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63185801965
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 13:52:57 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C122060CFB;
 Fri, 12 Feb 2021 13:52:55 +0000 (UTC)
Date: Fri, 12 Feb 2021 14:52:53 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 17/21] i386: support 'hv-passthrough, hv-feature=off'
 on the command line
Message-ID: <20210212145253.0ae15cfb@redhat.com>
In-Reply-To: <87r1llllg5.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-18-vkuznets@redhat.com>
 <20210211181459.08f14c22@redhat.com>
 <87r1llllg5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, 12 Feb 2021 09:49:46 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Wed, 10 Feb 2021 17:40:29 +0100
> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >  
> >> Currently, we support 'hv-passthrough,hv-feature=on' enablement, this
> >> is supposed to mean "hv-feature is mandatory, don't start without it". Add
> >> support for 'hv-passthrough,hv-feature=off' meaning "enable everything
> >> supported by the host except for hv-feature".
> >> 
> >> While on it, make 'hv-passthrough' parse semantics in-line with other
> >> options in qemu: when specified, it overrides what was previously set with
> >> what's supported by the host. This can later be modified with 'hv-feature=on'/
> >> 'hv-feature=off'.
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >>  target/i386/cpu.c     | 28 +++++++++++++++++++++++++++-
> >>  target/i386/kvm/kvm.c |  4 ++++
> >>  2 files changed, 31 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> >> index e8a004c39d04..f8df2caed779 100644
> >> --- a/target/i386/cpu.c
> >> +++ b/target/i386/cpu.c
> >> @@ -4725,6 +4725,29 @@ static void x86_hv_stimer_direct_set(Object *obj, bool value, Error **errp)
> >>      x86_hv_feature_set(obj, value, HYPERV_FEAT_STIMER_DIRECT);
> >>  }
> >>  
> >> +static bool x86_hv_passthrough_get(Object *obj, Error **errp)
> >> +{
> >> +    X86CPU *cpu = X86_CPU(obj);
> >> +
> >> +    return cpu->hyperv_passthrough;
> >> +}
> >> +
> >> +static void x86_hv_passthrough_set(Object *obj, bool value, Error **errp)
> >> +{
> >> +    X86CPU *cpu = X86_CPU(obj);
> >> +
> >> +    cpu->hyperv_passthrough = value;
> >> +
> >> +    /* hv-passthrough overrides everything with what's supported by the host */
> >> +    if (value) {
> >> +        cpu->hyperv_features = 0;
> >> +        cpu->hyperv_features_on = 0;
> >> +        cpu->hyperv_features_off = 0;  
> >
> > why do we have _on|_off fields?
> >  
> 
> You mean 'why do we have them at all' or 'why do we reset them here'?
> For the former, we need to distinguish between
> 'hv-passthroug,hv-feature=off' and just 'hv-passthrough';
> 'hv-passthrough,hv-evmcs=on' and just 'hv-passthrough'. For the later,

that's what I was asking for, eventually I found it being buried in kvm code

> I'd like to make the samentics you've asked for:
> 'hv-feature,hv-passthrough' == 'hv-passthrough'
you essentially you wrote your own hv-foo parser in kvm_hyperv_expand_features(),
which is a bit complicated for my taste.
With scratch CPU you can simplify and make it easier to read.

> (though I still see it as a gotcha for an unprepared user)
this way it at least works the same way like any other property.

 
> >> +    }
> >> +
> >> +    return;
> >> +}
> >> +
> >>  /* Generic getter for "feature-words" and "filtered-features" properties */
> >>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
> >>                                        const char *name, void *opaque,
> >> @@ -7281,7 +7304,6 @@ static Property x86_cpu_properties[] = {
> >>                         HYPERV_SPINLOCK_NEVER_NOTIFY),
> >>      DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
> >>                              hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
> >> -    DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
> >>  
> >>      DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
> >>      DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
> >> @@ -7460,6 +7482,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
> >>                                     x86_hv_stimer_direct_get,
> >>                                     x86_hv_stimer_direct_set);
> >>  
> >> +    object_class_property_add_bool(oc, "hv-passthrough",
> >> +                                   x86_hv_passthrough_get,
> >> +                                   x86_hv_passthrough_set);
> >> +
> >>      for (w = 0; w < FEATURE_WORDS; w++) {
> >>          int bitnr;
> >>          for (bitnr = 0; bitnr < 64; bitnr++) {
> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >> index 30013f0d7cee..fca088d4d3b5 100644
> >> --- a/target/i386/kvm/kvm.c
> >> +++ b/target/i386/kvm/kvm.c
> >> @@ -1153,6 +1153,10 @@ static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
> >>          return 0;
> >>      }
> >>  
> >> +    if (cpu->hyperv_passthrough && (cpu->hyperv_features_off & BIT(feature))) {
> >> +        return 0;
> >> +    }
> >> +
> >>      deps = kvm_hyperv_properties[feature].dependencies;
> >>      while (deps) {
> >>          dep_feat = ctz64(deps);  
> >  
> 


