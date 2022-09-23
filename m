Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E3F5E75CA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:28:37 +0200 (CEST)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obe32-0002j7-7t
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1obdvs-0007Oz-CR
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1obdvL-0006VT-PV
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663921239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=830W5O659JJ6xlS1hwQ/d9CTgXauzf7qo4WR6sH+LJc=;
 b=VgvWmJePaH94nBy6DA98qAy62eVKQyoMpEyZ/PaR6cQhLw/2d+dF3fflh5cB44YrynE7gf
 aPtkAaaXKCG4x8SSCkI8GA9hmlDYgULq2Uypo3GwF/jYJD4rftRkzxF4kamJs34bc38HKy
 zsqzMiIzobbTBcpxAs1D5Hlj9BBI6DU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-ipzpi7zbOiOsmzE5claejw-1; Fri, 23 Sep 2022 04:20:37 -0400
X-MC-Unique: ipzpi7zbOiOsmzE5claejw-1
Received: by mail-ed1-f70.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so8264759edc.13
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 01:20:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=830W5O659JJ6xlS1hwQ/d9CTgXauzf7qo4WR6sH+LJc=;
 b=TBj5dZnrBhDz1HYy9L5TZGOwL6wJdPHMKl+FuKp2KqKgn2ws8963B/vEgydmeQ5Drl
 pFES2dNbnhyDsevQ1bbHTSCmSoCw1GR2lZRv9Z5lOadN9kRAo9Wums1oLPNqlsYfijWS
 GtyDW4s8Vh/RxCa9bZSSBX5fYdwcYK6PChyM7Qy3UwbhZgRW3w1xWvkwdxGzXx9pbm3L
 gnYRE9nUXYrnc5zBldnqRiGxRmVnKpzN3gBTT0HfuPpVgqDTNOaRtPJ8KJk2+yUUjcok
 oDNHEuz+TUl/47SoRQFn9JK45j7AYTd0TqOB3UuUBXQo0jxFtGK7e+i5h5PWtWQml3Yn
 51mg==
X-Gm-Message-State: ACrzQf1Ubs2pxeGAuXOLL1M5fA+9wkdSIoq4+x6XQk/lHpa8q2ce6Rrf
 LpBT60HGNj29gjcjvZWpVBZnWQLWW4t3/mD5Xudah4D1oztXCWvDponE8LpWhk7oEz/gsladO/t
 ITSS8y8HmHYlH/XA=
X-Received: by 2002:a17:907:7ea3:b0:782:8c54:259 with SMTP id
 qb35-20020a1709077ea300b007828c540259mr2597178ejc.217.1663921236579; 
 Fri, 23 Sep 2022 01:20:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65PRmK7IiuGLgKYq7ysQnEszfeF0RA1PGifIPdGW4WtvK4F5duFS/0pFT0zF74wouTUJquUQ==
X-Received: by 2002:a17:907:7ea3:b0:782:8c54:259 with SMTP id
 qb35-20020a1709077ea300b007828c540259mr2597165ejc.217.1663921236284; 
 Fri, 23 Sep 2022 01:20:36 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b0077fde38993asm3589571ejo.152.2022.09.23.01.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 01:20:35 -0700 (PDT)
Date: Fri, 23 Sep 2022 10:20:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <20220923102034.6579b66c@redhat.com>
In-Reply-To: <YyyP4b2uKghi1EHL@xz-m1.local>
References: <20220921161227.57259-1-peterx@redhat.com>
 <20220922154617.57d1a1fb@redhat.com> <YyyP4b2uKghi1EHL@xz-m1.local>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 22 Sep 2022 12:40:01 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Thu, Sep 22, 2022 at 03:46:17PM +0200, Igor Mammedov wrote:
> > On Wed, 21 Sep 2022 12:12:27 -0400
> > Peter Xu <peterx@redhat.com> wrote:
> >   
> > > It's true that when vcpus<=255 we don't require the length of 32bit APIC
> > > IDs.  However here since we already have EIM=ON it means the hypervisor
> > > will declare the VM as x2apic supported (e.g. VT-d ECAP register will have
> > > EIM bit 4 set), so the guest should assume the APIC IDs are 32bits width
> > > even if vcpus<=255.  In short, commit 77250171bdc breaks any simple cmdline
> > > that wants to boot a VM with >=9 but <=255 vcpus with:
> > > 
> > >   -device intel-iommu,intremap=on
> > > 
> > > For anyone who does not want to enable x2apic, we can use eim=off in the
> > > intel-iommu parameters to skip enabling KVM x2apic.
> > > 
> > > This partly reverts commit 77250171bdc02aee106083fd2a068147befa1a38, while
> > > keeping the valid bit on checking split irqchip, but revert the other change.
> > > 
> > > Cc: David Woodhouse <dwmw2@infradead.org>
> > > Cc: Claudio Fontana <cfontana@suse.de>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  hw/i386/intel_iommu.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index 05d53a1aa9..6524c2ee32 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -3818,6 +3818,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
> > >              error_setg(errp, "eim=on requires accel=kvm,kernel-irqchip=split");
> > >              return false;
> > >          }
> > > +        if (!kvm_enable_x2apic()) {  
> > 
> > above 'check' has side-effects
> > if it's supposed to be a check it would be better to use kvm_has_x2apic_api()
> > instead.  
> 
> A check is not what I wanted.
> 
> As stated in the commit message, since for some reason EIM is enabled on
> the VT-d device already, we need to enable x2apic for the whole guest
> (including KVM) to match with EIM=on being declared even if vcpus<255.
> 
> > 
> > Also 77250171bdc says:
> > "
> >     The check on kvm_enable_x2apic() needs to happen *anyway* in order to
> >     allow CPUs above 254 even without an IOMMU, so allow that to happen
> >     elsewhere.
> > "
> > 
> > Looking for that elsewhere, it looks like commit dc89f32d92b was supposed
> > to take care of removed chunk, but that is not reachable because of > 255 vCPUs"
> > 
> > Likely 77250171bdc just exposed a bug in dc89f32d92b, where
> > the later removed kvm_enable_x2apic() always called (with split irqchip)
> > and made it called only when > 255 vCPUs.
> > 
> > So migration wise it looks like all version with it and less than 255 cpus
> > are broken.
> > 
> > Wait earlier c1bb5418e3, introduced that
> >    kvm_irqchip_is_split() && kvm_enable_x2apic()
> > 'condition', also without any compat machinery to keep old behavior.  
> 
> There's actually some attempt to be compatible, with:
> 
>  GlobalProperty pc_compat_5_1[] = {
>      { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
> +    { TYPE_X86_CPU, "kvm-msi-ext-dest-id", "off" },
>  };
> 
> But I don't think that's strictly correct, because afaict that only
> controls whether guest enables it or not (I can only see Linux does it that
> way; no idea whether that's detected to other OSes from the PV interfaces).
> The KVM x2apic will still be enabled even on old machines I think, as you
> mentioned.

yep, that compat affects only kvm-msi-ext-dest-id, the kvm_enable_x2apic()
was still called regardless of that.

> > And before that kvm_enable_x2apic() was affecting only configuration
> > with intel_iommu (fb506e701e9b).  
> 
> Right, afaict that's what we "officially" support.
> 
> > 
> > I'm not sure if anything could be salvaged here migration wise  
> 
> This whole thing is indeed very unfortunate.  For easier reference of
> future, here are the list of commits that are relevant in time order:
> 
> fb506e701e ("intel_iommu: reject broken EIM", 2016-10-17)
> c1bb5418e3 ("target/i386: Support up to 32768 CPUs without IRQ remapping", 2020-12-10)
> 77250171bd ("intel_iommu: Fix irqchip / X2APIC configuration checks", 2022-05-16)
> dc89f32d92 ("target/i386: Fix sanity check on max APIC ID / X2APIC enablement", 2022-05-16)
> 
> So regarding compatibility I'm wondering whether we should loose it for
> this case, depending on whether vendors (like RH, or QEMU community in
> general) should support "allowing 32K vcpu without vIOMMU" as an "official"
> feature, or treat it as "experimental only".

If I recall correctly that's PV only feature that also requires special
tailored guest. i.e. it's possible to deliver IPIs in such configuration
but devices could interact only with a fraction of CPUs (irq-wise) or
something else should take care of IRQ remapping.
I don't think mainstream distributions care about this case much.

> IMO it's more important to always make the officially supported bits
> compatible and work as expected.  Here IIUC the (only) official way to
> support >255 vcpus should still be using vIOMMU with EIM enabled so far.
> But I'm happy to be corrected..
> 
> If so, I would still suggest having such a patch because it should fix one
> of the basic use cases with vIOMMU and currently upstream is broken on it.
> This patch will definitely change the behavior again, but the old was
> simply broken and we don't really have much choice out of it, IMHO.

The thing I worry about is calling kvm_enable_x2apic() from multiple places.
It would be better to fix x86_cpus_init() part of dc89f32d92 and have a check
in IOMMU. But if that's impossible/too ugly, I won't object to this patch.


> Thanks,
> 
> > 
> > PS:
> > I'd keep kvm_enable_x2apic() only in corrected x86_cpus_init()
> > and use kvm_has_x2apic_api() elsewhere for checks and bailing out.
> > 
> >   
> > > +            error_setg(errp, "eim=on requires support on the KVM side"
> > > +                             "(X2APIC_API, first shipped in v4.7)");
> > > +            return false;
> > > +        }  
> > 
> > 
> >   
> > >      }
> > >  
> > >      /* Currently only address widths supported are 39 and 48 bits */  
> >   
> 


