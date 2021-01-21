Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1EE2FEC54
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:52:46 +0100 (CET)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2aOD-0000EU-4D
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2aLX-0006ZV-Hn
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2aLU-0004kS-70
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611236993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1I4sc4F7Gdab0TB+kKhL1CL38yk978NOAvMmPRluerw=;
 b=RFAYaz7la0c0j4WcYOFnh9QJmy1wfz52M7C6R3UM4+VcJqIja5YO65c8c29LTXHmvhY4Yx
 f0v07U91x7rbDMDABOM/mXCTQTD16ywhmwifoKOzN9FR1l64ZQ4GQBnnVS5m+Pb29Gavmj
 a6tfcVlSyRyggrgfTsUHZWNVFKBtTQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-npzFUe5aMN-61mS8qpRh6Q-1; Thu, 21 Jan 2021 08:49:52 -0500
X-MC-Unique: npzFUe5aMN-61mS8qpRh6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18F0C18C8C00
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 13:49:51 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70767648A8;
 Thu, 21 Jan 2021 13:49:49 +0000 (UTC)
Date: Thu, 21 Jan 2021 14:49:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v3 18/19] i386: provide simple 'hv-default=on' option
Message-ID: <20210121144947.306512e1@redhat.com>
In-Reply-To: <87wnw64r0y.fsf@vitty.brq.redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
 <20210107151449.541062-1-vkuznets@redhat.com>
 <20210115031142.7c171a7f@redhat.com>
 <87h7ni7e08.fsf@vitty.brq.redhat.com>
 <20210120141312.0a1e6c33@redhat.com>
 <874kjb65cm.fsf@vitty.brq.redhat.com>
 <20210120200832.40141dc1@redhat.com>
 <87wnw64r0y.fsf@vitty.brq.redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Jan 2021 09:45:33 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Wed, 20 Jan 2021 15:38:33 +0100
> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >  
> >> Igor Mammedov <imammedo@redhat.com> writes:
> >>   
> >> > On Fri, 15 Jan 2021 10:20:23 +0100
> >> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >> >    
> >> >> suggestion is 
> >> >> 
> >> >> if I do:
> >> >> 
> >> >> 'hv_default,hv_feature=on' I will get "hyperv_default_features | hv_feature"
> >> >> 
> >> >> but if I do
> >> >> 
> >> >> 'hv_feature=on,hv_default' I will just get 'hyperv_default_features'
> >> >> (as hv_default enablement will overwrite everything)
> >> >> 
> >> >> How is this consistent?    
> >> > usual semantics for properties, is that the latest property overwrites,
> >> > the previous property value parsed from left to right.
> >> > (i.e. if one asked for hv_default, one gets it related CPUID bit set/unset,
> >> > if one needs more than that one should add more related features after that.
> >> >    
> >> 
> >> This semantics probably doesn't apply to 'hv-default' case IMO as my
> >> brain refuses to accept the fact that  
> > it's difficult probably because 'hv-default' is 'alias' property 
> > that covers all individual hv-foo features in one go and that individual
> > features are exposed to user, but otherwise it is just a property that
> > sets CPUID features or like any other property, and should be treated
> > like such.
> >  
> >> 'hv_default,hv_feature' != 'hv_feature,hv_default'
> >>
> >> which should express the same desire 'the default set PLUS the feature I
> >> want'.  
> > if hv_default were touching different data, I'd agree.
> > But in the end hv_default boils down to the same CPUID bits as individual
> > features:
> >
> >   hv_default,hv_f2 => (hv_f1=on,hv_f2=off),hv_f2=on
> >          !=
> >   hv_f2,hv_default => hv_f2=on,(hv_f1=on,hv_f2=off)
> >  
> 
> In your case I treat 'hv_default' as 'hv_f1=on' and it says nothing
> about 'hv_f2' - neither it is enabled, nor it is disabled because when
> the corresponding machine type was released it just wasn't there.
> 
> >    
> >> I think I prefer sanity over purity in this case.  
> > what is sanity to one could be insanity for another,
> > so I pointed out the way properties expected to work today.
> >
> > But you are adding new semantic ('combine') to property/features parsing
> > (instead of current 'set' policy), and users will have to be aware of
> > this new behavior and add/maintain code for this special case.
> > (maybe I worry in vain, and no one will read docs and know about this
> > new property anyways)
> >
> > That will also push x86 CPUs consolidation farther away from other targets,
> > where there aren't any special casing for features parsing, just simple
> > left to right parsing with the latest property having overwriting previously
> > set value.  
> 
> In case this is somewhat important I suggest we get back to adding
> 'hyperv=on' machine type option and not do the 'aliasing' with
> 'hv_default'. I think it would be possible to support
> 
> '-M q35,hyper=on -cpu host,hv-stimer-direct=off' 
> 
> even if we need to add a custom handler for Hyper-V feature setting
> instead of just using bits in u64 as we need to remember both what was
> enabled and what was disabled to combine this with machine type property
> correctly.
> 
> > We are trying hard to reduce special cases and unify interfaces for same
> > components to simplify qemu and make it predictable/easier for users.
> >  
> 
> That's exactly the reason why we need simpler Hyper-V feature
> enablement! :-)
> 
> >  
> >> >> >> +    }
> >> >> >> +}
> >> >> >> +
> >> >> >>  /* Generic getter for "feature-words" and "filtered-features" properties */
> >> >> >>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
> >> >> >>                                        const char *name, void *opaque,
> >> >> >> @@ -6955,10 +6973,26 @@ static void x86_cpu_initfn(Object *obj)
> >> >> >>      object_property_add_alias(obj, "pause_filter", obj, "pause-filter");
> >> >> >>      object_property_add_alias(obj, "sse4_1", obj, "sse4.1");
> >> >> >>      object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
> >> >> >> +    object_property_add_alias(obj, "hv_default", obj, "hv-default");
> >> >> >>  
> >> >> >>      if (xcc->model) {
> >> >> >>          x86_cpu_load_model(cpu, xcc->model);
> >> >> >>      }
> >> >> >> +
> >> >> >> +    /* Hyper-V features enabled with 'hv-default=on' */
> >> >> >> +    cpu->hyperv_default_features = BIT(HYPERV_FEAT_RELAXED) |
> >> >> >> +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
> >> >> >> +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
> >> >> >> +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
> >> >> >> +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
> >> >> >> +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
> >> >> >> +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_IPI) |
> >> >> >> +        BIT(HYPERV_FEAT_STIMER_DIRECT);
> >> >> >> +
> >> >> >> +    /* Enlightened VMCS is only available on Intel/VMX */
> >> >> >> +    if (kvm_hv_evmcs_available()) {
> >> >> >> +        cpu->hyperv_default_features |= BIT(HYPERV_FEAT_EVMCS);
> >> >> >> +    }      
> >> >> > what if VVM is migrated to another host without evmcs,
> >> >> > will it change CPUID?
> >> >> >      
> >> >> 
> >> >> Evmcs is tightly coupled with VMX, we can't migrate when it's not
> >> >> there.    
> >> >
> >> > Are you saying mgmt will check and refuse to migrate to such host?
> >> >    
> >> 
> >> Is it possible to migrate a VM from a VMX-enabled host to a VMX-disabled
> >> one if VMX feature was exposed to the VM? Probably not, you will fail to
> >> create a VM on the destination host. Evmcs doesn't change anything in
> >> this regard, there are no hosts where VMX is available but EVMCS is not.  
> >
> > I'm not sure how evmcs should be handled,
> > can you point out what in this series makes sure that migration fails or
> > makes qemu not able to start in case kvm_hv_evmcs_available() returns false.
> >
> > So far I read snippet above as a problem:
> > 1:
> >   host supports evmcs:
> >   and exposes HYPERV_FEAT_EVMCS in CPUID  
> 
> Host with EVMCS is Intel
> 
> > 2: we migrate to host without evmcs  
> 
> Host without EVMCS is AMD, there are no other options. It is a pure
> software feature available for KVM-intel. And if your KVM is so old that
> it doesn't know anything about EVMCS, a bunch of other options from
> 'hv-default' will not start as well.
> > 2.1 start target QEMU, it happily creates vCPUs without
> > HYPERV_FEAT_EVMCS in CPUID  
> 
> No, it doesn't as on host1 we had at least VMX CPU feature enabled (or a
> CPU model implying it) to make this all work.
> 
> > 2.2 if I'm not mistaken CPUID is not part of migration stream,
> >     nothing could check and fail migration
> > 2.3 guest runs fine till it tries to use non existing feature, ..  
> 
> I'm also very sceptical about possibilities for migration
> Windows/Hyper-V VMs from Intel to AMD. Hyper-V doesn't even boot if you
> don't have fresh-enough CPU so the common denominator for Intel/AMD
> would definitely not work. 

Like you said host doesn't have to be AMD, just old enough kernel will
do the job. What exactly will prevent migration 'successfully' completing?

The way it's currently written migration stream won't prevent it.

One way that might solve issue is to add subsection that's enabled when
kvm_hv_evmcs_available() == true, and check on target that the feature
is available or fail migration.

Maybe Eduardo or David can add more how to deal with it if needed.


