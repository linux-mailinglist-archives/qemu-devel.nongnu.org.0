Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E783D748B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 13:47:42 +0200 (CEST)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8LYj-0003C5-Ql
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 07:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8LWg-00024F-1K
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m8LWa-0007jU-OT
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627386327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bulCDv/jUW57k3GbKi1x9xu72N0i/km0U4QUyAHJr9Q=;
 b=UImMmBdY44ORnE2pySTeCqDO/iOewKpYhys7BehLkZVGUqaLI3UmIqoEg46owd9QyKMJ+s
 ScNoYXmPXcfTlmCwkjlXN2u/tnuc8mpaxp7S/0lzz3vzPFl7haJpsA3+rWLWLYxhW3LV0b
 J3TbR50vmjFXad6nqbY4NdXA9pcxw1c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-jrCWj-HSNUGg3v5Q-gzoUA-1; Tue, 27 Jul 2021 07:45:26 -0400
X-MC-Unique: jrCWj-HSNUGg3v5Q-gzoUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o32-20020a05600c5120b0290225ef65c35dso582055wms.2
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 04:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bulCDv/jUW57k3GbKi1x9xu72N0i/km0U4QUyAHJr9Q=;
 b=l4xPgd1un7r3x0/rh541eCEuFRwJu/EwiaeNZeRs0lOxYV5Lp/MXRztFT0dBQxMaiA
 6Suj5ioMkiF6bn56rUrFWJBBSNZTFQcHsuhKtp7HLyTkZ5768N5o8d/HFxQuKD4GpCQL
 6av1dKkhFH/ZN/xcKS95UryF8TAjju+9qVX3CA9NEbyGd7Lf2nwj3lzjKsMOagl4sCOG
 6Z4f9pBVSLr+KBFXxxpny9blH06IUyg+UHzINA65m6t15OgYHk4BF5o/sm7Zk7LWj9kx
 iKzcDHjm8KDTbWsa/1veAM72+92IjSfhols9wn6iaQ3z+6nPs7y9Awj6fOFrumgZ56Xr
 zILg==
X-Gm-Message-State: AOAM533a6yXchOti9SZNbTkcNhs7Af867zj1KTkRB6CvFlVSkAi1ohDM
 m54/n44DP/6/p8j9zOmo5517a97X3DVm0mo23Vkg91n5pJUkT5g2ShCHfshOI/B7gV99CiH3Kim
 F08AmsT0x/LGbzv8=
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr21307722wmq.54.1627386324928; 
 Tue, 27 Jul 2021 04:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGlgDvMsW+q0hYRpoYsHgQDeBxnzAL9f/fwB9CmawB1BiVazM1MBD9F0/uivUEe10wJzhv3w==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr21307687wmq.54.1627386324651; 
 Tue, 27 Jul 2021 04:45:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id t17sm1070439wmq.17.2021.07.27.04.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:45:24 -0700 (PDT)
Date: Tue, 27 Jul 2021 13:45:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 02/10] ACPI ERST: specification for ERST support
Message-ID: <20210727134523.086b3ed0@redhat.com>
In-Reply-To: <8631ab5a-943c-900d-ab45-973191cb1064@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
 <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210719170244.7402e008@redhat.com>
 <c0b0a60a-bd4e-ef2c-d398-bef96d8731dc@oracle.com>
 <20210726120650.4bb9272f@redhat.com>
 <8631ab5a-943c-900d-ab45-973191cb1064@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Eric Blake <eblake@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 14:52:15 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/26/21 5:06 AM, Igor Mammedov wrote:
> > On Wed, 21 Jul 2021 10:42:33 -0500
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >   
> >> On 7/19/21 10:02 AM, Igor Mammedov wrote:  
> >>> On Wed, 30 Jun 2021 19:26:39 +0000
> >>> Eric DeVolder <eric.devolder@oracle.com> wrote:
> >>>      
> >>>> Oops, at the end of the 4th paragraph, I meant to state that "Linux does not support the NVRAM mode."
> >>>> rather than "non-NVRAM mode", which contradicts everything I stated prior.
> >>>> Eric.
> >>>> ________________________________
> >>>> From: Eric DeVolder <eric.devolder@oracle.com>
> >>>> Sent: Wednesday, June 30, 2021 2:07 PM
> >>>> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> >>>> Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >>>> Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support
> >>>>
> >>>> Information on the implementation of the ACPI ERST support.
> >>>>
> >>>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >>>> ---
> >>>>    docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++++++
> >>>>    1 file changed, 152 insertions(+)
> >>>>    create mode 100644 docs/specs/acpi_erst.txt
> >>>>
> >>>> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
> >>>> new file mode 100644
> >>>> index 0000000..79f8eb9
> >>>> --- /dev/null
> >>>> +++ b/docs/specs/acpi_erst.txt
> >>>> @@ -0,0 +1,152 @@
> >>>> +ACPI ERST DEVICE
> >>>> +================
> >>>> +
> >>>> +The ACPI ERST device is utilized to support the ACPI Error Record
> >>>> +Serialization Table, ERST, functionality. The functionality is
> >>>> +designed for storing error records in persistent storage for
> >>>> +future reference/debugging.
> >>>> +
> >>>> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> >>>> +(APEI)", and specifically subsection "Error Serialization", outlines
> >>>> +a method for storing error records into persistent storage.
> >>>> +
> >>>> +The format of error records is described in the UEFI specification[2],
> >>>> +in Appendix N "Common Platform Error Record".
> >>>> +
> >>>> +While the ACPI specification allows for an NVRAM "mode" (see
> >>>> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
> >>>> +directly exposed for direct access by the OS/guest, this implements
> >>>> +the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
> >>>> +by most BIOS (since flash memory requires programming operations
> >>>> +in order to update its contents). Furthermore, as of the time of this
> >>>> +writing, Linux does not support the non-NVRAM "mode".  
> >>>
> >>> shouldn't it be s/non-NVRAM/NVRAM/ ?  
> >>
> >> Yes, it has been corrected.
> >>  
> >>>      
> >>>> +
> >>>> +
> >>>> +Background/Motivation
> >>>> +---------------------
> >>>> +Linux uses the persistent storage filesystem, pstore, to record
> >>>> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> >>>> +independent of, and runs before, kdump.  In certain scenarios (ie.
> >>>> +hosts/guests with root filesystems on NFS/iSCSI where networking
> >>>> +software and/or hardware fails), pstore may contain the only
> >>>> +information available for post-mortem debugging.  
> >>>
> >>> well,
> >>> it's not the only way, one can use existing pvpanic device to notify
> >>> mgmt layer about crash and mgmt layer can take appropriate measures
> >>> to for post-mortem debugging, including dumping guest state,
> >>> which is superior to anything pstore can offer as VM is still exists
> >>> and mgmt layer can inspect VMs crashed state directly or dump
> >>> necessary parts of it.
> >>>
> >>> So ERST shouldn't be portrayed as the only way here but rather
> >>> as limited alternative to pvpanic in regards to post-mortem debugging
> >>> (it's the only way only on bare-metal).
> >>>
> >>> It would be better to describe here other use-cases you've mentioned
> >>> in earlier reviews, that justify adding alternative to pvpanic.  
> >>
> >> I'm not sure how I would change this. I do say "may contain", which means it
> >> is not the only way. Pvpanic is a way to notify the mgmt layer/host, but
> >> this is a method solely with the guest. Each serves a different purpose;
> >> plugs a different hole.
> >>  
> > 
> > I'd suggest edit  "pstore may contain the only information" as "pstore may contain information"
> >   
> Done
> 
> >> As noted in a separate message, my company has intentions of storing other
> >> data in ERST beyond panics.  
> > perhaps add your use cases here as well.
> >   
> >   
> >>>> +Two common storage backends for the pstore filesystem are ACPI ERST
> >>>> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
> >>>> +all guests. With QEMU supporting ACPI ERST, it becomes a viable
> >>>> +pstore storage backend for virtual machines (as it is now for
> >>>> +bare metal machines).
> >>>> +  
> >>>      
> >>>> +Enabling support for ACPI ERST facilitates a consistent method to
> >>>> +capture kernel panic information in a wide range of guests: from
> >>>> +resource-constrained microvms to very large guests, and in
> >>>> +particular, in direct-boot environments (which would lack UEFI
> >>>> +run-time services).  
> >>> this hunk probably not necessary
> >>>      
> >>>> +
> >>>> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
> >>>> +crash information, if available.  
> >>> a pointer to a relevant source would be helpful here.  
> >>
> >> I've included the reference, here for your benefit.
> >> Windows Hardware Error Architecutre, specifically Persistence Mechanism
> >> https://docs.microsoft.com/en-us/windows-hardware/drivers/whea/error-record-persistence-mechanism
> >>  
> >>>      
> >>>> +Invocation  
> >>> s/^^/Configuration|Usage/  
> >>
> >> Corrected
> >>  
> >>>      
> >>>> +----------
> >>>> +
> >>>> +To utilize ACPI ERST, a memory-backend-file object and acpi-erst  
> >>> s/utilize/use/  
> >>
> >> Corrected
> >>  
> >>>      
> >>>> +device must be created, for example:  
> >>> s/must/can/  
> >>
> >> Corrected
> >>  
> >>>      
> >>>> +
> >>>> + qemu ...
> >>>> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,
> >>>> +  size=0x10000,share=on  
> >>> I'd put ^^^ on the same line as -object and use '\' at the end the
> >>> so example could be easily copy-pasted  
> >>
> >> Corrected
> >>  
> >>>      
> >>>> + -device acpi-erst,memdev=erstnvram
> >>>> +
> >>>> +For proper operation, the ACPI ERST device needs a memory-backend-file
> >>>> +object with the following parameters:
> >>>> +
> >>>> + - id: The id of the memory-backend-file object is used to associate
> >>>> +   this memory with the acpi-erst device.
> >>>> + - size: The size of the ACPI ERST backing storage. This parameter is
> >>>> +   required.
> >>>> + - mem-path: The location of the ACPI ERST backing storage file. This
> >>>> +   parameter is also required.
> >>>> + - share: The share=on parameter is required so that updates to the
> >>>> +   ERST back store are written to the file immediately as well. Without
> >>>> +   it, updates the the backing file are unpredictable and may not
> >>>> +   properly persist (eg. if qemu should crash).  
> >>>
> >>> mmap manpage says:
> >>>     MAP_SHARED
> >>>                Updates to the mapping ... are carried through to the underlying file.
> >>> it doesn't guarantee 'written to the file immediately', though.
> >>> So I'd rephrase it to something like that:
> >>>
> >>> - share: The share=on parameter is required so that updates to the ERST back store
> >>>            are written back to the file.  
> >>
> >> Corrected
> >>  
> >>>      
> >>>> +
> >>>> +The ACPI ERST device is a simple PCI device, and requires this one
> >>>> +parameter:  
> >>> s/^.*:/and ERST device:/  
> >>
> >> Corrected
> >>  
> >>>      
> >>>> +
> >>>> + - memdev: Is the object id of the memory-backend-file.
> >>>> +
> >>>> +
> >>>> +PCI Interface
> >>>> +-------------
> >>>> +
> >>>> +The ERST device is a PCI device with two BARs, one for accessing
> >>>> +the programming registers, and the other for accessing the
> >>>> +record exchange buffer.
> >>>> +
> >>>> +BAR0 contains the programming interface consisting of just two
> >>>> +64-bit registers. The two registers are an ACTION (cmd) and a
> >>>> +VALUE (data). All ERST actions/operations/side effects happen  
> >>> s/consisting of... All ERST/consisting of ACTION and VALUE 64-bit registers. All ERST/  
> >>
> >> Corrected
> >>  
> >>>      
> >>>> +on the write to the ACTION, by design. Thus any data needed  
> >>> s/Thus//  
> >> Corrected
> >>  
> >>>      
> >>>> +by the action must be placed into VALUE prior to writing
> >>>> +ACTION. Reading the VALUE simply returns the register contents,
> >>>> +which can be updated by a previous ACTION.  
> >>>      
> >>>> This behavior is
> >>>> +encoded in the ACPI ERST table generated by QEMU.  
> >>> it's too vague, Either drop sentence or add a reference to relevant place in spec.  
> >> Corrected
> >>  
> >>>
> >>>      
> >>>> +
> >>>> +BAR1 contains the record exchange buffer, and the size of this
> >>>> +buffer sets the maximum record size. This record exchange
> >>>> +buffer size is 8KiB.  
> >>> s/^^^/
> >>> BAR1 contains the 8KiB record exchange buffer, which is the implemented maximum record size limit.  
> >> Corrected
> >>  
> >>>
> >>>      
> >>>> +Backing File  
> >>>
> >>> s/^^^/Backing Storage Format/  
> >> Corrected
> >>  
> >>>      
> >>>> +------------  
> >>>
> >>>      
> >>>> +
> >>>> +The ACPI ERST persistent storage is contained within a single backing
> >>>> +file. The size and location of the backing file is specified upon
> >>>> +QEMU startup of the ACPI ERST device.  
> >>>
> >>> I'd drop above paragraph and describe file format here,
> >>> ultimately used backend doesn't have to be a file. For
> >>> example if user doesn't need it persist over QEMU restarts,
> >>> ram backend could be used, guest will still be able to see
> >>> it's own crash log after guest is reboot, or it could be
> >>> memfd backend passed to QEMU by mgmt layer.  
> >> Dropped
> >>  
> >>>
> >>>      
> >>>> +Records are stored in the backing file in a simple fashion.  
> >>> s/backing file/backend storage/
> >>> ditto for other occurrences  
> >> Corrected
> >>  
> >>>      
> >>>> +The backing file is essentially divided into fixed size
> >>>> +"slots", ERST_RECORD_SIZE in length, with each "slot"
> >>>> +storing a single record.  
> >>>      
> >>>> No attempt at optimizing storage
> >>>> +through compression, compaction, etc is attempted.  
> >>> s/^^^//  
> >>
> >> I'd like to keep this statement. It is there because in a number of
> >> hardware BIOS I tested, these kinds of features lead to bugs in the
> >> ERST support.  
> > this doc it's not about issues in other BIOSes, it's about conrete
> > QEMU impl. So sentence starting with "No attempt" is not relevant here at all.  
> Dropped
> 
> >      
> >>>> +NOTE that any change to this value will make any pre-
> >>>> +existing backing files, not of the same ERST_RECORD_SIZE,
> >>>> +unusable to the guest.  
> >>> when that can happen, can we detect it and error out?  
> >> I've dropped this statement. That value is hard coded, and not a
> >> parameter, so there is no simple way to change it. This comment
> >> does exist next to the ERST_RECORD_SIZE declaration in the code.  
> > 
> > It's not a problem with current impl. but rather with possible
> > future expansion.
> > 
> > If you'd add a header with record size at the start of storage,
> > it wouldn't be issue as ERST would be able to get used record
> > size for storage. That will help with avoiding compat issues
> > later on.  
> I'll go ahead and add the header. I'll put the magic and record size in there,
> but I do not intend to put any data that would be "cached" from the records
> themselves. So no recordids, in particular, will be cached in this header.
maybe also add offset of the 1st slot, so however comes later
to fix performance issues will have less compatibility issues.

> 
> I'm not even sure I want to record/cache the number of records because:
>   - it has almost no use (undermined by the fact overall storage size is not exposed, imho)
>   - we backed off requiring the share=on, so it is conceivable this header value could
>     encounter data integrity issues, should a guest crash...
guest crash won't affect data,  and if backend is not shared then,
data won't be persistently stored anyways, they will live only for
lifetime of QEMU instance.
The only time where integrity is affected is host crash and we already
agreed that we don't care about this case.

>   - scans still happen (see next)
> 
> While having it (number of records cached in header) would avoid a startup scan
> to compute it, the write operation requires a scan to determine if the incoming
> recordid is present or not, in order to determine overwrite or allocate-and-write.
if present/non present per slot status is cached, you don't have to do
expensive full scan when guest scans slots.

> And typically the first operation that Linux does is effectively a scan to
> populate the /sys/fs/pstore entries via the GET_RECORD_IDENTIFIER action.
> 
> And the typical size of the ERST storage [on hardware systems] is 64 to 128KiB;
> so not much storage to examine, especially since only looking at 12 bytes of each
> 8KiB record.
> 
> I'd still be in favor of putting an upper bound on the hostmem object, to avoid
> your worst case fears...

Considering device is not present by default, I give up on
trying to convince you to design it efficiently.

If one would wish to use this with container like workloads
where fast startup matters, one would have to live with crappy
performance or rewrite your impl.

> >>>> +Below is an example layout of the backing store file.
> >>>> +The size of the file is a multiple of ERST_RECORD_SIZE,
> >>>> +and contains N number of "slots" to store records. The
> >>>> +example below shows two records (in CPER format) in the
> >>>> +backing file, while the remaining slots are empty/
> >>>> +available.
> >>>> +
> >>>> + Slot   Record
> >>>> +        +--------------------------------------------+
> >>>> +    0   | empty/available                            |
> >>>> +        +--------------------------------------------+
> >>>> +    1   | CPER                                       |
> >>>> +        +--------------------------------------------+
> >>>> +    2   | CPER                                       |
> >>>> +        +--------------------------------------------+
> >>>> +  ...   |                                            |
> >>>> +        +--------------------------------------------+
> >>>> +    N   | empty/available                            |
> >>>> +        +--------------------------------------------+
> >>>> +        <-------------- ERST_RECORD_SIZE ------------>  
> >>>
> >>>      
> >>>> +Not all slots need to be occupied, and they need not be
> >>>> +occupied in a contiguous fashion. The ability to clear/erase
> >>>> +specific records allows for the formation of unoccupied
> >>>> +slots.  
> >>> I'd drop this as not necessary  
> >>
> >> I'd like to keep this statement. Again, several BIOS on which I tested
> >> ERST had bugs around non-contiguous record storage.  
> > 
> > I'd drop this and alter sentence above ending with " in a simple fashion."
> > to describe sparse usage of storage and then after that comes example diagram.  
> Done
> 
> > 
> > I'd like this part to start with unambiguous concise description of
> > format and to be finished with example diagram.
> > It is the part that will be considered as the the only true source
> > how file should be formatted, when it comes to fixing bugs or
> > modifying original impl. later on. So it's important to have clear
> > description without any unnecessary information here.  
> Done
> 
> > 
> >   
> >>>
> >>>      
> >>>> +
> >>>> +
> >>>> +References
> >>>> +----------
> >>>> +
> >>>> +[1] "Advanced Configuration and Power Interface Specification",
> >>>> +    version 4.0, June 2009.
> >>>> +
> >>>> +[2] "Unified Extensible Firmware Interface Specification",
> >>>> +    version 2.1, October 2008.
> >>>> +
> >>>> --
> >>>> 1.8.3.1
> >>>>     
> >>>      
> >>  
> >   
> 


