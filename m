Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9E4BF4CD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:35:53 +0100 (CET)
Received: from localhost ([::1]:58774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRaJ-0003he-PW
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMRVU-00028b-AO
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMRVS-0005gG-9S
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645522248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ott34LIMtyWlVMpH8XV6sBZVg6tk/QB3IvtMaLHpEB0=;
 b=honkvyUMmc72Sg7JwareXh78HANZILa5lxxZ+HFVtznjt/Mfzz/9n7z1fED1kpbX4ZgutC
 K43rfZyY/KVocGm23g18QDkqzDpAHCZO5jRDqmlhHJGoxH4MdLRUyZeNrnNj8Mqn+KSXJK
 QzorT6/fc5fKgpOTLqGYqxoZq58euSM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-sOu3SqM3Oyyf9Qa45M1s9Q-1; Tue, 22 Feb 2022 04:30:47 -0500
X-MC-Unique: sOu3SqM3Oyyf9Qa45M1s9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 z15-20020a1c4c0f000000b00380d331325aso321926wmf.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 01:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ott34LIMtyWlVMpH8XV6sBZVg6tk/QB3IvtMaLHpEB0=;
 b=PYuQbqujgigdBh/VINrkQOe1ozkEnfJDUcNft5bCVeCdAedL2xU4PiLOzOSa+Vw2/2
 sMcw4lhELekAr7+n55VkXYk238msYQf8WophcZm4o4QDLq/GudGC3cePOGt8RgD9Rz+Z
 a4GX+jx1IlCV+lvCzUbO/TvRmHXxyNkPlRD7HiMRxAJBV9op9zOBDH9qFO5sN93tlpdN
 E0PqqbfjHRfWQ5y65hWGdXyju0OMf6ngNksSsuB3/bdRLGv/kjuLkjh8OjLl6SMGnhEq
 37KmEUXgnHzNLjGNd5PDeYLlgAkLAx9ssnKW2fNJczY3gFVM8zQSjV2PXlZrbKFTX3En
 CYYw==
X-Gm-Message-State: AOAM533NFwaiN1qjyW80hBJqeQUeDVFfItBvZLXNH5LI8H20fs9QBf0p
 YeP8KtSmvnoahtta2yRf+1yf5kVvKdOB0Bl8kzZ+2XxamoFx4+Dxn7HhcXloaflh7Omvj0XqTCJ
 V6O7Z7QFkPRlc33k=
X-Received: by 2002:adf:efcc:0:b0:1e7:cf03:b419 with SMTP id
 i12-20020adfefcc000000b001e7cf03b419mr18783044wrp.122.1645522246336; 
 Tue, 22 Feb 2022 01:30:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcot+E1Ww/k2ub6gwFZKL2UdCm2cYJ/U2hcRhXfmqMiZWOy3hACaiOQMBIRg82zibJqfickg==
X-Received: by 2002:adf:efcc:0:b0:1e7:cf03:b419 with SMTP id
 i12-20020adfefcc000000b001e7cf03b419mr18783017wrp.122.1645522246044; 
 Tue, 22 Feb 2022 01:30:46 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm1915651wmq.44.2022.02.22.01.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 01:30:45 -0800 (PST)
Date: Tue, 22 Feb 2022 09:30:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <YhStQ1SVY9YhMJpp@work-vm>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <YgzJE7ufEYm6OFyg@redhat.com> <YhOQfJ8x93+jDSZf@work-vm>
 <20220222094602.66d55613@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220222094602.66d55613@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Mon, 21 Feb 2022 13:15:40 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Tue, Feb 15, 2022 at 10:53:58AM +0100, Gerd Hoffmann wrote:  
> > > >   Hi,
> > > >   
> > > > > I don't know what behavior should be if firmware tries to program
> > > > > PCI64 hole beyond supported phys-bits.  
> > > > 
> > > > Well, you are basically f*cked.
> > > > 
> > > > Unfortunately there is no reliable way to figure what phys-bits actually
> > > > is.  Because of that the firmware (both seabios and edk2) tries to place
> > > > the pci64 hole as low as possible.
> > > > 
> > > > The long version:
> > > > 
> > > > qemu advertises phys-bits=40 to the guest by default.  Probably because
> > > > this is what the first amd opteron processors had, assuming that it
> > > > would be a safe default.  Then intel came, releasing processors with
> > > > phys-bits=36, even recent (desktop-class) hardware has phys-bits=39.
> > > > Boom.
> > > > 
> > > > End result is that edk2 uses a 32G pci64 window by default, which is
> > > > placed at the first 32G border beyond normal ram.  So for virtual
> > > > machines with up to ~ 30G ram (including reservations for memory
> > > > hotplug) the pci64 hole covers 32G -> 64G in guest physical address
> > > > space, which is low enough that it works on hardware with phys-bits=36.
> > > > 
> > > > If your VM has more than 32G of memory the pci64 hole will move and
> > > > phys-bits=36 isn't enough any more, but given that you probably only do
> > > > that on more beefy hosts which can take >= 64G of RAM and have a larger
> > > > physical address space this heuristic works good enough in practice.
> > > > 
> > > > Changing phys-bits behavior has been discussed on and off since years.
> > > > It's tricky to change for live migration compatibility reasons.
> > > > 
> > > > We got the host-phys-bits and host-phys-bits-limit properties, which
> > > > solve some of the phys-bits problems.
> > > > 
> > > >  * host-phys-bits=on makes sure the phys-bits advertised to the guest
> > > >    actually works.  It's off by default though for backward
> > > >    compatibility reasons (except microvm).  Also because turning it on
> > > >    breaks live migration of machines between hosts with different
> > > >    phys-bits.  
> > > 
> > > RHEL has shipped with host-phys-bits=on in its machine types
> > > sinec RHEL-7. If it is good enough for RHEL machine types
> > > for 8 years, IMHO, it is a sign that its reasonable to do the
> > > same with upstream for new machine types.  
> > 
> > And the upstream code is now pretty much identical except for the
> > default;  note that for TCG you do need to keep to 40 I think.
> 
> will TCG work with 40bits on host that supports less than that?
> 
> Also quick look at host-phys-bits shows that it affects only 'host'
> cpu model and is NOP for all other models.
> If it's so than we probably need to expand it's scope to other cpu
> models to cap them at actually supported range.

(We shouldn't really bring TCG oddities into this series!)

As I remember it effectively gets it from the accelerator, and TCG being
portable, there's no portable way of reading the phys-bits.

Whether it would work, hmm.  I'm assuming the host OS would stop you
allocating a huge ram block, so it shouldn't break from that.
But then the guest address translation is done in software, not using
the host MMU, so I think the guests view of addressing should be able
to be larger than the host. (Unless you try things like vfio/iommu on
tcg, which I'm told does work in some combos).

Dave


> > 
> > Dave
> > >   
> > > >  * host-phys-bits-limit can be used to tweak phys-bits to
> > > >    be lower than what the host supports.  Which can be used for
> > > >    live migration compatibility, i.e. if you have a pool of machines
> > > >    where some have 36 and some 39 you can limit phys-bits to 36 so
> > > >    live migration from 39 hosts to 36 hosts works.  
> > > 
> > > RHEL machine types have set this to host-phys-bits-limit=48
> > > since RHEL-8 days, to avoid accidentally enabling 5-level
> > > paging in guests without explicit user opt-in.
> > >   
> > > > What is missing:
> > > > 
> > > >  * Some way for the firmware to get a phys-bits value it can actually
> > > >    use.  One possible way would be to have a paravirtual bit somewhere
> > > >    telling whenever host-phys-bits is enabled or not.  
> > > 
> > > 
> > > Regards,
> > > Daniel
> > > -- 
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > > 
> > >   
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


