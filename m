Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3752FDB32
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:51:37 +0100 (CET)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KS0-0002dv-Iu
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2KPn-0001y5-VA
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2KPk-0004NF-Bz
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611175754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rG1iqfxrodriGPj7qdnmBZGWlQk9zpCX0YQpoOVi+94=;
 b=K8+pVAgGOw+mPfB5X2Mdxg8bglXDeQHinmoa0wy+m8zJz+poT7rJys2kc6Jh/3yu+fTEFj
 9irQtI8Mb2rmy3XI/9cVUhR0U7m99btMt5i+gxrpO1RaKKiziXrbGLbnbg2D/yF3hOKGD7
 yEgtr/GHaDexglXMaAaB0H7pWlWPdk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-ZZliKbIrODeVfygXuGFAYA-1; Wed, 20 Jan 2021 15:49:12 -0500
X-MC-Unique: ZZliKbIrODeVfygXuGFAYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2428A107ACF7
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 20:49:11 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4A105C728;
 Wed, 20 Jan 2021 20:49:10 +0000 (UTC)
Date: Wed, 20 Jan 2021 15:49:09 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 18/19] i386: provide simple 'hv-default=on' option
Message-ID: <20210120204909.GS1227584@habkost.net>
References: <20210107150640.539239-1-vkuznets@redhat.com>
 <20210107151449.541062-1-vkuznets@redhat.com>
 <20210115031142.7c171a7f@redhat.com>
 <87h7ni7e08.fsf@vitty.brq.redhat.com>
 <20210120141312.0a1e6c33@redhat.com>
 <874kjb65cm.fsf@vitty.brq.redhat.com>
 <20210120200832.40141dc1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120200832.40141dc1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 08:08:32PM +0100, Igor Mammedov wrote:
> On Wed, 20 Jan 2021 15:38:33 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> 
> > Igor Mammedov <imammedo@redhat.com> writes:
> > 
> > > On Fri, 15 Jan 2021 10:20:23 +0100
> > > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> > >  
> > >> Igor Mammedov <imammedo@redhat.com> writes:
> > >>   
> > >> > On Thu,  7 Jan 2021 16:14:49 +0100
> > >> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> > >> >    
> > >> >> Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
> > >> >> requires listing all currently supported enlightenments ("hv-*" CPU
> > >> >> features) explicitly. We do have 'hv-passthrough' mode enabling
> > >> >> everything but it can't be used in production as it prevents migration.
> > >> >> 
> > >> >> Introduce a simple 'hv-default=on' CPU flag enabling all currently supported
> > >> >> Hyper-V enlightenments. Later, when new enlightenments get implemented,
> > >> >> compat_props mechanism will be used to disable them for legacy machine types,
> > >> >> this will keep 'hv-default=on' configurations migratable.
> > >> >> 
> > >> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> > >> >> ---
> > >> >>  docs/hyperv.txt   | 16 +++++++++++++---
> > >> >>  target/i386/cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
> > >> >>  target/i386/cpu.h |  5 +++++
> > >> >>  3 files changed, 56 insertions(+), 3 deletions(-)
> > >> >> 
> > >> >> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> > >> >> index 5df00da54fc4..a54c066cab09 100644
> > >> >> --- a/docs/hyperv.txt
> > >> >> +++ b/docs/hyperv.txt
> > >> >> @@ -17,10 +17,20 @@ compatible hypervisor and use Hyper-V specific features.
> > >> >>  
> > >> >>  2. Setup
> > >> >>  =========
> > >> >> -No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
> > >> >> -QEMU, individual enlightenments can be enabled through CPU flags, e.g:
> > >> >> +All currently supported Hyper-V enlightenments can be enabled by specifying
> > >> >> +'hv-default=on' CPU flag:
> > >> >>  
> > >> >> -  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
> > >> >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default ...
> > >> >> +
> > >> >> +Alternatively, it is possible to do fine-grained enablement through CPU flags,
> > >> >> +e.g:
> > >> >> +
> > >> >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-relaxed,hv-vpindex,hv-time ...    
> > >> >
> > >> > I'd put here not '...' but rather recommended list of flags, and update
> > >> > it every time when new feature added if necessary.
> > >> >    
> > >
> > > 1)
> > >    
> > >> This is an example of fine-grained enablement, there is no point to put
> > >> all the existing flags there (hv-default is the only recommended way
> > >> now, the rest is 'expert'/'debugging').  
> > > so users are kept in dark what hv-default disables/enables (and it might depend
> > > on machine version on top that). Doesn't look like a good documentation to me
> > > (sure everyone can go and read source code for it and try to figure out how
> > > it's supposed to work)  
> > 
> > 'hv-default' enables *all* currently supported enlightenments. When
> > using with an old machine type, it will enable *all* Hyper-V
> > enlightenmnets which were supported when the corresponding machine type
> > was released. I don't think we document all other cases when a machine
> > type is modified (i.e. where can I read how pc-q35-5.1 is different from
> > pc-q35-5.0 if I refuse to read the source code?)
> > 
> > >  
> > >>  
> > >> > (not to mention that if we had it to begin with, then new 'hv-default' won't
> > >> > be necessary, I still see it as functionality duplication but I will not oppose it)
> > >> >    
> > >> 
> > >> Unfortunately, upper layer tools don't read this doc and update
> > >> themselves to enable new features when they appear.  
> > > rant: (just merge all libvirt into QEMU, and make VM configuration less low-level.
> > > why stop there, just merge with yet another upper layer, it would save us a lot
> > > on communication protocols and simplify VM creation even more,
> > > and no one will have to read docs and write anything new on top.)
> > > There should be limit somewhere, where QEMU job ends and others pile hw abstraction
> > > layers on top of it.  
> > 
> > We have '-machine q35' and we don't require to list all the devices from
> > it. We have '-cpu Skylake-Server' and we don't require to configure all
> > the features manually. Why can't we have similar enablement for Hyper-V
> > emulation where we can't even see a real need for anything but 'enable
> > everything' option?
> > 
> > There is no 'one libvirt to rule them all' (fortunately or
> > unfortunately). And sometimes QEMU is the uppermost layer and there's no
> > 'libvirt' on top of it, this is also a perfectly valid use-case.
> > 
> > >  
> > >> Similarly, if when these tools use '-machine q35' they get all the new features we add
> > >> automatically, right?  
> > > it depends, in case of CPUs, new features usually 'off' by default
> > > for existing models. In case of bugs, features sometimes could be
> > > flipped and versioned machines were used to keep broken CPU models
> > > on old machine types.
> > >  
> > 
> > That's why I was saying that Hyper-V enlightenments hardly resemble
> > 'hardware' CPU features.
> Well, Microsoft chose to implement them as hardware concept (CPUID leaf),
> and I prefer to treat them the same way as any other CPUID bits.
> 
> > 
> > >      
> > >> >> +It is also possible to disable individual enlightenments from the default list,
> > >> >> +this can be used for debugging purposes:
> > >> >> +
> > >> >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default=on,hv-evmcs=off ...
> > >> >>  
> > >> >>  Sometimes there are dependencies between enlightenments, QEMU is supposed to
> > >> >>  check that the supplied configuration is sane.
> > >> >> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > >> >> index 48007a876e32..99338de00f78 100644
> > >> >> --- a/target/i386/cpu.c
> > >> >> +++ b/target/i386/cpu.c
> > >> >> @@ -4552,6 +4552,24 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
> > >> >>      cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
> > >> >>  }
> > >> >>  
> > >> >> +static bool x86_hv_default_get(Object *obj, Error **errp)
> > >> >> +{
> > >> >> +    X86CPU *cpu = X86_CPU(obj);
> > >> >> +
> > >> >> +    return cpu->hyperv_default;
> > >> >> +}
> > >> >> +
> > >> >> +static void x86_hv_default_set(Object *obj, bool value, Error **errp)
> > >> >> +{
> > >> >> +    X86CPU *cpu = X86_CPU(obj);
> > >> >> +
> > >> >> +    cpu->hyperv_default = value;
> > >> >> +
> > >> >> +    if (value) {
> > >> >> +        cpu->hyperv_features |= cpu->hyperv_default_features;    
> > >> >
> > >> > s/|="/=/ please,
> > >> > i.e. no option overrides whatever was specified before to keep semantics consistent.
> > >> >    
> > >> 
> > >> Hm,
> > >>   
> > >  
> > >> this doesn't matter for the most recent machine type as
> > >> hyperv_default_features has all the features but imagine you're running
> > >> an older machine type which doesn't have 'hv_feature'. Now your  
> > > normally one shouldn't use new feature with old machine type as it makes
> > > VM non-migratable to older QEMU that has this machine type but not this feature.
> > >
> > > nitpicking:
> > >   according to (1) user should not use 'hv_feature' on old machine since
> > >   hv_default should cover all their needs (well they don't know what
> > > hv_default actually is).  
> > 
> > Normally yes but I can imagine sticking to some old machine type for
> > other-than-hyperv-enlightenments purposes and still wanting to add a
> > newly introduced enlightenment. Migration is not always a must.
> > 
> > >  
> > >> suggestion is 
> > >> 
> > >> if I do:
> > >> 
> > >> 'hv_default,hv_feature=on' I will get "hyperv_default_features | hv_feature"
> > >> 
> > >> but if I do
> > >> 
> > >> 'hv_feature=on,hv_default' I will just get 'hyperv_default_features'
> > >> (as hv_default enablement will overwrite everything)
> > >> 
> > >> How is this consistent?  
> > > usual semantics for properties, is that the latest property overwrites,
> > > the previous property value parsed from left to right.
> > > (i.e. if one asked for hv_default, one gets it related CPUID bit set/unset,
> > > if one needs more than that one should add more related features after that.
> > >  
> > 
> > This semantics probably doesn't apply to 'hv-default' case IMO as my
> > brain refuses to accept the fact that
> it's difficult probably because 'hv-default' is 'alias' property 
> that covers all individual hv-foo features in one go and that individual
> features are exposed to user, but otherwise it is just a property that
> sets CPUID features or like any other property, and should be treated like such.
> 
> > 'hv_default,hv_feature' != 'hv_feature,hv_default'
> >
> > which should express the same desire 'the default set PLUS the feature I
> > want'.
> if hv_default were touching different data, I'd agree.
> But in the end hv_default boils down to the same CPUID bits as individual
> features:
> 
>   hv_default,hv_f2 => (hv_f1=on,hv_f2=off),hv_f2=on
>          !=
>   hv_f2,hv_default => hv_f2=on,(hv_f1=on,hv_f2=off)

I don't know why you chose to define "hv_default" as
hv_f1=on,hv_f2=off.  If hv_f2 is not enabled by hv_default, it
doesn't need to be touched by hv_default at all.


> 
>  
> > I think I prefer sanity over purity in this case.
> what is sanity to one could be insanity for another,
> so I pointed out the way properties expected to work today.
> 
> But you are adding new semantic ('combine') to property/features parsing
> (instead of current 'set' policy), and users will have to be aware of
> this new behavior and add/maintain code for this special case.
> (maybe I worry in vain, and no one will read docs and know about this
> new property anyways)
> 
> That will also push x86 CPUs consolidation farther away from other targets,
> where there aren't any special casing for features parsing, just simple
> left to right parsing with the latest property having overwriting previously
> set value.
> We are trying hard to reduce special cases and unify interfaces for same
> components to simplify qemu and make it predictable/easier for users.
> 

What you are proposing diverges from other targets, actually.
See target/s390x/cpu_models.c:set_feature_group() for example.
Enabling a feature group in s390x only enables a set of feature
bits, and doesn't touch the rest.

In other words, if hv_default includes hv_f1+hv_f2 (and not hv_f3
or hv_f4), this means:

   hv_default,hv_f3=on,hv_f4=off => (hv_f1=on,hv_f2=on),hv_f3=on,hv_f4=off
          ==
   hv_f3=on,hv_f4=off,hv_default => hv_f3=on,hv_f4=off,(hv_f2=on,hv_f2=on)

That would also mean:

   hv_default,hv_f1=on,hv_f2=off => (hv_f1=on,hv_f2=on),hv_f1=on,hv_f2=off
          !=
   hv_f1=on,hv_f2=off,hv_default => hv_f1=on,hv_f2=off,(hv_f2=on,hv_f2=on)

That's the behavior implemented by Vitaly.

> [...]

-- 
Eduardo


