Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A94D5EAC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 10:45:49 +0100 (CET)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSbqG-00024J-0n
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 04:45:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSbna-0001HS-KC
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:43:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSbnW-0002bj-PJ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646991777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcGrufNeDkTeCDPEexa+NiZ8YM+VOaf0poXqngmMbNk=;
 b=TncbE0ppBbzldFX2WUzOrSnZpm9gXbRyVsCQHRop1z+tLUxE4zMN2YnId9BfeZ5qs5jd3t
 jZgH8oRB9BCe7jLRs1ZReO8H+H8+7I+/Ll0X3J5g5luNSNT98hS/LZE1g/ngTFKLjy4Vdd
 +Kxba8sc8vCMq4BypXZXrmbRNgb6wqQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-8FB9moQVMoe4dIoQ8HQdGA-1; Fri, 11 Mar 2022 04:42:56 -0500
X-MC-Unique: 8FB9moQVMoe4dIoQ8HQdGA-1
Received: by mail-ej1-f69.google.com with SMTP id
 lf15-20020a170906ae4f00b006da86a43346so4637529ejb.14
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 01:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcGrufNeDkTeCDPEexa+NiZ8YM+VOaf0poXqngmMbNk=;
 b=DCxRHG8WydXK7PT9lPNfGAsCjO5nWUJy2BHBgvxX4y318aSBvONM9PstYq6jpEuia9
 3EnoVDKlD29OBZrHsWg57HBIpSYzAMEyyJ3YNbxKBg3cs21w0ND97gvhqgxvKDUbDwI4
 A1Q3o+rc/tue2ySjX2SzPtEusGQm1kGOT54fXGwFWDqilM2NyDf/yCBRKfyj3Z9tNL8C
 GPMoG3pd4Gi19X79UhRB4clThtLPZFXh1z9EeNbQczkaPRDHehVAv2XoRWb6cs6AUbXq
 sSp/pGLRSzfQp8ipCwOfIFZ3ud356McUh2d/mTU/JRzuZ5y/CqujmDeYaHCCbnTGB9cW
 LrRA==
X-Gm-Message-State: AOAM532tEnCkJsg5J9ADan5+eOW/ky+egEuSu6/q4/bEYCwu9S/5z1k2
 Rm0Lj570yx4f8w2MeAdc2AEVDs6Hlmw30AwYo1XK3/mYshzyGPGc2T7BAHn1i4N7e0kpcFP3vWr
 bB7Ls4DnR5ZOxQa0=
X-Received: by 2002:a05:6402:3510:b0:418:509e:8a79 with SMTP id
 b16-20020a056402351000b00418509e8a79mr34282edd.294.1646991774985; 
 Fri, 11 Mar 2022 01:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+cx21PAjgjD/8FmQG5hlGJNaJ1bXIhjEg+koG6M38/cs7jNTRsFdtKVHxNFRZ/cqKUtxEOQ==
X-Received: by 2002:a05:6402:3510:b0:418:509e:8a79 with SMTP id
 b16-20020a056402351000b00418509e8a79mr34249edd.294.1646991774638; 
 Fri, 11 Mar 2022 01:42:54 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a1709066d8700b006d4b4d137fbsm2763885ejt.50.2022.03.11.01.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 01:42:54 -0800 (PST)
Date: Fri, 11 Mar 2022 10:42:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Message-ID: <20220311104252.548c5fb4@redhat.com>
In-Reply-To: <88be3aa0-0d7f-08c5-8278-07a3c5b701c8@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
 <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
 <20220307184045-mutt-send-email-mst@kernel.org>
 <20220308082048.1783adbc@redhat.com>
 <3e0803ef-392a-b863-3474-3f76dcd27ae1@oracle.com>
 <20220310170025.33b9f6f0@redhat.com>
 <d62b16fc-f01a-586d-9fcf-d44abc100cb2@oracle.com>
 <88be3aa0-0d7f-08c5-8278-07a3c5b701c8@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 13:18:35 -0500
Steven Sistare <steven.sistare@oracle.com> wrote:

> On 3/10/2022 12:28 PM, Steven Sistare wrote:
> > On 3/10/2022 11:00 AM, Igor Mammedov wrote:  
> >> On Thu, 10 Mar 2022 10:36:08 -0500
> >> Steven Sistare <steven.sistare@oracle.com> wrote:
> >>  
> >>> On 3/8/2022 2:20 AM, Igor Mammedov wrote:  
> >>>> On Tue, 8 Mar 2022 01:50:11 -0500
> >>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >>>>     
> >>>>> On Mon, Mar 07, 2022 at 09:41:44AM -0500, Steven Sistare wrote:    
> >>>>>> On 3/4/2022 5:41 AM, Igor Mammedov wrote:      
> >>>>>>> On Thu, 3 Mar 2022 12:21:15 -0500
> >>>>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >>>>>>>       
> >>>>>>>> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:      
> >>>>>>>>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
> >>>>>>>>> option is set.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >>>>>>>>> ---
> >>>>>>>>>  hw/core/machine.c   | 19 +++++++++++++++++++
> >>>>>>>>>  include/hw/boards.h |  1 +
> >>>>>>>>>  qemu-options.hx     |  6 ++++++
> >>>>>>>>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
> >>>>>>>>>  softmmu/vl.c        |  1 +
> >>>>>>>>>  trace-events        |  1 +
> >>>>>>>>>  util/qemu-config.c  |  4 ++++
> >>>>>>>>>  7 files changed, 70 insertions(+), 9 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >>>>>>>>> index 53a99ab..7739d88 100644
> >>>>>>>>> --- a/hw/core/machine.c
> >>>>>>>>> +++ b/hw/core/machine.c
> >>>>>>>>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
> >>>>>>>>>      ms->mem_merge = value;
> >>>>>>>>>  }
> >>>>>>>>>  
> >>>>>>>>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
> >>>>>>>>> +{
> >>>>>>>>> +    MachineState *ms = MACHINE(obj);
> >>>>>>>>> +
> >>>>>>>>> +    return ms->memfd_alloc;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
> >>>>>>>>> +{
> >>>>>>>>> +    MachineState *ms = MACHINE(obj);
> >>>>>>>>> +
> >>>>>>>>> +    ms->memfd_alloc = value;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>  static bool machine_get_usb(Object *obj, Error **errp)
> >>>>>>>>>  {
> >>>>>>>>>      MachineState *ms = MACHINE(obj);
> >>>>>>>>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
> >>>>>>>>>      object_class_property_set_description(oc, "mem-merge",
> >>>>>>>>>          "Enable/disable memory merge support");
> >>>>>>>>>  
> >>>>>>>>> +    object_class_property_add_bool(oc, "memfd-alloc",
> >>>>>>>>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
> >>>>>>>>> +    object_class_property_set_description(oc, "memfd-alloc",
> >>>>>>>>> +        "Enable/disable allocating anonymous memory using memfd_create");
> >>>>>>>>> +
> >>>>>>>>>      object_class_property_add_bool(oc, "usb",
> >>>>>>>>>          machine_get_usb, machine_set_usb);
> >>>>>>>>>      object_class_property_set_description(oc, "usb",
> >>>>>>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >>>>>>>>> index 9c1c190..a57d7a0 100644
> >>>>>>>>> --- a/include/hw/boards.h
> >>>>>>>>> +++ b/include/hw/boards.h
> >>>>>>>>> @@ -327,6 +327,7 @@ struct MachineState {
> >>>>>>>>>      char *dt_compatible;
> >>>>>>>>>      bool dump_guest_core;
> >>>>>>>>>      bool mem_merge;
> >>>>>>>>> +    bool memfd_alloc;
> >>>>>>>>>      bool usb;
> >>>>>>>>>      bool usb_disabled;
> >>>>>>>>>      char *firmware;
> >>>>>>>>> diff --git a/qemu-options.hx b/qemu-options.hx
> >>>>>>>>> index 7d47510..33c8173 100644
> >>>>>>>>> --- a/qemu-options.hx
> >>>>>>>>> +++ b/qemu-options.hx
> >>>>>>>>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >>>>>>>>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
> >>>>>>>>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
> >>>>>>>>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
> >>>>>>>>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"        
> >>>>>>>>
> >>>>>>>> Question: are there any disadvantages associated with using
> >>>>>>>> memfd_create? I guess we are using up an fd, but that seems minor.  Any
> >>>>>>>> reason not to set to on by default? maybe with a fallback option to
> >>>>>>>> disable that?      
> >>>>>>
> >>>>>> Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.
> >>>>>> Also, the tunable to enable huge pages for share memory is different than for
> >>>>>> anon memory, so there could be performance loss if it is not set correctly.
> >>>>>>     /sys/kernel/mm/transparent_hugepage/enabled
> >>>>>>     vs
> >>>>>>     /sys/kernel/mm/transparent_hugepage/shmem_enabled      
> >>>>>
> >>>>> I guess we can test this when launching the VM, and select
> >>>>> a good default.
> >>>>>    
> >>>>>> It might make sense to use memfd_create by default for the secondary segments.      
> >>>>>
> >>>>> Well there's also KSM now you mention it.    
> >>>>
> >>>> then another quest, is there downside to always using memfd_create
> >>>> without any knobs being involved?    
> >>>
> >>> Lower performance if small pages are used (but Michael suggests qemu could 
> >>> automatically check the tunable and use anon memory instead)
> >>>
> >>> KSM (same page merging) is not supported for shared memory, so ram_block_add ->
> >>> memory_try_enable_merging will not enable it.
> >>>
> >>> In both cases, I expect the degradation would be negligible if memfd_create is
> >>> only automatically applied to the secondary segments, which are typically small.
> >>> But, someone's secondary segment could be larger, and it is time consuming to
> >>> prove innocence when someone claims your change caused their performance regression.  
> >>
> >> Adding David as memory subsystem maintainer, maybe he will a better
> >> idea instead of introducing global knob that would also magically alter 
> >> backends' behavior despite of its their configured settings.  
> > 
> > OK, in ram_block_add I can set the RAM_SHARED flag based on the memory-backend object's
> > shared flag.  I already set the latter in create_default_memdev when memfd-alloc is
> > specified.  With that change, we do not override configured settings.  Users can no longer
> > use memory-backend-ram for CPR, and must change all memory-backend-ram to memory-backend-memfd
> > in the command-line arguments.  That is fine.
> > 
> > With that change, are you OK with this patch?  
> 
> Sorry, I mis-read my own code in ram_block_add.  The existing code is correct and does 
> not alter any backend's behavior.   It only sets the shared flag when the ram is *not* 
> being allocated for a backend:
> 
>                 if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
>                     new_block->flags |= RAM_SHARED;
>                 }
> 

ok, maybe instead of introducing a generic option, introduce the high level
feature one that turns this and other necessary quirks for it to work (i.e.
something like live-update=on|off).
That will not make QEMU internals any better but at least it will hide obscure
memfd-alloc from users.
Is there a patch that makes QEMU error out if backend without
shared=on is used?

Also, can you answer question below, pls
or point to a patch in series that takes care of that invariant?

[...]

> >>>>>> There is currently no way to specify memory backends for the secondary memory
> >>>>>> segments (vram, roms, etc), and IMO it would be onerous to specify a backend for
> >>>>>> each of them.  On x86_64, these include pc.bios, vga.vram, pc.rom, vga.rom,
> >>>>>> /rom@etc/acpi/tables, /rom@etc/table-loader, /rom@etc/acpi/rsdp.  
> >>
> >> MemoryRegion is not the only place where state is stored.
> >> If we only talk about fwcfg entries state, it can also reference
> >> plain malloced memory allocated elsewhere or make a deep copy internally.
> >> Similarly devices also may store state outside of RamBlock framework.
> >>
> >> How are you dealing with that?
[...]


