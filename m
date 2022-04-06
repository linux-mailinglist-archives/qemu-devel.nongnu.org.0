Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062C4F688D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:03:54 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncA0W-0007hL-7T
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nc9zR-0006YJ-Gl
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nc9zN-0000an-Qo
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649268159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIxjxqwIDIVFkMFmOCbeF3pYegUjAzCTlKQ+q9D+7jM=;
 b=e9ogyVTsOVsXYvaUJjWLSZaK2aWX+QiY+hvitI9AdulIYjXU+biPPf7GsQSgd0RHoPiREG
 2mILxXe8WL7J1DpBnnDbFfEROXee80D4lEEfRcsQIIl5/TZ1XWSj//fPkMPX7HRwmdt035
 p3HlvKH2frPawVl+w2w61QAI/5zgCro=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-dvuhX7WSM4uyZttM5kzvrw-1; Wed, 06 Apr 2022 14:02:38 -0400
X-MC-Unique: dvuhX7WSM4uyZttM5kzvrw-1
Received: by mail-ej1-f72.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso1597189eje.13
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xIxjxqwIDIVFkMFmOCbeF3pYegUjAzCTlKQ+q9D+7jM=;
 b=6iJKWH8BwKz9DqbBmmqQaAuvhdrZpsLc3+iGyfWir2T/jYPjYvO3YI1NQafYrdCIuN
 gsaihbHTFOu2iYfnqAXgZDhyGymAB9Ip+UY6Q/+pt4YXwDZf+6u5BfOVMMYxNa1shBtF
 OM5AYXle45ipV+XG7DwpmtuVwC0kuqgSLxKRdChW+F8mhibRrlku4VwgTt5k085IXUHm
 HMods7dTLHk0FNNn4MjLGZIHmlB3Yjd5TfCLlIDanuWVSomc6GrJEkL6dF6Zr4AQTfKA
 ahI/tWaGtAQJc4Jdf++fxUMJVx6l+yq3ZWLZ3pONkx7iFoWmN21FmHLSqPZsz7Lo/EN3
 kQAQ==
X-Gm-Message-State: AOAM533ey5XRqNzZf+yrEdTfOBvxPlF5rdT4V0h2qHeGlvVFcRsYrIhN
 Gk1lcYcYoih/oqZCq9vzCjniwsmMSXa3LHMgtDXK1CVCY1ZbDRBl7YnGtqtX+IbF9IsEWJsYm86
 1t9RlMHVZCgeIaPY=
X-Received: by 2002:a05:6402:5245:b0:419:5437:fc6b with SMTP id
 t5-20020a056402524500b004195437fc6bmr9925871edd.282.1649268157302; 
 Wed, 06 Apr 2022 11:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyku5AHw4DBN5n01V2aDWj37NUzQcJh4tbvI7OGWVqV/D2KAbJ6tKsE5TcOgeFT13i0oXrIDA==
X-Received: by 2002:a05:6402:5245:b0:419:5437:fc6b with SMTP id
 t5-20020a056402524500b004195437fc6bmr9925816edd.282.1649268156881; 
 Wed, 06 Apr 2022 11:02:36 -0700 (PDT)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 go40-20020a1709070da800b006dfc3945312sm6738640ejc.202.2022.04.06.11.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:02:36 -0700 (PDT)
Date: Wed, 6 Apr 2022 20:02:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <20220406200234.35b9032a@redhat.com>
In-Reply-To: <Yk3PqSxz02KVl/e0@work-vm>
References: <20220406083531.10217-1-dgilbert@redhat.com>
 <20220406113446.73ab4e1b@redhat.com> <Yk1fq+B9RD+9+4I3@work-vm>
 <20220406175939.39d9a277@redhat.com> <Yk27nQLMqm8byNpd@work-vm>
 <20220406185256.084330d5@redhat.com> <Yk3PqSxz02KVl/e0@work-vm>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, alex.williamson@redhat.com,
 leobras@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 18:36:41 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Igor Mammedov (imammedo@redhat.com) wrote:
> > On Wed, 6 Apr 2022 17:11:09 +0100
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >   
> > > * Igor Mammedov (imammedo@redhat.com) wrote:  
> > > > On Wed, 6 Apr 2022 10:38:51 +0100
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > >     
> > > > > * Igor Mammedov (imammedo@redhat.com) wrote:    
> > > > > > On Wed,  6 Apr 2022 09:35:31 +0100
> > > > > > "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> > > > > >       
> > > > > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > > > > > 
> > > > > > > The 'acpi_index' field is a statically configured field, which for
> > > > > > > some reason is migrated; this never makes much sense because it's
> > > > > > > command line static.      
> > > > > > 
> > > > > > that's true only for the field that's part of PCIDEvice,
> > > > > > however AcpiPciHpState::acpi_index is runtime state and _must_
> > > > > > be migrated if set, otherwise guest might get wrong index
> > > > > > if it's in process of querying it      
> > > > > 
> > > > > So this patch only changes the piix4.c version; I'm confused, is there
> > > > > a AcpiPciHpState::acpi_index that's runtime setable in there?    
> > > >     
> > > > > > >          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,    
> > > >                                     ^^^ AcpiPciHpState    
> > > > > > >                              vmstate_test_use_acpi_hotplug_bridge,
> > > > > > > -                            vmstate_acpi_pcihp_use_acpi_index),    
> > > > 
> > > > hw/acpi/pcihp.c:pci_write():
> > > >    s->acpi_index = object_property_get_uint(o, "acpi-index", NULL);
> > > > 
> > > > s->acpi_index is runtime value that is supposed to be migrated if it's set
> > > > to something other then 0
> > > > 
> > > > I may have botched VMSTATE_PCI_HOTPLUG, intent was to migrate
> > > > AcpiPciHpState::acpi_index if necessary. But I'm not sure how
> > > > if I used correct approach for to migrate an optional value
> > > > i.e.  maybe instead of VMSTATE_UINT32_TEST(pcihp.acpi_index, state, test_acpi_index)
> > > > I should've used subsection, because destination has no clue if
> > > > acpi_index would be transmitted over wire or not?
> > > >         
> > > > > > > However, on piix4 it's conditional, and the condition/test function
> > > > > > > ends up having the wrong pointer passed to it (it gets a PIIX4PMState
> > > > > > > not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
> > > > > > > is a macro and not another struct).  This means the field is randomly
> > > > > > > loaded/saved based on a random pointer.  In 6.x this random pointer
> > > > > > > randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
> > > > > > > and trying to load a field that the source didn't send.  The migration
> > > > > > > stream gets out of line and hits the section footer.      
> > > > > > 
> > > > > > I'm a bit confused by description,
> > > > > > do you have a reproducer for me to try?      
> > > > > 
> > > > > Yeh, see the linked gitlab case command line:
> > > > >   https://gitlab.com/qemu-project/qemu/-/issues/932
> > > > > 
> > > > > ./x86_64-softmmu/qemu-system-x86_64 -M pc-q35-6.2 -m 512 -device virtio-scsi-pci,id=scsihw0,bus=pcie.0,addr=0x5,acpi-index=3 -drive if=none,my.qcow2,format=qcow2,id=drive-scsi0,node-name=scsi0 -device 'scsi-hd,bus=scsihw0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0,id=scsi0'  -nographic
> > > > > 
> > > > > just migrating from a 6.2 to a head triggers this.    
> > > > 
> > > > Over here any migration from qemu-6.2 to HEAD at 3d31fe4d662f13c7
> > > > fails even without acpi-index, as simple as this:
> > > > 
> > > > qemu-system-x86_64-6.2 -M pc-i440fx-6.2  -m 512 -vnc :0 -monitor stdio
> > > > (qemu) stop
> > > > (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > > > 
> > > > qemu-system-x86_64-7.0 -M pc-i440fx-6.2  -m 512 -vnc :0 -monitor stdio -incoming "exec: gzip -c -d STATEFILE.gz"
> > > > 
> > > > (qemu) qemu-system-x86_64-7.0: Missing section footer for 0000:00:01.3/piix4_pm
> > > > qemu-system-x86_64-7.0: load of migration failed: Invalid argument
> > > > 
> > > > 
> > > > Like you pointed out in gitlab issue, vmstate_acpi_pcihp_use_acpi_index
> > > > is broken. Following applied to HEAD should fix immediate issue on destination
> > > > reading random value:
> > > > 
> > > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > > index f0b5fac44a..c97db491c8 100644
> > > > --- a/hw/acpi/piix4.c
> > > > +++ b/hw/acpi/piix4.c
> > > > @@ -269,6 +269,11 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
> > > >      return pm_smbus_vmstate_needed();
> > > >  }
> > > >  
> > > > +static bool vmstate_piix4_need_acpi_index(void *opaque, int version_id)
> > > > +{
> > > > +    PIIX4PMState *s = PIIX4_PM(opaque);
> > > > +    return vmstate_acpi_pcihp_use_acpi_index(&(s->acpi_pci_hotplug), version_id);
> > > > +}    
> > > 
> > > But if acpi_index was set on the source 6.2 host, it won't send the
> > > index, but the 7.0 would expect it, and it would fail in the same way
> > > wouldn't it?  
> > 
> > With piix4 fixed up 7.0 won't expect field as s->acpi_index initialized to 0
> > so check will always return 0 and the field won't be expected.
> > ( testing confirms it).
> > If test on 6.2 host somehow manages to return 1, destination won't
> > be able to accept it, because it has no idea about it (that is not fixable, I'm afraid).
> > 
> > For Q35 we set check  to NULL
> >         VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,
> >                             ICH9LPCPMRegs,
> >                             NULL, NULL),
> > 
> > which if I read vmstate_load_state() correctly will always expect
> > the field and will always store fields since field->version_id == 0
> > for VMSTATE_UINT32_TEST.
> > 
> > So we can't remove field without breaking Q35.  
> 
> Yes.
> 
> > Net effect:
> >   * not send the field for PC machine (ever)
> >   * send field always for Q35 (always)
> > 
> > So your patch is good with fixed commit message
> > and a comment close to the field that it's not really used with piix4  
> 
> Could you write a new commit message based on mine?

I ended up rewriting patch (kept removals), but replaced test_never
with compat knob 'send field always for 7.0 and don't end it ever for older'
to match q35 and so we wouldn't have to add subsection for piix4 only.

Will post it shortly.

> 
> > And to make migration of acpi_index on PC machine working,
> > we need add an extra subsection that should be able to
> > handle conditional value.  
> 
> Yes; I hadn't realised acpi_index was actually writeable.
> 
> Dave
> 
> >   
> > > 
> > > Dave
> > >   
> > > >  /* qemu-kvm 1.2 uses version 3 but advertised as 2
> > > >   * To support incoming qemu-kvm 1.2 migration, change version_id
> > > >   * and minimum_version_id to 2 below (which breaks migration from
> > > > @@ -299,7 +304,7 @@ static const VMStateDescription vmstate_acpi = {
> > > >              struct AcpiPciHpPciStatus),
> > > >          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
> > > >                              vmstate_test_use_acpi_hotplug_bridge,
> > > > -                            vmstate_acpi_pcihp_use_acpi_index),
> > > > +                            vmstate_piix4_need_acpi_index),
> > > >          VMSTATE_END_OF_LIST()
> > > >      },
> > > >      .subsections = (const VMStateDescription*[]) {
> > > > 
> > > >     
> > > > > Dave
> > > > >     
> > > > > > > The bodge is on piix4 never to load the field:
> > > > > > >   a) Most 6.x builds never send it, so most of the time the migration
> > > > > > >     will work.
> > > > > > >   b) We can backport this fix to 6.x to remove the boobytrap.
> > > > > > >   c) It should never have made a difference anyway since the acpi-index
> > > > > > >     is command line configured and should be correct on the destination
> > > > > > >     anyway
> > > > > > >   d) ich9 is still sending/receiving this (unconditionally all the time)
> > > > > > >     but due to (c) should never notice.  We could follow up to make it
> > > > > > >     skip.
> > > > > > > 
> > > > > > > It worries me just when (a) actually happens.
> > > > > > > 
> > > > > > > Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> > > > > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> > > > > > > 
> > > > > > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > > > > ---
> > > > > > >  hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
> > > > > > >  hw/acpi/pcihp.c                 |  6 ------
> > > > > > >  hw/acpi/piix4.c                 | 11 ++++++++++-
> > > > > > >  include/hw/acpi/pcihp.h         |  2 --
> > > > > > >  4 files changed, 10 insertions(+), 13 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> > > > > > > index 734e4c5986..a43f6dafc9 100644
> > > > > > > --- a/hw/acpi/acpi-pci-hotplug-stub.c
> > > > > > > +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> > > > > > > @@ -41,7 +41,3 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
> > > > > > >      return;
> > > > > > >  }
> > > > > > >  
> > > > > > > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> > > > > > > -{
> > > > > > > -    return false;
> > > > > > > -}
> > > > > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > > > > index 6351bd3424..bf65bbea49 100644
> > > > > > > --- a/hw/acpi/pcihp.c
> > > > > > > +++ b/hw/acpi/pcihp.c
> > > > > > > @@ -554,12 +554,6 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
> > > > > > >                                     OBJ_PROP_FLAG_READ);
> > > > > > >  }
> > > > > > >  
> > > > > > > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> > > > > > > -{
> > > > > > > -     AcpiPciHpState *s = opaque;
> > > > > > > -     return s->acpi_index;
> > > > > > > -}
> > > > > > > -
> > > > > > >  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
> > > > > > >      .name = "acpi_pcihp_pci_status",
> > > > > > >      .version_id = 1,
> > > > > > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > > > > > index cc37fa3416..48aeedd5f0 100644
> > > > > > > --- a/hw/acpi/piix4.c
> > > > > > > +++ b/hw/acpi/piix4.c
> > > > > > > @@ -267,6 +267,15 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
> > > > > > >      return pm_smbus_vmstate_needed();
> > > > > > >  }
> > > > > > >  
> > > > > > > +/*
> > > > > > > + * This is a fudge to turn off the acpi_index field, whose
> > > > > > > + * test was always broken on piix4.
> > > > > > > + */
> > > > > > > +static bool vmstate_test_never(void *opaque, int version_id)
> > > > > > > +{
> > > > > > > +    return false;
> > > > > > > +}
> > > > > > > +
> > > > > > >  /* qemu-kvm 1.2 uses version 3 but advertised as 2
> > > > > > >   * To support incoming qemu-kvm 1.2 migration, change version_id
> > > > > > >   * and minimum_version_id to 2 below (which breaks migration from
> > > > > > > @@ -297,7 +306,7 @@ static const VMStateDescription vmstate_acpi = {
> > > > > > >              struct AcpiPciHpPciStatus),
> > > > > > >          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
> > > > > > >                              vmstate_test_use_acpi_hotplug_bridge,
> > > > > > > -                            vmstate_acpi_pcihp_use_acpi_index),
> > > > > > > +                            vmstate_test_never),
> > > > > > >          VMSTATE_END_OF_LIST()
> > > > > > >      },
> > > > > > >      .subsections = (const VMStateDescription*[]) {
> > > > > > > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > > > > > > index af1a169fc3..7e268c2c9c 100644
> > > > > > > --- a/include/hw/acpi/pcihp.h
> > > > > > > +++ b/include/hw/acpi/pcihp.h
> > > > > > > @@ -73,8 +73,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
> > > > > > >  
> > > > > > >  extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
> > > > > > >  
> > > > > > > -bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
> > > > > > > -
> > > > > > >  #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
> > > > > > >          VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
> > > > > > >                              test_pcihp), \      
> > > > > >       
> > > >     
> >   


