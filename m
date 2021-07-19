Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F28D3CD87D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:04:15 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UoY-0005bf-Eq
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5UnO-0004Cl-0c
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5UnK-0007Dn-Ae
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626706976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFx1E7nXYYCQAb+mQdy62DsbJpHW1VslhDxU0UgRfLo=;
 b=XhqoodCiCKTmrqq3WKGkKXDqUDX+c25Vm3c7HNS1mnrRl6K7M81HSsF/fv6n/E4bG0Ky1y
 hdaa29fwLUJrEYTd8gDvWJr1hik68uYa0Brlf9abGPYFqv9jRYt2m9Pk1Z4WlbWRyvrbER
 X+ZB/ptZLG6nuCLkyrQfKyHm69oDFqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-qZEkwMbiOyWYnNM7U1gYzw-1; Mon, 19 Jul 2021 11:02:55 -0400
X-MC-Unique: qZEkwMbiOyWYnNM7U1gYzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7AD56AB5;
 Mon, 19 Jul 2021 15:02:54 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FD7B60861;
 Mon, 19 Jul 2021 15:02:45 +0000 (UTC)
Date: Mon, 19 Jul 2021 17:02:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 02/10] ACPI ERST: specification for ERST support
Message-ID: <20210719170244.7402e008@redhat.com>
In-Reply-To: <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
 <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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

On Wed, 30 Jun 2021 19:26:39 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Oops, at the end of the 4th paragraph, I meant to state that "Linux does not support the NVRAM mode."
> rather than "non-NVRAM mode", which contradicts everything I stated prior.
> Eric.
> ________________________________
> From: Eric DeVolder <eric.devolder@oracle.com>
> Sent: Wednesday, June 30, 2021 2:07 PM
> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support
> 
> Information on the implementation of the ACPI ERST support.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 docs/specs/acpi_erst.txt
> 
> diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
> new file mode 100644
> index 0000000..79f8eb9
> --- /dev/null
> +++ b/docs/specs/acpi_erst.txt
> @@ -0,0 +1,152 @@
> +ACPI ERST DEVICE
> +================
> +
> +The ACPI ERST device is utilized to support the ACPI Error Record
> +Serialization Table, ERST, functionality. The functionality is
> +designed for storing error records in persistent storage for
> +future reference/debugging.
> +
> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> +(APEI)", and specifically subsection "Error Serialization", outlines
> +a method for storing error records into persistent storage.
> +
> +The format of error records is described in the UEFI specification[2],
> +in Appendix N "Common Platform Error Record".
> +
> +While the ACPI specification allows for an NVRAM "mode" (see
> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
> +directly exposed for direct access by the OS/guest, this implements
> +the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
> +by most BIOS (since flash memory requires programming operations
> +in order to update its contents). Furthermore, as of the time of this
> +writing, Linux does not support the non-NVRAM "mode".

shouldn't it be s/non-NVRAM/NVRAM/ ?

> +
> +
> +Background/Motivation
> +---------------------
> +Linux uses the persistent storage filesystem, pstore, to record
> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> +independent of, and runs before, kdump.  In certain scenarios (ie.
> +hosts/guests with root filesystems on NFS/iSCSI where networking
> +software and/or hardware fails), pstore may contain the only
> +information available for post-mortem debugging.

well,
it's not the only way, one can use existing pvpanic device to notify
mgmt layer about crash and mgmt layer can take appropriate measures
to for post-mortem debugging, including dumping guest state,
which is superior to anything pstore can offer as VM is still exists
and mgmt layer can inspect VMs crashed state directly or dump
necessary parts of it.

So ERST shouldn't be portrayed as the only way here but rather
as limited alternative to pvpanic in regards to post-mortem debugging
(it's the only way only on bare-metal).

It would be better to describe here other use-cases you've mentioned
in earlier reviews, that justify adding alternative to pvpanic.

> +Two common storage backends for the pstore filesystem are ACPI ERST
> +and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
> +all guests. With QEMU supporting ACPI ERST, it becomes a viable
> +pstore storage backend for virtual machines (as it is now for
> +bare metal machines).
> +

> +Enabling support for ACPI ERST facilitates a consistent method to
> +capture kernel panic information in a wide range of guests: from
> +resource-constrained microvms to very large guests, and in
> +particular, in direct-boot environments (which would lack UEFI
> +run-time services).
this hunk probably not necessary

> +
> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
> +crash information, if available.
a pointer to a relevant source would be helpful here.

> +Invocation
s/^^/Configuration|Usage/

> +----------
> +
> +To utilize ACPI ERST, a memory-backend-file object and acpi-erst
s/utilize/use/

> +device must be created, for example:
s/must/can/

> +
> + qemu ...
> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,
> +  size=0x10000,share=on
I'd put ^^^ on the same line as -object and use '\' at the end the 
so example could be easily copy-pasted

> + -device acpi-erst,memdev=erstnvram
> +
> +For proper operation, the ACPI ERST device needs a memory-backend-file
> +object with the following parameters:
> +
> + - id: The id of the memory-backend-file object is used to associate
> +   this memory with the acpi-erst device.
> + - size: The size of the ACPI ERST backing storage. This parameter is
> +   required.
> + - mem-path: The location of the ACPI ERST backing storage file. This
> +   parameter is also required.
> + - share: The share=on parameter is required so that updates to the
> +   ERST back store are written to the file immediately as well. Without
> +   it, updates the the backing file are unpredictable and may not
> +   properly persist (eg. if qemu should crash).

mmap manpage says:
  MAP_SHARED
             Updates to the mapping ... are carried through to the underlying file.
it doesn't guarantee 'written to the file immediately', though.
So I'd rephrase it to something like that:

- share: The share=on parameter is required so that updates to the ERST back store
         are written back to the file.

> +
> +The ACPI ERST device is a simple PCI device, and requires this one
> +parameter:
s/^.*:/and ERST device:/

> +
> + - memdev: Is the object id of the memory-backend-file.
> +
> +
> +PCI Interface
> +-------------
> +
> +The ERST device is a PCI device with two BARs, one for accessing
> +the programming registers, and the other for accessing the
> +record exchange buffer.
> +
> +BAR0 contains the programming interface consisting of just two
> +64-bit registers. The two registers are an ACTION (cmd) and a
> +VALUE (data). All ERST actions/operations/side effects happen
s/consisting of... All ERST/consisting of ACTION and VALUE 64-bit registers. All ERST/

> +on the write to the ACTION, by design. Thus any data needed
s/Thus//

> +by the action must be placed into VALUE prior to writing
> +ACTION. Reading the VALUE simply returns the register contents,
> +which can be updated by a previous ACTION.

> This behavior is
> +encoded in the ACPI ERST table generated by QEMU.
it's too vague, Either drop sentence or add a reference to relevant place in spec.


> +
> +BAR1 contains the record exchange buffer, and the size of this
> +buffer sets the maximum record size. This record exchange
> +buffer size is 8KiB.
s/^^^/
BAR1 contains the 8KiB record exchange buffer, which is the implemented maximum record size limit.


> +Backing File

s/^^^/Backing Storage Format/

> +------------


> +
> +The ACPI ERST persistent storage is contained within a single backing
> +file. The size and location of the backing file is specified upon
> +QEMU startup of the ACPI ERST device.

I'd drop above paragraph and describe file format here,
ultimately used backend doesn't have to be a file. For
example if user doesn't need it persist over QEMU restarts,
ram backend could be used, guest will still be able to see
it's own crash log after guest is reboot, or it could be
memfd backend passed to QEMU by mgmt layer.


> +Records are stored in the backing file in a simple fashion.
s/backing file/backend storage/
ditto for other occurrences

> +The backing file is essentially divided into fixed size
> +"slots", ERST_RECORD_SIZE in length, with each "slot"
> +storing a single record.

> No attempt at optimizing storage
> +through compression, compaction, etc is attempted.
s/^^^//

> +NOTE that any change to this value will make any pre-
> +existing backing files, not of the same ERST_RECORD_SIZE,
> +unusable to the guest.
when that can happen, can we detect it and error out?


> +Below is an example layout of the backing store file.
> +The size of the file is a multiple of ERST_RECORD_SIZE,
> +and contains N number of "slots" to store records. The
> +example below shows two records (in CPER format) in the
> +backing file, while the remaining slots are empty/
> +available.
> +
> + Slot   Record
> +        +--------------------------------------------+
> +    0   | empty/available                            |
> +        +--------------------------------------------+
> +    1   | CPER                                       |
> +        +--------------------------------------------+
> +    2   | CPER                                       |
> +        +--------------------------------------------+
> +  ...   |                                            |
> +        +--------------------------------------------+
> +    N   | empty/available                            |
> +        +--------------------------------------------+
> +        <-------------- ERST_RECORD_SIZE ------------>


> +Not all slots need to be occupied, and they need not be
> +occupied in a contiguous fashion. The ability to clear/erase
> +specific records allows for the formation of unoccupied
> +slots.
I'd drop this as not necessary


> +
> +
> +References
> +----------
> +
> +[1] "Advanced Configuration and Power Interface Specification",
> +    version 4.0, June 2009.
> +
> +[2] "Unified Extensible Firmware Interface Specification",
> +    version 2.1, October 2008.
> +
> --
> 1.8.3.1
> 


